//
//
// Shader Model 4
// Fragment Shader
//
// id: 1458 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_geom_vtex.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D vtex_page_table_sampler;
uniform sampler2D vtex_diffuse_cache_sampler;
uniform sampler2D vtex_normal_cache_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform cbTerrainVirtualTexture
{
  vec4 data[3];
} cb1;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  color3 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xy = (vsOut_T0.xzxx + -cb1.data[0].xyxx).xy;
/*1*/	r0.x = r0.x * cb1.data[1].w;
/*2*/	r0.z = -r0.y * cb1.data[1].w + 1.000000;
/*3*/	r0.yw = (r0.xxxz * cb1.data[1].yyyy).yw;
/*4*/	r1.xy = (dFdx(r0.ywyy)).xy;
/*5*/	r0.yw = (dFdy(r0.yyyw)).yw;
/*6*/	r0.y = dot(vec2(r0.ywyy), vec2(r0.ywyy));
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.y = max(r0.y, r0.w);
/*9*/	r0.y = log2(r0.y);
/*10*/	r0.y = r0.y * 0.500000;
/*11*/	r0.y = max(r0.y, 0.000000);
/*12*/	r0.w = r0.y + -1.000000;
/*13*/	r0.w = floor(r0.w);
/*14*/	r1.x = r0.w + 1.000000;
/*15*/	r0.w = max(r0.w, 0.000000);
/*16*/	r1.y = exp2(r1.x);
/*17*/	r1.yz = (cb1.data[0].zzwz / r1.yyyy).yz;
/*18*/	r2.xy = (r0.xzxx * r1.yzyy).xy;
/*19*/	r2.xy = floor((r2.xyxx).xy);
/*20*/	r1.yz = (r2.xxyx / r1.yyzy).yz;
/*21*/	r1.xyzw = (textureLod(vtex_page_table_sampler, r1.yzyy.st, r1.x)).xyzw;
/*22*/	r1.xyz = (r1.xyzx * vec4(255.000000, 255.000000, 255.000000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*23*/	r1.xyz = floor((r1.xyzx).xyz);
/*24*/	r1.z = exp2(r1.z);
/*25*/	r1.z = r1.z * cb1.data[1].x;
/*26*/	r1.zw = (r0.xxxz / r1.zzzz).zw;
/*27*/	r1.zw = (fract(r1.zzzw)).zw;
/*28*/	r1.zw = (r1.zzzw * cb1.data[2].zzzz).zw;
/*29*/	r1.xy = (r1.xyxx * cb1.data[2].yyyy + r1.zwzz).xy;
/*30*/	r1.xy = (r1.xyxx + cb1.data[2].wwww).xy;
/*31*/	r1.z = -r1.y + 1.000000;
/*32*/	r2.xyzw = (texture(vtex_diffuse_cache_sampler, r1.xzxx.st)).xyzw;
/*33*/	r1.xyzw = (texture(vtex_normal_cache_sampler, r1.xzxx.st)).xyzw;
/*34*/	r2.w = exp2(r0.w);
/*35*/	r3.xy = (cb1.data[0].zwzz / r2.wwww).xy;
/*36*/	r3.zw = (r0.xxxz * r3.xxxy).zw;
/*37*/	r3.zw = floor((r3.zzzw).zw);
/*38*/	r3.xy = (r3.zwzz / r3.xyxx).xy;
/*39*/	r3.xyzw = (textureLod(vtex_page_table_sampler, r3.xyxx.st, r0.w)).xyzw;
/*40*/	r3.xyz = (r3.xyzx * vec4(255.000000, 255.000000, 255.000000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*41*/	r3.xyz = floor((r3.xyzx).xyz);
/*42*/	r0.w = exp2(r3.z);
/*43*/	r0.w = r0.w * cb1.data[1].x;
/*44*/	r0.xz = (r0.xxzx / r0.wwww).xz;
/*45*/	r0.xyz = (fract(r0.xyzx)).xyz;
/*46*/	r0.xz = (r0.xxzx * cb1.data[2].zzzz).xz;
/*47*/	r0.xz = (r3.xxyx * cb1.data[2].yyyy + r0.xxzx).xz;
/*48*/	r3.xy = (r0.xzxx + cb1.data[2].wwww).xy;
/*49*/	r3.z = -r3.y + 1.000000;
/*50*/	r4.xyzw = (texture(vtex_diffuse_cache_sampler, r3.xzxx.st)).xyzw;
/*51*/	r3.xyzw = (texture(vtex_normal_cache_sampler, r3.xzxx.st)).xyzw;
/*52*/	r0.xzw = (r2.xxyz + -r4.xxyz).xzw;
/*53*/	color0.xyz = (r0.yyyy * r0.xzwx + r4.xyzx).xyz;
/*54*/	color0.w = 1.000000;
/*55*/	r1.xyzw = r1.xyzw + -r3.xyzw;
/*56*/	color1.xyzw = r0.yyyy * r1.xyzw + r3.xyzw;
/*57*/	color2.xyzw = vec4(0, 0, 0, 0);
/*58*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*59*/	r0.w = 1.000000;
/*60*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*61*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*62*/	color3.x = r1.x / r0.x;
/*63*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*64*/	return;
}
