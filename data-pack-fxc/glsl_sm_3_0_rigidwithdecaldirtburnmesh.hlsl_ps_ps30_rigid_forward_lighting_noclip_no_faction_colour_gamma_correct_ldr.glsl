//
//
// Shader Model 4
// Fragment Shader
//
// id: 1039 - fxc/glsl_SM_3_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;

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
/*47*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*48*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.yyyz).zw;
/*49*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*50*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*51*/	r1.w = r4.w * r5.w;
/*52*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*53*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*54*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*55*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*56*/	r2.w = inversesqrt(r2.w);
/*57*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*58*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*59*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*60*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*61*/	r4.x = 0;
/*62*/	r4.y = cb1.data[26].x * 0.050000;
/*63*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*64*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*65*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*66*/	r1.w = saturate(r4.x * 5.000000);
/*67*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*68*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*70*/	r2.w = log2(r5.z);
/*71*/	r2.w = r2.w * 1.800000;
/*72*/	r2.w = exp2(r2.w);
/*73*/	r2.w = r2.w * 10.000000;
/*74*/	r2.w = min(r2.w, 1.000000);
/*75*/	r1.w = r1.w + r2.w;
/*76*/	r1.w = r1.w * 0.500000;
/*77*/	r2.w = -r5.w + 1.000000;
/*78*/	r2.w = log2(r2.w);
/*79*/	r2.w = r2.w * vsOut_T7.x;
/*80*/	r2.w = exp2(r2.w);
/*81*/	r2.w = min(r2.w, 1.000000);
/*82*/	r2.w = r2.w * vsOut_T7.x;
/*83*/	r3.z = r5.z * 0.250000;
/*84*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*85*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*86*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*87*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*88*/	r1.w = vsOut_T7.x + -0.025000;
/*89*/	r1.w = max(r1.w, 0.000000);
/*90*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*91*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*92*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*95*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*96*/	r1.w = inversesqrt(r1.w);
/*97*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*98*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*101*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*102*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*103*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*104*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*105*/	r1.w = inversesqrt(r1.w);
/*106*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*107*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*108*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*109*/	if(floatBitsToUint(r0.w) != 0u) {
/*110*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*111*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*112*/	  r0.w = r3.w * cb1.data[26].x;
/*113*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*114*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*115*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*116*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*117*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*118*/	}
/*119*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*120*/	if(floatBitsToUint(r0.w) != 0u) {
/*121*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*122*/	  if(floatBitsToUint(r0.w) != 0u) {
/*123*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*124*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*125*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*126*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*127*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*128*/	    r0.w = -r0.w + 1.000000;
/*129*/	    r0.w = max(r0.w, 0.000000);
/*130*/	    r8.z = sqrt(r0.w);
/*131*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*132*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*133*/	    r0.w = inversesqrt(r0.w);
/*134*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*135*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*136*/	    r10.y = -1.000000;
/*137*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*138*/	    r0.w = inversesqrt(r0.w);
/*139*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*140*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*141*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*142*/	    r1.w = r1.w * 1.250000;
/*143*/	    r1.w = min(r1.w, 1.000000);
/*144*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*145*/	    r2.w = r2.w * 4.000000;
/*146*/	    r1.w = r1.w * 0.200000 + r2.w;
/*147*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*148*/	    r0.w = r0.w + -r1.w;
/*149*/	    r0.w = saturate(r0.w * 200.000000);
/*150*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*151*/	    r0.w = r0.w * r0.w;
/*152*/	    r0.w = r0.w * r1.w;
/*153*/	    r3.y = r0.w * -r3.y + r3.y;
/*154*/	    r1.w = -r3.x + 0.200000;
/*155*/	    r3.x = r0.w * r1.w + r3.x;
/*156*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*157*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*158*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*159*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*160*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*161*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*162*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*163*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*164*/	    r1.w = -r1.w + 1.000000;
/*165*/	    r1.w = max(r1.w, 0.000000);
/*166*/	    r7.z = sqrt(r1.w);
/*167*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*168*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*169*/	    r1.w = sqrt(r1.w);
/*170*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*171*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*172*/	    r1.w = inversesqrt(r1.w);
/*173*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*174*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*175*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*176*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*177*/	    r1.w = -r0.y + 1.000000;
/*178*/	    r0.w = min(r0.w, r1.w);
/*179*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*180*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*181*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*182*/	    r0.w = inversesqrt(r0.w);
/*183*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*184*/	  }
/*185*/	}
/*186*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*187*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*188*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*189*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*190*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*191*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*192*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*193*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*194*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*195*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*196*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*197*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*198*/	r1.w = inversesqrt(r1.w);
/*199*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*200*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*201*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*202*/	r2.w = inversesqrt(r1.w);
/*203*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*204*/	r2.w = -r3.y + 1.000000;
/*205*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*206*/	r5.y = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*207*/	r5.y = r5.y + r5.y;
/*208*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*209*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*210*/	r6.w = r2.w * 1.539380;
/*211*/	r6.w = cos((r6.w));
/*212*/	r6.w = inversesqrt(r6.w);
/*213*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*214*/	r7.x = saturate(r0.w * 60.000000);
/*215*/	r7.x = -r0.w + r7.x;
/*216*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*217*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*218*/	r8.x = inversesqrt(r8.x);
/*219*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*220*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*221*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*222*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*223*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*224*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*225*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*226*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*227*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*228*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*229*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*230*/	r6.y = -r0.w + 1.000000;
/*231*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*232*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*233*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*234*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*235*/	  r6.y = max(r6.y, 0.000000);
/*236*/	  r6.y = log2(r6.y);
/*237*/	  r6.y = r6.y * 10.000000;
/*238*/	  r6.y = exp2(r6.y);
/*239*/	  r6.y = r6.w * r6.y;
/*240*/	  r6.y = r6.y * r7.x + r0.w;
/*241*/	  r8.x = r2.w * 8.000000;
/*242*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*243*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*244*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*245*/	}
/*246*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*247*/	r0.y = max(r0.x, 0.000000);
/*248*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*249*/	if(floatBitsToUint(r0.x) != 0u) {
/*250*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*251*/	  r0.x = max(r0.x, -1.000000);
/*252*/	  r0.x = min(r0.x, 1.000000);
/*253*/	  r0.z = -abs(r0.x) + 1.000000;
/*254*/	  r0.z = sqrt(r0.z);
/*255*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*256*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*257*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*258*/	  r5.z = r0.z * r5.y;
/*259*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*260*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*261*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*262*/	  r0.x = r5.y * r0.z + r0.x;
/*263*/	  r0.z = r3.y * r3.y;
/*264*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*265*/	  r0.z = r0.z * r3.y + r6.x;
/*266*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*267*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*268*/	  r3.y = -r0.z * r0.z + 1.000000;
/*269*/	  r3.y = max(r3.y, 0.001000);
/*270*/	  r3.y = log2(r3.y);
/*271*/	  r5.x = r3.y * 4.950617;
/*272*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*273*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*274*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*275*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*276*/	  r0.z = floatBitsToInt(r0.z);
/*277*/	  r5.x = r3.y * r3.y + -r5.x;
/*278*/	  r5.x = sqrt(r5.x);
/*279*/	  r3.y = -r3.y + r5.x;
/*280*/	  r3.y = max(r3.y, 0.000000);
/*281*/	  r3.y = sqrt(r3.y);
/*282*/	  r0.z = r0.z * r3.y;
/*283*/	  r0.z = r0.z * 1.414214;
/*284*/	  r0.z = 0.008727 / r0.z;
/*285*/	  r0.z = max(r0.z, 0.000100);
/*286*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*287*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*288*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*289*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*290*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*291*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*292*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*293*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*294*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*295*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*296*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*297*/	  r0.x = floatBitsToInt(r0.x);
/*298*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*299*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*300*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*301*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*302*/	  r0.x = r0.x * r5.x + 1.000000;
/*303*/	  r0.x = r0.x * 0.500000;
/*304*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*305*/	  r0.z = r0.z * r5.y + 1.000000;
/*306*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*307*/	  r0.z = min(r0.y, 1.000000);
/*308*/	  r2.w = r2.w * 1.570796;
/*309*/	  r2.w = sin(r2.w);
/*310*/	  r0.z = r0.z + -1.000000;
/*311*/	  r0.z = r2.w * r0.z + 1.000000;
/*312*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*313*/	  r2.w = max(r2.w, 0.000000);
/*314*/	  r2.w = log2(r2.w);
/*315*/	  r2.w = r2.w * 10.000000;
/*316*/	  r2.w = exp2(r2.w);
/*317*/	  r2.w = r6.w * r2.w;
/*318*/	  r2.w = r2.w * r7.x + r0.w;
/*319*/	  r0.x = r0.z * abs(r0.x);
/*320*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*321*/	} else {
/*322*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*323*/	}
/*324*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*325*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*326*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*327*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*328*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*329*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*330*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*331*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*332*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*333*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*334*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*335*/	r2.w = 1.000000;
/*336*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*337*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*338*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*339*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*340*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*341*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*342*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*343*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*344*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*345*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*346*/	if(r0.w != 0) discard;
/*347*/	r0.w = sqrt(r1.w);
/*348*/	r1.x = saturate(cb3.data[0].w)/**/;
/*349*/	r1.x = -r1.x + 1.000000;
/*350*/	r1.x = r1.x * 8.000000 + -4.000000;
/*351*/	r1.y = saturate(cb3.data[1].x)/**/;
/*352*/	r1.y = -r1.y + 1.000000;
/*353*/	r1.y = r1.y * 1000.000000;
/*354*/	r0.w = r0.w / r1.y;
/*355*/	r0.w = r0.w + r1.x;
/*356*/	r0.w = r0.w * 1.442695;
/*357*/	r0.w = exp2(r0.w);
/*358*/	r0.w = cb3.data[1].y / r0.w;
/*359*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*360*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*361*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*362*/	r1.x = r1.x + -cb3.data[1].z;
/*363*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*364*/	r1.x = saturate(r1.y * r1.x);
/*365*/	r1.y = r1.x * -2.000000 + 3.000000;
/*366*/	r1.x = r1.x * r1.x;
/*367*/	r1.x = r1.x * r1.y;
/*368*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*369*/	r1.y = sqrt(r1.y);
/*370*/	r1.z = max(cb3.data[2].z, 0.001000);
/*371*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*372*/	r1.y = r1.z * r1.y;
/*373*/	r1.y = min(r1.y, 1.000000);
/*374*/	r1.z = r1.y * -2.000000 + 3.000000;
/*375*/	r1.y = r1.y * r1.y;
/*376*/	r1.y = r1.y * r1.z;
/*377*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*378*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*379*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*380*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*381*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*382*/	r4.w = max(r4.y, 0.000000);
/*383*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*384*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*385*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*386*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*387*/	r0.w = saturate(r0.w * r1.y);
/*388*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*389*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*390*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*391*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*392*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*393*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*394*/	return;
}
