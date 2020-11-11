//
//
// Shader Model 4
// Fragment Shader
//
// id: 4667 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidstandard.hlsl_PS_ps30_rigid_forward_lighting_no_clip_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb4;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb5;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb6;

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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb5.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*15*/	r5.xyz = (r5.xyzx + -cb6.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb6.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb6.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb6.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb6.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb6.data[2].xyxz).xyw;
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
/*37*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*38*/	r1.w = inversesqrt(r1.w);
/*39*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*40*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*41*/	r1.w = inversesqrt(r1.w);
/*42*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*43*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*44*/	r1.w = inversesqrt(r1.w);
/*45*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*46*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*47*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*48*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*49*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*50*/	r1.w = inversesqrt(r1.w);
/*51*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*52*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*53*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*54*/	if(floatBitsToUint(r0.z) != 0u) {
/*55*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*56*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*57*/	  r0.z = r3.w * cb1.data[26].x;
/*58*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*59*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*60*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*61*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*62*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*63*/	}
/*64*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r0.z) != 0u) {
/*66*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*67*/	  if(floatBitsToUint(r0.z) != 0u) {
/*68*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*69*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*70*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*71*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*72*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*73*/	    r0.z = -r0.z + 1.000000;
/*74*/	    r0.z = max(r0.z, 0.000000);
/*75*/	    r8.z = sqrt(r0.z);
/*76*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*77*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*78*/	    r0.z = inversesqrt(r0.z);
/*79*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*80*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*81*/	    r10.y = -1.000000;
/*82*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*83*/	    r0.z = inversesqrt(r0.z);
/*84*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*85*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*86*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*87*/	    r1.w = r1.w * 1.250000;
/*88*/	    r1.w = min(r1.w, 1.000000);
/*89*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*90*/	    r2.w = r2.w * 4.000000;
/*91*/	    r1.w = r1.w * 0.200000 + r2.w;
/*92*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*93*/	    r0.z = r0.z + -r1.w;
/*94*/	    r0.z = saturate(r0.z * 200.000000);
/*95*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*96*/	    r0.z = r0.z * r0.z;
/*97*/	    r0.z = r0.z * r1.w;
/*98*/	    r3.x = r0.z * -r3.x + r3.x;
/*99*/	    r1.w = -r3.y + 0.200000;
/*100*/	    r3.y = r0.z * r1.w + r3.y;
/*101*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*102*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*103*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*104*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*105*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*106*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*107*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*108*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*109*/	    r1.w = -r1.w + 1.000000;
/*110*/	    r1.w = max(r1.w, 0.000000);
/*111*/	    r7.z = sqrt(r1.w);
/*112*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*113*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*114*/	    r1.w = sqrt(r1.w);
/*115*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*116*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*117*/	    r1.w = inversesqrt(r1.w);
/*118*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*119*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*120*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*121*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*122*/	    r1.w = -r1.y + 1.000000;
/*123*/	    r0.z = min(r0.z, r1.w);
/*124*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*125*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*126*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*127*/	    r0.z = inversesqrt(r0.z);
/*128*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*129*/	  }
/*130*/	}
/*131*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*132*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*133*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*134*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*135*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*136*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*137*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*138*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*139*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*140*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*141*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*142*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*143*/	r1.w = inversesqrt(r1.w);
/*144*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*145*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*146*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*147*/	r2.w = inversesqrt(r1.w);
/*148*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*149*/	r2.w = -r3.x + 1.000000;
/*150*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*151*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*152*/	r5.y = r5.y + r5.y;
/*153*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*154*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*155*/	r6.w = r2.w * 1.539380;
/*156*/	r6.w = cos((r6.w));
/*157*/	r6.w = inversesqrt(r6.w);
/*158*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*159*/	r7.x = saturate(r0.z * 60.000000);
/*160*/	r7.x = -r0.z + r7.x;
/*161*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*162*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*163*/	r8.x = inversesqrt(r8.x);
/*164*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*165*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*166*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*167*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*168*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*169*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*170*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*171*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*172*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*173*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*174*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*175*/	r6.y = -r0.z + 1.000000;
/*176*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*177*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*178*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*179*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*180*/	  r6.y = max(r6.y, 0.000000);
/*181*/	  r6.y = log2(r6.y);
/*182*/	  r6.y = r6.y * 10.000000;
/*183*/	  r6.y = exp2(r6.y);
/*184*/	  r6.y = r6.w * r6.y;
/*185*/	  r6.y = r6.y * r7.x + r0.z;
/*186*/	  r8.x = r2.w * 8.000000;
/*187*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*188*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*189*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*190*/	}
/*191*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*192*/	r1.y = max(r1.x, 0.000000);
/*193*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*194*/	if(floatBitsToUint(r1.x) != 0u) {
/*195*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*196*/	  r1.x = max(r1.x, -1.000000);
/*197*/	  r1.x = min(r1.x, 1.000000);
/*198*/	  r1.z = -abs(r1.x) + 1.000000;
/*199*/	  r1.z = sqrt(r1.z);
/*200*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*201*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*202*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*203*/	  r5.z = r1.z * r5.y;
/*204*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*205*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*206*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*207*/	  r1.x = r5.y * r1.z + r1.x;
/*208*/	  r1.z = r3.x * r3.x;
/*209*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*210*/	  r1.z = r1.z * r3.x + r6.x;
/*211*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*212*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*213*/	  r3.x = -r1.z * r1.z + 1.000000;
/*214*/	  r3.x = max(r3.x, 0.001000);
/*215*/	  r3.x = log2(r3.x);
/*216*/	  r5.x = r3.x * 4.950617;
/*217*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*218*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*219*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*220*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*221*/	  r1.z = floatBitsToInt(r1.z);
/*222*/	  r5.x = r3.x * r3.x + -r5.x;
/*223*/	  r5.x = sqrt(r5.x);
/*224*/	  r3.x = -r3.x + r5.x;
/*225*/	  r3.x = max(r3.x, 0.000000);
/*226*/	  r3.x = sqrt(r3.x);
/*227*/	  r1.z = r1.z * r3.x;
/*228*/	  r1.z = r1.z * 1.414214;
/*229*/	  r1.z = 0.008727 / r1.z;
/*230*/	  r1.z = max(r1.z, 0.000100);
/*231*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*232*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*233*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*234*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*235*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*236*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*237*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*238*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*239*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*240*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*241*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*242*/	  r1.x = floatBitsToInt(r1.x);
/*243*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*244*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*245*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*246*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*247*/	  r1.x = r1.x * r5.x + 1.000000;
/*248*/	  r1.x = r1.x * 0.500000;
/*249*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*250*/	  r1.z = r1.z * r5.y + 1.000000;
/*251*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*252*/	  r1.z = min(r1.y, 1.000000);
/*253*/	  r2.w = r2.w * 1.570796;
/*254*/	  r2.w = sin(r2.w);
/*255*/	  r1.z = r1.z + -1.000000;
/*256*/	  r1.z = r2.w * r1.z + 1.000000;
/*257*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*258*/	  r2.w = max(r2.w, 0.000000);
/*259*/	  r2.w = log2(r2.w);
/*260*/	  r2.w = r2.w * 10.000000;
/*261*/	  r2.w = exp2(r2.w);
/*262*/	  r2.w = r6.w * r2.w;
/*263*/	  r2.w = r2.w * r7.x + r0.z;
/*264*/	  r1.x = r1.z * abs(r1.x);
/*265*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*266*/	} else {
/*267*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*268*/	}
/*269*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*270*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*271*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*272*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*273*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*274*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*275*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*276*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*277*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*278*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*279*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*280*/	r2.w = 1.000000;
/*281*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*282*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*283*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*284*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*285*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*286*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*287*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*288*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*289*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*290*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*291*/	if(r0.w != 0) discard;
/*292*/	r0.w = sqrt(r1.w);
/*293*/	r1.x = saturate(cb3.data[0].w)/**/;
/*294*/	r1.x = -r1.x + 1.000000;
/*295*/	r1.x = r1.x * 8.000000 + -4.000000;
/*296*/	r1.y = saturate(cb3.data[1].x)/**/;
/*297*/	r1.y = -r1.y + 1.000000;
/*298*/	r1.y = r1.y * 1000.000000;
/*299*/	r0.w = r0.w / r1.y;
/*300*/	r0.w = r0.w + r1.x;
/*301*/	r0.w = r0.w * 1.442695;
/*302*/	r0.w = exp2(r0.w);
/*303*/	r0.w = cb3.data[1].y / r0.w;
/*304*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*305*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*306*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*307*/	r1.x = r1.x + -cb3.data[1].z;
/*308*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*309*/	r1.x = saturate(r1.y * r1.x);
/*310*/	r1.y = r1.x * -2.000000 + 3.000000;
/*311*/	r1.x = r1.x * r1.x;
/*312*/	r1.x = r1.x * r1.y;
/*313*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*314*/	r1.y = sqrt(r1.y);
/*315*/	r1.z = max(cb3.data[2].z, 0.001000);
/*316*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*317*/	r1.y = r1.z * r1.y;
/*318*/	r1.y = min(r1.y, 1.000000);
/*319*/	r1.z = r1.y * -2.000000 + 3.000000;
/*320*/	r1.y = r1.y * r1.y;
/*321*/	r1.y = r1.y * r1.z;
/*322*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*323*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*324*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*325*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*326*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*327*/	r4.w = max(r4.y, 0.000000);
/*328*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*329*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*330*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*331*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*332*/	r0.w = saturate(r0.w * r1.y);
/*333*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*334*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*335*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*336*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*337*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*338*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*339*/	return;
}
