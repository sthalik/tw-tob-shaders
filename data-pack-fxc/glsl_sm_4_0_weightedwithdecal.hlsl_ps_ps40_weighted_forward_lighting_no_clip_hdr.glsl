//
//
// Shader Model 4
// Fragment Shader
//
// id: 1749 - fxc/glsl_SM_4_0_weightedwithdecal.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r2.z = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*30*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*31*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*32*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*33*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*34*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*35*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*36*/	r4.z = vsOut_T6.z;
/*37*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*38*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*39*/	if(floatBitsToUint(r0.w) != 0u) {
/*40*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*41*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*42*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*43*/	  r0.w = -r0.w + 1.000000;
/*44*/	  r0.w = max(r0.w, 0.000000);
/*45*/	  r4.z = sqrt(r0.w);
/*46*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*48*/	  r0.w = r3.x * r7.w;
/*49*/	  r3.x = r0.w * -0.500000 + r3.x;
/*50*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*51*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*52*/	  r0.w = -r5.w * r6.w + 1.000000;
/*53*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*54*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*55*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*56*/	}
/*57*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*58*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*59*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*60*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*62*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*63*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*64*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*65*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*66*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*67*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*68*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*71*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*74*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*77*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*78*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*79*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*80*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*81*/	r1.w = inversesqrt(r1.w);
/*82*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*83*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*84*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*87*/	r1.w = -r3.y + 1.000000;
/*88*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*89*/	r4.x = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*90*/	r4.x = r4.x + r4.x;
/*91*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*92*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*93*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*94*/	r4.w = cos((r6.x));
/*95*/	r4.w = inversesqrt(r4.w);
/*96*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*97*/	r5.w = saturate(r0.w * 60.000000);
/*98*/	r5.w = -r0.w + r5.w;
/*99*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*100*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*101*/	r7.x = inversesqrt(r7.x);
/*102*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*103*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*104*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*105*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*106*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*107*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*108*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*109*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*110*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*111*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*112*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*113*/	r5.y = -r0.w + 1.000000;
/*114*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*115*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*116*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*117*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*118*/	  r5.y = max(r5.y, 0.000000);
/*119*/	  r5.y = log2(r5.y);
/*120*/	  r5.y = r5.y * 10.000000;
/*121*/	  r5.y = exp2(r5.y);
/*122*/	  r5.y = r4.w * r5.y;
/*123*/	  r5.y = r5.y * r5.w + r0.w;
/*124*/	  r7.x = r1.w * 8.000000;
/*125*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*126*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*127*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*128*/	}
/*129*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*130*/	r7.x = max(r5.y, 0.000000);
/*131*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*132*/	if(floatBitsToUint(r5.y) != 0u) {
/*133*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*134*/	  r4.x = max(r4.x, -1.000000);
/*135*/	  r4.x = min(r4.x, 1.000000);
/*136*/	  r4.y = -abs(r4.x) + 1.000000;
/*137*/	  r4.y = sqrt(r4.y);
/*138*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*139*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*140*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*141*/	  r5.y = r4.y * r4.z;
/*142*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*143*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*144*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*145*/	  r4.x = r4.z * r4.y + r4.x;
/*146*/	  r3.y = r3.y * r3.y;
/*147*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*148*/	  r2.w = r3.y * r2.w + r5.x;
/*149*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*150*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*151*/	  r3.y = -r2.w * r2.w + 1.000000;
/*152*/	  r3.y = max(r3.y, 0.001000);
/*153*/	  r3.y = log2(r3.y);
/*154*/	  r4.y = r3.y * 4.950617;
/*155*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*156*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*157*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*158*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*159*/	  r2.w = floatBitsToInt(r2.w);
/*160*/	  r4.y = r3.y * r3.y + -r4.y;
/*161*/	  r4.y = sqrt(r4.y);
/*162*/	  r3.y = -r3.y + r4.y;
/*163*/	  r3.y = max(r3.y, 0.000000);
/*164*/	  r3.y = sqrt(r3.y);
/*165*/	  r2.w = r2.w * r3.y;
/*166*/	  r2.w = r2.w * 1.414214;
/*167*/	  r2.w = 0.008727 / r2.w;
/*168*/	  r2.w = max(r2.w, 0.000100);
/*169*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*170*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*171*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*172*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*173*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*174*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*175*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*176*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*177*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*178*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*179*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*180*/	  r2.w = floatBitsToInt(r2.w);
/*181*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*182*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*183*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*184*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*185*/	  r2.w = r2.w * r4.x + 1.000000;
/*186*/	  r2.w = r2.w * 0.500000;
/*187*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*188*/	  r3.y = r3.y * r4.y + 1.000000;
/*189*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*190*/	  r3.y = min(r7.x, 1.000000);
/*191*/	  r1.w = r1.w * 1.570796;
/*192*/	  r1.w = sin(r1.w);
/*193*/	  r3.y = r3.y + -1.000000;
/*194*/	  r1.w = r1.w * r3.y + 1.000000;
/*195*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*196*/	  r3.x = max(r3.x, 0.000000);
/*197*/	  r3.x = log2(r3.x);
/*198*/	  r3.x = r3.x * 10.000000;
/*199*/	  r3.x = exp2(r3.x);
/*200*/	  r3.x = r4.w * r3.x;
/*201*/	  r3.x = r3.x * r5.w + r0.w;
/*202*/	  r1.w = r1.w * abs(r2.w);
/*203*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*204*/	} else {
/*205*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*206*/	}
/*207*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*208*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*209*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*210*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*211*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*212*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*213*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*214*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*215*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*216*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*217*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*218*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*219*/	r1.w = inversesqrt(r1.w);
/*220*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*221*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*222*/	r1.w = r1.w + r1.w;
/*223*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*224*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*225*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*226*/	r1.w = max(r1.w, 0.000000);
/*227*/	r1.w = log2(r1.w);
/*228*/	r1.w = r1.w * 10.000000;
/*229*/	r1.w = exp2(r1.w);
/*230*/	r1.w = r4.w * r1.w;
/*231*/	r0.w = r1.w * r5.w + r0.w;
/*232*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*233*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*234*/	color0.w = 2.000000;
/*235*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*236*/	r0.w = 1.000000;
/*237*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*238*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*239*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*240*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*241*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*242*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*243*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*244*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*245*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*246*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*247*/	if(r0.x != 0) discard;
/*248*/	color1.x = 1.000000;
/*249*/	return;
}
