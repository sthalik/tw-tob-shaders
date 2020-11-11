//
//
// Shader Model 4
// Fragment Shader
//
// id: 5137 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*73*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*74*/	r2.w = inversesqrt(r2.w);
/*75*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*76*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*77*/	r2.w = inversesqrt(r2.w);
/*78*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*79*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*80*/	r2.w = inversesqrt(r2.w);
/*81*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*82*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*83*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*84*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*85*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*86*/	r2.w = inversesqrt(r2.w);
/*87*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*88*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*89*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*90*/	if(floatBitsToUint(r0.z) != 0u) {
/*91*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*92*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*93*/	  r0.z = r3.w * cb0.data[26].x;
/*94*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*95*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*96*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*97*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*98*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*99*/	}
/*100*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*101*/	if(floatBitsToUint(r0.z) != 0u) {
/*102*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*103*/	  if(floatBitsToUint(r0.z) != 0u) {
/*104*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*105*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*106*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*107*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*108*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*109*/	    r0.z = -r0.z + 1.000000;
/*110*/	    r0.z = max(r0.z, 0.000000);
/*111*/	    r9.z = sqrt(r0.z);
/*112*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*113*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*114*/	    r0.z = inversesqrt(r0.z);
/*115*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*116*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*117*/	    r11.y = -1.000000;
/*118*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*119*/	    r0.z = inversesqrt(r0.z);
/*120*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*121*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*122*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*123*/	    r2.w = r2.w * 1.250000;
/*124*/	    r2.w = min(r2.w, 1.000000);
/*125*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*126*/	    r3.z = r3.z * 4.000000;
/*127*/	    r2.w = r2.w * 0.200000 + r3.z;
/*128*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*129*/	    r0.z = r0.z + -r2.w;
/*130*/	    r0.z = saturate(r0.z * 200.000000);
/*131*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*132*/	    r0.z = r0.z * r0.z;
/*133*/	    r0.z = r0.z * r2.w;
/*134*/	    r3.y = r0.z * -r3.y + r3.y;
/*135*/	    r2.w = -r3.x + 0.200000;
/*136*/	    r3.x = r0.z * r2.w + r3.x;
/*137*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*138*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*139*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*140*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*141*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*142*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*143*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*144*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*145*/	    r2.w = -r2.w + 1.000000;
/*146*/	    r2.w = max(r2.w, 0.000000);
/*147*/	    r8.z = sqrt(r2.w);
/*148*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*149*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*150*/	    r2.w = sqrt(r2.w);
/*151*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*152*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*153*/	    r2.w = inversesqrt(r2.w);
/*154*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*155*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*156*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*157*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*158*/	    r2.w = -r1.y + 1.000000;
/*159*/	    r0.z = min(r0.z, r2.w);
/*160*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*161*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*162*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*163*/	    r0.z = inversesqrt(r0.z);
/*164*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*165*/	  }
/*166*/	}
/*167*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*168*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*169*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*170*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*171*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*172*/	r3.xzw = (-r0.xxyw + r2.wwww).xzw;
/*173*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*174*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*175*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*176*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*177*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*178*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*179*/	r2.w = inversesqrt(r2.w);
/*180*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*181*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*182*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*183*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*184*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*185*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*186*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*187*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*188*/	r3.x = intBitsToFloat(int(r2.w));
/*189*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*190*/	if(floatBitsToUint(r3.z) != 0u) {
/*191*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*192*/	  r5.w = vsOut_T0.w;
/*193*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*194*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*195*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*196*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*197*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*198*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*199*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*200*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*201*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*202*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*203*/	  if(floatBitsToUint(r3.w) == 0u) {
/*204*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*205*/	    r7.xy = floor((r6.xyxx).xy);
/*206*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*207*/	    r3.z = -0.000400 / r3.z;
/*208*/	    r3.z = r3.z + r6.z;
/*209*/	    r8.z = -r8.y + 1.000000;
/*210*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*211*/	    r8.w = -r8.y;
/*212*/	    r10.x = cb1.data[0].z/**/;
/*213*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*214*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*215*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*216*/	    r10.w = -cb1.data[0].w/**/;
/*217*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*218*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*219*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*220*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*221*/	    r8.x = r9.x;
/*222*/	    r8.y = r11.x;
/*223*/	    r8.z = r10.x;
/*224*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*225*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*226*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*227*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*228*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*229*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*230*/	    r3.z = -r6.x + r6.y;
/*231*/	    r3.z = r3.w * r3.z + r6.x;
/*232*/	  } else {
/*233*/	    r3.z = 1.000000;
/*234*/	  }
/*235*/	} else {
/*236*/	  r3.z = 1.000000;
/*237*/	}
/*238*/	r3.w = cb1.data[34].w + -1.000000;
/*239*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*240*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*241*/	if(floatBitsToUint(r2.w) == 0u) {
/*242*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*243*/	  r2.w = floatBitsToInt(r2.w);
/*244*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*245*/	  if(floatBitsToUint(r2.w) != 0u) {
/*246*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*247*/	    r5.w = vsOut_T0.w;
/*248*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*249*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*250*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*251*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*252*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*253*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*254*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*255*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*256*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*257*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*258*/	    if(floatBitsToUint(r5.w) == 0u) {
/*259*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*260*/	      r6.xy = floor((r5.xyxx).xy);
/*261*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*262*/	      r2.w = -0.000400 / r2.w;
/*263*/	      r2.w = r2.w + r5.z;
/*264*/	      r7.z = -r7.y + 1.000000;
/*265*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*266*/	      r7.w = -r7.y;
/*267*/	      r9.x = cb1.data[0].z/**/;
/*268*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*269*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*270*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*271*/	      r9.w = -cb1.data[0].w/**/;
/*272*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*273*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*274*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*275*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*276*/	      r7.x = r8.x;
/*277*/	      r7.y = r10.x;
/*278*/	      r7.z = r9.x;
/*279*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*280*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*281*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*282*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*283*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*284*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*285*/	      r2.w = -r5.x + r5.z;
/*286*/	      r2.w = r5.y * r2.w + r5.x;
/*287*/	    } else {
/*288*/	      r2.w = 1.000000;
/*289*/	    }
/*290*/	  } else {
/*291*/	    r2.w = 1.000000;
/*292*/	  }
/*293*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*294*/	  r5.y = r5.x * cb1.data[34].x;
/*295*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*296*/	  r5.x = r1.w + -r5.x;
/*297*/	  r5.x = saturate(r5.x / r5.y);
/*298*/	  r2.w = -r3.z + r2.w;
/*299*/	  r3.z = r5.x * r2.w + r3.z;
/*300*/	}
/*301*/	if(floatBitsToUint(r3.w) != 0u) {
/*302*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*303*/	  r3.w = r2.w * cb1.data[34].y;
/*304*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*305*/	  r2.w = r1.w + -r2.w;
/*306*/	  r2.w = saturate(r2.w / r3.w);
/*307*/	  r3.x = -r3.z + 1.000000;
/*308*/	  r3.z = r2.w * r3.x + r3.z;
/*309*/	}
/*310*/	r3.z = saturate(r3.z);
/*311*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*312*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*313*/	r2.w = inversesqrt(r2.w);
/*314*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*315*/	r2.w = -r3.y + 1.000000;
/*316*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*317*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*318*/	r3.w = r3.w + r3.w;
/*319*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*320*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*321*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*322*/	r3.w = cos((r8.x));
/*323*/	r3.w = inversesqrt(r3.w);
/*324*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*325*/	r5.w = saturate(r0.z * 60.000000);
/*326*/	r5.w = -r0.z + r5.w;
/*327*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*328*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*329*/	r6.w = inversesqrt(r6.w);
/*330*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*331*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*332*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*333*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*334*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*335*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*336*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*337*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*338*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*339*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*340*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*341*/	r6.w = -r0.z + 1.000000;
/*342*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*343*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*344*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*345*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*346*/	  r6.w = max(r6.w, 0.000000);
/*347*/	  r6.w = log2(r6.w);
/*348*/	  r6.w = r6.w * 10.000000;
/*349*/	  r6.w = exp2(r6.w);
/*350*/	  r6.w = r3.w * r6.w;
/*351*/	  r6.w = r6.w * r5.w + r0.z;
/*352*/	  r7.y = r2.w * 8.000000;
/*353*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*354*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*355*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*356*/	}
/*357*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*358*/	r7.y = max(r6.w, 0.000000);
/*359*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*360*/	if(floatBitsToUint(r6.w) != 0u) {
/*361*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*362*/	  r6.x = max(r6.x, -1.000000);
/*363*/	  r6.x = min(r6.x, 1.000000);
/*364*/	  r6.y = -abs(r6.x) + 1.000000;
/*365*/	  r6.y = sqrt(r6.y);
/*366*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*367*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*368*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*369*/	  r6.w = r6.y * r6.z;
/*370*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*371*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*372*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*373*/	  r6.x = r6.z * r6.y + r6.x;
/*374*/	  r3.y = r3.y * r3.y;
/*375*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*376*/	  r3.x = r3.y * r3.x + r7.x;
/*377*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*378*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*379*/	  r3.y = -r3.x * r3.x + 1.000000;
/*380*/	  r3.y = max(r3.y, 0.001000);
/*381*/	  r3.y = log2(r3.y);
/*382*/	  r6.y = r3.y * 4.950617;
/*383*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*384*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*385*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*386*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*387*/	  r3.x = floatBitsToInt(r3.x);
/*388*/	  r6.y = r3.y * r3.y + -r6.y;
/*389*/	  r6.y = sqrt(r6.y);
/*390*/	  r3.y = -r3.y + r6.y;
/*391*/	  r3.y = max(r3.y, 0.000000);
/*392*/	  r3.y = sqrt(r3.y);
/*393*/	  r3.x = r3.y * r3.x;
/*394*/	  r3.x = r3.x * 1.414214;
/*395*/	  r3.x = 0.008727 / r3.x;
/*396*/	  r3.x = max(r3.x, 0.000100);
/*397*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*398*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*399*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*400*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*401*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*402*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*403*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*404*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*405*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*406*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*407*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*408*/	  r3.x = floatBitsToInt(r3.x);
/*409*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*410*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*411*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*412*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*413*/	  r3.x = r3.x * r6.x + 1.000000;
/*414*/	  r3.x = r3.x * 0.500000;
/*415*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*416*/	  r3.y = r3.y * r6.y + 1.000000;
/*417*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*418*/	  r3.y = min(r7.y, 1.000000);
/*419*/	  r2.w = r2.w * 1.570796;
/*420*/	  r2.w = sin(r2.w);
/*421*/	  r3.y = r3.y + -1.000000;
/*422*/	  r2.w = r2.w * r3.y + 1.000000;
/*423*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*424*/	  r3.y = max(r3.y, 0.000000);
/*425*/	  r3.y = log2(r3.y);
/*426*/	  r3.y = r3.y * 10.000000;
/*427*/	  r3.y = exp2(r3.y);
/*428*/	  r3.y = r3.w * r3.y;
/*429*/	  r3.y = r3.y * r5.w + r0.z;
/*430*/	  r2.w = r2.w * abs(r3.x);
/*431*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*432*/	} else {
/*433*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*434*/	}
/*435*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*436*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*437*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*438*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*439*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*440*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*441*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*442*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*443*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*444*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*445*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*446*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*447*/	r2.w = inversesqrt(r2.w);
/*448*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*449*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*450*/	r2.w = r2.w + r2.w;
/*451*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*452*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*453*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*454*/	r1.x = max(r1.x, 0.000000);
/*455*/	r1.x = log2(r1.x);
/*456*/	r1.x = r1.x * 10.000000;
/*457*/	r1.x = exp2(r1.x);
/*458*/	r1.x = r3.w * r1.x;
/*459*/	r0.z = r1.x * r5.w + r0.z;
/*460*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*461*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*462*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*463*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*464*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*465*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*466*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*467*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*468*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*469*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*470*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*471*/	if(r0.x != 0) discard;
/*472*/	color1.x = 1.000000;
/*473*/	return;
}
