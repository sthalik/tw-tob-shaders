//
//
// Shader Model 4
// Fragment Shader
//
// id: 1241 - fxc/glsl_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
/*8*/	r0.y = r1.w + -0.500000;
/*9*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*10*/	if(r0.y != 0) discard;
/*11*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*12*/	color0.w = r0.x * r1.w;
/*13*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r0.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*15*/	r2.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*16*/	r0.x = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*17*/	r0.x = -r0.x + 1.000000;
/*18*/	r0.x = max(r0.x, 0.000000);
/*19*/	r2.z = sqrt(r0.x);
/*20*/	r0.xyw = (mix(r2.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*21*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*22*/	r2.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx).xy;
/*23*/	r3.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx + vsOut_T6.yzyy).xy;
/*24*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*25*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = r2.w * r3.w;
/*27*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*28*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*29*/	r0.xy = (r3.xyxx * r2.wwww + r0.xyxx).xy;
/*30*/	r2.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*31*/	r2.z = inversesqrt(r2.z);
/*32*/	r0.xyw = (r0.xyxw * r2.zzzz).xyw;
/*33*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*34*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*35*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*36*/	r2.x = saturate(-r2.x + r2.w);
/*37*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*38*/	if(floatBitsToUint(r2.x) != 0u) {
/*39*/	  r2.x = -r2.w + 1.000000;
/*40*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*41*/	  r2.x = -r2.x + 1.000000;
/*42*/	  r2.x = -r2.x * r2.x + 1.000000;
/*43*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*44*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*45*/	  r2.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*46*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*47*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*48*/	  r3.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*49*/	  r1.xyz = (r2.wwww * r3.xyzx + r2.xyzx).xyz;
/*50*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*51*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*52*/	} else {
/*53*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*54*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*55*/	  r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*56*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*57*/	}
/*58*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*61*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*64*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*67*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*68*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*69*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*70*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*73*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*74*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*75*/	if(floatBitsToUint(r0.w) != 0u) {
/*76*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*77*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*78*/	  r0.w = r3.w * cb1.data[26].x;
/*79*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*80*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*81*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*82*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*83*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*84*/	}
/*85*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*86*/	if(floatBitsToUint(r0.w) != 0u) {
/*87*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*88*/	  if(floatBitsToUint(r0.w) != 0u) {
/*89*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*90*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*91*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*92*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*93*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*94*/	    r0.w = -r0.w + 1.000000;
/*95*/	    r0.w = max(r0.w, 0.000000);
/*96*/	    r8.z = sqrt(r0.w);
/*97*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*98*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*99*/	    r0.w = inversesqrt(r0.w);
/*100*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*101*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*102*/	    r10.y = -1.000000;
/*103*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*104*/	    r0.w = inversesqrt(r0.w);
/*105*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*106*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*107*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*108*/	    r1.w = r1.w * 1.250000;
/*109*/	    r1.w = min(r1.w, 1.000000);
/*110*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*111*/	    r2.w = r2.w * 4.000000;
/*112*/	    r1.w = r1.w * 0.200000 + r2.w;
/*113*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*114*/	    r0.w = r0.w + -r1.w;
/*115*/	    r0.w = saturate(r0.w * 200.000000);
/*116*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*117*/	    r0.w = r0.w * r0.w;
/*118*/	    r0.w = r0.w * r1.w;
/*119*/	    r3.x = r0.w * -r3.x + r3.x;
/*120*/	    r1.w = -r3.y + 0.200000;
/*121*/	    r3.y = r0.w * r1.w + r3.y;
/*122*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*123*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*124*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*125*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*126*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*127*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*128*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*129*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*130*/	    r1.w = -r1.w + 1.000000;
/*131*/	    r1.w = max(r1.w, 0.000000);
/*132*/	    r7.z = sqrt(r1.w);
/*133*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*134*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*135*/	    r1.w = sqrt(r1.w);
/*136*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*137*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*138*/	    r1.w = inversesqrt(r1.w);
/*139*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*140*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*141*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*142*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*143*/	    r1.w = -r0.y + 1.000000;
/*144*/	    r0.w = min(r0.w, r1.w);
/*145*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*146*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*147*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*148*/	    r0.w = inversesqrt(r0.w);
/*149*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*150*/	  }
/*151*/	}
/*152*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*153*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*154*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*155*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*156*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*157*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*158*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*159*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*160*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*161*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*162*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*163*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*164*/	r1.w = inversesqrt(r1.w);
/*165*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*166*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*167*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*168*/	r2.w = inversesqrt(r1.w);
/*169*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*170*/	r2.w = -r3.x + 1.000000;
/*171*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*172*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*173*/	r5.y = r5.y + r5.y;
/*174*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*175*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*176*/	r6.w = r2.w * 1.539380;
/*177*/	r6.w = cos((r6.w));
/*178*/	r6.w = inversesqrt(r6.w);
/*179*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*180*/	r7.x = saturate(r0.w * 60.000000);
/*181*/	r7.x = -r0.w + r7.x;
/*182*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*183*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*184*/	r8.x = inversesqrt(r8.x);
/*185*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*186*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*187*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*188*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*189*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*190*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*191*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*192*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*193*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*194*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*195*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*196*/	r6.y = -r0.w + 1.000000;
/*197*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*198*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*199*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*200*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*201*/	  r6.y = max(r6.y, 0.000000);
/*202*/	  r6.y = log2(r6.y);
/*203*/	  r6.y = r6.y * 10.000000;
/*204*/	  r6.y = exp2(r6.y);
/*205*/	  r6.y = r6.w * r6.y;
/*206*/	  r6.y = r6.y * r7.x + r0.w;
/*207*/	  r8.x = r2.w * 8.000000;
/*208*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*209*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*210*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*211*/	}
/*212*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*213*/	r0.y = max(r0.x, 0.000000);
/*214*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*215*/	if(floatBitsToUint(r0.x) != 0u) {
/*216*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*217*/	  r0.x = max(r0.x, -1.000000);
/*218*/	  r0.x = min(r0.x, 1.000000);
/*219*/	  r0.z = -abs(r0.x) + 1.000000;
/*220*/	  r0.z = sqrt(r0.z);
/*221*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*222*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*223*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*224*/	  r5.z = r0.z * r5.y;
/*225*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*226*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*227*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*228*/	  r0.x = r5.y * r0.z + r0.x;
/*229*/	  r0.z = r3.x * r3.x;
/*230*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*231*/	  r0.z = r0.z * r3.x + r6.x;
/*232*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*233*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*234*/	  r3.x = -r0.z * r0.z + 1.000000;
/*235*/	  r3.x = max(r3.x, 0.001000);
/*236*/	  r3.x = log2(r3.x);
/*237*/	  r5.x = r3.x * 4.950617;
/*238*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*239*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*240*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*241*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*242*/	  r0.z = floatBitsToInt(r0.z);
/*243*/	  r5.x = r3.x * r3.x + -r5.x;
/*244*/	  r5.x = sqrt(r5.x);
/*245*/	  r3.x = -r3.x + r5.x;
/*246*/	  r3.x = max(r3.x, 0.000000);
/*247*/	  r3.x = sqrt(r3.x);
/*248*/	  r0.z = r0.z * r3.x;
/*249*/	  r0.z = r0.z * 1.414214;
/*250*/	  r0.z = 0.008727 / r0.z;
/*251*/	  r0.z = max(r0.z, 0.000100);
/*252*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*253*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*254*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*255*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*256*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*257*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*258*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*259*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*260*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*261*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*262*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*263*/	  r0.x = floatBitsToInt(r0.x);
/*264*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*265*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*266*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*267*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*268*/	  r0.x = r0.x * r5.x + 1.000000;
/*269*/	  r0.x = r0.x * 0.500000;
/*270*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*271*/	  r0.z = r0.z * r5.y + 1.000000;
/*272*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*273*/	  r0.z = min(r0.y, 1.000000);
/*274*/	  r2.w = r2.w * 1.570796;
/*275*/	  r2.w = sin(r2.w);
/*276*/	  r0.z = r0.z + -1.000000;
/*277*/	  r0.z = r2.w * r0.z + 1.000000;
/*278*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*279*/	  r2.w = max(r2.w, 0.000000);
/*280*/	  r2.w = log2(r2.w);
/*281*/	  r2.w = r2.w * 10.000000;
/*282*/	  r2.w = exp2(r2.w);
/*283*/	  r2.w = r6.w * r2.w;
/*284*/	  r2.w = r2.w * r7.x + r0.w;
/*285*/	  r0.x = r0.z * abs(r0.x);
/*286*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*287*/	} else {
/*288*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*289*/	}
/*290*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*291*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*292*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*293*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*294*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*295*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*296*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*297*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*298*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*299*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*300*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*301*/	r2.w = 1.000000;
/*302*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*303*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*304*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*305*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*306*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*307*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*308*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*309*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*310*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*311*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*312*/	if(r0.w != 0) discard;
/*313*/	r0.w = sqrt(r1.w);
/*314*/	r1.x = saturate(cb3.data[0].w)/**/;
/*315*/	r1.x = -r1.x + 1.000000;
/*316*/	r1.x = r1.x * 8.000000 + -4.000000;
/*317*/	r1.y = saturate(cb3.data[1].x)/**/;
/*318*/	r1.y = -r1.y + 1.000000;
/*319*/	r1.y = r1.y * 1000.000000;
/*320*/	r0.w = r0.w / r1.y;
/*321*/	r0.w = r0.w + r1.x;
/*322*/	r0.w = r0.w * 1.442695;
/*323*/	r0.w = exp2(r0.w);
/*324*/	r0.w = cb3.data[1].y / r0.w;
/*325*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*326*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*327*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*328*/	r1.x = r1.x + -cb3.data[1].z;
/*329*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*330*/	r1.x = saturate(r1.y * r1.x);
/*331*/	r1.y = r1.x * -2.000000 + 3.000000;
/*332*/	r1.x = r1.x * r1.x;
/*333*/	r1.x = r1.x * r1.y;
/*334*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*335*/	r1.y = sqrt(r1.y);
/*336*/	r1.z = max(cb3.data[2].z, 0.001000);
/*337*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*338*/	r1.y = r1.z * r1.y;
/*339*/	r1.y = min(r1.y, 1.000000);
/*340*/	r1.z = r1.y * -2.000000 + 3.000000;
/*341*/	r1.y = r1.y * r1.y;
/*342*/	r1.y = r1.y * r1.z;
/*343*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*344*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*345*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*346*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*347*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*348*/	r4.w = max(r4.y, 0.000000);
/*349*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*350*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*351*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*352*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*353*/	r0.w = saturate(r0.w * r1.y);
/*354*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*355*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*356*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*357*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*358*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*359*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*360*/	return;
}
