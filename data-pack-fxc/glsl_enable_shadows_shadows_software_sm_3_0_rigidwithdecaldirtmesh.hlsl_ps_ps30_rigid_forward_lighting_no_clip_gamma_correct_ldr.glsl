//
//
// Shader Model 4
// Fragment Shader
//
// id: 4949 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdecaldirtmesh.hlsl_PS_ps30_rigid_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
/*78*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*81*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*82*/	r1.w = inversesqrt(r1.w);
/*83*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*84*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*87*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*88*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*89*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*90*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*93*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*94*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*95*/	if(floatBitsToUint(r0.z) != 0u) {
/*96*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*97*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*98*/	  r0.z = r3.w * cb1.data[26].x;
/*99*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*100*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*101*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*102*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*103*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*104*/	}
/*105*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*106*/	if(floatBitsToUint(r0.z) != 0u) {
/*107*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*108*/	  if(floatBitsToUint(r0.z) != 0u) {
/*109*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*110*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*111*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*112*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*113*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*114*/	    r0.z = -r0.z + 1.000000;
/*115*/	    r0.z = max(r0.z, 0.000000);
/*116*/	    r8.z = sqrt(r0.z);
/*117*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*118*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*119*/	    r0.z = inversesqrt(r0.z);
/*120*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*121*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*122*/	    r10.y = -1.000000;
/*123*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*124*/	    r0.z = inversesqrt(r0.z);
/*125*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*126*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*127*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*128*/	    r1.w = r1.w * 1.250000;
/*129*/	    r1.w = min(r1.w, 1.000000);
/*130*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*131*/	    r2.w = r2.w * 4.000000;
/*132*/	    r1.w = r1.w * 0.200000 + r2.w;
/*133*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*134*/	    r0.z = r0.z + -r1.w;
/*135*/	    r0.z = saturate(r0.z * 200.000000);
/*136*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*137*/	    r0.z = r0.z * r0.z;
/*138*/	    r0.z = r0.z * r1.w;
/*139*/	    r3.y = r0.z * -r3.y + r3.y;
/*140*/	    r1.w = -r3.x + 0.200000;
/*141*/	    r3.x = r0.z * r1.w + r3.x;
/*142*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*143*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*144*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*145*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*146*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*147*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*148*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*149*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*150*/	    r1.w = -r1.w + 1.000000;
/*151*/	    r1.w = max(r1.w, 0.000000);
/*152*/	    r7.z = sqrt(r1.w);
/*153*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*154*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*155*/	    r1.w = sqrt(r1.w);
/*156*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*157*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*158*/	    r1.w = inversesqrt(r1.w);
/*159*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*160*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*161*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*162*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*163*/	    r1.w = -r1.y + 1.000000;
/*164*/	    r0.z = min(r0.z, r1.w);
/*165*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*166*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*167*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*168*/	    r0.z = inversesqrt(r0.z);
/*169*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*170*/	  }
/*171*/	}
/*172*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*173*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*174*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*175*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*176*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*177*/	r3.xzw = (-r0.xxyw + r1.wwww).xzw;
/*178*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*179*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*180*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*181*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*182*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*183*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*184*/	r1.w = inversesqrt(r1.w);
/*185*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*186*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*187*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*188*/	r2.w = inversesqrt(r1.w);
/*189*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*190*/	r2.w = -r3.y + 1.000000;
/*191*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*192*/	r5.y = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*193*/	r5.y = r5.y + r5.y;
/*194*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*195*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*196*/	r6.w = r2.w * 1.539380;
/*197*/	r6.w = cos((r6.w));
/*198*/	r6.w = inversesqrt(r6.w);
/*199*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*200*/	r7.x = saturate(r0.z * 60.000000);
/*201*/	r7.x = -r0.z + r7.x;
/*202*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*203*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*204*/	r8.x = inversesqrt(r8.x);
/*205*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*206*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*207*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*208*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*209*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*210*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*211*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*212*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*213*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*214*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*215*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*216*/	r6.y = -r0.z + 1.000000;
/*217*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*218*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*219*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*220*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*221*/	  r6.y = max(r6.y, 0.000000);
/*222*/	  r6.y = log2(r6.y);
/*223*/	  r6.y = r6.y * 10.000000;
/*224*/	  r6.y = exp2(r6.y);
/*225*/	  r6.y = r6.w * r6.y;
/*226*/	  r6.y = r6.y * r7.x + r0.z;
/*227*/	  r8.x = r2.w * 8.000000;
/*228*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*229*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*230*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*231*/	}
/*232*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*233*/	r1.y = max(r1.x, 0.000000);
/*234*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*235*/	if(floatBitsToUint(r1.x) != 0u) {
/*236*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*237*/	  r1.x = max(r1.x, -1.000000);
/*238*/	  r1.x = min(r1.x, 1.000000);
/*239*/	  r1.z = -abs(r1.x) + 1.000000;
/*240*/	  r1.z = sqrt(r1.z);
/*241*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*242*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*243*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*244*/	  r5.z = r1.z * r5.y;
/*245*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*246*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*247*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*248*/	  r1.x = r5.y * r1.z + r1.x;
/*249*/	  r1.z = r3.y * r3.y;
/*250*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*251*/	  r1.z = r1.z * r3.y + r6.x;
/*252*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*253*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*254*/	  r3.y = -r1.z * r1.z + 1.000000;
/*255*/	  r3.y = max(r3.y, 0.001000);
/*256*/	  r3.y = log2(r3.y);
/*257*/	  r5.x = r3.y * 4.950617;
/*258*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*259*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*260*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*261*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*262*/	  r1.z = floatBitsToInt(r1.z);
/*263*/	  r5.x = r3.y * r3.y + -r5.x;
/*264*/	  r5.x = sqrt(r5.x);
/*265*/	  r3.y = -r3.y + r5.x;
/*266*/	  r3.y = max(r3.y, 0.000000);
/*267*/	  r3.y = sqrt(r3.y);
/*268*/	  r1.z = r1.z * r3.y;
/*269*/	  r1.z = r1.z * 1.414214;
/*270*/	  r1.z = 0.008727 / r1.z;
/*271*/	  r1.z = max(r1.z, 0.000100);
/*272*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*273*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*274*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*275*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*276*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*277*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*278*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*279*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*280*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*281*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*282*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*283*/	  r1.x = floatBitsToInt(r1.x);
/*284*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*285*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*286*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*287*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*288*/	  r1.x = r1.x * r5.x + 1.000000;
/*289*/	  r1.x = r1.x * 0.500000;
/*290*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*291*/	  r1.z = r1.z * r5.y + 1.000000;
/*292*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*293*/	  r1.z = min(r1.y, 1.000000);
/*294*/	  r2.w = r2.w * 1.570796;
/*295*/	  r2.w = sin(r2.w);
/*296*/	  r1.z = r1.z + -1.000000;
/*297*/	  r1.z = r2.w * r1.z + 1.000000;
/*298*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*299*/	  r2.w = max(r2.w, 0.000000);
/*300*/	  r2.w = log2(r2.w);
/*301*/	  r2.w = r2.w * 10.000000;
/*302*/	  r2.w = exp2(r2.w);
/*303*/	  r2.w = r6.w * r2.w;
/*304*/	  r2.w = r2.w * r7.x + r0.z;
/*305*/	  r1.x = r1.z * abs(r1.x);
/*306*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*307*/	} else {
/*308*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*309*/	}
/*310*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*311*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*312*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*313*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*314*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*315*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*316*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*317*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*318*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*319*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*320*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*321*/	r2.w = 1.000000;
/*322*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*323*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*324*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*325*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*326*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*327*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*328*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*329*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*330*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*331*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*332*/	if(r0.w != 0) discard;
/*333*/	r0.w = sqrt(r1.w);
/*334*/	r1.x = saturate(cb3.data[0].w)/**/;
/*335*/	r1.x = -r1.x + 1.000000;
/*336*/	r1.x = r1.x * 8.000000 + -4.000000;
/*337*/	r1.y = saturate(cb3.data[1].x)/**/;
/*338*/	r1.y = -r1.y + 1.000000;
/*339*/	r1.y = r1.y * 1000.000000;
/*340*/	r0.w = r0.w / r1.y;
/*341*/	r0.w = r0.w + r1.x;
/*342*/	r0.w = r0.w * 1.442695;
/*343*/	r0.w = exp2(r0.w);
/*344*/	r0.w = cb3.data[1].y / r0.w;
/*345*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*346*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*347*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*348*/	r1.x = r1.x + -cb3.data[1].z;
/*349*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*350*/	r1.x = saturate(r1.y * r1.x);
/*351*/	r1.y = r1.x * -2.000000 + 3.000000;
/*352*/	r1.x = r1.x * r1.x;
/*353*/	r1.x = r1.x * r1.y;
/*354*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*355*/	r1.y = sqrt(r1.y);
/*356*/	r1.z = max(cb3.data[2].z, 0.001000);
/*357*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*358*/	r1.y = r1.z * r1.y;
/*359*/	r1.y = min(r1.y, 1.000000);
/*360*/	r1.z = r1.y * -2.000000 + 3.000000;
/*361*/	r1.y = r1.y * r1.y;
/*362*/	r1.y = r1.y * r1.z;
/*363*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*364*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*365*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*366*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*367*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*368*/	r4.w = max(r4.y, 0.000000);
/*369*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*370*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*371*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*372*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*373*/	r0.w = saturate(r0.w * r1.y);
/*374*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*375*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*376*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*377*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*378*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*379*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*380*/	return;
}
