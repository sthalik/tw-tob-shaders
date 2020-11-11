//
//
// Shader Model 4
// Fragment Shader
//
// id: 1134 - fxc/glsl_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps30_alpha_overlay_40.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*15*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*17*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*18*/	r0.x = saturate(vsOut_N0.w);
/*19*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
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
/*41*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*42*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
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
/*61*/	  r1.w = r3.x * r7.w;
/*62*/	  r3.x = r1.w * -0.500000 + r3.x;
/*63*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*64*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*65*/	  r1.w = -r5.w * r6.w + 1.000000;
/*66*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*67*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*68*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*69*/	}
/*70*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*71*/	r4.x = 0;
/*72*/	r4.y = cb0.data[26].x * 0.050000;
/*73*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*74*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*75*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*76*/	r1.w = saturate(r4.x * 5.000000);
/*77*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*78*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*79*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*80*/	r2.w = log2(r5.z);
/*81*/	r2.w = r2.w * 1.800000;
/*82*/	r2.w = exp2(r2.w);
/*83*/	r2.w = r2.w * 10.000000;
/*84*/	r2.w = min(r2.w, 1.000000);
/*85*/	r1.w = r1.w + r2.w;
/*86*/	r1.w = r1.w * 0.500000;
/*87*/	r2.w = -r5.w + 1.000000;
/*88*/	r2.w = log2(r2.w);
/*89*/	r2.w = r2.w * vsOut_T7.x;
/*90*/	r2.w = exp2(r2.w);
/*91*/	r2.w = min(r2.w, 1.000000);
/*92*/	r2.w = r2.w * vsOut_T7.x;
/*93*/	r3.z = r5.z * 0.250000;
/*94*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*95*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*96*/	r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*97*/	r0.xyw = (r2.wwww * r4.xyxz + r0.xyxw).xyw;
/*98*/	r1.w = vsOut_T7.x + -0.025000;
/*99*/	r1.w = max(r1.w, 0.000000);
/*100*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*101*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*102*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*103*/	r1.w = inversesqrt(r1.w);
/*104*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*105*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*106*/	r1.w = inversesqrt(r1.w);
/*107*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*108*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*109*/	r1.w = inversesqrt(r1.w);
/*110*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*111*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*112*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*113*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*114*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*115*/	r1.w = inversesqrt(r1.w);
/*116*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*117*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*118*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*119*/	if(floatBitsToUint(r0.z) != 0u) {
/*120*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*121*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*122*/	  r0.z = r3.w * cb0.data[26].x;
/*123*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*124*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*125*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*126*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*127*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*128*/	}
/*129*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*130*/	if(floatBitsToUint(r0.z) != 0u) {
/*131*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*132*/	  if(floatBitsToUint(r0.z) != 0u) {
/*133*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*134*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*135*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*136*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*137*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*138*/	    r0.z = -r0.z + 1.000000;
/*139*/	    r0.z = max(r0.z, 0.000000);
/*140*/	    r8.z = sqrt(r0.z);
/*141*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*142*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*143*/	    r0.z = inversesqrt(r0.z);
/*144*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*145*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*146*/	    r10.y = -1.000000;
/*147*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*148*/	    r0.z = inversesqrt(r0.z);
/*149*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*150*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*151*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*152*/	    r1.w = r1.w * 1.250000;
/*153*/	    r1.w = min(r1.w, 1.000000);
/*154*/	    r2.w = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*155*/	    r2.w = r2.w * 4.000000;
/*156*/	    r1.w = r1.w * 0.200000 + r2.w;
/*157*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*158*/	    r0.z = r0.z + -r1.w;
/*159*/	    r0.z = saturate(r0.z * 200.000000);
/*160*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*161*/	    r0.z = r0.z * r0.z;
/*162*/	    r0.z = r0.z * r1.w;
/*163*/	    r3.y = r0.z * -r3.y + r3.y;
/*164*/	    r1.w = -r3.x + 0.200000;
/*165*/	    r3.x = r0.z * r1.w + r3.x;
/*166*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*167*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*168*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*169*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*170*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*171*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*172*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*173*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*174*/	    r1.w = -r1.w + 1.000000;
/*175*/	    r1.w = max(r1.w, 0.000000);
/*176*/	    r7.z = sqrt(r1.w);
/*177*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*178*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*179*/	    r1.w = sqrt(r1.w);
/*180*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*181*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*182*/	    r1.w = inversesqrt(r1.w);
/*183*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*184*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*185*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*186*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*187*/	    r1.w = -r1.y + 1.000000;
/*188*/	    r0.z = min(r0.z, r1.w);
/*189*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*190*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*191*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*192*/	    r0.z = inversesqrt(r0.z);
/*193*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*194*/	  }
/*195*/	}
/*196*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*197*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*198*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*199*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*200*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*201*/	r3.xzw = (-r0.xxyw + r1.wwww).xzw;
/*202*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*203*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*204*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*205*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*206*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*207*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*208*/	r1.w = inversesqrt(r1.w);
/*209*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*210*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*211*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*212*/	r2.w = inversesqrt(r1.w);
/*213*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*214*/	r2.w = -r3.y + 1.000000;
/*215*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*216*/	r5.y = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*217*/	r5.y = r5.y + r5.y;
/*218*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*219*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*220*/	r6.w = r2.w * 1.539380;
/*221*/	r6.w = cos((r6.w));
/*222*/	r6.w = inversesqrt(r6.w);
/*223*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*224*/	r7.x = saturate(r0.z * 60.000000);
/*225*/	r7.x = -r0.z + r7.x;
/*226*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*227*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*228*/	r8.x = inversesqrt(r8.x);
/*229*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*230*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*231*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*232*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*233*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*234*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*235*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*236*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*237*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*238*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*239*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*240*/	r6.y = -r0.z + 1.000000;
/*241*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*242*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*243*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*244*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*245*/	  r6.y = max(r6.y, 0.000000);
/*246*/	  r6.y = log2(r6.y);
/*247*/	  r6.y = r6.y * 10.000000;
/*248*/	  r6.y = exp2(r6.y);
/*249*/	  r6.y = r6.w * r6.y;
/*250*/	  r6.y = r6.y * r7.x + r0.z;
/*251*/	  r8.x = r2.w * 8.000000;
/*252*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*253*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*254*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*255*/	}
/*256*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*257*/	r1.y = max(r1.x, 0.000000);
/*258*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*259*/	if(floatBitsToUint(r1.x) != 0u) {
/*260*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*261*/	  r1.x = max(r1.x, -1.000000);
/*262*/	  r1.x = min(r1.x, 1.000000);
/*263*/	  r1.z = -abs(r1.x) + 1.000000;
/*264*/	  r1.z = sqrt(r1.z);
/*265*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*266*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*267*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*268*/	  r5.z = r1.z * r5.y;
/*269*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*270*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*271*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*272*/	  r1.x = r5.y * r1.z + r1.x;
/*273*/	  r1.z = r3.y * r3.y;
/*274*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*275*/	  r1.z = r1.z * r3.y + r6.x;
/*276*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*277*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*278*/	  r3.y = -r1.z * r1.z + 1.000000;
/*279*/	  r3.y = max(r3.y, 0.001000);
/*280*/	  r3.y = log2(r3.y);
/*281*/	  r5.x = r3.y * 4.950617;
/*282*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*283*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*284*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*285*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*286*/	  r1.z = floatBitsToInt(r1.z);
/*287*/	  r5.x = r3.y * r3.y + -r5.x;
/*288*/	  r5.x = sqrt(r5.x);
/*289*/	  r3.y = -r3.y + r5.x;
/*290*/	  r3.y = max(r3.y, 0.000000);
/*291*/	  r3.y = sqrt(r3.y);
/*292*/	  r1.z = r1.z * r3.y;
/*293*/	  r1.z = r1.z * 1.414214;
/*294*/	  r1.z = 0.008727 / r1.z;
/*295*/	  r1.z = max(r1.z, 0.000100);
/*296*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*297*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*298*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*299*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*300*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*301*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*302*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*303*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*304*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*305*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*306*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*307*/	  r1.x = floatBitsToInt(r1.x);
/*308*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*309*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*310*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*311*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*312*/	  r1.x = r1.x * r5.x + 1.000000;
/*313*/	  r1.x = r1.x * 0.500000;
/*314*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*315*/	  r1.z = r1.z * r5.y + 1.000000;
/*316*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*317*/	  r1.z = min(r1.y, 1.000000);
/*318*/	  r2.w = r2.w * 1.570796;
/*319*/	  r2.w = sin(r2.w);
/*320*/	  r1.z = r1.z + -1.000000;
/*321*/	  r1.z = r2.w * r1.z + 1.000000;
/*322*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*323*/	  r2.w = max(r2.w, 0.000000);
/*324*/	  r2.w = log2(r2.w);
/*325*/	  r2.w = r2.w * 10.000000;
/*326*/	  r2.w = exp2(r2.w);
/*327*/	  r2.w = r6.w * r2.w;
/*328*/	  r2.w = r2.w * r7.x + r0.z;
/*329*/	  r1.x = r1.z * abs(r1.x);
/*330*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*331*/	} else {
/*332*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*333*/	}
/*334*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*335*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*336*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*337*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*338*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*339*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*340*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*341*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*342*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*343*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*344*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*345*/	r2.w = 1.000000;
/*346*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*347*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*348*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*349*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*350*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*351*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*352*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*353*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*354*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*355*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*356*/	if(r0.w != 0) discard;
/*357*/	r0.w = sqrt(r1.w);
/*358*/	r1.x = saturate(cb2.data[0].w)/**/;
/*359*/	r1.x = -r1.x + 1.000000;
/*360*/	r1.x = r1.x * 8.000000 + -4.000000;
/*361*/	r1.y = saturate(cb2.data[1].x)/**/;
/*362*/	r1.y = -r1.y + 1.000000;
/*363*/	r1.y = r1.y * 1000.000000;
/*364*/	r0.w = r0.w / r1.y;
/*365*/	r0.w = r0.w + r1.x;
/*366*/	r0.w = r0.w * 1.442695;
/*367*/	r0.w = exp2(r0.w);
/*368*/	r0.w = cb2.data[1].y / r0.w;
/*369*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*370*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*371*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*372*/	r1.x = r1.x + -cb2.data[1].z;
/*373*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*374*/	r1.x = saturate(r1.y * r1.x);
/*375*/	r1.y = r1.x * -2.000000 + 3.000000;
/*376*/	r1.x = r1.x * r1.x;
/*377*/	r1.x = r1.x * r1.y;
/*378*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*379*/	r1.y = sqrt(r1.y);
/*380*/	r1.z = max(cb2.data[2].z, 0.001000);
/*381*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*382*/	r1.y = r1.z * r1.y;
/*383*/	r1.y = min(r1.y, 1.000000);
/*384*/	r1.z = r1.y * -2.000000 + 3.000000;
/*385*/	r1.y = r1.y * r1.y;
/*386*/	r1.y = r1.y * r1.z;
/*387*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*388*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*389*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*390*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*391*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*392*/	r4.w = max(r4.y, 0.000000);
/*393*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*394*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*395*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*396*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*397*/	r0.w = saturate(r0.w * r1.y);
/*398*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*399*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*400*/	return;
}
