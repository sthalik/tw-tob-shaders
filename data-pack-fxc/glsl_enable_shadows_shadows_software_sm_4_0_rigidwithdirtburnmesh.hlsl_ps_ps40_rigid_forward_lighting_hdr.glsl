//
//
// Shader Model 4
// Fragment Shader
//
// id: 5352 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
uniform samplerCube s_environment;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2D sHardShadowBuffer;

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
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
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
/*44*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*45*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*46*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*47*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*48*/	r2.w = r5.w * r6.w;
/*49*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*50*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*51*/	r1.xy = (r3.zwzz * r5.wwww + r1.xyxx).xy;
/*52*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*53*/	r3.z = inversesqrt(r3.z);
/*54*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*55*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*56*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*57*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*58*/	r5.x = 0;
/*59*/	r5.y = cb0.data[26].x * 0.050000;
/*60*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*61*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*62*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*63*/	r2.w = saturate(r5.x * 5.000000);
/*64*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*65*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*67*/	r3.z = log2(r6.z);
/*68*/	r3.z = r3.z * 1.800000;
/*69*/	r3.z = exp2(r3.z);
/*70*/	r3.z = r3.z * 10.000000;
/*71*/	r3.z = min(r3.z, 1.000000);
/*72*/	r2.w = r2.w + r3.z;
/*73*/	r2.w = r2.w * 0.500000;
/*74*/	r3.z = -r6.w + 1.000000;
/*75*/	r3.z = log2(r3.z);
/*76*/	r3.z = r3.z * vsOut_T7.x;
/*77*/	r3.z = exp2(r3.z);
/*78*/	r3.z = min(r3.z, 1.000000);
/*79*/	r3.z = r3.z * vsOut_T7.x;
/*80*/	r3.w = r6.z * 0.250000;
/*81*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*82*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*83*/	r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*84*/	r0.xyw = (r3.zzzz * r5.xyxz + r0.xyxw).xyw;
/*85*/	r2.w = vsOut_T7.x + -0.025000;
/*86*/	r2.w = max(r2.w, 0.000000);
/*87*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*88*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*89*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*90*/	r2.w = inversesqrt(r2.w);
/*91*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*92*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*93*/	r2.w = inversesqrt(r2.w);
/*94*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*95*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*96*/	r2.w = inversesqrt(r2.w);
/*97*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*98*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*99*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*100*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*101*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*102*/	r2.w = inversesqrt(r2.w);
/*103*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*104*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*105*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*106*/	if(floatBitsToUint(r0.z) != 0u) {
/*107*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*108*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*109*/	  r0.z = r3.w * cb0.data[26].x;
/*110*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*111*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*112*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*113*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*114*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*115*/	}
/*116*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*117*/	if(floatBitsToUint(r0.z) != 0u) {
/*118*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*119*/	  if(floatBitsToUint(r0.z) != 0u) {
/*120*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*121*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*122*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*123*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*124*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*125*/	    r0.z = -r0.z + 1.000000;
/*126*/	    r0.z = max(r0.z, 0.000000);
/*127*/	    r9.z = sqrt(r0.z);
/*128*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*129*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*130*/	    r0.z = inversesqrt(r0.z);
/*131*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*132*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*133*/	    r11.y = -1.000000;
/*134*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*135*/	    r0.z = inversesqrt(r0.z);
/*136*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*137*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*138*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*139*/	    r2.w = r2.w * 1.250000;
/*140*/	    r2.w = min(r2.w, 1.000000);
/*141*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*142*/	    r3.z = r3.z * 4.000000;
/*143*/	    r2.w = r2.w * 0.200000 + r3.z;
/*144*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*145*/	    r0.z = r0.z + -r2.w;
/*146*/	    r0.z = saturate(r0.z * 200.000000);
/*147*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*148*/	    r0.z = r0.z * r0.z;
/*149*/	    r0.z = r0.z * r2.w;
/*150*/	    r3.x = r0.z * -r3.x + r3.x;
/*151*/	    r2.w = -r3.y + 0.200000;
/*152*/	    r3.y = r0.z * r2.w + r3.y;
/*153*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*154*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*155*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*156*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*157*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*158*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*159*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*160*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*161*/	    r2.w = -r2.w + 1.000000;
/*162*/	    r2.w = max(r2.w, 0.000000);
/*163*/	    r8.z = sqrt(r2.w);
/*164*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*165*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*166*/	    r2.w = sqrt(r2.w);
/*167*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*168*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*169*/	    r2.w = inversesqrt(r2.w);
/*170*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*171*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*172*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*173*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*174*/	    r2.w = -r1.y + 1.000000;
/*175*/	    r0.z = min(r0.z, r2.w);
/*176*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*177*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*178*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*179*/	    r0.z = inversesqrt(r0.z);
/*180*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*181*/	  }
/*182*/	}
/*183*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*184*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*185*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*186*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*187*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*188*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*189*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*190*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*191*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*192*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*193*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*194*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*195*/	r2.w = inversesqrt(r2.w);
/*196*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*197*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*198*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*199*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*200*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*201*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*202*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*203*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*204*/	r3.y = intBitsToFloat(int(r2.w));
/*205*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*206*/	if(floatBitsToUint(r3.z) != 0u) {
/*207*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*208*/	  r5.w = vsOut_T0.w;
/*209*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*210*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*211*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*212*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*213*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*214*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*215*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*216*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*217*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*218*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*219*/	  if(floatBitsToUint(r3.w) == 0u) {
/*220*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*221*/	    r7.xy = floor((r6.xyxx).xy);
/*222*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*223*/	    r3.z = -0.000400 / r3.z;
/*224*/	    r3.z = r3.z + r6.z;
/*225*/	    r8.z = -r8.y + 1.000000;
/*226*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*227*/	    r8.w = -r8.y;
/*228*/	    r10.x = cb1.data[0].z/**/;
/*229*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*230*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*231*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*232*/	    r10.w = -cb1.data[0].w/**/;
/*233*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*234*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*235*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*236*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*237*/	    r8.x = r9.x;
/*238*/	    r8.y = r11.x;
/*239*/	    r8.z = r10.x;
/*240*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*241*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*242*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*243*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*244*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*245*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*246*/	    r3.z = -r6.x + r6.y;
/*247*/	    r3.z = r3.w * r3.z + r6.x;
/*248*/	  } else {
/*249*/	    r3.z = 1.000000;
/*250*/	  }
/*251*/	} else {
/*252*/	  r3.z = 1.000000;
/*253*/	}
/*254*/	r3.w = cb1.data[34].w + -1.000000;
/*255*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*256*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*257*/	if(floatBitsToUint(r2.w) == 0u) {
/*258*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*259*/	  r2.w = floatBitsToInt(r2.w);
/*260*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*261*/	  if(floatBitsToUint(r2.w) != 0u) {
/*262*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*263*/	    r5.w = vsOut_T0.w;
/*264*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*265*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*266*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*267*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*268*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*269*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*270*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*271*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*272*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*273*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*274*/	    if(floatBitsToUint(r5.w) == 0u) {
/*275*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*276*/	      r6.xy = floor((r5.xyxx).xy);
/*277*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*278*/	      r2.w = -0.000400 / r2.w;
/*279*/	      r2.w = r2.w + r5.z;
/*280*/	      r7.z = -r7.y + 1.000000;
/*281*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*282*/	      r7.w = -r7.y;
/*283*/	      r9.x = cb1.data[0].z/**/;
/*284*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*285*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*286*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*287*/	      r9.w = -cb1.data[0].w/**/;
/*288*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*289*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*290*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*291*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*292*/	      r7.x = r8.x;
/*293*/	      r7.y = r10.x;
/*294*/	      r7.z = r9.x;
/*295*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*296*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*297*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*298*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*299*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*300*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*301*/	      r2.w = -r5.x + r5.z;
/*302*/	      r2.w = r5.y * r2.w + r5.x;
/*303*/	    } else {
/*304*/	      r2.w = 1.000000;
/*305*/	    }
/*306*/	  } else {
/*307*/	    r2.w = 1.000000;
/*308*/	  }
/*309*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*310*/	  r5.y = r5.x * cb1.data[34].x;
/*311*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*312*/	  r5.x = r1.w + -r5.x;
/*313*/	  r5.x = saturate(r5.x / r5.y);
/*314*/	  r2.w = -r3.z + r2.w;
/*315*/	  r3.z = r5.x * r2.w + r3.z;
/*316*/	}
/*317*/	if(floatBitsToUint(r3.w) != 0u) {
/*318*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*319*/	  r3.w = r2.w * cb1.data[34].y;
/*320*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*321*/	  r2.w = r1.w + -r2.w;
/*322*/	  r2.w = saturate(r2.w / r3.w);
/*323*/	  r3.y = -r3.z + 1.000000;
/*324*/	  r3.z = r2.w * r3.y + r3.z;
/*325*/	}
/*326*/	r3.z = saturate(r3.z);
/*327*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*328*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*329*/	r2.w = inversesqrt(r2.w);
/*330*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*331*/	r2.w = -r3.x + 1.000000;
/*332*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*333*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*334*/	r3.w = r3.w + r3.w;
/*335*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*336*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*337*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*338*/	r3.w = cos((r8.x));
/*339*/	r3.w = inversesqrt(r3.w);
/*340*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*341*/	r5.w = saturate(r0.z * 60.000000);
/*342*/	r5.w = -r0.z + r5.w;
/*343*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*344*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*345*/	r6.w = inversesqrt(r6.w);
/*346*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*347*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*348*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*349*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*350*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*351*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*352*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*353*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*354*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*355*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*356*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*357*/	r6.w = -r0.z + 1.000000;
/*358*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*359*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*360*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*361*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*362*/	  r6.w = max(r6.w, 0.000000);
/*363*/	  r6.w = log2(r6.w);
/*364*/	  r6.w = r6.w * 10.000000;
/*365*/	  r6.w = exp2(r6.w);
/*366*/	  r6.w = r3.w * r6.w;
/*367*/	  r6.w = r6.w * r5.w + r0.z;
/*368*/	  r7.y = r2.w * 8.000000;
/*369*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*370*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*371*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*372*/	}
/*373*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*374*/	r7.y = max(r6.w, 0.000000);
/*375*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*376*/	if(floatBitsToUint(r6.w) != 0u) {
/*377*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*378*/	  r6.x = max(r6.x, -1.000000);
/*379*/	  r6.x = min(r6.x, 1.000000);
/*380*/	  r6.y = -abs(r6.x) + 1.000000;
/*381*/	  r6.y = sqrt(r6.y);
/*382*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*383*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*384*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*385*/	  r6.w = r6.y * r6.z;
/*386*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*387*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*388*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*389*/	  r6.x = r6.z * r6.y + r6.x;
/*390*/	  r3.x = r3.x * r3.x;
/*391*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*392*/	  r3.x = r3.x * r3.y + r7.x;
/*393*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*394*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*395*/	  r3.y = -r3.x * r3.x + 1.000000;
/*396*/	  r3.y = max(r3.y, 0.001000);
/*397*/	  r3.y = log2(r3.y);
/*398*/	  r6.y = r3.y * 4.950617;
/*399*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*400*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*401*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*402*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*403*/	  r3.x = floatBitsToInt(r3.x);
/*404*/	  r6.y = r3.y * r3.y + -r6.y;
/*405*/	  r6.y = sqrt(r6.y);
/*406*/	  r3.y = -r3.y + r6.y;
/*407*/	  r3.y = max(r3.y, 0.000000);
/*408*/	  r3.y = sqrt(r3.y);
/*409*/	  r3.x = r3.y * r3.x;
/*410*/	  r3.x = r3.x * 1.414214;
/*411*/	  r3.x = 0.008727 / r3.x;
/*412*/	  r3.x = max(r3.x, 0.000100);
/*413*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*414*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*415*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*416*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*417*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*418*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*419*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*420*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*421*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*422*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*423*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*424*/	  r3.x = floatBitsToInt(r3.x);
/*425*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*426*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*427*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*428*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*429*/	  r3.x = r3.x * r6.x + 1.000000;
/*430*/	  r3.x = r3.x * 0.500000;
/*431*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*432*/	  r3.y = r3.y * r6.y + 1.000000;
/*433*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*434*/	  r3.y = min(r7.y, 1.000000);
/*435*/	  r2.w = r2.w * 1.570796;
/*436*/	  r2.w = sin(r2.w);
/*437*/	  r3.y = r3.y + -1.000000;
/*438*/	  r2.w = r2.w * r3.y + 1.000000;
/*439*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*440*/	  r3.y = max(r3.y, 0.000000);
/*441*/	  r3.y = log2(r3.y);
/*442*/	  r3.y = r3.y * 10.000000;
/*443*/	  r3.y = exp2(r3.y);
/*444*/	  r3.y = r3.w * r3.y;
/*445*/	  r3.y = r3.y * r5.w + r0.z;
/*446*/	  r2.w = r2.w * abs(r3.x);
/*447*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*448*/	} else {
/*449*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*450*/	}
/*451*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*452*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*453*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*454*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*455*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*456*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*457*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*458*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*459*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*460*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*461*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*462*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*463*/	r2.w = inversesqrt(r2.w);
/*464*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*465*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*466*/	r2.w = r2.w + r2.w;
/*467*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*468*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*469*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*470*/	r1.x = max(r1.x, 0.000000);
/*471*/	r1.x = log2(r1.x);
/*472*/	r1.x = r1.x * 10.000000;
/*473*/	r1.x = exp2(r1.x);
/*474*/	r1.x = r3.w * r1.x;
/*475*/	r0.z = r1.x * r5.w + r0.z;
/*476*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*477*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*478*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*479*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*480*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*481*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*482*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*483*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*484*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*485*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*486*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*487*/	if(r0.x != 0) discard;
/*488*/	color1.x = 1.000000;
/*489*/	return;
}
