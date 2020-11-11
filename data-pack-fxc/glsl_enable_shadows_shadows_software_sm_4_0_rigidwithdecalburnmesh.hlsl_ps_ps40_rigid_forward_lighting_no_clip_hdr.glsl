//
//
// Shader Model 4
// Fragment Shader
//
// id: 1157 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;

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
  color0 = vec4(0);
  color1 = vec4(0);
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
/*69*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*70*/	r5.x = 0;
/*71*/	r5.y = cb0.data[26].x * 0.050000;
/*72*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*73*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*74*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*75*/	r2.w = saturate(r5.x * 5.000000);
/*76*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*77*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*78*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*79*/	r3.z = log2(r6.z);
/*80*/	r3.z = r3.z * 1.800000;
/*81*/	r3.z = exp2(r3.z);
/*82*/	r3.z = r3.z * 10.000000;
/*83*/	r3.z = min(r3.z, 1.000000);
/*84*/	r2.w = r2.w + r3.z;
/*85*/	r2.w = r2.w * 0.500000;
/*86*/	r3.z = -r6.w + 1.000000;
/*87*/	r3.z = log2(r3.z);
/*88*/	r3.z = r3.z * vsOut_T7.x;
/*89*/	r3.z = exp2(r3.z);
/*90*/	r3.z = min(r3.z, 1.000000);
/*91*/	r3.z = r3.z * vsOut_T7.x;
/*92*/	r3.w = r6.z * 0.250000;
/*93*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*94*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*95*/	r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*96*/	r0.xyw = (r3.zzzz * r5.xyxz + r0.xyxw).xyw;
/*97*/	r2.w = vsOut_T7.x + -0.025000;
/*98*/	r2.w = max(r2.w, 0.000000);
/*99*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*100*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*101*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*102*/	r2.w = inversesqrt(r2.w);
/*103*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*104*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*105*/	r2.w = inversesqrt(r2.w);
/*106*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*107*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*108*/	r2.w = inversesqrt(r2.w);
/*109*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*110*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*111*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*112*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*113*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*114*/	r2.w = inversesqrt(r2.w);
/*115*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*116*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*117*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*118*/	if(floatBitsToUint(r0.z) != 0u) {
/*119*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*120*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*121*/	  r0.z = r3.w * cb0.data[26].x;
/*122*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*123*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*124*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*125*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*126*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*127*/	}
/*128*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*129*/	if(floatBitsToUint(r0.z) != 0u) {
/*130*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*131*/	  if(floatBitsToUint(r0.z) != 0u) {
/*132*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*133*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*134*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*135*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*136*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*137*/	    r0.z = -r0.z + 1.000000;
/*138*/	    r0.z = max(r0.z, 0.000000);
/*139*/	    r9.z = sqrt(r0.z);
/*140*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*141*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*142*/	    r0.z = inversesqrt(r0.z);
/*143*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*144*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*145*/	    r11.y = -1.000000;
/*146*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*147*/	    r0.z = inversesqrt(r0.z);
/*148*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*149*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*150*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*151*/	    r2.w = r2.w * 1.250000;
/*152*/	    r2.w = min(r2.w, 1.000000);
/*153*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*154*/	    r3.z = r3.z * 4.000000;
/*155*/	    r2.w = r2.w * 0.200000 + r3.z;
/*156*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*157*/	    r0.z = r0.z + -r2.w;
/*158*/	    r0.z = saturate(r0.z * 200.000000);
/*159*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*160*/	    r0.z = r0.z * r0.z;
/*161*/	    r0.z = r0.z * r2.w;
/*162*/	    r3.y = r0.z * -r3.y + r3.y;
/*163*/	    r2.w = -r3.x + 0.200000;
/*164*/	    r3.x = r0.z * r2.w + r3.x;
/*165*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*166*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*167*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*168*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*169*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*170*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*171*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*172*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*173*/	    r2.w = -r2.w + 1.000000;
/*174*/	    r2.w = max(r2.w, 0.000000);
/*175*/	    r8.z = sqrt(r2.w);
/*176*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*177*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*178*/	    r2.w = sqrt(r2.w);
/*179*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*180*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*181*/	    r2.w = inversesqrt(r2.w);
/*182*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*183*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*184*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*185*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*186*/	    r2.w = -r1.y + 1.000000;
/*187*/	    r0.z = min(r0.z, r2.w);
/*188*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*189*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*190*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*191*/	    r0.z = inversesqrt(r0.z);
/*192*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*193*/	  }
/*194*/	}
/*195*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*196*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*197*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*198*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*199*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*200*/	r3.xzw = (-r0.xxyw + r2.wwww).xzw;
/*201*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*202*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*203*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*204*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*205*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*206*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*207*/	r2.w = inversesqrt(r2.w);
/*208*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*209*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*210*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*211*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*212*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*213*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*214*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*215*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*216*/	r3.x = intBitsToFloat(int(r2.w));
/*217*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*218*/	if(floatBitsToUint(r3.z) != 0u) {
/*219*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*220*/	  r5.w = vsOut_T0.w;
/*221*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*222*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*223*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*224*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*225*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*226*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*227*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*228*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*229*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*230*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*231*/	  if(floatBitsToUint(r3.w) == 0u) {
/*232*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*233*/	    r7.xy = floor((r6.xyxx).xy);
/*234*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*235*/	    r3.z = -0.000400 / r3.z;
/*236*/	    r3.z = r3.z + r6.z;
/*237*/	    r8.z = -r8.y + 1.000000;
/*238*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*239*/	    r8.w = -r8.y;
/*240*/	    r10.x = cb1.data[0].z/**/;
/*241*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*242*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*243*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*244*/	    r10.w = -cb1.data[0].w/**/;
/*245*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*246*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*247*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*248*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*249*/	    r8.x = r9.x;
/*250*/	    r8.y = r11.x;
/*251*/	    r8.z = r10.x;
/*252*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*253*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*254*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*255*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*256*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*257*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*258*/	    r3.z = -r6.x + r6.y;
/*259*/	    r3.z = r3.w * r3.z + r6.x;
/*260*/	  } else {
/*261*/	    r3.z = 1.000000;
/*262*/	  }
/*263*/	} else {
/*264*/	  r3.z = 1.000000;
/*265*/	}
/*266*/	r3.w = cb1.data[34].w + -1.000000;
/*267*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*268*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*269*/	if(floatBitsToUint(r2.w) == 0u) {
/*270*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*271*/	  r2.w = floatBitsToInt(r2.w);
/*272*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*273*/	  if(floatBitsToUint(r2.w) != 0u) {
/*274*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*275*/	    r5.w = vsOut_T0.w;
/*276*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*277*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*278*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*279*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*280*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*281*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*282*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*283*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*284*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*285*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*286*/	    if(floatBitsToUint(r5.w) == 0u) {
/*287*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*288*/	      r6.xy = floor((r5.xyxx).xy);
/*289*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*290*/	      r2.w = -0.000400 / r2.w;
/*291*/	      r2.w = r2.w + r5.z;
/*292*/	      r7.z = -r7.y + 1.000000;
/*293*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*294*/	      r7.w = -r7.y;
/*295*/	      r9.x = cb1.data[0].z/**/;
/*296*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*297*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*298*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*299*/	      r9.w = -cb1.data[0].w/**/;
/*300*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*301*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*302*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*303*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*304*/	      r7.x = r8.x;
/*305*/	      r7.y = r10.x;
/*306*/	      r7.z = r9.x;
/*307*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*308*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*309*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*310*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*311*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*312*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*313*/	      r2.w = -r5.x + r5.z;
/*314*/	      r2.w = r5.y * r2.w + r5.x;
/*315*/	    } else {
/*316*/	      r2.w = 1.000000;
/*317*/	    }
/*318*/	  } else {
/*319*/	    r2.w = 1.000000;
/*320*/	  }
/*321*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*322*/	  r5.y = r5.x * cb1.data[34].x;
/*323*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*324*/	  r5.x = r1.w + -r5.x;
/*325*/	  r5.x = saturate(r5.x / r5.y);
/*326*/	  r2.w = -r3.z + r2.w;
/*327*/	  r3.z = r5.x * r2.w + r3.z;
/*328*/	}
/*329*/	if(floatBitsToUint(r3.w) != 0u) {
/*330*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*331*/	  r3.w = r2.w * cb1.data[34].y;
/*332*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*333*/	  r2.w = r1.w + -r2.w;
/*334*/	  r2.w = saturate(r2.w / r3.w);
/*335*/	  r3.x = -r3.z + 1.000000;
/*336*/	  r3.z = r2.w * r3.x + r3.z;
/*337*/	}
/*338*/	r3.z = saturate(r3.z);
/*339*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*340*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*341*/	r2.w = inversesqrt(r2.w);
/*342*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*343*/	r2.w = -r3.y + 1.000000;
/*344*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*345*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*346*/	r3.w = r3.w + r3.w;
/*347*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*348*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*349*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*350*/	r3.w = cos((r8.x));
/*351*/	r3.w = inversesqrt(r3.w);
/*352*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*353*/	r5.w = saturate(r0.z * 60.000000);
/*354*/	r5.w = -r0.z + r5.w;
/*355*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*356*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*357*/	r6.w = inversesqrt(r6.w);
/*358*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*359*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*360*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*361*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*362*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*363*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*364*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*365*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*366*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*367*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*368*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*369*/	r6.w = -r0.z + 1.000000;
/*370*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*371*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*372*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*373*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*374*/	  r6.w = max(r6.w, 0.000000);
/*375*/	  r6.w = log2(r6.w);
/*376*/	  r6.w = r6.w * 10.000000;
/*377*/	  r6.w = exp2(r6.w);
/*378*/	  r6.w = r3.w * r6.w;
/*379*/	  r6.w = r6.w * r5.w + r0.z;
/*380*/	  r7.y = r2.w * 8.000000;
/*381*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*382*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*383*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*384*/	}
/*385*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*386*/	r7.y = max(r6.w, 0.000000);
/*387*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*388*/	if(floatBitsToUint(r6.w) != 0u) {
/*389*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*390*/	  r6.x = max(r6.x, -1.000000);
/*391*/	  r6.x = min(r6.x, 1.000000);
/*392*/	  r6.y = -abs(r6.x) + 1.000000;
/*393*/	  r6.y = sqrt(r6.y);
/*394*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*395*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*396*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*397*/	  r6.w = r6.y * r6.z;
/*398*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*399*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*400*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*401*/	  r6.x = r6.z * r6.y + r6.x;
/*402*/	  r3.y = r3.y * r3.y;
/*403*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*404*/	  r3.x = r3.y * r3.x + r7.x;
/*405*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*406*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*407*/	  r3.y = -r3.x * r3.x + 1.000000;
/*408*/	  r3.y = max(r3.y, 0.001000);
/*409*/	  r3.y = log2(r3.y);
/*410*/	  r6.y = r3.y * 4.950617;
/*411*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*412*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*413*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*414*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*415*/	  r3.x = floatBitsToInt(r3.x);
/*416*/	  r6.y = r3.y * r3.y + -r6.y;
/*417*/	  r6.y = sqrt(r6.y);
/*418*/	  r3.y = -r3.y + r6.y;
/*419*/	  r3.y = max(r3.y, 0.000000);
/*420*/	  r3.y = sqrt(r3.y);
/*421*/	  r3.x = r3.y * r3.x;
/*422*/	  r3.x = r3.x * 1.414214;
/*423*/	  r3.x = 0.008727 / r3.x;
/*424*/	  r3.x = max(r3.x, 0.000100);
/*425*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*426*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*427*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*428*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*429*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*430*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*431*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*432*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*433*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*434*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*435*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*436*/	  r3.x = floatBitsToInt(r3.x);
/*437*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*438*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*439*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*440*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*441*/	  r3.x = r3.x * r6.x + 1.000000;
/*442*/	  r3.x = r3.x * 0.500000;
/*443*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*444*/	  r3.y = r3.y * r6.y + 1.000000;
/*445*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*446*/	  r3.y = min(r7.y, 1.000000);
/*447*/	  r2.w = r2.w * 1.570796;
/*448*/	  r2.w = sin(r2.w);
/*449*/	  r3.y = r3.y + -1.000000;
/*450*/	  r2.w = r2.w * r3.y + 1.000000;
/*451*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*452*/	  r3.y = max(r3.y, 0.000000);
/*453*/	  r3.y = log2(r3.y);
/*454*/	  r3.y = r3.y * 10.000000;
/*455*/	  r3.y = exp2(r3.y);
/*456*/	  r3.y = r3.w * r3.y;
/*457*/	  r3.y = r3.y * r5.w + r0.z;
/*458*/	  r2.w = r2.w * abs(r3.x);
/*459*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*460*/	} else {
/*461*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*462*/	}
/*463*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*464*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*465*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*466*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*467*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*468*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*469*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*470*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*471*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*472*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*473*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*474*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*475*/	r2.w = inversesqrt(r2.w);
/*476*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*477*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*478*/	r2.w = r2.w + r2.w;
/*479*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*480*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*481*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*482*/	r1.x = max(r1.x, 0.000000);
/*483*/	r1.x = log2(r1.x);
/*484*/	r1.x = r1.x * 10.000000;
/*485*/	r1.x = exp2(r1.x);
/*486*/	r1.x = r3.w * r1.x;
/*487*/	r0.z = r1.x * r5.w + r0.z;
/*488*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*489*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*490*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*491*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*492*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*493*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*494*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*495*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*496*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*497*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*498*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*499*/	if(r0.x != 0) discard;
/*500*/	color1.x = 1.000000;
/*501*/	return;
}
