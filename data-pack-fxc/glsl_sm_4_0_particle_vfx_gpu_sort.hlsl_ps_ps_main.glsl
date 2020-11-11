//
//
// Shader Model 4
// Fragment Shader
//
// id: 6 - fxc/glsl_SM_4_0_particle_vfx_gpu_sort.hlsl_PS_ps_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D g_tex_packeddata;

layout(std140) uniform cb_vfx_bitonicsort
{
  vec4 data[3];
} cb0;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = uintBitsToFloat(uint(cb0.data[0].x));
/*1*/	r1.x = intBitsToFloat(floatBitsToInt(r0.x) << int(2));
/*2*/	r1.y = intBitsToFloat(floatBitsToInt(r0.x) << int(1));
/*3*/	r0.xy = (floatBitsToUint(r1.xyxx)).xy;
/*4*/	r0.zw = (gl_FragCoord.xxxy + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*5*/	r0.z = r0.w * cb0.data[1].x + r0.z;
/*6*/	r0.w = r0.x * r0.z;
/*7*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*8*/	r0.x = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.x : -r0.x;
/*9*/	r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.x)).w;
/*10*/	r0.w = r0.w * r0.z;
/*11*/	r0.w = fract(r0.w);
/*12*/	r0.x = r0.w * r0.x;
/*13*/	r0.x = uintBitsToFloat((r0.x >= r0.y) ? 0xffffffffu : 0x00000000u);
/*14*/	r0.y = cb0.data[0].y + cb0.data[0].y;
/*15*/	r0.w = r0.y * r0.z;
/*16*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*17*/	r0.y = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.y : -r0.y;
/*18*/	r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).w;
/*19*/	r0.z = r0.w * r0.z;
/*20*/	r0.z = fract(r0.z);
/*21*/	r0.y = r0.z * r0.y;
/*22*/	r0.y = uintBitsToFloat((r0.y >= cb0.data[0].y) ? 0xffffffffu : 0x00000000u);
/*23*/	r0.xy = (mix(vec4(1.000000, 1.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r0.xyxx), uvec4(0)))).xy;
/*24*/	r0.zw = (cb0.data[0].zzzw * r0.yyyy + gl_FragCoord.xxxy).zw;
/*25*/	r1.xy = (intBitsToFloat(ivec4(r0.zwzz))).xy;
/*26*/	r1.zw = (vec4(0, 0, 0, 0)).zw;
/*27*/	r1.xyzw = texelFetch(g_tex_packeddata, floatBitsToInt(r1.xyzw).st, floatBitsToInt(r1.xyzw).a).xyzw;
/*28*/	r0.z = r0.x * r1.x;
/*29*/	r0.z = r0.y * r0.z;
/*30*/	r2.xy = (intBitsToFloat(ivec4(gl_FragCoord.xyxx))).xy;
/*31*/	r2.zw = (vec4(0, 0, 0, 0)).zw;
/*32*/	r2.xyzw = texelFetch(g_tex_packeddata, floatBitsToInt(r2.xyzw).st, floatBitsToInt(r2.xyzw).a).xyzw;
/*33*/	r0.x = r0.x * r2.x;
/*34*/	r0.x = r0.y * r0.x;
/*35*/	r0.xz = (r0.xxzx * cb0.data[1].yyyy).xz;
/*36*/	r0.x = uintBitsToFloat((r0.z >= r0.x) ? 0xffffffffu : 0x00000000u);
/*37*/	color0.xy = (mix(r1.xyxx, r2.xyxx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xy;
/*38*/	color0.zw = (vec4(0, 0, 0, 0)).zw;
/*39*/	return;
}
