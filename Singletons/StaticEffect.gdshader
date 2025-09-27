shader_type canvas_item;

uniform sampler2D Noise;
uniform float Transparency = 4.0;
uniform float Slow = 25.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV) * texture(Noise, texture(Noise, UV).xy + cos(TIME) / Slow) / Transparency;
}
