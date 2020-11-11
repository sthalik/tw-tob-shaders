//
//
// Shader Model 4
// Fragment Shader
//
// id: 1759 - fxc/glsl_SM_3_0_weightedwithdecaldirt.hlsl_PS_ps30_alpha_overlay.glsl
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
/*2*/	r1.w = r0.w + -0.501961;
/*3*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r1.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r1.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r2.z = sqrt(r1.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*33*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*34*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*35*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*36*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*37*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*38*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*39*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*40*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*41*/	if(floatBitsToUint(r1.w) != 0u) {
/*42*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*43*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*44*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*45*/	  r1.w = -r1.w + 1.000000;
/*46*/	  r1.w = max(r1.w, 0.000000);
/*47*/	  r5.z = sqrt(r1.w);
/*48*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*49*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*50*/	  r1.w = r3.x * r7.w;
/*51*/	  r3.x = r1.w * -0.500000 + r3.x;
/*52*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*53*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*54*/	  r1.w = -r4.w * r6.w + 1.000000;
/*55*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*56*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*57*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*58*/	}
/*59*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*60*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*61*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*62*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*63*/	r1.w = r4.w * r5.w;
/*64*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*65*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*66*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*67*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*68*/	r2.w = inversesqrt(r2.w);
/*69*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*70*/	r4.xyz = (r1.wwww * r1.xyzx).xyz;
/*71*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*72*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*74*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*75*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*76*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*77*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*78*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*79*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*80*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*81*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*82*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*83*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*84*/	r2.w = inversesqrt(r2.w);
/*85*/	r3.xzw = (r2.wwww * vsOut_T3.xxyz).xzw;
/*86*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*87*/	r2.w = inversesqrt(r2.w);
/*88*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*89*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*90*/	r2.w = inversesqrt(r2.w);
/*91*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*92*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*93*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*94*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*95*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*96*/	r2.w = inversesqrt(r2.w);
/*97*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*98*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*99*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*100*/	r3.x = inversesqrt(r2.w);
/*101*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*102*/	r5.x = -r3.y + 1.000000;
/*103*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*104*/	r5.z = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*105*/	r5.z = r5.z + r5.z;
/*106*/	r6.xyz = (r2.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*107*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*108*/	r5.z = r5.x * 1.539380;
/*109*/	r5.z = cos((r5.z));
/*110*/	r5.z = inversesqrt(r5.z);
/*111*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*112*/	r5.w = saturate(r1.w * 60.000000);
/*113*/	r5.w = -r1.w + r5.w;
/*114*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*115*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*116*/	r6.w = inversesqrt(r6.w);
/*117*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*118*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*119*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*120*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*121*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*122*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*123*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*124*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*125*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*126*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*127*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*128*/	r6.w = -r1.w + 1.000000;
/*129*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*130*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*131*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*132*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*133*/	  r6.w = max(r6.w, 0.000000);
/*134*/	  r6.w = log2(r6.w);
/*135*/	  r6.w = r6.w * 10.000000;
/*136*/	  r6.w = exp2(r6.w);
/*137*/	  r6.w = r5.z * r6.w;
/*138*/	  r6.w = r6.w * r5.w + r1.w;
/*139*/	  r7.y = r5.x * 8.000000;
/*140*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*141*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*142*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*143*/	}
/*144*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*145*/	r2.y = max(r2.x, 0.000000);
/*146*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*147*/	if(floatBitsToUint(r2.x) != 0u) {
/*148*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*149*/	  r2.x = max(r2.x, -1.000000);
/*150*/	  r2.x = min(r2.x, 1.000000);
/*151*/	  r2.z = -abs(r2.x) + 1.000000;
/*152*/	  r2.z = sqrt(r2.z);
/*153*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*154*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*155*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*156*/	  r6.y = r2.z * r6.x;
/*157*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*158*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*159*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*160*/	  r2.x = r6.x * r2.z + r2.x;
/*161*/	  r2.z = r3.y * r3.y;
/*162*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*163*/	  r2.z = r2.z * r3.y + r7.x;
/*164*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*165*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*166*/	  r3.y = -r2.z * r2.z + 1.000000;
/*167*/	  r3.y = max(r3.y, 0.001000);
/*168*/	  r3.y = log2(r3.y);
/*169*/	  r5.y = r3.y * 4.950617;
/*170*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*171*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*172*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*173*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*174*/	  r2.z = floatBitsToInt(r2.z);
/*175*/	  r5.y = r3.y * r3.y + -r5.y;
/*176*/	  r5.y = sqrt(r5.y);
/*177*/	  r3.y = -r3.y + r5.y;
/*178*/	  r3.y = max(r3.y, 0.000000);
/*179*/	  r3.y = sqrt(r3.y);
/*180*/	  r2.z = r2.z * r3.y;
/*181*/	  r2.z = r2.z * 1.414214;
/*182*/	  r2.z = 0.008727 / r2.z;
/*183*/	  r2.z = max(r2.z, 0.000100);
/*184*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*185*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*186*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*187*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*188*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*189*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*190*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*191*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*192*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*193*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*194*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*195*/	  r2.x = floatBitsToInt(r2.x);
/*196*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*197*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*198*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*199*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*200*/	  r2.x = r2.x * r6.x + 1.000000;
/*201*/	  r2.x = r2.x * 0.500000;
/*202*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*203*/	  r2.z = r2.z * r6.y + 1.000000;
/*204*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*205*/	  r2.z = min(r2.y, 1.000000);
/*206*/	  r3.y = r5.x * 1.570796;
/*207*/	  r3.y = sin(r3.y);
/*208*/	  r2.z = r2.z + -1.000000;
/*209*/	  r2.z = r3.y * r2.z + 1.000000;
/*210*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*211*/	  r3.x = max(r3.x, 0.000000);
/*212*/	  r3.x = log2(r3.x);
/*213*/	  r3.x = r3.x * 10.000000;
/*214*/	  r3.x = exp2(r3.x);
/*215*/	  r3.x = r5.z * r3.x;
/*216*/	  r3.x = r3.x * r5.w + r1.w;
/*217*/	  r2.x = r2.z * abs(r2.x);
/*218*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*219*/	} else {
/*220*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*221*/	}
/*222*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*223*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*224*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*225*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*226*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*227*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*228*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*229*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*230*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*231*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*232*/	r1.x = sqrt(r2.w);
/*233*/	r1.y = saturate(cb2.data[0].w)/**/;
/*234*/	r1.y = -r1.y + 1.000000;
/*235*/	r1.y = r1.y * 8.000000 + -4.000000;
/*236*/	r1.z = saturate(cb2.data[1].x)/**/;
/*237*/	r1.z = -r1.z + 1.000000;
/*238*/	r1.z = r1.z * 1000.000000;
/*239*/	r1.x = r1.x / r1.z;
/*240*/	r1.x = r1.x + r1.y;
/*241*/	r1.x = r1.x * 1.442695;
/*242*/	r1.x = exp2(r1.x);
/*243*/	r1.x = cb2.data[1].y / r1.x;
/*244*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*245*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*246*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*247*/	r1.y = r1.y + -cb2.data[1].z;
/*248*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*249*/	r1.y = saturate(r1.z * r1.y);
/*250*/	r1.z = r1.y * -2.000000 + 3.000000;
/*251*/	r1.y = r1.y * r1.y;
/*252*/	r1.y = r1.y * r1.z;
/*253*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*254*/	r1.z = sqrt(r1.z);
/*255*/	r1.w = max(cb2.data[2].z, 0.001000);
/*256*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*257*/	r1.z = r1.w * r1.z;
/*258*/	r1.z = min(r1.z, 1.000000);
/*259*/	r1.w = r1.z * -2.000000 + 3.000000;
/*260*/	r1.z = r1.z * r1.z;
/*261*/	r1.z = r1.z * r1.w;
/*262*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*263*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*264*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*265*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*266*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*267*/	r4.w = max(r4.y, 0.000000);
/*268*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*269*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*270*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*271*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*272*/	r1.x = saturate(r1.x * r1.z);
/*273*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*274*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*275*/	color0.w = r0.w * vsOut_T6.w;
/*276*/	return;
}
