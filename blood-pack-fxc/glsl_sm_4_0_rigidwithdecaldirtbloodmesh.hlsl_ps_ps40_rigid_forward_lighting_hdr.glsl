//
//
// Shader Model 4
// Fragment Shader
//
// id: 990 - fxc/glsl_SM_4_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb3.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*19*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb4.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb4.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb4.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb4.data[2].xyxz).xyw;
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
/*41*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*42*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*43*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*44*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*45*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*46*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*47*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*48*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*49*/	r4.z = vsOut_T6.x;
/*50*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*51*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*52*/	if(floatBitsToUint(r1.w) != 0u) {
/*53*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*54*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*55*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*56*/	  r1.w = -r1.w + 1.000000;
/*57*/	  r1.w = max(r1.w, 0.000000);
/*58*/	  r4.z = sqrt(r1.w);
/*59*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*60*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*61*/	  r1.w = r3.y * r7.w;
/*62*/	  r3.y = r1.w * -0.500000 + r3.y;
/*63*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*64*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*65*/	  r1.w = -r5.w * r6.w + 1.000000;
/*66*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*67*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*68*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*69*/	}
/*70*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*71*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
/*72*/	r4.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*73*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*74*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*75*/	r1.w = r4.w * r5.w;
/*76*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*77*/	r0.xyw = (r1.wwww * r5.xyxz + r0.xyxw).xyw;
/*78*/	r1.xy = (r4.xyxx * r4.wwww + r1.xyxx).xy;
/*79*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*80*/	r2.w = inversesqrt(r2.w);
/*81*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*82*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*83*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*84*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*85*/	r2.w = saturate(-r2.w + r4.w);
/*86*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*87*/	if(floatBitsToUint(r2.w) != 0u) {
/*88*/	  r2.w = -r4.w + 1.000000;
/*89*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*90*/	  r2.w = -r2.w + 1.000000;
/*91*/	  r2.w = -r2.w * r2.w + 1.000000;
/*92*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*93*/	  r4.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*94*/	  r2.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*95*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*96*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*97*/	  r5.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*98*/	  r0.xyw = (r2.wwww * r5.xyxz + r4.xyxz).xyw;
/*99*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*100*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*101*/	} else {
/*102*/	  r5.xyz = (r1.wwww * r2.xyzx).xyz;
/*103*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*104*/	}
/*105*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*106*/	r1.w = inversesqrt(r1.w);
/*107*/	r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*108*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*109*/	r1.w = inversesqrt(r1.w);
/*110*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*111*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*112*/	r1.w = inversesqrt(r1.w);
/*113*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*114*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*115*/	r7.xyz = (r1.xxxx * r2.xyzx + r7.xyzx).xyz;
/*116*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*117*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*118*/	r1.w = inversesqrt(r1.w);
/*119*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*120*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*121*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*122*/	if(floatBitsToUint(r0.z) != 0u) {
/*123*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*124*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*125*/	  r0.z = r3.w * cb0.data[26].x;
/*126*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*127*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*128*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*129*/	  r4.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r4.xyzx).xyz;
/*130*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*131*/	}
/*132*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*133*/	if(floatBitsToUint(r0.z) != 0u) {
/*134*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*135*/	  if(floatBitsToUint(r0.z) != 0u) {
/*136*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*137*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*138*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*139*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*140*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*141*/	    r0.z = -r0.z + 1.000000;
/*142*/	    r0.z = max(r0.z, 0.000000);
/*143*/	    r8.z = sqrt(r0.z);
/*144*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*145*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*146*/	    r0.z = inversesqrt(r0.z);
/*147*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*148*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*149*/	    r10.y = -1.000000;
/*150*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*151*/	    r0.z = inversesqrt(r0.z);
/*152*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*153*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*154*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*155*/	    r1.w = r1.w * 1.250000;
/*156*/	    r1.w = min(r1.w, 1.000000);
/*157*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*158*/	    r2.w = r2.w * 4.000000;
/*159*/	    r1.w = r1.w * 0.200000 + r2.w;
/*160*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*161*/	    r0.z = r0.z + -r1.w;
/*162*/	    r0.z = saturate(r0.z * 200.000000);
/*163*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*164*/	    r0.z = r0.z * r0.z;
/*165*/	    r0.z = r0.z * r1.w;
/*166*/	    r3.x = r0.z * -r3.x + r3.x;
/*167*/	    r1.w = -r3.y + 0.200000;
/*168*/	    r3.y = r0.z * r1.w + r3.y;
/*169*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*170*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*171*/	    r9.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*172*/	    r4.xyz = (r0.zzzz * r9.xyzx + r4.xyzx).xyz;
/*173*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*174*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*175*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*176*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*177*/	    r1.w = -r1.w + 1.000000;
/*178*/	    r1.w = max(r1.w, 0.000000);
/*179*/	    r7.z = sqrt(r1.w);
/*180*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*181*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*182*/	    r1.w = sqrt(r1.w);
/*183*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*184*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*185*/	    r1.w = inversesqrt(r1.w);
/*186*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*187*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*188*/	    r2.xyz = (r7.xxxx * r2.xyzx + r5.xyzx).xyz;
/*189*/	    r2.xyz = (r7.zzzz * r6.xyzx + r2.xyzx).xyz;
/*190*/	    r1.w = -r1.y + 1.000000;
/*191*/	    r0.z = min(r0.z, r1.w);
/*192*/	    r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*193*/	    r2.xyz = (r0.zzzz * r2.xyzx + r1.xyzx).xyz;
/*194*/	    r0.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*195*/	    r0.z = inversesqrt(r0.z);
/*196*/	    r1.xyz = (r0.zzzz * r2.xyzx).xyz;
/*197*/	  }
/*198*/	}
/*199*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*200*/	r2.xyz = (r0.xywx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*201*/	r2.xyz = (-r0.xywx + r2.xyzx).xyz;
/*202*/	r0.xyw = saturate(vsOut_T7.yyyy * r2.xyxz + r0.xyxw).xyw;
/*203*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*204*/	r2.xyz = (-r0.xywx + r1.wwww).xyz;
/*205*/	r0.xyw = (vsOut_T7.zzzz * r2.xyxz + r0.xyxw).xyw;
/*206*/	r1.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*207*/	r2.xyz = (-r4.xyzx + r1.wwww).xyz;
/*208*/	r2.xyz = (vsOut_T7.zzzz * r2.xyzx + r4.xyzx).xyz;
/*209*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*210*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*211*/	r1.w = inversesqrt(r1.w);
/*212*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*213*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*214*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*215*/	r1.w = inversesqrt(r1.w);
/*216*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*217*/	r1.w = -r3.x + 1.000000;
/*218*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*219*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*220*/	r4.x = r4.x + r4.x;
/*221*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*222*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*223*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*224*/	r4.w = cos((r6.x));
/*225*/	r4.w = inversesqrt(r4.w);
/*226*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*227*/	r5.w = saturate(r0.z * 60.000000);
/*228*/	r5.w = -r0.z + r5.w;
/*229*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*230*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*231*/	r7.x = inversesqrt(r7.x);
/*232*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*233*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*234*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*235*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*236*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*237*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*238*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*239*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*240*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*241*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*242*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*243*/	r5.y = -r0.z + 1.000000;
/*244*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*245*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*246*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*247*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*248*/	  r5.y = max(r5.y, 0.000000);
/*249*/	  r5.y = log2(r5.y);
/*250*/	  r5.y = r5.y * 10.000000;
/*251*/	  r5.y = exp2(r5.y);
/*252*/	  r5.y = r4.w * r5.y;
/*253*/	  r5.y = r5.y * r5.w + r0.z;
/*254*/	  r7.x = r1.w * 8.000000;
/*255*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*256*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*257*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*258*/	}
/*259*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*260*/	r7.x = max(r5.y, 0.000000);
/*261*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*262*/	if(floatBitsToUint(r5.y) != 0u) {
/*263*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*264*/	  r4.x = max(r4.x, -1.000000);
/*265*/	  r4.x = min(r4.x, 1.000000);
/*266*/	  r4.y = -abs(r4.x) + 1.000000;
/*267*/	  r4.y = sqrt(r4.y);
/*268*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*269*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*270*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*271*/	  r5.y = r4.y * r4.z;
/*272*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*273*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*274*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*275*/	  r4.x = r4.z * r4.y + r4.x;
/*276*/	  r3.x = r3.x * r3.x;
/*277*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*278*/	  r2.w = r3.x * r2.w + r5.x;
/*279*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*280*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*281*/	  r3.x = -r2.w * r2.w + 1.000000;
/*282*/	  r3.x = max(r3.x, 0.001000);
/*283*/	  r3.x = log2(r3.x);
/*284*/	  r4.y = r3.x * 4.950617;
/*285*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*286*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*287*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*288*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*289*/	  r2.w = floatBitsToInt(r2.w);
/*290*/	  r4.y = r3.x * r3.x + -r4.y;
/*291*/	  r4.y = sqrt(r4.y);
/*292*/	  r3.x = -r3.x + r4.y;
/*293*/	  r3.x = max(r3.x, 0.000000);
/*294*/	  r3.x = sqrt(r3.x);
/*295*/	  r2.w = r2.w * r3.x;
/*296*/	  r2.w = r2.w * 1.414214;
/*297*/	  r2.w = 0.008727 / r2.w;
/*298*/	  r2.w = max(r2.w, 0.000100);
/*299*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*300*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*301*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*302*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*303*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*304*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*305*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*306*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*307*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*308*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*309*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*310*/	  r2.w = floatBitsToInt(r2.w);
/*311*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*312*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*313*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*314*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*315*/	  r2.w = r2.w * r4.x + 1.000000;
/*316*/	  r2.w = r2.w * 0.500000;
/*317*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*318*/	  r3.x = r3.x * r4.y + 1.000000;
/*319*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*320*/	  r3.x = min(r7.x, 1.000000);
/*321*/	  r1.w = r1.w * 1.570796;
/*322*/	  r1.w = sin(r1.w);
/*323*/	  r3.x = r3.x + -1.000000;
/*324*/	  r1.w = r1.w * r3.x + 1.000000;
/*325*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*326*/	  r3.x = max(r3.x, 0.000000);
/*327*/	  r3.x = log2(r3.x);
/*328*/	  r3.x = r3.x * 10.000000;
/*329*/	  r3.x = exp2(r3.x);
/*330*/	  r3.x = r4.w * r3.x;
/*331*/	  r3.x = r3.x * r5.w + r0.z;
/*332*/	  r1.w = r1.w * abs(r2.w);
/*333*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*334*/	} else {
/*335*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*336*/	}
/*337*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*338*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*339*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*340*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*341*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*342*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*343*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*344*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*345*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*346*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*347*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*348*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*349*/	r1.w = inversesqrt(r1.w);
/*350*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*351*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*352*/	r1.w = r1.w + r1.w;
/*353*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*354*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*355*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*356*/	r1.x = max(r1.x, 0.000000);
/*357*/	r1.x = log2(r1.x);
/*358*/	r1.x = r1.x * 10.000000;
/*359*/	r1.x = exp2(r1.x);
/*360*/	r1.x = r4.w * r1.x;
/*361*/	r0.z = r1.x * r5.w + r0.z;
/*362*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*363*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*364*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*365*/	r0.w = 1.000000;
/*366*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*367*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*368*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*369*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*370*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*371*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*372*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*373*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*374*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*375*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*376*/	if(r0.x != 0) discard;
/*377*/	color1.x = 1.000000;
/*378*/	return;
}
