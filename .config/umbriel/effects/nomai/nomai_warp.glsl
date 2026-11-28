// nomai_warp: the window winds open through a spiral aperture, like a
// warp-tower core spinning up. Closing winds it shut again.
// Glow colour comes from the Noctalia palette (primary -> secondary).
#define PI 3.14159265
#define ARMS 2.0       // spiral arms
#define WIND 1.6       // how tightly the arms wind with radius
#define EDGE 0.06      // width of the glowing rim
#define SWIRL 1.6      // how much the window twists while it is forming

vec4 animation(vec2 uv) {
    float p = umbriel_clamped_progress;
    // 0 = hidden, 1 = fully shown. If closing looks backwards, change this to: float vis = p;
    float vis = umbriel_direction > 0.0 ? p : 1.0 - p;

    float aspect = umbriel_size.x / umbriel_size.y;
    vec2 c = uv - 0.5;
    c.x *= aspect;
    float rmax = 0.5 * length(vec2(aspect, 1.0));
    float r = length(c) / rmax;                 // 0 center .. 1 corner
    float a = atan(c.y, c.x);

    // spiral-warped radial field; the aperture is where f < threshold
    float spin = (1.0 - vis) * PI * 2.0;
    float wave = 0.5 + 0.5 * sin(ARMS * a - r * WIND * 2.0 * PI + spin);
    float f = r + 0.14 * wave;
    float thr = vis * 1.25;
    float e = thr - f;                          // >0 inside the aperture

    // twist the window's own content while it forms
    float sw = (1.0 - vis) * (1.2 - r) * SWIRL;
    vec2 q = vec2(c.x * cos(sw) - c.y * sin(sw), c.x * sin(sw) + c.y * cos(sw));
    q.x /= aspect;
    q += 0.5;
    float inside = step(0.0, q.x) * step(q.x, 1.0) * step(0.0, q.y) * step(q.y, 1.0);
    vec4 col = umbriel_sample(clamp(q, 0.0, 1.0)) * inside;

    float mask = smoothstep(0.0, 0.015, e);
    float rim = smoothstep(0.0, 0.012, e) * (1.0 - smoothstep(0.012, EDGE, e));
    float halo = exp(-max(-e, 0.0) * 28.0) * (1.0 - smoothstep(0.85, 1.0, vis));

    vec3 glowc = umbriel_palette_at(0.02 + 0.22 * wave).rgb;
    float g = clamp(rim * 1.4 + halo * 0.5, 0.0, 1.0) * smoothstep(0.0, 0.05, vis);

    vec3 rgb = col.rgb * mask + glowc * g;
    float al = clamp(col.a * mask + g, 0.0, 1.0);
    return vec4(rgb, al);
}
