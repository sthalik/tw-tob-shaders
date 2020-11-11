//
//
// Shader Model 4
// Fragment Shader
//
// id: 5744 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirt.hlsl_PS_ps30_weighted_forward_lighting_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
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
/*9*/	r4.xyz = (r4.xyzx + -cb5.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb5.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb5.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb5.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb5.data[2].xyzx).xyz;
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
/*29*/	r3.z = sqrt(r0.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r0.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*42*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*46*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*47*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*49*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*50*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*51*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*52*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*53*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*55*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*58*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*61*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*64*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*65*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*66*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*67*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*70*/	r3.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*71*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*72*/	r2.w = inversesqrt(r1.w);
/*73*/	r4.yzw = (r2.wwww * r3.xxyz).yzw;
/*74*/	r2.w = -r4.x + 1.000000;
/*75*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r5.y = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*77*/	r5.y = r5.y + r5.y;
/*78*/	r5.yzw = (r2.xxyz * -r5.yyyy + r4.yyzw).yzw;
/*79*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*80*/	r6.w = r2.w * 1.539380;
/*81*/	r6.w = cos((r6.w));
/*82*/	r6.w = inversesqrt(r6.w);
/*83*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*84*/	r7.x = saturate(r0.w * 60.000000);
/*85*/	r7.x = -r0.w + r7.x;
/*86*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*87*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*88*/	r8.x = inversesqrt(r8.x);
/*89*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*90*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*91*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*92*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*93*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*94*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*95*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*96*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*97*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*98*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*99*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*100*/	r6.y = -r0.w + 1.000000;
/*101*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*102*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*103*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*104*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.yzwy));
/*105*/	  r6.y = max(r6.y, 0.000000);
/*106*/	  r6.y = log2(r6.y);
/*107*/	  r6.y = r6.y * 10.000000;
/*108*/	  r6.y = exp2(r6.y);
/*109*/	  r6.y = r6.w * r6.y;
/*110*/	  r6.y = r6.y * r7.x + r0.w;
/*111*/	  r8.x = r2.w * 8.000000;
/*112*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*113*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*114*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*115*/	}
/*116*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*117*/	r2.y = max(r2.x, 0.000000);
/*118*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*119*/	if(floatBitsToUint(r2.x) != 0u) {
/*120*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*121*/	  r2.x = max(r2.x, -1.000000);
/*122*/	  r2.x = min(r2.x, 1.000000);
/*123*/	  r2.z = -abs(r2.x) + 1.000000;
/*124*/	  r2.z = sqrt(r2.z);
/*125*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*126*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*127*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*128*/	  r5.z = r2.z * r5.y;
/*129*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*130*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*131*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*132*/	  r2.x = r5.y * r2.z + r2.x;
/*133*/	  r2.z = r4.x * r4.x;
/*134*/	    r4.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*135*/	  r2.z = r2.z * r4.x + r6.x;
/*136*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*137*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*138*/	  r4.x = -r2.z * r2.z + 1.000000;
/*139*/	  r4.x = max(r4.x, 0.001000);
/*140*/	  r4.x = log2(r4.x);
/*141*/	  r5.x = r4.x * 4.950617;
/*142*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*143*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*144*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*145*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*146*/	  r2.z = floatBitsToInt(r2.z);
/*147*/	  r5.x = r4.x * r4.x + -r5.x;
/*148*/	  r5.x = sqrt(r5.x);
/*149*/	  r4.x = -r4.x + r5.x;
/*150*/	  r4.x = max(r4.x, 0.000000);
/*151*/	  r4.x = sqrt(r4.x);
/*152*/	  r2.z = r2.z * r4.x;
/*153*/	  r2.z = r2.z * 1.414214;
/*154*/	  r2.z = 0.008727 / r2.z;
/*155*/	  r2.z = max(r2.z, 0.000100);
/*156*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*157*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*158*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*159*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*160*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*161*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*162*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*163*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*164*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*165*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*166*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*167*/	  r2.x = floatBitsToInt(r2.x);
/*168*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*169*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*170*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*171*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*172*/	  r2.x = r2.x * r5.x + 1.000000;
/*173*/	  r2.x = r2.x * 0.500000;
/*174*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*175*/	  r2.z = r2.z * r5.y + 1.000000;
/*176*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*177*/	  r2.z = min(r2.y, 1.000000);
/*178*/	  r2.w = r2.w * 1.570796;
/*179*/	  r2.w = sin(r2.w);
/*180*/	  r2.z = r2.z + -1.000000;
/*181*/	  r2.z = r2.w * r2.z + 1.000000;
/*182*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r4.yzwy));
/*183*/	  r2.w = max(r2.w, 0.000000);
/*184*/	  r2.w = log2(r2.w);
/*185*/	  r2.w = r2.w * 10.000000;
/*186*/	  r2.w = exp2(r2.w);
/*187*/	  r2.w = r6.w * r2.w;
/*188*/	  r2.w = r2.w * r7.x + r0.w;
/*189*/	  r2.x = r2.z * abs(r2.x);
/*190*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*191*/	} else {
/*192*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*193*/	}
/*194*/	r4.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*195*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*196*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*197*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*198*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*199*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*200*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*201*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*202*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*203*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*204*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*205*/	r2.w = 1.000000;
/*206*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*207*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*208*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*209*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*210*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*211*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*212*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*213*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*214*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*215*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*216*/	if(r0.w != 0) discard;
/*217*/	r0.w = sqrt(r1.w);
/*218*/	r1.x = saturate(cb3.data[0].w)/**/;
/*219*/	r1.x = -r1.x + 1.000000;
/*220*/	r1.x = r1.x * 8.000000 + -4.000000;
/*221*/	r1.y = saturate(cb3.data[1].x)/**/;
/*222*/	r1.y = -r1.y + 1.000000;
/*223*/	r1.y = r1.y * 1000.000000;
/*224*/	r0.w = r0.w / r1.y;
/*225*/	r0.w = r0.w + r1.x;
/*226*/	r0.w = r0.w * 1.442695;
/*227*/	r0.w = exp2(r0.w);
/*228*/	r0.w = cb3.data[1].y / r0.w;
/*229*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*230*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*231*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*232*/	r1.x = r1.x + -cb3.data[1].z;
/*233*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*234*/	r1.x = saturate(r1.y * r1.x);
/*235*/	r1.y = r1.x * -2.000000 + 3.000000;
/*236*/	r1.x = r1.x * r1.x;
/*237*/	r1.x = r1.x * r1.y;
/*238*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*239*/	r1.y = sqrt(r1.y);
/*240*/	r1.z = max(cb3.data[2].z, 0.001000);
/*241*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*242*/	r1.y = r1.z * r1.y;
/*243*/	r1.y = min(r1.y, 1.000000);
/*244*/	r1.z = r1.y * -2.000000 + 3.000000;
/*245*/	r1.y = r1.y * r1.y;
/*246*/	r1.y = r1.y * r1.z;
/*247*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*248*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*249*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*250*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*251*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*252*/	r3.w = max(r3.y, 0.000000);
/*253*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*254*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*255*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*256*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*257*/	r0.w = saturate(r0.w * r1.y);
/*258*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*259*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*260*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*261*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*262*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*263*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*264*/	color0.w = 1.000000;
/*265*/	return;
}
