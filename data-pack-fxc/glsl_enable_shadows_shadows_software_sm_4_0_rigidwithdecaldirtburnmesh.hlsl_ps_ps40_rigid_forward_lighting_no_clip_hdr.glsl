//
//
// Shader Model 4
// Fragment Shader
//
// id: 5079 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
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
/*60*/	  r2.w = r3.x * r8.w;
/*61*/	  r3.x = r2.w * -0.500000 + r3.x;
/*62*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*63*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*64*/	  r2.w = -r6.w * r7.w + 1.000000;
/*65*/	  r0.xyw = (r2.wwww * r0.xyxw + r8.xyxz).xyw;
/*66*/	  r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*67*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*68*/	}
/*69*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*70*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*71*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*72*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*73*/	r2.w = r5.w * r6.w;
/*74*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*75*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*76*/	r1.xy = (r3.zwzz * r5.wwww + r1.xyxx).xy;
/*77*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*78*/	r3.z = inversesqrt(r3.z);
/*79*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*80*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*81*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*82*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*83*/	r5.x = 0;
/*84*/	r5.y = cb0.data[26].x * 0.050000;
/*85*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*86*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*87*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*88*/	r2.w = saturate(r5.x * 5.000000);
/*89*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*90*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*91*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*92*/	r3.z = log2(r6.z);
/*93*/	r3.z = r3.z * 1.800000;
/*94*/	r3.z = exp2(r3.z);
/*95*/	r3.z = r3.z * 10.000000;
/*96*/	r3.z = min(r3.z, 1.000000);
/*97*/	r2.w = r2.w + r3.z;
/*98*/	r2.w = r2.w * 0.500000;
/*99*/	r3.z = -r6.w + 1.000000;
/*100*/	r3.z = log2(r3.z);
/*101*/	r3.z = r3.z * vsOut_T7.x;
/*102*/	r3.z = exp2(r3.z);
/*103*/	r3.z = min(r3.z, 1.000000);
/*104*/	r3.z = r3.z * vsOut_T7.x;
/*105*/	r3.w = r6.z * 0.250000;
/*106*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*107*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*108*/	r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*109*/	r0.xyw = (r3.zzzz * r5.xyxz + r0.xyxw).xyw;
/*110*/	r2.w = vsOut_T7.x + -0.025000;
/*111*/	r2.w = max(r2.w, 0.000000);
/*112*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*113*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*114*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*115*/	r2.w = inversesqrt(r2.w);
/*116*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*117*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*118*/	r2.w = inversesqrt(r2.w);
/*119*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*120*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*121*/	r2.w = inversesqrt(r2.w);
/*122*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*123*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*124*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*125*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*126*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*127*/	r2.w = inversesqrt(r2.w);
/*128*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*129*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*130*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*131*/	if(floatBitsToUint(r0.z) != 0u) {
/*132*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*133*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*134*/	  r0.z = r3.w * cb0.data[26].x;
/*135*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*136*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*137*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*138*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*139*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*140*/	}
/*141*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*142*/	if(floatBitsToUint(r0.z) != 0u) {
/*143*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*144*/	  if(floatBitsToUint(r0.z) != 0u) {
/*145*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*146*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*147*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*148*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*149*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*150*/	    r0.z = -r0.z + 1.000000;
/*151*/	    r0.z = max(r0.z, 0.000000);
/*152*/	    r9.z = sqrt(r0.z);
/*153*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*154*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*155*/	    r0.z = inversesqrt(r0.z);
/*156*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*157*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*158*/	    r11.y = -1.000000;
/*159*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*160*/	    r0.z = inversesqrt(r0.z);
/*161*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*162*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*163*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*164*/	    r2.w = r2.w * 1.250000;
/*165*/	    r2.w = min(r2.w, 1.000000);
/*166*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*167*/	    r3.z = r3.z * 4.000000;
/*168*/	    r2.w = r2.w * 0.200000 + r3.z;
/*169*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*170*/	    r0.z = r0.z + -r2.w;
/*171*/	    r0.z = saturate(r0.z * 200.000000);
/*172*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*173*/	    r0.z = r0.z * r0.z;
/*174*/	    r0.z = r0.z * r2.w;
/*175*/	    r3.y = r0.z * -r3.y + r3.y;
/*176*/	    r2.w = -r3.x + 0.200000;
/*177*/	    r3.x = r0.z * r2.w + r3.x;
/*178*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*179*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*180*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*181*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*182*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*183*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*184*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*185*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*186*/	    r2.w = -r2.w + 1.000000;
/*187*/	    r2.w = max(r2.w, 0.000000);
/*188*/	    r8.z = sqrt(r2.w);
/*189*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*190*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*191*/	    r2.w = sqrt(r2.w);
/*192*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*193*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*194*/	    r2.w = inversesqrt(r2.w);
/*195*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*196*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*197*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*198*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*199*/	    r2.w = -r1.y + 1.000000;
/*200*/	    r0.z = min(r0.z, r2.w);
/*201*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*202*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*203*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*204*/	    r0.z = inversesqrt(r0.z);
/*205*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*206*/	  }
/*207*/	}
/*208*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*209*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*210*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*211*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*212*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*213*/	r3.xzw = (-r0.xxyw + r2.wwww).xzw;
/*214*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*215*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*216*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*217*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*218*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*219*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*220*/	r2.w = inversesqrt(r2.w);
/*221*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*222*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*223*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*224*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*225*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*226*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*227*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*228*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*229*/	r3.x = intBitsToFloat(int(r2.w));
/*230*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*231*/	if(floatBitsToUint(r3.z) != 0u) {
/*232*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*233*/	  r5.w = vsOut_T0.w;
/*234*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*235*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*236*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*237*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*238*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*239*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*240*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*241*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*242*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*243*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*244*/	  if(floatBitsToUint(r3.w) == 0u) {
/*245*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*246*/	    r7.xy = floor((r6.xyxx).xy);
/*247*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*248*/	    r3.z = -0.000400 / r3.z;
/*249*/	    r3.z = r3.z + r6.z;
/*250*/	    r8.z = -r8.y + 1.000000;
/*251*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*252*/	    r8.w = -r8.y;
/*253*/	    r10.x = cb1.data[0].z/**/;
/*254*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*255*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*256*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*257*/	    r10.w = -cb1.data[0].w/**/;
/*258*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*259*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*260*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*261*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*262*/	    r8.x = r9.x;
/*263*/	    r8.y = r11.x;
/*264*/	    r8.z = r10.x;
/*265*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*266*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*267*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*268*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*269*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*270*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*271*/	    r3.z = -r6.x + r6.y;
/*272*/	    r3.z = r3.w * r3.z + r6.x;
/*273*/	  } else {
/*274*/	    r3.z = 1.000000;
/*275*/	  }
/*276*/	} else {
/*277*/	  r3.z = 1.000000;
/*278*/	}
/*279*/	r3.w = cb1.data[34].w + -1.000000;
/*280*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*281*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*282*/	if(floatBitsToUint(r2.w) == 0u) {
/*283*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*284*/	  r2.w = floatBitsToInt(r2.w);
/*285*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*286*/	  if(floatBitsToUint(r2.w) != 0u) {
/*287*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*288*/	    r5.w = vsOut_T0.w;
/*289*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*290*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*291*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*292*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*293*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*294*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*295*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*296*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*297*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*298*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*299*/	    if(floatBitsToUint(r5.w) == 0u) {
/*300*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*301*/	      r6.xy = floor((r5.xyxx).xy);
/*302*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*303*/	      r2.w = -0.000400 / r2.w;
/*304*/	      r2.w = r2.w + r5.z;
/*305*/	      r7.z = -r7.y + 1.000000;
/*306*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*307*/	      r7.w = -r7.y;
/*308*/	      r9.x = cb1.data[0].z/**/;
/*309*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*310*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*311*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*312*/	      r9.w = -cb1.data[0].w/**/;
/*313*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*314*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*315*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*316*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*317*/	      r7.x = r8.x;
/*318*/	      r7.y = r10.x;
/*319*/	      r7.z = r9.x;
/*320*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*321*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*322*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*323*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*324*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*325*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*326*/	      r2.w = -r5.x + r5.z;
/*327*/	      r2.w = r5.y * r2.w + r5.x;
/*328*/	    } else {
/*329*/	      r2.w = 1.000000;
/*330*/	    }
/*331*/	  } else {
/*332*/	    r2.w = 1.000000;
/*333*/	  }
/*334*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*335*/	  r5.y = r5.x * cb1.data[34].x;
/*336*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*337*/	  r5.x = r1.w + -r5.x;
/*338*/	  r5.x = saturate(r5.x / r5.y);
/*339*/	  r2.w = -r3.z + r2.w;
/*340*/	  r3.z = r5.x * r2.w + r3.z;
/*341*/	}
/*342*/	if(floatBitsToUint(r3.w) != 0u) {
/*343*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*344*/	  r3.w = r2.w * cb1.data[34].y;
/*345*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*346*/	  r2.w = r1.w + -r2.w;
/*347*/	  r2.w = saturate(r2.w / r3.w);
/*348*/	  r3.x = -r3.z + 1.000000;
/*349*/	  r3.z = r2.w * r3.x + r3.z;
/*350*/	}
/*351*/	r3.z = saturate(r3.z);
/*352*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*353*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*354*/	r2.w = inversesqrt(r2.w);
/*355*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*356*/	r2.w = -r3.y + 1.000000;
/*357*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*358*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*359*/	r3.w = r3.w + r3.w;
/*360*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*361*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*362*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*363*/	r3.w = cos((r8.x));
/*364*/	r3.w = inversesqrt(r3.w);
/*365*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*366*/	r5.w = saturate(r0.z * 60.000000);
/*367*/	r5.w = -r0.z + r5.w;
/*368*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*369*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*370*/	r6.w = inversesqrt(r6.w);
/*371*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*372*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*373*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*374*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*375*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*376*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*377*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*378*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*379*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*380*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*381*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*382*/	r6.w = -r0.z + 1.000000;
/*383*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*384*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*385*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*386*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*387*/	  r6.w = max(r6.w, 0.000000);
/*388*/	  r6.w = log2(r6.w);
/*389*/	  r6.w = r6.w * 10.000000;
/*390*/	  r6.w = exp2(r6.w);
/*391*/	  r6.w = r3.w * r6.w;
/*392*/	  r6.w = r6.w * r5.w + r0.z;
/*393*/	  r7.y = r2.w * 8.000000;
/*394*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*395*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*396*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*397*/	}
/*398*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*399*/	r7.y = max(r6.w, 0.000000);
/*400*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*401*/	if(floatBitsToUint(r6.w) != 0u) {
/*402*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*403*/	  r6.x = max(r6.x, -1.000000);
/*404*/	  r6.x = min(r6.x, 1.000000);
/*405*/	  r6.y = -abs(r6.x) + 1.000000;
/*406*/	  r6.y = sqrt(r6.y);
/*407*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*408*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*409*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*410*/	  r6.w = r6.y * r6.z;
/*411*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*412*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*413*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*414*/	  r6.x = r6.z * r6.y + r6.x;
/*415*/	  r3.y = r3.y * r3.y;
/*416*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*417*/	  r3.x = r3.y * r3.x + r7.x;
/*418*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*419*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*420*/	  r3.y = -r3.x * r3.x + 1.000000;
/*421*/	  r3.y = max(r3.y, 0.001000);
/*422*/	  r3.y = log2(r3.y);
/*423*/	  r6.y = r3.y * 4.950617;
/*424*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*425*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*426*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*427*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*428*/	  r3.x = floatBitsToInt(r3.x);
/*429*/	  r6.y = r3.y * r3.y + -r6.y;
/*430*/	  r6.y = sqrt(r6.y);
/*431*/	  r3.y = -r3.y + r6.y;
/*432*/	  r3.y = max(r3.y, 0.000000);
/*433*/	  r3.y = sqrt(r3.y);
/*434*/	  r3.x = r3.y * r3.x;
/*435*/	  r3.x = r3.x * 1.414214;
/*436*/	  r3.x = 0.008727 / r3.x;
/*437*/	  r3.x = max(r3.x, 0.000100);
/*438*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*439*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*440*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*441*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*442*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*443*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*444*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*445*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*446*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*447*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*448*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*449*/	  r3.x = floatBitsToInt(r3.x);
/*450*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*451*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*452*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*453*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*454*/	  r3.x = r3.x * r6.x + 1.000000;
/*455*/	  r3.x = r3.x * 0.500000;
/*456*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*457*/	  r3.y = r3.y * r6.y + 1.000000;
/*458*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*459*/	  r3.y = min(r7.y, 1.000000);
/*460*/	  r2.w = r2.w * 1.570796;
/*461*/	  r2.w = sin(r2.w);
/*462*/	  r3.y = r3.y + -1.000000;
/*463*/	  r2.w = r2.w * r3.y + 1.000000;
/*464*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*465*/	  r3.y = max(r3.y, 0.000000);
/*466*/	  r3.y = log2(r3.y);
/*467*/	  r3.y = r3.y * 10.000000;
/*468*/	  r3.y = exp2(r3.y);
/*469*/	  r3.y = r3.w * r3.y;
/*470*/	  r3.y = r3.y * r5.w + r0.z;
/*471*/	  r2.w = r2.w * abs(r3.x);
/*472*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*473*/	} else {
/*474*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*475*/	}
/*476*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*477*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*478*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*479*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*480*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*481*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*482*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*483*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*484*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*485*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*486*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*487*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*488*/	r2.w = inversesqrt(r2.w);
/*489*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*490*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*491*/	r2.w = r2.w + r2.w;
/*492*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*493*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*494*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*495*/	r1.x = max(r1.x, 0.000000);
/*496*/	r1.x = log2(r1.x);
/*497*/	r1.x = r1.x * 10.000000;
/*498*/	r1.x = exp2(r1.x);
/*499*/	r1.x = r3.w * r1.x;
/*500*/	r0.z = r1.x * r5.w + r0.z;
/*501*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*502*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*503*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*504*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*505*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*506*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*507*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*508*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*509*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*510*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*511*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*512*/	if(r0.x != 0) discard;
/*513*/	color1.x = 1.000000;
/*514*/	return;
}
