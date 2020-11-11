//
//
// Shader Model 4
// Fragment Shader
//
// id: 1237 - fxc/glsl_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_rigid_forward_lighting_gamma_correct_LDR.glsl
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*7*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*8*/	r0.y = r1.w + -0.500000;
/*9*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*10*/	if(r0.y != 0) discard;
/*11*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*12*/	color0.w = r0.x * r1.w;
/*13*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*15*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*16*/	r0.x = saturate(vsOut_N0.w);
/*17*/	r3.xyz = (r3.xyzx + -cb6.data[0].xyzx).xyz;
/*18*/	r3.xyz = (r0.xxxx * r3.xyzx + cb6.data[0].xyzx).xyz;
/*19*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*20*/	r4.xyz = (r4.xyzx + -cb6.data[1].xyzx).xyz;
/*21*/	r4.xyz = (r0.xxxx * r4.xyzx + cb6.data[1].xyzx).xyz;
/*22*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*23*/	r5.xyz = (r5.xyzx + -cb6.data[2].xyzx).xyz;
/*24*/	r0.xyw = (r0.xxxx * r5.xyxz + cb6.data[2].xyxz).xyw;
/*25*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*27*/	r3.xyz = (r4.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r2.yyyy * r3.xyzx + r1.xyzx).xyz;
/*29*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*30*/	r0.xyw = (r2.zzzz * r0.xyxw + r1.xyxz).xyw;
/*31*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*33*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*34*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*35*/	r1.w = -r1.w + 1.000000;
/*36*/	r1.w = max(r1.w, 0.000000);
/*37*/	r1.z = sqrt(r1.w);
/*38*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*39*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*40*/	r2.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx).xy;
/*41*/	r3.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx + vsOut_T6.yzyy).xy;
/*42*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*43*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*44*/	r1.w = r2.w * r3.w;
/*45*/	r4.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*46*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*47*/	r1.xy = (r3.xyxx * r2.wwww + r1.xyxx).xy;
/*48*/	r2.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*49*/	r2.z = inversesqrt(r2.z);
/*50*/	r1.xyz = (r1.xyzx * r2.zzzz).xyz;
/*51*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*52*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*53*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*54*/	r2.x = saturate(-r2.x + r2.w);
/*55*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*56*/	if(floatBitsToUint(r2.x) != 0u) {
/*57*/	  r2.x = -r2.w + 1.000000;
/*58*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*59*/	  r2.x = -r2.x + 1.000000;
/*60*/	  r2.x = -r2.x * r2.x + 1.000000;
/*61*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*62*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*63*/	  r2.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*64*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*65*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*66*/	  r3.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*67*/	  r0.xyw = (r2.wwww * r3.xyxz + r2.xyxz).xyw;
/*68*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*69*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*70*/	} else {
/*71*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*72*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*73*/	  r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*74*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*75*/	}
/*76*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*79*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*82*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*85*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*86*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*87*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*88*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*89*/	r1.w = inversesqrt(r1.w);
/*90*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*91*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*92*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*93*/	if(floatBitsToUint(r0.z) != 0u) {
/*94*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*95*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*96*/	  r0.z = r3.w * cb1.data[26].x;
/*97*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*98*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*99*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*100*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*101*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*102*/	}
/*103*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*104*/	if(floatBitsToUint(r0.z) != 0u) {
/*105*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*106*/	  if(floatBitsToUint(r0.z) != 0u) {
/*107*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*108*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*109*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*110*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*111*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*112*/	    r0.z = -r0.z + 1.000000;
/*113*/	    r0.z = max(r0.z, 0.000000);
/*114*/	    r8.z = sqrt(r0.z);
/*115*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*116*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*117*/	    r0.z = inversesqrt(r0.z);
/*118*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*119*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*120*/	    r10.y = -1.000000;
/*121*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*122*/	    r0.z = inversesqrt(r0.z);
/*123*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*124*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*125*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*126*/	    r1.w = r1.w * 1.250000;
/*127*/	    r1.w = min(r1.w, 1.000000);
/*128*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*129*/	    r2.w = r2.w * 4.000000;
/*130*/	    r1.w = r1.w * 0.200000 + r2.w;
/*131*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*132*/	    r0.z = r0.z + -r1.w;
/*133*/	    r0.z = saturate(r0.z * 200.000000);
/*134*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*135*/	    r0.z = r0.z * r0.z;
/*136*/	    r0.z = r0.z * r1.w;
/*137*/	    r3.x = r0.z * -r3.x + r3.x;
/*138*/	    r1.w = -r3.y + 0.200000;
/*139*/	    r3.y = r0.z * r1.w + r3.y;
/*140*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*141*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*142*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*143*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*144*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*145*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*146*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*147*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*148*/	    r1.w = -r1.w + 1.000000;
/*149*/	    r1.w = max(r1.w, 0.000000);
/*150*/	    r7.z = sqrt(r1.w);
/*151*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*152*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*153*/	    r1.w = sqrt(r1.w);
/*154*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*155*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*156*/	    r1.w = inversesqrt(r1.w);
/*157*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*158*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*159*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*160*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*161*/	    r1.w = -r1.y + 1.000000;
/*162*/	    r0.z = min(r0.z, r1.w);
/*163*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*164*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*165*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*166*/	    r0.z = inversesqrt(r0.z);
/*167*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*168*/	  }
/*169*/	}
/*170*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*171*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*172*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*173*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*174*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*175*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*176*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*177*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*178*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*179*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*180*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*181*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*182*/	r1.w = inversesqrt(r1.w);
/*183*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*184*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*185*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*186*/	r2.w = inversesqrt(r1.w);
/*187*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*188*/	r2.w = -r3.x + 1.000000;
/*189*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*190*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*191*/	r5.y = r5.y + r5.y;
/*192*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*193*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*194*/	r6.w = r2.w * 1.539380;
/*195*/	r6.w = cos((r6.w));
/*196*/	r6.w = inversesqrt(r6.w);
/*197*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*198*/	r7.x = saturate(r0.z * 60.000000);
/*199*/	r7.x = -r0.z + r7.x;
/*200*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*201*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*202*/	r8.x = inversesqrt(r8.x);
/*203*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*204*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*205*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*206*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*207*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*208*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*209*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*210*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*211*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*212*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*213*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*214*/	r6.y = -r0.z + 1.000000;
/*215*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*216*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*217*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*218*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*219*/	  r6.y = max(r6.y, 0.000000);
/*220*/	  r6.y = log2(r6.y);
/*221*/	  r6.y = r6.y * 10.000000;
/*222*/	  r6.y = exp2(r6.y);
/*223*/	  r6.y = r6.w * r6.y;
/*224*/	  r6.y = r6.y * r7.x + r0.z;
/*225*/	  r8.x = r2.w * 8.000000;
/*226*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*227*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*228*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*229*/	}
/*230*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*231*/	r1.y = max(r1.x, 0.000000);
/*232*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*233*/	if(floatBitsToUint(r1.x) != 0u) {
/*234*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*235*/	  r1.x = max(r1.x, -1.000000);
/*236*/	  r1.x = min(r1.x, 1.000000);
/*237*/	  r1.z = -abs(r1.x) + 1.000000;
/*238*/	  r1.z = sqrt(r1.z);
/*239*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*240*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*241*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*242*/	  r5.z = r1.z * r5.y;
/*243*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*244*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*245*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*246*/	  r1.x = r5.y * r1.z + r1.x;
/*247*/	  r1.z = r3.x * r3.x;
/*248*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*249*/	  r1.z = r1.z * r3.x + r6.x;
/*250*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*251*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*252*/	  r3.x = -r1.z * r1.z + 1.000000;
/*253*/	  r3.x = max(r3.x, 0.001000);
/*254*/	  r3.x = log2(r3.x);
/*255*/	  r5.x = r3.x * 4.950617;
/*256*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*257*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*258*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*259*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*260*/	  r1.z = floatBitsToInt(r1.z);
/*261*/	  r5.x = r3.x * r3.x + -r5.x;
/*262*/	  r5.x = sqrt(r5.x);
/*263*/	  r3.x = -r3.x + r5.x;
/*264*/	  r3.x = max(r3.x, 0.000000);
/*265*/	  r3.x = sqrt(r3.x);
/*266*/	  r1.z = r1.z * r3.x;
/*267*/	  r1.z = r1.z * 1.414214;
/*268*/	  r1.z = 0.008727 / r1.z;
/*269*/	  r1.z = max(r1.z, 0.000100);
/*270*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*271*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*272*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*273*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*274*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*275*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*276*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*277*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*278*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*279*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*280*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*281*/	  r1.x = floatBitsToInt(r1.x);
/*282*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*283*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*284*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*285*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*286*/	  r1.x = r1.x * r5.x + 1.000000;
/*287*/	  r1.x = r1.x * 0.500000;
/*288*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*289*/	  r1.z = r1.z * r5.y + 1.000000;
/*290*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*291*/	  r1.z = min(r1.y, 1.000000);
/*292*/	  r2.w = r2.w * 1.570796;
/*293*/	  r2.w = sin(r2.w);
/*294*/	  r1.z = r1.z + -1.000000;
/*295*/	  r1.z = r2.w * r1.z + 1.000000;
/*296*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*297*/	  r2.w = max(r2.w, 0.000000);
/*298*/	  r2.w = log2(r2.w);
/*299*/	  r2.w = r2.w * 10.000000;
/*300*/	  r2.w = exp2(r2.w);
/*301*/	  r2.w = r6.w * r2.w;
/*302*/	  r2.w = r2.w * r7.x + r0.z;
/*303*/	  r1.x = r1.z * abs(r1.x);
/*304*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*305*/	} else {
/*306*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*307*/	}
/*308*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*309*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*310*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*311*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*312*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*313*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*314*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*315*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*316*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*317*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*318*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*319*/	r2.w = 1.000000;
/*320*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*321*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*322*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*323*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*324*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*325*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*326*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*327*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*328*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*329*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*330*/	if(r0.w != 0) discard;
/*331*/	r0.w = sqrt(r1.w);
/*332*/	r1.x = saturate(cb3.data[0].w)/**/;
/*333*/	r1.x = -r1.x + 1.000000;
/*334*/	r1.x = r1.x * 8.000000 + -4.000000;
/*335*/	r1.y = saturate(cb3.data[1].x)/**/;
/*336*/	r1.y = -r1.y + 1.000000;
/*337*/	r1.y = r1.y * 1000.000000;
/*338*/	r0.w = r0.w / r1.y;
/*339*/	r0.w = r0.w + r1.x;
/*340*/	r0.w = r0.w * 1.442695;
/*341*/	r0.w = exp2(r0.w);
/*342*/	r0.w = cb3.data[1].y / r0.w;
/*343*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*344*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*345*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*346*/	r1.x = r1.x + -cb3.data[1].z;
/*347*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*348*/	r1.x = saturate(r1.y * r1.x);
/*349*/	r1.y = r1.x * -2.000000 + 3.000000;
/*350*/	r1.x = r1.x * r1.x;
/*351*/	r1.x = r1.x * r1.y;
/*352*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*353*/	r1.y = sqrt(r1.y);
/*354*/	r1.z = max(cb3.data[2].z, 0.001000);
/*355*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*356*/	r1.y = r1.z * r1.y;
/*357*/	r1.y = min(r1.y, 1.000000);
/*358*/	r1.z = r1.y * -2.000000 + 3.000000;
/*359*/	r1.y = r1.y * r1.y;
/*360*/	r1.y = r1.y * r1.z;
/*361*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*362*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*363*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*364*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*365*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*366*/	r4.w = max(r4.y, 0.000000);
/*367*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*368*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*369*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*370*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*371*/	r0.w = saturate(r0.w * r1.y);
/*372*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*373*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*374*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*375*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*376*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*377*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*378*/	return;
}
