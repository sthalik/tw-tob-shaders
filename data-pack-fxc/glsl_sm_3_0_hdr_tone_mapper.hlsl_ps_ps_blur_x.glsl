//
//
// Shader Model 4
// Fragment Shader
//
// id: 3873 - fxc/glsl_SM_3_0_hdr_tone_mapper.hlsl_PS_ps_blur_x.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D g_hdr_rgb_texture_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform render_target_dims_buffer
{
  vec4 data[1];
} cb1;

void main()
{
  const vec4 c[11] = vec4[11](
    vec4(0.01250000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.02500000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.05000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.10000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.20000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.40000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.20000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.10000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.05000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.02500000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.01250000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000)
  );
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.y = 0;
/*1*/	r1.xyzw = vec4(0, 0, 0, 0);
/*2*/	r0.z = 0;
/*3*/	while(true) {
/*4*/	  r0.w = uintBitsToFloat((floatBitsToInt(r0.z) >= int(11)) ? 0xffffffffu : 0x00000000u);
/*5*/	  if(r0.w != 0) break;
/*6*/	  r0.w = floatBitsToInt(r0.z);
/*7*/	  r0.x = r0.w + -5.000000;
/*8*/	  r0.xw = (-r0.xxxy + gl_FragCoord.xxxy).xw;
/*9*/	  r0.xw = (r0.xxxw + cb0.data[28].xxxx).xw;
/*10*/	  r0.xw = (r0.xxxw * cb1.data[0].xxxy).xw;
/*11*/	  r2.xyzw = (textureLod(g_hdr_rgb_texture_sampler, r0.xwxx.st, 0.000000)).xyzw;
/*12*/	  r1.xyzw = r2.xyzw * c[uint(floatBitsToInt(r0.z))].xxxx + r1.xyzw;
/*13*/	  r0.z = intBitsToFloat(floatBitsToInt(r0.z) + int(1));
/*14*/	}
/*15*/	color0.xyzw = r1.xyzw;
/*16*/	return;
}
