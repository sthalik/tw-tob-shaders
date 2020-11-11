//
//
// Shader Model 4
// Fragment Shader
//
// id: 882 - fxc/glsl_SM_4_0_rigidtileddirtmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*19*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
/*20*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*21*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*22*/	r1.w = r4.w + -1.000000;
/*23*/	r1.w = r5.x * r1.w + 1.000000;
/*24*/	r1.w = saturate(r1.w * r5.x);
/*25*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*26*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*27*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*28*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*29*/	r6.x = 0;
/*30*/	r6.y = cb0.data[26].x * 0.050000;
/*31*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*32*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*33*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*34*/	r1.w = saturate(r6.x * 5.000000);
/*35*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*36*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*37*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*38*/	r2.w = log2(r7.z);
/*39*/	r2.w = r2.w * 1.800000;
/*40*/	r2.w = exp2(r2.w);
/*41*/	r2.w = r2.w * 10.000000;
/*42*/	r2.w = min(r2.w, 1.000000);
/*43*/	r1.w = r1.w + r2.w;
/*44*/	r1.w = r1.w * 0.500000;
/*45*/	r2.w = -r7.w + 1.000000;
/*46*/	r2.w = log2(r2.w);
/*47*/	r2.w = r2.w * vsOut_T7.x;
/*48*/	r2.w = exp2(r2.w);
/*49*/	r2.w = min(r2.w, 1.000000);
/*50*/	r2.w = r2.w * vsOut_T7.x;
/*51*/	r3.z = r7.z * 0.250000;
/*52*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*53*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*54*/	r1.xyz = (-r1.xyzx * r4.xyzx + r6.xyzx).xyz;
/*55*/	r1.xyz = (r2.wwww * r1.xyzx + r5.xyzx).xyz;
/*56*/	r1.w = vsOut_T7.x + -0.025000;
/*57*/	r1.w = max(r1.w, 0.000000);
/*58*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*59*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*60*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*61*/	r1.w = inversesqrt(r1.w);
/*62*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*63*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*64*/	r1.w = inversesqrt(r1.w);
/*65*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*66*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*69*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*70*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*71*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*72*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*75*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*76*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*77*/	if(floatBitsToUint(r0.w) != 0u) {
/*78*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*79*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*80*/	  r0.w = r3.w * cb0.data[26].x;
/*81*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*82*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*83*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*84*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*85*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*86*/	}
/*87*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*88*/	if(floatBitsToUint(r0.w) != 0u) {
/*89*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*90*/	  if(floatBitsToUint(r0.w) != 0u) {
/*91*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*92*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*93*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*94*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*95*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*96*/	    r0.w = -r0.w + 1.000000;
/*97*/	    r0.w = max(r0.w, 0.000000);
/*98*/	    r8.z = sqrt(r0.w);
/*99*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*100*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*101*/	    r0.w = inversesqrt(r0.w);
/*102*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*103*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*104*/	    r10.y = -1.000000;
/*105*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*106*/	    r0.w = inversesqrt(r0.w);
/*107*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*108*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*109*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*110*/	    r1.w = r1.w * 1.250000;
/*111*/	    r1.w = min(r1.w, 1.000000);
/*112*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*113*/	    r2.w = r2.w * 4.000000;
/*114*/	    r1.w = r1.w * 0.200000 + r2.w;
/*115*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*116*/	    r0.w = r0.w + -r1.w;
/*117*/	    r0.w = saturate(r0.w * 200.000000);
/*118*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*119*/	    r0.w = r0.w * r0.w;
/*120*/	    r0.w = r0.w * r1.w;
/*121*/	    r3.x = r0.w * -r3.x + r3.x;
/*122*/	    r1.w = -r3.y + 0.200000;
/*123*/	    r3.y = r0.w * r1.w + r3.y;
/*124*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*125*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*126*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*127*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*128*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*129*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*130*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*131*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*132*/	    r1.w = -r1.w + 1.000000;
/*133*/	    r1.w = max(r1.w, 0.000000);
/*134*/	    r7.z = sqrt(r1.w);
/*135*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*136*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*137*/	    r1.w = sqrt(r1.w);
/*138*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*139*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*140*/	    r1.w = inversesqrt(r1.w);
/*141*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*142*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*143*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*144*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*145*/	    r1.w = -r0.y + 1.000000;
/*146*/	    r0.w = min(r0.w, r1.w);
/*147*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*148*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*149*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*150*/	    r0.w = inversesqrt(r0.w);
/*151*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*152*/	  }
/*153*/	}
/*154*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*155*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*156*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*157*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*158*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*159*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*160*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*161*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*162*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*163*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*164*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*165*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*166*/	r1.w = inversesqrt(r1.w);
/*167*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*168*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*169*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*170*/	r1.w = inversesqrt(r1.w);
/*171*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*172*/	r1.w = -r3.x + 1.000000;
/*173*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*174*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*175*/	r4.x = r4.x + r4.x;
/*176*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*177*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*178*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*179*/	r4.w = cos((r6.x));
/*180*/	r4.w = inversesqrt(r4.w);
/*181*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*182*/	r5.w = saturate(r0.w * 60.000000);
/*183*/	r5.w = -r0.w + r5.w;
/*184*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*185*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*186*/	r7.x = inversesqrt(r7.x);
/*187*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*188*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*189*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*190*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*191*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*192*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*193*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*194*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*195*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*196*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*197*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*198*/	r5.y = -r0.w + 1.000000;
/*199*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*200*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*201*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*202*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*203*/	  r5.y = max(r5.y, 0.000000);
/*204*/	  r5.y = log2(r5.y);
/*205*/	  r5.y = r5.y * 10.000000;
/*206*/	  r5.y = exp2(r5.y);
/*207*/	  r5.y = r4.w * r5.y;
/*208*/	  r5.y = r5.y * r5.w + r0.w;
/*209*/	  r7.x = r1.w * 8.000000;
/*210*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*211*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*212*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*213*/	}
/*214*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*215*/	r7.x = max(r5.y, 0.000000);
/*216*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*217*/	if(floatBitsToUint(r5.y) != 0u) {
/*218*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*219*/	  r4.x = max(r4.x, -1.000000);
/*220*/	  r4.x = min(r4.x, 1.000000);
/*221*/	  r4.y = -abs(r4.x) + 1.000000;
/*222*/	  r4.y = sqrt(r4.y);
/*223*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*224*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*225*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*226*/	  r5.y = r4.y * r4.z;
/*227*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*228*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*229*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*230*/	  r4.x = r4.z * r4.y + r4.x;
/*231*/	  r3.x = r3.x * r3.x;
/*232*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*233*/	  r2.w = r3.x * r2.w + r5.x;
/*234*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*235*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*236*/	  r3.x = -r2.w * r2.w + 1.000000;
/*237*/	  r3.x = max(r3.x, 0.001000);
/*238*/	  r3.x = log2(r3.x);
/*239*/	  r4.y = r3.x * 4.950617;
/*240*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*241*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*242*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*243*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*244*/	  r2.w = floatBitsToInt(r2.w);
/*245*/	  r4.y = r3.x * r3.x + -r4.y;
/*246*/	  r4.y = sqrt(r4.y);
/*247*/	  r3.x = -r3.x + r4.y;
/*248*/	  r3.x = max(r3.x, 0.000000);
/*249*/	  r3.x = sqrt(r3.x);
/*250*/	  r2.w = r2.w * r3.x;
/*251*/	  r2.w = r2.w * 1.414214;
/*252*/	  r2.w = 0.008727 / r2.w;
/*253*/	  r2.w = max(r2.w, 0.000100);
/*254*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*255*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*256*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*257*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*258*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*259*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*260*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*261*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*262*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*263*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*264*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*265*/	  r2.w = floatBitsToInt(r2.w);
/*266*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*267*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*268*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*269*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*270*/	  r2.w = r2.w * r4.x + 1.000000;
/*271*/	  r2.w = r2.w * 0.500000;
/*272*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*273*/	  r3.x = r3.x * r4.y + 1.000000;
/*274*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*275*/	  r3.x = min(r7.x, 1.000000);
/*276*/	  r1.w = r1.w * 1.570796;
/*277*/	  r1.w = sin(r1.w);
/*278*/	  r3.x = r3.x + -1.000000;
/*279*/	  r1.w = r1.w * r3.x + 1.000000;
/*280*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*281*/	  r3.x = max(r3.x, 0.000000);
/*282*/	  r3.x = log2(r3.x);
/*283*/	  r3.x = r3.x * 10.000000;
/*284*/	  r3.x = exp2(r3.x);
/*285*/	  r3.x = r4.w * r3.x;
/*286*/	  r3.x = r3.x * r5.w + r0.w;
/*287*/	  r1.w = r1.w * abs(r2.w);
/*288*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*289*/	} else {
/*290*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*291*/	}
/*292*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*293*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*294*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*295*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*296*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*297*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*298*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*299*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*300*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*301*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*302*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*303*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*304*/	r1.w = inversesqrt(r1.w);
/*305*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*306*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*307*/	r1.w = r1.w + r1.w;
/*308*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*309*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*310*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*311*/	r0.x = max(r0.x, 0.000000);
/*312*/	r0.x = log2(r0.x);
/*313*/	r0.x = r0.x * 10.000000;
/*314*/	r0.x = exp2(r0.x);
/*315*/	r0.x = r4.w * r0.x;
/*316*/	r0.x = r0.x * r5.w + r0.w;
/*317*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*318*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*319*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*320*/	r0.w = 1.000000;
/*321*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*322*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*323*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*324*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*325*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*326*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*327*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*328*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*329*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*330*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*331*/	if(r0.x != 0) discard;
/*332*/	color1.x = 1.000000;
/*333*/	return;
}
