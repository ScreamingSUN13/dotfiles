// nomai_quantum: a short quantum-moon stutter mid-move. For the middle stretch
// of the move the window breaks into coarse blocks that jump sideways and blink
// out for a frame or two, then it snaps back whole. Start and end are untouched.
// Meant for [animation.windows_move].
#define BLOCK 28.0     // block size in logical px
#define SHIFT 18.0     // max sideways jump in px
#define BLINK 0.22     // fraction of blocks that blink out at the peak
#define RATE 16.0      // how many times per move the pattern reshuffles

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec4 animation(vec2 uv) {
    float p = umbriel_clamped_progress;
    // envelope: 0 outside the middle, 1 at p = 0.5
    float a = smoothstep(0.32, 0.48, p) * (1.0 - smoothstep(0.52, 0.68, p));

    float stepT = floor(umbriel_linear_progress * RATE);
    vec2 cell = floor(uv * umbriel_size / BLOCK);
    float h = hash(cell + stepT * 1.7);
    float h2 = hash(cell + stepT * 3.1 + 9.0);

    float gate = step(0.45, h) * a;                      // roughly half the blocks move
    float dx = (h2 - 0.5) * 2.0 * SHIFT * gate;
    vec2 suv = uv + vec2(dx / umbriel_size.x, 0.0);
    float inside = step(0.0, suv.x) * step(suv.x, 1.0);
    vec4 col = umbriel_sample(clamp(suv, 0.0, 1.0)) * inside;

    float blink = step(1.0 - BLINK * a, hash(cell + stepT * 5.3 + 2.0));
    return col * (1.0 - blink);
}
