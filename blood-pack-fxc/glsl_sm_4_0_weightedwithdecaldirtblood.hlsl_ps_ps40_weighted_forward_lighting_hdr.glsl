//
//
// Shader Model 4
// Fragment Shader
//
// id: 3028 - fxc/glsl_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform samplerCube s_environment;

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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
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
/*29*/	r2.z = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r3.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*33*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*34*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*35*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*36*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*37*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*38*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*39*/	r4.z = vsOut_T6.z;
/*40*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*41*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*42*/	if(floatBitsToUint(r0.w) != 0u) {
/*43*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*44*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*46*/	  r0.w = -r0.w + 1.000000;
/*47*/	  r0.w = max(r0.w, 0.000000);
/*48*/	  r4.z = sqrt(r0.w);
/*49*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*50*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*51*/	  r0.w = r3.x * r7.w;
/*52*/	  r3.x = r0.w * -0.500000 + r3.x;
/*53*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*54*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*55*/	  r0.w = -r5.w * r6.w + 1.000000;
/*56*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*57*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*58*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*59*/	}
/*60*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r3.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*62*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*63*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*64*/	r0.w = r4.w * r5.w;
/*65*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*66*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*67*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*68*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*71*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*72*/	if(r1.w != 0) discard;
/*73*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*74*/	r3.zw = (r3.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*75*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*76*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*77*/	r1.w = saturate(-r1.w + r4.w);
/*78*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*79*/	if(floatBitsToUint(r1.w) != 0u) {
/*80*/	  r1.w = -r4.w + 1.000000;
/*81*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*82*/	  r1.w = -r1.w + 1.000000;
/*83*/	  r1.w = -r1.w * r1.w + 1.000000;
/*84*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*85*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*86*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*87*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*88*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*89*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*90*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*91*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*92*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*93*/	} else {
/*94*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*95*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*96*/	}
/*97*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*98*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*99*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*100*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*101*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*102*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*103*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*104*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*105*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*106*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*107*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*108*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*109*/	r1.w = inversesqrt(r1.w);
/*110*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*111*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*112*/	r1.w = inversesqrt(r1.w);
/*113*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*114*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*115*/	r1.w = inversesqrt(r1.w);
/*116*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*117*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*118*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*119*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*120*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*121*/	r1.w = inversesqrt(r1.w);
/*122*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*123*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*124*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*125*/	r1.w = inversesqrt(r1.w);
/*126*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*127*/	r1.w = -r3.y + 1.000000;
/*128*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*129*/	r4.x = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*130*/	r4.x = r4.x + r4.x;
/*131*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*132*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*133*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*134*/	r4.w = cos((r6.x));
/*135*/	r4.w = inversesqrt(r4.w);
/*136*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*137*/	r5.w = saturate(r0.w * 60.000000);
/*138*/	r5.w = -r0.w + r5.w;
/*139*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*140*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*141*/	r7.x = inversesqrt(r7.x);
/*142*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*143*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*144*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*145*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*146*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*147*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*148*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*149*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*150*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*151*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*152*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*153*/	r5.y = -r0.w + 1.000000;
/*154*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*155*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*156*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*157*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*158*/	  r5.y = max(r5.y, 0.000000);
/*159*/	  r5.y = log2(r5.y);
/*160*/	  r5.y = r5.y * 10.000000;
/*161*/	  r5.y = exp2(r5.y);
/*162*/	  r5.y = r4.w * r5.y;
/*163*/	  r5.y = r5.y * r5.w + r0.w;
/*164*/	  r7.x = r1.w * 8.000000;
/*165*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*166*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*167*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*168*/	}
/*169*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*170*/	r7.x = max(r5.y, 0.000000);
/*171*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*172*/	if(floatBitsToUint(r5.y) != 0u) {
/*173*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*174*/	  r4.x = max(r4.x, -1.000000);
/*175*/	  r4.x = min(r4.x, 1.000000);
/*176*/	  r4.y = -abs(r4.x) + 1.000000;
/*177*/	  r4.y = sqrt(r4.y);
/*178*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*179*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*180*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*181*/	  r5.y = r4.y * r4.z;
/*182*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*183*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*184*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*185*/	  r4.x = r4.z * r4.y + r4.x;
/*186*/	  r3.y = r3.y * r3.y;
/*187*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*188*/	  r2.w = r3.y * r2.w + r5.x;
/*189*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*190*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*191*/	  r3.y = -r2.w * r2.w + 1.000000;
/*192*/	  r3.y = max(r3.y, 0.001000);
/*193*/	  r3.y = log2(r3.y);
/*194*/	  r4.y = r3.y * 4.950617;
/*195*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*196*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*197*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*198*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*199*/	  r2.w = floatBitsToInt(r2.w);
/*200*/	  r4.y = r3.y * r3.y + -r4.y;
/*201*/	  r4.y = sqrt(r4.y);
/*202*/	  r3.y = -r3.y + r4.y;
/*203*/	  r3.y = max(r3.y, 0.000000);
/*204*/	  r3.y = sqrt(r3.y);
/*205*/	  r2.w = r2.w * r3.y;
/*206*/	  r2.w = r2.w * 1.414214;
/*207*/	  r2.w = 0.008727 / r2.w;
/*208*/	  r2.w = max(r2.w, 0.000100);
/*209*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*210*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*211*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*212*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*213*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*214*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*215*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*216*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*217*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*218*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*219*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*220*/	  r2.w = floatBitsToInt(r2.w);
/*221*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*222*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*223*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*224*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*225*/	  r2.w = r2.w * r4.x + 1.000000;
/*226*/	  r2.w = r2.w * 0.500000;
/*227*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*228*/	  r3.y = r3.y * r4.y + 1.000000;
/*229*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*230*/	  r3.y = min(r7.x, 1.000000);
/*231*/	  r1.w = r1.w * 1.570796;
/*232*/	  r1.w = sin(r1.w);
/*233*/	  r3.y = r3.y + -1.000000;
/*234*/	  r1.w = r1.w * r3.y + 1.000000;
/*235*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*236*/	  r3.x = max(r3.x, 0.000000);
/*237*/	  r3.x = log2(r3.x);
/*238*/	  r3.x = r3.x * 10.000000;
/*239*/	  r3.x = exp2(r3.x);
/*240*/	  r3.x = r4.w * r3.x;
/*241*/	  r3.x = r3.x * r5.w + r0.w;
/*242*/	  r1.w = r1.w * abs(r2.w);
/*243*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*244*/	} else {
/*245*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*246*/	}
/*247*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*248*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*249*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*250*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*251*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*252*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*253*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*254*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*255*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*256*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*257*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*258*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*259*/	r1.w = inversesqrt(r1.w);
/*260*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*261*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*262*/	r1.w = r1.w + r1.w;
/*263*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*264*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*265*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*266*/	r1.w = max(r1.w, 0.000000);
/*267*/	r1.w = log2(r1.w);
/*268*/	r1.w = r1.w * 10.000000;
/*269*/	r1.w = exp2(r1.w);
/*270*/	r1.w = r4.w * r1.w;
/*271*/	r0.w = r1.w * r5.w + r0.w;
/*272*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*273*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*274*/	color0.w = 2.000000;
/*275*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*276*/	r0.w = 1.000000;
/*277*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*278*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*279*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*280*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*281*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*282*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*283*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*284*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*285*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*286*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*287*/	if(r0.x != 0) discard;
/*288*/	color1.x = 1.000000;
/*289*/	return;
}
