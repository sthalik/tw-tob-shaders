//
//
// Shader Model 4
// Fragment Shader
//
// id: 5081 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*55*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*56*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*57*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*58*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*59*/	r2.w = r5.w * r6.w;
/*60*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*61*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*62*/	r0.xy = (r3.zwzz * r5.wwww + r0.xyxx).xy;
/*63*/	r3.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*64*/	r3.z = inversesqrt(r3.z);
/*65*/	r0.xyw = (r0.xyxw * r3.zzzz).xyw;
/*66*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*67*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*68*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*69*/	r5.x = 0;
/*70*/	r5.y = cb0.data[26].x * 0.050000;
/*71*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*72*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*73*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*74*/	r2.w = saturate(r5.x * 5.000000);
/*75*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*76*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*78*/	r3.z = log2(r6.z);
/*79*/	r3.z = r3.z * 1.800000;
/*80*/	r3.z = exp2(r3.z);
/*81*/	r3.z = r3.z * 10.000000;
/*82*/	r3.z = min(r3.z, 1.000000);
/*83*/	r2.w = r2.w + r3.z;
/*84*/	r2.w = r2.w * 0.500000;
/*85*/	r3.z = -r6.w + 1.000000;
/*86*/	r3.z = log2(r3.z);
/*87*/	r3.z = r3.z * vsOut_T7.x;
/*88*/	r3.z = exp2(r3.z);
/*89*/	r3.z = min(r3.z, 1.000000);
/*90*/	r3.z = r3.z * vsOut_T7.x;
/*91*/	r3.w = r6.z * 0.250000;
/*92*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*93*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*94*/	r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*95*/	r1.xyz = (r3.zzzz * r5.xyzx + r1.xyzx).xyz;
/*96*/	r2.w = vsOut_T7.x + -0.025000;
/*97*/	r2.w = max(r2.w, 0.000000);
/*98*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*99*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*100*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*101*/	r2.w = inversesqrt(r2.w);
/*102*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*103*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*104*/	r2.w = inversesqrt(r2.w);
/*105*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*106*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*107*/	r2.w = inversesqrt(r2.w);
/*108*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*109*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*110*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*111*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*112*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*113*/	r2.w = inversesqrt(r2.w);
/*114*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*115*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*116*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*117*/	if(floatBitsToUint(r0.w) != 0u) {
/*118*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*119*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*120*/	  r0.w = r3.w * cb0.data[26].x;
/*121*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*122*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*123*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*124*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*125*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*126*/	}
/*127*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*128*/	if(floatBitsToUint(r0.w) != 0u) {
/*129*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*130*/	  if(floatBitsToUint(r0.w) != 0u) {
/*131*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*132*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*133*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*134*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*135*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*136*/	    r0.w = -r0.w + 1.000000;
/*137*/	    r0.w = max(r0.w, 0.000000);
/*138*/	    r9.z = sqrt(r0.w);
/*139*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*140*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*141*/	    r0.w = inversesqrt(r0.w);
/*142*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*143*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*144*/	    r11.y = -1.000000;
/*145*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*146*/	    r0.w = inversesqrt(r0.w);
/*147*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*148*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*149*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*150*/	    r2.w = r2.w * 1.250000;
/*151*/	    r2.w = min(r2.w, 1.000000);
/*152*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*153*/	    r3.z = r3.z * 4.000000;
/*154*/	    r2.w = r2.w * 0.200000 + r3.z;
/*155*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*156*/	    r0.w = r0.w + -r2.w;
/*157*/	    r0.w = saturate(r0.w * 200.000000);
/*158*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*159*/	    r0.w = r0.w * r0.w;
/*160*/	    r0.w = r0.w * r2.w;
/*161*/	    r3.y = r0.w * -r3.y + r3.y;
/*162*/	    r2.w = -r3.x + 0.200000;
/*163*/	    r3.x = r0.w * r2.w + r3.x;
/*164*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*165*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*166*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*167*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*168*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*169*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*170*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*171*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*172*/	    r2.w = -r2.w + 1.000000;
/*173*/	    r2.w = max(r2.w, 0.000000);
/*174*/	    r8.z = sqrt(r2.w);
/*175*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*176*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*177*/	    r2.w = sqrt(r2.w);
/*178*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*179*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*180*/	    r2.w = inversesqrt(r2.w);
/*181*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*182*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*183*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*184*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*185*/	    r2.w = -r0.y + 1.000000;
/*186*/	    r0.w = min(r0.w, r2.w);
/*187*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*188*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*189*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*190*/	    r0.w = inversesqrt(r0.w);
/*191*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*192*/	  }
/*193*/	}
/*194*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*195*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*196*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*197*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*198*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*199*/	r3.xzw = (-r1.xxyz + r2.wwww).xzw;
/*200*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*201*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*202*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*203*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*204*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*205*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*206*/	r2.w = inversesqrt(r2.w);
/*207*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*208*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*209*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*210*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*211*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*212*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*213*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*214*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*215*/	r3.x = intBitsToFloat(int(r2.w));
/*216*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*217*/	if(floatBitsToUint(r3.z) != 0u) {
/*218*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*219*/	  r5.w = vsOut_T0.w;
/*220*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*221*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*222*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*223*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*224*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*225*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*226*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*227*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*228*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*229*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*230*/	  if(floatBitsToUint(r3.w) == 0u) {
/*231*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*232*/	    r7.xy = floor((r6.xyxx).xy);
/*233*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*234*/	    r3.z = -0.000400 / r3.z;
/*235*/	    r3.z = r3.z + r6.z;
/*236*/	    r8.z = -r8.y + 1.000000;
/*237*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*238*/	    r8.w = -r8.y;
/*239*/	    r10.x = cb1.data[0].z/**/;
/*240*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*241*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*242*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*243*/	    r10.w = -cb1.data[0].w/**/;
/*244*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*245*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*246*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*247*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*248*/	    r8.x = r9.x;
/*249*/	    r8.y = r11.x;
/*250*/	    r8.z = r10.x;
/*251*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*252*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*253*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*254*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*255*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*256*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*257*/	    r3.z = -r6.x + r6.y;
/*258*/	    r3.z = r3.w * r3.z + r6.x;
/*259*/	  } else {
/*260*/	    r3.z = 1.000000;
/*261*/	  }
/*262*/	} else {
/*263*/	  r3.z = 1.000000;
/*264*/	}
/*265*/	r3.w = cb1.data[34].w + -1.000000;
/*266*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*267*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*268*/	if(floatBitsToUint(r2.w) == 0u) {
/*269*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*270*/	  r2.w = floatBitsToInt(r2.w);
/*271*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*272*/	  if(floatBitsToUint(r2.w) != 0u) {
/*273*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*274*/	    r5.w = vsOut_T0.w;
/*275*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*276*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*277*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*278*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*279*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*280*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*281*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*282*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*283*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*284*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*285*/	    if(floatBitsToUint(r5.w) == 0u) {
/*286*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*287*/	      r6.xy = floor((r5.xyxx).xy);
/*288*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*289*/	      r2.w = -0.000400 / r2.w;
/*290*/	      r2.w = r2.w + r5.z;
/*291*/	      r7.z = -r7.y + 1.000000;
/*292*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*293*/	      r7.w = -r7.y;
/*294*/	      r9.x = cb1.data[0].z/**/;
/*295*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*296*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*297*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*298*/	      r9.w = -cb1.data[0].w/**/;
/*299*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*300*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*301*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*302*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*303*/	      r7.x = r8.x;
/*304*/	      r7.y = r10.x;
/*305*/	      r7.z = r9.x;
/*306*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*307*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*308*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*309*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*310*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*311*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*312*/	      r2.w = -r5.x + r5.z;
/*313*/	      r2.w = r5.y * r2.w + r5.x;
/*314*/	    } else {
/*315*/	      r2.w = 1.000000;
/*316*/	    }
/*317*/	  } else {
/*318*/	    r2.w = 1.000000;
/*319*/	  }
/*320*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*321*/	  r5.y = r5.x * cb1.data[34].x;
/*322*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*323*/	  r5.x = r1.w + -r5.x;
/*324*/	  r5.x = saturate(r5.x / r5.y);
/*325*/	  r2.w = -r3.z + r2.w;
/*326*/	  r3.z = r5.x * r2.w + r3.z;
/*327*/	}
/*328*/	if(floatBitsToUint(r3.w) != 0u) {
/*329*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*330*/	  r3.w = r2.w * cb1.data[34].y;
/*331*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*332*/	  r2.w = r1.w + -r2.w;
/*333*/	  r2.w = saturate(r2.w / r3.w);
/*334*/	  r3.x = -r3.z + 1.000000;
/*335*/	  r3.z = r2.w * r3.x + r3.z;
/*336*/	}
/*337*/	r3.z = saturate(r3.z);
/*338*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*339*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*340*/	r2.w = inversesqrt(r2.w);
/*341*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*342*/	r2.w = -r3.y + 1.000000;
/*343*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*344*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*345*/	r3.w = r3.w + r3.w;
/*346*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*347*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*348*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*349*/	r3.w = cos((r8.x));
/*350*/	r3.w = inversesqrt(r3.w);
/*351*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*352*/	r5.w = saturate(r0.w * 60.000000);
/*353*/	r5.w = -r0.w + r5.w;
/*354*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*355*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*356*/	r6.w = inversesqrt(r6.w);
/*357*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*358*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*359*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*360*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*361*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*362*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*363*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*364*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*365*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*366*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*367*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*368*/	r6.w = -r0.w + 1.000000;
/*369*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*370*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*371*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*372*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*373*/	  r6.w = max(r6.w, 0.000000);
/*374*/	  r6.w = log2(r6.w);
/*375*/	  r6.w = r6.w * 10.000000;
/*376*/	  r6.w = exp2(r6.w);
/*377*/	  r6.w = r3.w * r6.w;
/*378*/	  r6.w = r6.w * r5.w + r0.w;
/*379*/	  r7.y = r2.w * 8.000000;
/*380*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*381*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*382*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*383*/	}
/*384*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*385*/	r7.y = max(r6.w, 0.000000);
/*386*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*387*/	if(floatBitsToUint(r6.w) != 0u) {
/*388*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*389*/	  r6.x = max(r6.x, -1.000000);
/*390*/	  r6.x = min(r6.x, 1.000000);
/*391*/	  r6.y = -abs(r6.x) + 1.000000;
/*392*/	  r6.y = sqrt(r6.y);
/*393*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*394*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*395*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*396*/	  r6.w = r6.y * r6.z;
/*397*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*398*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*399*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*400*/	  r6.x = r6.z * r6.y + r6.x;
/*401*/	  r3.y = r3.y * r3.y;
/*402*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*403*/	  r3.x = r3.y * r3.x + r7.x;
/*404*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*405*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*406*/	  r3.y = -r3.x * r3.x + 1.000000;
/*407*/	  r3.y = max(r3.y, 0.001000);
/*408*/	  r3.y = log2(r3.y);
/*409*/	  r6.y = r3.y * 4.950617;
/*410*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*411*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*412*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*413*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*414*/	  r3.x = floatBitsToInt(r3.x);
/*415*/	  r6.y = r3.y * r3.y + -r6.y;
/*416*/	  r6.y = sqrt(r6.y);
/*417*/	  r3.y = -r3.y + r6.y;
/*418*/	  r3.y = max(r3.y, 0.000000);
/*419*/	  r3.y = sqrt(r3.y);
/*420*/	  r3.x = r3.y * r3.x;
/*421*/	  r3.x = r3.x * 1.414214;
/*422*/	  r3.x = 0.008727 / r3.x;
/*423*/	  r3.x = max(r3.x, 0.000100);
/*424*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*425*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*426*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*427*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*428*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*429*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*430*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*431*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*432*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*433*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*434*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*435*/	  r3.x = floatBitsToInt(r3.x);
/*436*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*437*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*438*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*439*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*440*/	  r3.x = r3.x * r6.x + 1.000000;
/*441*/	  r3.x = r3.x * 0.500000;
/*442*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*443*/	  r3.y = r3.y * r6.y + 1.000000;
/*444*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*445*/	  r3.y = min(r7.y, 1.000000);
/*446*/	  r2.w = r2.w * 1.570796;
/*447*/	  r2.w = sin(r2.w);
/*448*/	  r3.y = r3.y + -1.000000;
/*449*/	  r2.w = r2.w * r3.y + 1.000000;
/*450*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*451*/	  r3.y = max(r3.y, 0.000000);
/*452*/	  r3.y = log2(r3.y);
/*453*/	  r3.y = r3.y * 10.000000;
/*454*/	  r3.y = exp2(r3.y);
/*455*/	  r3.y = r3.w * r3.y;
/*456*/	  r3.y = r3.y * r5.w + r0.w;
/*457*/	  r2.w = r2.w * abs(r3.x);
/*458*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*459*/	} else {
/*460*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*461*/	}
/*462*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*463*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*464*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*465*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*466*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*467*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*468*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*469*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*470*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*471*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*472*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*473*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*474*/	r2.w = inversesqrt(r2.w);
/*475*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*476*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*477*/	r2.w = r2.w + r2.w;
/*478*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*479*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*480*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*481*/	r0.x = max(r0.x, 0.000000);
/*482*/	r0.x = log2(r0.x);
/*483*/	r0.x = r0.x * 10.000000;
/*484*/	r0.x = exp2(r0.x);
/*485*/	r0.x = r3.w * r0.x;
/*486*/	r0.x = r0.x * r5.w + r0.w;
/*487*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*488*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*489*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*490*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*491*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*492*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*493*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*494*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*495*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*496*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*497*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*498*/	if(r0.x != 0) discard;
/*499*/	color1.x = 1.000000;
/*500*/	return;
}
