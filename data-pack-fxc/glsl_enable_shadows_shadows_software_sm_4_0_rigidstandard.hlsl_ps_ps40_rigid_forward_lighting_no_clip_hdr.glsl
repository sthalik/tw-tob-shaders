//
//
// Shader Model 4
// Fragment Shader
//
// id: 4676 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandard.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
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
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
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
/*40*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*41*/	r2.w = inversesqrt(r2.w);
/*42*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*43*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*44*/	r2.w = inversesqrt(r2.w);
/*45*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*46*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*47*/	r2.w = inversesqrt(r2.w);
/*48*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*49*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*50*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*51*/	r1.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*52*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*53*/	r2.w = inversesqrt(r2.w);
/*54*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*55*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*56*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*57*/	if(floatBitsToUint(r0.z) != 0u) {
/*58*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*59*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*60*/	  r0.z = r3.w * cb0.data[26].x;
/*61*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*62*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*63*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*64*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*65*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*66*/	}
/*67*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*68*/	if(floatBitsToUint(r0.z) != 0u) {
/*69*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*70*/	  if(floatBitsToUint(r0.z) != 0u) {
/*71*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*72*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*73*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*74*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*75*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*76*/	    r0.z = -r0.z + 1.000000;
/*77*/	    r0.z = max(r0.z, 0.000000);
/*78*/	    r9.z = sqrt(r0.z);
/*79*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*80*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*81*/	    r0.z = inversesqrt(r0.z);
/*82*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*83*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*84*/	    r11.y = -1.000000;
/*85*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*86*/	    r0.z = inversesqrt(r0.z);
/*87*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*88*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*89*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*90*/	    r2.w = r2.w * 1.250000;
/*91*/	    r2.w = min(r2.w, 1.000000);
/*92*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*93*/	    r3.z = r3.z * 4.000000;
/*94*/	    r2.w = r2.w * 0.200000 + r3.z;
/*95*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*96*/	    r0.z = r0.z + -r2.w;
/*97*/	    r0.z = saturate(r0.z * 200.000000);
/*98*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*99*/	    r0.z = r0.z * r0.z;
/*100*/	    r0.z = r0.z * r2.w;
/*101*/	    r3.x = r0.z * -r3.x + r3.x;
/*102*/	    r2.w = -r3.y + 0.200000;
/*103*/	    r3.y = r0.z * r2.w + r3.y;
/*104*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*105*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*106*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*107*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*108*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*109*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*110*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*111*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*112*/	    r2.w = -r2.w + 1.000000;
/*113*/	    r2.w = max(r2.w, 0.000000);
/*114*/	    r8.z = sqrt(r2.w);
/*115*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*116*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*117*/	    r2.w = sqrt(r2.w);
/*118*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*119*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*120*/	    r2.w = inversesqrt(r2.w);
/*121*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*122*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*123*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*124*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*125*/	    r2.w = -r1.y + 1.000000;
/*126*/	    r0.z = min(r0.z, r2.w);
/*127*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*128*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*129*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*130*/	    r0.z = inversesqrt(r0.z);
/*131*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*132*/	  }
/*133*/	}
/*134*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*135*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*136*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*137*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*138*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*139*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*140*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*141*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*142*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*143*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*144*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*145*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*146*/	r2.w = inversesqrt(r2.w);
/*147*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*148*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*149*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*150*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*151*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*152*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*153*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*154*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*155*/	r3.y = intBitsToFloat(int(r2.w));
/*156*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*157*/	if(floatBitsToUint(r3.z) != 0u) {
/*158*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*159*/	  r5.w = vsOut_T0.w;
/*160*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*161*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*162*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*163*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*164*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*165*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*166*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*167*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*168*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*169*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*170*/	  if(floatBitsToUint(r3.w) == 0u) {
/*171*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*172*/	    r7.xy = floor((r6.xyxx).xy);
/*173*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*174*/	    r3.z = -0.000400 / r3.z;
/*175*/	    r3.z = r3.z + r6.z;
/*176*/	    r8.z = -r8.y + 1.000000;
/*177*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*178*/	    r8.w = -r8.y;
/*179*/	    r10.x = cb1.data[0].z/**/;
/*180*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*181*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*182*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*183*/	    r10.w = -cb1.data[0].w/**/;
/*184*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*185*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*186*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*187*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*188*/	    r8.x = r9.x;
/*189*/	    r8.y = r11.x;
/*190*/	    r8.z = r10.x;
/*191*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*192*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*193*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*194*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*195*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*196*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*197*/	    r3.z = -r6.x + r6.y;
/*198*/	    r3.z = r3.w * r3.z + r6.x;
/*199*/	  } else {
/*200*/	    r3.z = 1.000000;
/*201*/	  }
/*202*/	} else {
/*203*/	  r3.z = 1.000000;
/*204*/	}
/*205*/	r3.w = cb1.data[34].w + -1.000000;
/*206*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*207*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*208*/	if(floatBitsToUint(r2.w) == 0u) {
/*209*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*210*/	  r2.w = floatBitsToInt(r2.w);
/*211*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*212*/	  if(floatBitsToUint(r2.w) != 0u) {
/*213*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*214*/	    r5.w = vsOut_T0.w;
/*215*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*216*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*217*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*218*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*219*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*220*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*221*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*222*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*223*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*224*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*225*/	    if(floatBitsToUint(r5.w) == 0u) {
/*226*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*227*/	      r6.xy = floor((r5.xyxx).xy);
/*228*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*229*/	      r2.w = -0.000400 / r2.w;
/*230*/	      r2.w = r2.w + r5.z;
/*231*/	      r7.z = -r7.y + 1.000000;
/*232*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*233*/	      r7.w = -r7.y;
/*234*/	      r9.x = cb1.data[0].z/**/;
/*235*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*236*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*237*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*238*/	      r9.w = -cb1.data[0].w/**/;
/*239*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*240*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*241*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*242*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*243*/	      r7.x = r8.x;
/*244*/	      r7.y = r10.x;
/*245*/	      r7.z = r9.x;
/*246*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*247*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*248*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*249*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*250*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*251*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*252*/	      r2.w = -r5.x + r5.z;
/*253*/	      r2.w = r5.y * r2.w + r5.x;
/*254*/	    } else {
/*255*/	      r2.w = 1.000000;
/*256*/	    }
/*257*/	  } else {
/*258*/	    r2.w = 1.000000;
/*259*/	  }
/*260*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*261*/	  r5.y = r5.x * cb1.data[34].x;
/*262*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*263*/	  r5.x = r1.w + -r5.x;
/*264*/	  r5.x = saturate(r5.x / r5.y);
/*265*/	  r2.w = -r3.z + r2.w;
/*266*/	  r3.z = r5.x * r2.w + r3.z;
/*267*/	}
/*268*/	if(floatBitsToUint(r3.w) != 0u) {
/*269*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*270*/	  r3.w = r2.w * cb1.data[34].y;
/*271*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*272*/	  r2.w = r1.w + -r2.w;
/*273*/	  r2.w = saturate(r2.w / r3.w);
/*274*/	  r3.y = -r3.z + 1.000000;
/*275*/	  r3.z = r2.w * r3.y + r3.z;
/*276*/	}
/*277*/	r3.z = saturate(r3.z);
/*278*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*279*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*280*/	r2.w = inversesqrt(r2.w);
/*281*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*282*/	r2.w = -r3.x + 1.000000;
/*283*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*284*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*285*/	r3.w = r3.w + r3.w;
/*286*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*287*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*288*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*289*/	r3.w = cos((r8.x));
/*290*/	r3.w = inversesqrt(r3.w);
/*291*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*292*/	r5.w = saturate(r0.z * 60.000000);
/*293*/	r5.w = -r0.z + r5.w;
/*294*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*295*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*296*/	r6.w = inversesqrt(r6.w);
/*297*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*298*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*299*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*300*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*301*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*302*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*303*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*304*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*305*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*306*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*307*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*308*/	r6.w = -r0.z + 1.000000;
/*309*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*310*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*311*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*312*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*313*/	  r6.w = max(r6.w, 0.000000);
/*314*/	  r6.w = log2(r6.w);
/*315*/	  r6.w = r6.w * 10.000000;
/*316*/	  r6.w = exp2(r6.w);
/*317*/	  r6.w = r3.w * r6.w;
/*318*/	  r6.w = r6.w * r5.w + r0.z;
/*319*/	  r7.y = r2.w * 8.000000;
/*320*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*321*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*322*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*323*/	}
/*324*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*325*/	r7.y = max(r6.w, 0.000000);
/*326*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*327*/	if(floatBitsToUint(r6.w) != 0u) {
/*328*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*329*/	  r6.x = max(r6.x, -1.000000);
/*330*/	  r6.x = min(r6.x, 1.000000);
/*331*/	  r6.y = -abs(r6.x) + 1.000000;
/*332*/	  r6.y = sqrt(r6.y);
/*333*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*334*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*335*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*336*/	  r6.w = r6.y * r6.z;
/*337*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*338*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*339*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*340*/	  r6.x = r6.z * r6.y + r6.x;
/*341*/	  r3.x = r3.x * r3.x;
/*342*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*343*/	  r3.x = r3.x * r3.y + r7.x;
/*344*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*345*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*346*/	  r3.y = -r3.x * r3.x + 1.000000;
/*347*/	  r3.y = max(r3.y, 0.001000);
/*348*/	  r3.y = log2(r3.y);
/*349*/	  r6.y = r3.y * 4.950617;
/*350*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*351*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*352*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*353*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*354*/	  r3.x = floatBitsToInt(r3.x);
/*355*/	  r6.y = r3.y * r3.y + -r6.y;
/*356*/	  r6.y = sqrt(r6.y);
/*357*/	  r3.y = -r3.y + r6.y;
/*358*/	  r3.y = max(r3.y, 0.000000);
/*359*/	  r3.y = sqrt(r3.y);
/*360*/	  r3.x = r3.y * r3.x;
/*361*/	  r3.x = r3.x * 1.414214;
/*362*/	  r3.x = 0.008727 / r3.x;
/*363*/	  r3.x = max(r3.x, 0.000100);
/*364*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*365*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*366*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*367*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*368*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*369*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*370*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*371*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*372*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*373*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*374*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*375*/	  r3.x = floatBitsToInt(r3.x);
/*376*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*377*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*378*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*379*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*380*/	  r3.x = r3.x * r6.x + 1.000000;
/*381*/	  r3.x = r3.x * 0.500000;
/*382*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*383*/	  r3.y = r3.y * r6.y + 1.000000;
/*384*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*385*/	  r3.y = min(r7.y, 1.000000);
/*386*/	  r2.w = r2.w * 1.570796;
/*387*/	  r2.w = sin(r2.w);
/*388*/	  r3.y = r3.y + -1.000000;
/*389*/	  r2.w = r2.w * r3.y + 1.000000;
/*390*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*391*/	  r3.y = max(r3.y, 0.000000);
/*392*/	  r3.y = log2(r3.y);
/*393*/	  r3.y = r3.y * 10.000000;
/*394*/	  r3.y = exp2(r3.y);
/*395*/	  r3.y = r3.w * r3.y;
/*396*/	  r3.y = r3.y * r5.w + r0.z;
/*397*/	  r2.w = r2.w * abs(r3.x);
/*398*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*399*/	} else {
/*400*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*401*/	}
/*402*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*403*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*404*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*405*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*406*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*407*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*408*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*409*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*410*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*411*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*412*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*413*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*414*/	r2.w = inversesqrt(r2.w);
/*415*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*416*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*417*/	r2.w = r2.w + r2.w;
/*418*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*419*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*420*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*421*/	r1.x = max(r1.x, 0.000000);
/*422*/	r1.x = log2(r1.x);
/*423*/	r1.x = r1.x * 10.000000;
/*424*/	r1.x = exp2(r1.x);
/*425*/	r1.x = r3.w * r1.x;
/*426*/	r0.z = r1.x * r5.w + r0.z;
/*427*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*428*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*429*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*430*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*431*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*432*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*433*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*434*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*435*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*436*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*437*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*438*/	if(r0.x != 0) discard;
/*439*/	color1.x = 1.000000;
/*440*/	return;
}
