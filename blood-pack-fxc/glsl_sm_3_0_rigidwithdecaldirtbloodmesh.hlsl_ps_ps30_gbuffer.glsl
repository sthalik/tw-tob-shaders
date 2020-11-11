//
//
// Shader Model 4
// Fragment Shader
//
// id: 960 - fxc/glsl_SM_3_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps30_gbuffer.glsl
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
flat in uint vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].z))) * 0xffffffffu)).w;
/*3*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*4*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*5*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*6*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_N0.w);
/*9*/	r5.xyz = (r5.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r5.xyz = (r1.wwww * r5.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*12*/	r4.xyw = (r4.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r4.xyw = (r1.wwww * r4.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*15*/	r6.xyz = (r6.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r6.xyz = (r1.wwww * r6.xyzx + cb3.data[2].xyzx).xyz;
/*17*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*19*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*21*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*23*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*24*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*31*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*32*/	r4.w = 1.000000;
/*33*/	r1.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*34*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*35*/	r4.xy = (-cb2.data[3].xyxx + cb2.data[3].zwzz).xy;
/*36*/	r4.zw = (vsOut_T1.xxxy + -cb2.data[3].xxxy).zw;
/*37*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*38*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*39*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*40*/	r4.z = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r5.x));
/*41*/	r4.z = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r4.z));
/*42*/	r4.z = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r4.z));
/*43*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyxx.st)).xyzw;
/*44*/	r6.xyzw = (texture(s_decal_normal, r4.xyxx.st)).xyzw;
/*45*/	if(floatBitsToUint(r4.z) != 0u) {
/*46*/	  r4.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*47*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*48*/	  r4.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*49*/	  r4.w = -r4.w + 1.000000;
/*50*/	  r4.w = max(r4.w, 0.000000);
/*51*/	  r4.z = sqrt(r4.w);
/*52*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*53*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*54*/	  r4.w = r2.x * r7.w;
/*55*/	  r2.x = r4.w * -0.500000 + r2.x;
/*56*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*57*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*58*/	  r4.w = -r5.w * r6.w + 1.000000;
/*59*/	  r0.xyz = (r4.wwww * r0.xyzx + r7.xyzx).xyz;
/*60*/	  r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*61*/	  r3.xyz = (r7.wwww * r4.xyzx + r3.xyzx).xyz;
/*62*/	}
/*63*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*64*/	r4.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*65*/	r5.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.yzyy).xy;
/*66*/	r5.xyzw = (texture(s_decal_dirt_map, r5.xyxx.st)).xyzw;
/*67*/	r5.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*68*/	r4.z = r4.w * r5.w;
/*69*/	r6.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*70*/	r0.xyz = (r4.zzzz * r6.xyzx + r0.xyzx).xyz;
/*71*/	r3.xy = (r5.xyxx * r4.wwww + r3.xyxx).xy;
/*72*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*73*/	r4.w = inversesqrt(r4.w);
/*74*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*75*/	r4.xy = (r4.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*76*/	r5.xyzw = (texture(s_decal_blood_map, r4.xyxx.st)).xyzw;
/*77*/	r4.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*78*/	r4.x = saturate(-r4.x + r5.w);
/*79*/	r4.x = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*80*/	if(floatBitsToUint(r4.x) != 0u) {
/*81*/	  r4.x = -r5.w + 1.000000;
/*82*/	  r4.x = saturate(vsOut_T7.w * 0.900000 + -r4.x);
/*83*/	  r4.x = -r4.x + 1.000000;
/*84*/	  r4.x = -r4.x * r4.x + 1.000000;
/*85*/	  r4.x = r4.x * -0.600000 + 1.000000;
/*86*/	  r4.xyw = (r4.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*87*/	  r5.x = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*88*/	  r5.x = uintBitsToFloat((r5.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*89*/	  r5.x = uintBitsToFloat(floatBitsToUint(r5.x) & uint(0x3f800000u));
/*90*/	  r5.yzw = (r0.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r4.xxww).yzw;
/*91*/	  r0.xyz = (r5.xxxx * r5.yzwy + r4.xywx).xyz;
/*92*/	  r4.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*93*/	  r2.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*94*/	} else {
/*95*/	  r5.xyz = (r1.xyzx * r4.zzzz).xyz;
/*96*/	  r4.xyw = (r5.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r1.xyxz).xyw;
/*97*/	}
/*98*/	r1.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*99*/	r1.x = inversesqrt(r1.x);
/*100*/	r1.xyz = (r1.xxxx * vsOut_T3.xyzx).xyz;
/*101*/	r4.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*102*/	r4.z = inversesqrt(r4.z);
/*103*/	r5.xyz = (r4.zzzz * vsOut_T4.xyzx).xyz;
/*104*/	r4.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*105*/	r4.z = inversesqrt(r4.z);
/*106*/	r6.xyz = (r4.zzzz * vsOut_T2.xyzx).xyz;
/*107*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*108*/	r7.xyz = (r3.xxxx * r1.xyzx + r7.xyzx).xyz;
/*109*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*110*/	r4.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*111*/	r4.z = inversesqrt(r4.z);
/*112*/	r7.xyz = (r4.zzzz * r7.xyzx).xyz;
/*113*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*114*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*115*/	if(floatBitsToUint(r0.w) != 0u) {
/*116*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*117*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*118*/	  r0.w = r7.y * cb0.data[26].x;
/*119*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*120*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*121*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*122*/	  r4.xyw = (r7.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r4.xyxw).xyw;
/*123*/	  r2.xw = (r2.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*124*/	}
/*125*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*126*/	if(floatBitsToUint(r0.w) != 0u) {
/*127*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*128*/	  if(floatBitsToUint(r0.w) != 0u) {
/*129*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*130*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*131*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*132*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*133*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*134*/	    r0.w = -r0.w + 1.000000;
/*135*/	    r0.w = max(r0.w, 0.000000);
/*136*/	    r8.z = sqrt(r0.w);
/*137*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*138*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*139*/	    r0.w = inversesqrt(r0.w);
/*140*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*141*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*142*/	    r10.y = -1.000000;
/*143*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*144*/	    r0.w = inversesqrt(r0.w);
/*145*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*146*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*147*/	    r4.z = cb1.data[1].x * cb1.data[1].x;
/*148*/	    r4.z = r4.z * 1.250000;
/*149*/	    r4.z = min(r4.z, 1.000000);
/*150*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*151*/	    r5.w = r5.w * 4.000000;
/*152*/	    r4.z = r4.z * 0.200000 + r5.w;
/*153*/	    r4.z = r4.z * -0.700000 + 1.000000;
/*154*/	    r0.w = r0.w + -r4.z;
/*155*/	    r0.w = saturate(r0.w * 200.000000);
/*156*/	    r4.z = r0.w * -2.000000 + 3.000000;
/*157*/	    r0.w = r0.w * r0.w;
/*158*/	    r0.w = r0.w * r4.z;
/*159*/	    r2.w = r0.w * -r2.w + r2.w;
/*160*/	    r4.z = -r2.x + 0.200000;
/*161*/	    r2.x = r0.w * r4.z + r2.x;
/*162*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*163*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*164*/	    r9.xyz = (-r4.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*165*/	    r4.xyw = (r0.wwww * r9.xyxz + r4.xyxw).xyw;
/*166*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*167*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*168*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*169*/	    r4.z = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*170*/	    r4.z = -r4.z + 1.000000;
/*171*/	    r4.z = max(r4.z, 0.000000);
/*172*/	    r7.z = sqrt(r4.z);
/*173*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*174*/	    r4.z = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*175*/	    r4.z = sqrt(r4.z);
/*176*/	    r7.xyz = (r8.xyzx * r4.zzzz + r7.xyzx).xyz;
/*177*/	    r4.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*178*/	    r4.z = inversesqrt(r4.z);
/*179*/	    r7.xyz = (r4.zzzz * r7.xyzx).xyz;
/*180*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*181*/	    r1.xyz = (r7.xxxx * r1.xyzx + r5.xyzx).xyz;
/*182*/	    r1.xyz = (r7.zzzz * r6.xyzx + r1.xyzx).xyz;
/*183*/	    r4.z = -r3.y + 1.000000;
/*184*/	    r0.w = min(r0.w, r4.z);
/*185*/	    r1.xyz = (-r3.xyzx + r1.xyzx).xyz;
/*186*/	    r1.xyz = (r0.wwww * r1.xyzx + r3.xyzx).xyz;
/*187*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*188*/	    r0.w = inversesqrt(r0.w);
/*189*/	    r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*190*/	  }
/*191*/	}
/*192*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*193*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*194*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*195*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*196*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*197*/	r1.xyz = (-r0.xyzx + r1.xxxx).xyz;
/*198*/	r0.xyz = (vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*199*/	r1.x = dot(vec3(r4.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*200*/	r1.xyz = (-r4.xywx + r1.xxxx).xyz;
/*201*/	r4.xyz = (vsOut_T7.zzzz * r1.xyzx + r4.xywx).xyz;
/*202*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*203*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*204*/	r1.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*205*/	r1.x = inversesqrt(r1.x);
/*206*/	r1.xyz = (r1.xxxx * r3.xyzx).xyz;
/*207*/	color3.x = r1.w / r3.w;
/*208*/	r1.w = max(abs(r1.z), abs(r1.y));
/*209*/	r1.w = max(r1.w, abs(r1.x));
/*210*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*211*/	r2.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*212*/	color0.xyzw = saturate(r2.xyzw);
/*213*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*214*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*215*/	color2.xyzw = saturate(r4.xyzw);
/*216*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*217*/	color4 = vsOut_P1;
/*218*/	return;
}
