//
//
// Shader Model 4
// Fragment Shader
//
// id: 556 - fxc/glsl_SM_4_0_rigidambientmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
uniform sampler2D s_ambient_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;

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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*17*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*18*/	r0.x = saturate(vsOut_N0.w);
/*19*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb4.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb4.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb4.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb4.data[2].xyxz).xyw;
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
/*41*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*42*/	r5.xyz = (r0.xywx * r4.xyzx).xyz;
/*43*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*44*/	r6.x = 0;
/*45*/	r6.y = cb0.data[26].x * 0.050000;
/*46*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*47*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*48*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*49*/	r1.w = saturate(r6.x * 5.000000);
/*50*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*51*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*52*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*53*/	r2.w = log2(r7.z);
/*54*/	r2.w = r2.w * 1.800000;
/*55*/	r2.w = exp2(r2.w);
/*56*/	r2.w = r2.w * 10.000000;
/*57*/	r2.w = min(r2.w, 1.000000);
/*58*/	r1.w = r1.w + r2.w;
/*59*/	r1.w = r1.w * 0.500000;
/*60*/	r2.w = -r7.w + 1.000000;
/*61*/	r2.w = log2(r2.w);
/*62*/	r2.w = r2.w * vsOut_T7.x;
/*63*/	r2.w = exp2(r2.w);
/*64*/	r2.w = min(r2.w, 1.000000);
/*65*/	r2.w = r2.w * vsOut_T7.x;
/*66*/	r3.z = r7.z * 0.250000;
/*67*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*68*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*69*/	r0.xyw = (-r0.xyxw * r4.xyxz + r6.xyxz).xyw;
/*70*/	r0.xyw = (r2.wwww * r0.xyxw + r5.xyxz).xyw;
/*71*/	r1.w = vsOut_T7.x + -0.025000;
/*72*/	r1.w = max(r1.w, 0.000000);
/*73*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*74*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*75*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*78*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*81*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*82*/	r1.w = inversesqrt(r1.w);
/*83*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*84*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*85*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*86*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*87*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*88*/	r1.w = inversesqrt(r1.w);
/*89*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*90*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*91*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*92*/	if(floatBitsToUint(r0.z) != 0u) {
/*93*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*94*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*95*/	  r0.z = r3.w * cb0.data[26].x;
/*96*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*97*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*98*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*99*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*100*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*101*/	}
/*102*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*103*/	if(floatBitsToUint(r0.z) != 0u) {
/*104*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*105*/	  if(floatBitsToUint(r0.z) != 0u) {
/*106*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*107*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*108*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*109*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*110*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*111*/	    r0.z = -r0.z + 1.000000;
/*112*/	    r0.z = max(r0.z, 0.000000);
/*113*/	    r8.z = sqrt(r0.z);
/*114*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*115*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*116*/	    r0.z = inversesqrt(r0.z);
/*117*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*118*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*119*/	    r10.y = -1.000000;
/*120*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*121*/	    r0.z = inversesqrt(r0.z);
/*122*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*123*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*124*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*125*/	    r1.w = r1.w * 1.250000;
/*126*/	    r1.w = min(r1.w, 1.000000);
/*127*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*128*/	    r2.w = r2.w * 4.000000;
/*129*/	    r1.w = r1.w * 0.200000 + r2.w;
/*130*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*131*/	    r0.z = r0.z + -r1.w;
/*132*/	    r0.z = saturate(r0.z * 200.000000);
/*133*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*134*/	    r0.z = r0.z * r0.z;
/*135*/	    r0.z = r0.z * r1.w;
/*136*/	    r3.x = r0.z * -r3.x + r3.x;
/*137*/	    r1.w = -r3.y + 0.200000;
/*138*/	    r3.y = r0.z * r1.w + r3.y;
/*139*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*140*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*141*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*142*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*143*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*144*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*145*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*146*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*147*/	    r1.w = -r1.w + 1.000000;
/*148*/	    r1.w = max(r1.w, 0.000000);
/*149*/	    r7.z = sqrt(r1.w);
/*150*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*151*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*152*/	    r1.w = sqrt(r1.w);
/*153*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*154*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*155*/	    r1.w = inversesqrt(r1.w);
/*156*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*157*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*158*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*159*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*160*/	    r1.w = -r1.y + 1.000000;
/*161*/	    r0.z = min(r0.z, r1.w);
/*162*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*163*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*164*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*165*/	    r0.z = inversesqrt(r0.z);
/*166*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*167*/	  }
/*168*/	}
/*169*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*170*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*171*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*172*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*173*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*174*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*175*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*176*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*177*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*178*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*179*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*180*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*181*/	r1.w = inversesqrt(r1.w);
/*182*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*183*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*184*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*185*/	r1.w = inversesqrt(r1.w);
/*186*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*187*/	r1.w = -r3.x + 1.000000;
/*188*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*189*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*190*/	r4.x = r4.x + r4.x;
/*191*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*192*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*193*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*194*/	r4.w = cos((r6.x));
/*195*/	r4.w = inversesqrt(r4.w);
/*196*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*197*/	r5.w = saturate(r0.z * 60.000000);
/*198*/	r5.w = -r0.z + r5.w;
/*199*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*200*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*201*/	r7.x = inversesqrt(r7.x);
/*202*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*203*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*204*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*205*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*206*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*207*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*208*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*209*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*210*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*211*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*212*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*213*/	r5.y = -r0.z + 1.000000;
/*214*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*215*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*216*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*217*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*218*/	  r5.y = max(r5.y, 0.000000);
/*219*/	  r5.y = log2(r5.y);
/*220*/	  r5.y = r5.y * 10.000000;
/*221*/	  r5.y = exp2(r5.y);
/*222*/	  r5.y = r4.w * r5.y;
/*223*/	  r5.y = r5.y * r5.w + r0.z;
/*224*/	  r7.x = r1.w * 8.000000;
/*225*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*226*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*227*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*228*/	}
/*229*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*230*/	r7.x = max(r5.y, 0.000000);
/*231*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*232*/	if(floatBitsToUint(r5.y) != 0u) {
/*233*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*234*/	  r4.x = max(r4.x, -1.000000);
/*235*/	  r4.x = min(r4.x, 1.000000);
/*236*/	  r4.y = -abs(r4.x) + 1.000000;
/*237*/	  r4.y = sqrt(r4.y);
/*238*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*239*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*240*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*241*/	  r5.y = r4.y * r4.z;
/*242*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*243*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*244*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*245*/	  r4.x = r4.z * r4.y + r4.x;
/*246*/	  r3.x = r3.x * r3.x;
/*247*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*248*/	  r2.w = r3.x * r2.w + r5.x;
/*249*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*250*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*251*/	  r3.x = -r2.w * r2.w + 1.000000;
/*252*/	  r3.x = max(r3.x, 0.001000);
/*253*/	  r3.x = log2(r3.x);
/*254*/	  r4.y = r3.x * 4.950617;
/*255*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*256*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*257*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*258*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*259*/	  r2.w = floatBitsToInt(r2.w);
/*260*/	  r4.y = r3.x * r3.x + -r4.y;
/*261*/	  r4.y = sqrt(r4.y);
/*262*/	  r3.x = -r3.x + r4.y;
/*263*/	  r3.x = max(r3.x, 0.000000);
/*264*/	  r3.x = sqrt(r3.x);
/*265*/	  r2.w = r2.w * r3.x;
/*266*/	  r2.w = r2.w * 1.414214;
/*267*/	  r2.w = 0.008727 / r2.w;
/*268*/	  r2.w = max(r2.w, 0.000100);
/*269*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*270*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*271*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*272*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*273*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*274*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*275*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*276*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*277*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*278*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*279*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*280*/	  r2.w = floatBitsToInt(r2.w);
/*281*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*282*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*283*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*284*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*285*/	  r2.w = r2.w * r4.x + 1.000000;
/*286*/	  r2.w = r2.w * 0.500000;
/*287*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*288*/	  r3.x = r3.x * r4.y + 1.000000;
/*289*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*290*/	  r3.x = min(r7.x, 1.000000);
/*291*/	  r1.w = r1.w * 1.570796;
/*292*/	  r1.w = sin(r1.w);
/*293*/	  r3.x = r3.x + -1.000000;
/*294*/	  r1.w = r1.w * r3.x + 1.000000;
/*295*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*296*/	  r3.x = max(r3.x, 0.000000);
/*297*/	  r3.x = log2(r3.x);
/*298*/	  r3.x = r3.x * 10.000000;
/*299*/	  r3.x = exp2(r3.x);
/*300*/	  r3.x = r4.w * r3.x;
/*301*/	  r3.x = r3.x * r5.w + r0.z;
/*302*/	  r1.w = r1.w * abs(r2.w);
/*303*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*304*/	} else {
/*305*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*306*/	}
/*307*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*308*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*309*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*310*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*311*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*312*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*313*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*314*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*315*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*316*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*317*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*318*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*319*/	r1.w = inversesqrt(r1.w);
/*320*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*321*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*322*/	r1.w = r1.w + r1.w;
/*323*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*324*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*325*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*326*/	r1.x = max(r1.x, 0.000000);
/*327*/	r1.x = log2(r1.x);
/*328*/	r1.x = r1.x * 10.000000;
/*329*/	r1.x = exp2(r1.x);
/*330*/	r1.x = r4.w * r1.x;
/*331*/	r0.z = r1.x * r5.w + r0.z;
/*332*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*333*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*334*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*335*/	r0.w = 1.000000;
/*336*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*337*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*338*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*339*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*340*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*341*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*342*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*343*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*344*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*345*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*346*/	if(r0.x != 0) discard;
/*347*/	color1.x = 1.000000;
/*348*/	return;
}
