//
//
// Shader Model 4
// Fragment Shader
//
// id: 5139 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
/*69*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*70*/	r2.w = inversesqrt(r2.w);
/*71*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*72*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*73*/	r2.w = inversesqrt(r2.w);
/*74*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*75*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*76*/	r2.w = inversesqrt(r2.w);
/*77*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*78*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*79*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*80*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*81*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*82*/	r2.w = inversesqrt(r2.w);
/*83*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*84*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*85*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*86*/	if(floatBitsToUint(r0.z) != 0u) {
/*87*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*88*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*89*/	  r0.z = r3.w * cb0.data[26].x;
/*90*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*91*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*92*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*93*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*94*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*95*/	}
/*96*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*97*/	if(floatBitsToUint(r0.z) != 0u) {
/*98*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*99*/	  if(floatBitsToUint(r0.z) != 0u) {
/*100*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*101*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*102*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*103*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*104*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*105*/	    r0.z = -r0.z + 1.000000;
/*106*/	    r0.z = max(r0.z, 0.000000);
/*107*/	    r9.z = sqrt(r0.z);
/*108*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*109*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*110*/	    r0.z = inversesqrt(r0.z);
/*111*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*112*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*113*/	    r11.y = -1.000000;
/*114*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*115*/	    r0.z = inversesqrt(r0.z);
/*116*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*117*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*118*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*119*/	    r2.w = r2.w * 1.250000;
/*120*/	    r2.w = min(r2.w, 1.000000);
/*121*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*122*/	    r3.z = r3.z * 4.000000;
/*123*/	    r2.w = r2.w * 0.200000 + r3.z;
/*124*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*125*/	    r0.z = r0.z + -r2.w;
/*126*/	    r0.z = saturate(r0.z * 200.000000);
/*127*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*128*/	    r0.z = r0.z * r0.z;
/*129*/	    r0.z = r0.z * r2.w;
/*130*/	    r3.y = r0.z * -r3.y + r3.y;
/*131*/	    r2.w = -r3.x + 0.200000;
/*132*/	    r3.x = r0.z * r2.w + r3.x;
/*133*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*134*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*135*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*136*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*137*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*138*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*139*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*140*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*141*/	    r2.w = -r2.w + 1.000000;
/*142*/	    r2.w = max(r2.w, 0.000000);
/*143*/	    r8.z = sqrt(r2.w);
/*144*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*145*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*146*/	    r2.w = sqrt(r2.w);
/*147*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*148*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*149*/	    r2.w = inversesqrt(r2.w);
/*150*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*151*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*152*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*153*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*154*/	    r2.w = -r1.y + 1.000000;
/*155*/	    r0.z = min(r0.z, r2.w);
/*156*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*157*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*158*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*159*/	    r0.z = inversesqrt(r0.z);
/*160*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*161*/	  }
/*162*/	}
/*163*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*164*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*165*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*166*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*167*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*168*/	r3.xzw = (-r0.xxyw + r2.wwww).xzw;
/*169*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*170*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*171*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*172*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*173*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*174*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*175*/	r2.w = inversesqrt(r2.w);
/*176*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*177*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*178*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*179*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*180*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*181*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*182*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*183*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*184*/	r3.x = intBitsToFloat(int(r2.w));
/*185*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*186*/	if(floatBitsToUint(r3.z) != 0u) {
/*187*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*188*/	  r5.w = vsOut_T0.w;
/*189*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*190*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*191*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*192*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*193*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*194*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*195*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*196*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*197*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*198*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*199*/	  if(floatBitsToUint(r3.w) == 0u) {
/*200*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*201*/	    r7.xy = floor((r6.xyxx).xy);
/*202*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*203*/	    r3.z = -0.000400 / r3.z;
/*204*/	    r3.z = r3.z + r6.z;
/*205*/	    r8.z = -r8.y + 1.000000;
/*206*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*207*/	    r8.w = -r8.y;
/*208*/	    r10.x = cb1.data[0].z/**/;
/*209*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*210*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*211*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*212*/	    r10.w = -cb1.data[0].w/**/;
/*213*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*214*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*215*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*216*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*217*/	    r8.x = r9.x;
/*218*/	    r8.y = r11.x;
/*219*/	    r8.z = r10.x;
/*220*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*221*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*222*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*223*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*224*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*225*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*226*/	    r3.z = -r6.x + r6.y;
/*227*/	    r3.z = r3.w * r3.z + r6.x;
/*228*/	  } else {
/*229*/	    r3.z = 1.000000;
/*230*/	  }
/*231*/	} else {
/*232*/	  r3.z = 1.000000;
/*233*/	}
/*234*/	r3.w = cb1.data[34].w + -1.000000;
/*235*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*236*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*237*/	if(floatBitsToUint(r2.w) == 0u) {
/*238*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*239*/	  r2.w = floatBitsToInt(r2.w);
/*240*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*241*/	  if(floatBitsToUint(r2.w) != 0u) {
/*242*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*243*/	    r5.w = vsOut_T0.w;
/*244*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*245*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*246*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*247*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*248*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*249*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*250*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*251*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*252*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*253*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*254*/	    if(floatBitsToUint(r5.w) == 0u) {
/*255*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*256*/	      r6.xy = floor((r5.xyxx).xy);
/*257*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*258*/	      r2.w = -0.000400 / r2.w;
/*259*/	      r2.w = r2.w + r5.z;
/*260*/	      r7.z = -r7.y + 1.000000;
/*261*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*262*/	      r7.w = -r7.y;
/*263*/	      r9.x = cb1.data[0].z/**/;
/*264*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*265*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*266*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*267*/	      r9.w = -cb1.data[0].w/**/;
/*268*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*269*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*270*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*271*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*272*/	      r7.x = r8.x;
/*273*/	      r7.y = r10.x;
/*274*/	      r7.z = r9.x;
/*275*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*276*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*277*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*278*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*279*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*280*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*281*/	      r2.w = -r5.x + r5.z;
/*282*/	      r2.w = r5.y * r2.w + r5.x;
/*283*/	    } else {
/*284*/	      r2.w = 1.000000;
/*285*/	    }
/*286*/	  } else {
/*287*/	    r2.w = 1.000000;
/*288*/	  }
/*289*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*290*/	  r5.y = r5.x * cb1.data[34].x;
/*291*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*292*/	  r5.x = r1.w + -r5.x;
/*293*/	  r5.x = saturate(r5.x / r5.y);
/*294*/	  r2.w = -r3.z + r2.w;
/*295*/	  r3.z = r5.x * r2.w + r3.z;
/*296*/	}
/*297*/	if(floatBitsToUint(r3.w) != 0u) {
/*298*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*299*/	  r3.w = r2.w * cb1.data[34].y;
/*300*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*301*/	  r2.w = r1.w + -r2.w;
/*302*/	  r2.w = saturate(r2.w / r3.w);
/*303*/	  r3.x = -r3.z + 1.000000;
/*304*/	  r3.z = r2.w * r3.x + r3.z;
/*305*/	}
/*306*/	r3.z = saturate(r3.z);
/*307*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*308*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*309*/	r2.w = inversesqrt(r2.w);
/*310*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*311*/	r2.w = -r3.y + 1.000000;
/*312*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*313*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*314*/	r3.w = r3.w + r3.w;
/*315*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*316*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*317*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*318*/	r3.w = cos((r8.x));
/*319*/	r3.w = inversesqrt(r3.w);
/*320*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*321*/	r5.w = saturate(r0.z * 60.000000);
/*322*/	r5.w = -r0.z + r5.w;
/*323*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*324*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*325*/	r6.w = inversesqrt(r6.w);
/*326*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*327*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*328*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*329*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*330*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*331*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*332*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*333*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*334*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*335*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*336*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*337*/	r6.w = -r0.z + 1.000000;
/*338*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*339*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*340*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*341*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*342*/	  r6.w = max(r6.w, 0.000000);
/*343*/	  r6.w = log2(r6.w);
/*344*/	  r6.w = r6.w * 10.000000;
/*345*/	  r6.w = exp2(r6.w);
/*346*/	  r6.w = r3.w * r6.w;
/*347*/	  r6.w = r6.w * r5.w + r0.z;
/*348*/	  r7.y = r2.w * 8.000000;
/*349*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*350*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*351*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*352*/	}
/*353*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*354*/	r7.y = max(r6.w, 0.000000);
/*355*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*356*/	if(floatBitsToUint(r6.w) != 0u) {
/*357*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*358*/	  r6.x = max(r6.x, -1.000000);
/*359*/	  r6.x = min(r6.x, 1.000000);
/*360*/	  r6.y = -abs(r6.x) + 1.000000;
/*361*/	  r6.y = sqrt(r6.y);
/*362*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*363*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*364*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*365*/	  r6.w = r6.y * r6.z;
/*366*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*367*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*368*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*369*/	  r6.x = r6.z * r6.y + r6.x;
/*370*/	  r3.y = r3.y * r3.y;
/*371*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*372*/	  r3.x = r3.y * r3.x + r7.x;
/*373*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*374*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*375*/	  r3.y = -r3.x * r3.x + 1.000000;
/*376*/	  r3.y = max(r3.y, 0.001000);
/*377*/	  r3.y = log2(r3.y);
/*378*/	  r6.y = r3.y * 4.950617;
/*379*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*380*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*381*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*382*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*383*/	  r3.x = floatBitsToInt(r3.x);
/*384*/	  r6.y = r3.y * r3.y + -r6.y;
/*385*/	  r6.y = sqrt(r6.y);
/*386*/	  r3.y = -r3.y + r6.y;
/*387*/	  r3.y = max(r3.y, 0.000000);
/*388*/	  r3.y = sqrt(r3.y);
/*389*/	  r3.x = r3.y * r3.x;
/*390*/	  r3.x = r3.x * 1.414214;
/*391*/	  r3.x = 0.008727 / r3.x;
/*392*/	  r3.x = max(r3.x, 0.000100);
/*393*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*394*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*395*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*396*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*397*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*398*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*399*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*400*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*401*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*402*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*403*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*404*/	  r3.x = floatBitsToInt(r3.x);
/*405*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*406*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*407*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*408*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*409*/	  r3.x = r3.x * r6.x + 1.000000;
/*410*/	  r3.x = r3.x * 0.500000;
/*411*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*412*/	  r3.y = r3.y * r6.y + 1.000000;
/*413*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*414*/	  r3.y = min(r7.y, 1.000000);
/*415*/	  r2.w = r2.w * 1.570796;
/*416*/	  r2.w = sin(r2.w);
/*417*/	  r3.y = r3.y + -1.000000;
/*418*/	  r2.w = r2.w * r3.y + 1.000000;
/*419*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*420*/	  r3.y = max(r3.y, 0.000000);
/*421*/	  r3.y = log2(r3.y);
/*422*/	  r3.y = r3.y * 10.000000;
/*423*/	  r3.y = exp2(r3.y);
/*424*/	  r3.y = r3.w * r3.y;
/*425*/	  r3.y = r3.y * r5.w + r0.z;
/*426*/	  r2.w = r2.w * abs(r3.x);
/*427*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*428*/	} else {
/*429*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*430*/	}
/*431*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*432*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*433*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*434*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*435*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*436*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*437*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*438*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*439*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*440*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*441*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*442*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*443*/	r2.w = inversesqrt(r2.w);
/*444*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*445*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*446*/	r2.w = r2.w + r2.w;
/*447*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*448*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*449*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*450*/	r1.x = max(r1.x, 0.000000);
/*451*/	r1.x = log2(r1.x);
/*452*/	r1.x = r1.x * 10.000000;
/*453*/	r1.x = exp2(r1.x);
/*454*/	r1.x = r3.w * r1.x;
/*455*/	r0.z = r1.x * r5.w + r0.z;
/*456*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*457*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*458*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*459*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*460*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*461*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*462*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*463*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*464*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*465*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*466*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*467*/	if(r0.x != 0) discard;
/*468*/	color1.x = 1.000000;
/*469*/	return;
}
