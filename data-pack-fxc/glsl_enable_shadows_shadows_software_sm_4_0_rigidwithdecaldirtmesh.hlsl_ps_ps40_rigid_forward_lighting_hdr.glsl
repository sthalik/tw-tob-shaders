//
//
// Shader Model 4
// Fragment Shader
//
// id: 4955 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*86*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*87*/	r2.w = inversesqrt(r2.w);
/*88*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*89*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*90*/	r2.w = inversesqrt(r2.w);
/*91*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*92*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*93*/	r2.w = inversesqrt(r2.w);
/*94*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*95*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*96*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*97*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*98*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*99*/	r2.w = inversesqrt(r2.w);
/*100*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*101*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*102*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*103*/	if(floatBitsToUint(r0.z) != 0u) {
/*104*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*105*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*106*/	  r0.z = r3.w * cb0.data[26].x;
/*107*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*108*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*109*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*110*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*111*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*112*/	}
/*113*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*114*/	if(floatBitsToUint(r0.z) != 0u) {
/*115*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*116*/	  if(floatBitsToUint(r0.z) != 0u) {
/*117*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*118*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*119*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*120*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*121*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*122*/	    r0.z = -r0.z + 1.000000;
/*123*/	    r0.z = max(r0.z, 0.000000);
/*124*/	    r9.z = sqrt(r0.z);
/*125*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*126*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*127*/	    r0.z = inversesqrt(r0.z);
/*128*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*129*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*130*/	    r11.y = -1.000000;
/*131*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*132*/	    r0.z = inversesqrt(r0.z);
/*133*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*134*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*135*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*136*/	    r2.w = r2.w * 1.250000;
/*137*/	    r2.w = min(r2.w, 1.000000);
/*138*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*139*/	    r3.z = r3.z * 4.000000;
/*140*/	    r2.w = r2.w * 0.200000 + r3.z;
/*141*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*142*/	    r0.z = r0.z + -r2.w;
/*143*/	    r0.z = saturate(r0.z * 200.000000);
/*144*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*145*/	    r0.z = r0.z * r0.z;
/*146*/	    r0.z = r0.z * r2.w;
/*147*/	    r3.y = r0.z * -r3.y + r3.y;
/*148*/	    r2.w = -r3.x + 0.200000;
/*149*/	    r3.x = r0.z * r2.w + r3.x;
/*150*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*151*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*152*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*153*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*154*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*155*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*156*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*157*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*158*/	    r2.w = -r2.w + 1.000000;
/*159*/	    r2.w = max(r2.w, 0.000000);
/*160*/	    r8.z = sqrt(r2.w);
/*161*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*162*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*163*/	    r2.w = sqrt(r2.w);
/*164*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*165*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*166*/	    r2.w = inversesqrt(r2.w);
/*167*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*168*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*169*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*170*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*171*/	    r2.w = -r1.y + 1.000000;
/*172*/	    r0.z = min(r0.z, r2.w);
/*173*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*174*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*175*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*176*/	    r0.z = inversesqrt(r0.z);
/*177*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*178*/	  }
/*179*/	}
/*180*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*181*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*182*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*183*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*184*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*185*/	r3.xzw = (-r0.xxyw + r2.wwww).xzw;
/*186*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*187*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*188*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*189*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*190*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*191*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*192*/	r2.w = inversesqrt(r2.w);
/*193*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*194*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*195*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*196*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*197*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*198*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*199*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*200*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*201*/	r3.x = intBitsToFloat(int(r2.w));
/*202*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*203*/	if(floatBitsToUint(r3.z) != 0u) {
/*204*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*205*/	  r5.w = vsOut_T0.w;
/*206*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*207*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*208*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*209*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*210*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*211*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*212*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*213*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*214*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*215*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*216*/	  if(floatBitsToUint(r3.w) == 0u) {
/*217*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*218*/	    r7.xy = floor((r6.xyxx).xy);
/*219*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*220*/	    r3.z = -0.000400 / r3.z;
/*221*/	    r3.z = r3.z + r6.z;
/*222*/	    r8.z = -r8.y + 1.000000;
/*223*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*224*/	    r8.w = -r8.y;
/*225*/	    r10.x = cb1.data[0].z/**/;
/*226*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*227*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*228*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*229*/	    r10.w = -cb1.data[0].w/**/;
/*230*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*231*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*232*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*233*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*234*/	    r8.x = r9.x;
/*235*/	    r8.y = r11.x;
/*236*/	    r8.z = r10.x;
/*237*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*238*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*239*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*240*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*241*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*242*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*243*/	    r3.z = -r6.x + r6.y;
/*244*/	    r3.z = r3.w * r3.z + r6.x;
/*245*/	  } else {
/*246*/	    r3.z = 1.000000;
/*247*/	  }
/*248*/	} else {
/*249*/	  r3.z = 1.000000;
/*250*/	}
/*251*/	r3.w = cb1.data[34].w + -1.000000;
/*252*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*253*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*254*/	if(floatBitsToUint(r2.w) == 0u) {
/*255*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*256*/	  r2.w = floatBitsToInt(r2.w);
/*257*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*258*/	  if(floatBitsToUint(r2.w) != 0u) {
/*259*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*260*/	    r5.w = vsOut_T0.w;
/*261*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*262*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*263*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*264*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*265*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*266*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*267*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*268*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*269*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*270*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*271*/	    if(floatBitsToUint(r5.w) == 0u) {
/*272*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*273*/	      r6.xy = floor((r5.xyxx).xy);
/*274*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*275*/	      r2.w = -0.000400 / r2.w;
/*276*/	      r2.w = r2.w + r5.z;
/*277*/	      r7.z = -r7.y + 1.000000;
/*278*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*279*/	      r7.w = -r7.y;
/*280*/	      r9.x = cb1.data[0].z/**/;
/*281*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*282*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*283*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*284*/	      r9.w = -cb1.data[0].w/**/;
/*285*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*286*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*287*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*288*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*289*/	      r7.x = r8.x;
/*290*/	      r7.y = r10.x;
/*291*/	      r7.z = r9.x;
/*292*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*293*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*294*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*295*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*296*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*297*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*298*/	      r2.w = -r5.x + r5.z;
/*299*/	      r2.w = r5.y * r2.w + r5.x;
/*300*/	    } else {
/*301*/	      r2.w = 1.000000;
/*302*/	    }
/*303*/	  } else {
/*304*/	    r2.w = 1.000000;
/*305*/	  }
/*306*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*307*/	  r5.y = r5.x * cb1.data[34].x;
/*308*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*309*/	  r5.x = r1.w + -r5.x;
/*310*/	  r5.x = saturate(r5.x / r5.y);
/*311*/	  r2.w = -r3.z + r2.w;
/*312*/	  r3.z = r5.x * r2.w + r3.z;
/*313*/	}
/*314*/	if(floatBitsToUint(r3.w) != 0u) {
/*315*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*316*/	  r3.w = r2.w * cb1.data[34].y;
/*317*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*318*/	  r2.w = r1.w + -r2.w;
/*319*/	  r2.w = saturate(r2.w / r3.w);
/*320*/	  r3.x = -r3.z + 1.000000;
/*321*/	  r3.z = r2.w * r3.x + r3.z;
/*322*/	}
/*323*/	r3.z = saturate(r3.z);
/*324*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*325*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*326*/	r2.w = inversesqrt(r2.w);
/*327*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*328*/	r2.w = -r3.y + 1.000000;
/*329*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*330*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*331*/	r3.w = r3.w + r3.w;
/*332*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*333*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*334*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*335*/	r3.w = cos((r8.x));
/*336*/	r3.w = inversesqrt(r3.w);
/*337*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*338*/	r5.w = saturate(r0.z * 60.000000);
/*339*/	r5.w = -r0.z + r5.w;
/*340*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*341*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*342*/	r6.w = inversesqrt(r6.w);
/*343*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*344*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*345*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*346*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*347*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*348*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*349*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*350*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*351*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*352*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*353*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*354*/	r6.w = -r0.z + 1.000000;
/*355*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*356*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*357*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*358*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*359*/	  r6.w = max(r6.w, 0.000000);
/*360*/	  r6.w = log2(r6.w);
/*361*/	  r6.w = r6.w * 10.000000;
/*362*/	  r6.w = exp2(r6.w);
/*363*/	  r6.w = r3.w * r6.w;
/*364*/	  r6.w = r6.w * r5.w + r0.z;
/*365*/	  r7.y = r2.w * 8.000000;
/*366*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*367*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*368*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*369*/	}
/*370*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*371*/	r7.y = max(r6.w, 0.000000);
/*372*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*373*/	if(floatBitsToUint(r6.w) != 0u) {
/*374*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*375*/	  r6.x = max(r6.x, -1.000000);
/*376*/	  r6.x = min(r6.x, 1.000000);
/*377*/	  r6.y = -abs(r6.x) + 1.000000;
/*378*/	  r6.y = sqrt(r6.y);
/*379*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*380*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*381*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*382*/	  r6.w = r6.y * r6.z;
/*383*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*384*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*385*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*386*/	  r6.x = r6.z * r6.y + r6.x;
/*387*/	  r3.y = r3.y * r3.y;
/*388*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*389*/	  r3.x = r3.y * r3.x + r7.x;
/*390*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*391*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*392*/	  r3.y = -r3.x * r3.x + 1.000000;
/*393*/	  r3.y = max(r3.y, 0.001000);
/*394*/	  r3.y = log2(r3.y);
/*395*/	  r6.y = r3.y * 4.950617;
/*396*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*397*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*398*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*399*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*400*/	  r3.x = floatBitsToInt(r3.x);
/*401*/	  r6.y = r3.y * r3.y + -r6.y;
/*402*/	  r6.y = sqrt(r6.y);
/*403*/	  r3.y = -r3.y + r6.y;
/*404*/	  r3.y = max(r3.y, 0.000000);
/*405*/	  r3.y = sqrt(r3.y);
/*406*/	  r3.x = r3.y * r3.x;
/*407*/	  r3.x = r3.x * 1.414214;
/*408*/	  r3.x = 0.008727 / r3.x;
/*409*/	  r3.x = max(r3.x, 0.000100);
/*410*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*411*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*412*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*413*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*414*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*415*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*416*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*417*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*418*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*419*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*420*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*421*/	  r3.x = floatBitsToInt(r3.x);
/*422*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*423*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*424*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*425*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*426*/	  r3.x = r3.x * r6.x + 1.000000;
/*427*/	  r3.x = r3.x * 0.500000;
/*428*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*429*/	  r3.y = r3.y * r6.y + 1.000000;
/*430*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*431*/	  r3.y = min(r7.y, 1.000000);
/*432*/	  r2.w = r2.w * 1.570796;
/*433*/	  r2.w = sin(r2.w);
/*434*/	  r3.y = r3.y + -1.000000;
/*435*/	  r2.w = r2.w * r3.y + 1.000000;
/*436*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*437*/	  r3.y = max(r3.y, 0.000000);
/*438*/	  r3.y = log2(r3.y);
/*439*/	  r3.y = r3.y * 10.000000;
/*440*/	  r3.y = exp2(r3.y);
/*441*/	  r3.y = r3.w * r3.y;
/*442*/	  r3.y = r3.y * r5.w + r0.z;
/*443*/	  r2.w = r2.w * abs(r3.x);
/*444*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*445*/	} else {
/*446*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*447*/	}
/*448*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*449*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*450*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*451*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*452*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*453*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*454*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*455*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*456*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*457*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*458*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*459*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*460*/	r2.w = inversesqrt(r2.w);
/*461*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*462*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*463*/	r2.w = r2.w + r2.w;
/*464*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*465*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*466*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*467*/	r1.x = max(r1.x, 0.000000);
/*468*/	r1.x = log2(r1.x);
/*469*/	r1.x = r1.x * 10.000000;
/*470*/	r1.x = exp2(r1.x);
/*471*/	r1.x = r3.w * r1.x;
/*472*/	r0.z = r1.x * r5.w + r0.z;
/*473*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*474*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*475*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*476*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*477*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*478*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*479*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*480*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*481*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*482*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*483*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*484*/	if(r0.x != 0) discard;
/*485*/	color1.x = 1.000000;
/*486*/	return;
}
