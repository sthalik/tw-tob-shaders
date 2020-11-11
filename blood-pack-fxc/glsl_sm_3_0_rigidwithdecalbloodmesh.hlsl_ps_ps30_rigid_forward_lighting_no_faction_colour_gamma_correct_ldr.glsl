//
//
// Shader Model 4
// Fragment Shader
//
// id: 1147 - fxc/glsl_SM_3_0_rigidwithdecalbloodmesh.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*23*/	r3.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*24*/	r4.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*25*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*26*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*27*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*28*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*29*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*30*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*31*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*32*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*33*/	if(floatBitsToUint(r1.w) != 0u) {
/*34*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*35*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*37*/	  r1.w = -r1.w + 1.000000;
/*38*/	  r1.w = max(r1.w, 0.000000);
/*39*/	  r5.z = sqrt(r1.w);
/*40*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*41*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*42*/	  r1.w = r3.y * r7.w;
/*43*/	  r3.y = r1.w * -0.500000 + r3.y;
/*44*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*45*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*46*/	  r1.w = -r4.w * r6.w + 1.000000;
/*47*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*48*/	  r4.xyz = (-r0.xywx + r5.xyzx).xyz;
/*49*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*50*/	}
/*51*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy).zw;
/*52*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*53*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*54*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*55*/	r1.w = saturate(-r1.w + r4.w);
/*56*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*57*/	if(floatBitsToUint(r1.w) != 0u) {
/*58*/	  r1.w = -r4.w + 1.000000;
/*59*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*60*/	  r1.w = -r1.w + 1.000000;
/*61*/	  r1.w = -r1.w * r1.w + 1.000000;
/*62*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*63*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*64*/	  r1.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*65*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*66*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*67*/	  r5.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*68*/	  r1.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*69*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*70*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*71*/	}
/*72*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*75*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*78*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*81*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*82*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*83*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*84*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*87*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*88*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*89*/	if(floatBitsToUint(r0.w) != 0u) {
/*90*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*91*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*92*/	  r0.w = r3.w * cb1.data[26].x;
/*93*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*94*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*95*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*96*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*97*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*98*/	}
/*99*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*100*/	if(floatBitsToUint(r0.w) != 0u) {
/*101*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*102*/	  if(floatBitsToUint(r0.w) != 0u) {
/*103*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*104*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*105*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*106*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*107*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*108*/	    r0.w = -r0.w + 1.000000;
/*109*/	    r0.w = max(r0.w, 0.000000);
/*110*/	    r8.z = sqrt(r0.w);
/*111*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*112*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*115*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*116*/	    r10.y = -1.000000;
/*117*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*118*/	    r0.w = inversesqrt(r0.w);
/*119*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*120*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*121*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*122*/	    r1.w = r1.w * 1.250000;
/*123*/	    r1.w = min(r1.w, 1.000000);
/*124*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*125*/	    r2.w = r2.w * 4.000000;
/*126*/	    r1.w = r1.w * 0.200000 + r2.w;
/*127*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*128*/	    r0.w = r0.w + -r1.w;
/*129*/	    r0.w = saturate(r0.w * 200.000000);
/*130*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*131*/	    r0.w = r0.w * r0.w;
/*132*/	    r0.w = r0.w * r1.w;
/*133*/	    r3.x = r0.w * -r3.x + r3.x;
/*134*/	    r1.w = -r3.y + 0.200000;
/*135*/	    r3.y = r0.w * r1.w + r3.y;
/*136*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*137*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*138*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*139*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*140*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*141*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*142*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*143*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*144*/	    r1.w = -r1.w + 1.000000;
/*145*/	    r1.w = max(r1.w, 0.000000);
/*146*/	    r7.z = sqrt(r1.w);
/*147*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*148*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*149*/	    r1.w = sqrt(r1.w);
/*150*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*151*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*152*/	    r1.w = inversesqrt(r1.w);
/*153*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*154*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*155*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*156*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*157*/	    r1.w = -r0.y + 1.000000;
/*158*/	    r0.w = min(r0.w, r1.w);
/*159*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*160*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*161*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*162*/	    r0.w = inversesqrt(r0.w);
/*163*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*164*/	  }
/*165*/	}
/*166*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*167*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*168*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*169*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*170*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*171*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*172*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*173*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*174*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*175*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*176*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*177*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*178*/	r1.w = inversesqrt(r1.w);
/*179*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*180*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*181*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*182*/	r2.w = inversesqrt(r1.w);
/*183*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*184*/	r2.w = -r3.x + 1.000000;
/*185*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*186*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*187*/	r5.y = r5.y + r5.y;
/*188*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*189*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*190*/	r6.w = r2.w * 1.539380;
/*191*/	r6.w = cos((r6.w));
/*192*/	r6.w = inversesqrt(r6.w);
/*193*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*194*/	r7.x = saturate(r0.w * 60.000000);
/*195*/	r7.x = -r0.w + r7.x;
/*196*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*197*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*198*/	r8.x = inversesqrt(r8.x);
/*199*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*200*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*201*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*202*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*203*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*204*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*205*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*206*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*207*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*208*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*209*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*210*/	r6.y = -r0.w + 1.000000;
/*211*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*212*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*213*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*214*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*215*/	  r6.y = max(r6.y, 0.000000);
/*216*/	  r6.y = log2(r6.y);
/*217*/	  r6.y = r6.y * 10.000000;
/*218*/	  r6.y = exp2(r6.y);
/*219*/	  r6.y = r6.w * r6.y;
/*220*/	  r6.y = r6.y * r7.x + r0.w;
/*221*/	  r8.x = r2.w * 8.000000;
/*222*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*223*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*224*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*225*/	}
/*226*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*227*/	r0.y = max(r0.x, 0.000000);
/*228*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*229*/	if(floatBitsToUint(r0.x) != 0u) {
/*230*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*231*/	  r0.x = max(r0.x, -1.000000);
/*232*/	  r0.x = min(r0.x, 1.000000);
/*233*/	  r0.z = -abs(r0.x) + 1.000000;
/*234*/	  r0.z = sqrt(r0.z);
/*235*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*236*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*237*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*238*/	  r5.z = r0.z * r5.y;
/*239*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*240*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*241*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*242*/	  r0.x = r5.y * r0.z + r0.x;
/*243*/	  r0.z = r3.x * r3.x;
/*244*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*245*/	  r0.z = r0.z * r3.x + r6.x;
/*246*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*247*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*248*/	  r3.x = -r0.z * r0.z + 1.000000;
/*249*/	  r3.x = max(r3.x, 0.001000);
/*250*/	  r3.x = log2(r3.x);
/*251*/	  r5.x = r3.x * 4.950617;
/*252*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*253*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*254*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*255*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*256*/	  r0.z = floatBitsToInt(r0.z);
/*257*/	  r5.x = r3.x * r3.x + -r5.x;
/*258*/	  r5.x = sqrt(r5.x);
/*259*/	  r3.x = -r3.x + r5.x;
/*260*/	  r3.x = max(r3.x, 0.000000);
/*261*/	  r3.x = sqrt(r3.x);
/*262*/	  r0.z = r0.z * r3.x;
/*263*/	  r0.z = r0.z * 1.414214;
/*264*/	  r0.z = 0.008727 / r0.z;
/*265*/	  r0.z = max(r0.z, 0.000100);
/*266*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*267*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*268*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*269*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*270*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*271*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*272*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*273*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*274*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*275*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*276*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*277*/	  r0.x = floatBitsToInt(r0.x);
/*278*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*279*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*280*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*281*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*282*/	  r0.x = r0.x * r5.x + 1.000000;
/*283*/	  r0.x = r0.x * 0.500000;
/*284*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*285*/	  r0.z = r0.z * r5.y + 1.000000;
/*286*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*287*/	  r0.z = min(r0.y, 1.000000);
/*288*/	  r2.w = r2.w * 1.570796;
/*289*/	  r2.w = sin(r2.w);
/*290*/	  r0.z = r0.z + -1.000000;
/*291*/	  r0.z = r2.w * r0.z + 1.000000;
/*292*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*293*/	  r2.w = max(r2.w, 0.000000);
/*294*/	  r2.w = log2(r2.w);
/*295*/	  r2.w = r2.w * 10.000000;
/*296*/	  r2.w = exp2(r2.w);
/*297*/	  r2.w = r6.w * r2.w;
/*298*/	  r2.w = r2.w * r7.x + r0.w;
/*299*/	  r0.x = r0.z * abs(r0.x);
/*300*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*301*/	} else {
/*302*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*303*/	}
/*304*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*305*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*306*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*307*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*308*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*309*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*310*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*311*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*312*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*313*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*314*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*315*/	r2.w = 1.000000;
/*316*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*317*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*318*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*319*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*320*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*321*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*322*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*323*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*324*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*325*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*326*/	if(r0.w != 0) discard;
/*327*/	r0.w = sqrt(r1.w);
/*328*/	r1.x = saturate(cb3.data[0].w)/**/;
/*329*/	r1.x = -r1.x + 1.000000;
/*330*/	r1.x = r1.x * 8.000000 + -4.000000;
/*331*/	r1.y = saturate(cb3.data[1].x)/**/;
/*332*/	r1.y = -r1.y + 1.000000;
/*333*/	r1.y = r1.y * 1000.000000;
/*334*/	r0.w = r0.w / r1.y;
/*335*/	r0.w = r0.w + r1.x;
/*336*/	r0.w = r0.w * 1.442695;
/*337*/	r0.w = exp2(r0.w);
/*338*/	r0.w = cb3.data[1].y / r0.w;
/*339*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*340*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*341*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*342*/	r1.x = r1.x + -cb3.data[1].z;
/*343*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*344*/	r1.x = saturate(r1.y * r1.x);
/*345*/	r1.y = r1.x * -2.000000 + 3.000000;
/*346*/	r1.x = r1.x * r1.x;
/*347*/	r1.x = r1.x * r1.y;
/*348*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*349*/	r1.y = sqrt(r1.y);
/*350*/	r1.z = max(cb3.data[2].z, 0.001000);
/*351*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*352*/	r1.y = r1.z * r1.y;
/*353*/	r1.y = min(r1.y, 1.000000);
/*354*/	r1.z = r1.y * -2.000000 + 3.000000;
/*355*/	r1.y = r1.y * r1.y;
/*356*/	r1.y = r1.y * r1.z;
/*357*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*358*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*359*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*360*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*361*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*362*/	r4.w = max(r4.y, 0.000000);
/*363*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*364*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*365*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*366*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*367*/	r0.w = saturate(r0.w * r1.y);
/*368*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*369*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*370*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*371*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*372*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*373*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*374*/	return;
}
