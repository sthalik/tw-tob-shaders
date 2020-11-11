//
//
// Shader Model 4
// Fragment Shader
//
// id: 5356 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*26*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*27*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*28*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*29*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*30*/	r2.w = r5.w * r6.w;
/*31*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*32*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*33*/	r0.xy = (r3.zwzz * r5.wwww + r0.xyxx).xy;
/*34*/	r3.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*35*/	r3.z = inversesqrt(r3.z);
/*36*/	r0.xyw = (r0.xyxw * r3.zzzz).xyw;
/*37*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*38*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*39*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*40*/	r5.x = 0;
/*41*/	r5.y = cb0.data[26].x * 0.050000;
/*42*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*43*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*44*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*45*/	r2.w = saturate(r5.x * 5.000000);
/*46*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*47*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*49*/	r3.z = log2(r6.z);
/*50*/	r3.z = r3.z * 1.800000;
/*51*/	r3.z = exp2(r3.z);
/*52*/	r3.z = r3.z * 10.000000;
/*53*/	r3.z = min(r3.z, 1.000000);
/*54*/	r2.w = r2.w + r3.z;
/*55*/	r2.w = r2.w * 0.500000;
/*56*/	r3.z = -r6.w + 1.000000;
/*57*/	r3.z = log2(r3.z);
/*58*/	r3.z = r3.z * vsOut_T7.x;
/*59*/	r3.z = exp2(r3.z);
/*60*/	r3.z = min(r3.z, 1.000000);
/*61*/	r3.z = r3.z * vsOut_T7.x;
/*62*/	r3.w = r6.z * 0.250000;
/*63*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*64*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*65*/	r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*66*/	r1.xyz = (r3.zzzz * r5.xyzx + r1.xyzx).xyz;
/*67*/	r2.w = vsOut_T7.x + -0.025000;
/*68*/	r2.w = max(r2.w, 0.000000);
/*69*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*70*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*71*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*72*/	r2.w = inversesqrt(r2.w);
/*73*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*74*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*77*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*78*/	r2.w = inversesqrt(r2.w);
/*79*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*80*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*81*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*82*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*83*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*84*/	r2.w = inversesqrt(r2.w);
/*85*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*86*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*87*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*88*/	if(floatBitsToUint(r0.w) != 0u) {
/*89*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*90*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*91*/	  r0.w = r3.w * cb0.data[26].x;
/*92*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*93*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*94*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*95*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*96*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*97*/	}
/*98*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*99*/	if(floatBitsToUint(r0.w) != 0u) {
/*100*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*101*/	  if(floatBitsToUint(r0.w) != 0u) {
/*102*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*103*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*104*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*105*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*106*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*107*/	    r0.w = -r0.w + 1.000000;
/*108*/	    r0.w = max(r0.w, 0.000000);
/*109*/	    r9.z = sqrt(r0.w);
/*110*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*111*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*112*/	    r0.w = inversesqrt(r0.w);
/*113*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*114*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*115*/	    r11.y = -1.000000;
/*116*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*117*/	    r0.w = inversesqrt(r0.w);
/*118*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*119*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*120*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*121*/	    r2.w = r2.w * 1.250000;
/*122*/	    r2.w = min(r2.w, 1.000000);
/*123*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*124*/	    r3.z = r3.z * 4.000000;
/*125*/	    r2.w = r2.w * 0.200000 + r3.z;
/*126*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*127*/	    r0.w = r0.w + -r2.w;
/*128*/	    r0.w = saturate(r0.w * 200.000000);
/*129*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*130*/	    r0.w = r0.w * r0.w;
/*131*/	    r0.w = r0.w * r2.w;
/*132*/	    r3.x = r0.w * -r3.x + r3.x;
/*133*/	    r2.w = -r3.y + 0.200000;
/*134*/	    r3.y = r0.w * r2.w + r3.y;
/*135*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*136*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*137*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*138*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*139*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*140*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*141*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*142*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*143*/	    r2.w = -r2.w + 1.000000;
/*144*/	    r2.w = max(r2.w, 0.000000);
/*145*/	    r8.z = sqrt(r2.w);
/*146*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*147*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*148*/	    r2.w = sqrt(r2.w);
/*149*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*150*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*151*/	    r2.w = inversesqrt(r2.w);
/*152*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*153*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*154*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*155*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*156*/	    r2.w = -r0.y + 1.000000;
/*157*/	    r0.w = min(r0.w, r2.w);
/*158*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*159*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*160*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*161*/	    r0.w = inversesqrt(r0.w);
/*162*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*163*/	  }
/*164*/	}
/*165*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*166*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*167*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*168*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*169*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*170*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*171*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*172*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*173*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*174*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*175*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*176*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*177*/	r2.w = inversesqrt(r2.w);
/*178*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*179*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*180*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*181*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*182*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*183*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*184*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*185*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*186*/	r3.y = intBitsToFloat(int(r2.w));
/*187*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*188*/	if(floatBitsToUint(r3.z) != 0u) {
/*189*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*190*/	  r5.w = vsOut_T0.w;
/*191*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*192*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*193*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*194*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*195*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*196*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*197*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*198*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*199*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*200*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*201*/	  if(floatBitsToUint(r3.w) == 0u) {
/*202*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*203*/	    r7.xy = floor((r6.xyxx).xy);
/*204*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*205*/	    r3.z = -0.000400 / r3.z;
/*206*/	    r3.z = r3.z + r6.z;
/*207*/	    r8.z = -r8.y + 1.000000;
/*208*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*209*/	    r8.w = -r8.y;
/*210*/	    r10.x = cb1.data[0].z/**/;
/*211*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*212*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*213*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*214*/	    r10.w = -cb1.data[0].w/**/;
/*215*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*216*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*217*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*218*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*219*/	    r8.x = r9.x;
/*220*/	    r8.y = r11.x;
/*221*/	    r8.z = r10.x;
/*222*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*223*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*224*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*225*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*226*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*227*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*228*/	    r3.z = -r6.x + r6.y;
/*229*/	    r3.z = r3.w * r3.z + r6.x;
/*230*/	  } else {
/*231*/	    r3.z = 1.000000;
/*232*/	  }
/*233*/	} else {
/*234*/	  r3.z = 1.000000;
/*235*/	}
/*236*/	r3.w = cb1.data[34].w + -1.000000;
/*237*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*238*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*239*/	if(floatBitsToUint(r2.w) == 0u) {
/*240*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*241*/	  r2.w = floatBitsToInt(r2.w);
/*242*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*243*/	  if(floatBitsToUint(r2.w) != 0u) {
/*244*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*245*/	    r5.w = vsOut_T0.w;
/*246*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*247*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*248*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*249*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*250*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*251*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*252*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*253*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*254*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*255*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*256*/	    if(floatBitsToUint(r5.w) == 0u) {
/*257*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*258*/	      r6.xy = floor((r5.xyxx).xy);
/*259*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*260*/	      r2.w = -0.000400 / r2.w;
/*261*/	      r2.w = r2.w + r5.z;
/*262*/	      r7.z = -r7.y + 1.000000;
/*263*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*264*/	      r7.w = -r7.y;
/*265*/	      r9.x = cb1.data[0].z/**/;
/*266*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*267*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*268*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*269*/	      r9.w = -cb1.data[0].w/**/;
/*270*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*271*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*272*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*273*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*274*/	      r7.x = r8.x;
/*275*/	      r7.y = r10.x;
/*276*/	      r7.z = r9.x;
/*277*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*278*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*279*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*280*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*281*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*282*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*283*/	      r2.w = -r5.x + r5.z;
/*284*/	      r2.w = r5.y * r2.w + r5.x;
/*285*/	    } else {
/*286*/	      r2.w = 1.000000;
/*287*/	    }
/*288*/	  } else {
/*289*/	    r2.w = 1.000000;
/*290*/	  }
/*291*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*292*/	  r5.y = r5.x * cb1.data[34].x;
/*293*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*294*/	  r5.x = r1.w + -r5.x;
/*295*/	  r5.x = saturate(r5.x / r5.y);
/*296*/	  r2.w = -r3.z + r2.w;
/*297*/	  r3.z = r5.x * r2.w + r3.z;
/*298*/	}
/*299*/	if(floatBitsToUint(r3.w) != 0u) {
/*300*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*301*/	  r3.w = r2.w * cb1.data[34].y;
/*302*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*303*/	  r2.w = r1.w + -r2.w;
/*304*/	  r2.w = saturate(r2.w / r3.w);
/*305*/	  r3.y = -r3.z + 1.000000;
/*306*/	  r3.z = r2.w * r3.y + r3.z;
/*307*/	}
/*308*/	r3.z = saturate(r3.z);
/*309*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*310*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*311*/	r2.w = inversesqrt(r2.w);
/*312*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*313*/	r2.w = -r3.x + 1.000000;
/*314*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*315*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*316*/	r3.w = r3.w + r3.w;
/*317*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*318*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*319*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*320*/	r3.w = cos((r8.x));
/*321*/	r3.w = inversesqrt(r3.w);
/*322*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*323*/	r5.w = saturate(r0.w * 60.000000);
/*324*/	r5.w = -r0.w + r5.w;
/*325*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*326*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*327*/	r6.w = inversesqrt(r6.w);
/*328*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*329*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*330*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*331*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*332*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*333*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*334*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*335*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*336*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*337*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*338*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*339*/	r6.w = -r0.w + 1.000000;
/*340*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*341*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*342*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*343*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*344*/	  r6.w = max(r6.w, 0.000000);
/*345*/	  r6.w = log2(r6.w);
/*346*/	  r6.w = r6.w * 10.000000;
/*347*/	  r6.w = exp2(r6.w);
/*348*/	  r6.w = r3.w * r6.w;
/*349*/	  r6.w = r6.w * r5.w + r0.w;
/*350*/	  r7.y = r2.w * 8.000000;
/*351*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*352*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*353*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*354*/	}
/*355*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*356*/	r7.y = max(r6.w, 0.000000);
/*357*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*358*/	if(floatBitsToUint(r6.w) != 0u) {
/*359*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*360*/	  r6.x = max(r6.x, -1.000000);
/*361*/	  r6.x = min(r6.x, 1.000000);
/*362*/	  r6.y = -abs(r6.x) + 1.000000;
/*363*/	  r6.y = sqrt(r6.y);
/*364*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*365*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*366*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*367*/	  r6.w = r6.y * r6.z;
/*368*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*369*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*370*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*371*/	  r6.x = r6.z * r6.y + r6.x;
/*372*/	  r3.x = r3.x * r3.x;
/*373*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*374*/	  r3.x = r3.x * r3.y + r7.x;
/*375*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*376*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*377*/	  r3.y = -r3.x * r3.x + 1.000000;
/*378*/	  r3.y = max(r3.y, 0.001000);
/*379*/	  r3.y = log2(r3.y);
/*380*/	  r6.y = r3.y * 4.950617;
/*381*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*382*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*383*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*384*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*385*/	  r3.x = floatBitsToInt(r3.x);
/*386*/	  r6.y = r3.y * r3.y + -r6.y;
/*387*/	  r6.y = sqrt(r6.y);
/*388*/	  r3.y = -r3.y + r6.y;
/*389*/	  r3.y = max(r3.y, 0.000000);
/*390*/	  r3.y = sqrt(r3.y);
/*391*/	  r3.x = r3.y * r3.x;
/*392*/	  r3.x = r3.x * 1.414214;
/*393*/	  r3.x = 0.008727 / r3.x;
/*394*/	  r3.x = max(r3.x, 0.000100);
/*395*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*396*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*397*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*398*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*399*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*400*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*401*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*402*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*403*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*404*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*405*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*406*/	  r3.x = floatBitsToInt(r3.x);
/*407*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*408*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*409*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*410*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*411*/	  r3.x = r3.x * r6.x + 1.000000;
/*412*/	  r3.x = r3.x * 0.500000;
/*413*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*414*/	  r3.y = r3.y * r6.y + 1.000000;
/*415*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*416*/	  r3.y = min(r7.y, 1.000000);
/*417*/	  r2.w = r2.w * 1.570796;
/*418*/	  r2.w = sin(r2.w);
/*419*/	  r3.y = r3.y + -1.000000;
/*420*/	  r2.w = r2.w * r3.y + 1.000000;
/*421*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*422*/	  r3.y = max(r3.y, 0.000000);
/*423*/	  r3.y = log2(r3.y);
/*424*/	  r3.y = r3.y * 10.000000;
/*425*/	  r3.y = exp2(r3.y);
/*426*/	  r3.y = r3.w * r3.y;
/*427*/	  r3.y = r3.y * r5.w + r0.w;
/*428*/	  r2.w = r2.w * abs(r3.x);
/*429*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*430*/	} else {
/*431*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*432*/	}
/*433*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*434*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*435*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*436*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*437*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*438*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*439*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*440*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*441*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*442*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*443*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*444*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*445*/	r2.w = inversesqrt(r2.w);
/*446*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*447*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*448*/	r2.w = r2.w + r2.w;
/*449*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*450*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*451*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*452*/	r0.x = max(r0.x, 0.000000);
/*453*/	r0.x = log2(r0.x);
/*454*/	r0.x = r0.x * 10.000000;
/*455*/	r0.x = exp2(r0.x);
/*456*/	r0.x = r3.w * r0.x;
/*457*/	r0.x = r0.x * r5.w + r0.w;
/*458*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*459*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*460*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*461*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*462*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*463*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*464*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*465*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*466*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*467*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*468*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*469*/	if(r0.x != 0) discard;
/*470*/	color1.x = 1.000000;
/*471*/	return;
}
