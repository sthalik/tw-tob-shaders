//
//
// Shader Model 4
// Fragment Shader
//
// id: 4731 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandardfire.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*26*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*27*/	r5.x = 0;
/*28*/	r5.y = cb0.data[26].x * 0.050000;
/*29*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*30*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*31*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*32*/	r2.w = saturate(r5.x * 5.000000);
/*33*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*34*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*36*/	r3.z = log2(r6.z);
/*37*/	r3.z = r3.z * 1.800000;
/*38*/	r3.z = exp2(r3.z);
/*39*/	r3.z = r3.z * 10.000000;
/*40*/	r3.z = min(r3.z, 1.000000);
/*41*/	r2.w = r2.w + r3.z;
/*42*/	r2.w = r2.w * 0.500000;
/*43*/	r3.z = -r6.w + 1.000000;
/*44*/	r3.z = log2(r3.z);
/*45*/	r3.z = r3.z * vsOut_T7.x;
/*46*/	r3.z = exp2(r3.z);
/*47*/	r3.z = min(r3.z, 1.000000);
/*48*/	r3.z = r3.z * vsOut_T7.x;
/*49*/	r3.w = r6.z * 0.250000;
/*50*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*51*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*52*/	r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*53*/	r1.xyz = (r3.zzzz * r5.xyzx + r1.xyzx).xyz;
/*54*/	r2.w = vsOut_T7.x + -0.025000;
/*55*/	r2.w = max(r2.w, 0.000000);
/*56*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*57*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*58*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*59*/	r2.w = inversesqrt(r2.w);
/*60*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*61*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*62*/	r2.w = inversesqrt(r2.w);
/*63*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*64*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*65*/	r2.w = inversesqrt(r2.w);
/*66*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*67*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*68*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*69*/	r0.xyw = (r0.wwww * r7.xyxz + r8.xyxz).xyw;
/*70*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*71*/	r2.w = inversesqrt(r2.w);
/*72*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*73*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*74*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*75*/	if(floatBitsToUint(r0.w) != 0u) {
/*76*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*77*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*78*/	  r0.w = r3.w * cb0.data[26].x;
/*79*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*80*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*81*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*82*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*83*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*84*/	}
/*85*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*86*/	if(floatBitsToUint(r0.w) != 0u) {
/*87*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*88*/	  if(floatBitsToUint(r0.w) != 0u) {
/*89*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*90*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*91*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*92*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*93*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*94*/	    r0.w = -r0.w + 1.000000;
/*95*/	    r0.w = max(r0.w, 0.000000);
/*96*/	    r9.z = sqrt(r0.w);
/*97*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*98*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*99*/	    r0.w = inversesqrt(r0.w);
/*100*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*101*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*102*/	    r11.y = -1.000000;
/*103*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*104*/	    r0.w = inversesqrt(r0.w);
/*105*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*106*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*107*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*108*/	    r2.w = r2.w * 1.250000;
/*109*/	    r2.w = min(r2.w, 1.000000);
/*110*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*111*/	    r3.z = r3.z * 4.000000;
/*112*/	    r2.w = r2.w * 0.200000 + r3.z;
/*113*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*114*/	    r0.w = r0.w + -r2.w;
/*115*/	    r0.w = saturate(r0.w * 200.000000);
/*116*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*117*/	    r0.w = r0.w * r0.w;
/*118*/	    r0.w = r0.w * r2.w;
/*119*/	    r3.x = r0.w * -r3.x + r3.x;
/*120*/	    r2.w = -r3.y + 0.200000;
/*121*/	    r3.y = r0.w * r2.w + r3.y;
/*122*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*123*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*124*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*125*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*126*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*127*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*128*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*129*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*130*/	    r2.w = -r2.w + 1.000000;
/*131*/	    r2.w = max(r2.w, 0.000000);
/*132*/	    r8.z = sqrt(r2.w);
/*133*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*134*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*135*/	    r2.w = sqrt(r2.w);
/*136*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*137*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*138*/	    r2.w = inversesqrt(r2.w);
/*139*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*140*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*141*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*142*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*143*/	    r2.w = -r0.y + 1.000000;
/*144*/	    r0.w = min(r0.w, r2.w);
/*145*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*146*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*147*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*148*/	    r0.w = inversesqrt(r0.w);
/*149*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*150*/	  }
/*151*/	}
/*152*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*153*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*154*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*155*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*156*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*157*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*158*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*159*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*160*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*161*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*162*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*163*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*164*/	r2.w = inversesqrt(r2.w);
/*165*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*166*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*167*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*168*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*169*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*170*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*171*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*172*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*173*/	r3.y = intBitsToFloat(int(r2.w));
/*174*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*175*/	if(floatBitsToUint(r3.z) != 0u) {
/*176*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*177*/	  r5.w = vsOut_T0.w;
/*178*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*179*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*180*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*181*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*182*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*183*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*184*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*185*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*186*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*187*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*188*/	  if(floatBitsToUint(r3.w) == 0u) {
/*189*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*190*/	    r7.xy = floor((r6.xyxx).xy);
/*191*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*192*/	    r3.z = -0.000400 / r3.z;
/*193*/	    r3.z = r3.z + r6.z;
/*194*/	    r8.z = -r8.y + 1.000000;
/*195*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*196*/	    r8.w = -r8.y;
/*197*/	    r10.x = cb1.data[0].z/**/;
/*198*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*199*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*200*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*201*/	    r10.w = -cb1.data[0].w/**/;
/*202*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*203*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*204*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*205*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*206*/	    r8.x = r9.x;
/*207*/	    r8.y = r11.x;
/*208*/	    r8.z = r10.x;
/*209*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*210*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*211*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*212*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*213*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*214*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*215*/	    r3.z = -r6.x + r6.y;
/*216*/	    r3.z = r3.w * r3.z + r6.x;
/*217*/	  } else {
/*218*/	    r3.z = 1.000000;
/*219*/	  }
/*220*/	} else {
/*221*/	  r3.z = 1.000000;
/*222*/	}
/*223*/	r3.w = cb1.data[34].w + -1.000000;
/*224*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*225*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*226*/	if(floatBitsToUint(r2.w) == 0u) {
/*227*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*228*/	  r2.w = floatBitsToInt(r2.w);
/*229*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*230*/	  if(floatBitsToUint(r2.w) != 0u) {
/*231*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*232*/	    r5.w = vsOut_T0.w;
/*233*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*234*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*235*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*236*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*237*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*238*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*239*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*240*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*241*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*242*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*243*/	    if(floatBitsToUint(r5.w) == 0u) {
/*244*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*245*/	      r6.xy = floor((r5.xyxx).xy);
/*246*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*247*/	      r2.w = -0.000400 / r2.w;
/*248*/	      r2.w = r2.w + r5.z;
/*249*/	      r7.z = -r7.y + 1.000000;
/*250*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*251*/	      r7.w = -r7.y;
/*252*/	      r9.x = cb1.data[0].z/**/;
/*253*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*254*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*255*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*256*/	      r9.w = -cb1.data[0].w/**/;
/*257*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*258*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*259*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*260*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*261*/	      r7.x = r8.x;
/*262*/	      r7.y = r10.x;
/*263*/	      r7.z = r9.x;
/*264*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*265*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*266*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*267*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*268*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*269*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*270*/	      r2.w = -r5.x + r5.z;
/*271*/	      r2.w = r5.y * r2.w + r5.x;
/*272*/	    } else {
/*273*/	      r2.w = 1.000000;
/*274*/	    }
/*275*/	  } else {
/*276*/	    r2.w = 1.000000;
/*277*/	  }
/*278*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*279*/	  r5.y = r5.x * cb1.data[34].x;
/*280*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*281*/	  r5.x = r1.w + -r5.x;
/*282*/	  r5.x = saturate(r5.x / r5.y);
/*283*/	  r2.w = -r3.z + r2.w;
/*284*/	  r3.z = r5.x * r2.w + r3.z;
/*285*/	}
/*286*/	if(floatBitsToUint(r3.w) != 0u) {
/*287*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*288*/	  r3.w = r2.w * cb1.data[34].y;
/*289*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*290*/	  r2.w = r1.w + -r2.w;
/*291*/	  r2.w = saturate(r2.w / r3.w);
/*292*/	  r3.y = -r3.z + 1.000000;
/*293*/	  r3.z = r2.w * r3.y + r3.z;
/*294*/	}
/*295*/	r3.z = saturate(r3.z);
/*296*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*297*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*298*/	r2.w = inversesqrt(r2.w);
/*299*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*300*/	r2.w = -r3.x + 1.000000;
/*301*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*302*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*303*/	r3.w = r3.w + r3.w;
/*304*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*305*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*306*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*307*/	r3.w = cos((r8.x));
/*308*/	r3.w = inversesqrt(r3.w);
/*309*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*310*/	r5.w = saturate(r0.w * 60.000000);
/*311*/	r5.w = -r0.w + r5.w;
/*312*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*313*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*314*/	r6.w = inversesqrt(r6.w);
/*315*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*316*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*317*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*318*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*319*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*320*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*321*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*322*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*323*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*324*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*325*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*326*/	r6.w = -r0.w + 1.000000;
/*327*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*328*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*329*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*330*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*331*/	  r6.w = max(r6.w, 0.000000);
/*332*/	  r6.w = log2(r6.w);
/*333*/	  r6.w = r6.w * 10.000000;
/*334*/	  r6.w = exp2(r6.w);
/*335*/	  r6.w = r3.w * r6.w;
/*336*/	  r6.w = r6.w * r5.w + r0.w;
/*337*/	  r7.y = r2.w * 8.000000;
/*338*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*339*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*340*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*341*/	}
/*342*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*343*/	r7.y = max(r6.w, 0.000000);
/*344*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*345*/	if(floatBitsToUint(r6.w) != 0u) {
/*346*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*347*/	  r6.x = max(r6.x, -1.000000);
/*348*/	  r6.x = min(r6.x, 1.000000);
/*349*/	  r6.y = -abs(r6.x) + 1.000000;
/*350*/	  r6.y = sqrt(r6.y);
/*351*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*352*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*353*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*354*/	  r6.w = r6.y * r6.z;
/*355*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*356*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*357*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*358*/	  r6.x = r6.z * r6.y + r6.x;
/*359*/	  r3.x = r3.x * r3.x;
/*360*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*361*/	  r3.x = r3.x * r3.y + r7.x;
/*362*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*363*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*364*/	  r3.y = -r3.x * r3.x + 1.000000;
/*365*/	  r3.y = max(r3.y, 0.001000);
/*366*/	  r3.y = log2(r3.y);
/*367*/	  r6.y = r3.y * 4.950617;
/*368*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*369*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*370*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*371*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*372*/	  r3.x = floatBitsToInt(r3.x);
/*373*/	  r6.y = r3.y * r3.y + -r6.y;
/*374*/	  r6.y = sqrt(r6.y);
/*375*/	  r3.y = -r3.y + r6.y;
/*376*/	  r3.y = max(r3.y, 0.000000);
/*377*/	  r3.y = sqrt(r3.y);
/*378*/	  r3.x = r3.y * r3.x;
/*379*/	  r3.x = r3.x * 1.414214;
/*380*/	  r3.x = 0.008727 / r3.x;
/*381*/	  r3.x = max(r3.x, 0.000100);
/*382*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*383*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*384*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*385*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*386*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*387*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*388*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*389*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*390*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*391*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*392*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*393*/	  r3.x = floatBitsToInt(r3.x);
/*394*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*395*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*396*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*397*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*398*/	  r3.x = r3.x * r6.x + 1.000000;
/*399*/	  r3.x = r3.x * 0.500000;
/*400*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*401*/	  r3.y = r3.y * r6.y + 1.000000;
/*402*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*403*/	  r3.y = min(r7.y, 1.000000);
/*404*/	  r2.w = r2.w * 1.570796;
/*405*/	  r2.w = sin(r2.w);
/*406*/	  r3.y = r3.y + -1.000000;
/*407*/	  r2.w = r2.w * r3.y + 1.000000;
/*408*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*409*/	  r3.y = max(r3.y, 0.000000);
/*410*/	  r3.y = log2(r3.y);
/*411*/	  r3.y = r3.y * 10.000000;
/*412*/	  r3.y = exp2(r3.y);
/*413*/	  r3.y = r3.w * r3.y;
/*414*/	  r3.y = r3.y * r5.w + r0.w;
/*415*/	  r2.w = r2.w * abs(r3.x);
/*416*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*417*/	} else {
/*418*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*419*/	}
/*420*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*421*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*422*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*423*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*424*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*425*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*426*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*427*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*428*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*429*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*430*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*431*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*432*/	r2.w = inversesqrt(r2.w);
/*433*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*434*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*435*/	r2.w = r2.w + r2.w;
/*436*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*437*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*438*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*439*/	r0.x = max(r0.x, 0.000000);
/*440*/	r0.x = log2(r0.x);
/*441*/	r0.x = r0.x * 10.000000;
/*442*/	r0.x = exp2(r0.x);
/*443*/	r0.x = r3.w * r0.x;
/*444*/	r0.x = r0.x * r5.w + r0.w;
/*445*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*446*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*447*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*448*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*449*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*450*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*451*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*452*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*453*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*454*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*455*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*456*/	if(r0.x != 0) discard;
/*457*/	color1.x = 1.000000;
/*458*/	return;
}
