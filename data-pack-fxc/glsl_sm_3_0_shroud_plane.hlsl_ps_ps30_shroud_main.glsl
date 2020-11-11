//
//
// Shader Model 4
// Fragment Shader
//
// id: 232 - fxc/glsl_SM_3_0_shroud_plane.hlsl_PS_ps30_shroud_main.glsl
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

uniform sampler2D s_shroud_cloud;
uniform sampler2D s_shroud;
uniform samplerCube s_sky;
uniform sampler2D t_readable_depth_texture;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xy = (vsOut_T0.xzxx + -cb3.data[1].xyxx).xy;
/*1*/	r0.zw = (-cb3.data[1].xxxy + cb3.data[1].zzzw).zw;
/*2*/	r0.xy = (r0.xyxx / r0.zwzz).xy;
/*3*/	r1.xyzw = r0.xxyy + vec4(-0.020000, -0.980000, -0.020000, -0.980000);
/*4*/	r1.xyzw = saturate(r1.xyzw * vec4(-50.000000, 50.000050, -50.000000, 50.000050));
/*5*/	r2.xyzw = r1.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*6*/	r1.xyzw = r1.xyzw * r1.xyzw;
/*7*/	r1.xyzw = r1.xyzw * r2.xyzw;
/*8*/	r0.zw = (uintBitsToFloat(uvec4(lessThan(r0.xxxy, vec4(0.000000, 0.000000, 0.020000, 0.020000))) * 0xffffffffu)).zw;
/*9*/	r1.xy = (mix(r1.ywyy, r1.xzxx, greaterThan(floatBitsToUint(r0.zwzz), uvec4(0)))).xy;
/*10*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.w) | floatBitsToUint(r0.z));
/*11*/	r0.w = r1.y + r1.x;
/*12*/	r0.w = min(r0.w, 1.000000);
/*13*/	r1.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.980000, 0.980000, 0.000000, 0.000000), r0.xyxx)) * 0xffffffffu)).xy;
/*14*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.z) | floatBitsToUint(r1.x));
/*15*/	r0.z = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r0.z));
/*16*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.z));
/*17*/	r1.xy = (-cb3.data[4].xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.xy = (r0.xyxx * r1.xyxx + cb3.data[4].xyxx).xy;
/*19*/	r1.xyzw = (textureLod(s_shroud, r0.xyxx.st, r0.y)).xyzw;
/*20*/	r0.x = -r1.x + 1.000000;
/*21*/	r0.x = log2(r0.x);
/*22*/	r0.x = r0.x * 6.400000;
/*23*/	r0.x = exp2(r0.x);
/*24*/	r1.xy = (intBitsToFloat(ivec4(gl_FragCoord.xyxx))).xy;
/*25*/	r1.zw = (vec4(0, 0, 0, 0)).zw;
/*26*/	r1.xyzw = texelFetch(t_readable_depth_texture, floatBitsToInt(r1.xyzw).st, floatBitsToInt(r1.xyzw).a).xyzw;
/*27*/	r1.z = r1.x;
/*28*/	r0.yw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).yw;
/*29*/	r0.yw = (r0.yyyw * cb0.data[27].zzzw).yw;
/*30*/	r1.xy = (r0.ywyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*31*/	r1.w = 1.000000;
/*32*/	r2.x = dot(r1.xyzw, cb0.data[21].xyzw);
/*33*/	r2.y = dot(r1.xyzw, cb0.data[22].xyzw);
/*34*/	r2.z = dot(r1.xyzw, cb0.data[23].xyzw);
/*35*/	r0.y = dot(r1.xyzw, cb0.data[24].xyzw);
/*36*/	r1.xyz = (r2.xyzx / r0.yyyy).xyz;
/*37*/	r1.xyz = (r1.xyzx + -vsOut_T0.xyzx).xyz;
/*38*/	r0.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*39*/	r0.y = sqrt(r0.y);
/*40*/	r0.y = min(r0.y, 1.000000);
/*41*/	r0.y = log2(r0.y);
/*42*/	r0.y = r0.y * 1.350000;
/*43*/	r0.y = exp2(r0.y);
/*44*/	r0.x = dot(vec2(r0.xxxx), vec2(r0.yyyy));
/*45*/	r0.y = -r0.x + 1.000000;
/*46*/	r0.x = r0.z * r0.y + r0.x;
/*47*/	r0.y = r0.x + -0.003922;
/*48*/	color0.w = r0.x;
/*49*/	r0.x = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*50*/	if(r0.x != 0) discard;
/*51*/	r0.xyzw = vsOut_T0.xzxz * vec4(0.040000, 0.040000, 0.026000, 0.026000);
/*52*/	r0.xyzw = cb0.data[26].xxxx * vec4(-0.015625, 0.001875, -0.012500, 0.001500) + r0.xyzw;
/*53*/	r1.xyzw = (texture(s_shroud_cloud, r0.xyxx.st)).xyzw;
/*54*/	r0.xyzw = (texture(s_shroud_cloud, r0.zwzz.st)).xyzw;
/*55*/	r0.xyz = (r0.yxwy + r1.zxwz).xyz;
/*56*/	r1.xyzw = vsOut_T0.xzxz * vec4(0.013333, 0.013333, 0.008667, 0.008667);
/*57*/	r1.xyzw = cb0.data[26].xxxx * vec4(-0.011500, 0.005000, -0.013225, 0.005750) + r1.xyzw;
/*58*/	r2.xyzw = (texture(s_shroud_cloud, r1.xyxx.st)).xyzw;
/*59*/	r1.xyzw = (texture(s_shroud_cloud, r1.zwzz.st)).xyzw;
/*60*/	r0.xyz = (r0.xyzx + r2.zywz).xyz;
/*61*/	r0.xyz = (r1.yywy + r0.xyzx).xyz;
/*62*/	r0.xyz = (r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*63*/	r0.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r0.y = max(-cb1.data[0].z, 0.000000);
/*65*/	r0.x = r0.y * r0.x;
/*66*/	r0.xyz = (r0.xxxx * cb1.data[1].xyzx).xyz;
/*67*/	r0.w = -vsOut_T0.y + cb2.data[1].w;
/*68*/	r0.w = r0.w + -cb2.data[1].z;
/*69*/	r1.x = -cb2.data[1].z + cb2.data[1].w;
/*70*/	r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.x)).x;
/*71*/	r0.w = saturate(r0.w * r1.x);
/*72*/	r1.x = r0.w * -2.000000 + 3.000000;
/*73*/	r0.w = r0.w * r0.w;
/*74*/	r0.w = r0.w * r1.x;
/*75*/	r1.x = saturate(cb2.data[0].w)/**/;
/*76*/	r1.x = -r1.x + 1.000000;
/*77*/	r1.x = r1.x * 8.000000 + -4.000000;
/*78*/	r1.y = saturate(cb2.data[1].x)/**/;
/*79*/	r1.y = -r1.y + 1.000000;
/*80*/	r1.y = r1.y * 1000.000000;
/*81*/	r2.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*82*/	r1.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*83*/	r1.z = sqrt(r1.z);
/*84*/	r1.y = r1.z / r1.y;
/*85*/	r1.x = r1.y + r1.x;
/*86*/	r1.x = r1.x * 1.442695;
/*87*/	r1.x = exp2(r1.x);
/*88*/	r1.x = cb2.data[1].y / r1.x;
/*89*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*90*/	r0.w = cb2.data[2].x * r0.w + r1.x;
/*91*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*92*/	r2.w = max(r2.y, 0.000000);
/*93*/	r3.xyzw = (texture(s_sky, r2.xwzx.stp)).xyzw;
/*94*/	r1.y = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*95*/	r1.y = sqrt(r1.y);
/*96*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*97*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*98*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*99*/	r1.z = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*100*/	r1.z = (floatBitsToUint(r1.z) > 0x00000000u) ? 0.004000 : 1.000000;
/*101*/	r3.xyz = (-r2.xyzx * r1.zzzz + r3.xyzx).xyz;
/*102*/	r2.xyz = (r1.zzzz * r2.xyzx).xyz;
/*103*/	r2.xyz = (r1.xxxx * r3.xyzx + r2.xyzx).xyz;
/*104*/	r2.xyz = (-r0.xyzx * r1.zzzz + r2.xyzx).xyz;
/*105*/	r0.xyz = (r0.xyzx * r1.zzzz).xyz;
/*106*/	r1.x = max(cb2.data[2].z, 0.001000);
/*107*/	r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.x)).x;
/*108*/	r1.x = r1.x * r1.y;
/*109*/	r1.x = min(r1.x, 1.000000);
/*110*/	r1.y = r1.x * -2.000000 + 3.000000;
/*111*/	r1.x = r1.x * r1.x;
/*112*/	r1.x = r1.x * r1.y;
/*113*/	r0.w = saturate(r0.w * r1.x);
/*114*/	color0.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*115*/	return;
}
