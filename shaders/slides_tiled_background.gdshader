shader_type canvas_item;

uniform float texture_scale = 2.5;
uniform vec2 scroll_speed = vec2(-0.025, 0.025);

void fragment() {
	vec2 scaled_uv = UV * texture_scale;
	vec2 shifted_uv = scaled_uv + TIME * scroll_speed;
	COLOR = texture(TEXTURE, shifted_uv);
}
