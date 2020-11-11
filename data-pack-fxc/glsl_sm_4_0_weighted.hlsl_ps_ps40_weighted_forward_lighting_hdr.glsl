//
//
// Shader Model 4
// Fragment Shader
//
// id: 1630 - fxc/glsl_SM_4_0_weighted.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform samplerCube s_environment;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb2;

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
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb2.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb2.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb2.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb2.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb2.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb2.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r0.w = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*32*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*33*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*34*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*36*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*37*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*38*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*39*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*40*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*41*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*42*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	r2.z = inversesqrt(r2.z);
/*44*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*45*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*46*/	r2.z = inversesqrt(r2.z);
/*47*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*48*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r2.z = inversesqrt(r2.z);
/*50*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*51*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*52*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*53*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*57*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*58*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*59*/	r0.w = inversesqrt(r0.w);
/*60*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*61*/	r0.w = -r3.x + 1.000000;
/*62*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*63*/	r4.x = dot(vec3(r3.yzwy), vec3(r2.xyzx));
/*64*/	r4.x = r4.x + r4.x;
/*65*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*66*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*67*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*68*/	r4.w = cos((r6.x));
/*69*/	r4.w = inversesqrt(r4.w);
/*70*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*71*/	r5.w = saturate(r1.w * 60.000000);
/*72*/	r5.w = -r1.w + r5.w;
/*73*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*74*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*75*/	r7.x = inversesqrt(r7.x);
/*76*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*77*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*78*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*79*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*80*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*81*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*82*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*83*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*84*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*85*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*86*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*87*/	r5.y = -r1.w + 1.000000;
/*88*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*89*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*90*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*91*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*92*/	  r5.y = max(r5.y, 0.000000);
/*93*/	  r5.y = log2(r5.y);
/*94*/	  r5.y = r5.y * 10.000000;
/*95*/	  r5.y = exp2(r5.y);
/*96*/	  r5.y = r4.w * r5.y;
/*97*/	  r5.y = r5.y * r5.w + r1.w;
/*98*/	  r7.x = r0.w * 8.000000;
/*99*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*100*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*101*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*102*/	}
/*103*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*104*/	r7.x = max(r5.y, 0.000000);
/*105*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*106*/	if(floatBitsToUint(r5.y) != 0u) {
/*107*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*108*/	  r4.x = max(r4.x, -1.000000);
/*109*/	  r4.x = min(r4.x, 1.000000);
/*110*/	  r4.y = -abs(r4.x) + 1.000000;
/*111*/	  r4.y = sqrt(r4.y);
/*112*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*113*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*114*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*115*/	  r5.y = r4.y * r4.z;
/*116*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*117*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*118*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*119*/	  r4.x = r4.z * r4.y + r4.x;
/*120*/	  r3.x = r3.x * r3.x;
/*121*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*122*/	  r2.w = r3.x * r2.w + r5.x;
/*123*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*124*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*125*/	  r3.x = -r2.w * r2.w + 1.000000;
/*126*/	  r3.x = max(r3.x, 0.001000);
/*127*/	  r3.x = log2(r3.x);
/*128*/	  r4.y = r3.x * 4.950617;
/*129*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*130*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*131*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*132*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*133*/	  r2.w = floatBitsToInt(r2.w);
/*134*/	  r4.y = r3.x * r3.x + -r4.y;
/*135*/	  r4.y = sqrt(r4.y);
/*136*/	  r3.x = -r3.x + r4.y;
/*137*/	  r3.x = max(r3.x, 0.000000);
/*138*/	  r3.x = sqrt(r3.x);
/*139*/	  r2.w = r2.w * r3.x;
/*140*/	  r2.w = r2.w * 1.414214;
/*141*/	  r2.w = 0.008727 / r2.w;
/*142*/	  r2.w = max(r2.w, 0.000100);
/*143*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*144*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*145*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*146*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*147*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*148*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*149*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*150*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*151*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*152*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*153*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*154*/	  r2.w = floatBitsToInt(r2.w);
/*155*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*156*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*157*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*158*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*159*/	  r2.w = r2.w * r4.x + 1.000000;
/*160*/	  r2.w = r2.w * 0.500000;
/*161*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*162*/	  r3.x = r3.x * r4.y + 1.000000;
/*163*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*164*/	  r3.x = min(r7.x, 1.000000);
/*165*/	  r0.w = r0.w * 1.570796;
/*166*/	  r0.w = sin(r0.w);
/*167*/	  r3.x = r3.x + -1.000000;
/*168*/	  r0.w = r0.w * r3.x + 1.000000;
/*169*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*170*/	  r3.x = max(r3.x, 0.000000);
/*171*/	  r3.x = log2(r3.x);
/*172*/	  r3.x = r3.x * 10.000000;
/*173*/	  r3.x = exp2(r3.x);
/*174*/	  r3.x = r4.w * r3.x;
/*175*/	  r3.x = r3.x * r5.w + r1.w;
/*176*/	  r0.w = r0.w * abs(r2.w);
/*177*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*178*/	} else {
/*179*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*180*/	}
/*181*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*182*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*183*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*184*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*185*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*186*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*187*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*188*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*189*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*190*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*191*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*192*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*193*/	r0.w = inversesqrt(r0.w);
/*194*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*195*/	r0.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*196*/	r0.w = r0.w + r0.w;
/*197*/	r2.xyz = (r2.xyzx * -r0.wwww + -r3.xyzx).xyz;
/*198*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*199*/	r0.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*200*/	r0.w = max(r0.w, 0.000000);
/*201*/	r0.w = log2(r0.w);
/*202*/	r0.w = r0.w * 10.000000;
/*203*/	r0.w = exp2(r0.w);
/*204*/	r0.w = r4.w * r0.w;
/*205*/	r0.w = r0.w * r5.w + r1.w;
/*206*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*207*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*208*/	color0.w = 2.000000;
/*209*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*210*/	r0.w = 1.000000;
/*211*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*212*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*213*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*214*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*215*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*216*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*217*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*218*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*219*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*220*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*221*/	if(r0.x != 0) discard;
/*222*/	color1.x = 1.000000;
/*223*/	return;
}
