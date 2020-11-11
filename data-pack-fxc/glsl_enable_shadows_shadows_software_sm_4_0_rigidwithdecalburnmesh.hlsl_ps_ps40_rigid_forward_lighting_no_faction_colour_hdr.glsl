//
//
// Shader Model 4
// Fragment Shader
//
// id: 1159 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;

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
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*24*/	r4.w = 1.000000;
/*25*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*26*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*27*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*28*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*29*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*30*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*31*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*32*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*33*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*34*/	r5.z = vsOut_T6.x;
/*35*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*36*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*37*/	if(floatBitsToUint(r2.w) != 0u) {
/*38*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*39*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*40*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*41*/	  r2.w = -r2.w + 1.000000;
/*42*/	  r2.w = max(r2.w, 0.000000);
/*43*/	  r5.z = sqrt(r2.w);
/*44*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*45*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*46*/	  r2.w = r3.x * r8.w;
/*47*/	  r3.x = r2.w * -0.500000 + r3.x;
/*48*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*49*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*50*/	  r2.w = -r6.w * r7.w + 1.000000;
/*51*/	  r1.xyz = (r2.wwww * r1.xyzx + r8.xyzx).xyz;
/*52*/	  r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*53*/	  r0.xyw = (r8.wwww * r5.xyxz + r0.xyxw).xyw;
/*54*/	}
/*55*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*56*/	r5.x = 0;
/*57*/	r5.y = cb0.data[26].x * 0.050000;
/*58*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*59*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*60*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*61*/	r2.w = saturate(r5.x * 5.000000);
/*62*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*63*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*65*/	r3.z = log2(r6.z);
/*66*/	r3.z = r3.z * 1.800000;
/*67*/	r3.z = exp2(r3.z);
/*68*/	r3.z = r3.z * 10.000000;
/*69*/	r3.z = min(r3.z, 1.000000);
/*70*/	r2.w = r2.w + r3.z;
/*71*/	r2.w = r2.w * 0.500000;
/*72*/	r3.z = -r6.w + 1.000000;
/*73*/	r3.z = log2(r3.z);
/*74*/	r3.z = r3.z * vsOut_T7.x;
/*75*/	r3.z = exp2(r3.z);
/*76*/	r3.z = min(r3.z, 1.000000);
/*77*/	r3.z = r3.z * vsOut_T7.x;
/*78*/	r3.w = r6.z * 0.250000;
/*79*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*80*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*81*/	r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*82*/	r1.xyz = (r3.zzzz * r5.xyzx + r1.xyzx).xyz;
/*83*/	r2.w = vsOut_T7.x + -0.025000;
/*84*/	r2.w = max(r2.w, 0.000000);
/*85*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*86*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*87*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*88*/	r2.w = inversesqrt(r2.w);
/*89*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*90*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*91*/	r2.w = inversesqrt(r2.w);
/*92*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*93*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*94*/	r2.w = inversesqrt(r2.w);
/*95*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*96*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*97*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*98*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*99*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*100*/	r2.w = inversesqrt(r2.w);
/*101*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*102*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*103*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*104*/	if(floatBitsToUint(r0.w) != 0u) {
/*105*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*106*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*107*/	  r0.w = r3.w * cb0.data[26].x;
/*108*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*109*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*110*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*111*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*112*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*113*/	}
/*114*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*115*/	if(floatBitsToUint(r0.w) != 0u) {
/*116*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*117*/	  if(floatBitsToUint(r0.w) != 0u) {
/*118*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*119*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*120*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*121*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*122*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*123*/	    r0.w = -r0.w + 1.000000;
/*124*/	    r0.w = max(r0.w, 0.000000);
/*125*/	    r9.z = sqrt(r0.w);
/*126*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*127*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*128*/	    r0.w = inversesqrt(r0.w);
/*129*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*130*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*131*/	    r11.y = -1.000000;
/*132*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*133*/	    r0.w = inversesqrt(r0.w);
/*134*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*135*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*136*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*137*/	    r2.w = r2.w * 1.250000;
/*138*/	    r2.w = min(r2.w, 1.000000);
/*139*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*140*/	    r3.z = r3.z * 4.000000;
/*141*/	    r2.w = r2.w * 0.200000 + r3.z;
/*142*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*143*/	    r0.w = r0.w + -r2.w;
/*144*/	    r0.w = saturate(r0.w * 200.000000);
/*145*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*146*/	    r0.w = r0.w * r0.w;
/*147*/	    r0.w = r0.w * r2.w;
/*148*/	    r3.y = r0.w * -r3.y + r3.y;
/*149*/	    r2.w = -r3.x + 0.200000;
/*150*/	    r3.x = r0.w * r2.w + r3.x;
/*151*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*152*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*153*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*154*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*155*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*156*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*157*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*158*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*159*/	    r2.w = -r2.w + 1.000000;
/*160*/	    r2.w = max(r2.w, 0.000000);
/*161*/	    r8.z = sqrt(r2.w);
/*162*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*163*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*164*/	    r2.w = sqrt(r2.w);
/*165*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*166*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*167*/	    r2.w = inversesqrt(r2.w);
/*168*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*169*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*170*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*171*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*172*/	    r2.w = -r0.y + 1.000000;
/*173*/	    r0.w = min(r0.w, r2.w);
/*174*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*175*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*176*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*177*/	    r0.w = inversesqrt(r0.w);
/*178*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*179*/	  }
/*180*/	}
/*181*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*182*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*183*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*184*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*185*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*186*/	r3.xzw = (-r1.xxyz + r2.wwww).xzw;
/*187*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*188*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*189*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*190*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*191*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*192*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*193*/	r2.w = inversesqrt(r2.w);
/*194*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*195*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*196*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*197*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*198*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*199*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*200*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*201*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*202*/	r3.x = intBitsToFloat(int(r2.w));
/*203*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*204*/	if(floatBitsToUint(r3.z) != 0u) {
/*205*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*206*/	  r5.w = vsOut_T0.w;
/*207*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*208*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*209*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*210*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*211*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*212*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*213*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*214*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*215*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*216*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*217*/	  if(floatBitsToUint(r3.w) == 0u) {
/*218*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*219*/	    r7.xy = floor((r6.xyxx).xy);
/*220*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*221*/	    r3.z = -0.000400 / r3.z;
/*222*/	    r3.z = r3.z + r6.z;
/*223*/	    r8.z = -r8.y + 1.000000;
/*224*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*225*/	    r8.w = -r8.y;
/*226*/	    r10.x = cb1.data[0].z/**/;
/*227*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*228*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*229*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*230*/	    r10.w = -cb1.data[0].w/**/;
/*231*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*232*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*233*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*234*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*235*/	    r8.x = r9.x;
/*236*/	    r8.y = r11.x;
/*237*/	    r8.z = r10.x;
/*238*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*239*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*240*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*241*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*242*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*243*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*244*/	    r3.z = -r6.x + r6.y;
/*245*/	    r3.z = r3.w * r3.z + r6.x;
/*246*/	  } else {
/*247*/	    r3.z = 1.000000;
/*248*/	  }
/*249*/	} else {
/*250*/	  r3.z = 1.000000;
/*251*/	}
/*252*/	r3.w = cb1.data[34].w + -1.000000;
/*253*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*254*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*255*/	if(floatBitsToUint(r2.w) == 0u) {
/*256*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*257*/	  r2.w = floatBitsToInt(r2.w);
/*258*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*259*/	  if(floatBitsToUint(r2.w) != 0u) {
/*260*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*261*/	    r5.w = vsOut_T0.w;
/*262*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*263*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*264*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*265*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*266*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*267*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*268*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*269*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*270*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*271*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*272*/	    if(floatBitsToUint(r5.w) == 0u) {
/*273*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*274*/	      r6.xy = floor((r5.xyxx).xy);
/*275*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*276*/	      r2.w = -0.000400 / r2.w;
/*277*/	      r2.w = r2.w + r5.z;
/*278*/	      r7.z = -r7.y + 1.000000;
/*279*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*280*/	      r7.w = -r7.y;
/*281*/	      r9.x = cb1.data[0].z/**/;
/*282*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*283*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*284*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*285*/	      r9.w = -cb1.data[0].w/**/;
/*286*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*287*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*288*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*289*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*290*/	      r7.x = r8.x;
/*291*/	      r7.y = r10.x;
/*292*/	      r7.z = r9.x;
/*293*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*294*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*295*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*296*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*297*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*298*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*299*/	      r2.w = -r5.x + r5.z;
/*300*/	      r2.w = r5.y * r2.w + r5.x;
/*301*/	    } else {
/*302*/	      r2.w = 1.000000;
/*303*/	    }
/*304*/	  } else {
/*305*/	    r2.w = 1.000000;
/*306*/	  }
/*307*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*308*/	  r5.y = r5.x * cb1.data[34].x;
/*309*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*310*/	  r5.x = r1.w + -r5.x;
/*311*/	  r5.x = saturate(r5.x / r5.y);
/*312*/	  r2.w = -r3.z + r2.w;
/*313*/	  r3.z = r5.x * r2.w + r3.z;
/*314*/	}
/*315*/	if(floatBitsToUint(r3.w) != 0u) {
/*316*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*317*/	  r3.w = r2.w * cb1.data[34].y;
/*318*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*319*/	  r2.w = r1.w + -r2.w;
/*320*/	  r2.w = saturate(r2.w / r3.w);
/*321*/	  r3.x = -r3.z + 1.000000;
/*322*/	  r3.z = r2.w * r3.x + r3.z;
/*323*/	}
/*324*/	r3.z = saturate(r3.z);
/*325*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*326*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*327*/	r2.w = inversesqrt(r2.w);
/*328*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*329*/	r2.w = -r3.y + 1.000000;
/*330*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*331*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*332*/	r3.w = r3.w + r3.w;
/*333*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*334*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*335*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*336*/	r3.w = cos((r8.x));
/*337*/	r3.w = inversesqrt(r3.w);
/*338*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*339*/	r5.w = saturate(r0.w * 60.000000);
/*340*/	r5.w = -r0.w + r5.w;
/*341*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*342*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*343*/	r6.w = inversesqrt(r6.w);
/*344*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*345*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*346*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*347*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*348*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*349*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*350*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*351*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*352*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*353*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*354*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*355*/	r6.w = -r0.w + 1.000000;
/*356*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*357*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*358*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*359*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*360*/	  r6.w = max(r6.w, 0.000000);
/*361*/	  r6.w = log2(r6.w);
/*362*/	  r6.w = r6.w * 10.000000;
/*363*/	  r6.w = exp2(r6.w);
/*364*/	  r6.w = r3.w * r6.w;
/*365*/	  r6.w = r6.w * r5.w + r0.w;
/*366*/	  r7.y = r2.w * 8.000000;
/*367*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*368*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*369*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*370*/	}
/*371*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*372*/	r7.y = max(r6.w, 0.000000);
/*373*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*374*/	if(floatBitsToUint(r6.w) != 0u) {
/*375*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*376*/	  r6.x = max(r6.x, -1.000000);
/*377*/	  r6.x = min(r6.x, 1.000000);
/*378*/	  r6.y = -abs(r6.x) + 1.000000;
/*379*/	  r6.y = sqrt(r6.y);
/*380*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*381*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*382*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*383*/	  r6.w = r6.y * r6.z;
/*384*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*385*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*386*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*387*/	  r6.x = r6.z * r6.y + r6.x;
/*388*/	  r3.y = r3.y * r3.y;
/*389*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*390*/	  r3.x = r3.y * r3.x + r7.x;
/*391*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*392*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*393*/	  r3.y = -r3.x * r3.x + 1.000000;
/*394*/	  r3.y = max(r3.y, 0.001000);
/*395*/	  r3.y = log2(r3.y);
/*396*/	  r6.y = r3.y * 4.950617;
/*397*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*398*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*399*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*400*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*401*/	  r3.x = floatBitsToInt(r3.x);
/*402*/	  r6.y = r3.y * r3.y + -r6.y;
/*403*/	  r6.y = sqrt(r6.y);
/*404*/	  r3.y = -r3.y + r6.y;
/*405*/	  r3.y = max(r3.y, 0.000000);
/*406*/	  r3.y = sqrt(r3.y);
/*407*/	  r3.x = r3.y * r3.x;
/*408*/	  r3.x = r3.x * 1.414214;
/*409*/	  r3.x = 0.008727 / r3.x;
/*410*/	  r3.x = max(r3.x, 0.000100);
/*411*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*412*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*413*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*414*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*415*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*416*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*417*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*418*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*419*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*420*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*421*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*422*/	  r3.x = floatBitsToInt(r3.x);
/*423*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*424*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*425*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*426*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*427*/	  r3.x = r3.x * r6.x + 1.000000;
/*428*/	  r3.x = r3.x * 0.500000;
/*429*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*430*/	  r3.y = r3.y * r6.y + 1.000000;
/*431*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*432*/	  r3.y = min(r7.y, 1.000000);
/*433*/	  r2.w = r2.w * 1.570796;
/*434*/	  r2.w = sin(r2.w);
/*435*/	  r3.y = r3.y + -1.000000;
/*436*/	  r2.w = r2.w * r3.y + 1.000000;
/*437*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*438*/	  r3.y = max(r3.y, 0.000000);
/*439*/	  r3.y = log2(r3.y);
/*440*/	  r3.y = r3.y * 10.000000;
/*441*/	  r3.y = exp2(r3.y);
/*442*/	  r3.y = r3.w * r3.y;
/*443*/	  r3.y = r3.y * r5.w + r0.w;
/*444*/	  r2.w = r2.w * abs(r3.x);
/*445*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*446*/	} else {
/*447*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*448*/	}
/*449*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*450*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*451*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*452*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*453*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*454*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*455*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*456*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*457*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*458*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*459*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*460*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*461*/	r2.w = inversesqrt(r2.w);
/*462*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*463*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*464*/	r2.w = r2.w + r2.w;
/*465*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*466*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*467*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*468*/	r0.x = max(r0.x, 0.000000);
/*469*/	r0.x = log2(r0.x);
/*470*/	r0.x = r0.x * 10.000000;
/*471*/	r0.x = exp2(r0.x);
/*472*/	r0.x = r3.w * r0.x;
/*473*/	r0.x = r0.x * r5.w + r0.w;
/*474*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*475*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*476*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*477*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*478*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*479*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*480*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*481*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*482*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*483*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*484*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*485*/	if(r0.x != 0) discard;
/*486*/	color1.x = 1.000000;
/*487*/	return;
}
