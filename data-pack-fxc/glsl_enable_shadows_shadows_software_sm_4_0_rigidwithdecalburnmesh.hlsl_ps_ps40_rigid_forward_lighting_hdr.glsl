//
//
// Shader Model 4
// Fragment Shader
//
// id: 1155 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*41*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*42*/	r4.w = 1.000000;
/*43*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*44*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*45*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*46*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*47*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*48*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*49*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*50*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*51*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*52*/	r5.z = vsOut_T6.x;
/*53*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*54*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*55*/	if(floatBitsToUint(r2.w) != 0u) {
/*56*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*57*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*58*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*59*/	  r2.w = -r2.w + 1.000000;
/*60*/	  r2.w = max(r2.w, 0.000000);
/*61*/	  r5.z = sqrt(r2.w);
/*62*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*63*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*64*/	  r2.w = r3.x * r8.w;
/*65*/	  r3.x = r2.w * -0.500000 + r3.x;
/*66*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*67*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*68*/	  r2.w = -r6.w * r7.w + 1.000000;
/*69*/	  r0.xyw = (r2.wwww * r0.xyxw + r8.xyxz).xyw;
/*70*/	  r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*71*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*72*/	}
/*73*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*74*/	r5.x = 0;
/*75*/	r5.y = cb0.data[26].x * 0.050000;
/*76*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*77*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*78*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*79*/	r2.w = saturate(r5.x * 5.000000);
/*80*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*81*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*82*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*83*/	r3.z = log2(r6.z);
/*84*/	r3.z = r3.z * 1.800000;
/*85*/	r3.z = exp2(r3.z);
/*86*/	r3.z = r3.z * 10.000000;
/*87*/	r3.z = min(r3.z, 1.000000);
/*88*/	r2.w = r2.w + r3.z;
/*89*/	r2.w = r2.w * 0.500000;
/*90*/	r3.z = -r6.w + 1.000000;
/*91*/	r3.z = log2(r3.z);
/*92*/	r3.z = r3.z * vsOut_T7.x;
/*93*/	r3.z = exp2(r3.z);
/*94*/	r3.z = min(r3.z, 1.000000);
/*95*/	r3.z = r3.z * vsOut_T7.x;
/*96*/	r3.w = r6.z * 0.250000;
/*97*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*98*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*99*/	r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*100*/	r0.xyw = (r3.zzzz * r5.xyxz + r0.xyxw).xyw;
/*101*/	r2.w = vsOut_T7.x + -0.025000;
/*102*/	r2.w = max(r2.w, 0.000000);
/*103*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*104*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*105*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*106*/	r2.w = inversesqrt(r2.w);
/*107*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*108*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*109*/	r2.w = inversesqrt(r2.w);
/*110*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*111*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*112*/	r2.w = inversesqrt(r2.w);
/*113*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*114*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*115*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*116*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*117*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*118*/	r2.w = inversesqrt(r2.w);
/*119*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*120*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*121*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*122*/	if(floatBitsToUint(r0.z) != 0u) {
/*123*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*124*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*125*/	  r0.z = r3.w * cb0.data[26].x;
/*126*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*127*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*128*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*129*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*130*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*131*/	}
/*132*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*133*/	if(floatBitsToUint(r0.z) != 0u) {
/*134*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*135*/	  if(floatBitsToUint(r0.z) != 0u) {
/*136*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*137*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*138*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*139*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*140*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*141*/	    r0.z = -r0.z + 1.000000;
/*142*/	    r0.z = max(r0.z, 0.000000);
/*143*/	    r9.z = sqrt(r0.z);
/*144*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*145*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*146*/	    r0.z = inversesqrt(r0.z);
/*147*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*148*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*149*/	    r11.y = -1.000000;
/*150*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*151*/	    r0.z = inversesqrt(r0.z);
/*152*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*153*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*154*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*155*/	    r2.w = r2.w * 1.250000;
/*156*/	    r2.w = min(r2.w, 1.000000);
/*157*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*158*/	    r3.z = r3.z * 4.000000;
/*159*/	    r2.w = r2.w * 0.200000 + r3.z;
/*160*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*161*/	    r0.z = r0.z + -r2.w;
/*162*/	    r0.z = saturate(r0.z * 200.000000);
/*163*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*164*/	    r0.z = r0.z * r0.z;
/*165*/	    r0.z = r0.z * r2.w;
/*166*/	    r3.y = r0.z * -r3.y + r3.y;
/*167*/	    r2.w = -r3.x + 0.200000;
/*168*/	    r3.x = r0.z * r2.w + r3.x;
/*169*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*170*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*171*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*172*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*173*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*174*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*175*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*176*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*177*/	    r2.w = -r2.w + 1.000000;
/*178*/	    r2.w = max(r2.w, 0.000000);
/*179*/	    r8.z = sqrt(r2.w);
/*180*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*181*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*182*/	    r2.w = sqrt(r2.w);
/*183*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*184*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*185*/	    r2.w = inversesqrt(r2.w);
/*186*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*187*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*188*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*189*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*190*/	    r2.w = -r1.y + 1.000000;
/*191*/	    r0.z = min(r0.z, r2.w);
/*192*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*193*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*194*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*195*/	    r0.z = inversesqrt(r0.z);
/*196*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*197*/	  }
/*198*/	}
/*199*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*200*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*201*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*202*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*203*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*204*/	r3.xzw = (-r0.xxyw + r2.wwww).xzw;
/*205*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*206*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*207*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*208*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*209*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*210*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*211*/	r2.w = inversesqrt(r2.w);
/*212*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*213*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*214*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*215*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*216*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*217*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*218*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*219*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*220*/	r3.x = intBitsToFloat(int(r2.w));
/*221*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*222*/	if(floatBitsToUint(r3.z) != 0u) {
/*223*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*224*/	  r5.w = vsOut_T0.w;
/*225*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*226*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*227*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*228*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*229*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*230*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*231*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*232*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*233*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*234*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*235*/	  if(floatBitsToUint(r3.w) == 0u) {
/*236*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*237*/	    r7.xy = floor((r6.xyxx).xy);
/*238*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*239*/	    r3.z = -0.000400 / r3.z;
/*240*/	    r3.z = r3.z + r6.z;
/*241*/	    r8.z = -r8.y + 1.000000;
/*242*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*243*/	    r8.w = -r8.y;
/*244*/	    r10.x = cb1.data[0].z/**/;
/*245*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*246*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*247*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*248*/	    r10.w = -cb1.data[0].w/**/;
/*249*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*250*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*251*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*252*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*253*/	    r8.x = r9.x;
/*254*/	    r8.y = r11.x;
/*255*/	    r8.z = r10.x;
/*256*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*257*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*258*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*259*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*260*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*261*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*262*/	    r3.z = -r6.x + r6.y;
/*263*/	    r3.z = r3.w * r3.z + r6.x;
/*264*/	  } else {
/*265*/	    r3.z = 1.000000;
/*266*/	  }
/*267*/	} else {
/*268*/	  r3.z = 1.000000;
/*269*/	}
/*270*/	r3.w = cb1.data[34].w + -1.000000;
/*271*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*272*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*273*/	if(floatBitsToUint(r2.w) == 0u) {
/*274*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*275*/	  r2.w = floatBitsToInt(r2.w);
/*276*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*277*/	  if(floatBitsToUint(r2.w) != 0u) {
/*278*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*279*/	    r5.w = vsOut_T0.w;
/*280*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*281*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*282*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*283*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*284*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*285*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*286*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*287*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*288*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*289*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*290*/	    if(floatBitsToUint(r5.w) == 0u) {
/*291*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*292*/	      r6.xy = floor((r5.xyxx).xy);
/*293*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*294*/	      r2.w = -0.000400 / r2.w;
/*295*/	      r2.w = r2.w + r5.z;
/*296*/	      r7.z = -r7.y + 1.000000;
/*297*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*298*/	      r7.w = -r7.y;
/*299*/	      r9.x = cb1.data[0].z/**/;
/*300*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*301*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*302*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*303*/	      r9.w = -cb1.data[0].w/**/;
/*304*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*305*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*306*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*307*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*308*/	      r7.x = r8.x;
/*309*/	      r7.y = r10.x;
/*310*/	      r7.z = r9.x;
/*311*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*312*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*313*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*314*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*315*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*316*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*317*/	      r2.w = -r5.x + r5.z;
/*318*/	      r2.w = r5.y * r2.w + r5.x;
/*319*/	    } else {
/*320*/	      r2.w = 1.000000;
/*321*/	    }
/*322*/	  } else {
/*323*/	    r2.w = 1.000000;
/*324*/	  }
/*325*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*326*/	  r5.y = r5.x * cb1.data[34].x;
/*327*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*328*/	  r5.x = r1.w + -r5.x;
/*329*/	  r5.x = saturate(r5.x / r5.y);
/*330*/	  r2.w = -r3.z + r2.w;
/*331*/	  r3.z = r5.x * r2.w + r3.z;
/*332*/	}
/*333*/	if(floatBitsToUint(r3.w) != 0u) {
/*334*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*335*/	  r3.w = r2.w * cb1.data[34].y;
/*336*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*337*/	  r2.w = r1.w + -r2.w;
/*338*/	  r2.w = saturate(r2.w / r3.w);
/*339*/	  r3.x = -r3.z + 1.000000;
/*340*/	  r3.z = r2.w * r3.x + r3.z;
/*341*/	}
/*342*/	r3.z = saturate(r3.z);
/*343*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*344*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*345*/	r2.w = inversesqrt(r2.w);
/*346*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*347*/	r2.w = -r3.y + 1.000000;
/*348*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*349*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*350*/	r3.w = r3.w + r3.w;
/*351*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*352*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*353*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*354*/	r3.w = cos((r8.x));
/*355*/	r3.w = inversesqrt(r3.w);
/*356*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*357*/	r5.w = saturate(r0.z * 60.000000);
/*358*/	r5.w = -r0.z + r5.w;
/*359*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*360*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*361*/	r6.w = inversesqrt(r6.w);
/*362*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*363*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*364*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*365*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*366*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*367*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*368*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*369*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*370*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*371*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*372*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*373*/	r6.w = -r0.z + 1.000000;
/*374*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*375*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*376*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*377*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*378*/	  r6.w = max(r6.w, 0.000000);
/*379*/	  r6.w = log2(r6.w);
/*380*/	  r6.w = r6.w * 10.000000;
/*381*/	  r6.w = exp2(r6.w);
/*382*/	  r6.w = r3.w * r6.w;
/*383*/	  r6.w = r6.w * r5.w + r0.z;
/*384*/	  r7.y = r2.w * 8.000000;
/*385*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*386*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*387*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*388*/	}
/*389*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*390*/	r7.y = max(r6.w, 0.000000);
/*391*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*392*/	if(floatBitsToUint(r6.w) != 0u) {
/*393*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*394*/	  r6.x = max(r6.x, -1.000000);
/*395*/	  r6.x = min(r6.x, 1.000000);
/*396*/	  r6.y = -abs(r6.x) + 1.000000;
/*397*/	  r6.y = sqrt(r6.y);
/*398*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*399*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*400*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*401*/	  r6.w = r6.y * r6.z;
/*402*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*403*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*404*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*405*/	  r6.x = r6.z * r6.y + r6.x;
/*406*/	  r3.y = r3.y * r3.y;
/*407*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*408*/	  r3.x = r3.y * r3.x + r7.x;
/*409*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*410*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*411*/	  r3.y = -r3.x * r3.x + 1.000000;
/*412*/	  r3.y = max(r3.y, 0.001000);
/*413*/	  r3.y = log2(r3.y);
/*414*/	  r6.y = r3.y * 4.950617;
/*415*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*416*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*417*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*418*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*419*/	  r3.x = floatBitsToInt(r3.x);
/*420*/	  r6.y = r3.y * r3.y + -r6.y;
/*421*/	  r6.y = sqrt(r6.y);
/*422*/	  r3.y = -r3.y + r6.y;
/*423*/	  r3.y = max(r3.y, 0.000000);
/*424*/	  r3.y = sqrt(r3.y);
/*425*/	  r3.x = r3.y * r3.x;
/*426*/	  r3.x = r3.x * 1.414214;
/*427*/	  r3.x = 0.008727 / r3.x;
/*428*/	  r3.x = max(r3.x, 0.000100);
/*429*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*430*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*431*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*432*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*433*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*434*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*435*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*436*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*437*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*438*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*439*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*440*/	  r3.x = floatBitsToInt(r3.x);
/*441*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*442*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*443*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*444*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*445*/	  r3.x = r3.x * r6.x + 1.000000;
/*446*/	  r3.x = r3.x * 0.500000;
/*447*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*448*/	  r3.y = r3.y * r6.y + 1.000000;
/*449*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*450*/	  r3.y = min(r7.y, 1.000000);
/*451*/	  r2.w = r2.w * 1.570796;
/*452*/	  r2.w = sin(r2.w);
/*453*/	  r3.y = r3.y + -1.000000;
/*454*/	  r2.w = r2.w * r3.y + 1.000000;
/*455*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*456*/	  r3.y = max(r3.y, 0.000000);
/*457*/	  r3.y = log2(r3.y);
/*458*/	  r3.y = r3.y * 10.000000;
/*459*/	  r3.y = exp2(r3.y);
/*460*/	  r3.y = r3.w * r3.y;
/*461*/	  r3.y = r3.y * r5.w + r0.z;
/*462*/	  r2.w = r2.w * abs(r3.x);
/*463*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*464*/	} else {
/*465*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*466*/	}
/*467*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*468*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*469*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*470*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*471*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*472*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*473*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*474*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*475*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*476*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*477*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*478*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*479*/	r2.w = inversesqrt(r2.w);
/*480*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*481*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*482*/	r2.w = r2.w + r2.w;
/*483*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*484*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*485*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*486*/	r1.x = max(r1.x, 0.000000);
/*487*/	r1.x = log2(r1.x);
/*488*/	r1.x = r1.x * 10.000000;
/*489*/	r1.x = exp2(r1.x);
/*490*/	r1.x = r3.w * r1.x;
/*491*/	r0.z = r1.x * r5.w + r0.z;
/*492*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*493*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*494*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*495*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*496*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*497*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*498*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*499*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*500*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*501*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*502*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*503*/	if(r0.x != 0) discard;
/*504*/	color1.x = 1.000000;
/*505*/	return;
}
