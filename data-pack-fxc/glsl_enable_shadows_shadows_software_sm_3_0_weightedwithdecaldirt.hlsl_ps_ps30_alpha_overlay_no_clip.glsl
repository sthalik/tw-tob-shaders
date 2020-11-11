//
//
// Shader Model 4
// Fragment Shader
//
// id: 5824 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirt.hlsl_PS_ps30_alpha_overlay_no_clip.glsl
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

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
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
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
/*5*/	r1.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r1.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r1.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r1.w = -r1.w + 1.000000;
/*25*/	r1.w = max(r1.w, 0.000000);
/*26*/	r2.z = sqrt(r1.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*30*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*31*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*32*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*33*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*34*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*35*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*36*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*37*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*38*/	if(floatBitsToUint(r1.w) != 0u) {
/*39*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*40*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*42*/	  r1.w = -r1.w + 1.000000;
/*43*/	  r1.w = max(r1.w, 0.000000);
/*44*/	  r5.z = sqrt(r1.w);
/*45*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*47*/	  r1.w = r3.x * r7.w;
/*48*/	  r3.x = r1.w * -0.500000 + r3.x;
/*49*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*50*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*51*/	  r1.w = -r4.w * r6.w + 1.000000;
/*52*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*53*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*54*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*55*/	}
/*56*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*57*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*58*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*59*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*60*/	r1.w = r4.w * r5.w;
/*61*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*62*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*63*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*64*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r2.w = inversesqrt(r2.w);
/*66*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*67*/	r4.xyz = (r1.wwww * r1.xyzx).xyz;
/*68*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*69*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*70*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*71*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*72*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*74*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*75*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*76*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*77*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*78*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*79*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*80*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*81*/	r2.w = inversesqrt(r2.w);
/*82*/	r3.xzw = (r2.wwww * vsOut_T3.xxyz).xzw;
/*83*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*84*/	r2.w = inversesqrt(r2.w);
/*85*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*86*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*87*/	r2.w = inversesqrt(r2.w);
/*88*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*89*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*90*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*91*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*92*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*93*/	r2.w = inversesqrt(r2.w);
/*94*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*95*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*96*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*97*/	r3.x = inversesqrt(r2.w);
/*98*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*99*/	r5.x = -r3.y + 1.000000;
/*100*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*101*/	r5.z = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*102*/	r5.z = r5.z + r5.z;
/*103*/	r6.xyz = (r2.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*104*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*105*/	r5.z = r5.x * 1.539380;
/*106*/	r5.z = cos((r5.z));
/*107*/	r5.z = inversesqrt(r5.z);
/*108*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*109*/	r5.w = saturate(r1.w * 60.000000);
/*110*/	r5.w = -r1.w + r5.w;
/*111*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*112*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*113*/	r6.w = inversesqrt(r6.w);
/*114*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*115*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*116*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*117*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*118*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*119*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*120*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*121*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*122*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*123*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*124*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*125*/	r6.w = -r1.w + 1.000000;
/*126*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*127*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*128*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*129*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*130*/	  r6.w = max(r6.w, 0.000000);
/*131*/	  r6.w = log2(r6.w);
/*132*/	  r6.w = r6.w * 10.000000;
/*133*/	  r6.w = exp2(r6.w);
/*134*/	  r6.w = r5.z * r6.w;
/*135*/	  r6.w = r6.w * r5.w + r1.w;
/*136*/	  r7.y = r5.x * 8.000000;
/*137*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*138*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*139*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*140*/	}
/*141*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*142*/	r2.y = max(r2.x, 0.000000);
/*143*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*144*/	if(floatBitsToUint(r2.x) != 0u) {
/*145*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*146*/	  r2.x = max(r2.x, -1.000000);
/*147*/	  r2.x = min(r2.x, 1.000000);
/*148*/	  r2.z = -abs(r2.x) + 1.000000;
/*149*/	  r2.z = sqrt(r2.z);
/*150*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*151*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*152*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*153*/	  r6.y = r2.z * r6.x;
/*154*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*155*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*156*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*157*/	  r2.x = r6.x * r2.z + r2.x;
/*158*/	  r2.z = r3.y * r3.y;
/*159*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*160*/	  r2.z = r2.z * r3.y + r7.x;
/*161*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*162*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*163*/	  r3.y = -r2.z * r2.z + 1.000000;
/*164*/	  r3.y = max(r3.y, 0.001000);
/*165*/	  r3.y = log2(r3.y);
/*166*/	  r5.y = r3.y * 4.950617;
/*167*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*168*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*169*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*170*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*171*/	  r2.z = floatBitsToInt(r2.z);
/*172*/	  r5.y = r3.y * r3.y + -r5.y;
/*173*/	  r5.y = sqrt(r5.y);
/*174*/	  r3.y = -r3.y + r5.y;
/*175*/	  r3.y = max(r3.y, 0.000000);
/*176*/	  r3.y = sqrt(r3.y);
/*177*/	  r2.z = r2.z * r3.y;
/*178*/	  r2.z = r2.z * 1.414214;
/*179*/	  r2.z = 0.008727 / r2.z;
/*180*/	  r2.z = max(r2.z, 0.000100);
/*181*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*182*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*183*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*184*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*185*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*186*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*187*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*188*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*189*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*190*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*191*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*192*/	  r2.x = floatBitsToInt(r2.x);
/*193*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*194*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*195*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*196*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*197*/	  r2.x = r2.x * r6.x + 1.000000;
/*198*/	  r2.x = r2.x * 0.500000;
/*199*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*200*/	  r2.z = r2.z * r6.y + 1.000000;
/*201*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*202*/	  r2.z = min(r2.y, 1.000000);
/*203*/	  r3.y = r5.x * 1.570796;
/*204*/	  r3.y = sin(r3.y);
/*205*/	  r2.z = r2.z + -1.000000;
/*206*/	  r2.z = r3.y * r2.z + 1.000000;
/*207*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*208*/	  r3.x = max(r3.x, 0.000000);
/*209*/	  r3.x = log2(r3.x);
/*210*/	  r3.x = r3.x * 10.000000;
/*211*/	  r3.x = exp2(r3.x);
/*212*/	  r3.x = r5.z * r3.x;
/*213*/	  r3.x = r3.x * r5.w + r1.w;
/*214*/	  r2.x = r2.z * abs(r2.x);
/*215*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*216*/	} else {
/*217*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*218*/	}
/*219*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*220*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*221*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*222*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*223*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*224*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*225*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*226*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*227*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*228*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*229*/	r1.x = sqrt(r2.w);
/*230*/	r1.y = saturate(cb2.data[0].w)/**/;
/*231*/	r1.y = -r1.y + 1.000000;
/*232*/	r1.y = r1.y * 8.000000 + -4.000000;
/*233*/	r1.z = saturate(cb2.data[1].x)/**/;
/*234*/	r1.z = -r1.z + 1.000000;
/*235*/	r1.z = r1.z * 1000.000000;
/*236*/	r1.x = r1.x / r1.z;
/*237*/	r1.x = r1.x + r1.y;
/*238*/	r1.x = r1.x * 1.442695;
/*239*/	r1.x = exp2(r1.x);
/*240*/	r1.x = cb2.data[1].y / r1.x;
/*241*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*242*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*243*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*244*/	r1.y = r1.y + -cb2.data[1].z;
/*245*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*246*/	r1.y = saturate(r1.z * r1.y);
/*247*/	r1.z = r1.y * -2.000000 + 3.000000;
/*248*/	r1.y = r1.y * r1.y;
/*249*/	r1.y = r1.y * r1.z;
/*250*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*251*/	r1.z = sqrt(r1.z);
/*252*/	r1.w = max(cb2.data[2].z, 0.001000);
/*253*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*254*/	r1.z = r1.w * r1.z;
/*255*/	r1.z = min(r1.z, 1.000000);
/*256*/	r1.w = r1.z * -2.000000 + 3.000000;
/*257*/	r1.z = r1.z * r1.z;
/*258*/	r1.z = r1.z * r1.w;
/*259*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*260*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*261*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*262*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*263*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*264*/	r4.w = max(r4.y, 0.000000);
/*265*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*266*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*267*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*268*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*269*/	r1.x = saturate(r1.x * r1.z);
/*270*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*271*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*272*/	color0.w = r0.w * vsOut_T6.w;
/*273*/	return;
}
