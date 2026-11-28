// nomai_twins: two comets chase each other around the focused window's border,
// like the Ash Twin and Ember Twin. Head colours come from the Noctalia palette.
//
// Optimised: the program runs over the whole border rectangle, including the
// big empty window area, so pixels with no border return before doing any work.
// Comet tails are finite, which lets most ring pixels skip the palette lookups.
// Pair with [effects] max_fps to cap how often it redraws.
#define PI 3.14159265
#define TAU 6.2831853
#define TAIL 1.5       // comet tail length in radians
#define SPEED 0.7      // revolutions speed (radians per second)
#define BASE 0.2       // brightness of the base ring (1.0 = exact border colour)

vec4 border(vec2 uv) {
    vec4 base = umbriel_sample(uv);               // the native border ring
    if (base.a < 0.004) return vec4(0.0);         // nothing here: skip all the work

    vec2 c = uv - 0.5;
    c.x *= umbriel_size.x / umbriel_size.y;
    float a = atan(c.y, c.x);

    float d1 = mod(umbriel_time * SPEED - a, TAU);  // distance behind comet 1
    float d2 = mod(d1 + PI, TAU);                   // comet 2 sits opposite
    float c1 = max(1.0 - d1 * (1.0 / TAIL), 0.0);
    float c2 = max(1.0 - d2 * (1.0 / TAIL), 0.0);
    c1 *= c1 * min(d1 * 25.0, 1.0);                 // sharp head, fading tail
    c2 *= c2 * min(d2 * 25.0, 1.0);

    vec3 glow = vec3(0.0);
    if (c1 > 0.0) glow += umbriel_palette_at(0.0).rgb * c1;
    if (c2 > 0.0) glow += umbriel_palette_at(0.25).rgb * c2;

    // base ring keeps the exact border colour (set via [colors.border] focused)
    return vec4(base.rgb * BASE + glow * base.a * 1.4, base.a);
}
