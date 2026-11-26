// Burn open/close, ported from niri. GLSL ES 1.00, no #version/main/precision.
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(hash(i), hash(i + vec2(1.0, 0.0)), f.x),
               mix(hash(i + vec2(0.0, 1.0)), hash(i + vec2(1.0, 1.0)), f.x), f.y);
}

vec4 animation(vec2 uv) {
    vec4 color = umbriel_sample(uv);

    float progress = umbriel_clamped_progress;
    float edge_dist = min(min(uv.x, 1.0 - uv.x), min(uv.y, 1.0 - uv.y));
    float n = noise(uv * 8.0 + umbriel_random_seed.x * 100.0) * 0.3;
    float burn_line = edge_dist + n;
    float threshold = progress * 0.9;   // 0.8 matches the niri version exactly

    vec3 ember_inner = vec3(1.0, 0.3, 0.0);
    vec3 ember_outer = vec3(1.0, 0.8, 0.2);

    // Output is premultiplied, so unpremultiply before mixing in the ember.
    vec3 straight = color.rgb / max(color.a, 0.0001);

    if (umbriel_direction > 0.0) {
        // Opening: edges burn in first, the front moves toward the center.
        if (burn_line < threshold - 0.08) {
            return color;
        } else if (burn_line < threshold) {
            vec3 ember = mix(ember_inner, ember_outer, (burn_line - threshold + 0.08) / 0.08);
            return vec4(mix(ember, straight, 0.3) * color.a, color.a);
        }
        return vec4(0.0);
    } else {
        // Closing: edges burn away first.
        if (burn_line > threshold + 0.08) {
            return color;
        } else if (burn_line > threshold) {
            vec3 ember = mix(ember_inner, ember_outer, 1.0 - (burn_line - threshold) / 0.08);
            return vec4(mix(ember, straight, 0.3) * color.a, color.a);
        }
        return vec4(0.0);
    }
}
