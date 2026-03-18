shader_type spatial;

render_mode unshaded;

uniform vec4 center_color : source_color = vec4(0.45, 0.45, 0.45, 1.0);
uniform vec4 edge_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);

void fragment() {
    vec2 uv = UV;
    float dist = distance(uv, vec2(0.5));
    float t = clamp(dist * 2.0, 0.0, 1.0);

    ALBEDO = mix(center_color.rgb, edge_color.rgb, t);
}