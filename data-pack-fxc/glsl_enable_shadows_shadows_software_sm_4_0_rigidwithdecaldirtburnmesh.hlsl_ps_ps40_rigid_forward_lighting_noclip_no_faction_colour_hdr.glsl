//
//
// Shader Model 4
// Fragment Shader
//
// id: 5083 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
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
/*51*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*52*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*53*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*54*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*55*/	r2.w = r5.w * r6.w;
/*56*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*57*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*58*/	r0.xy = (r3.zwzz * r5.wwww + r0.xyxx).xy;
/*59*/	r3.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*60*/	r3.z = inversesqrt(r3.z);
/*61*/	r0.xyw = (r0.xyxw * r3.zzzz).xyw;
/*62*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*63*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*64*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*65*/	r5.x = 0;
/*66*/	r5.y = cb0.data[26].x * 0.050000;
/*67*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*68*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*69*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*70*/	r2.w = saturate(r5.x * 5.000000);
/*71*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*72*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*74*/	r3.z = log2(r6.z);
/*75*/	r3.z = r3.z * 1.800000;
/*76*/	r3.z = exp2(r3.z);
/*77*/	r3.z = r3.z * 10.000000;
/*78*/	r3.z = min(r3.z, 1.000000);
/*79*/	r2.w = r2.w + r3.z;
/*80*/	r2.w = r2.w * 0.500000;
/*81*/	r3.z = -r6.w + 1.000000;
/*82*/	r3.z = log2(r3.z);
/*83*/	r3.z = r3.z * vsOut_T7.x;
/*84*/	r3.z = exp2(r3.z);
/*85*/	r3.z = min(r3.z, 1.000000);
/*86*/	r3.z = r3.z * vsOut_T7.x;
/*87*/	r3.w = r6.z * 0.250000;
/*88*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*89*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*90*/	r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*91*/	r1.xyz = (r3.zzzz * r5.xyzx + r1.xyzx).xyz;
/*92*/	r2.w = vsOut_T7.x + -0.025000;
/*93*/	r2.w = max(r2.w, 0.000000);
/*94*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*95*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*96*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*97*/	r2.w = inversesqrt(r2.w);
/*98*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*99*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*100*/	r2.w = inversesqrt(r2.w);
/*101*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*102*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*103*/	r2.w = inversesqrt(r2.w);
/*104*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*105*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*106*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*107*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*108*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*109*/	r2.w = inversesqrt(r2.w);
/*110*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*111*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*112*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*113*/	if(floatBitsToUint(r0.w) != 0u) {
/*114*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*115*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*116*/	  r0.w = r3.w * cb0.data[26].x;
/*117*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*118*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*119*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*120*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*121*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*122*/	}
/*123*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*124*/	if(floatBitsToUint(r0.w) != 0u) {
/*125*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*126*/	  if(floatBitsToUint(r0.w) != 0u) {
/*127*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*128*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*129*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*130*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*131*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*132*/	    r0.w = -r0.w + 1.000000;
/*133*/	    r0.w = max(r0.w, 0.000000);
/*134*/	    r9.z = sqrt(r0.w);
/*135*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*136*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*137*/	    r0.w = inversesqrt(r0.w);
/*138*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*139*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*140*/	    r11.y = -1.000000;
/*141*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*142*/	    r0.w = inversesqrt(r0.w);
/*143*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*144*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*145*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*146*/	    r2.w = r2.w * 1.250000;
/*147*/	    r2.w = min(r2.w, 1.000000);
/*148*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*149*/	    r3.z = r3.z * 4.000000;
/*150*/	    r2.w = r2.w * 0.200000 + r3.z;
/*151*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*152*/	    r0.w = r0.w + -r2.w;
/*153*/	    r0.w = saturate(r0.w * 200.000000);
/*154*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*155*/	    r0.w = r0.w * r0.w;
/*156*/	    r0.w = r0.w * r2.w;
/*157*/	    r3.y = r0.w * -r3.y + r3.y;
/*158*/	    r2.w = -r3.x + 0.200000;
/*159*/	    r3.x = r0.w * r2.w + r3.x;
/*160*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*161*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*162*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*163*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*164*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*165*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*166*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*167*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*168*/	    r2.w = -r2.w + 1.000000;
/*169*/	    r2.w = max(r2.w, 0.000000);
/*170*/	    r8.z = sqrt(r2.w);
/*171*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*172*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*173*/	    r2.w = sqrt(r2.w);
/*174*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*175*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*176*/	    r2.w = inversesqrt(r2.w);
/*177*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*178*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*179*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*180*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*181*/	    r2.w = -r0.y + 1.000000;
/*182*/	    r0.w = min(r0.w, r2.w);
/*183*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*184*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*185*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*186*/	    r0.w = inversesqrt(r0.w);
/*187*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*188*/	  }
/*189*/	}
/*190*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*191*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*192*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*193*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*194*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*195*/	r3.xzw = (-r1.xxyz + r2.wwww).xzw;
/*196*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*197*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*198*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*199*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*200*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*201*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*202*/	r2.w = inversesqrt(r2.w);
/*203*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*204*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*205*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*206*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*207*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*208*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*209*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*210*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*211*/	r3.x = intBitsToFloat(int(r2.w));
/*212*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*213*/	if(floatBitsToUint(r3.z) != 0u) {
/*214*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*215*/	  r5.w = vsOut_T0.w;
/*216*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*217*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*218*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*219*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*220*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*221*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*222*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*223*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*224*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*225*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*226*/	  if(floatBitsToUint(r3.w) == 0u) {
/*227*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*228*/	    r7.xy = floor((r6.xyxx).xy);
/*229*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*230*/	    r3.z = -0.000400 / r3.z;
/*231*/	    r3.z = r3.z + r6.z;
/*232*/	    r8.z = -r8.y + 1.000000;
/*233*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*234*/	    r8.w = -r8.y;
/*235*/	    r10.x = cb1.data[0].z/**/;
/*236*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*237*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*238*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*239*/	    r10.w = -cb1.data[0].w/**/;
/*240*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*241*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*242*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*243*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*244*/	    r8.x = r9.x;
/*245*/	    r8.y = r11.x;
/*246*/	    r8.z = r10.x;
/*247*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*248*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*249*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*250*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*251*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*252*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*253*/	    r3.z = -r6.x + r6.y;
/*254*/	    r3.z = r3.w * r3.z + r6.x;
/*255*/	  } else {
/*256*/	    r3.z = 1.000000;
/*257*/	  }
/*258*/	} else {
/*259*/	  r3.z = 1.000000;
/*260*/	}
/*261*/	r3.w = cb1.data[34].w + -1.000000;
/*262*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*263*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*264*/	if(floatBitsToUint(r2.w) == 0u) {
/*265*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*266*/	  r2.w = floatBitsToInt(r2.w);
/*267*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*268*/	  if(floatBitsToUint(r2.w) != 0u) {
/*269*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*270*/	    r5.w = vsOut_T0.w;
/*271*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*272*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*273*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*274*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*275*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*276*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*277*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*278*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*279*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*280*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*281*/	    if(floatBitsToUint(r5.w) == 0u) {
/*282*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*283*/	      r6.xy = floor((r5.xyxx).xy);
/*284*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*285*/	      r2.w = -0.000400 / r2.w;
/*286*/	      r2.w = r2.w + r5.z;
/*287*/	      r7.z = -r7.y + 1.000000;
/*288*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*289*/	      r7.w = -r7.y;
/*290*/	      r9.x = cb1.data[0].z/**/;
/*291*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*292*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*293*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*294*/	      r9.w = -cb1.data[0].w/**/;
/*295*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*296*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*297*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*298*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*299*/	      r7.x = r8.x;
/*300*/	      r7.y = r10.x;
/*301*/	      r7.z = r9.x;
/*302*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*303*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*304*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*305*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*306*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*307*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*308*/	      r2.w = -r5.x + r5.z;
/*309*/	      r2.w = r5.y * r2.w + r5.x;
/*310*/	    } else {
/*311*/	      r2.w = 1.000000;
/*312*/	    }
/*313*/	  } else {
/*314*/	    r2.w = 1.000000;
/*315*/	  }
/*316*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*317*/	  r5.y = r5.x * cb1.data[34].x;
/*318*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*319*/	  r5.x = r1.w + -r5.x;
/*320*/	  r5.x = saturate(r5.x / r5.y);
/*321*/	  r2.w = -r3.z + r2.w;
/*322*/	  r3.z = r5.x * r2.w + r3.z;
/*323*/	}
/*324*/	if(floatBitsToUint(r3.w) != 0u) {
/*325*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*326*/	  r3.w = r2.w * cb1.data[34].y;
/*327*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*328*/	  r2.w = r1.w + -r2.w;
/*329*/	  r2.w = saturate(r2.w / r3.w);
/*330*/	  r3.x = -r3.z + 1.000000;
/*331*/	  r3.z = r2.w * r3.x + r3.z;
/*332*/	}
/*333*/	r3.z = saturate(r3.z);
/*334*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*335*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*336*/	r2.w = inversesqrt(r2.w);
/*337*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*338*/	r2.w = -r3.y + 1.000000;
/*339*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*340*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*341*/	r3.w = r3.w + r3.w;
/*342*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*343*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*344*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*345*/	r3.w = cos((r8.x));
/*346*/	r3.w = inversesqrt(r3.w);
/*347*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*348*/	r5.w = saturate(r0.w * 60.000000);
/*349*/	r5.w = -r0.w + r5.w;
/*350*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*351*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*352*/	r6.w = inversesqrt(r6.w);
/*353*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*354*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*355*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*356*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*357*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*358*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*359*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*360*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*361*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*362*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*363*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*364*/	r6.w = -r0.w + 1.000000;
/*365*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*366*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*367*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*368*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*369*/	  r6.w = max(r6.w, 0.000000);
/*370*/	  r6.w = log2(r6.w);
/*371*/	  r6.w = r6.w * 10.000000;
/*372*/	  r6.w = exp2(r6.w);
/*373*/	  r6.w = r3.w * r6.w;
/*374*/	  r6.w = r6.w * r5.w + r0.w;
/*375*/	  r7.y = r2.w * 8.000000;
/*376*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*377*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*378*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*379*/	}
/*380*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*381*/	r7.y = max(r6.w, 0.000000);
/*382*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*383*/	if(floatBitsToUint(r6.w) != 0u) {
/*384*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*385*/	  r6.x = max(r6.x, -1.000000);
/*386*/	  r6.x = min(r6.x, 1.000000);
/*387*/	  r6.y = -abs(r6.x) + 1.000000;
/*388*/	  r6.y = sqrt(r6.y);
/*389*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*390*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*391*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*392*/	  r6.w = r6.y * r6.z;
/*393*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*394*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*395*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*396*/	  r6.x = r6.z * r6.y + r6.x;
/*397*/	  r3.y = r3.y * r3.y;
/*398*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*399*/	  r3.x = r3.y * r3.x + r7.x;
/*400*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*401*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*402*/	  r3.y = -r3.x * r3.x + 1.000000;
/*403*/	  r3.y = max(r3.y, 0.001000);
/*404*/	  r3.y = log2(r3.y);
/*405*/	  r6.y = r3.y * 4.950617;
/*406*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*407*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*408*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*409*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*410*/	  r3.x = floatBitsToInt(r3.x);
/*411*/	  r6.y = r3.y * r3.y + -r6.y;
/*412*/	  r6.y = sqrt(r6.y);
/*413*/	  r3.y = -r3.y + r6.y;
/*414*/	  r3.y = max(r3.y, 0.000000);
/*415*/	  r3.y = sqrt(r3.y);
/*416*/	  r3.x = r3.y * r3.x;
/*417*/	  r3.x = r3.x * 1.414214;
/*418*/	  r3.x = 0.008727 / r3.x;
/*419*/	  r3.x = max(r3.x, 0.000100);
/*420*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*421*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*422*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*423*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*424*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*425*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*426*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*427*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*428*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*429*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*430*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*431*/	  r3.x = floatBitsToInt(r3.x);
/*432*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*433*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*434*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*435*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*436*/	  r3.x = r3.x * r6.x + 1.000000;
/*437*/	  r3.x = r3.x * 0.500000;
/*438*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*439*/	  r3.y = r3.y * r6.y + 1.000000;
/*440*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*441*/	  r3.y = min(r7.y, 1.000000);
/*442*/	  r2.w = r2.w * 1.570796;
/*443*/	  r2.w = sin(r2.w);
/*444*/	  r3.y = r3.y + -1.000000;
/*445*/	  r2.w = r2.w * r3.y + 1.000000;
/*446*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*447*/	  r3.y = max(r3.y, 0.000000);
/*448*/	  r3.y = log2(r3.y);
/*449*/	  r3.y = r3.y * 10.000000;
/*450*/	  r3.y = exp2(r3.y);
/*451*/	  r3.y = r3.w * r3.y;
/*452*/	  r3.y = r3.y * r5.w + r0.w;
/*453*/	  r2.w = r2.w * abs(r3.x);
/*454*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*455*/	} else {
/*456*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*457*/	}
/*458*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*459*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*460*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*461*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*462*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*463*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*464*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*465*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*466*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*467*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*468*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*469*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*470*/	r2.w = inversesqrt(r2.w);
/*471*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*472*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*473*/	r2.w = r2.w + r2.w;
/*474*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*475*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*476*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*477*/	r0.x = max(r0.x, 0.000000);
/*478*/	r0.x = log2(r0.x);
/*479*/	r0.x = r0.x * 10.000000;
/*480*/	r0.x = exp2(r0.x);
/*481*/	r0.x = r3.w * r0.x;
/*482*/	r0.x = r0.x * r5.w + r0.w;
/*483*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*484*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*485*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*486*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*487*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*488*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*489*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*490*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*491*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*492*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*493*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*494*/	if(r0.x != 0) discard;
/*495*/	color1.x = 1.000000;
/*496*/	return;
}
