//
//
// Shader Model 4
// Fragment Shader
//
// id: 5023 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_snow_normals;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shadowmap_PS
{
  vec4 data[45];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform weather_shared
{
  vec4 data[3];
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
  vec4 r11;
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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*15*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
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
/*37*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*38*/	r4.w = 1.000000;
/*39*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*40*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*41*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*42*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*43*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*44*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*45*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*46*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*47*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*48*/	r5.z = vsOut_T6.x;
/*49*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*50*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*51*/	if(floatBitsToUint(r2.w) != 0u) {
/*52*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*53*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*54*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*55*/	  r2.w = -r2.w + 1.000000;
/*56*/	  r2.w = max(r2.w, 0.000000);
/*57*/	  r5.z = sqrt(r2.w);
/*58*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*59*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*60*/	  r2.w = r3.y * r8.w;
/*61*/	  r3.y = r2.w * -0.500000 + r3.y;
/*62*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*63*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*64*/	  r2.w = -r6.w * r7.w + 1.000000;
/*65*/	  r0.xyw = (r2.wwww * r0.xyxw + r8.xyxz).xyw;
/*66*/	  r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*67*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*68*/	}
/*69*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*70*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*71*/	r5.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*72*/	r6.xyzw = (texture(s_decal_dirt_map, r5.xyxx.st)).xyzw;
/*73*/	r5.xy = (r6.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*74*/	r2.w = r5.w * r6.w;
/*75*/	r6.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*76*/	r0.xyw = (r2.wwww * r6.xyxz + r0.xyxw).xyw;
/*77*/	r1.xy = (r5.xyxx * r5.wwww + r1.xyxx).xy;
/*78*/	r5.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*79*/	r5.x = inversesqrt(r5.x);
/*80*/	r1.xyz = (r1.xyzx * r5.xxxx).xyz;
/*81*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*82*/	r5.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*83*/	r3.z = -vsOut_T7.w * 0.900000 + 1.000000;
/*84*/	r3.z = saturate(-r3.z + r5.w);
/*85*/	r3.z = uintBitsToFloat((0.000000 < r3.z) ? 0xffffffffu : 0x00000000u);
/*86*/	if(floatBitsToUint(r3.z) != 0u) {
/*87*/	  r3.z = -r5.w + 1.000000;
/*88*/	  r3.z = saturate(vsOut_T7.w * 0.900000 + -r3.z);
/*89*/	  r3.z = -r3.z + 1.000000;
/*90*/	  r3.z = -r3.z * r3.z + 1.000000;
/*91*/	  r3.z = r3.z * -0.600000 + 1.000000;
/*92*/	  r5.xyz = (r3.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*93*/	  r3.z = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*94*/	  r3.z = uintBitsToFloat((r3.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*95*/	  r3.z = uintBitsToFloat(floatBitsToUint(r3.z) & uint(0x3f800000u));
/*96*/	  r6.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r5.xzzx).xyz;
/*97*/	  r0.xyw = (r3.zzzz * r6.xyxz + r5.xyxz).xyw;
/*98*/	  r5.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*99*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*100*/	} else {
/*101*/	  r6.xyz = (r2.wwww * r2.xyzx).xyz;
/*102*/	  r5.xyz = (r6.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*103*/	}
/*104*/	r2.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*105*/	r2.x = inversesqrt(r2.x);
/*106*/	r2.xyz = (r2.xxxx * vsOut_T3.xyzx).xyz;
/*107*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*108*/	r2.w = inversesqrt(r2.w);
/*109*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*110*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*111*/	r2.w = inversesqrt(r2.w);
/*112*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*113*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*114*/	r8.xyz = (r1.xxxx * r2.xyzx + r8.xyzx).xyz;
/*115*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*116*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*117*/	r2.w = inversesqrt(r2.w);
/*118*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*119*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*120*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*121*/	if(floatBitsToUint(r0.z) != 0u) {
/*122*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*123*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*124*/	  r0.z = r3.w * cb0.data[26].x;
/*125*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*126*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*127*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*128*/	  r5.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r5.xyzx).xyz;
/*129*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*130*/	}
/*131*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*132*/	if(floatBitsToUint(r0.z) != 0u) {
/*133*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*134*/	  if(floatBitsToUint(r0.z) != 0u) {
/*135*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*136*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*137*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*138*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*139*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*140*/	    r0.z = -r0.z + 1.000000;
/*141*/	    r0.z = max(r0.z, 0.000000);
/*142*/	    r9.z = sqrt(r0.z);
/*143*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*144*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*145*/	    r0.z = inversesqrt(r0.z);
/*146*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*147*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*148*/	    r11.y = -1.000000;
/*149*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*150*/	    r0.z = inversesqrt(r0.z);
/*151*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*152*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*153*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*154*/	    r2.w = r2.w * 1.250000;
/*155*/	    r2.w = min(r2.w, 1.000000);
/*156*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*157*/	    r3.z = r3.z * 4.000000;
/*158*/	    r2.w = r2.w * 0.200000 + r3.z;
/*159*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*160*/	    r0.z = r0.z + -r2.w;
/*161*/	    r0.z = saturate(r0.z * 200.000000);
/*162*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*163*/	    r0.z = r0.z * r0.z;
/*164*/	    r0.z = r0.z * r2.w;
/*165*/	    r3.x = r0.z * -r3.x + r3.x;
/*166*/	    r2.w = -r3.y + 0.200000;
/*167*/	    r3.y = r0.z * r2.w + r3.y;
/*168*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*169*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*170*/	    r10.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*171*/	    r5.xyz = (r0.zzzz * r10.xyzx + r5.xyzx).xyz;
/*172*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*173*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*174*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*175*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*176*/	    r2.w = -r2.w + 1.000000;
/*177*/	    r2.w = max(r2.w, 0.000000);
/*178*/	    r8.z = sqrt(r2.w);
/*179*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*180*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*181*/	    r2.w = sqrt(r2.w);
/*182*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*183*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*184*/	    r2.w = inversesqrt(r2.w);
/*185*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*186*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*187*/	    r2.xyz = (r8.xxxx * r2.xyzx + r6.xyzx).xyz;
/*188*/	    r2.xyz = (r8.zzzz * r7.xyzx + r2.xyzx).xyz;
/*189*/	    r2.w = -r1.y + 1.000000;
/*190*/	    r0.z = min(r0.z, r2.w);
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
/*202*/	r2.x = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*203*/	r2.xyz = (-r0.xywx + r2.xxxx).xyz;
/*204*/	r0.xyw = (vsOut_T7.zzzz * r2.xyxz + r0.xyxw).xyw;
/*205*/	r2.x = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*206*/	r2.xyz = (-r5.xyzx + r2.xxxx).xyz;
/*207*/	r2.xyz = (vsOut_T7.zzzz * r2.xyzx + r5.xyzx).xyz;
/*208*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*209*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*210*/	r2.w = inversesqrt(r2.w);
/*211*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*212*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*213*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*214*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*215*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*216*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*217*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*218*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*219*/	r3.y = intBitsToFloat(int(r2.w));
/*220*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*221*/	if(floatBitsToUint(r3.z) != 0u) {
/*222*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*223*/	  r5.w = vsOut_T0.w;
/*224*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*225*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*226*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*227*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*228*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*229*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*230*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*231*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*232*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*233*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*234*/	  if(floatBitsToUint(r3.w) == 0u) {
/*235*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*236*/	    r7.xy = floor((r6.xyxx).xy);
/*237*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*238*/	    r3.z = -0.000400 / r3.z;
/*239*/	    r3.z = r3.z + r6.z;
/*240*/	    r8.z = -r8.y + 1.000000;
/*241*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*242*/	    r8.w = -r8.y;
/*243*/	    r10.x = cb1.data[0].z/**/;
/*244*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*245*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*246*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*247*/	    r10.w = -cb1.data[0].w/**/;
/*248*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*249*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*250*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*251*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*252*/	    r8.x = r9.x;
/*253*/	    r8.y = r11.x;
/*254*/	    r8.z = r10.x;
/*255*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*256*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*257*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*258*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*259*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*260*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*261*/	    r3.z = -r6.x + r6.y;
/*262*/	    r3.z = r3.w * r3.z + r6.x;
/*263*/	  } else {
/*264*/	    r3.z = 1.000000;
/*265*/	  }
/*266*/	} else {
/*267*/	  r3.z = 1.000000;
/*268*/	}
/*269*/	r3.w = cb1.data[34].w + -1.000000;
/*270*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*271*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*272*/	if(floatBitsToUint(r2.w) == 0u) {
/*273*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*274*/	  r2.w = floatBitsToInt(r2.w);
/*275*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*276*/	  if(floatBitsToUint(r2.w) != 0u) {
/*277*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*278*/	    r5.w = vsOut_T0.w;
/*279*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*280*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*281*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*282*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*283*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*284*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*285*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*286*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*287*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*288*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*289*/	    if(floatBitsToUint(r5.w) == 0u) {
/*290*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*291*/	      r6.xy = floor((r5.xyxx).xy);
/*292*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*293*/	      r2.w = -0.000400 / r2.w;
/*294*/	      r2.w = r2.w + r5.z;
/*295*/	      r7.z = -r7.y + 1.000000;
/*296*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*297*/	      r7.w = -r7.y;
/*298*/	      r9.x = cb1.data[0].z/**/;
/*299*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*300*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*301*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*302*/	      r9.w = -cb1.data[0].w/**/;
/*303*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*304*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*305*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*306*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*307*/	      r7.x = r8.x;
/*308*/	      r7.y = r10.x;
/*309*/	      r7.z = r9.x;
/*310*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*311*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*312*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*313*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*314*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*315*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*316*/	      r2.w = -r5.x + r5.z;
/*317*/	      r2.w = r5.y * r2.w + r5.x;
/*318*/	    } else {
/*319*/	      r2.w = 1.000000;
/*320*/	    }
/*321*/	  } else {
/*322*/	    r2.w = 1.000000;
/*323*/	  }
/*324*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*325*/	  r5.y = r5.x * cb1.data[34].x;
/*326*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*327*/	  r5.x = r1.w + -r5.x;
/*328*/	  r5.x = saturate(r5.x / r5.y);
/*329*/	  r2.w = -r3.z + r2.w;
/*330*/	  r3.z = r5.x * r2.w + r3.z;
/*331*/	}
/*332*/	if(floatBitsToUint(r3.w) != 0u) {
/*333*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*334*/	  r3.w = r2.w * cb1.data[34].y;
/*335*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*336*/	  r2.w = r1.w + -r2.w;
/*337*/	  r2.w = saturate(r2.w / r3.w);
/*338*/	  r3.y = -r3.z + 1.000000;
/*339*/	  r3.z = r2.w * r3.y + r3.z;
/*340*/	}
/*341*/	r3.z = saturate(r3.z);
/*342*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*343*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*344*/	r2.w = inversesqrt(r2.w);
/*345*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*346*/	r2.w = -r3.x + 1.000000;
/*347*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*348*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*349*/	r3.w = r3.w + r3.w;
/*350*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*351*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*352*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*353*/	r3.w = cos((r8.x));
/*354*/	r3.w = inversesqrt(r3.w);
/*355*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*356*/	r5.w = saturate(r0.z * 60.000000);
/*357*/	r5.w = -r0.z + r5.w;
/*358*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*359*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*360*/	r6.w = inversesqrt(r6.w);
/*361*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*362*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*363*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*364*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*365*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*366*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*367*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*368*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*369*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*370*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*371*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*372*/	r6.w = -r0.z + 1.000000;
/*373*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*374*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*375*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*376*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*377*/	  r6.w = max(r6.w, 0.000000);
/*378*/	  r6.w = log2(r6.w);
/*379*/	  r6.w = r6.w * 10.000000;
/*380*/	  r6.w = exp2(r6.w);
/*381*/	  r6.w = r3.w * r6.w;
/*382*/	  r6.w = r6.w * r5.w + r0.z;
/*383*/	  r7.y = r2.w * 8.000000;
/*384*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*385*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*386*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*387*/	}
/*388*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*389*/	r7.y = max(r6.w, 0.000000);
/*390*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*391*/	if(floatBitsToUint(r6.w) != 0u) {
/*392*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*393*/	  r6.x = max(r6.x, -1.000000);
/*394*/	  r6.x = min(r6.x, 1.000000);
/*395*/	  r6.y = -abs(r6.x) + 1.000000;
/*396*/	  r6.y = sqrt(r6.y);
/*397*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*398*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*399*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*400*/	  r6.w = r6.y * r6.z;
/*401*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*402*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*403*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*404*/	  r6.x = r6.z * r6.y + r6.x;
/*405*/	  r3.x = r3.x * r3.x;
/*406*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*407*/	  r3.x = r3.x * r3.y + r7.x;
/*408*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*409*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*410*/	  r3.y = -r3.x * r3.x + 1.000000;
/*411*/	  r3.y = max(r3.y, 0.001000);
/*412*/	  r3.y = log2(r3.y);
/*413*/	  r6.y = r3.y * 4.950617;
/*414*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*415*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*416*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*417*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*418*/	  r3.x = floatBitsToInt(r3.x);
/*419*/	  r6.y = r3.y * r3.y + -r6.y;
/*420*/	  r6.y = sqrt(r6.y);
/*421*/	  r3.y = -r3.y + r6.y;
/*422*/	  r3.y = max(r3.y, 0.000000);
/*423*/	  r3.y = sqrt(r3.y);
/*424*/	  r3.x = r3.y * r3.x;
/*425*/	  r3.x = r3.x * 1.414214;
/*426*/	  r3.x = 0.008727 / r3.x;
/*427*/	  r3.x = max(r3.x, 0.000100);
/*428*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*429*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*430*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*431*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*432*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*433*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*434*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*435*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*436*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*437*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*438*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*439*/	  r3.x = floatBitsToInt(r3.x);
/*440*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*441*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*442*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*443*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*444*/	  r3.x = r3.x * r6.x + 1.000000;
/*445*/	  r3.x = r3.x * 0.500000;
/*446*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*447*/	  r3.y = r3.y * r6.y + 1.000000;
/*448*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*449*/	  r3.y = min(r7.y, 1.000000);
/*450*/	  r2.w = r2.w * 1.570796;
/*451*/	  r2.w = sin(r2.w);
/*452*/	  r3.y = r3.y + -1.000000;
/*453*/	  r2.w = r2.w * r3.y + 1.000000;
/*454*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*455*/	  r3.y = max(r3.y, 0.000000);
/*456*/	  r3.y = log2(r3.y);
/*457*/	  r3.y = r3.y * 10.000000;
/*458*/	  r3.y = exp2(r3.y);
/*459*/	  r3.y = r3.w * r3.y;
/*460*/	  r3.y = r3.y * r5.w + r0.z;
/*461*/	  r2.w = r2.w * abs(r3.x);
/*462*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*463*/	} else {
/*464*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*465*/	}
/*466*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*467*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*468*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*469*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*470*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*471*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*472*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*473*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*474*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*475*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*476*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*477*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*478*/	r2.w = inversesqrt(r2.w);
/*479*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*480*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*481*/	r2.w = r2.w + r2.w;
/*482*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*483*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*484*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*485*/	r1.x = max(r1.x, 0.000000);
/*486*/	r1.x = log2(r1.x);
/*487*/	r1.x = r1.x * 10.000000;
/*488*/	r1.x = exp2(r1.x);
/*489*/	r1.x = r3.w * r1.x;
/*490*/	r0.z = r1.x * r5.w + r0.z;
/*491*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*492*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*493*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*494*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*495*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*496*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*497*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*498*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*499*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*500*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*501*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*502*/	if(r0.x != 0) discard;
/*503*/	color1.x = 1.000000;
/*504*/	return;
}
