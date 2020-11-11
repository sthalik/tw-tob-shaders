//
//
// Shader Model 4
// Fragment Shader
//
// id: 1169 - fxc/glsl_SM_3_0_rigidwithdecalburnmesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
/*47*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*48*/	r4.x = 0;
/*49*/	r4.y = cb1.data[26].x * 0.050000;
/*50*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*51*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*52*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*53*/	r1.w = saturate(r4.x * 5.000000);
/*54*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*55*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*57*/	r2.w = log2(r5.z);
/*58*/	r2.w = r2.w * 1.800000;
/*59*/	r2.w = exp2(r2.w);
/*60*/	r2.w = r2.w * 10.000000;
/*61*/	r2.w = min(r2.w, 1.000000);
/*62*/	r1.w = r1.w + r2.w;
/*63*/	r1.w = r1.w * 0.500000;
/*64*/	r2.w = -r5.w + 1.000000;
/*65*/	r2.w = log2(r2.w);
/*66*/	r2.w = r2.w * vsOut_T7.x;
/*67*/	r2.w = exp2(r2.w);
/*68*/	r2.w = min(r2.w, 1.000000);
/*69*/	r2.w = r2.w * vsOut_T7.x;
/*70*/	r3.z = r5.z * 0.250000;
/*71*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*72*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*73*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*74*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*75*/	r1.w = vsOut_T7.x + -0.025000;
/*76*/	r1.w = max(r1.w, 0.000000);
/*77*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*78*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*79*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*82*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*85*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*86*/	r1.w = inversesqrt(r1.w);
/*87*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*88*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*89*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*90*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*91*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*92*/	r1.w = inversesqrt(r1.w);
/*93*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*94*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*95*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*96*/	if(floatBitsToUint(r0.w) != 0u) {
/*97*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*98*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*99*/	  r0.w = r3.w * cb1.data[26].x;
/*100*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*101*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*102*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*103*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*104*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*105*/	}
/*106*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*107*/	if(floatBitsToUint(r0.w) != 0u) {
/*108*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*109*/	  if(floatBitsToUint(r0.w) != 0u) {
/*110*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*111*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*112*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*113*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*114*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*115*/	    r0.w = -r0.w + 1.000000;
/*116*/	    r0.w = max(r0.w, 0.000000);
/*117*/	    r8.z = sqrt(r0.w);
/*118*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*119*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*120*/	    r0.w = inversesqrt(r0.w);
/*121*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*122*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*123*/	    r10.y = -1.000000;
/*124*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*125*/	    r0.w = inversesqrt(r0.w);
/*126*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*127*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*128*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*129*/	    r1.w = r1.w * 1.250000;
/*130*/	    r1.w = min(r1.w, 1.000000);
/*131*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*132*/	    r2.w = r2.w * 4.000000;
/*133*/	    r1.w = r1.w * 0.200000 + r2.w;
/*134*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*135*/	    r0.w = r0.w + -r1.w;
/*136*/	    r0.w = saturate(r0.w * 200.000000);
/*137*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*138*/	    r0.w = r0.w * r0.w;
/*139*/	    r0.w = r0.w * r1.w;
/*140*/	    r3.y = r0.w * -r3.y + r3.y;
/*141*/	    r1.w = -r3.x + 0.200000;
/*142*/	    r3.x = r0.w * r1.w + r3.x;
/*143*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*144*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*145*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*146*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*147*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*148*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*149*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*150*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*151*/	    r1.w = -r1.w + 1.000000;
/*152*/	    r1.w = max(r1.w, 0.000000);
/*153*/	    r7.z = sqrt(r1.w);
/*154*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*155*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*156*/	    r1.w = sqrt(r1.w);
/*157*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*158*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*159*/	    r1.w = inversesqrt(r1.w);
/*160*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*161*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*162*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*163*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*164*/	    r1.w = -r0.y + 1.000000;
/*165*/	    r0.w = min(r0.w, r1.w);
/*166*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*167*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*168*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*169*/	    r0.w = inversesqrt(r0.w);
/*170*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*171*/	  }
/*172*/	}
/*173*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*174*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*175*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*176*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*177*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*178*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*179*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*180*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*181*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*182*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*183*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*184*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*185*/	r1.w = inversesqrt(r1.w);
/*186*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*187*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*188*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*189*/	r2.w = inversesqrt(r1.w);
/*190*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*191*/	r2.w = -r3.y + 1.000000;
/*192*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*193*/	r5.y = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*194*/	r5.y = r5.y + r5.y;
/*195*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*196*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*197*/	r6.w = r2.w * 1.539380;
/*198*/	r6.w = cos((r6.w));
/*199*/	r6.w = inversesqrt(r6.w);
/*200*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*201*/	r7.x = saturate(r0.w * 60.000000);
/*202*/	r7.x = -r0.w + r7.x;
/*203*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*204*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*205*/	r8.x = inversesqrt(r8.x);
/*206*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*207*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*208*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*209*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*210*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*211*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*212*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*213*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*214*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*215*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*216*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*217*/	r6.y = -r0.w + 1.000000;
/*218*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*219*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*220*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*221*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*222*/	  r6.y = max(r6.y, 0.000000);
/*223*/	  r6.y = log2(r6.y);
/*224*/	  r6.y = r6.y * 10.000000;
/*225*/	  r6.y = exp2(r6.y);
/*226*/	  r6.y = r6.w * r6.y;
/*227*/	  r6.y = r6.y * r7.x + r0.w;
/*228*/	  r8.x = r2.w * 8.000000;
/*229*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*230*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*231*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*232*/	}
/*233*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*234*/	r0.y = max(r0.x, 0.000000);
/*235*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*236*/	if(floatBitsToUint(r0.x) != 0u) {
/*237*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*238*/	  r0.x = max(r0.x, -1.000000);
/*239*/	  r0.x = min(r0.x, 1.000000);
/*240*/	  r0.z = -abs(r0.x) + 1.000000;
/*241*/	  r0.z = sqrt(r0.z);
/*242*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*243*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*244*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*245*/	  r5.z = r0.z * r5.y;
/*246*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*247*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*248*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*249*/	  r0.x = r5.y * r0.z + r0.x;
/*250*/	  r0.z = r3.y * r3.y;
/*251*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*252*/	  r0.z = r0.z * r3.y + r6.x;
/*253*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*254*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*255*/	  r3.y = -r0.z * r0.z + 1.000000;
/*256*/	  r3.y = max(r3.y, 0.001000);
/*257*/	  r3.y = log2(r3.y);
/*258*/	  r5.x = r3.y * 4.950617;
/*259*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*260*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*261*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*262*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*263*/	  r0.z = floatBitsToInt(r0.z);
/*264*/	  r5.x = r3.y * r3.y + -r5.x;
/*265*/	  r5.x = sqrt(r5.x);
/*266*/	  r3.y = -r3.y + r5.x;
/*267*/	  r3.y = max(r3.y, 0.000000);
/*268*/	  r3.y = sqrt(r3.y);
/*269*/	  r0.z = r0.z * r3.y;
/*270*/	  r0.z = r0.z * 1.414214;
/*271*/	  r0.z = 0.008727 / r0.z;
/*272*/	  r0.z = max(r0.z, 0.000100);
/*273*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*274*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*275*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*276*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*277*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*278*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*279*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*280*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*281*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*282*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*283*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*284*/	  r0.x = floatBitsToInt(r0.x);
/*285*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*286*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*287*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*288*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*289*/	  r0.x = r0.x * r5.x + 1.000000;
/*290*/	  r0.x = r0.x * 0.500000;
/*291*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*292*/	  r0.z = r0.z * r5.y + 1.000000;
/*293*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*294*/	  r0.z = min(r0.y, 1.000000);
/*295*/	  r2.w = r2.w * 1.570796;
/*296*/	  r2.w = sin(r2.w);
/*297*/	  r0.z = r0.z + -1.000000;
/*298*/	  r0.z = r2.w * r0.z + 1.000000;
/*299*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*300*/	  r2.w = max(r2.w, 0.000000);
/*301*/	  r2.w = log2(r2.w);
/*302*/	  r2.w = r2.w * 10.000000;
/*303*/	  r2.w = exp2(r2.w);
/*304*/	  r2.w = r6.w * r2.w;
/*305*/	  r2.w = r2.w * r7.x + r0.w;
/*306*/	  r0.x = r0.z * abs(r0.x);
/*307*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*308*/	} else {
/*309*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*310*/	}
/*311*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*312*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*313*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*314*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*315*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*316*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*317*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*318*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*319*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*320*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*321*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*322*/	r2.w = 1.000000;
/*323*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*324*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*325*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*326*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*327*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*328*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*329*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*330*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*331*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*332*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*333*/	if(r0.w != 0) discard;
/*334*/	r0.w = sqrt(r1.w);
/*335*/	r1.x = saturate(cb3.data[0].w)/**/;
/*336*/	r1.x = -r1.x + 1.000000;
/*337*/	r1.x = r1.x * 8.000000 + -4.000000;
/*338*/	r1.y = saturate(cb3.data[1].x)/**/;
/*339*/	r1.y = -r1.y + 1.000000;
/*340*/	r1.y = r1.y * 1000.000000;
/*341*/	r0.w = r0.w / r1.y;
/*342*/	r0.w = r0.w + r1.x;
/*343*/	r0.w = r0.w * 1.442695;
/*344*/	r0.w = exp2(r0.w);
/*345*/	r0.w = cb3.data[1].y / r0.w;
/*346*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*347*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*348*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*349*/	r1.x = r1.x + -cb3.data[1].z;
/*350*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*351*/	r1.x = saturate(r1.y * r1.x);
/*352*/	r1.y = r1.x * -2.000000 + 3.000000;
/*353*/	r1.x = r1.x * r1.x;
/*354*/	r1.x = r1.x * r1.y;
/*355*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*356*/	r1.y = sqrt(r1.y);
/*357*/	r1.z = max(cb3.data[2].z, 0.001000);
/*358*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*359*/	r1.y = r1.z * r1.y;
/*360*/	r1.y = min(r1.y, 1.000000);
/*361*/	r1.z = r1.y * -2.000000 + 3.000000;
/*362*/	r1.y = r1.y * r1.y;
/*363*/	r1.y = r1.y * r1.z;
/*364*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*365*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*366*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*367*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*368*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*369*/	r4.w = max(r4.y, 0.000000);
/*370*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*371*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*372*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*373*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*374*/	r0.w = saturate(r0.w * r1.y);
/*375*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*376*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*377*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*378*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*379*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*380*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*381*/	return;
}
