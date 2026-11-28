// nomai_glyph_move (calm version): the window's content is left untouched.
// Only a thin band of cells along its edges flickers into glyphs and burns out
// while it moves, strongest mid-move. Meant for [animation.windows_move].
// Animation shaders only draw inside the window's own rectangle, so the
// glyphs cling to the window rather than staying behind on the desktop.
#define PI 3.14159265
#define TAU 6.2831853
#define CELL 12.0      // glyph cell size in logical px
#define BAND 2.0       // band thickness in cells
#define DENSITY 1.0   // fraction of band cells lit at peak (0..1)

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float seg(vec2 p, vec2 a, vec2 b) {
    vec2 pa = p - a;
    vec2 ba = b - a;
    float h = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
    return length(pa - ba * h);
}

float glyph(vec2 p, float h, float h2) {
    float r = length(p);
    float ang = mod(atan(p.y, p.x) + h * TAU, TAU);
    float span = 2.0 + h2 * 3.6;
    float arc = smoothstep(0.17, 0.10, abs(r - 0.62)) * step(ang, span);
    vec2 dir = vec2(cos(h * TAU + span), sin(h * TAU + span));
    float stem = smoothstep(0.15, 0.08, seg(p, vec2(0.0), dir * 0.62 * (0.4 + 0.6 * h2)));
    float dot_ = smoothstep(0.20, 0.13, length(p - vec2(cos(h * TAU), sin(h * TAU)) * 0.62));
    return clamp(max(max(arc, stem), dot_), 0.0, 1.0);
}

vec4 animation(vec2 uv) {
    float p = umbriel_clamped_progress;
    float k = sin(p * PI);                                 // 0 at rest, 1 mid-move
    vec4 col = umbriel_sample(uv);

    vec2 cp = uv * umbriel_size / CELL;
    vec2 cell = floor(cp);
    vec2 lp = fract(cp) * 2.0 - 1.0;
    float h = hash(cell + umbriel_random_seed.xy * 11.0);
    float h2 = hash(cell + 5.7);

    // distance to the nearest window edge, in px
    float dpx = min(min(uv.x, 1.0 - uv.x) * umbriel_size.x,
                    min(uv.y, 1.0 - uv.y) * umbriel_size.y);
    float band = 1.0 - smoothstep(0.0, BAND * CELL, dpx);

    float on = step(h, k * DENSITY * band);
    float life = fract(umbriel_linear_progress * 1.5 + h2);   // each cell cycles on its own clock
    float fade = (1.0 - life) * smoothstep(0.0, 0.15, life);

    float g = glyph(lp, h2, h) * on * fade;
    vec3 gc = umbriel_palette_at(0.24 * h).rgb;

    return vec4(col.rgb + gc * g, clamp(max(col.a, g), 0.0, 1.0));
}
