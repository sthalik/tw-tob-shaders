//
//
// Shader Model 4
// Fragment Shader
//
// id: 560 - fxc/glsl_SM_4_0_rigidambientmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*25*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*26*/	r6.x = 0;
/*27*/	r6.y = cb0.data[26].x * 0.050000;
/*28*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*29*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*30*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*31*/	r1.w = saturate(r6.x * 5.000000);
/*32*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*33*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*34*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*35*/	r2.w = log2(r7.z);
/*36*/	r2.w = r2.w * 1.800000;
/*37*/	r2.w = exp2(r2.w);
/*38*/	r2.w = r2.w * 10.000000;
/*39*/	r2.w = min(r2.w, 1.000000);
/*40*/	r1.w = r1.w + r2.w;
/*41*/	r1.w = r1.w * 0.500000;
/*42*/	r2.w = -r7.w + 1.000000;
/*43*/	r2.w = log2(r2.w);
/*44*/	r2.w = r2.w * vsOut_T7.x;
/*45*/	r2.w = exp2(r2.w);
/*46*/	r2.w = min(r2.w, 1.000000);
/*47*/	r2.w = r2.w * vsOut_T7.x;
/*48*/	r3.z = r7.z * 0.250000;
/*49*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*50*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*51*/	r1.xyz = (-r1.xyzx * r4.xyzx + r6.xyzx).xyz;
/*52*/	r1.xyz = (r2.wwww * r1.xyzx + r5.xyzx).xyz;
/*53*/	r1.w = vsOut_T7.x + -0.025000;
/*54*/	r1.w = max(r1.w, 0.000000);
/*55*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*56*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*57*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*60*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*61*/	r1.w = inversesqrt(r1.w);
/*62*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*63*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*64*/	r1.w = inversesqrt(r1.w);
/*65*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*66*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*67*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*68*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*69*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*72*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*73*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*74*/	if(floatBitsToUint(r0.w) != 0u) {
/*75*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*76*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*77*/	  r0.w = r3.w * cb0.data[26].x;
/*78*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*79*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*80*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*81*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*82*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*83*/	}
/*84*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*85*/	if(floatBitsToUint(r0.w) != 0u) {
/*86*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*87*/	  if(floatBitsToUint(r0.w) != 0u) {
/*88*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*89*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*90*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*91*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*92*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*93*/	    r0.w = -r0.w + 1.000000;
/*94*/	    r0.w = max(r0.w, 0.000000);
/*95*/	    r8.z = sqrt(r0.w);
/*96*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*97*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*98*/	    r0.w = inversesqrt(r0.w);
/*99*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*100*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*101*/	    r10.y = -1.000000;
/*102*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*103*/	    r0.w = inversesqrt(r0.w);
/*104*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*105*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*106*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*107*/	    r1.w = r1.w * 1.250000;
/*108*/	    r1.w = min(r1.w, 1.000000);
/*109*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*110*/	    r2.w = r2.w * 4.000000;
/*111*/	    r1.w = r1.w * 0.200000 + r2.w;
/*112*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*113*/	    r0.w = r0.w + -r1.w;
/*114*/	    r0.w = saturate(r0.w * 200.000000);
/*115*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*116*/	    r0.w = r0.w * r0.w;
/*117*/	    r0.w = r0.w * r1.w;
/*118*/	    r3.x = r0.w * -r3.x + r3.x;
/*119*/	    r1.w = -r3.y + 0.200000;
/*120*/	    r3.y = r0.w * r1.w + r3.y;
/*121*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*122*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*123*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*124*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*125*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*126*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*127*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*128*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*129*/	    r1.w = -r1.w + 1.000000;
/*130*/	    r1.w = max(r1.w, 0.000000);
/*131*/	    r7.z = sqrt(r1.w);
/*132*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*133*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*134*/	    r1.w = sqrt(r1.w);
/*135*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*136*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*137*/	    r1.w = inversesqrt(r1.w);
/*138*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*139*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*140*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*141*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*142*/	    r1.w = -r0.y + 1.000000;
/*143*/	    r0.w = min(r0.w, r1.w);
/*144*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*145*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*146*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*147*/	    r0.w = inversesqrt(r0.w);
/*148*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*149*/	  }
/*150*/	}
/*151*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*152*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*153*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*154*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*155*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*156*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*157*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*158*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*159*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*160*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*161*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*162*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*163*/	r1.w = inversesqrt(r1.w);
/*164*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*165*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*166*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*167*/	r1.w = inversesqrt(r1.w);
/*168*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*169*/	r1.w = -r3.x + 1.000000;
/*170*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*171*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*172*/	r4.x = r4.x + r4.x;
/*173*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*174*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*175*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*176*/	r4.w = cos((r6.x));
/*177*/	r4.w = inversesqrt(r4.w);
/*178*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*179*/	r5.w = saturate(r0.w * 60.000000);
/*180*/	r5.w = -r0.w + r5.w;
/*181*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*182*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*183*/	r7.x = inversesqrt(r7.x);
/*184*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*185*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*186*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*187*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*188*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*189*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*190*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*191*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*192*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*193*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*194*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*195*/	r5.y = -r0.w + 1.000000;
/*196*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*197*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*198*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*199*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*200*/	  r5.y = max(r5.y, 0.000000);
/*201*/	  r5.y = log2(r5.y);
/*202*/	  r5.y = r5.y * 10.000000;
/*203*/	  r5.y = exp2(r5.y);
/*204*/	  r5.y = r4.w * r5.y;
/*205*/	  r5.y = r5.y * r5.w + r0.w;
/*206*/	  r7.x = r1.w * 8.000000;
/*207*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*208*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*209*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*210*/	}
/*211*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*212*/	r7.x = max(r5.y, 0.000000);
/*213*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*214*/	if(floatBitsToUint(r5.y) != 0u) {
/*215*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*216*/	  r4.x = max(r4.x, -1.000000);
/*217*/	  r4.x = min(r4.x, 1.000000);
/*218*/	  r4.y = -abs(r4.x) + 1.000000;
/*219*/	  r4.y = sqrt(r4.y);
/*220*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*221*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*222*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*223*/	  r5.y = r4.y * r4.z;
/*224*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*225*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*226*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*227*/	  r4.x = r4.z * r4.y + r4.x;
/*228*/	  r3.x = r3.x * r3.x;
/*229*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*230*/	  r2.w = r3.x * r2.w + r5.x;
/*231*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*232*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*233*/	  r3.x = -r2.w * r2.w + 1.000000;
/*234*/	  r3.x = max(r3.x, 0.001000);
/*235*/	  r3.x = log2(r3.x);
/*236*/	  r4.y = r3.x * 4.950617;
/*237*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*238*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*239*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*240*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*241*/	  r2.w = floatBitsToInt(r2.w);
/*242*/	  r4.y = r3.x * r3.x + -r4.y;
/*243*/	  r4.y = sqrt(r4.y);
/*244*/	  r3.x = -r3.x + r4.y;
/*245*/	  r3.x = max(r3.x, 0.000000);
/*246*/	  r3.x = sqrt(r3.x);
/*247*/	  r2.w = r2.w * r3.x;
/*248*/	  r2.w = r2.w * 1.414214;
/*249*/	  r2.w = 0.008727 / r2.w;
/*250*/	  r2.w = max(r2.w, 0.000100);
/*251*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*252*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*253*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*254*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*255*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*256*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*257*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*258*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*259*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*260*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*261*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*262*/	  r2.w = floatBitsToInt(r2.w);
/*263*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*264*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*265*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*266*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*267*/	  r2.w = r2.w * r4.x + 1.000000;
/*268*/	  r2.w = r2.w * 0.500000;
/*269*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*270*/	  r3.x = r3.x * r4.y + 1.000000;
/*271*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*272*/	  r3.x = min(r7.x, 1.000000);
/*273*/	  r1.w = r1.w * 1.570796;
/*274*/	  r1.w = sin(r1.w);
/*275*/	  r3.x = r3.x + -1.000000;
/*276*/	  r1.w = r1.w * r3.x + 1.000000;
/*277*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*278*/	  r3.x = max(r3.x, 0.000000);
/*279*/	  r3.x = log2(r3.x);
/*280*/	  r3.x = r3.x * 10.000000;
/*281*/	  r3.x = exp2(r3.x);
/*282*/	  r3.x = r4.w * r3.x;
/*283*/	  r3.x = r3.x * r5.w + r0.w;
/*284*/	  r1.w = r1.w * abs(r2.w);
/*285*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*286*/	} else {
/*287*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*288*/	}
/*289*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*290*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*291*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*292*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*293*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*294*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*295*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*296*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*297*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*298*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*299*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*300*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*301*/	r1.w = inversesqrt(r1.w);
/*302*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*303*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*304*/	r1.w = r1.w + r1.w;
/*305*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*306*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*307*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*308*/	r0.x = max(r0.x, 0.000000);
/*309*/	r0.x = log2(r0.x);
/*310*/	r0.x = r0.x * 10.000000;
/*311*/	r0.x = exp2(r0.x);
/*312*/	r0.x = r4.w * r0.x;
/*313*/	r0.x = r0.x * r5.w + r0.w;
/*314*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*315*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*316*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*317*/	r0.w = 1.000000;
/*318*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*319*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*320*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*321*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*322*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*323*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*324*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*325*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*326*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*327*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*328*/	if(r0.x != 0) discard;
/*329*/	color1.x = 1.000000;
/*330*/	return;
}
