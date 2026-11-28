// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Barrulus
//
// Adapted for Umbriel workspace reveal (style = "reveal"): the original per-window
// echo/seal shader reworked to crossfade two full-output scenes. Unused helpers
// (hash, noise, grain, line, edge) were dropped, and the colours can follow the
// Noctalia palette.

#define USE_PALETTE 1              // 1 = Noctalia palette, 0 = original cyan/green/brass
#define SHIFT vec2(-14.0, 4.0)     // echo offset per ghost, in logical px
#define TWIST 0.006                // echo rotation per ghost, in radians
#define SEAL_SIZE 0.32             // seal radius as a fraction of the short screen side

const vec3 CYAN = vec3(0.08, 0.80, 1.0);
const vec3 BRASS = vec3(0.72, 0.49, 0.22);
const float PI = 3.14159265;

float stroke(float d, float w) {
    return 1.0 - smoothstep(w, w + 0.8 / max(umbriel_scale, 0.5), d);
}

vec4 paint(vec4 s, vec3 c, float a) {
    return vec4(mix(s.rgb, c * s.a, clamp(a, 0.0, 1.0)), s.a);
}

// Etched broken concentric rings, radial ticks and an inner diamond.
float seal(vec2 q, float radius) {
    float r = length(q), a = atan(q.y, q.x);
    float ring = stroke(abs(r - radius), 0.8) * step(-0.7, sin(a * 3.0 + 0.4));
    ring = max(ring, stroke(abs(r - radius * 0.78), 0.55) * step(0.1, cos(a * 5.0)));
    float tick = stroke(abs(sin(a * 12.0)) * r, 0.65) * step(radius * 0.87, r) * (1.0 - step(radius * 1.10, r));
    float diamond = stroke(abs(abs(q.x) + abs(q.y) - radius * 0.72) * 0.707, 0.65);
    return max(max(ring, tick), diamond);
}

vec3 ghostColor(float k) {
#if USE_PALETTE
    return mix(umbriel_palette_at(0.25).rgb, umbriel_palette_at(0.0).rgb, k);
#else
    return mix(CYAN, vec3(0.27, 0.90, 0.59), k);
#endif
}

vec3 sealColor() {
#if USE_PALETTE
    return umbriel_palette_at(0.0).rgb;
#else
    return BRASS;
#endif
}

vec4 animation(vec2 uv) {
    float t = umbriel_clamped_progress;
    if (t <= 0.0) return umbriel_sample(uv);
    if (t >= 1.0) return umbriel_sample_incoming(uv);

    float pulse = sin(t * PI);
    float release = pulse * pulse;
    float fade = smoothstep(0.25, 0.75, t);       // outgoing -> incoming

    vec2 size = umbriel_size;
    vec2 q = uv * size - size * 0.5;
    vec4 s = mix(umbriel_sample(uv), umbriel_sample_incoming(uv), fade);

    // three spatial echoes of whichever scene is currently showing
    for (int i = 1; i <= 3; i++) {
        float k = float(i);
        float a = TWIST * pulse * k;
        vec2 ghost = mat2(cos(a), -sin(a), sin(a), cos(a)) * q + size * 0.5 + SHIFT * k * pulse;
        vec2 guv = clamp(ghost / size, 0.0, 1.0);
        vec4 echo = mix(umbriel_sample(guv), umbriel_sample_incoming(guv), fade);
        float outlines = abs(echo.a - s.a) + length(echo.rgb - s.rgb) * 0.5;
        s = paint(s, ghostColor(k / 3.0), clamp(outlines, 0.0, 1.0) * release * 0.30 / k);
    }

    float radius = min(size.x, size.y) * SEAL_SIZE;
    float clock = seal(q, radius) * (1.0 - smoothstep(0.35, 0.8, t)) * pulse;
    return paint(s, sealColor(), clock * 0.25);
}
