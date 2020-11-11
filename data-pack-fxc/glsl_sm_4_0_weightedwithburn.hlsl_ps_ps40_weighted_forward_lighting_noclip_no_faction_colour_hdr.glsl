//
//
// Shader Model 4
// Fragment Shader
//
// id: 2667 - fxc/glsl_SM_4_0_weightedwithburn.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_fire_map;
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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r0.w = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*11*/	r4.x = r2.z;
/*12*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*13*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*14*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*15*/	r1.w = saturate(r4.x * 5.000000);
/*16*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*17*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*18*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*19*/	r2.z = log2(r5.z);
/*20*/	r2.z = r2.z * 1.800000;
/*21*/	r2.z = exp2(r2.z);
/*22*/	r2.z = r2.z * 10.000000;
/*23*/	r2.z = min(r2.z, 1.000000);
/*24*/	r1.w = r1.w + r2.z;
/*25*/	r1.w = r1.w * 0.500000;
/*26*/	r2.z = -r5.w + 1.000000;
/*27*/	r2.z = log2(r2.z);
/*28*/	r2.z = r2.z * vsOut_T7.z;
/*29*/	r2.z = exp2(r2.z);
/*30*/	r2.z = min(r2.z, 1.000000);
/*31*/	r2.z = r2.z * vsOut_T7.z;
/*32*/	r2.w = r5.z * 0.250000;
/*33*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*34*/	r4.xyz = (r1.wwww * r4.xyzx + r2.wwww).xyz;
/*35*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*36*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*37*/	r1.w = vsOut_T7.z + -0.025000;
/*38*/	r1.w = max(r1.w, 0.000000);
/*39*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*40*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*41*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*42*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*43*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*44*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*46*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*47*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*48*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*49*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*50*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*51*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*52*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*53*/	r2.z = inversesqrt(r2.z);
/*54*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*55*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*56*/	r2.z = inversesqrt(r2.z);
/*57*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*58*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*59*/	r2.z = inversesqrt(r2.z);
/*60*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*61*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*62*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*63*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*64*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r0.w = inversesqrt(r0.w);
/*66*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*67*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*68*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*69*/	r0.w = inversesqrt(r0.w);
/*70*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*71*/	r0.w = -r3.x + 1.000000;
/*72*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r4.x = dot(vec3(r3.yzwy), vec3(r2.xyzx));
/*74*/	r4.x = r4.x + r4.x;
/*75*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*76*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*77*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*78*/	r4.w = cos((r6.x));
/*79*/	r4.w = inversesqrt(r4.w);
/*80*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*81*/	r5.w = saturate(r1.w * 60.000000);
/*82*/	r5.w = -r1.w + r5.w;
/*83*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*84*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*85*/	r7.x = inversesqrt(r7.x);
/*86*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*87*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*88*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*89*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*90*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*91*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*92*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*93*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*94*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*95*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*96*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*97*/	r5.y = -r1.w + 1.000000;
/*98*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*99*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*100*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*101*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*102*/	  r5.y = max(r5.y, 0.000000);
/*103*/	  r5.y = log2(r5.y);
/*104*/	  r5.y = r5.y * 10.000000;
/*105*/	  r5.y = exp2(r5.y);
/*106*/	  r5.y = r4.w * r5.y;
/*107*/	  r5.y = r5.y * r5.w + r1.w;
/*108*/	  r7.x = r0.w * 8.000000;
/*109*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*110*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*111*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*112*/	}
/*113*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*114*/	r7.x = max(r5.y, 0.000000);
/*115*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*116*/	if(floatBitsToUint(r5.y) != 0u) {
/*117*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*118*/	  r4.x = max(r4.x, -1.000000);
/*119*/	  r4.x = min(r4.x, 1.000000);
/*120*/	  r4.y = -abs(r4.x) + 1.000000;
/*121*/	  r4.y = sqrt(r4.y);
/*122*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*123*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*124*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*125*/	  r5.y = r4.y * r4.z;
/*126*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*127*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*128*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*129*/	  r4.x = r4.z * r4.y + r4.x;
/*130*/	  r3.x = r3.x * r3.x;
/*131*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*132*/	  r2.w = r3.x * r2.w + r5.x;
/*133*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*134*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*135*/	  r3.x = -r2.w * r2.w + 1.000000;
/*136*/	  r3.x = max(r3.x, 0.001000);
/*137*/	  r3.x = log2(r3.x);
/*138*/	  r4.y = r3.x * 4.950617;
/*139*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*140*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*141*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*142*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*143*/	  r2.w = floatBitsToInt(r2.w);
/*144*/	  r4.y = r3.x * r3.x + -r4.y;
/*145*/	  r4.y = sqrt(r4.y);
/*146*/	  r3.x = -r3.x + r4.y;
/*147*/	  r3.x = max(r3.x, 0.000000);
/*148*/	  r3.x = sqrt(r3.x);
/*149*/	  r2.w = r2.w * r3.x;
/*150*/	  r2.w = r2.w * 1.414214;
/*151*/	  r2.w = 0.008727 / r2.w;
/*152*/	  r2.w = max(r2.w, 0.000100);
/*153*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*154*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*155*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*156*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*157*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*158*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*159*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*160*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*161*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*162*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*163*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*164*/	  r2.w = floatBitsToInt(r2.w);
/*165*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*166*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*167*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*168*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*169*/	  r2.w = r2.w * r4.x + 1.000000;
/*170*/	  r2.w = r2.w * 0.500000;
/*171*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*172*/	  r3.x = r3.x * r4.y + 1.000000;
/*173*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*174*/	  r3.x = min(r7.x, 1.000000);
/*175*/	  r0.w = r0.w * 1.570796;
/*176*/	  r0.w = sin(r0.w);
/*177*/	  r3.x = r3.x + -1.000000;
/*178*/	  r0.w = r0.w * r3.x + 1.000000;
/*179*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*180*/	  r3.x = max(r3.x, 0.000000);
/*181*/	  r3.x = log2(r3.x);
/*182*/	  r3.x = r3.x * 10.000000;
/*183*/	  r3.x = exp2(r3.x);
/*184*/	  r3.x = r4.w * r3.x;
/*185*/	  r3.x = r3.x * r5.w + r1.w;
/*186*/	  r0.w = r0.w * abs(r2.w);
/*187*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*188*/	} else {
/*189*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*190*/	}
/*191*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*192*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*193*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*194*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*195*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*196*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*197*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*198*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*199*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*200*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*201*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*202*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*203*/	r0.w = inversesqrt(r0.w);
/*204*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*205*/	r0.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*206*/	r0.w = r0.w + r0.w;
/*207*/	r2.xyz = (r2.xyzx * -r0.wwww + -r3.xyzx).xyz;
/*208*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*209*/	r0.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*210*/	r0.w = max(r0.w, 0.000000);
/*211*/	r0.w = log2(r0.w);
/*212*/	r0.w = r0.w * 10.000000;
/*213*/	r0.w = exp2(r0.w);
/*214*/	r0.w = r4.w * r0.w;
/*215*/	r0.w = r0.w * r5.w + r1.w;
/*216*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*217*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*218*/	color0.w = 2.000000;
/*219*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*220*/	r0.w = 1.000000;
/*221*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*222*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*223*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*224*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*225*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*226*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*227*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*228*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*229*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*230*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*231*/	if(r0.x != 0) discard;
/*232*/	color1.x = 1.000000;
/*233*/	return;
}
