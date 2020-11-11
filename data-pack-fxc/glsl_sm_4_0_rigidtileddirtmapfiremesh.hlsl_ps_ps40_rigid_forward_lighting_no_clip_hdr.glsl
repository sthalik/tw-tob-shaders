//
//
// Shader Model 4
// Fragment Shader
//
// id: 878 - fxc/glsl_SM_4_0_rigidtileddirtmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
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
/*37*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
/*38*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*39*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*40*/	r1.w = r4.w + -1.000000;
/*41*/	r1.w = r5.x * r1.w + 1.000000;
/*42*/	r1.w = saturate(r1.w * r5.x);
/*43*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*44*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*45*/	r5.xyz = (r0.xywx * r4.xyzx).xyz;
/*46*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*47*/	r6.x = 0;
/*48*/	r6.y = cb0.data[26].x * 0.050000;
/*49*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*50*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*51*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*52*/	r1.w = saturate(r6.x * 5.000000);
/*53*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*54*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*55*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*56*/	r2.w = log2(r7.z);
/*57*/	r2.w = r2.w * 1.800000;
/*58*/	r2.w = exp2(r2.w);
/*59*/	r2.w = r2.w * 10.000000;
/*60*/	r2.w = min(r2.w, 1.000000);
/*61*/	r1.w = r1.w + r2.w;
/*62*/	r1.w = r1.w * 0.500000;
/*63*/	r2.w = -r7.w + 1.000000;
/*64*/	r2.w = log2(r2.w);
/*65*/	r2.w = r2.w * vsOut_T7.x;
/*66*/	r2.w = exp2(r2.w);
/*67*/	r2.w = min(r2.w, 1.000000);
/*68*/	r2.w = r2.w * vsOut_T7.x;
/*69*/	r3.z = r7.z * 0.250000;
/*70*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*71*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*72*/	r0.xyw = (-r0.xyxw * r4.xyxz + r6.xyxz).xyw;
/*73*/	r0.xyw = (r2.wwww * r0.xyxw + r5.xyxz).xyw;
/*74*/	r1.w = vsOut_T7.x + -0.025000;
/*75*/	r1.w = max(r1.w, 0.000000);
/*76*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*77*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*78*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*81*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*82*/	r1.w = inversesqrt(r1.w);
/*83*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*84*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*87*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*88*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*89*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*90*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*93*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*94*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*95*/	if(floatBitsToUint(r0.z) != 0u) {
/*96*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*97*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*98*/	  r0.z = r3.w * cb0.data[26].x;
/*99*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*100*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*101*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*102*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*103*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*104*/	}
/*105*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*106*/	if(floatBitsToUint(r0.z) != 0u) {
/*107*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*108*/	  if(floatBitsToUint(r0.z) != 0u) {
/*109*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*110*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*111*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*112*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*113*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*114*/	    r0.z = -r0.z + 1.000000;
/*115*/	    r0.z = max(r0.z, 0.000000);
/*116*/	    r8.z = sqrt(r0.z);
/*117*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*118*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*119*/	    r0.z = inversesqrt(r0.z);
/*120*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*121*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*122*/	    r10.y = -1.000000;
/*123*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*124*/	    r0.z = inversesqrt(r0.z);
/*125*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*126*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*127*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*128*/	    r1.w = r1.w * 1.250000;
/*129*/	    r1.w = min(r1.w, 1.000000);
/*130*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*131*/	    r2.w = r2.w * 4.000000;
/*132*/	    r1.w = r1.w * 0.200000 + r2.w;
/*133*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*134*/	    r0.z = r0.z + -r1.w;
/*135*/	    r0.z = saturate(r0.z * 200.000000);
/*136*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*137*/	    r0.z = r0.z * r0.z;
/*138*/	    r0.z = r0.z * r1.w;
/*139*/	    r3.x = r0.z * -r3.x + r3.x;
/*140*/	    r1.w = -r3.y + 0.200000;
/*141*/	    r3.y = r0.z * r1.w + r3.y;
/*142*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*143*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*144*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*145*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*146*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*147*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*148*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*149*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*150*/	    r1.w = -r1.w + 1.000000;
/*151*/	    r1.w = max(r1.w, 0.000000);
/*152*/	    r7.z = sqrt(r1.w);
/*153*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*154*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*155*/	    r1.w = sqrt(r1.w);
/*156*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*157*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*158*/	    r1.w = inversesqrt(r1.w);
/*159*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*160*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*161*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*162*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*163*/	    r1.w = -r1.y + 1.000000;
/*164*/	    r0.z = min(r0.z, r1.w);
/*165*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*166*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*167*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*168*/	    r0.z = inversesqrt(r0.z);
/*169*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*170*/	  }
/*171*/	}
/*172*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*173*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*174*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*175*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*176*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*177*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*178*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*179*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*180*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*181*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*182*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*183*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*184*/	r1.w = inversesqrt(r1.w);
/*185*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*186*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*187*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*188*/	r1.w = inversesqrt(r1.w);
/*189*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*190*/	r1.w = -r3.x + 1.000000;
/*191*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*192*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*193*/	r4.x = r4.x + r4.x;
/*194*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*195*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*196*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*197*/	r4.w = cos((r6.x));
/*198*/	r4.w = inversesqrt(r4.w);
/*199*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*200*/	r5.w = saturate(r0.z * 60.000000);
/*201*/	r5.w = -r0.z + r5.w;
/*202*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*203*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*204*/	r7.x = inversesqrt(r7.x);
/*205*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*206*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*207*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*208*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*209*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*210*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*211*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*212*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*213*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*214*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*215*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*216*/	r5.y = -r0.z + 1.000000;
/*217*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*218*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*219*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*220*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*221*/	  r5.y = max(r5.y, 0.000000);
/*222*/	  r5.y = log2(r5.y);
/*223*/	  r5.y = r5.y * 10.000000;
/*224*/	  r5.y = exp2(r5.y);
/*225*/	  r5.y = r4.w * r5.y;
/*226*/	  r5.y = r5.y * r5.w + r0.z;
/*227*/	  r7.x = r1.w * 8.000000;
/*228*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*229*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*230*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*231*/	}
/*232*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*233*/	r7.x = max(r5.y, 0.000000);
/*234*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*235*/	if(floatBitsToUint(r5.y) != 0u) {
/*236*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*237*/	  r4.x = max(r4.x, -1.000000);
/*238*/	  r4.x = min(r4.x, 1.000000);
/*239*/	  r4.y = -abs(r4.x) + 1.000000;
/*240*/	  r4.y = sqrt(r4.y);
/*241*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*242*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*243*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*244*/	  r5.y = r4.y * r4.z;
/*245*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*246*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*247*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*248*/	  r4.x = r4.z * r4.y + r4.x;
/*249*/	  r3.x = r3.x * r3.x;
/*250*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*251*/	  r2.w = r3.x * r2.w + r5.x;
/*252*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*253*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*254*/	  r3.x = -r2.w * r2.w + 1.000000;
/*255*/	  r3.x = max(r3.x, 0.001000);
/*256*/	  r3.x = log2(r3.x);
/*257*/	  r4.y = r3.x * 4.950617;
/*258*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*259*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*260*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*261*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*262*/	  r2.w = floatBitsToInt(r2.w);
/*263*/	  r4.y = r3.x * r3.x + -r4.y;
/*264*/	  r4.y = sqrt(r4.y);
/*265*/	  r3.x = -r3.x + r4.y;
/*266*/	  r3.x = max(r3.x, 0.000000);
/*267*/	  r3.x = sqrt(r3.x);
/*268*/	  r2.w = r2.w * r3.x;
/*269*/	  r2.w = r2.w * 1.414214;
/*270*/	  r2.w = 0.008727 / r2.w;
/*271*/	  r2.w = max(r2.w, 0.000100);
/*272*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*273*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*274*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*275*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*276*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*277*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*278*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*279*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*280*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*281*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*282*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*283*/	  r2.w = floatBitsToInt(r2.w);
/*284*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*285*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*286*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*287*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*288*/	  r2.w = r2.w * r4.x + 1.000000;
/*289*/	  r2.w = r2.w * 0.500000;
/*290*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*291*/	  r3.x = r3.x * r4.y + 1.000000;
/*292*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*293*/	  r3.x = min(r7.x, 1.000000);
/*294*/	  r1.w = r1.w * 1.570796;
/*295*/	  r1.w = sin(r1.w);
/*296*/	  r3.x = r3.x + -1.000000;
/*297*/	  r1.w = r1.w * r3.x + 1.000000;
/*298*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*299*/	  r3.x = max(r3.x, 0.000000);
/*300*/	  r3.x = log2(r3.x);
/*301*/	  r3.x = r3.x * 10.000000;
/*302*/	  r3.x = exp2(r3.x);
/*303*/	  r3.x = r4.w * r3.x;
/*304*/	  r3.x = r3.x * r5.w + r0.z;
/*305*/	  r1.w = r1.w * abs(r2.w);
/*306*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*307*/	} else {
/*308*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*309*/	}
/*310*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*311*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*312*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*313*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*314*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*315*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*316*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*317*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*318*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*319*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*320*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*321*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*322*/	r1.w = inversesqrt(r1.w);
/*323*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*324*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*325*/	r1.w = r1.w + r1.w;
/*326*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*327*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*328*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*329*/	r1.x = max(r1.x, 0.000000);
/*330*/	r1.x = log2(r1.x);
/*331*/	r1.x = r1.x * 10.000000;
/*332*/	r1.x = exp2(r1.x);
/*333*/	r1.x = r4.w * r1.x;
/*334*/	r0.z = r1.x * r5.w + r0.z;
/*335*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*336*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*337*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*338*/	r0.w = 1.000000;
/*339*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*340*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*341*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*342*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*343*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*344*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*345*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*346*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*347*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*348*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*349*/	if(r0.x != 0) discard;
/*350*/	color1.x = 1.000000;
/*351*/	return;
}
