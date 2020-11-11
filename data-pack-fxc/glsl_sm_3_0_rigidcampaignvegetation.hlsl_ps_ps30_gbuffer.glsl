//
//
// Shader Model 4
// Fragment Shader
//
// id: 3934 - fxc/glsl_SM_3_0_RigidCampaignVegetation.hlsl_PS_ps30_gbuffer.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_shroud;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.x = vsOut_T0.w;
/*1*/	r0.y = vsOut_T1.w;
/*2*/	r1.xyzw = (texture(s_diffuse_map, r0.xyxx.st)).xyzw;
/*3*/	r0.z = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*4*/	r0.z = inversesqrt(r0.z);
/*5*/	r2.xyz = (r0.zzzz * vsOut_T1.xyzx).xyz;
/*6*/	r0.z = r1.w + -0.500000;
/*7*/	r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r0.z != 0) discard;
/*9*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*10*/	r0.z = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*11*/	r0.z = uintBitsToFloat((r0.z < 100.000000) ? 0xffffffffu : 0x00000000u);
/*12*/	r0.xy = (r0.xyxx * vec4(20.000000, 20.000000, 0.000000, 0.000000)).xy;
/*13*/	r3.xyzw = (texture(s_dissolve_map, r0.xyxx.st)).xyzw;
/*14*/	if(floatBitsToUint(r0.z) != 0u) {
/*15*/	  r0.xyz = (dFdy(vsOut_T0.zxyz)).xyz;
/*16*/	  r3.yzw = (dFdx(vsOut_T0.yyzx)).yzw;
/*17*/	  r4.xyz = (r0.xyzx * r3.yzwy).xyz;
/*18*/	  r0.xyz = (r0.zxyz * r3.zwyz + -r4.xyzx).xyz;
/*19*/	  r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*20*/	  r0.w = inversesqrt(r0.w);
/*21*/	  r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*22*/	  r3.yzw = (-vsOut_T0.xxyz + cb0.data[0].xxyz).yzw;
/*23*/	  r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*24*/	  r0.w = inversesqrt(r0.w);
/*25*/	  r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*26*/	  r0.x = dot(vec3(r0.xyzx), vec3(r3.yzwy));
/*27*/	  r0.x = saturate(r0.x + r0.x);
/*28*/	  r0.x = -r3.x + r0.x;
/*29*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*30*/	  if(r0.x != 0) discard;
/*31*/	}
/*32*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*33*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*34*/	r1.w = 1.000000;
/*35*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*36*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*37*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*38*/	if(floatBitsToUint(r1.y) != 0u) {
/*39*/	  r3.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*40*/	  r4.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*41*/	  r3.xyzw = r3.xyzw / r4.xyzw;
/*42*/	  r4.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*43*/	  r3.xyzw = r3.xyzw * r4.xyzw + cb1.data[4].xyxy;
/*44*/	  r4.xyzw = (textureLod(s_shroud, r3.zwzz.st, r3.w)).xyzw;
/*45*/	  r3.xyzw = r3.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*46*/	  r3.xyzw = saturate(r3.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*47*/	  r5.xyzw = r3.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*48*/	  r3.xyzw = r3.xyzw * r3.xyzw;
/*49*/	  r3.xyzw = r3.xyzw * r5.xyzw;
/*50*/	  r1.y = r4.x * r3.x;
/*51*/	  r1.y = r1.y * r3.y;
/*52*/	  r1.y = r3.z * -r1.y + r1.y;
/*53*/	  r1.y = r3.w * -r1.y + r1.y;
/*54*/	} else {
/*55*/	  r1.y = 1.000000;
/*56*/	}
/*57*/	r1.yz = (r1.yyyy + vec4(0.000000, -0.100000, -0.500000, 0.000000)).yz;
/*58*/	r1.y = saturate(r1.y * 2.500000);
/*59*/	r1.w = r1.y * -2.000000 + 3.000000;
/*60*/	r1.y = r1.y * r1.y;
/*61*/	r1.y = r1.y * r1.w;
/*62*/	r1.z = saturate(r1.z + r1.z);
/*63*/	r1.w = r1.z * -2.000000 + 3.000000;
/*64*/	r1.z = r1.z * r1.z;
/*65*/	r1.z = r1.z * r1.w;
/*66*/	r1.y = r1.y * 0.200000;
/*67*/	r3.xyz = saturate(r0.xyzx * r1.yyyy).xyz;
/*68*/	r0.xyz = (r0.xyzx + -r3.xyzx).xyz;
/*69*/	r0.xyz = (r1.zzzz * r0.xyzx + r3.xyzx).xyz;
/*70*/	color3.x = r0.w / r1.x;
/*71*/	r0.w = max(abs(r2.z), abs(r2.y));
/*72*/	r0.w = max(r0.w, abs(r2.x));
/*73*/	r1.xyz = (r2.xyzx / r0.wwww).xyz;
/*74*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*75*/	color0.w = 0;
/*76*/	r0.xyz = (sqrt(r0.xyzx)).xyz;
/*77*/	color1.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*78*/	color1.w = 0;
/*79*/	color2.xyzw = vec4(0, 0, 0, 0);
/*80*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*81*/	color4 = uint(0);
/*82*/	return;
}
