// nomai_scan: a Nomai-projection style materialise. A scan bar sweeps down the
// window; behind it the window resolves out of a coarse, flickering pixel grid.
// Closing runs the sweep back up and dissolves it into the grid.
#define BAND 0.14      // height of the resolving band (fraction of window)
#define CELL 7.0       // pixel-grid cell size in logical px

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec4 animation(vec2 uv) {
    float p = umbriel_clamped_progress;
    // 0 = hidden, 1 = fully shown. If closing looks backwards, change this to: float vis = p;
    float vis = umbriel_direction > 0.0 ? p : 1.0 - p;

    float front = vis * (1.0 + BAND + 0.04) - 0.02;   // scan bar position (0 top .. 1 bottom)
    float k = clamp((front - uv.y) / BAND, 0.0, 1.0); // 0 at the bar, 1 once fully resolved

    vec2 cell = floor(uv * umbriel_size / CELL);
    float h = hash(cell + umbriel_random_seed.xy * 17.0);
    float flick = hash(cell + floor(umbriel_linear_progress * 24.0));

    // pixelate while resolving
    vec2 cuv = (cell + 0.5) * CELL / umbriel_size;
    vec2 suv = k < 1.0 ? mix(clamp(cuv, 0.0, 1.0), uv, k * k) : uv;
    vec4 col = umbriel_sample(suv);

    // cells pop in at random behind the bar; some flicker back out
    float on = step(h, k * 1.25);
    on *= (k < 0.6) ? step(0.18, flick) : 1.0;
    float shown = (uv.y < front) ? on : 0.0;

    // scan bar
    float dpx = abs(uv.y - front) * umbriel_size.y;
    float bar = exp(-dpx * 0.35) * smoothstep(0.0, 0.03, vis) * (1.0 - smoothstep(0.97, 1.0, vis));
    vec3 barc = umbriel_palette_at(0.25).rgb;

    // faint horizontal projection lines while resolving
    float lines = 1.0 - (1.0 - k) * 0.35 * (0.5 + 0.5 * sin(uv.y * umbriel_size.y * 1.5));

    vec3 rgb = col.rgb * shown * lines + barc * bar;
    float al = clamp(col.a * shown + bar, 0.0, 1.0);
    return vec4(rgb, al);
}
