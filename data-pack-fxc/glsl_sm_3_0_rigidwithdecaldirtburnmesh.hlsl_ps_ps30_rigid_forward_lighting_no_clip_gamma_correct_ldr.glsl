//
//
// Shader Model 4
// Fragment Shader
//
// id: 1035 - fxc/glsl_SM_3_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps30_rigid_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_N0;
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
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb6;

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
/*11*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*13*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*14*/	r0.x = saturate(vsOut_N0.w);
/*15*/	r5.xyz = (r5.xyzx + -cb6.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb6.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb6.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb6.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb6.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb6.data[2].xyxz).xyw;
/*23*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*25*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*27*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*28*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*29*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*33*/	r1.w = -r1.w + 1.000000;
/*34*/	r1.w = max(r1.w, 0.000000);
/*35*/	r1.z = sqrt(r1.w);
/*36*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r3.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*38*/	r4.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*39*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*40*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*41*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*42*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*43*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*44*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*45*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*46*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*47*/	if(floatBitsToUint(r1.w) != 0u) {
/*48*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*49*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*50*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*51*/	  r1.w = -r1.w + 1.000000;
/*52*/	  r1.w = max(r1.w, 0.000000);
/*53*/	  r5.z = sqrt(r1.w);
/*54*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*55*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*56*/	  r1.w = r3.x * r7.w;
/*57*/	  r3.x = r1.w * -0.500000 + r3.x;
/*58*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*59*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*60*/	  r1.w = -r4.w * r6.w + 1.000000;
/*61*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*62*/	  r4.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*63*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*64*/	}
/*65*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*66*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.yyyz).zw;
/*67*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*68*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*69*/	r1.w = r4.w * r5.w;
/*70*/	r4.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*71*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*72*/	r1.xy = (r3.zwzz * r4.wwww + r1.xyxx).xy;
/*73*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*74*/	r2.w = inversesqrt(r2.w);
/*75*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*76*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*77*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*78*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*79*/	r4.x = 0;
/*80*/	r4.y = cb1.data[26].x * 0.050000;
/*81*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*82*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*83*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*84*/	r1.w = saturate(r4.x * 5.000000);
/*85*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*86*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*87*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*88*/	r2.w = log2(r5.z);
/*89*/	r2.w = r2.w * 1.800000;
/*90*/	r2.w = exp2(r2.w);
/*91*/	r2.w = r2.w * 10.000000;
/*92*/	r2.w = min(r2.w, 1.000000);
/*93*/	r1.w = r1.w + r2.w;
/*94*/	r1.w = r1.w * 0.500000;
/*95*/	r2.w = -r5.w + 1.000000;
/*96*/	r2.w = log2(r2.w);
/*97*/	r2.w = r2.w * vsOut_T7.x;
/*98*/	r2.w = exp2(r2.w);
/*99*/	r2.w = min(r2.w, 1.000000);
/*100*/	r2.w = r2.w * vsOut_T7.x;
/*101*/	r3.z = r5.z * 0.250000;
/*102*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*103*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*104*/	r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*105*/	r0.xyw = (r2.wwww * r4.xyxz + r0.xyxw).xyw;
/*106*/	r1.w = vsOut_T7.x + -0.025000;
/*107*/	r1.w = max(r1.w, 0.000000);
/*108*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*109*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*110*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*111*/	r1.w = inversesqrt(r1.w);
/*112*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*113*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*114*/	r1.w = inversesqrt(r1.w);
/*115*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*116*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*117*/	r1.w = inversesqrt(r1.w);
/*118*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*119*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*120*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*121*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*122*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*123*/	r1.w = inversesqrt(r1.w);
/*124*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*125*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*126*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*127*/	if(floatBitsToUint(r0.z) != 0u) {
/*128*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*129*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*130*/	  r0.z = r3.w * cb1.data[26].x;
/*131*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*132*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*133*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*134*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*135*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*136*/	}
/*137*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*138*/	if(floatBitsToUint(r0.z) != 0u) {
/*139*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*140*/	  if(floatBitsToUint(r0.z) != 0u) {
/*141*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*142*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*143*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*144*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*145*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*146*/	    r0.z = -r0.z + 1.000000;
/*147*/	    r0.z = max(r0.z, 0.000000);
/*148*/	    r8.z = sqrt(r0.z);
/*149*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*150*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*151*/	    r0.z = inversesqrt(r0.z);
/*152*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*153*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*154*/	    r10.y = -1.000000;
/*155*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*156*/	    r0.z = inversesqrt(r0.z);
/*157*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*158*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*159*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*160*/	    r1.w = r1.w * 1.250000;
/*161*/	    r1.w = min(r1.w, 1.000000);
/*162*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*163*/	    r2.w = r2.w * 4.000000;
/*164*/	    r1.w = r1.w * 0.200000 + r2.w;
/*165*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*166*/	    r0.z = r0.z + -r1.w;
/*167*/	    r0.z = saturate(r0.z * 200.000000);
/*168*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*169*/	    r0.z = r0.z * r0.z;
/*170*/	    r0.z = r0.z * r1.w;
/*171*/	    r3.y = r0.z * -r3.y + r3.y;
/*172*/	    r1.w = -r3.x + 0.200000;
/*173*/	    r3.x = r0.z * r1.w + r3.x;
/*174*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*175*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*176*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*177*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*178*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*179*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*180*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*181*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*182*/	    r1.w = -r1.w + 1.000000;
/*183*/	    r1.w = max(r1.w, 0.000000);
/*184*/	    r7.z = sqrt(r1.w);
/*185*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*186*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*187*/	    r1.w = sqrt(r1.w);
/*188*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*189*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*190*/	    r1.w = inversesqrt(r1.w);
/*191*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*192*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*193*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*194*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*195*/	    r1.w = -r1.y + 1.000000;
/*196*/	    r0.z = min(r0.z, r1.w);
/*197*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*198*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*199*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*200*/	    r0.z = inversesqrt(r0.z);
/*201*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*202*/	  }
/*203*/	}
/*204*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*205*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*206*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*207*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*208*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*209*/	r3.xzw = (-r0.xxyw + r1.wwww).xzw;
/*210*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*211*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*212*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*213*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*214*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*215*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*216*/	r1.w = inversesqrt(r1.w);
/*217*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*218*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*219*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*220*/	r2.w = inversesqrt(r1.w);
/*221*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*222*/	r2.w = -r3.y + 1.000000;
/*223*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*224*/	r5.y = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*225*/	r5.y = r5.y + r5.y;
/*226*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*227*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*228*/	r6.w = r2.w * 1.539380;
/*229*/	r6.w = cos((r6.w));
/*230*/	r6.w = inversesqrt(r6.w);
/*231*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*232*/	r7.x = saturate(r0.z * 60.000000);
/*233*/	r7.x = -r0.z + r7.x;
/*234*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*235*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*236*/	r8.x = inversesqrt(r8.x);
/*237*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*238*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*239*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*240*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*241*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*242*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*243*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*244*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*245*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*246*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*247*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*248*/	r6.y = -r0.z + 1.000000;
/*249*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*250*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*251*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*252*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*253*/	  r6.y = max(r6.y, 0.000000);
/*254*/	  r6.y = log2(r6.y);
/*255*/	  r6.y = r6.y * 10.000000;
/*256*/	  r6.y = exp2(r6.y);
/*257*/	  r6.y = r6.w * r6.y;
/*258*/	  r6.y = r6.y * r7.x + r0.z;
/*259*/	  r8.x = r2.w * 8.000000;
/*260*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*261*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*262*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*263*/	}
/*264*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*265*/	r1.y = max(r1.x, 0.000000);
/*266*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*267*/	if(floatBitsToUint(r1.x) != 0u) {
/*268*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*269*/	  r1.x = max(r1.x, -1.000000);
/*270*/	  r1.x = min(r1.x, 1.000000);
/*271*/	  r1.z = -abs(r1.x) + 1.000000;
/*272*/	  r1.z = sqrt(r1.z);
/*273*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*274*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*275*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*276*/	  r5.z = r1.z * r5.y;
/*277*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*278*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*279*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*280*/	  r1.x = r5.y * r1.z + r1.x;
/*281*/	  r1.z = r3.y * r3.y;
/*282*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*283*/	  r1.z = r1.z * r3.y + r6.x;
/*284*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*285*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*286*/	  r3.y = -r1.z * r1.z + 1.000000;
/*287*/	  r3.y = max(r3.y, 0.001000);
/*288*/	  r3.y = log2(r3.y);
/*289*/	  r5.x = r3.y * 4.950617;
/*290*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*291*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*292*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*293*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*294*/	  r1.z = floatBitsToInt(r1.z);
/*295*/	  r5.x = r3.y * r3.y + -r5.x;
/*296*/	  r5.x = sqrt(r5.x);
/*297*/	  r3.y = -r3.y + r5.x;
/*298*/	  r3.y = max(r3.y, 0.000000);
/*299*/	  r3.y = sqrt(r3.y);
/*300*/	  r1.z = r1.z * r3.y;
/*301*/	  r1.z = r1.z * 1.414214;
/*302*/	  r1.z = 0.008727 / r1.z;
/*303*/	  r1.z = max(r1.z, 0.000100);
/*304*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*305*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*306*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*307*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*308*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*309*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*310*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*311*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*312*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*313*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*314*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*315*/	  r1.x = floatBitsToInt(r1.x);
/*316*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*317*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*318*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*319*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*320*/	  r1.x = r1.x * r5.x + 1.000000;
/*321*/	  r1.x = r1.x * 0.500000;
/*322*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*323*/	  r1.z = r1.z * r5.y + 1.000000;
/*324*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*325*/	  r1.z = min(r1.y, 1.000000);
/*326*/	  r2.w = r2.w * 1.570796;
/*327*/	  r2.w = sin(r2.w);
/*328*/	  r1.z = r1.z + -1.000000;
/*329*/	  r1.z = r2.w * r1.z + 1.000000;
/*330*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*331*/	  r2.w = max(r2.w, 0.000000);
/*332*/	  r2.w = log2(r2.w);
/*333*/	  r2.w = r2.w * 10.000000;
/*334*/	  r2.w = exp2(r2.w);
/*335*/	  r2.w = r6.w * r2.w;
/*336*/	  r2.w = r2.w * r7.x + r0.z;
/*337*/	  r1.x = r1.z * abs(r1.x);
/*338*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*339*/	} else {
/*340*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*341*/	}
/*342*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*343*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*344*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*345*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*346*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*347*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*348*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*349*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*350*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*351*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*352*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*353*/	r2.w = 1.000000;
/*354*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*355*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*356*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*357*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*358*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*359*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*360*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*361*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*362*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*363*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*364*/	if(r0.w != 0) discard;
/*365*/	r0.w = sqrt(r1.w);
/*366*/	r1.x = saturate(cb3.data[0].w)/**/;
/*367*/	r1.x = -r1.x + 1.000000;
/*368*/	r1.x = r1.x * 8.000000 + -4.000000;
/*369*/	r1.y = saturate(cb3.data[1].x)/**/;
/*370*/	r1.y = -r1.y + 1.000000;
/*371*/	r1.y = r1.y * 1000.000000;
/*372*/	r0.w = r0.w / r1.y;
/*373*/	r0.w = r0.w + r1.x;
/*374*/	r0.w = r0.w * 1.442695;
/*375*/	r0.w = exp2(r0.w);
/*376*/	r0.w = cb3.data[1].y / r0.w;
/*377*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*378*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*379*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*380*/	r1.x = r1.x + -cb3.data[1].z;
/*381*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*382*/	r1.x = saturate(r1.y * r1.x);
/*383*/	r1.y = r1.x * -2.000000 + 3.000000;
/*384*/	r1.x = r1.x * r1.x;
/*385*/	r1.x = r1.x * r1.y;
/*386*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*387*/	r1.y = sqrt(r1.y);
/*388*/	r1.z = max(cb3.data[2].z, 0.001000);
/*389*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*390*/	r1.y = r1.z * r1.y;
/*391*/	r1.y = min(r1.y, 1.000000);
/*392*/	r1.z = r1.y * -2.000000 + 3.000000;
/*393*/	r1.y = r1.y * r1.y;
/*394*/	r1.y = r1.y * r1.z;
/*395*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*396*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*397*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*398*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*399*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*400*/	r4.w = max(r4.y, 0.000000);
/*401*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*402*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*403*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*404*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*405*/	r0.w = saturate(r0.w * r1.y);
/*406*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*407*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*408*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*409*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*410*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*411*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*412*/	return;
}
