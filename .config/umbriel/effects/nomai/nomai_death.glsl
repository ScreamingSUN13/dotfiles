// nomai_death: the window comes apart into Nomai-style glyphs (arc, stem, dot)
// that light up in the theme palette and burn out, then an eyelid closes over
// whatever is left. Meant for [animation.windows_out].
#define PI 3.14159265
#define TAU 6.2831853
#define CELL 16.0      // glyph cell size in logical px
#define LIT 0.20       // how long a cell takes to turn into a glyph
#define BURN 0.28      // how long a glyph takes to burn out

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float seg(vec2 p, vec2 a, vec2 b) {
    vec2 pa = p - a;
    vec2 ba = b - a;
    float h = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
    return length(pa - ba * h);
}

// p in [-1,1] inside the cell; h and h2 pick the variant
float glyph(vec2 p, float h, float h2) {
    float r = length(p);
    float ang = mod(atan(p.y, p.x) + h * TAU, TAU);
    float span = 2.0 + h2 * 3.6;                       // arc length in radians
    float arc = smoothstep(0.17, 0.10, abs(r - 0.62)) * step(ang, span);
    vec2 dir = vec2(cos(h * TAU + span), sin(h * TAU + span));
    float stem = smoothstep(0.15, 0.08, seg(p, vec2(0.0), dir * 0.62 * (0.4 + 0.6 * h2)));
    float dot_ = smoothstep(0.20, 0.13, length(p - vec2(cos(h * TAU), sin(h * TAU)) * 0.62));
    return clamp(max(max(arc, stem), dot_), 0.0, 1.0);
}

vec4 animation(vec2 uv) {
    float p = umbriel_clamped_progress;
    // 0 = intact, 1 = gone. If the close plays backwards, change this to: float t = p;
    float t = umbriel_direction > 0.0 ? 1.0 - p : p;

    vec4 col = umbriel_sample(uv);

    vec2 cp = uv * umbriel_size / CELL;
    vec2 cell = floor(cp);
    vec2 lp = fract(cp) * 2.0 - 1.0;
    float h = hash(cell + umbriel_random_seed.xy * 13.0);
    float h2 = hash(cell + 7.1);
    float h3 = hash(cell + 3.3);

    float rad = length(uv - 0.5) * 1.414;                  // 0 center .. 1 corner
    float ts = 0.06 + 0.50 * (0.55 * h3 + 0.45 * rad);     // when this cell starts turning
    float x = clamp((t - ts) / LIT, 0.0, 1.0);             // window -> glyph
    float burn = clamp((t - ts - LIT) / BURN, 0.0, 1.0);   // glyph -> nothing

    float g = glyph(lp, h, h2);
    vec3 gc = umbriel_palette_at(0.24 * h2).rgb;
    float flick = 0.75 + 0.25 * sin(t * 40.0 + h * TAU);

    vec3 rgb = col.rgb * (1.0 - x) * (1.0 - g * x) + gc * g * x * flick * 1.2;
    float al = col.a * (1.0 - x) * (1.0 - g * x) + g * x * flick;
    float keep = 1.0 - burn;
    rgb *= keep;
    al *= keep;

    // eyelid: top and bottom close toward the middle at the very end
    float lid = smoothstep(0.78, 1.0, t);
    float open = (1.0 - lid) - abs(uv.y - 0.5) * 2.0;
    float lm = smoothstep(0.0, 0.06, open);
    return vec4(rgb * lm, clamp(al * lm, 0.0, 1.0));
}
