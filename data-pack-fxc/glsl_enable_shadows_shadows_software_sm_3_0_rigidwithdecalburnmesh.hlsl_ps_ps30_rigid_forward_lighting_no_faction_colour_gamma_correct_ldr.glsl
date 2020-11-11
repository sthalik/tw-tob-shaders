//
//
// Shader Model 4
// Fragment Shader
//
// id: 1151 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdecalburnmesh.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
  color0 = vec4(0);
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r3.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*24*/	r4.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*25*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*26*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*27*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*28*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*29*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*30*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*31*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*32*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*33*/	if(floatBitsToUint(r1.w) != 0u) {
/*34*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*35*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*37*/	  r1.w = -r1.w + 1.000000;
/*38*/	  r1.w = max(r1.w, 0.000000);
/*39*/	  r5.z = sqrt(r1.w);
/*40*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*41*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*42*/	  r1.w = r3.x * r7.w;
/*43*/	  r3.x = r1.w * -0.500000 + r3.x;
/*44*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*45*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*46*/	  r1.w = -r4.w * r6.w + 1.000000;
/*47*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*48*/	  r4.xyz = (-r0.xywx + r5.xyzx).xyz;
/*49*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*50*/	}
/*51*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*52*/	r4.x = 0;
/*53*/	r4.y = cb1.data[26].x * 0.050000;
/*54*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*55*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*56*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*57*/	r1.w = saturate(r4.x * 5.000000);
/*58*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*59*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*61*/	r2.w = log2(r5.z);
/*62*/	r2.w = r2.w * 1.800000;
/*63*/	r2.w = exp2(r2.w);
/*64*/	r2.w = r2.w * 10.000000;
/*65*/	r2.w = min(r2.w, 1.000000);
/*66*/	r1.w = r1.w + r2.w;
/*67*/	r1.w = r1.w * 0.500000;
/*68*/	r2.w = -r5.w + 1.000000;
/*69*/	r2.w = log2(r2.w);
/*70*/	r2.w = r2.w * vsOut_T7.x;
/*71*/	r2.w = exp2(r2.w);
/*72*/	r2.w = min(r2.w, 1.000000);
/*73*/	r2.w = r2.w * vsOut_T7.x;
/*74*/	r3.z = r5.z * 0.250000;
/*75*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*76*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*77*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*78*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*79*/	r1.w = vsOut_T7.x + -0.025000;
/*80*/	r1.w = max(r1.w, 0.000000);
/*81*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*82*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*83*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*89*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*92*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*93*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*94*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*95*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*96*/	r1.w = inversesqrt(r1.w);
/*97*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*98*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*99*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*100*/	if(floatBitsToUint(r0.w) != 0u) {
/*101*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*102*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*103*/	  r0.w = r3.w * cb1.data[26].x;
/*104*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*105*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*106*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*107*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*108*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*109*/	}
/*110*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*111*/	if(floatBitsToUint(r0.w) != 0u) {
/*112*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*113*/	  if(floatBitsToUint(r0.w) != 0u) {
/*114*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*115*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*116*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*117*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*118*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*119*/	    r0.w = -r0.w + 1.000000;
/*120*/	    r0.w = max(r0.w, 0.000000);
/*121*/	    r8.z = sqrt(r0.w);
/*122*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*123*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*124*/	    r0.w = inversesqrt(r0.w);
/*125*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*126*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*127*/	    r10.y = -1.000000;
/*128*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*129*/	    r0.w = inversesqrt(r0.w);
/*130*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*131*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*132*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*133*/	    r1.w = r1.w * 1.250000;
/*134*/	    r1.w = min(r1.w, 1.000000);
/*135*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*136*/	    r2.w = r2.w * 4.000000;
/*137*/	    r1.w = r1.w * 0.200000 + r2.w;
/*138*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*139*/	    r0.w = r0.w + -r1.w;
/*140*/	    r0.w = saturate(r0.w * 200.000000);
/*141*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*142*/	    r0.w = r0.w * r0.w;
/*143*/	    r0.w = r0.w * r1.w;
/*144*/	    r3.y = r0.w * -r3.y + r3.y;
/*145*/	    r1.w = -r3.x + 0.200000;
/*146*/	    r3.x = r0.w * r1.w + r3.x;
/*147*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*148*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*149*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*150*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*151*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*152*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*153*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*154*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*155*/	    r1.w = -r1.w + 1.000000;
/*156*/	    r1.w = max(r1.w, 0.000000);
/*157*/	    r7.z = sqrt(r1.w);
/*158*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*159*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*160*/	    r1.w = sqrt(r1.w);
/*161*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*162*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*163*/	    r1.w = inversesqrt(r1.w);
/*164*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*165*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*166*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*167*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*168*/	    r1.w = -r0.y + 1.000000;
/*169*/	    r0.w = min(r0.w, r1.w);
/*170*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*171*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*172*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*173*/	    r0.w = inversesqrt(r0.w);
/*174*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*175*/	  }
/*176*/	}
/*177*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*178*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*179*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*180*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*181*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*182*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*183*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*184*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*185*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*186*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*187*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*188*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*189*/	r1.w = inversesqrt(r1.w);
/*190*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*191*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*192*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*193*/	r2.w = inversesqrt(r1.w);
/*194*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*195*/	r2.w = -r3.y + 1.000000;
/*196*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*197*/	r5.y = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*198*/	r5.y = r5.y + r5.y;
/*199*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*200*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*201*/	r6.w = r2.w * 1.539380;
/*202*/	r6.w = cos((r6.w));
/*203*/	r6.w = inversesqrt(r6.w);
/*204*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*205*/	r7.x = saturate(r0.w * 60.000000);
/*206*/	r7.x = -r0.w + r7.x;
/*207*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*208*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*209*/	r8.x = inversesqrt(r8.x);
/*210*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*211*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*212*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*213*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*214*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*215*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*216*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*217*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*218*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*219*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*220*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*221*/	r6.y = -r0.w + 1.000000;
/*222*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*223*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*224*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*225*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*226*/	  r6.y = max(r6.y, 0.000000);
/*227*/	  r6.y = log2(r6.y);
/*228*/	  r6.y = r6.y * 10.000000;
/*229*/	  r6.y = exp2(r6.y);
/*230*/	  r6.y = r6.w * r6.y;
/*231*/	  r6.y = r6.y * r7.x + r0.w;
/*232*/	  r8.x = r2.w * 8.000000;
/*233*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*234*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*235*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*236*/	}
/*237*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*238*/	r0.y = max(r0.x, 0.000000);
/*239*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*240*/	if(floatBitsToUint(r0.x) != 0u) {
/*241*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*242*/	  r0.x = max(r0.x, -1.000000);
/*243*/	  r0.x = min(r0.x, 1.000000);
/*244*/	  r0.z = -abs(r0.x) + 1.000000;
/*245*/	  r0.z = sqrt(r0.z);
/*246*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*247*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*248*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*249*/	  r5.z = r0.z * r5.y;
/*250*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*251*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*252*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*253*/	  r0.x = r5.y * r0.z + r0.x;
/*254*/	  r0.z = r3.y * r3.y;
/*255*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*256*/	  r0.z = r0.z * r3.y + r6.x;
/*257*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*258*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*259*/	  r3.y = -r0.z * r0.z + 1.000000;
/*260*/	  r3.y = max(r3.y, 0.001000);
/*261*/	  r3.y = log2(r3.y);
/*262*/	  r5.x = r3.y * 4.950617;
/*263*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*264*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*265*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*266*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*267*/	  r0.z = floatBitsToInt(r0.z);
/*268*/	  r5.x = r3.y * r3.y + -r5.x;
/*269*/	  r5.x = sqrt(r5.x);
/*270*/	  r3.y = -r3.y + r5.x;
/*271*/	  r3.y = max(r3.y, 0.000000);
/*272*/	  r3.y = sqrt(r3.y);
/*273*/	  r0.z = r0.z * r3.y;
/*274*/	  r0.z = r0.z * 1.414214;
/*275*/	  r0.z = 0.008727 / r0.z;
/*276*/	  r0.z = max(r0.z, 0.000100);
/*277*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*278*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*279*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*280*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*281*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*282*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*283*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*284*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*285*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*286*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*287*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*288*/	  r0.x = floatBitsToInt(r0.x);
/*289*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*290*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*291*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*292*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*293*/	  r0.x = r0.x * r5.x + 1.000000;
/*294*/	  r0.x = r0.x * 0.500000;
/*295*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*296*/	  r0.z = r0.z * r5.y + 1.000000;
/*297*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*298*/	  r0.z = min(r0.y, 1.000000);
/*299*/	  r2.w = r2.w * 1.570796;
/*300*/	  r2.w = sin(r2.w);
/*301*/	  r0.z = r0.z + -1.000000;
/*302*/	  r0.z = r2.w * r0.z + 1.000000;
/*303*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*304*/	  r2.w = max(r2.w, 0.000000);
/*305*/	  r2.w = log2(r2.w);
/*306*/	  r2.w = r2.w * 10.000000;
/*307*/	  r2.w = exp2(r2.w);
/*308*/	  r2.w = r6.w * r2.w;
/*309*/	  r2.w = r2.w * r7.x + r0.w;
/*310*/	  r0.x = r0.z * abs(r0.x);
/*311*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*312*/	} else {
/*313*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*314*/	}
/*315*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*316*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*317*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*318*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*319*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*320*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*321*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*322*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*323*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*324*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*325*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*326*/	r2.w = 1.000000;
/*327*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*328*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*329*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*330*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*331*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*332*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*333*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*334*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*335*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*336*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*337*/	if(r0.w != 0) discard;
/*338*/	r0.w = sqrt(r1.w);
/*339*/	r1.x = saturate(cb3.data[0].w)/**/;
/*340*/	r1.x = -r1.x + 1.000000;
/*341*/	r1.x = r1.x * 8.000000 + -4.000000;
/*342*/	r1.y = saturate(cb3.data[1].x)/**/;
/*343*/	r1.y = -r1.y + 1.000000;
/*344*/	r1.y = r1.y * 1000.000000;
/*345*/	r0.w = r0.w / r1.y;
/*346*/	r0.w = r0.w + r1.x;
/*347*/	r0.w = r0.w * 1.442695;
/*348*/	r0.w = exp2(r0.w);
/*349*/	r0.w = cb3.data[1].y / r0.w;
/*350*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*351*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*352*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*353*/	r1.x = r1.x + -cb3.data[1].z;
/*354*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*355*/	r1.x = saturate(r1.y * r1.x);
/*356*/	r1.y = r1.x * -2.000000 + 3.000000;
/*357*/	r1.x = r1.x * r1.x;
/*358*/	r1.x = r1.x * r1.y;
/*359*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*360*/	r1.y = sqrt(r1.y);
/*361*/	r1.z = max(cb3.data[2].z, 0.001000);
/*362*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*363*/	r1.y = r1.z * r1.y;
/*364*/	r1.y = min(r1.y, 1.000000);
/*365*/	r1.z = r1.y * -2.000000 + 3.000000;
/*366*/	r1.y = r1.y * r1.y;
/*367*/	r1.y = r1.y * r1.z;
/*368*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*369*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*370*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*371*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*372*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*373*/	r4.w = max(r4.y, 0.000000);
/*374*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*375*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*376*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*377*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*378*/	r0.w = saturate(r0.w * r1.y);
/*379*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*380*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*381*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*382*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*383*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*384*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*385*/	return;
}
