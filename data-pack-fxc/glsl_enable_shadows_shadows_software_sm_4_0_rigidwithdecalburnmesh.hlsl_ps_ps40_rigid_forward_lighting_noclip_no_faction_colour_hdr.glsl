//
//
// Shader Model 4
// Fragment Shader
//
// id: 1161 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*19*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*20*/	r4.w = 1.000000;
/*21*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*22*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*23*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*24*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*25*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*26*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*27*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*28*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*29*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*30*/	r5.z = vsOut_T6.x;
/*31*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*32*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*33*/	if(floatBitsToUint(r2.w) != 0u) {
/*34*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*35*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*37*/	  r2.w = -r2.w + 1.000000;
/*38*/	  r2.w = max(r2.w, 0.000000);
/*39*/	  r5.z = sqrt(r2.w);
/*40*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*41*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*42*/	  r2.w = r3.x * r8.w;
/*43*/	  r3.x = r2.w * -0.500000 + r3.x;
/*44*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*45*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*46*/	  r2.w = -r6.w * r7.w + 1.000000;
/*47*/	  r1.xyz = (r2.wwww * r1.xyzx + r8.xyzx).xyz;
/*48*/	  r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*49*/	  r0.xyw = (r8.wwww * r5.xyxz + r0.xyxw).xyw;
/*50*/	}
/*51*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*52*/	r5.x = 0;
/*53*/	r5.y = cb0.data[26].x * 0.050000;
/*54*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*55*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*56*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*57*/	r2.w = saturate(r5.x * 5.000000);
/*58*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*59*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*61*/	r3.z = log2(r6.z);
/*62*/	r3.z = r3.z * 1.800000;
/*63*/	r3.z = exp2(r3.z);
/*64*/	r3.z = r3.z * 10.000000;
/*65*/	r3.z = min(r3.z, 1.000000);
/*66*/	r2.w = r2.w + r3.z;
/*67*/	r2.w = r2.w * 0.500000;
/*68*/	r3.z = -r6.w + 1.000000;
/*69*/	r3.z = log2(r3.z);
/*70*/	r3.z = r3.z * vsOut_T7.x;
/*71*/	r3.z = exp2(r3.z);
/*72*/	r3.z = min(r3.z, 1.000000);
/*73*/	r3.z = r3.z * vsOut_T7.x;
/*74*/	r3.w = r6.z * 0.250000;
/*75*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*76*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*77*/	r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*78*/	r1.xyz = (r3.zzzz * r5.xyzx + r1.xyzx).xyz;
/*79*/	r2.w = vsOut_T7.x + -0.025000;
/*80*/	r2.w = max(r2.w, 0.000000);
/*81*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*82*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*83*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*84*/	r2.w = inversesqrt(r2.w);
/*85*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*86*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*87*/	r2.w = inversesqrt(r2.w);
/*88*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*89*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*90*/	r2.w = inversesqrt(r2.w);
/*91*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*92*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*93*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*94*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*95*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*96*/	r2.w = inversesqrt(r2.w);
/*97*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*98*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*99*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*100*/	if(floatBitsToUint(r0.w) != 0u) {
/*101*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*102*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*103*/	  r0.w = r3.w * cb0.data[26].x;
/*104*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*105*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*106*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*107*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*108*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*109*/	}
/*110*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*111*/	if(floatBitsToUint(r0.w) != 0u) {
/*112*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*113*/	  if(floatBitsToUint(r0.w) != 0u) {
/*114*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*115*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*116*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*117*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*118*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*119*/	    r0.w = -r0.w + 1.000000;
/*120*/	    r0.w = max(r0.w, 0.000000);
/*121*/	    r9.z = sqrt(r0.w);
/*122*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*123*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*124*/	    r0.w = inversesqrt(r0.w);
/*125*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*126*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*127*/	    r11.y = -1.000000;
/*128*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*129*/	    r0.w = inversesqrt(r0.w);
/*130*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*131*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*132*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*133*/	    r2.w = r2.w * 1.250000;
/*134*/	    r2.w = min(r2.w, 1.000000);
/*135*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*136*/	    r3.z = r3.z * 4.000000;
/*137*/	    r2.w = r2.w * 0.200000 + r3.z;
/*138*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*139*/	    r0.w = r0.w + -r2.w;
/*140*/	    r0.w = saturate(r0.w * 200.000000);
/*141*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*142*/	    r0.w = r0.w * r0.w;
/*143*/	    r0.w = r0.w * r2.w;
/*144*/	    r3.y = r0.w * -r3.y + r3.y;
/*145*/	    r2.w = -r3.x + 0.200000;
/*146*/	    r3.x = r0.w * r2.w + r3.x;
/*147*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*148*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*149*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*150*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*151*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*152*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*153*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*154*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*155*/	    r2.w = -r2.w + 1.000000;
/*156*/	    r2.w = max(r2.w, 0.000000);
/*157*/	    r8.z = sqrt(r2.w);
/*158*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*159*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*160*/	    r2.w = sqrt(r2.w);
/*161*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*162*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*163*/	    r2.w = inversesqrt(r2.w);
/*164*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*165*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*166*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*167*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*168*/	    r2.w = -r0.y + 1.000000;
/*169*/	    r0.w = min(r0.w, r2.w);
/*170*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*171*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*172*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*173*/	    r0.w = inversesqrt(r0.w);
/*174*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*175*/	  }
/*176*/	}
/*177*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*178*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*179*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*180*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*181*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*182*/	r3.xzw = (-r1.xxyz + r2.wwww).xzw;
/*183*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*184*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*185*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*186*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*187*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*188*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*189*/	r2.w = inversesqrt(r2.w);
/*190*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*191*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*192*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*193*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*194*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*195*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*196*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*197*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*198*/	r3.x = intBitsToFloat(int(r2.w));
/*199*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*200*/	if(floatBitsToUint(r3.z) != 0u) {
/*201*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*202*/	  r5.w = vsOut_T0.w;
/*203*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*204*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*205*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*206*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*207*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*208*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*209*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*210*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*211*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*212*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*213*/	  if(floatBitsToUint(r3.w) == 0u) {
/*214*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*215*/	    r7.xy = floor((r6.xyxx).xy);
/*216*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*217*/	    r3.z = -0.000400 / r3.z;
/*218*/	    r3.z = r3.z + r6.z;
/*219*/	    r8.z = -r8.y + 1.000000;
/*220*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*221*/	    r8.w = -r8.y;
/*222*/	    r10.x = cb1.data[0].z/**/;
/*223*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*224*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*225*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*226*/	    r10.w = -cb1.data[0].w/**/;
/*227*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*228*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*229*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*230*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*231*/	    r8.x = r9.x;
/*232*/	    r8.y = r11.x;
/*233*/	    r8.z = r10.x;
/*234*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*235*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*236*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*237*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*238*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*239*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*240*/	    r3.z = -r6.x + r6.y;
/*241*/	    r3.z = r3.w * r3.z + r6.x;
/*242*/	  } else {
/*243*/	    r3.z = 1.000000;
/*244*/	  }
/*245*/	} else {
/*246*/	  r3.z = 1.000000;
/*247*/	}
/*248*/	r3.w = cb1.data[34].w + -1.000000;
/*249*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*250*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*251*/	if(floatBitsToUint(r2.w) == 0u) {
/*252*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*253*/	  r2.w = floatBitsToInt(r2.w);
/*254*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*255*/	  if(floatBitsToUint(r2.w) != 0u) {
/*256*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*257*/	    r5.w = vsOut_T0.w;
/*258*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*259*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*260*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*261*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*262*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*263*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*264*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*265*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*266*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*267*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*268*/	    if(floatBitsToUint(r5.w) == 0u) {
/*269*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*270*/	      r6.xy = floor((r5.xyxx).xy);
/*271*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*272*/	      r2.w = -0.000400 / r2.w;
/*273*/	      r2.w = r2.w + r5.z;
/*274*/	      r7.z = -r7.y + 1.000000;
/*275*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*276*/	      r7.w = -r7.y;
/*277*/	      r9.x = cb1.data[0].z/**/;
/*278*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*279*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*280*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*281*/	      r9.w = -cb1.data[0].w/**/;
/*282*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*283*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*284*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*285*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*286*/	      r7.x = r8.x;
/*287*/	      r7.y = r10.x;
/*288*/	      r7.z = r9.x;
/*289*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*290*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*291*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*292*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*293*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*294*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*295*/	      r2.w = -r5.x + r5.z;
/*296*/	      r2.w = r5.y * r2.w + r5.x;
/*297*/	    } else {
/*298*/	      r2.w = 1.000000;
/*299*/	    }
/*300*/	  } else {
/*301*/	    r2.w = 1.000000;
/*302*/	  }
/*303*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*304*/	  r5.y = r5.x * cb1.data[34].x;
/*305*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*306*/	  r5.x = r1.w + -r5.x;
/*307*/	  r5.x = saturate(r5.x / r5.y);
/*308*/	  r2.w = -r3.z + r2.w;
/*309*/	  r3.z = r5.x * r2.w + r3.z;
/*310*/	}
/*311*/	if(floatBitsToUint(r3.w) != 0u) {
/*312*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*313*/	  r3.w = r2.w * cb1.data[34].y;
/*314*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*315*/	  r2.w = r1.w + -r2.w;
/*316*/	  r2.w = saturate(r2.w / r3.w);
/*317*/	  r3.x = -r3.z + 1.000000;
/*318*/	  r3.z = r2.w * r3.x + r3.z;
/*319*/	}
/*320*/	r3.z = saturate(r3.z);
/*321*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*322*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*323*/	r2.w = inversesqrt(r2.w);
/*324*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*325*/	r2.w = -r3.y + 1.000000;
/*326*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*327*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*328*/	r3.w = r3.w + r3.w;
/*329*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*330*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*331*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*332*/	r3.w = cos((r8.x));
/*333*/	r3.w = inversesqrt(r3.w);
/*334*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*335*/	r5.w = saturate(r0.w * 60.000000);
/*336*/	r5.w = -r0.w + r5.w;
/*337*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*338*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*339*/	r6.w = inversesqrt(r6.w);
/*340*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*341*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*342*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*343*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*344*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*345*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*346*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*347*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*348*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*349*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*350*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*351*/	r6.w = -r0.w + 1.000000;
/*352*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*353*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*354*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*355*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*356*/	  r6.w = max(r6.w, 0.000000);
/*357*/	  r6.w = log2(r6.w);
/*358*/	  r6.w = r6.w * 10.000000;
/*359*/	  r6.w = exp2(r6.w);
/*360*/	  r6.w = r3.w * r6.w;
/*361*/	  r6.w = r6.w * r5.w + r0.w;
/*362*/	  r7.y = r2.w * 8.000000;
/*363*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*364*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*365*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*366*/	}
/*367*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*368*/	r7.y = max(r6.w, 0.000000);
/*369*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*370*/	if(floatBitsToUint(r6.w) != 0u) {
/*371*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*372*/	  r6.x = max(r6.x, -1.000000);
/*373*/	  r6.x = min(r6.x, 1.000000);
/*374*/	  r6.y = -abs(r6.x) + 1.000000;
/*375*/	  r6.y = sqrt(r6.y);
/*376*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*377*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*378*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*379*/	  r6.w = r6.y * r6.z;
/*380*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*381*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*382*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*383*/	  r6.x = r6.z * r6.y + r6.x;
/*384*/	  r3.y = r3.y * r3.y;
/*385*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*386*/	  r3.x = r3.y * r3.x + r7.x;
/*387*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*388*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*389*/	  r3.y = -r3.x * r3.x + 1.000000;
/*390*/	  r3.y = max(r3.y, 0.001000);
/*391*/	  r3.y = log2(r3.y);
/*392*/	  r6.y = r3.y * 4.950617;
/*393*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*394*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*395*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*396*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*397*/	  r3.x = floatBitsToInt(r3.x);
/*398*/	  r6.y = r3.y * r3.y + -r6.y;
/*399*/	  r6.y = sqrt(r6.y);
/*400*/	  r3.y = -r3.y + r6.y;
/*401*/	  r3.y = max(r3.y, 0.000000);
/*402*/	  r3.y = sqrt(r3.y);
/*403*/	  r3.x = r3.y * r3.x;
/*404*/	  r3.x = r3.x * 1.414214;
/*405*/	  r3.x = 0.008727 / r3.x;
/*406*/	  r3.x = max(r3.x, 0.000100);
/*407*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*408*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*409*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*410*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*411*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*412*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*413*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*414*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*415*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*416*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*417*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*418*/	  r3.x = floatBitsToInt(r3.x);
/*419*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*420*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*421*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*422*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*423*/	  r3.x = r3.x * r6.x + 1.000000;
/*424*/	  r3.x = r3.x * 0.500000;
/*425*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*426*/	  r3.y = r3.y * r6.y + 1.000000;
/*427*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*428*/	  r3.y = min(r7.y, 1.000000);
/*429*/	  r2.w = r2.w * 1.570796;
/*430*/	  r2.w = sin(r2.w);
/*431*/	  r3.y = r3.y + -1.000000;
/*432*/	  r2.w = r2.w * r3.y + 1.000000;
/*433*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*434*/	  r3.y = max(r3.y, 0.000000);
/*435*/	  r3.y = log2(r3.y);
/*436*/	  r3.y = r3.y * 10.000000;
/*437*/	  r3.y = exp2(r3.y);
/*438*/	  r3.y = r3.w * r3.y;
/*439*/	  r3.y = r3.y * r5.w + r0.w;
/*440*/	  r2.w = r2.w * abs(r3.x);
/*441*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*442*/	} else {
/*443*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*444*/	}
/*445*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*446*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*447*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*448*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*449*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*450*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*451*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*452*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*453*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*454*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*455*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*456*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*457*/	r2.w = inversesqrt(r2.w);
/*458*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*459*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*460*/	r2.w = r2.w + r2.w;
/*461*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*462*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*463*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*464*/	r0.x = max(r0.x, 0.000000);
/*465*/	r0.x = log2(r0.x);
/*466*/	r0.x = r0.x * 10.000000;
/*467*/	r0.x = exp2(r0.x);
/*468*/	r0.x = r3.w * r0.x;
/*469*/	r0.x = r0.x * r5.w + r0.w;
/*470*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*471*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*472*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*473*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*474*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*475*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*476*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*477*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*478*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*479*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*480*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*481*/	if(r0.x != 0) discard;
/*482*/	color1.x = 1.000000;
/*483*/	return;
}
