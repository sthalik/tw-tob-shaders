//
//
// Shader Model 4
// Fragment Shader
//
// id: 562 - fxc/glsl_SM_4_0_rigidambientmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_gloss_map;
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
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*21*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*22*/	r6.x = 0;
/*23*/	r6.y = cb0.data[26].x * 0.050000;
/*24*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*25*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*26*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*27*/	r1.w = saturate(r6.x * 5.000000);
/*28*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*29*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*30*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*31*/	r2.w = log2(r7.z);
/*32*/	r2.w = r2.w * 1.800000;
/*33*/	r2.w = exp2(r2.w);
/*34*/	r2.w = r2.w * 10.000000;
/*35*/	r2.w = min(r2.w, 1.000000);
/*36*/	r1.w = r1.w + r2.w;
/*37*/	r1.w = r1.w * 0.500000;
/*38*/	r2.w = -r7.w + 1.000000;
/*39*/	r2.w = log2(r2.w);
/*40*/	r2.w = r2.w * vsOut_T7.x;
/*41*/	r2.w = exp2(r2.w);
/*42*/	r2.w = min(r2.w, 1.000000);
/*43*/	r2.w = r2.w * vsOut_T7.x;
/*44*/	r3.z = r7.z * 0.250000;
/*45*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*46*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*47*/	r1.xyz = (-r1.xyzx * r4.xyzx + r6.xyzx).xyz;
/*48*/	r1.xyz = (r2.wwww * r1.xyzx + r5.xyzx).xyz;
/*49*/	r1.w = vsOut_T7.x + -0.025000;
/*50*/	r1.w = max(r1.w, 0.000000);
/*51*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*52*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*53*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*56*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*57*/	r1.w = inversesqrt(r1.w);
/*58*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*59*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*60*/	r1.w = inversesqrt(r1.w);
/*61*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*62*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*63*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*64*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*65*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*68*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*69*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*70*/	if(floatBitsToUint(r0.w) != 0u) {
/*71*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*72*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*73*/	  r0.w = r3.w * cb0.data[26].x;
/*74*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*75*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*76*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*77*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*78*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*79*/	}
/*80*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*81*/	if(floatBitsToUint(r0.w) != 0u) {
/*82*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*83*/	  if(floatBitsToUint(r0.w) != 0u) {
/*84*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*85*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*86*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*87*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*88*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*89*/	    r0.w = -r0.w + 1.000000;
/*90*/	    r0.w = max(r0.w, 0.000000);
/*91*/	    r8.z = sqrt(r0.w);
/*92*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*93*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*94*/	    r0.w = inversesqrt(r0.w);
/*95*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*96*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*97*/	    r10.y = -1.000000;
/*98*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*99*/	    r0.w = inversesqrt(r0.w);
/*100*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*101*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*102*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*103*/	    r1.w = r1.w * 1.250000;
/*104*/	    r1.w = min(r1.w, 1.000000);
/*105*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*106*/	    r2.w = r2.w * 4.000000;
/*107*/	    r1.w = r1.w * 0.200000 + r2.w;
/*108*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*109*/	    r0.w = r0.w + -r1.w;
/*110*/	    r0.w = saturate(r0.w * 200.000000);
/*111*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*112*/	    r0.w = r0.w * r0.w;
/*113*/	    r0.w = r0.w * r1.w;
/*114*/	    r3.x = r0.w * -r3.x + r3.x;
/*115*/	    r1.w = -r3.y + 0.200000;
/*116*/	    r3.y = r0.w * r1.w + r3.y;
/*117*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*118*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*119*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*120*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*121*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*122*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*123*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*124*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*125*/	    r1.w = -r1.w + 1.000000;
/*126*/	    r1.w = max(r1.w, 0.000000);
/*127*/	    r7.z = sqrt(r1.w);
/*128*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*129*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*130*/	    r1.w = sqrt(r1.w);
/*131*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*132*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*133*/	    r1.w = inversesqrt(r1.w);
/*134*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*135*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*136*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*137*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*138*/	    r1.w = -r0.y + 1.000000;
/*139*/	    r0.w = min(r0.w, r1.w);
/*140*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*141*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*142*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*143*/	    r0.w = inversesqrt(r0.w);
/*144*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*145*/	  }
/*146*/	}
/*147*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*148*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*149*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*150*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*151*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*152*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*153*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*154*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*155*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*156*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*157*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*158*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*159*/	r1.w = inversesqrt(r1.w);
/*160*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*161*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*162*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*163*/	r1.w = inversesqrt(r1.w);
/*164*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*165*/	r1.w = -r3.x + 1.000000;
/*166*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*167*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*168*/	r4.x = r4.x + r4.x;
/*169*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*170*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*171*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*172*/	r4.w = cos((r6.x));
/*173*/	r4.w = inversesqrt(r4.w);
/*174*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*175*/	r5.w = saturate(r0.w * 60.000000);
/*176*/	r5.w = -r0.w + r5.w;
/*177*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*178*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*179*/	r7.x = inversesqrt(r7.x);
/*180*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*181*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*182*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*183*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*184*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*185*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*186*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*187*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*188*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*189*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*190*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*191*/	r5.y = -r0.w + 1.000000;
/*192*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*193*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*194*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*195*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*196*/	  r5.y = max(r5.y, 0.000000);
/*197*/	  r5.y = log2(r5.y);
/*198*/	  r5.y = r5.y * 10.000000;
/*199*/	  r5.y = exp2(r5.y);
/*200*/	  r5.y = r4.w * r5.y;
/*201*/	  r5.y = r5.y * r5.w + r0.w;
/*202*/	  r7.x = r1.w * 8.000000;
/*203*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*204*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*205*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*206*/	}
/*207*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*208*/	r7.x = max(r5.y, 0.000000);
/*209*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*210*/	if(floatBitsToUint(r5.y) != 0u) {
/*211*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*212*/	  r4.x = max(r4.x, -1.000000);
/*213*/	  r4.x = min(r4.x, 1.000000);
/*214*/	  r4.y = -abs(r4.x) + 1.000000;
/*215*/	  r4.y = sqrt(r4.y);
/*216*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*217*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*218*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*219*/	  r5.y = r4.y * r4.z;
/*220*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*221*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*222*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*223*/	  r4.x = r4.z * r4.y + r4.x;
/*224*/	  r3.x = r3.x * r3.x;
/*225*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*226*/	  r2.w = r3.x * r2.w + r5.x;
/*227*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*228*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*229*/	  r3.x = -r2.w * r2.w + 1.000000;
/*230*/	  r3.x = max(r3.x, 0.001000);
/*231*/	  r3.x = log2(r3.x);
/*232*/	  r4.y = r3.x * 4.950617;
/*233*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*234*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*235*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*236*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*237*/	  r2.w = floatBitsToInt(r2.w);
/*238*/	  r4.y = r3.x * r3.x + -r4.y;
/*239*/	  r4.y = sqrt(r4.y);
/*240*/	  r3.x = -r3.x + r4.y;
/*241*/	  r3.x = max(r3.x, 0.000000);
/*242*/	  r3.x = sqrt(r3.x);
/*243*/	  r2.w = r2.w * r3.x;
/*244*/	  r2.w = r2.w * 1.414214;
/*245*/	  r2.w = 0.008727 / r2.w;
/*246*/	  r2.w = max(r2.w, 0.000100);
/*247*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*248*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*249*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*250*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*251*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*252*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*253*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*254*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*255*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*256*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*257*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*258*/	  r2.w = floatBitsToInt(r2.w);
/*259*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*260*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*261*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*262*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*263*/	  r2.w = r2.w * r4.x + 1.000000;
/*264*/	  r2.w = r2.w * 0.500000;
/*265*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*266*/	  r3.x = r3.x * r4.y + 1.000000;
/*267*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*268*/	  r3.x = min(r7.x, 1.000000);
/*269*/	  r1.w = r1.w * 1.570796;
/*270*/	  r1.w = sin(r1.w);
/*271*/	  r3.x = r3.x + -1.000000;
/*272*/	  r1.w = r1.w * r3.x + 1.000000;
/*273*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*274*/	  r3.x = max(r3.x, 0.000000);
/*275*/	  r3.x = log2(r3.x);
/*276*/	  r3.x = r3.x * 10.000000;
/*277*/	  r3.x = exp2(r3.x);
/*278*/	  r3.x = r4.w * r3.x;
/*279*/	  r3.x = r3.x * r5.w + r0.w;
/*280*/	  r1.w = r1.w * abs(r2.w);
/*281*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*282*/	} else {
/*283*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*284*/	}
/*285*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*286*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*287*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*288*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*289*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*290*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*291*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*292*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*293*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*294*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*295*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*296*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*297*/	r1.w = inversesqrt(r1.w);
/*298*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*299*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*300*/	r1.w = r1.w + r1.w;
/*301*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*302*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*303*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*304*/	r0.x = max(r0.x, 0.000000);
/*305*/	r0.x = log2(r0.x);
/*306*/	r0.x = r0.x * 10.000000;
/*307*/	r0.x = exp2(r0.x);
/*308*/	r0.x = r4.w * r0.x;
/*309*/	r0.x = r0.x * r5.w + r0.w;
/*310*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*311*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*312*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*313*/	r0.w = 1.000000;
/*314*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*315*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*316*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*317*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*318*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*319*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*320*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*321*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*322*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*323*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*324*/	if(r0.x != 0) discard;
/*325*/	color1.x = 1.000000;
/*326*/	return;
}
