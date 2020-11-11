//
//
// Shader Model 4
// Fragment Shader
//
// id: 5011 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps30_rigid_forward_lighting_gamma_correct_LDR.glsl
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*17*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*18*/	r0.x = saturate(vsOut_N0.w);
/*19*/	r5.xyz = (r5.xyzx + -cb6.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb6.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb6.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb6.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb6.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb6.data[2].xyxz).xyw;
/*27*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*29*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*30*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*31*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*32*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*33*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*34*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*35*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*37*/	r1.w = -r1.w + 1.000000;
/*38*/	r1.w = max(r1.w, 0.000000);
/*39*/	r1.z = sqrt(r1.w);
/*40*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*41*/	r3.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*42*/	r4.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*43*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*44*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*45*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*46*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*47*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*48*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*49*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*50*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*51*/	if(floatBitsToUint(r1.w) != 0u) {
/*52*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*53*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*54*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*55*/	  r1.w = -r1.w + 1.000000;
/*56*/	  r1.w = max(r1.w, 0.000000);
/*57*/	  r5.z = sqrt(r1.w);
/*58*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*59*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*60*/	  r1.w = r3.y * r7.w;
/*61*/	  r3.y = r1.w * -0.500000 + r3.y;
/*62*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*63*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*64*/	  r1.w = -r4.w * r6.w + 1.000000;
/*65*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*66*/	  r4.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*67*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*68*/	}
/*69*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*70*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy).zw;
/*71*/	r4.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx + vsOut_T6.yzyy).xy;
/*72*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*73*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*74*/	r1.w = r4.w * r5.w;
/*75*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*76*/	r0.xyw = (r1.wwww * r5.xyxz + r0.xyxw).xyw;
/*77*/	r1.xy = (r4.xyxx * r4.wwww + r1.xyxx).xy;
/*78*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*79*/	r2.w = inversesqrt(r2.w);
/*80*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*81*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*82*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*83*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*84*/	r2.w = saturate(-r2.w + r4.w);
/*85*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*86*/	if(floatBitsToUint(r2.w) != 0u) {
/*87*/	  r2.w = -r4.w + 1.000000;
/*88*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*89*/	  r2.w = -r2.w + 1.000000;
/*90*/	  r2.w = -r2.w * r2.w + 1.000000;
/*91*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*92*/	  r4.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*93*/	  r2.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*94*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*95*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*96*/	  r5.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*97*/	  r0.xyw = (r2.wwww * r5.xyxz + r4.xyxz).xyw;
/*98*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*99*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*100*/	} else {
/*101*/	  r5.xyz = (r1.wwww * r2.xyzx).xyz;
/*102*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*103*/	}
/*104*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*105*/	r1.w = inversesqrt(r1.w);
/*106*/	r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*107*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*108*/	r1.w = inversesqrt(r1.w);
/*109*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*110*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*111*/	r1.w = inversesqrt(r1.w);
/*112*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*113*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*114*/	r7.xyz = (r1.xxxx * r2.xyzx + r7.xyzx).xyz;
/*115*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*116*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*117*/	r1.w = inversesqrt(r1.w);
/*118*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*119*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*120*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*121*/	if(floatBitsToUint(r0.z) != 0u) {
/*122*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*123*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*124*/	  r0.z = r3.w * cb1.data[26].x;
/*125*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*126*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*127*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*128*/	  r4.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r4.xyzx).xyz;
/*129*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*130*/	}
/*131*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*132*/	if(floatBitsToUint(r0.z) != 0u) {
/*133*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*134*/	  if(floatBitsToUint(r0.z) != 0u) {
/*135*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*136*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*137*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*138*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*139*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*140*/	    r0.z = -r0.z + 1.000000;
/*141*/	    r0.z = max(r0.z, 0.000000);
/*142*/	    r8.z = sqrt(r0.z);
/*143*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*144*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*145*/	    r0.z = inversesqrt(r0.z);
/*146*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*147*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*148*/	    r10.y = -1.000000;
/*149*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*150*/	    r0.z = inversesqrt(r0.z);
/*151*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*152*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*153*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*154*/	    r1.w = r1.w * 1.250000;
/*155*/	    r1.w = min(r1.w, 1.000000);
/*156*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*157*/	    r2.w = r2.w * 4.000000;
/*158*/	    r1.w = r1.w * 0.200000 + r2.w;
/*159*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*160*/	    r0.z = r0.z + -r1.w;
/*161*/	    r0.z = saturate(r0.z * 200.000000);
/*162*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*163*/	    r0.z = r0.z * r0.z;
/*164*/	    r0.z = r0.z * r1.w;
/*165*/	    r3.x = r0.z * -r3.x + r3.x;
/*166*/	    r1.w = -r3.y + 0.200000;
/*167*/	    r3.y = r0.z * r1.w + r3.y;
/*168*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*169*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*170*/	    r9.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*171*/	    r4.xyz = (r0.zzzz * r9.xyzx + r4.xyzx).xyz;
/*172*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*173*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*174*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*175*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*176*/	    r1.w = -r1.w + 1.000000;
/*177*/	    r1.w = max(r1.w, 0.000000);
/*178*/	    r7.z = sqrt(r1.w);
/*179*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*180*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*181*/	    r1.w = sqrt(r1.w);
/*182*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*183*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*184*/	    r1.w = inversesqrt(r1.w);
/*185*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*186*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*187*/	    r2.xyz = (r7.xxxx * r2.xyzx + r5.xyzx).xyz;
/*188*/	    r2.xyz = (r7.zzzz * r6.xyzx + r2.xyzx).xyz;
/*189*/	    r1.w = -r1.y + 1.000000;
/*190*/	    r0.z = min(r0.z, r1.w);
/*191*/	    r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*192*/	    r2.xyz = (r0.zzzz * r2.xyzx + r1.xyzx).xyz;
/*193*/	    r0.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*194*/	    r0.z = inversesqrt(r0.z);
/*195*/	    r1.xyz = (r0.zzzz * r2.xyzx).xyz;
/*196*/	  }
/*197*/	}
/*198*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*199*/	r2.xyz = (r0.xywx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*200*/	r2.xyz = (-r0.xywx + r2.xyzx).xyz;
/*201*/	r0.xyw = saturate(vsOut_T7.yyyy * r2.xyxz + r0.xyxw).xyw;
/*202*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*203*/	r2.xyz = (-r0.xywx + r1.wwww).xyz;
/*204*/	r0.xyw = (vsOut_T7.zzzz * r2.xyxz + r0.xyxw).xyw;
/*205*/	r1.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*206*/	r2.xyz = (-r4.xyzx + r1.wwww).xyz;
/*207*/	r2.xyz = (vsOut_T7.zzzz * r2.xyzx + r4.xyzx).xyz;
/*208*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*209*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*210*/	r1.w = inversesqrt(r1.w);
/*211*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*212*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*213*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*214*/	r2.w = inversesqrt(r1.w);
/*215*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*216*/	r2.w = -r3.x + 1.000000;
/*217*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*218*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*219*/	r5.y = r5.y + r5.y;
/*220*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*221*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*222*/	r6.w = r2.w * 1.539380;
/*223*/	r6.w = cos((r6.w));
/*224*/	r6.w = inversesqrt(r6.w);
/*225*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*226*/	r7.x = saturate(r0.z * 60.000000);
/*227*/	r7.x = -r0.z + r7.x;
/*228*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*229*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*230*/	r8.x = inversesqrt(r8.x);
/*231*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*232*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*233*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*234*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*235*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*236*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*237*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*238*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*239*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*240*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*241*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*242*/	r6.y = -r0.z + 1.000000;
/*243*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*244*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*245*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*246*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*247*/	  r6.y = max(r6.y, 0.000000);
/*248*/	  r6.y = log2(r6.y);
/*249*/	  r6.y = r6.y * 10.000000;
/*250*/	  r6.y = exp2(r6.y);
/*251*/	  r6.y = r6.w * r6.y;
/*252*/	  r6.y = r6.y * r7.x + r0.z;
/*253*/	  r8.x = r2.w * 8.000000;
/*254*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*255*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*256*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*257*/	}
/*258*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*259*/	r1.y = max(r1.x, 0.000000);
/*260*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*261*/	if(floatBitsToUint(r1.x) != 0u) {
/*262*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*263*/	  r1.x = max(r1.x, -1.000000);
/*264*/	  r1.x = min(r1.x, 1.000000);
/*265*/	  r1.z = -abs(r1.x) + 1.000000;
/*266*/	  r1.z = sqrt(r1.z);
/*267*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*268*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*269*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*270*/	  r5.z = r1.z * r5.y;
/*271*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*272*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*273*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*274*/	  r1.x = r5.y * r1.z + r1.x;
/*275*/	  r1.z = r3.x * r3.x;
/*276*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*277*/	  r1.z = r1.z * r3.x + r6.x;
/*278*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*279*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*280*/	  r3.x = -r1.z * r1.z + 1.000000;
/*281*/	  r3.x = max(r3.x, 0.001000);
/*282*/	  r3.x = log2(r3.x);
/*283*/	  r5.x = r3.x * 4.950617;
/*284*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*285*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*286*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*287*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*288*/	  r1.z = floatBitsToInt(r1.z);
/*289*/	  r5.x = r3.x * r3.x + -r5.x;
/*290*/	  r5.x = sqrt(r5.x);
/*291*/	  r3.x = -r3.x + r5.x;
/*292*/	  r3.x = max(r3.x, 0.000000);
/*293*/	  r3.x = sqrt(r3.x);
/*294*/	  r1.z = r1.z * r3.x;
/*295*/	  r1.z = r1.z * 1.414214;
/*296*/	  r1.z = 0.008727 / r1.z;
/*297*/	  r1.z = max(r1.z, 0.000100);
/*298*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*299*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*300*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*301*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*302*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*303*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*304*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*305*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*306*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*307*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*308*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*309*/	  r1.x = floatBitsToInt(r1.x);
/*310*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*311*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*312*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*313*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*314*/	  r1.x = r1.x * r5.x + 1.000000;
/*315*/	  r1.x = r1.x * 0.500000;
/*316*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*317*/	  r1.z = r1.z * r5.y + 1.000000;
/*318*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*319*/	  r1.z = min(r1.y, 1.000000);
/*320*/	  r2.w = r2.w * 1.570796;
/*321*/	  r2.w = sin(r2.w);
/*322*/	  r1.z = r1.z + -1.000000;
/*323*/	  r1.z = r2.w * r1.z + 1.000000;
/*324*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*325*/	  r2.w = max(r2.w, 0.000000);
/*326*/	  r2.w = log2(r2.w);
/*327*/	  r2.w = r2.w * 10.000000;
/*328*/	  r2.w = exp2(r2.w);
/*329*/	  r2.w = r6.w * r2.w;
/*330*/	  r2.w = r2.w * r7.x + r0.z;
/*331*/	  r1.x = r1.z * abs(r1.x);
/*332*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*333*/	} else {
/*334*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*335*/	}
/*336*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*337*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*338*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*339*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*340*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*341*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*342*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*343*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*344*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*345*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*346*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*347*/	r2.w = 1.000000;
/*348*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*349*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*350*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*351*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*352*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*353*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*354*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*355*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*356*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*357*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*358*/	if(r0.w != 0) discard;
/*359*/	r0.w = sqrt(r1.w);
/*360*/	r1.x = saturate(cb3.data[0].w)/**/;
/*361*/	r1.x = -r1.x + 1.000000;
/*362*/	r1.x = r1.x * 8.000000 + -4.000000;
/*363*/	r1.y = saturate(cb3.data[1].x)/**/;
/*364*/	r1.y = -r1.y + 1.000000;
/*365*/	r1.y = r1.y * 1000.000000;
/*366*/	r0.w = r0.w / r1.y;
/*367*/	r0.w = r0.w + r1.x;
/*368*/	r0.w = r0.w * 1.442695;
/*369*/	r0.w = exp2(r0.w);
/*370*/	r0.w = cb3.data[1].y / r0.w;
/*371*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*372*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*373*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*374*/	r1.x = r1.x + -cb3.data[1].z;
/*375*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*376*/	r1.x = saturate(r1.y * r1.x);
/*377*/	r1.y = r1.x * -2.000000 + 3.000000;
/*378*/	r1.x = r1.x * r1.x;
/*379*/	r1.x = r1.x * r1.y;
/*380*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*381*/	r1.y = sqrt(r1.y);
/*382*/	r1.z = max(cb3.data[2].z, 0.001000);
/*383*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*384*/	r1.y = r1.z * r1.y;
/*385*/	r1.y = min(r1.y, 1.000000);
/*386*/	r1.z = r1.y * -2.000000 + 3.000000;
/*387*/	r1.y = r1.y * r1.y;
/*388*/	r1.y = r1.y * r1.z;
/*389*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*390*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*391*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*392*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*393*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*394*/	r4.w = max(r4.y, 0.000000);
/*395*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*396*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*397*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*398*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*399*/	r0.w = saturate(r0.w * r1.y);
/*400*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*401*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*402*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*403*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*404*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*405*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*406*/	return;
}
