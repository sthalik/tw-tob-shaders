//
//
// Shader Model 4
// Fragment Shader
//
// id: 5142 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*55*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r2.w = inversesqrt(r2.w);
/*57*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*58*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*59*/	r2.w = inversesqrt(r2.w);
/*60*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*61*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r2.w = inversesqrt(r2.w);
/*63*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*64*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*65*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*66*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*67*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*68*/	r2.w = inversesqrt(r2.w);
/*69*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*70*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*71*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*72*/	if(floatBitsToUint(r0.w) != 0u) {
/*73*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*74*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*75*/	  r0.w = r3.w * cb0.data[26].x;
/*76*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*77*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*78*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*79*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*80*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*81*/	}
/*82*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*83*/	if(floatBitsToUint(r0.w) != 0u) {
/*84*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*85*/	  if(floatBitsToUint(r0.w) != 0u) {
/*86*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*87*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*88*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*89*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*90*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*91*/	    r0.w = -r0.w + 1.000000;
/*92*/	    r0.w = max(r0.w, 0.000000);
/*93*/	    r9.z = sqrt(r0.w);
/*94*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*95*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*96*/	    r0.w = inversesqrt(r0.w);
/*97*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*98*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*99*/	    r11.y = -1.000000;
/*100*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*101*/	    r0.w = inversesqrt(r0.w);
/*102*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*103*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*104*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*105*/	    r2.w = r2.w * 1.250000;
/*106*/	    r2.w = min(r2.w, 1.000000);
/*107*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*108*/	    r3.z = r3.z * 4.000000;
/*109*/	    r2.w = r2.w * 0.200000 + r3.z;
/*110*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*111*/	    r0.w = r0.w + -r2.w;
/*112*/	    r0.w = saturate(r0.w * 200.000000);
/*113*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*114*/	    r0.w = r0.w * r0.w;
/*115*/	    r0.w = r0.w * r2.w;
/*116*/	    r3.y = r0.w * -r3.y + r3.y;
/*117*/	    r2.w = -r3.x + 0.200000;
/*118*/	    r3.x = r0.w * r2.w + r3.x;
/*119*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*120*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*121*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*122*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*123*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*124*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*125*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*126*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*127*/	    r2.w = -r2.w + 1.000000;
/*128*/	    r2.w = max(r2.w, 0.000000);
/*129*/	    r8.z = sqrt(r2.w);
/*130*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*131*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*132*/	    r2.w = sqrt(r2.w);
/*133*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*134*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*135*/	    r2.w = inversesqrt(r2.w);
/*136*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*137*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*138*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*139*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*140*/	    r2.w = -r0.y + 1.000000;
/*141*/	    r0.w = min(r0.w, r2.w);
/*142*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*143*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*144*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*145*/	    r0.w = inversesqrt(r0.w);
/*146*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*147*/	  }
/*148*/	}
/*149*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*150*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*151*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*152*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*153*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*154*/	r3.xzw = (-r1.xxyz + r2.wwww).xzw;
/*155*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*156*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*157*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*158*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*159*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*160*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*161*/	r2.w = inversesqrt(r2.w);
/*162*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*163*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*164*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*165*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*166*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*167*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*168*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*169*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*170*/	r3.x = intBitsToFloat(int(r2.w));
/*171*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*172*/	if(floatBitsToUint(r3.z) != 0u) {
/*173*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*174*/	  r5.w = vsOut_T0.w;
/*175*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*176*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*177*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*178*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*179*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*180*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*181*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*182*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*183*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*184*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*185*/	  if(floatBitsToUint(r3.w) == 0u) {
/*186*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*187*/	    r7.xy = floor((r6.xyxx).xy);
/*188*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*189*/	    r3.z = -0.000400 / r3.z;
/*190*/	    r3.z = r3.z + r6.z;
/*191*/	    r8.z = -r8.y + 1.000000;
/*192*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*193*/	    r8.w = -r8.y;
/*194*/	    r10.x = cb1.data[0].z/**/;
/*195*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*196*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*197*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*198*/	    r10.w = -cb1.data[0].w/**/;
/*199*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*200*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*201*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*202*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*203*/	    r8.x = r9.x;
/*204*/	    r8.y = r11.x;
/*205*/	    r8.z = r10.x;
/*206*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*207*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*208*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*209*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*210*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*211*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*212*/	    r3.z = -r6.x + r6.y;
/*213*/	    r3.z = r3.w * r3.z + r6.x;
/*214*/	  } else {
/*215*/	    r3.z = 1.000000;
/*216*/	  }
/*217*/	} else {
/*218*/	  r3.z = 1.000000;
/*219*/	}
/*220*/	r3.w = cb1.data[34].w + -1.000000;
/*221*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*222*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*223*/	if(floatBitsToUint(r2.w) == 0u) {
/*224*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*225*/	  r2.w = floatBitsToInt(r2.w);
/*226*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*227*/	  if(floatBitsToUint(r2.w) != 0u) {
/*228*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*229*/	    r5.w = vsOut_T0.w;
/*230*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*231*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*232*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*233*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*234*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*235*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*236*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*237*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*238*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*239*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*240*/	    if(floatBitsToUint(r5.w) == 0u) {
/*241*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*242*/	      r6.xy = floor((r5.xyxx).xy);
/*243*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*244*/	      r2.w = -0.000400 / r2.w;
/*245*/	      r2.w = r2.w + r5.z;
/*246*/	      r7.z = -r7.y + 1.000000;
/*247*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*248*/	      r7.w = -r7.y;
/*249*/	      r9.x = cb1.data[0].z/**/;
/*250*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*251*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*252*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*253*/	      r9.w = -cb1.data[0].w/**/;
/*254*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*255*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*256*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*257*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*258*/	      r7.x = r8.x;
/*259*/	      r7.y = r10.x;
/*260*/	      r7.z = r9.x;
/*261*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*262*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*263*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*264*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*265*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*266*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*267*/	      r2.w = -r5.x + r5.z;
/*268*/	      r2.w = r5.y * r2.w + r5.x;
/*269*/	    } else {
/*270*/	      r2.w = 1.000000;
/*271*/	    }
/*272*/	  } else {
/*273*/	    r2.w = 1.000000;
/*274*/	  }
/*275*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*276*/	  r5.y = r5.x * cb1.data[34].x;
/*277*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*278*/	  r5.x = r1.w + -r5.x;
/*279*/	  r5.x = saturate(r5.x / r5.y);
/*280*/	  r2.w = -r3.z + r2.w;
/*281*/	  r3.z = r5.x * r2.w + r3.z;
/*282*/	}
/*283*/	if(floatBitsToUint(r3.w) != 0u) {
/*284*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*285*/	  r3.w = r2.w * cb1.data[34].y;
/*286*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*287*/	  r2.w = r1.w + -r2.w;
/*288*/	  r2.w = saturate(r2.w / r3.w);
/*289*/	  r3.x = -r3.z + 1.000000;
/*290*/	  r3.z = r2.w * r3.x + r3.z;
/*291*/	}
/*292*/	r3.z = saturate(r3.z);
/*293*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*294*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*295*/	r2.w = inversesqrt(r2.w);
/*296*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*297*/	r2.w = -r3.y + 1.000000;
/*298*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*299*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*300*/	r3.w = r3.w + r3.w;
/*301*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*302*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*303*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*304*/	r3.w = cos((r8.x));
/*305*/	r3.w = inversesqrt(r3.w);
/*306*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*307*/	r5.w = saturate(r0.w * 60.000000);
/*308*/	r5.w = -r0.w + r5.w;
/*309*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*310*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*311*/	r6.w = inversesqrt(r6.w);
/*312*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*313*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*314*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*315*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*316*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*317*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*318*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*319*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*320*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*321*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*322*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*323*/	r6.w = -r0.w + 1.000000;
/*324*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*325*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*326*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*327*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*328*/	  r6.w = max(r6.w, 0.000000);
/*329*/	  r6.w = log2(r6.w);
/*330*/	  r6.w = r6.w * 10.000000;
/*331*/	  r6.w = exp2(r6.w);
/*332*/	  r6.w = r3.w * r6.w;
/*333*/	  r6.w = r6.w * r5.w + r0.w;
/*334*/	  r7.y = r2.w * 8.000000;
/*335*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*336*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*337*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*338*/	}
/*339*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*340*/	r7.y = max(r6.w, 0.000000);
/*341*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*342*/	if(floatBitsToUint(r6.w) != 0u) {
/*343*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*344*/	  r6.x = max(r6.x, -1.000000);
/*345*/	  r6.x = min(r6.x, 1.000000);
/*346*/	  r6.y = -abs(r6.x) + 1.000000;
/*347*/	  r6.y = sqrt(r6.y);
/*348*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*349*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*350*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*351*/	  r6.w = r6.y * r6.z;
/*352*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*353*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*354*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*355*/	  r6.x = r6.z * r6.y + r6.x;
/*356*/	  r3.y = r3.y * r3.y;
/*357*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*358*/	  r3.x = r3.y * r3.x + r7.x;
/*359*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*360*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*361*/	  r3.y = -r3.x * r3.x + 1.000000;
/*362*/	  r3.y = max(r3.y, 0.001000);
/*363*/	  r3.y = log2(r3.y);
/*364*/	  r6.y = r3.y * 4.950617;
/*365*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*366*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*367*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*368*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*369*/	  r3.x = floatBitsToInt(r3.x);
/*370*/	  r6.y = r3.y * r3.y + -r6.y;
/*371*/	  r6.y = sqrt(r6.y);
/*372*/	  r3.y = -r3.y + r6.y;
/*373*/	  r3.y = max(r3.y, 0.000000);
/*374*/	  r3.y = sqrt(r3.y);
/*375*/	  r3.x = r3.y * r3.x;
/*376*/	  r3.x = r3.x * 1.414214;
/*377*/	  r3.x = 0.008727 / r3.x;
/*378*/	  r3.x = max(r3.x, 0.000100);
/*379*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*380*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*381*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*382*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*383*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*384*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*385*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*386*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*387*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*388*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*389*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*390*/	  r3.x = floatBitsToInt(r3.x);
/*391*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*392*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*393*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*394*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*395*/	  r3.x = r3.x * r6.x + 1.000000;
/*396*/	  r3.x = r3.x * 0.500000;
/*397*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*398*/	  r3.y = r3.y * r6.y + 1.000000;
/*399*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*400*/	  r3.y = min(r7.y, 1.000000);
/*401*/	  r2.w = r2.w * 1.570796;
/*402*/	  r2.w = sin(r2.w);
/*403*/	  r3.y = r3.y + -1.000000;
/*404*/	  r2.w = r2.w * r3.y + 1.000000;
/*405*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*406*/	  r3.y = max(r3.y, 0.000000);
/*407*/	  r3.y = log2(r3.y);
/*408*/	  r3.y = r3.y * 10.000000;
/*409*/	  r3.y = exp2(r3.y);
/*410*/	  r3.y = r3.w * r3.y;
/*411*/	  r3.y = r3.y * r5.w + r0.w;
/*412*/	  r2.w = r2.w * abs(r3.x);
/*413*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*414*/	} else {
/*415*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*416*/	}
/*417*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*418*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*419*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*420*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*421*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*422*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*423*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*424*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*425*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*426*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*427*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*428*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*429*/	r2.w = inversesqrt(r2.w);
/*430*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*431*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*432*/	r2.w = r2.w + r2.w;
/*433*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*434*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*435*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*436*/	r0.x = max(r0.x, 0.000000);
/*437*/	r0.x = log2(r0.x);
/*438*/	r0.x = r0.x * 10.000000;
/*439*/	r0.x = exp2(r0.x);
/*440*/	r0.x = r3.w * r0.x;
/*441*/	r0.x = r0.x * r5.w + r0.w;
/*442*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*443*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*444*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*445*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*446*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*447*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*448*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*449*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*450*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*451*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*452*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*453*/	if(r0.x != 0) discard;
/*454*/	color1.x = 1.000000;
/*455*/	return;
}
