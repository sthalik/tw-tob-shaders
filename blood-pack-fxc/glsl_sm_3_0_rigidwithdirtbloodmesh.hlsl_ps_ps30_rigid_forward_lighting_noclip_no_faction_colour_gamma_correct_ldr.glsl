//
//
// Shader Model 4
// Fragment Shader
//
// id: 1243 - fxc/glsl_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;

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
/*7*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*8*/	color0.w = r0.x * r1.w;
/*9*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r0.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*11*/	r2.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*12*/	r0.x = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*13*/	r0.x = -r0.x + 1.000000;
/*14*/	r0.x = max(r0.x, 0.000000);
/*15*/	r2.z = sqrt(r0.x);
/*16*/	r0.xyw = (mix(r2.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*17*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r2.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx).xy;
/*19*/	r3.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx + vsOut_T6.yzyy).xy;
/*20*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*21*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	r1.w = r2.w * r3.w;
/*23*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*24*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*25*/	r0.xy = (r3.xyxx * r2.wwww + r0.xyxx).xy;
/*26*/	r2.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*27*/	r2.z = inversesqrt(r2.z);
/*28*/	r0.xyw = (r0.xyxw * r2.zzzz).xyw;
/*29*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*30*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*31*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*32*/	r2.x = saturate(-r2.x + r2.w);
/*33*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*34*/	if(floatBitsToUint(r2.x) != 0u) {
/*35*/	  r2.x = -r2.w + 1.000000;
/*36*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*37*/	  r2.x = -r2.x + 1.000000;
/*38*/	  r2.x = -r2.x * r2.x + 1.000000;
/*39*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*40*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*41*/	  r2.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*42*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*43*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*44*/	  r3.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*45*/	  r1.xyz = (r2.wwww * r3.xyzx + r2.xyzx).xyz;
/*46*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*47*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*48*/	} else {
/*49*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*50*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*51*/	  r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*52*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*53*/	}
/*54*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*55*/	r1.w = inversesqrt(r1.w);
/*56*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*57*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*60*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*61*/	r1.w = inversesqrt(r1.w);
/*62*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*63*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*64*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*65*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*66*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*69*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*70*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*71*/	if(floatBitsToUint(r0.w) != 0u) {
/*72*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*73*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*74*/	  r0.w = r3.w * cb1.data[26].x;
/*75*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*76*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*77*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*78*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*79*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*80*/	}
/*81*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r0.w) != 0u) {
/*83*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*84*/	  if(floatBitsToUint(r0.w) != 0u) {
/*85*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*86*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*87*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*88*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*89*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*90*/	    r0.w = -r0.w + 1.000000;
/*91*/	    r0.w = max(r0.w, 0.000000);
/*92*/	    r8.z = sqrt(r0.w);
/*93*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*94*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*95*/	    r0.w = inversesqrt(r0.w);
/*96*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*97*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*98*/	    r10.y = -1.000000;
/*99*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*100*/	    r0.w = inversesqrt(r0.w);
/*101*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*102*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*103*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*104*/	    r1.w = r1.w * 1.250000;
/*105*/	    r1.w = min(r1.w, 1.000000);
/*106*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*107*/	    r2.w = r2.w * 4.000000;
/*108*/	    r1.w = r1.w * 0.200000 + r2.w;
/*109*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*110*/	    r0.w = r0.w + -r1.w;
/*111*/	    r0.w = saturate(r0.w * 200.000000);
/*112*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*113*/	    r0.w = r0.w * r0.w;
/*114*/	    r0.w = r0.w * r1.w;
/*115*/	    r3.x = r0.w * -r3.x + r3.x;
/*116*/	    r1.w = -r3.y + 0.200000;
/*117*/	    r3.y = r0.w * r1.w + r3.y;
/*118*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*119*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*120*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*121*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*122*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*123*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*124*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*125*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*126*/	    r1.w = -r1.w + 1.000000;
/*127*/	    r1.w = max(r1.w, 0.000000);
/*128*/	    r7.z = sqrt(r1.w);
/*129*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*130*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*131*/	    r1.w = sqrt(r1.w);
/*132*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*133*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*134*/	    r1.w = inversesqrt(r1.w);
/*135*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*136*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*137*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*138*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*139*/	    r1.w = -r0.y + 1.000000;
/*140*/	    r0.w = min(r0.w, r1.w);
/*141*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*142*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*143*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*144*/	    r0.w = inversesqrt(r0.w);
/*145*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*146*/	  }
/*147*/	}
/*148*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*149*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*150*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*151*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*152*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*153*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*154*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*155*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*156*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*157*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*158*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*159*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*160*/	r1.w = inversesqrt(r1.w);
/*161*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*162*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*163*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*164*/	r2.w = inversesqrt(r1.w);
/*165*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*166*/	r2.w = -r3.x + 1.000000;
/*167*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*168*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*169*/	r5.y = r5.y + r5.y;
/*170*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*171*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*172*/	r6.w = r2.w * 1.539380;
/*173*/	r6.w = cos((r6.w));
/*174*/	r6.w = inversesqrt(r6.w);
/*175*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*176*/	r7.x = saturate(r0.w * 60.000000);
/*177*/	r7.x = -r0.w + r7.x;
/*178*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*179*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*180*/	r8.x = inversesqrt(r8.x);
/*181*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*182*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*183*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*184*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*185*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*186*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*187*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*188*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*189*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*190*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*191*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*192*/	r6.y = -r0.w + 1.000000;
/*193*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*194*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*195*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*196*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*197*/	  r6.y = max(r6.y, 0.000000);
/*198*/	  r6.y = log2(r6.y);
/*199*/	  r6.y = r6.y * 10.000000;
/*200*/	  r6.y = exp2(r6.y);
/*201*/	  r6.y = r6.w * r6.y;
/*202*/	  r6.y = r6.y * r7.x + r0.w;
/*203*/	  r8.x = r2.w * 8.000000;
/*204*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*205*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*206*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*207*/	}
/*208*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*209*/	r0.y = max(r0.x, 0.000000);
/*210*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*211*/	if(floatBitsToUint(r0.x) != 0u) {
/*212*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*213*/	  r0.x = max(r0.x, -1.000000);
/*214*/	  r0.x = min(r0.x, 1.000000);
/*215*/	  r0.z = -abs(r0.x) + 1.000000;
/*216*/	  r0.z = sqrt(r0.z);
/*217*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*218*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*219*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*220*/	  r5.z = r0.z * r5.y;
/*221*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*222*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*223*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*224*/	  r0.x = r5.y * r0.z + r0.x;
/*225*/	  r0.z = r3.x * r3.x;
/*226*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*227*/	  r0.z = r0.z * r3.x + r6.x;
/*228*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*229*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*230*/	  r3.x = -r0.z * r0.z + 1.000000;
/*231*/	  r3.x = max(r3.x, 0.001000);
/*232*/	  r3.x = log2(r3.x);
/*233*/	  r5.x = r3.x * 4.950617;
/*234*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*235*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*236*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*237*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*238*/	  r0.z = floatBitsToInt(r0.z);
/*239*/	  r5.x = r3.x * r3.x + -r5.x;
/*240*/	  r5.x = sqrt(r5.x);
/*241*/	  r3.x = -r3.x + r5.x;
/*242*/	  r3.x = max(r3.x, 0.000000);
/*243*/	  r3.x = sqrt(r3.x);
/*244*/	  r0.z = r0.z * r3.x;
/*245*/	  r0.z = r0.z * 1.414214;
/*246*/	  r0.z = 0.008727 / r0.z;
/*247*/	  r0.z = max(r0.z, 0.000100);
/*248*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*249*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*250*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*251*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*252*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*253*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*254*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*255*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*256*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*257*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*258*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*259*/	  r0.x = floatBitsToInt(r0.x);
/*260*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*261*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*262*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*263*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*264*/	  r0.x = r0.x * r5.x + 1.000000;
/*265*/	  r0.x = r0.x * 0.500000;
/*266*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*267*/	  r0.z = r0.z * r5.y + 1.000000;
/*268*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*269*/	  r0.z = min(r0.y, 1.000000);
/*270*/	  r2.w = r2.w * 1.570796;
/*271*/	  r2.w = sin(r2.w);
/*272*/	  r0.z = r0.z + -1.000000;
/*273*/	  r0.z = r2.w * r0.z + 1.000000;
/*274*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*275*/	  r2.w = max(r2.w, 0.000000);
/*276*/	  r2.w = log2(r2.w);
/*277*/	  r2.w = r2.w * 10.000000;
/*278*/	  r2.w = exp2(r2.w);
/*279*/	  r2.w = r6.w * r2.w;
/*280*/	  r2.w = r2.w * r7.x + r0.w;
/*281*/	  r0.x = r0.z * abs(r0.x);
/*282*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*283*/	} else {
/*284*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*285*/	}
/*286*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*287*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*288*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*289*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*290*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*291*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*292*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*293*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*294*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*295*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*296*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*297*/	r2.w = 1.000000;
/*298*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*299*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*300*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*301*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*302*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*303*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*304*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*305*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*306*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*307*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*308*/	if(r0.w != 0) discard;
/*309*/	r0.w = sqrt(r1.w);
/*310*/	r1.x = saturate(cb3.data[0].w)/**/;
/*311*/	r1.x = -r1.x + 1.000000;
/*312*/	r1.x = r1.x * 8.000000 + -4.000000;
/*313*/	r1.y = saturate(cb3.data[1].x)/**/;
/*314*/	r1.y = -r1.y + 1.000000;
/*315*/	r1.y = r1.y * 1000.000000;
/*316*/	r0.w = r0.w / r1.y;
/*317*/	r0.w = r0.w + r1.x;
/*318*/	r0.w = r0.w * 1.442695;
/*319*/	r0.w = exp2(r0.w);
/*320*/	r0.w = cb3.data[1].y / r0.w;
/*321*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*322*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*323*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*324*/	r1.x = r1.x + -cb3.data[1].z;
/*325*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*326*/	r1.x = saturate(r1.y * r1.x);
/*327*/	r1.y = r1.x * -2.000000 + 3.000000;
/*328*/	r1.x = r1.x * r1.x;
/*329*/	r1.x = r1.x * r1.y;
/*330*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*331*/	r1.y = sqrt(r1.y);
/*332*/	r1.z = max(cb3.data[2].z, 0.001000);
/*333*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*334*/	r1.y = r1.z * r1.y;
/*335*/	r1.y = min(r1.y, 1.000000);
/*336*/	r1.z = r1.y * -2.000000 + 3.000000;
/*337*/	r1.y = r1.y * r1.y;
/*338*/	r1.y = r1.y * r1.z;
/*339*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*340*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*341*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*342*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*343*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*344*/	r4.w = max(r4.y, 0.000000);
/*345*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*346*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*347*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*348*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*349*/	r0.w = saturate(r0.w * r1.y);
/*350*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*351*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*352*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*353*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*354*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*355*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*356*/	return;
}
