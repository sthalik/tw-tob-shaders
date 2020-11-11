//
//
// Shader Model 4
// Fragment Shader
//
// id: 5077 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*73*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*74*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*75*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*76*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*77*/	r2.w = r5.w * r6.w;
/*78*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*79*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*80*/	r1.xy = (r3.zwzz * r5.wwww + r1.xyxx).xy;
/*81*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*82*/	r3.z = inversesqrt(r3.z);
/*83*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*84*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*85*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*86*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*87*/	r5.x = 0;
/*88*/	r5.y = cb0.data[26].x * 0.050000;
/*89*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*90*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*91*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*92*/	r2.w = saturate(r5.x * 5.000000);
/*93*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*94*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*95*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*96*/	r3.z = log2(r6.z);
/*97*/	r3.z = r3.z * 1.800000;
/*98*/	r3.z = exp2(r3.z);
/*99*/	r3.z = r3.z * 10.000000;
/*100*/	r3.z = min(r3.z, 1.000000);
/*101*/	r2.w = r2.w + r3.z;
/*102*/	r2.w = r2.w * 0.500000;
/*103*/	r3.z = -r6.w + 1.000000;
/*104*/	r3.z = log2(r3.z);
/*105*/	r3.z = r3.z * vsOut_T7.x;
/*106*/	r3.z = exp2(r3.z);
/*107*/	r3.z = min(r3.z, 1.000000);
/*108*/	r3.z = r3.z * vsOut_T7.x;
/*109*/	r3.w = r6.z * 0.250000;
/*110*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*111*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*112*/	r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*113*/	r0.xyw = (r3.zzzz * r5.xyxz + r0.xyxw).xyw;
/*114*/	r2.w = vsOut_T7.x + -0.025000;
/*115*/	r2.w = max(r2.w, 0.000000);
/*116*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*117*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*118*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*119*/	r2.w = inversesqrt(r2.w);
/*120*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*121*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*122*/	r2.w = inversesqrt(r2.w);
/*123*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*124*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*125*/	r2.w = inversesqrt(r2.w);
/*126*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*127*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*128*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*129*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*130*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*131*/	r2.w = inversesqrt(r2.w);
/*132*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*133*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*134*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*135*/	if(floatBitsToUint(r0.z) != 0u) {
/*136*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*137*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*138*/	  r0.z = r3.w * cb0.data[26].x;
/*139*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*140*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*141*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*142*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*143*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*144*/	}
/*145*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*146*/	if(floatBitsToUint(r0.z) != 0u) {
/*147*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*148*/	  if(floatBitsToUint(r0.z) != 0u) {
/*149*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*150*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*151*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*152*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*153*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*154*/	    r0.z = -r0.z + 1.000000;
/*155*/	    r0.z = max(r0.z, 0.000000);
/*156*/	    r9.z = sqrt(r0.z);
/*157*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*158*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*159*/	    r0.z = inversesqrt(r0.z);
/*160*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*161*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*162*/	    r11.y = -1.000000;
/*163*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*164*/	    r0.z = inversesqrt(r0.z);
/*165*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*166*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*167*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*168*/	    r2.w = r2.w * 1.250000;
/*169*/	    r2.w = min(r2.w, 1.000000);
/*170*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*171*/	    r3.z = r3.z * 4.000000;
/*172*/	    r2.w = r2.w * 0.200000 + r3.z;
/*173*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*174*/	    r0.z = r0.z + -r2.w;
/*175*/	    r0.z = saturate(r0.z * 200.000000);
/*176*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*177*/	    r0.z = r0.z * r0.z;
/*178*/	    r0.z = r0.z * r2.w;
/*179*/	    r3.y = r0.z * -r3.y + r3.y;
/*180*/	    r2.w = -r3.x + 0.200000;
/*181*/	    r3.x = r0.z * r2.w + r3.x;
/*182*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*183*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*184*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*185*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*186*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*187*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*188*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*189*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*190*/	    r2.w = -r2.w + 1.000000;
/*191*/	    r2.w = max(r2.w, 0.000000);
/*192*/	    r8.z = sqrt(r2.w);
/*193*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*194*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*195*/	    r2.w = sqrt(r2.w);
/*196*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*197*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*198*/	    r2.w = inversesqrt(r2.w);
/*199*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*200*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*201*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*202*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*203*/	    r2.w = -r1.y + 1.000000;
/*204*/	    r0.z = min(r0.z, r2.w);
/*205*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*206*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*207*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*208*/	    r0.z = inversesqrt(r0.z);
/*209*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*210*/	  }
/*211*/	}
/*212*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*213*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*214*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*215*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*216*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*217*/	r3.xzw = (-r0.xxyw + r2.wwww).xzw;
/*218*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*219*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*220*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*221*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*222*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*223*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*224*/	r2.w = inversesqrt(r2.w);
/*225*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*226*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*227*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*228*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*229*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*230*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*231*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*232*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*233*/	r3.x = intBitsToFloat(int(r2.w));
/*234*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*235*/	if(floatBitsToUint(r3.z) != 0u) {
/*236*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*237*/	  r5.w = vsOut_T0.w;
/*238*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*239*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*240*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*241*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*242*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*243*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*244*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*245*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*246*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*247*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*248*/	  if(floatBitsToUint(r3.w) == 0u) {
/*249*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*250*/	    r7.xy = floor((r6.xyxx).xy);
/*251*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*252*/	    r3.z = -0.000400 / r3.z;
/*253*/	    r3.z = r3.z + r6.z;
/*254*/	    r8.z = -r8.y + 1.000000;
/*255*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*256*/	    r8.w = -r8.y;
/*257*/	    r10.x = cb1.data[0].z/**/;
/*258*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*259*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*260*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*261*/	    r10.w = -cb1.data[0].w/**/;
/*262*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*263*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*264*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*265*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*266*/	    r8.x = r9.x;
/*267*/	    r8.y = r11.x;
/*268*/	    r8.z = r10.x;
/*269*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*270*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*271*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*272*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*273*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*274*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*275*/	    r3.z = -r6.x + r6.y;
/*276*/	    r3.z = r3.w * r3.z + r6.x;
/*277*/	  } else {
/*278*/	    r3.z = 1.000000;
/*279*/	  }
/*280*/	} else {
/*281*/	  r3.z = 1.000000;
/*282*/	}
/*283*/	r3.w = cb1.data[34].w + -1.000000;
/*284*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*285*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*286*/	if(floatBitsToUint(r2.w) == 0u) {
/*287*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*288*/	  r2.w = floatBitsToInt(r2.w);
/*289*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*290*/	  if(floatBitsToUint(r2.w) != 0u) {
/*291*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*292*/	    r5.w = vsOut_T0.w;
/*293*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*294*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*295*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*296*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*297*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*298*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*299*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*300*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*301*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*302*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*303*/	    if(floatBitsToUint(r5.w) == 0u) {
/*304*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*305*/	      r6.xy = floor((r5.xyxx).xy);
/*306*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*307*/	      r2.w = -0.000400 / r2.w;
/*308*/	      r2.w = r2.w + r5.z;
/*309*/	      r7.z = -r7.y + 1.000000;
/*310*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*311*/	      r7.w = -r7.y;
/*312*/	      r9.x = cb1.data[0].z/**/;
/*313*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*314*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*315*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*316*/	      r9.w = -cb1.data[0].w/**/;
/*317*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*318*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*319*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*320*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*321*/	      r7.x = r8.x;
/*322*/	      r7.y = r10.x;
/*323*/	      r7.z = r9.x;
/*324*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*325*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*326*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*327*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*328*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*329*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*330*/	      r2.w = -r5.x + r5.z;
/*331*/	      r2.w = r5.y * r2.w + r5.x;
/*332*/	    } else {
/*333*/	      r2.w = 1.000000;
/*334*/	    }
/*335*/	  } else {
/*336*/	    r2.w = 1.000000;
/*337*/	  }
/*338*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*339*/	  r5.y = r5.x * cb1.data[34].x;
/*340*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*341*/	  r5.x = r1.w + -r5.x;
/*342*/	  r5.x = saturate(r5.x / r5.y);
/*343*/	  r2.w = -r3.z + r2.w;
/*344*/	  r3.z = r5.x * r2.w + r3.z;
/*345*/	}
/*346*/	if(floatBitsToUint(r3.w) != 0u) {
/*347*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*348*/	  r3.w = r2.w * cb1.data[34].y;
/*349*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*350*/	  r2.w = r1.w + -r2.w;
/*351*/	  r2.w = saturate(r2.w / r3.w);
/*352*/	  r3.x = -r3.z + 1.000000;
/*353*/	  r3.z = r2.w * r3.x + r3.z;
/*354*/	}
/*355*/	r3.z = saturate(r3.z);
/*356*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*357*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*358*/	r2.w = inversesqrt(r2.w);
/*359*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*360*/	r2.w = -r3.y + 1.000000;
/*361*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*362*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*363*/	r3.w = r3.w + r3.w;
/*364*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*365*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*366*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*367*/	r3.w = cos((r8.x));
/*368*/	r3.w = inversesqrt(r3.w);
/*369*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*370*/	r5.w = saturate(r0.z * 60.000000);
/*371*/	r5.w = -r0.z + r5.w;
/*372*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*373*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*374*/	r6.w = inversesqrt(r6.w);
/*375*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*376*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*377*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*378*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*379*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*380*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*381*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*382*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*383*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*384*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*385*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*386*/	r6.w = -r0.z + 1.000000;
/*387*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*388*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*389*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*390*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*391*/	  r6.w = max(r6.w, 0.000000);
/*392*/	  r6.w = log2(r6.w);
/*393*/	  r6.w = r6.w * 10.000000;
/*394*/	  r6.w = exp2(r6.w);
/*395*/	  r6.w = r3.w * r6.w;
/*396*/	  r6.w = r6.w * r5.w + r0.z;
/*397*/	  r7.y = r2.w * 8.000000;
/*398*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*399*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*400*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*401*/	}
/*402*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*403*/	r7.y = max(r6.w, 0.000000);
/*404*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*405*/	if(floatBitsToUint(r6.w) != 0u) {
/*406*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*407*/	  r6.x = max(r6.x, -1.000000);
/*408*/	  r6.x = min(r6.x, 1.000000);
/*409*/	  r6.y = -abs(r6.x) + 1.000000;
/*410*/	  r6.y = sqrt(r6.y);
/*411*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*412*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*413*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*414*/	  r6.w = r6.y * r6.z;
/*415*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*416*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*417*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*418*/	  r6.x = r6.z * r6.y + r6.x;
/*419*/	  r3.y = r3.y * r3.y;
/*420*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*421*/	  r3.x = r3.y * r3.x + r7.x;
/*422*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*423*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*424*/	  r3.y = -r3.x * r3.x + 1.000000;
/*425*/	  r3.y = max(r3.y, 0.001000);
/*426*/	  r3.y = log2(r3.y);
/*427*/	  r6.y = r3.y * 4.950617;
/*428*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*429*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*430*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*431*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*432*/	  r3.x = floatBitsToInt(r3.x);
/*433*/	  r6.y = r3.y * r3.y + -r6.y;
/*434*/	  r6.y = sqrt(r6.y);
/*435*/	  r3.y = -r3.y + r6.y;
/*436*/	  r3.y = max(r3.y, 0.000000);
/*437*/	  r3.y = sqrt(r3.y);
/*438*/	  r3.x = r3.y * r3.x;
/*439*/	  r3.x = r3.x * 1.414214;
/*440*/	  r3.x = 0.008727 / r3.x;
/*441*/	  r3.x = max(r3.x, 0.000100);
/*442*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*443*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*444*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*445*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*446*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*447*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*448*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*449*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*450*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*451*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*452*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*453*/	  r3.x = floatBitsToInt(r3.x);
/*454*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*455*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*456*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*457*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*458*/	  r3.x = r3.x * r6.x + 1.000000;
/*459*/	  r3.x = r3.x * 0.500000;
/*460*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*461*/	  r3.y = r3.y * r6.y + 1.000000;
/*462*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*463*/	  r3.y = min(r7.y, 1.000000);
/*464*/	  r2.w = r2.w * 1.570796;
/*465*/	  r2.w = sin(r2.w);
/*466*/	  r3.y = r3.y + -1.000000;
/*467*/	  r2.w = r2.w * r3.y + 1.000000;
/*468*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*469*/	  r3.y = max(r3.y, 0.000000);
/*470*/	  r3.y = log2(r3.y);
/*471*/	  r3.y = r3.y * 10.000000;
/*472*/	  r3.y = exp2(r3.y);
/*473*/	  r3.y = r3.w * r3.y;
/*474*/	  r3.y = r3.y * r5.w + r0.z;
/*475*/	  r2.w = r2.w * abs(r3.x);
/*476*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*477*/	} else {
/*478*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*479*/	}
/*480*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*481*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*482*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*483*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*484*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*485*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*486*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*487*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*488*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*489*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*490*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*491*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*492*/	r2.w = inversesqrt(r2.w);
/*493*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*494*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*495*/	r2.w = r2.w + r2.w;
/*496*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*497*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*498*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*499*/	r1.x = max(r1.x, 0.000000);
/*500*/	r1.x = log2(r1.x);
/*501*/	r1.x = r1.x * 10.000000;
/*502*/	r1.x = exp2(r1.x);
/*503*/	r1.x = r3.w * r1.x;
/*504*/	r0.z = r1.x * r5.w + r0.z;
/*505*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*506*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*507*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*508*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*509*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*510*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*511*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*512*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*513*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*514*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*515*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*516*/	if(r0.x != 0) discard;
/*517*/	color1.x = 1.000000;
/*518*/	return;
}
