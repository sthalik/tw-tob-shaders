//
//
// Shader Model 4
// Fragment Shader
//
// id: 1173 - fxc/glsl_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r10;
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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb3.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb4.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb4.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb4.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb4.data[2].xyxz).xyw;
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
/*37*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*38*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*39*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*40*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*41*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*42*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*43*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*44*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*45*/	r4.z = vsOut_T6.x;
/*46*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*47*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*48*/	if(floatBitsToUint(r1.w) != 0u) {
/*49*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*50*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*51*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*52*/	  r1.w = -r1.w + 1.000000;
/*53*/	  r1.w = max(r1.w, 0.000000);
/*54*/	  r4.z = sqrt(r1.w);
/*55*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*56*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*57*/	  r1.w = r3.x * r7.w;
/*58*/	  r3.x = r1.w * -0.500000 + r3.x;
/*59*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*60*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*61*/	  r1.w = -r5.w * r6.w + 1.000000;
/*62*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*63*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*64*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*65*/	}
/*66*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*67*/	r4.x = 0;
/*68*/	r4.y = cb0.data[26].x * 0.050000;
/*69*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*70*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*71*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*72*/	r1.w = saturate(r4.x * 5.000000);
/*73*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*74*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*75*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*76*/	r2.w = log2(r5.z);
/*77*/	r2.w = r2.w * 1.800000;
/*78*/	r2.w = exp2(r2.w);
/*79*/	r2.w = r2.w * 10.000000;
/*80*/	r2.w = min(r2.w, 1.000000);
/*81*/	r1.w = r1.w + r2.w;
/*82*/	r1.w = r1.w * 0.500000;
/*83*/	r2.w = -r5.w + 1.000000;
/*84*/	r2.w = log2(r2.w);
/*85*/	r2.w = r2.w * vsOut_T7.x;
/*86*/	r2.w = exp2(r2.w);
/*87*/	r2.w = min(r2.w, 1.000000);
/*88*/	r2.w = r2.w * vsOut_T7.x;
/*89*/	r3.z = r5.z * 0.250000;
/*90*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*91*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*92*/	r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*93*/	r0.xyw = (r2.wwww * r4.xyxz + r0.xyxw).xyw;
/*94*/	r1.w = vsOut_T7.x + -0.025000;
/*95*/	r1.w = max(r1.w, 0.000000);
/*96*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*97*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*98*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*101*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*102*/	r1.w = inversesqrt(r1.w);
/*103*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*104*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*105*/	r1.w = inversesqrt(r1.w);
/*106*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*107*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*108*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*109*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*110*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*111*/	r1.w = inversesqrt(r1.w);
/*112*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*113*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*114*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*115*/	if(floatBitsToUint(r0.z) != 0u) {
/*116*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*117*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*118*/	  r0.z = r3.w * cb0.data[26].x;
/*119*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*120*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*121*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*122*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*123*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*124*/	}
/*125*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*126*/	if(floatBitsToUint(r0.z) != 0u) {
/*127*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*128*/	  if(floatBitsToUint(r0.z) != 0u) {
/*129*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*130*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*131*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*132*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*133*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*134*/	    r0.z = -r0.z + 1.000000;
/*135*/	    r0.z = max(r0.z, 0.000000);
/*136*/	    r8.z = sqrt(r0.z);
/*137*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*138*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*139*/	    r0.z = inversesqrt(r0.z);
/*140*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*141*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*142*/	    r10.y = -1.000000;
/*143*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*144*/	    r0.z = inversesqrt(r0.z);
/*145*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*146*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*147*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*148*/	    r1.w = r1.w * 1.250000;
/*149*/	    r1.w = min(r1.w, 1.000000);
/*150*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*151*/	    r2.w = r2.w * 4.000000;
/*152*/	    r1.w = r1.w * 0.200000 + r2.w;
/*153*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*154*/	    r0.z = r0.z + -r1.w;
/*155*/	    r0.z = saturate(r0.z * 200.000000);
/*156*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*157*/	    r0.z = r0.z * r0.z;
/*158*/	    r0.z = r0.z * r1.w;
/*159*/	    r3.y = r0.z * -r3.y + r3.y;
/*160*/	    r1.w = -r3.x + 0.200000;
/*161*/	    r3.x = r0.z * r1.w + r3.x;
/*162*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*163*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*164*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*165*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*166*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*167*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*168*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*169*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*170*/	    r1.w = -r1.w + 1.000000;
/*171*/	    r1.w = max(r1.w, 0.000000);
/*172*/	    r7.z = sqrt(r1.w);
/*173*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*174*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*175*/	    r1.w = sqrt(r1.w);
/*176*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*177*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*178*/	    r1.w = inversesqrt(r1.w);
/*179*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*180*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*181*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*182*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*183*/	    r1.w = -r1.y + 1.000000;
/*184*/	    r0.z = min(r0.z, r1.w);
/*185*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*186*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*187*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*188*/	    r0.z = inversesqrt(r0.z);
/*189*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*190*/	  }
/*191*/	}
/*192*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*193*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*194*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*195*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*196*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*197*/	r3.xzw = (-r0.xxyw + r1.wwww).xzw;
/*198*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*199*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*200*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*201*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*202*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*203*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*204*/	r1.w = inversesqrt(r1.w);
/*205*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*206*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*207*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*208*/	r1.w = inversesqrt(r1.w);
/*209*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*210*/	r1.w = -r3.y + 1.000000;
/*211*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*212*/	r4.x = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*213*/	r4.x = r4.x + r4.x;
/*214*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*215*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*216*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*217*/	r4.w = cos((r6.x));
/*218*/	r4.w = inversesqrt(r4.w);
/*219*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*220*/	r5.w = saturate(r0.z * 60.000000);
/*221*/	r5.w = -r0.z + r5.w;
/*222*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*223*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*224*/	r7.x = inversesqrt(r7.x);
/*225*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*226*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*227*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*228*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*229*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*230*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*231*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*232*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*233*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*234*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*235*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*236*/	r5.y = -r0.z + 1.000000;
/*237*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*238*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*239*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*240*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*241*/	  r5.y = max(r5.y, 0.000000);
/*242*/	  r5.y = log2(r5.y);
/*243*/	  r5.y = r5.y * 10.000000;
/*244*/	  r5.y = exp2(r5.y);
/*245*/	  r5.y = r4.w * r5.y;
/*246*/	  r5.y = r5.y * r5.w + r0.z;
/*247*/	  r7.x = r1.w * 8.000000;
/*248*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*249*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*250*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*251*/	}
/*252*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*253*/	r7.x = max(r5.y, 0.000000);
/*254*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*255*/	if(floatBitsToUint(r5.y) != 0u) {
/*256*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*257*/	  r4.x = max(r4.x, -1.000000);
/*258*/	  r4.x = min(r4.x, 1.000000);
/*259*/	  r4.y = -abs(r4.x) + 1.000000;
/*260*/	  r4.y = sqrt(r4.y);
/*261*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*262*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*263*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*264*/	  r5.y = r4.y * r4.z;
/*265*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*266*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*267*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*268*/	  r4.x = r4.z * r4.y + r4.x;
/*269*/	  r3.y = r3.y * r3.y;
/*270*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*271*/	  r2.w = r3.y * r2.w + r5.x;
/*272*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*273*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*274*/	  r3.y = -r2.w * r2.w + 1.000000;
/*275*/	  r3.y = max(r3.y, 0.001000);
/*276*/	  r3.y = log2(r3.y);
/*277*/	  r4.y = r3.y * 4.950617;
/*278*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*279*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*280*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*281*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*282*/	  r2.w = floatBitsToInt(r2.w);
/*283*/	  r4.y = r3.y * r3.y + -r4.y;
/*284*/	  r4.y = sqrt(r4.y);
/*285*/	  r3.y = -r3.y + r4.y;
/*286*/	  r3.y = max(r3.y, 0.000000);
/*287*/	  r3.y = sqrt(r3.y);
/*288*/	  r2.w = r2.w * r3.y;
/*289*/	  r2.w = r2.w * 1.414214;
/*290*/	  r2.w = 0.008727 / r2.w;
/*291*/	  r2.w = max(r2.w, 0.000100);
/*292*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*293*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*294*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*295*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*296*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*297*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*298*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*299*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*300*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*301*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*302*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*303*/	  r2.w = floatBitsToInt(r2.w);
/*304*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*305*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*306*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*307*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*308*/	  r2.w = r2.w * r4.x + 1.000000;
/*309*/	  r2.w = r2.w * 0.500000;
/*310*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*311*/	  r3.y = r3.y * r4.y + 1.000000;
/*312*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*313*/	  r3.y = min(r7.x, 1.000000);
/*314*/	  r1.w = r1.w * 1.570796;
/*315*/	  r1.w = sin(r1.w);
/*316*/	  r3.y = r3.y + -1.000000;
/*317*/	  r1.w = r1.w * r3.y + 1.000000;
/*318*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*319*/	  r3.x = max(r3.x, 0.000000);
/*320*/	  r3.x = log2(r3.x);
/*321*/	  r3.x = r3.x * 10.000000;
/*322*/	  r3.x = exp2(r3.x);
/*323*/	  r3.x = r4.w * r3.x;
/*324*/	  r3.x = r3.x * r5.w + r0.z;
/*325*/	  r1.w = r1.w * abs(r2.w);
/*326*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*327*/	} else {
/*328*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*329*/	}
/*330*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*331*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*332*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*333*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*334*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*335*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*336*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*337*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*338*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*339*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*340*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*341*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*342*/	r1.w = inversesqrt(r1.w);
/*343*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*344*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*345*/	r1.w = r1.w + r1.w;
/*346*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*347*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*348*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*349*/	r1.x = max(r1.x, 0.000000);
/*350*/	r1.x = log2(r1.x);
/*351*/	r1.x = r1.x * 10.000000;
/*352*/	r1.x = exp2(r1.x);
/*353*/	r1.x = r4.w * r1.x;
/*354*/	r0.z = r1.x * r5.w + r0.z;
/*355*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*356*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*357*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*358*/	r0.w = 1.000000;
/*359*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*360*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*361*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*362*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*363*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*364*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*365*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*366*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*367*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*368*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*369*/	if(r0.x != 0) discard;
/*370*/	color1.x = 1.000000;
/*371*/	return;
}
