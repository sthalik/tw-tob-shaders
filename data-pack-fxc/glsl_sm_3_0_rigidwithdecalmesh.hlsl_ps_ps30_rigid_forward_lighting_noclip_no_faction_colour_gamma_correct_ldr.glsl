//
//
// Shader Model 4
// Fragment Shader
//
// id: 1094 - fxc/glsl_SM_3_0_rigidwithdecalmesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C2;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;

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
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb4;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
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

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.x = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb5.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r3.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*20*/	r4.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*21*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*22*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*23*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*24*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*25*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*26*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*27*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*29*/	if(floatBitsToUint(r1.w) != 0u) {
/*30*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*31*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*33*/	  r1.w = -r1.w + 1.000000;
/*34*/	  r1.w = max(r1.w, 0.000000);
/*35*/	  r5.z = sqrt(r1.w);
/*36*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*37*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*38*/	  r1.w = r3.x * r7.w;
/*39*/	  r3.x = r1.w * -0.500000 + r3.x;
/*40*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*41*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*42*/	  r1.w = -r4.w * r6.w + 1.000000;
/*43*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*44*/	  r4.xyz = (-r0.xywx + r5.xyzx).xyz;
/*45*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*46*/	}
/*47*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*50*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*51*/	r1.w = inversesqrt(r1.w);
/*52*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*53*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*56*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*57*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*58*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*59*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*60*/	r1.w = inversesqrt(r1.w);
/*61*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*62*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*63*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*64*/	if(floatBitsToUint(r0.w) != 0u) {
/*65*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*66*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*67*/	  r0.w = r3.w * cb1.data[26].x;
/*68*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*69*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*70*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*71*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*72*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*73*/	}
/*74*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*75*/	if(floatBitsToUint(r0.w) != 0u) {
/*76*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*77*/	  if(floatBitsToUint(r0.w) != 0u) {
/*78*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*79*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*80*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*81*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*82*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*83*/	    r0.w = -r0.w + 1.000000;
/*84*/	    r0.w = max(r0.w, 0.000000);
/*85*/	    r8.z = sqrt(r0.w);
/*86*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*87*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*88*/	    r0.w = inversesqrt(r0.w);
/*89*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*90*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*91*/	    r10.y = -1.000000;
/*92*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*93*/	    r0.w = inversesqrt(r0.w);
/*94*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*95*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*96*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*97*/	    r1.w = r1.w * 1.250000;
/*98*/	    r1.w = min(r1.w, 1.000000);
/*99*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*100*/	    r2.w = r2.w * 4.000000;
/*101*/	    r1.w = r1.w * 0.200000 + r2.w;
/*102*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*103*/	    r0.w = r0.w + -r1.w;
/*104*/	    r0.w = saturate(r0.w * 200.000000);
/*105*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*106*/	    r0.w = r0.w * r0.w;
/*107*/	    r0.w = r0.w * r1.w;
/*108*/	    r3.y = r0.w * -r3.y + r3.y;
/*109*/	    r1.w = -r3.x + 0.200000;
/*110*/	    r3.x = r0.w * r1.w + r3.x;
/*111*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*112*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*113*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*114*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*115*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*116*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*117*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*118*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*119*/	    r1.w = -r1.w + 1.000000;
/*120*/	    r1.w = max(r1.w, 0.000000);
/*121*/	    r7.z = sqrt(r1.w);
/*122*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*123*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*124*/	    r1.w = sqrt(r1.w);
/*125*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*126*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*127*/	    r1.w = inversesqrt(r1.w);
/*128*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*129*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*130*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*131*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*132*/	    r1.w = -r0.y + 1.000000;
/*133*/	    r0.w = min(r0.w, r1.w);
/*134*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*135*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*136*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*137*/	    r0.w = inversesqrt(r0.w);
/*138*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*139*/	  }
/*140*/	}
/*141*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*142*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*143*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*144*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*145*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*146*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*147*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*148*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*149*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*150*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*151*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*152*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*153*/	r1.w = inversesqrt(r1.w);
/*154*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*155*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*156*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*157*/	r2.w = inversesqrt(r1.w);
/*158*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*159*/	r2.w = -r3.y + 1.000000;
/*160*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*161*/	r5.y = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*162*/	r5.y = r5.y + r5.y;
/*163*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*164*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*165*/	r6.w = r2.w * 1.539380;
/*166*/	r6.w = cos((r6.w));
/*167*/	r6.w = inversesqrt(r6.w);
/*168*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*169*/	r7.x = saturate(r0.w * 60.000000);
/*170*/	r7.x = -r0.w + r7.x;
/*171*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*172*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*173*/	r8.x = inversesqrt(r8.x);
/*174*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*175*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*176*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*177*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*178*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*179*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*180*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*181*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*182*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*183*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*184*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*185*/	r6.y = -r0.w + 1.000000;
/*186*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*187*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*188*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*189*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*190*/	  r6.y = max(r6.y, 0.000000);
/*191*/	  r6.y = log2(r6.y);
/*192*/	  r6.y = r6.y * 10.000000;
/*193*/	  r6.y = exp2(r6.y);
/*194*/	  r6.y = r6.w * r6.y;
/*195*/	  r6.y = r6.y * r7.x + r0.w;
/*196*/	  r8.x = r2.w * 8.000000;
/*197*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*198*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*199*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*200*/	}
/*201*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*202*/	r0.y = max(r0.x, 0.000000);
/*203*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*204*/	if(floatBitsToUint(r0.x) != 0u) {
/*205*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*206*/	  r0.x = max(r0.x, -1.000000);
/*207*/	  r0.x = min(r0.x, 1.000000);
/*208*/	  r0.z = -abs(r0.x) + 1.000000;
/*209*/	  r0.z = sqrt(r0.z);
/*210*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*211*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*212*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*213*/	  r5.z = r0.z * r5.y;
/*214*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*215*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*216*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*217*/	  r0.x = r5.y * r0.z + r0.x;
/*218*/	  r0.z = r3.y * r3.y;
/*219*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*220*/	  r0.z = r0.z * r3.y + r6.x;
/*221*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*222*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*223*/	  r3.y = -r0.z * r0.z + 1.000000;
/*224*/	  r3.y = max(r3.y, 0.001000);
/*225*/	  r3.y = log2(r3.y);
/*226*/	  r5.x = r3.y * 4.950617;
/*227*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*228*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*229*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*230*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*231*/	  r0.z = floatBitsToInt(r0.z);
/*232*/	  r5.x = r3.y * r3.y + -r5.x;
/*233*/	  r5.x = sqrt(r5.x);
/*234*/	  r3.y = -r3.y + r5.x;
/*235*/	  r3.y = max(r3.y, 0.000000);
/*236*/	  r3.y = sqrt(r3.y);
/*237*/	  r0.z = r0.z * r3.y;
/*238*/	  r0.z = r0.z * 1.414214;
/*239*/	  r0.z = 0.008727 / r0.z;
/*240*/	  r0.z = max(r0.z, 0.000100);
/*241*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*242*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*243*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*244*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*245*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*246*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*247*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*248*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*249*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*250*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*251*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*252*/	  r0.x = floatBitsToInt(r0.x);
/*253*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*254*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*255*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*256*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*257*/	  r0.x = r0.x * r5.x + 1.000000;
/*258*/	  r0.x = r0.x * 0.500000;
/*259*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*260*/	  r0.z = r0.z * r5.y + 1.000000;
/*261*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*262*/	  r0.z = min(r0.y, 1.000000);
/*263*/	  r2.w = r2.w * 1.570796;
/*264*/	  r2.w = sin(r2.w);
/*265*/	  r0.z = r0.z + -1.000000;
/*266*/	  r0.z = r2.w * r0.z + 1.000000;
/*267*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*268*/	  r2.w = max(r2.w, 0.000000);
/*269*/	  r2.w = log2(r2.w);
/*270*/	  r2.w = r2.w * 10.000000;
/*271*/	  r2.w = exp2(r2.w);
/*272*/	  r2.w = r6.w * r2.w;
/*273*/	  r2.w = r2.w * r7.x + r0.w;
/*274*/	  r0.x = r0.z * abs(r0.x);
/*275*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*276*/	} else {
/*277*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*278*/	}
/*279*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*280*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*281*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*282*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*283*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*284*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*285*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*286*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*287*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*288*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*289*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*290*/	r2.w = 1.000000;
/*291*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*292*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*293*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*294*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*295*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*296*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*297*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*298*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*299*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*300*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*301*/	if(r0.w != 0) discard;
/*302*/	r0.w = sqrt(r1.w);
/*303*/	r1.x = saturate(cb3.data[0].w)/**/;
/*304*/	r1.x = -r1.x + 1.000000;
/*305*/	r1.x = r1.x * 8.000000 + -4.000000;
/*306*/	r1.y = saturate(cb3.data[1].x)/**/;
/*307*/	r1.y = -r1.y + 1.000000;
/*308*/	r1.y = r1.y * 1000.000000;
/*309*/	r0.w = r0.w / r1.y;
/*310*/	r0.w = r0.w + r1.x;
/*311*/	r0.w = r0.w * 1.442695;
/*312*/	r0.w = exp2(r0.w);
/*313*/	r0.w = cb3.data[1].y / r0.w;
/*314*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*315*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*316*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*317*/	r1.x = r1.x + -cb3.data[1].z;
/*318*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*319*/	r1.x = saturate(r1.y * r1.x);
/*320*/	r1.y = r1.x * -2.000000 + 3.000000;
/*321*/	r1.x = r1.x * r1.x;
/*322*/	r1.x = r1.x * r1.y;
/*323*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*324*/	r1.y = sqrt(r1.y);
/*325*/	r1.z = max(cb3.data[2].z, 0.001000);
/*326*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*327*/	r1.y = r1.z * r1.y;
/*328*/	r1.y = min(r1.y, 1.000000);
/*329*/	r1.z = r1.y * -2.000000 + 3.000000;
/*330*/	r1.y = r1.y * r1.y;
/*331*/	r1.y = r1.y * r1.z;
/*332*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*333*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*334*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*335*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*336*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*337*/	r4.w = max(r4.y, 0.000000);
/*338*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*339*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*340*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*341*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*342*/	r0.w = saturate(r0.w * r1.y);
/*343*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*344*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*345*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*346*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*347*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*348*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*349*/	return;
}
