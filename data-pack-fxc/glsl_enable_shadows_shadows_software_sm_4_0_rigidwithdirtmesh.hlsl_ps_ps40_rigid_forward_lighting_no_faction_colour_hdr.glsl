//
//
// Shader Model 4
// Fragment Shader
//
// id: 5254 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdirtmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*39*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*40*/	r2.w = inversesqrt(r2.w);
/*41*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*42*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*43*/	r2.w = inversesqrt(r2.w);
/*44*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*45*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r2.w = inversesqrt(r2.w);
/*47*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*48*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*49*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*50*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*51*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*52*/	r2.w = inversesqrt(r2.w);
/*53*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*54*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*55*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*56*/	if(floatBitsToUint(r0.w) != 0u) {
/*57*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*58*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*59*/	  r0.w = r3.w * cb0.data[26].x;
/*60*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*61*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*62*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*63*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*64*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*65*/	}
/*66*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*67*/	if(floatBitsToUint(r0.w) != 0u) {
/*68*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*69*/	  if(floatBitsToUint(r0.w) != 0u) {
/*70*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*71*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*72*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*73*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*74*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*75*/	    r0.w = -r0.w + 1.000000;
/*76*/	    r0.w = max(r0.w, 0.000000);
/*77*/	    r9.z = sqrt(r0.w);
/*78*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*79*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*80*/	    r0.w = inversesqrt(r0.w);
/*81*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*82*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*83*/	    r11.y = -1.000000;
/*84*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*85*/	    r0.w = inversesqrt(r0.w);
/*86*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*87*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*88*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*89*/	    r2.w = r2.w * 1.250000;
/*90*/	    r2.w = min(r2.w, 1.000000);
/*91*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*92*/	    r3.z = r3.z * 4.000000;
/*93*/	    r2.w = r2.w * 0.200000 + r3.z;
/*94*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*95*/	    r0.w = r0.w + -r2.w;
/*96*/	    r0.w = saturate(r0.w * 200.000000);
/*97*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*98*/	    r0.w = r0.w * r0.w;
/*99*/	    r0.w = r0.w * r2.w;
/*100*/	    r3.x = r0.w * -r3.x + r3.x;
/*101*/	    r2.w = -r3.y + 0.200000;
/*102*/	    r3.y = r0.w * r2.w + r3.y;
/*103*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*104*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*105*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*106*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*107*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*108*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*109*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*110*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*111*/	    r2.w = -r2.w + 1.000000;
/*112*/	    r2.w = max(r2.w, 0.000000);
/*113*/	    r8.z = sqrt(r2.w);
/*114*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*115*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*116*/	    r2.w = sqrt(r2.w);
/*117*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*118*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*119*/	    r2.w = inversesqrt(r2.w);
/*120*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*121*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*122*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*123*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*124*/	    r2.w = -r0.y + 1.000000;
/*125*/	    r0.w = min(r0.w, r2.w);
/*126*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*127*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*128*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*129*/	    r0.w = inversesqrt(r0.w);
/*130*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*131*/	  }
/*132*/	}
/*133*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*134*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*135*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*136*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*137*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*138*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*139*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*140*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*141*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*142*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*143*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*144*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*145*/	r2.w = inversesqrt(r2.w);
/*146*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*147*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*148*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*149*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*150*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*151*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*152*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*153*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*154*/	r3.y = intBitsToFloat(int(r2.w));
/*155*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*156*/	if(floatBitsToUint(r3.z) != 0u) {
/*157*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*158*/	  r5.w = vsOut_T0.w;
/*159*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*160*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*161*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*162*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*163*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*164*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*165*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*166*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*167*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*168*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*169*/	  if(floatBitsToUint(r3.w) == 0u) {
/*170*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*171*/	    r7.xy = floor((r6.xyxx).xy);
/*172*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*173*/	    r3.z = -0.000400 / r3.z;
/*174*/	    r3.z = r3.z + r6.z;
/*175*/	    r8.z = -r8.y + 1.000000;
/*176*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*177*/	    r8.w = -r8.y;
/*178*/	    r10.x = cb1.data[0].z/**/;
/*179*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*180*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*181*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*182*/	    r10.w = -cb1.data[0].w/**/;
/*183*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*184*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*185*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*186*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*187*/	    r8.x = r9.x;
/*188*/	    r8.y = r11.x;
/*189*/	    r8.z = r10.x;
/*190*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*191*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*192*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*193*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*194*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*195*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*196*/	    r3.z = -r6.x + r6.y;
/*197*/	    r3.z = r3.w * r3.z + r6.x;
/*198*/	  } else {
/*199*/	    r3.z = 1.000000;
/*200*/	  }
/*201*/	} else {
/*202*/	  r3.z = 1.000000;
/*203*/	}
/*204*/	r3.w = cb1.data[34].w + -1.000000;
/*205*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*206*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*207*/	if(floatBitsToUint(r2.w) == 0u) {
/*208*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*209*/	  r2.w = floatBitsToInt(r2.w);
/*210*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*211*/	  if(floatBitsToUint(r2.w) != 0u) {
/*212*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*213*/	    r5.w = vsOut_T0.w;
/*214*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*215*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*216*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*217*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*218*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*219*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*220*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*221*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*222*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*223*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*224*/	    if(floatBitsToUint(r5.w) == 0u) {
/*225*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*226*/	      r6.xy = floor((r5.xyxx).xy);
/*227*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*228*/	      r2.w = -0.000400 / r2.w;
/*229*/	      r2.w = r2.w + r5.z;
/*230*/	      r7.z = -r7.y + 1.000000;
/*231*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*232*/	      r7.w = -r7.y;
/*233*/	      r9.x = cb1.data[0].z/**/;
/*234*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*235*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*236*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*237*/	      r9.w = -cb1.data[0].w/**/;
/*238*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*239*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*240*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*241*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*242*/	      r7.x = r8.x;
/*243*/	      r7.y = r10.x;
/*244*/	      r7.z = r9.x;
/*245*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*246*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*247*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*248*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*249*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*250*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*251*/	      r2.w = -r5.x + r5.z;
/*252*/	      r2.w = r5.y * r2.w + r5.x;
/*253*/	    } else {
/*254*/	      r2.w = 1.000000;
/*255*/	    }
/*256*/	  } else {
/*257*/	    r2.w = 1.000000;
/*258*/	  }
/*259*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*260*/	  r5.y = r5.x * cb1.data[34].x;
/*261*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*262*/	  r5.x = r1.w + -r5.x;
/*263*/	  r5.x = saturate(r5.x / r5.y);
/*264*/	  r2.w = -r3.z + r2.w;
/*265*/	  r3.z = r5.x * r2.w + r3.z;
/*266*/	}
/*267*/	if(floatBitsToUint(r3.w) != 0u) {
/*268*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*269*/	  r3.w = r2.w * cb1.data[34].y;
/*270*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*271*/	  r2.w = r1.w + -r2.w;
/*272*/	  r2.w = saturate(r2.w / r3.w);
/*273*/	  r3.y = -r3.z + 1.000000;
/*274*/	  r3.z = r2.w * r3.y + r3.z;
/*275*/	}
/*276*/	r3.z = saturate(r3.z);
/*277*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*278*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*279*/	r2.w = inversesqrt(r2.w);
/*280*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*281*/	r2.w = -r3.x + 1.000000;
/*282*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*283*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*284*/	r3.w = r3.w + r3.w;
/*285*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*286*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*287*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*288*/	r3.w = cos((r8.x));
/*289*/	r3.w = inversesqrt(r3.w);
/*290*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*291*/	r5.w = saturate(r0.w * 60.000000);
/*292*/	r5.w = -r0.w + r5.w;
/*293*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*294*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*295*/	r6.w = inversesqrt(r6.w);
/*296*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*297*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*298*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*299*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*300*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*301*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*302*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*303*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*304*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*305*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*306*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*307*/	r6.w = -r0.w + 1.000000;
/*308*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*309*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*310*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*311*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*312*/	  r6.w = max(r6.w, 0.000000);
/*313*/	  r6.w = log2(r6.w);
/*314*/	  r6.w = r6.w * 10.000000;
/*315*/	  r6.w = exp2(r6.w);
/*316*/	  r6.w = r3.w * r6.w;
/*317*/	  r6.w = r6.w * r5.w + r0.w;
/*318*/	  r7.y = r2.w * 8.000000;
/*319*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*320*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*321*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*322*/	}
/*323*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*324*/	r7.y = max(r6.w, 0.000000);
/*325*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*326*/	if(floatBitsToUint(r6.w) != 0u) {
/*327*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*328*/	  r6.x = max(r6.x, -1.000000);
/*329*/	  r6.x = min(r6.x, 1.000000);
/*330*/	  r6.y = -abs(r6.x) + 1.000000;
/*331*/	  r6.y = sqrt(r6.y);
/*332*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*333*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*334*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*335*/	  r6.w = r6.y * r6.z;
/*336*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*337*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*338*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*339*/	  r6.x = r6.z * r6.y + r6.x;
/*340*/	  r3.x = r3.x * r3.x;
/*341*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*342*/	  r3.x = r3.x * r3.y + r7.x;
/*343*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*344*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*345*/	  r3.y = -r3.x * r3.x + 1.000000;
/*346*/	  r3.y = max(r3.y, 0.001000);
/*347*/	  r3.y = log2(r3.y);
/*348*/	  r6.y = r3.y * 4.950617;
/*349*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*350*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*351*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*352*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*353*/	  r3.x = floatBitsToInt(r3.x);
/*354*/	  r6.y = r3.y * r3.y + -r6.y;
/*355*/	  r6.y = sqrt(r6.y);
/*356*/	  r3.y = -r3.y + r6.y;
/*357*/	  r3.y = max(r3.y, 0.000000);
/*358*/	  r3.y = sqrt(r3.y);
/*359*/	  r3.x = r3.y * r3.x;
/*360*/	  r3.x = r3.x * 1.414214;
/*361*/	  r3.x = 0.008727 / r3.x;
/*362*/	  r3.x = max(r3.x, 0.000100);
/*363*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*364*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*365*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*366*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*367*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*368*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*369*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*370*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*371*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*372*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*373*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*374*/	  r3.x = floatBitsToInt(r3.x);
/*375*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*376*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*377*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*378*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*379*/	  r3.x = r3.x * r6.x + 1.000000;
/*380*/	  r3.x = r3.x * 0.500000;
/*381*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*382*/	  r3.y = r3.y * r6.y + 1.000000;
/*383*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*384*/	  r3.y = min(r7.y, 1.000000);
/*385*/	  r2.w = r2.w * 1.570796;
/*386*/	  r2.w = sin(r2.w);
/*387*/	  r3.y = r3.y + -1.000000;
/*388*/	  r2.w = r2.w * r3.y + 1.000000;
/*389*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*390*/	  r3.y = max(r3.y, 0.000000);
/*391*/	  r3.y = log2(r3.y);
/*392*/	  r3.y = r3.y * 10.000000;
/*393*/	  r3.y = exp2(r3.y);
/*394*/	  r3.y = r3.w * r3.y;
/*395*/	  r3.y = r3.y * r5.w + r0.w;
/*396*/	  r2.w = r2.w * abs(r3.x);
/*397*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*398*/	} else {
/*399*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*400*/	}
/*401*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*402*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*403*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*404*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*405*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*406*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*407*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*408*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*409*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*410*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*411*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*412*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*413*/	r2.w = inversesqrt(r2.w);
/*414*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*415*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*416*/	r2.w = r2.w + r2.w;
/*417*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*418*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*419*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*420*/	r0.x = max(r0.x, 0.000000);
/*421*/	r0.x = log2(r0.x);
/*422*/	r0.x = r0.x * 10.000000;
/*423*/	r0.x = exp2(r0.x);
/*424*/	r0.x = r3.w * r0.x;
/*425*/	r0.x = r0.x * r5.w + r0.w;
/*426*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*427*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*428*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*429*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*430*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*431*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*432*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*433*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*434*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*435*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*436*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*437*/	if(r0.x != 0) discard;
/*438*/	color1.x = 1.000000;
/*439*/	return;
}
