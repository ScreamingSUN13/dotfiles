// nomai_rewind: a time-loop rewind glitch. A tracking band sweeps up the window
// while it moves; RGB channels split and scanlines jitter sideways, strongest at
// the band and mid-move. Meant for [animation.windows_move].
#define PI 3.14159265
#define SPLIT 5.0      // max RGB split in px
#define JITTER 14.0    // max scanline jitter in px
#define ROW 3.0        // scanline height in px
#define RATE 24.0      // how many times per move the jitter reshuffles

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec4 animation(vec2 uv) {
    float p = umbriel_clamped_progress;
    float k = sin(p * PI);                                   // 0 at rest, 1 mid-move

    float bandY = 1.0 - p;                                   // tracking band rises as the move proceeds
    float d = (uv.y - bandY) / 0.05;
    float band = exp(-d * d);

    float stepT = floor(umbriel_linear_progress * RATE);
    float row = floor(uv.y * umbriel_size.y / ROW);
    float rh = hash(vec2(row, stepT));
    float jit = (rh - 0.5) * 2.0 * JITTER * step(0.82, rh) * k * (0.3 + band);

    float sp = SPLIT * k * (0.4 + band);
    vec2 base = uv + vec2(jit / umbriel_size.x, 0.0);
    vec2 off = vec2(sp / umbriel_size.x, 0.0);

    vec4 sr = umbriel_sample(clamp(base + off, 0.0, 1.0));
    vec4 sg = umbriel_sample(clamp(base, 0.0, 1.0));
    vec4 sb = umbriel_sample(clamp(base - off, 0.0, 1.0));

    float inside = step(0.0, base.x) * step(base.x, 1.0);
    vec3 rgb = vec3(sr.r, sg.g, sb.b);
    float al = max(sr.a, max(sg.a, sb.a));

    float lines = 1.0 - 0.10 * k * (0.5 + 0.5 * sin(uv.y * umbriel_size.y * PI / ROW * 2.0));
    rgb = rgb * lines + vec3(0.12) * band * k * al;          // faint bright tracking band
    return vec4(rgb, al) * inside;
}
