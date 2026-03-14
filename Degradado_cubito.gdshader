shader_type canvas_item;

uniform vec4 center_color : source_color = vec4(0.45,0.45,0.45,1);
uniform vec4 edge_color : source_color = vec4(0.0,0.0,0.0,1.0);

void fragment() {
    float dist = distance(UV, vec2(0.5, 0.5));
    COLOR = mix(center_color, edge_color, dist * 2.1);
}