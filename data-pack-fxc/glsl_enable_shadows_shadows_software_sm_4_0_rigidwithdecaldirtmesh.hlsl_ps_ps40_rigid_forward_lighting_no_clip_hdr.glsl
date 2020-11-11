//
//
// Shader Model 4
// Fragment Shader
//
// id: 4959 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
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
/*40*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*41*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*42*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*43*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*44*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*45*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*46*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*47*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*48*/	r5.z = vsOut_T6.x;
/*49*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*50*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*51*/	if(floatBitsToUint(r2.w) != 0u) {
/*52*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*53*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*54*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*55*/	  r2.w = -r2.w + 1.000000;
/*56*/	  r2.w = max(r2.w, 0.000000);
/*57*/	  r5.z = sqrt(r2.w);
/*58*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*59*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*60*/	  r2.w = r3.x * r8.w;
/*61*/	  r3.x = r2.w * -0.500000 + r3.x;
/*62*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*63*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*64*/	  r2.w = -r6.w * r7.w + 1.000000;
/*65*/	  r0.xyw = (r2.wwww * r0.xyxw + r8.xyxz).xyw;
/*66*/	  r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*67*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*68*/	}
/*69*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*70*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*71*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*72*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*73*/	r2.w = r5.w * r6.w;
/*74*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*75*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*76*/	r1.xy = (r3.zwzz * r5.wwww + r1.xyxx).xy;
/*77*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*78*/	r3.z = inversesqrt(r3.z);
/*79*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*80*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*81*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*82*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*83*/	r2.w = inversesqrt(r2.w);
/*84*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*85*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*86*/	r2.w = inversesqrt(r2.w);
/*87*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*88*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*89*/	r2.w = inversesqrt(r2.w);
/*90*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*91*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*92*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*93*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*94*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*95*/	r2.w = inversesqrt(r2.w);
/*96*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*97*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*98*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*99*/	if(floatBitsToUint(r0.z) != 0u) {
/*100*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*101*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*102*/	  r0.z = r3.w * cb0.data[26].x;
/*103*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*104*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*105*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*106*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*107*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*108*/	}
/*109*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*110*/	if(floatBitsToUint(r0.z) != 0u) {
/*111*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*112*/	  if(floatBitsToUint(r0.z) != 0u) {
/*113*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*114*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*115*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*116*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*117*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*118*/	    r0.z = -r0.z + 1.000000;
/*119*/	    r0.z = max(r0.z, 0.000000);
/*120*/	    r9.z = sqrt(r0.z);
/*121*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*122*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*123*/	    r0.z = inversesqrt(r0.z);
/*124*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*125*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*126*/	    r11.y = -1.000000;
/*127*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*128*/	    r0.z = inversesqrt(r0.z);
/*129*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*130*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*131*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*132*/	    r2.w = r2.w * 1.250000;
/*133*/	    r2.w = min(r2.w, 1.000000);
/*134*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*135*/	    r3.z = r3.z * 4.000000;
/*136*/	    r2.w = r2.w * 0.200000 + r3.z;
/*137*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*138*/	    r0.z = r0.z + -r2.w;
/*139*/	    r0.z = saturate(r0.z * 200.000000);
/*140*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*141*/	    r0.z = r0.z * r0.z;
/*142*/	    r0.z = r0.z * r2.w;
/*143*/	    r3.y = r0.z * -r3.y + r3.y;
/*144*/	    r2.w = -r3.x + 0.200000;
/*145*/	    r3.x = r0.z * r2.w + r3.x;
/*146*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*147*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*148*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*149*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*150*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*151*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*152*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*153*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*154*/	    r2.w = -r2.w + 1.000000;
/*155*/	    r2.w = max(r2.w, 0.000000);
/*156*/	    r8.z = sqrt(r2.w);
/*157*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*158*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*159*/	    r2.w = sqrt(r2.w);
/*160*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*161*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*162*/	    r2.w = inversesqrt(r2.w);
/*163*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*164*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*165*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*166*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*167*/	    r2.w = -r1.y + 1.000000;
/*168*/	    r0.z = min(r0.z, r2.w);
/*169*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*170*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*171*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*172*/	    r0.z = inversesqrt(r0.z);
/*173*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*174*/	  }
/*175*/	}
/*176*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*177*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*178*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*179*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*180*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*181*/	r3.xzw = (-r0.xxyw + r2.wwww).xzw;
/*182*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*183*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*184*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*185*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*186*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*187*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*188*/	r2.w = inversesqrt(r2.w);
/*189*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*190*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*191*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*192*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*193*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*194*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*195*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*196*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*197*/	r3.x = intBitsToFloat(int(r2.w));
/*198*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*199*/	if(floatBitsToUint(r3.z) != 0u) {
/*200*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*201*/	  r5.w = vsOut_T0.w;
/*202*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*203*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*204*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*205*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*206*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*207*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*208*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*209*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*210*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*211*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*212*/	  if(floatBitsToUint(r3.w) == 0u) {
/*213*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*214*/	    r7.xy = floor((r6.xyxx).xy);
/*215*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*216*/	    r3.z = -0.000400 / r3.z;
/*217*/	    r3.z = r3.z + r6.z;
/*218*/	    r8.z = -r8.y + 1.000000;
/*219*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*220*/	    r8.w = -r8.y;
/*221*/	    r10.x = cb1.data[0].z/**/;
/*222*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*223*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*224*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*225*/	    r10.w = -cb1.data[0].w/**/;
/*226*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*227*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*228*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*229*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*230*/	    r8.x = r9.x;
/*231*/	    r8.y = r11.x;
/*232*/	    r8.z = r10.x;
/*233*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*234*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*235*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*236*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*237*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*238*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*239*/	    r3.z = -r6.x + r6.y;
/*240*/	    r3.z = r3.w * r3.z + r6.x;
/*241*/	  } else {
/*242*/	    r3.z = 1.000000;
/*243*/	  }
/*244*/	} else {
/*245*/	  r3.z = 1.000000;
/*246*/	}
/*247*/	r3.w = cb1.data[34].w + -1.000000;
/*248*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*249*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*250*/	if(floatBitsToUint(r2.w) == 0u) {
/*251*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*252*/	  r2.w = floatBitsToInt(r2.w);
/*253*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*254*/	  if(floatBitsToUint(r2.w) != 0u) {
/*255*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*256*/	    r5.w = vsOut_T0.w;
/*257*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*258*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*259*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*260*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*261*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*262*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*263*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*264*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*265*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*266*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*267*/	    if(floatBitsToUint(r5.w) == 0u) {
/*268*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*269*/	      r6.xy = floor((r5.xyxx).xy);
/*270*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*271*/	      r2.w = -0.000400 / r2.w;
/*272*/	      r2.w = r2.w + r5.z;
/*273*/	      r7.z = -r7.y + 1.000000;
/*274*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*275*/	      r7.w = -r7.y;
/*276*/	      r9.x = cb1.data[0].z/**/;
/*277*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*278*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*279*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*280*/	      r9.w = -cb1.data[0].w/**/;
/*281*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*282*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*283*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*284*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*285*/	      r7.x = r8.x;
/*286*/	      r7.y = r10.x;
/*287*/	      r7.z = r9.x;
/*288*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*289*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*290*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*291*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*292*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*293*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*294*/	      r2.w = -r5.x + r5.z;
/*295*/	      r2.w = r5.y * r2.w + r5.x;
/*296*/	    } else {
/*297*/	      r2.w = 1.000000;
/*298*/	    }
/*299*/	  } else {
/*300*/	    r2.w = 1.000000;
/*301*/	  }
/*302*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*303*/	  r5.y = r5.x * cb1.data[34].x;
/*304*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*305*/	  r5.x = r1.w + -r5.x;
/*306*/	  r5.x = saturate(r5.x / r5.y);
/*307*/	  r2.w = -r3.z + r2.w;
/*308*/	  r3.z = r5.x * r2.w + r3.z;
/*309*/	}
/*310*/	if(floatBitsToUint(r3.w) != 0u) {
/*311*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*312*/	  r3.w = r2.w * cb1.data[34].y;
/*313*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*314*/	  r2.w = r1.w + -r2.w;
/*315*/	  r2.w = saturate(r2.w / r3.w);
/*316*/	  r3.x = -r3.z + 1.000000;
/*317*/	  r3.z = r2.w * r3.x + r3.z;
/*318*/	}
/*319*/	r3.z = saturate(r3.z);
/*320*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*321*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*322*/	r2.w = inversesqrt(r2.w);
/*323*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*324*/	r2.w = -r3.y + 1.000000;
/*325*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*326*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*327*/	r3.w = r3.w + r3.w;
/*328*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*329*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*330*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*331*/	r3.w = cos((r8.x));
/*332*/	r3.w = inversesqrt(r3.w);
/*333*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*334*/	r5.w = saturate(r0.z * 60.000000);
/*335*/	r5.w = -r0.z + r5.w;
/*336*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*337*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*338*/	r6.w = inversesqrt(r6.w);
/*339*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*340*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*341*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*342*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*343*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*344*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*345*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*346*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*347*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*348*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*349*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*350*/	r6.w = -r0.z + 1.000000;
/*351*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*352*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*353*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*354*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*355*/	  r6.w = max(r6.w, 0.000000);
/*356*/	  r6.w = log2(r6.w);
/*357*/	  r6.w = r6.w * 10.000000;
/*358*/	  r6.w = exp2(r6.w);
/*359*/	  r6.w = r3.w * r6.w;
/*360*/	  r6.w = r6.w * r5.w + r0.z;
/*361*/	  r7.y = r2.w * 8.000000;
/*362*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*363*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*364*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*365*/	}
/*366*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*367*/	r7.y = max(r6.w, 0.000000);
/*368*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*369*/	if(floatBitsToUint(r6.w) != 0u) {
/*370*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*371*/	  r6.x = max(r6.x, -1.000000);
/*372*/	  r6.x = min(r6.x, 1.000000);
/*373*/	  r6.y = -abs(r6.x) + 1.000000;
/*374*/	  r6.y = sqrt(r6.y);
/*375*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*376*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*377*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*378*/	  r6.w = r6.y * r6.z;
/*379*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*380*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*381*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*382*/	  r6.x = r6.z * r6.y + r6.x;
/*383*/	  r3.y = r3.y * r3.y;
/*384*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*385*/	  r3.x = r3.y * r3.x + r7.x;
/*386*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*387*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*388*/	  r3.y = -r3.x * r3.x + 1.000000;
/*389*/	  r3.y = max(r3.y, 0.001000);
/*390*/	  r3.y = log2(r3.y);
/*391*/	  r6.y = r3.y * 4.950617;
/*392*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*393*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*394*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*395*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*396*/	  r3.x = floatBitsToInt(r3.x);
/*397*/	  r6.y = r3.y * r3.y + -r6.y;
/*398*/	  r6.y = sqrt(r6.y);
/*399*/	  r3.y = -r3.y + r6.y;
/*400*/	  r3.y = max(r3.y, 0.000000);
/*401*/	  r3.y = sqrt(r3.y);
/*402*/	  r3.x = r3.y * r3.x;
/*403*/	  r3.x = r3.x * 1.414214;
/*404*/	  r3.x = 0.008727 / r3.x;
/*405*/	  r3.x = max(r3.x, 0.000100);
/*406*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*407*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*408*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*409*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*410*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*411*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*412*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*413*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*414*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*415*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*416*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*417*/	  r3.x = floatBitsToInt(r3.x);
/*418*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*419*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*420*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*421*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*422*/	  r3.x = r3.x * r6.x + 1.000000;
/*423*/	  r3.x = r3.x * 0.500000;
/*424*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*425*/	  r3.y = r3.y * r6.y + 1.000000;
/*426*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*427*/	  r3.y = min(r7.y, 1.000000);
/*428*/	  r2.w = r2.w * 1.570796;
/*429*/	  r2.w = sin(r2.w);
/*430*/	  r3.y = r3.y + -1.000000;
/*431*/	  r2.w = r2.w * r3.y + 1.000000;
/*432*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*433*/	  r3.y = max(r3.y, 0.000000);
/*434*/	  r3.y = log2(r3.y);
/*435*/	  r3.y = r3.y * 10.000000;
/*436*/	  r3.y = exp2(r3.y);
/*437*/	  r3.y = r3.w * r3.y;
/*438*/	  r3.y = r3.y * r5.w + r0.z;
/*439*/	  r2.w = r2.w * abs(r3.x);
/*440*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*441*/	} else {
/*442*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*443*/	}
/*444*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*445*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*446*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*447*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*448*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*449*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*450*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*451*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*452*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*453*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*454*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*455*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*456*/	r2.w = inversesqrt(r2.w);
/*457*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*458*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*459*/	r2.w = r2.w + r2.w;
/*460*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*461*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*462*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*463*/	r1.x = max(r1.x, 0.000000);
/*464*/	r1.x = log2(r1.x);
/*465*/	r1.x = r1.x * 10.000000;
/*466*/	r1.x = exp2(r1.x);
/*467*/	r1.x = r3.w * r1.x;
/*468*/	r0.z = r1.x * r5.w + r0.z;
/*469*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*470*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*471*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*472*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*473*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*474*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*475*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*476*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*477*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*478*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*479*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*480*/	if(r0.x != 0) discard;
/*481*/	color1.x = 1.000000;
/*482*/	return;
}
