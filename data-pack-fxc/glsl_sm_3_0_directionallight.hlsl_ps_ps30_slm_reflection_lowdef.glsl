//
//
// Shader Model 4
// Fragment Shader
//
// id: 453 - fxc/glsl_SM_3_0_DirectionalLight.hlsl_PS_ps30_slm_reflection_lowdef.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_1_sampler;
uniform sampler2D gbuffer_channel_2_sampler;
uniform sampler2D gbuffer_channel_3_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_environment;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r1.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.xyxx.st, r0.y)).xyzw;
/*3*/	r2.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.xyxx.st, r0.y)).xyzw;
/*4*/	r3.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.xyxx.st, r0.y)).xyzw;
/*5*/	r4.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, r0.y)).yzxw;
/*6*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*7*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*8*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*9*/	r0.z = inversesqrt(r0.z);
/*10*/	r1.xyz = (r0.zzzz * r1.xyzx).xyz;
/*11*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*12*/	r4.w = 1.000000;
/*13*/	r0.x = dot(r4.xyzw, cb0.data[21].xyzw);
/*14*/	r0.y = dot(r4.xyzw, cb0.data[22].xyzw);
/*15*/	r0.z = dot(r4.xyzw, cb0.data[23].xyzw);
/*16*/	r0.w = dot(r4.xyzw, cb0.data[24].xyzw);
/*17*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*18*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*19*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*20*/	r0.w = inversesqrt(r0.w);
/*21*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*22*/	r0.w = -r1.w + 1.000000;
/*23*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*24*/	r4.x = dot(vec3(r0.xyzx), vec3(r1.xyzx));
/*25*/	r4.x = r4.x + r4.x;
/*26*/	r4.xyz = (r1.xyzx * -r4.xxxx + r0.xyzx).xyz;
/*27*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)))).xyz;
/*28*/	r4.w = r0.w * 1.539380;
/*29*/	r4.w = cos((r4.w));
/*30*/	r4.w = inversesqrt(r4.w);
/*31*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*32*/	r5.w = saturate(r2.w * 60.000000);
/*33*/	r5.w = -r2.w + r5.w;
/*34*/	r6.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*35*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*36*/	r6.w = inversesqrt(r6.w);
/*37*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*38*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*39*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*40*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*41*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*42*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*43*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*44*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*45*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*46*/	r6.xyz = (r5.yyyy * r6.xyzx).xyz;
/*47*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*48*/	r5.y = -r2.w + 1.000000;
/*49*/	r6.xyz = (r5.yyyy * r6.xyzx).xyz;
/*50*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*51*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*52*/	  r5.y = dot(vec3(r4.xyzx), vec3(r0.xyzx));
/*53*/	  r5.y = max(r5.y, 0.000000);
/*54*/	  r5.y = log2(r5.y);
/*55*/	  r5.y = r5.y * 10.000000;
/*56*/	  r5.y = exp2(r5.y);
/*57*/	  r5.y = r4.w * r5.y;
/*58*/	  r5.y = r5.y * r5.w + r2.w;
/*59*/	  r6.w = r0.w * 8.000000;
/*60*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r6.w)).xyzw;
/*61*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*62*/	  r6.xyz = (r7.xyzx * r3.xyzx + r6.xyzx).xyz;
/*63*/	}
/*64*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*65*/	r1.y = max(r1.x, 0.000000);
/*66*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*67*/	if(floatBitsToUint(r1.x) != 0u) {
/*68*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*69*/	  r1.x = max(r1.x, -1.000000);
/*70*/	  r1.x = min(r1.x, 1.000000);
/*71*/	  r1.z = -abs(r1.x) + 1.000000;
/*72*/	  r1.z = sqrt(r1.z);
/*73*/	  r4.x = abs(r1.x) * -0.018729 + 0.074261;
/*74*/	  r4.x = r4.x * abs(r1.x) + -0.212114;
/*75*/	  r4.x = r4.x * abs(r1.x) + 1.570729;
/*76*/	  r4.y = r1.z * r4.x;
/*77*/	  r4.y = r4.y * -2.000000 + 3.141593;
/*78*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*79*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r4.y));
/*80*/	  r1.x = r4.x * r1.z + r1.x;
/*81*/	  r1.z = r1.w * r1.w;
/*82*/	    r1.w = (floatBitsToUint(r3.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*83*/	  r1.z = r1.z * r1.w + r5.x;
/*84*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*85*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*86*/	  r1.w = -r1.z * r1.z + 1.000000;
/*87*/	  r1.w = max(r1.w, 0.001000);
/*88*/	  r1.w = log2(r1.w);
/*89*/	  r3.w = r1.w * 4.950617;
/*90*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*91*/	  r4.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*92*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*93*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r4.x) + floatBitsToInt(r1.z));
/*94*/	  r1.z = floatBitsToInt(r1.z);
/*95*/	  r3.w = r1.w * r1.w + -r3.w;
/*96*/	  r3.w = sqrt(r3.w);
/*97*/	  r1.w = -r1.w + r3.w;
/*98*/	  r1.w = max(r1.w, 0.000000);
/*99*/	  r1.w = sqrt(r1.w);
/*100*/	  r1.z = r1.w * r1.z;
/*101*/	  r1.z = r1.z * 1.414214;
/*102*/	  r1.z = 0.008727 / r1.z;
/*103*/	  r1.z = max(r1.z, 0.000100);
/*104*/	  r1.xw = (r1.xxxx + vec4(-0.008727, 0.000000, 0.000000, 0.008727)).xw;
/*105*/	  r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*106*/	  r1.xz = (r1.zzzz * r1.xxwx).xz;
/*107*/	  r4.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*108*/	  r4.xy = (r4.xyxx * r4.xyxx).xy;
/*109*/	  r7.xyzw = r4.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*110*/	  r7.xy = (r7.xzxx / r7.ywyy).xy;
/*111*/	  r4.xy = (-r4.xyxx * r7.xyxx).xy;
/*112*/	  r1.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*113*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*114*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r1.z) + floatBitsToInt(r1.x));
/*115*/	  r1.x = floatBitsToInt(r1.x);
/*116*/	  r4.xy = (r4.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*117*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*118*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*119*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*120*/	  r1.x = r1.x * r4.x + 1.000000;
/*121*/	  r1.x = r1.x * 0.500000;
/*122*/	  r1.z = 1 + ~floatBitsToInt(r1.w);
/*123*/	  r1.z = r1.z * r4.y + 1.000000;
/*124*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*125*/	  r1.z = min(r1.y, 1.000000);
/*126*/	  r0.w = r0.w * 1.570796;
/*127*/	  r0.w = sin(r0.w);
/*128*/	  r1.z = r1.z + -1.000000;
/*129*/	  r0.w = r0.w * r1.z + 1.000000;
/*130*/	  r0.x = dot(vec3(-cb1.data[0].yzwy), vec3(r0.xyzx));
/*131*/	  r0.x = max(r0.x, 0.000000);
/*132*/	  r0.x = log2(r0.x);
/*133*/	  r0.x = r0.x * 10.000000;
/*134*/	  r0.x = exp2(r0.x);
/*135*/	  r0.x = r4.w * r0.x;
/*136*/	  r0.x = r0.x * r5.w + r2.w;
/*137*/	  r0.y = r0.w * abs(r1.x);
/*138*/	  r0.xyz = (r0.xxxx * r0.yyyy).xyz;
/*139*/	} else {
/*140*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*141*/	}
/*142*/	r1.xzw = saturate(r5.zzzz * r0.xxyz).xzw;
/*143*/	r1.xzw = (r3.xxyz * r1.xxzw).xzw;
/*144*/	r0.xyz = (max(r2.wwww, r0.xyzx)).xyz;
/*145*/	r0.xyz = (-r0.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*146*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*147*/	r2.xyz = (r2.xyzx * cb1.data[1].xyzx).xyz;
/*148*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*149*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*150*/	r0.xyz = (r1.xzwx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*151*/	color0.xyz = saturate(r0.xyzx + r6.xyzx).xyz;
/*152*/	color0.w = 1.000000;
/*153*/	return;
}
