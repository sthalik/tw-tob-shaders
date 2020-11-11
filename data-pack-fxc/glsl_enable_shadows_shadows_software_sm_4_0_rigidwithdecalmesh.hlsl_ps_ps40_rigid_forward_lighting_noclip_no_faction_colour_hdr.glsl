//
//
// Shader Model 4
// Fragment Shader
//
// id: 5144 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*51*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*52*/	r2.w = inversesqrt(r2.w);
/*53*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*54*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*55*/	r2.w = inversesqrt(r2.w);
/*56*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*57*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*58*/	r2.w = inversesqrt(r2.w);
/*59*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*60*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*61*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*62*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*63*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*64*/	r2.w = inversesqrt(r2.w);
/*65*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*66*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*67*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*68*/	if(floatBitsToUint(r0.w) != 0u) {
/*69*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*70*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*71*/	  r0.w = r3.w * cb0.data[26].x;
/*72*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*73*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*74*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*75*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*76*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*77*/	}
/*78*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*79*/	if(floatBitsToUint(r0.w) != 0u) {
/*80*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*81*/	  if(floatBitsToUint(r0.w) != 0u) {
/*82*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*83*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*84*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*85*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*86*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*87*/	    r0.w = -r0.w + 1.000000;
/*88*/	    r0.w = max(r0.w, 0.000000);
/*89*/	    r9.z = sqrt(r0.w);
/*90*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*91*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*92*/	    r0.w = inversesqrt(r0.w);
/*93*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*94*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*95*/	    r11.y = -1.000000;
/*96*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*97*/	    r0.w = inversesqrt(r0.w);
/*98*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*99*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*100*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*101*/	    r2.w = r2.w * 1.250000;
/*102*/	    r2.w = min(r2.w, 1.000000);
/*103*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*104*/	    r3.z = r3.z * 4.000000;
/*105*/	    r2.w = r2.w * 0.200000 + r3.z;
/*106*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*107*/	    r0.w = r0.w + -r2.w;
/*108*/	    r0.w = saturate(r0.w * 200.000000);
/*109*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*110*/	    r0.w = r0.w * r0.w;
/*111*/	    r0.w = r0.w * r2.w;
/*112*/	    r3.y = r0.w * -r3.y + r3.y;
/*113*/	    r2.w = -r3.x + 0.200000;
/*114*/	    r3.x = r0.w * r2.w + r3.x;
/*115*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*116*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*117*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*118*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*119*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*120*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*121*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*122*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*123*/	    r2.w = -r2.w + 1.000000;
/*124*/	    r2.w = max(r2.w, 0.000000);
/*125*/	    r8.z = sqrt(r2.w);
/*126*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*127*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*128*/	    r2.w = sqrt(r2.w);
/*129*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*130*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*131*/	    r2.w = inversesqrt(r2.w);
/*132*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*133*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*134*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*135*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*136*/	    r2.w = -r0.y + 1.000000;
/*137*/	    r0.w = min(r0.w, r2.w);
/*138*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*139*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*140*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*141*/	    r0.w = inversesqrt(r0.w);
/*142*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*143*/	  }
/*144*/	}
/*145*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*146*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*147*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*148*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*149*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*150*/	r3.xzw = (-r1.xxyz + r2.wwww).xzw;
/*151*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*152*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*153*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*154*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*155*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*156*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*157*/	r2.w = inversesqrt(r2.w);
/*158*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*159*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*160*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*161*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*162*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*163*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*164*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*165*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*166*/	r3.x = intBitsToFloat(int(r2.w));
/*167*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*168*/	if(floatBitsToUint(r3.z) != 0u) {
/*169*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*170*/	  r5.w = vsOut_T0.w;
/*171*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*172*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*173*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*174*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*175*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*176*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*177*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*178*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*179*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*180*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*181*/	  if(floatBitsToUint(r3.w) == 0u) {
/*182*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*183*/	    r7.xy = floor((r6.xyxx).xy);
/*184*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*185*/	    r3.z = -0.000400 / r3.z;
/*186*/	    r3.z = r3.z + r6.z;
/*187*/	    r8.z = -r8.y + 1.000000;
/*188*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*189*/	    r8.w = -r8.y;
/*190*/	    r10.x = cb1.data[0].z/**/;
/*191*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*192*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*193*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*194*/	    r10.w = -cb1.data[0].w/**/;
/*195*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*196*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*197*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*198*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*199*/	    r8.x = r9.x;
/*200*/	    r8.y = r11.x;
/*201*/	    r8.z = r10.x;
/*202*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*203*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*204*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*205*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*206*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*207*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*208*/	    r3.z = -r6.x + r6.y;
/*209*/	    r3.z = r3.w * r3.z + r6.x;
/*210*/	  } else {
/*211*/	    r3.z = 1.000000;
/*212*/	  }
/*213*/	} else {
/*214*/	  r3.z = 1.000000;
/*215*/	}
/*216*/	r3.w = cb1.data[34].w + -1.000000;
/*217*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*218*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*219*/	if(floatBitsToUint(r2.w) == 0u) {
/*220*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*221*/	  r2.w = floatBitsToInt(r2.w);
/*222*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*223*/	  if(floatBitsToUint(r2.w) != 0u) {
/*224*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*225*/	    r5.w = vsOut_T0.w;
/*226*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*227*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*228*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*229*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*230*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*231*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*232*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*233*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*234*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*235*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*236*/	    if(floatBitsToUint(r5.w) == 0u) {
/*237*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*238*/	      r6.xy = floor((r5.xyxx).xy);
/*239*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*240*/	      r2.w = -0.000400 / r2.w;
/*241*/	      r2.w = r2.w + r5.z;
/*242*/	      r7.z = -r7.y + 1.000000;
/*243*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*244*/	      r7.w = -r7.y;
/*245*/	      r9.x = cb1.data[0].z/**/;
/*246*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*247*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*248*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*249*/	      r9.w = -cb1.data[0].w/**/;
/*250*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*251*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*252*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*253*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*254*/	      r7.x = r8.x;
/*255*/	      r7.y = r10.x;
/*256*/	      r7.z = r9.x;
/*257*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*258*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*259*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*260*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*261*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*262*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*263*/	      r2.w = -r5.x + r5.z;
/*264*/	      r2.w = r5.y * r2.w + r5.x;
/*265*/	    } else {
/*266*/	      r2.w = 1.000000;
/*267*/	    }
/*268*/	  } else {
/*269*/	    r2.w = 1.000000;
/*270*/	  }
/*271*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*272*/	  r5.y = r5.x * cb1.data[34].x;
/*273*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*274*/	  r5.x = r1.w + -r5.x;
/*275*/	  r5.x = saturate(r5.x / r5.y);
/*276*/	  r2.w = -r3.z + r2.w;
/*277*/	  r3.z = r5.x * r2.w + r3.z;
/*278*/	}
/*279*/	if(floatBitsToUint(r3.w) != 0u) {
/*280*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*281*/	  r3.w = r2.w * cb1.data[34].y;
/*282*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*283*/	  r2.w = r1.w + -r2.w;
/*284*/	  r2.w = saturate(r2.w / r3.w);
/*285*/	  r3.x = -r3.z + 1.000000;
/*286*/	  r3.z = r2.w * r3.x + r3.z;
/*287*/	}
/*288*/	r3.z = saturate(r3.z);
/*289*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*290*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*291*/	r2.w = inversesqrt(r2.w);
/*292*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*293*/	r2.w = -r3.y + 1.000000;
/*294*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*295*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*296*/	r3.w = r3.w + r3.w;
/*297*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*298*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*299*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*300*/	r3.w = cos((r8.x));
/*301*/	r3.w = inversesqrt(r3.w);
/*302*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*303*/	r5.w = saturate(r0.w * 60.000000);
/*304*/	r5.w = -r0.w + r5.w;
/*305*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*306*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*307*/	r6.w = inversesqrt(r6.w);
/*308*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*309*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*310*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*311*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*312*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*313*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*314*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*315*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*316*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*317*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*318*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*319*/	r6.w = -r0.w + 1.000000;
/*320*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*321*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*322*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*323*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*324*/	  r6.w = max(r6.w, 0.000000);
/*325*/	  r6.w = log2(r6.w);
/*326*/	  r6.w = r6.w * 10.000000;
/*327*/	  r6.w = exp2(r6.w);
/*328*/	  r6.w = r3.w * r6.w;
/*329*/	  r6.w = r6.w * r5.w + r0.w;
/*330*/	  r7.y = r2.w * 8.000000;
/*331*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*332*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*333*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*334*/	}
/*335*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*336*/	r7.y = max(r6.w, 0.000000);
/*337*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*338*/	if(floatBitsToUint(r6.w) != 0u) {
/*339*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*340*/	  r6.x = max(r6.x, -1.000000);
/*341*/	  r6.x = min(r6.x, 1.000000);
/*342*/	  r6.y = -abs(r6.x) + 1.000000;
/*343*/	  r6.y = sqrt(r6.y);
/*344*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*345*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*346*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*347*/	  r6.w = r6.y * r6.z;
/*348*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*349*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*350*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*351*/	  r6.x = r6.z * r6.y + r6.x;
/*352*/	  r3.y = r3.y * r3.y;
/*353*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*354*/	  r3.x = r3.y * r3.x + r7.x;
/*355*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*356*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*357*/	  r3.y = -r3.x * r3.x + 1.000000;
/*358*/	  r3.y = max(r3.y, 0.001000);
/*359*/	  r3.y = log2(r3.y);
/*360*/	  r6.y = r3.y * 4.950617;
/*361*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*362*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*363*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*364*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*365*/	  r3.x = floatBitsToInt(r3.x);
/*366*/	  r6.y = r3.y * r3.y + -r6.y;
/*367*/	  r6.y = sqrt(r6.y);
/*368*/	  r3.y = -r3.y + r6.y;
/*369*/	  r3.y = max(r3.y, 0.000000);
/*370*/	  r3.y = sqrt(r3.y);
/*371*/	  r3.x = r3.y * r3.x;
/*372*/	  r3.x = r3.x * 1.414214;
/*373*/	  r3.x = 0.008727 / r3.x;
/*374*/	  r3.x = max(r3.x, 0.000100);
/*375*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*376*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*377*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*378*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*379*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*380*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*381*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*382*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*383*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*384*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*385*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*386*/	  r3.x = floatBitsToInt(r3.x);
/*387*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*388*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*389*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*390*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*391*/	  r3.x = r3.x * r6.x + 1.000000;
/*392*/	  r3.x = r3.x * 0.500000;
/*393*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*394*/	  r3.y = r3.y * r6.y + 1.000000;
/*395*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*396*/	  r3.y = min(r7.y, 1.000000);
/*397*/	  r2.w = r2.w * 1.570796;
/*398*/	  r2.w = sin(r2.w);
/*399*/	  r3.y = r3.y + -1.000000;
/*400*/	  r2.w = r2.w * r3.y + 1.000000;
/*401*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*402*/	  r3.y = max(r3.y, 0.000000);
/*403*/	  r3.y = log2(r3.y);
/*404*/	  r3.y = r3.y * 10.000000;
/*405*/	  r3.y = exp2(r3.y);
/*406*/	  r3.y = r3.w * r3.y;
/*407*/	  r3.y = r3.y * r5.w + r0.w;
/*408*/	  r2.w = r2.w * abs(r3.x);
/*409*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*410*/	} else {
/*411*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*412*/	}
/*413*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*414*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*415*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*416*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*417*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*418*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*419*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*420*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*421*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*422*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*423*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*424*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*425*/	r2.w = inversesqrt(r2.w);
/*426*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*427*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*428*/	r2.w = r2.w + r2.w;
/*429*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*430*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*431*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*432*/	r0.x = max(r0.x, 0.000000);
/*433*/	r0.x = log2(r0.x);
/*434*/	r0.x = r0.x * 10.000000;
/*435*/	r0.x = exp2(r0.x);
/*436*/	r0.x = r3.w * r0.x;
/*437*/	r0.x = r0.x * r5.w + r0.w;
/*438*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*439*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*440*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*441*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*442*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*443*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*444*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*445*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*446*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*447*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*448*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*449*/	if(r0.x != 0) discard;
/*450*/	color1.x = 1.000000;
/*451*/	return;
}
