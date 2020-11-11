//
//
// Shader Model 4
// Fragment Shader
//
// id: 5013 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps30_rigid_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
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
/*56*/	  r1.w = r3.y * r7.w;
/*57*/	  r3.y = r1.w * -0.500000 + r3.y;
/*58*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*59*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*60*/	  r1.w = -r4.w * r6.w + 1.000000;
/*61*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*62*/	  r4.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*63*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*64*/	}
/*65*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*66*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy).zw;
/*67*/	r4.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx + vsOut_T6.yzyy).xy;
/*68*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*69*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*70*/	r1.w = r4.w * r5.w;
/*71*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*72*/	r0.xyw = (r1.wwww * r5.xyxz + r0.xyxw).xyw;
/*73*/	r1.xy = (r4.xyxx * r4.wwww + r1.xyxx).xy;
/*74*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*77*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*78*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*79*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*80*/	r2.w = saturate(-r2.w + r4.w);
/*81*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r2.w) != 0u) {
/*83*/	  r2.w = -r4.w + 1.000000;
/*84*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*85*/	  r2.w = -r2.w + 1.000000;
/*86*/	  r2.w = -r2.w * r2.w + 1.000000;
/*87*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*88*/	  r4.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*89*/	  r2.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*90*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*91*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*92*/	  r5.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*93*/	  r0.xyw = (r2.wwww * r5.xyxz + r4.xyxz).xyw;
/*94*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*95*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*96*/	} else {
/*97*/	  r5.xyz = (r1.wwww * r2.xyzx).xyz;
/*98*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*99*/	}
/*100*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*101*/	r1.w = inversesqrt(r1.w);
/*102*/	r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*103*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*104*/	r1.w = inversesqrt(r1.w);
/*105*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*106*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*107*/	r1.w = inversesqrt(r1.w);
/*108*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*109*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*110*/	r7.xyz = (r1.xxxx * r2.xyzx + r7.xyzx).xyz;
/*111*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*112*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*113*/	r1.w = inversesqrt(r1.w);
/*114*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*115*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*116*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*117*/	if(floatBitsToUint(r0.z) != 0u) {
/*118*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*119*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*120*/	  r0.z = r3.w * cb1.data[26].x;
/*121*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*122*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*123*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*124*/	  r4.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r4.xyzx).xyz;
/*125*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*126*/	}
/*127*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*128*/	if(floatBitsToUint(r0.z) != 0u) {
/*129*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*130*/	  if(floatBitsToUint(r0.z) != 0u) {
/*131*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*132*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*133*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*134*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*135*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*136*/	    r0.z = -r0.z + 1.000000;
/*137*/	    r0.z = max(r0.z, 0.000000);
/*138*/	    r8.z = sqrt(r0.z);
/*139*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*140*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*141*/	    r0.z = inversesqrt(r0.z);
/*142*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*143*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*144*/	    r10.y = -1.000000;
/*145*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*146*/	    r0.z = inversesqrt(r0.z);
/*147*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*148*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*149*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*150*/	    r1.w = r1.w * 1.250000;
/*151*/	    r1.w = min(r1.w, 1.000000);
/*152*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*153*/	    r2.w = r2.w * 4.000000;
/*154*/	    r1.w = r1.w * 0.200000 + r2.w;
/*155*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*156*/	    r0.z = r0.z + -r1.w;
/*157*/	    r0.z = saturate(r0.z * 200.000000);
/*158*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*159*/	    r0.z = r0.z * r0.z;
/*160*/	    r0.z = r0.z * r1.w;
/*161*/	    r3.x = r0.z * -r3.x + r3.x;
/*162*/	    r1.w = -r3.y + 0.200000;
/*163*/	    r3.y = r0.z * r1.w + r3.y;
/*164*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*165*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*166*/	    r9.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*167*/	    r4.xyz = (r0.zzzz * r9.xyzx + r4.xyzx).xyz;
/*168*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*169*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*170*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*171*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*172*/	    r1.w = -r1.w + 1.000000;
/*173*/	    r1.w = max(r1.w, 0.000000);
/*174*/	    r7.z = sqrt(r1.w);
/*175*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*176*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*177*/	    r1.w = sqrt(r1.w);
/*178*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*179*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*180*/	    r1.w = inversesqrt(r1.w);
/*181*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*182*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*183*/	    r2.xyz = (r7.xxxx * r2.xyzx + r5.xyzx).xyz;
/*184*/	    r2.xyz = (r7.zzzz * r6.xyzx + r2.xyzx).xyz;
/*185*/	    r1.w = -r1.y + 1.000000;
/*186*/	    r0.z = min(r0.z, r1.w);
/*187*/	    r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*188*/	    r2.xyz = (r0.zzzz * r2.xyzx + r1.xyzx).xyz;
/*189*/	    r0.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*190*/	    r0.z = inversesqrt(r0.z);
/*191*/	    r1.xyz = (r0.zzzz * r2.xyzx).xyz;
/*192*/	  }
/*193*/	}
/*194*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*195*/	r2.xyz = (r0.xywx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*196*/	r2.xyz = (-r0.xywx + r2.xyzx).xyz;
/*197*/	r0.xyw = saturate(vsOut_T7.yyyy * r2.xyxz + r0.xyxw).xyw;
/*198*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*199*/	r2.xyz = (-r0.xywx + r1.wwww).xyz;
/*200*/	r0.xyw = (vsOut_T7.zzzz * r2.xyxz + r0.xyxw).xyw;
/*201*/	r1.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*202*/	r2.xyz = (-r4.xyzx + r1.wwww).xyz;
/*203*/	r2.xyz = (vsOut_T7.zzzz * r2.xyzx + r4.xyzx).xyz;
/*204*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*205*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*206*/	r1.w = inversesqrt(r1.w);
/*207*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*208*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*209*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*210*/	r2.w = inversesqrt(r1.w);
/*211*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*212*/	r2.w = -r3.x + 1.000000;
/*213*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*214*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*215*/	r5.y = r5.y + r5.y;
/*216*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*217*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*218*/	r6.w = r2.w * 1.539380;
/*219*/	r6.w = cos((r6.w));
/*220*/	r6.w = inversesqrt(r6.w);
/*221*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*222*/	r7.x = saturate(r0.z * 60.000000);
/*223*/	r7.x = -r0.z + r7.x;
/*224*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*225*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*226*/	r8.x = inversesqrt(r8.x);
/*227*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*228*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*229*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*230*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*231*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*232*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*233*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*234*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*235*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*236*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*237*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*238*/	r6.y = -r0.z + 1.000000;
/*239*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*240*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*241*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*242*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*243*/	  r6.y = max(r6.y, 0.000000);
/*244*/	  r6.y = log2(r6.y);
/*245*/	  r6.y = r6.y * 10.000000;
/*246*/	  r6.y = exp2(r6.y);
/*247*/	  r6.y = r6.w * r6.y;
/*248*/	  r6.y = r6.y * r7.x + r0.z;
/*249*/	  r8.x = r2.w * 8.000000;
/*250*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*251*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*252*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*253*/	}
/*254*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*255*/	r1.y = max(r1.x, 0.000000);
/*256*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*257*/	if(floatBitsToUint(r1.x) != 0u) {
/*258*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*259*/	  r1.x = max(r1.x, -1.000000);
/*260*/	  r1.x = min(r1.x, 1.000000);
/*261*/	  r1.z = -abs(r1.x) + 1.000000;
/*262*/	  r1.z = sqrt(r1.z);
/*263*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*264*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*265*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*266*/	  r5.z = r1.z * r5.y;
/*267*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*268*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*269*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*270*/	  r1.x = r5.y * r1.z + r1.x;
/*271*/	  r1.z = r3.x * r3.x;
/*272*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*273*/	  r1.z = r1.z * r3.x + r6.x;
/*274*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*275*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*276*/	  r3.x = -r1.z * r1.z + 1.000000;
/*277*/	  r3.x = max(r3.x, 0.001000);
/*278*/	  r3.x = log2(r3.x);
/*279*/	  r5.x = r3.x * 4.950617;
/*280*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*281*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*282*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*283*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*284*/	  r1.z = floatBitsToInt(r1.z);
/*285*/	  r5.x = r3.x * r3.x + -r5.x;
/*286*/	  r5.x = sqrt(r5.x);
/*287*/	  r3.x = -r3.x + r5.x;
/*288*/	  r3.x = max(r3.x, 0.000000);
/*289*/	  r3.x = sqrt(r3.x);
/*290*/	  r1.z = r1.z * r3.x;
/*291*/	  r1.z = r1.z * 1.414214;
/*292*/	  r1.z = 0.008727 / r1.z;
/*293*/	  r1.z = max(r1.z, 0.000100);
/*294*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*295*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*296*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*297*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*298*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*299*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*300*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*301*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*302*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*303*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*304*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*305*/	  r1.x = floatBitsToInt(r1.x);
/*306*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*307*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*308*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*309*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*310*/	  r1.x = r1.x * r5.x + 1.000000;
/*311*/	  r1.x = r1.x * 0.500000;
/*312*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*313*/	  r1.z = r1.z * r5.y + 1.000000;
/*314*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*315*/	  r1.z = min(r1.y, 1.000000);
/*316*/	  r2.w = r2.w * 1.570796;
/*317*/	  r2.w = sin(r2.w);
/*318*/	  r1.z = r1.z + -1.000000;
/*319*/	  r1.z = r2.w * r1.z + 1.000000;
/*320*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*321*/	  r2.w = max(r2.w, 0.000000);
/*322*/	  r2.w = log2(r2.w);
/*323*/	  r2.w = r2.w * 10.000000;
/*324*/	  r2.w = exp2(r2.w);
/*325*/	  r2.w = r6.w * r2.w;
/*326*/	  r2.w = r2.w * r7.x + r0.z;
/*327*/	  r1.x = r1.z * abs(r1.x);
/*328*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*329*/	} else {
/*330*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*331*/	}
/*332*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*333*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*334*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*335*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*336*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*337*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*338*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*339*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*340*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*341*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*342*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*343*/	r2.w = 1.000000;
/*344*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*345*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*346*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*347*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*348*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*349*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*350*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*351*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*352*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*353*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*354*/	if(r0.w != 0) discard;
/*355*/	r0.w = sqrt(r1.w);
/*356*/	r1.x = saturate(cb3.data[0].w)/**/;
/*357*/	r1.x = -r1.x + 1.000000;
/*358*/	r1.x = r1.x * 8.000000 + -4.000000;
/*359*/	r1.y = saturate(cb3.data[1].x)/**/;
/*360*/	r1.y = -r1.y + 1.000000;
/*361*/	r1.y = r1.y * 1000.000000;
/*362*/	r0.w = r0.w / r1.y;
/*363*/	r0.w = r0.w + r1.x;
/*364*/	r0.w = r0.w * 1.442695;
/*365*/	r0.w = exp2(r0.w);
/*366*/	r0.w = cb3.data[1].y / r0.w;
/*367*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*368*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*369*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*370*/	r1.x = r1.x + -cb3.data[1].z;
/*371*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*372*/	r1.x = saturate(r1.y * r1.x);
/*373*/	r1.y = r1.x * -2.000000 + 3.000000;
/*374*/	r1.x = r1.x * r1.x;
/*375*/	r1.x = r1.x * r1.y;
/*376*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*377*/	r1.y = sqrt(r1.y);
/*378*/	r1.z = max(cb3.data[2].z, 0.001000);
/*379*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*380*/	r1.y = r1.z * r1.y;
/*381*/	r1.y = min(r1.y, 1.000000);
/*382*/	r1.z = r1.y * -2.000000 + 3.000000;
/*383*/	r1.y = r1.y * r1.y;
/*384*/	r1.y = r1.y * r1.z;
/*385*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*386*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*387*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*388*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*389*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*390*/	r4.w = max(r4.y, 0.000000);
/*391*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*392*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*393*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*394*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*395*/	r0.w = saturate(r0.w * r1.y);
/*396*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*397*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*398*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*399*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*400*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*401*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*402*/	return;
}
