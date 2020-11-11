//
//
// Shader Model 4
// Fragment Shader
//
// id: 2665 - fxc/glsl_SM_4_0_weightedwithburn.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r0.w = -r0.w + 1.000000;
/*10*/	r0.w = max(r0.w, 0.000000);
/*11*/	r0.w = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*14*/	r4.x = r2.z;
/*15*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*16*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*17*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*18*/	r1.w = saturate(r4.x * 5.000000);
/*19*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*20*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*21*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*22*/	r2.z = log2(r5.z);
/*23*/	r2.z = r2.z * 1.800000;
/*24*/	r2.z = exp2(r2.z);
/*25*/	r2.z = r2.z * 10.000000;
/*26*/	r2.z = min(r2.z, 1.000000);
/*27*/	r1.w = r1.w + r2.z;
/*28*/	r1.w = r1.w * 0.500000;
/*29*/	r2.z = -r5.w + 1.000000;
/*30*/	r2.z = log2(r2.z);
/*31*/	r2.z = r2.z * vsOut_T7.z;
/*32*/	r2.z = exp2(r2.z);
/*33*/	r2.z = min(r2.z, 1.000000);
/*34*/	r2.z = r2.z * vsOut_T7.z;
/*35*/	r2.w = r5.z * 0.250000;
/*36*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*37*/	r4.xyz = (r1.wwww * r4.xyzx + r2.wwww).xyz;
/*38*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*39*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*40*/	r1.w = vsOut_T7.z + -0.025000;
/*41*/	r1.w = max(r1.w, 0.000000);
/*42*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*43*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*44*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*46*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*47*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*49*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*50*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*51*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*52*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*53*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*55*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r2.z = inversesqrt(r2.z);
/*57*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*58*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*59*/	r2.z = inversesqrt(r2.z);
/*60*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*61*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r2.z = inversesqrt(r2.z);
/*63*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*64*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*65*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*66*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*67*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*68*/	r0.w = inversesqrt(r0.w);
/*69*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*70*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*71*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*72*/	r0.w = inversesqrt(r0.w);
/*73*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*74*/	r0.w = -r3.x + 1.000000;
/*75*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r4.x = dot(vec3(r3.yzwy), vec3(r2.xyzx));
/*77*/	r4.x = r4.x + r4.x;
/*78*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*79*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*80*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*81*/	r4.w = cos((r6.x));
/*82*/	r4.w = inversesqrt(r4.w);
/*83*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*84*/	r5.w = saturate(r1.w * 60.000000);
/*85*/	r5.w = -r1.w + r5.w;
/*86*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*87*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*88*/	r7.x = inversesqrt(r7.x);
/*89*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*90*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*91*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*92*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*93*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*94*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*95*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*96*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*97*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*98*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*99*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*100*/	r5.y = -r1.w + 1.000000;
/*101*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*102*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*103*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*104*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*105*/	  r5.y = max(r5.y, 0.000000);
/*106*/	  r5.y = log2(r5.y);
/*107*/	  r5.y = r5.y * 10.000000;
/*108*/	  r5.y = exp2(r5.y);
/*109*/	  r5.y = r4.w * r5.y;
/*110*/	  r5.y = r5.y * r5.w + r1.w;
/*111*/	  r7.x = r0.w * 8.000000;
/*112*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*113*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*114*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*115*/	}
/*116*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*117*/	r7.x = max(r5.y, 0.000000);
/*118*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*119*/	if(floatBitsToUint(r5.y) != 0u) {
/*120*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*121*/	  r4.x = max(r4.x, -1.000000);
/*122*/	  r4.x = min(r4.x, 1.000000);
/*123*/	  r4.y = -abs(r4.x) + 1.000000;
/*124*/	  r4.y = sqrt(r4.y);
/*125*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*126*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*127*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*128*/	  r5.y = r4.y * r4.z;
/*129*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*130*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*131*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*132*/	  r4.x = r4.z * r4.y + r4.x;
/*133*/	  r3.x = r3.x * r3.x;
/*134*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*135*/	  r2.w = r3.x * r2.w + r5.x;
/*136*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*137*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*138*/	  r3.x = -r2.w * r2.w + 1.000000;
/*139*/	  r3.x = max(r3.x, 0.001000);
/*140*/	  r3.x = log2(r3.x);
/*141*/	  r4.y = r3.x * 4.950617;
/*142*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*143*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*144*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*145*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*146*/	  r2.w = floatBitsToInt(r2.w);
/*147*/	  r4.y = r3.x * r3.x + -r4.y;
/*148*/	  r4.y = sqrt(r4.y);
/*149*/	  r3.x = -r3.x + r4.y;
/*150*/	  r3.x = max(r3.x, 0.000000);
/*151*/	  r3.x = sqrt(r3.x);
/*152*/	  r2.w = r2.w * r3.x;
/*153*/	  r2.w = r2.w * 1.414214;
/*154*/	  r2.w = 0.008727 / r2.w;
/*155*/	  r2.w = max(r2.w, 0.000100);
/*156*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*157*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*158*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*159*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*160*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*161*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*162*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*163*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*164*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*165*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*166*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*167*/	  r2.w = floatBitsToInt(r2.w);
/*168*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*169*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*170*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*171*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*172*/	  r2.w = r2.w * r4.x + 1.000000;
/*173*/	  r2.w = r2.w * 0.500000;
/*174*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*175*/	  r3.x = r3.x * r4.y + 1.000000;
/*176*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*177*/	  r3.x = min(r7.x, 1.000000);
/*178*/	  r0.w = r0.w * 1.570796;
/*179*/	  r0.w = sin(r0.w);
/*180*/	  r3.x = r3.x + -1.000000;
/*181*/	  r0.w = r0.w * r3.x + 1.000000;
/*182*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*183*/	  r3.x = max(r3.x, 0.000000);
/*184*/	  r3.x = log2(r3.x);
/*185*/	  r3.x = r3.x * 10.000000;
/*186*/	  r3.x = exp2(r3.x);
/*187*/	  r3.x = r4.w * r3.x;
/*188*/	  r3.x = r3.x * r5.w + r1.w;
/*189*/	  r0.w = r0.w * abs(r2.w);
/*190*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*191*/	} else {
/*192*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*193*/	}
/*194*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*195*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*196*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*197*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*198*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*199*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*200*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*201*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*202*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*203*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*204*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*205*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*206*/	r0.w = inversesqrt(r0.w);
/*207*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*208*/	r0.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*209*/	r0.w = r0.w + r0.w;
/*210*/	r2.xyz = (r2.xyzx * -r0.wwww + -r3.xyzx).xyz;
/*211*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*212*/	r0.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*213*/	r0.w = max(r0.w, 0.000000);
/*214*/	r0.w = log2(r0.w);
/*215*/	r0.w = r0.w * 10.000000;
/*216*/	r0.w = exp2(r0.w);
/*217*/	r0.w = r4.w * r0.w;
/*218*/	r0.w = r0.w * r5.w + r1.w;
/*219*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*220*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*221*/	color0.w = 2.000000;
/*222*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*223*/	r0.w = 1.000000;
/*224*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*225*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*226*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*227*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*228*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*229*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*230*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*231*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*232*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*233*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*234*/	if(r0.x != 0) discard;
/*235*/	color1.x = 1.000000;
/*236*/	return;
}
