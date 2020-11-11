//
//
// Shader Model 4
// Fragment Shader
//
// id: 1196 - fxc/glsl_SM_3_0_rigidwithdirtmesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*20*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.yyyz).zw;
/*21*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*22*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*23*/	r1.w = r4.w * r5.w;
/*24*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*25*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*26*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*27*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*28*/	r2.w = inversesqrt(r2.w);
/*29*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*30*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*31*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*32*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*33*/	r1.w = inversesqrt(r1.w);
/*34*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*35*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*36*/	r1.w = inversesqrt(r1.w);
/*37*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*38*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*39*/	r1.w = inversesqrt(r1.w);
/*40*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*41*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*42*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*43*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*44*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*45*/	r1.w = inversesqrt(r1.w);
/*46*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*47*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*48*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*49*/	if(floatBitsToUint(r0.w) != 0u) {
/*50*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*51*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*52*/	  r0.w = r3.w * cb1.data[26].x;
/*53*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*54*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*55*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*56*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*57*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*58*/	}
/*59*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*60*/	if(floatBitsToUint(r0.w) != 0u) {
/*61*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*62*/	  if(floatBitsToUint(r0.w) != 0u) {
/*63*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*64*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*65*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*66*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*67*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*68*/	    r0.w = -r0.w + 1.000000;
/*69*/	    r0.w = max(r0.w, 0.000000);
/*70*/	    r8.z = sqrt(r0.w);
/*71*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*72*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*73*/	    r0.w = inversesqrt(r0.w);
/*74*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*75*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*76*/	    r10.y = -1.000000;
/*77*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*78*/	    r0.w = inversesqrt(r0.w);
/*79*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*80*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*81*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*82*/	    r1.w = r1.w * 1.250000;
/*83*/	    r1.w = min(r1.w, 1.000000);
/*84*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*85*/	    r2.w = r2.w * 4.000000;
/*86*/	    r1.w = r1.w * 0.200000 + r2.w;
/*87*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*88*/	    r0.w = r0.w + -r1.w;
/*89*/	    r0.w = saturate(r0.w * 200.000000);
/*90*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*91*/	    r0.w = r0.w * r0.w;
/*92*/	    r0.w = r0.w * r1.w;
/*93*/	    r3.x = r0.w * -r3.x + r3.x;
/*94*/	    r1.w = -r3.y + 0.200000;
/*95*/	    r3.y = r0.w * r1.w + r3.y;
/*96*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*97*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*98*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*99*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*100*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*101*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*102*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*103*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*104*/	    r1.w = -r1.w + 1.000000;
/*105*/	    r1.w = max(r1.w, 0.000000);
/*106*/	    r7.z = sqrt(r1.w);
/*107*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*108*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*109*/	    r1.w = sqrt(r1.w);
/*110*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*111*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*112*/	    r1.w = inversesqrt(r1.w);
/*113*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*114*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*115*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*116*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*117*/	    r1.w = -r0.y + 1.000000;
/*118*/	    r0.w = min(r0.w, r1.w);
/*119*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*120*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*121*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*122*/	    r0.w = inversesqrt(r0.w);
/*123*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*124*/	  }
/*125*/	}
/*126*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*127*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*128*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*129*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*130*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*131*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*132*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*133*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*134*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*135*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*136*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*137*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*138*/	r1.w = inversesqrt(r1.w);
/*139*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*140*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*141*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*142*/	r2.w = inversesqrt(r1.w);
/*143*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*144*/	r2.w = -r3.x + 1.000000;
/*145*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*146*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*147*/	r5.y = r5.y + r5.y;
/*148*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*149*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*150*/	r6.w = r2.w * 1.539380;
/*151*/	r6.w = cos((r6.w));
/*152*/	r6.w = inversesqrt(r6.w);
/*153*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*154*/	r7.x = saturate(r0.w * 60.000000);
/*155*/	r7.x = -r0.w + r7.x;
/*156*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*157*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*158*/	r8.x = inversesqrt(r8.x);
/*159*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*160*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*161*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*162*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*163*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*164*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*165*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*166*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*167*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*168*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*169*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*170*/	r6.y = -r0.w + 1.000000;
/*171*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*172*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*173*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*174*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*175*/	  r6.y = max(r6.y, 0.000000);
/*176*/	  r6.y = log2(r6.y);
/*177*/	  r6.y = r6.y * 10.000000;
/*178*/	  r6.y = exp2(r6.y);
/*179*/	  r6.y = r6.w * r6.y;
/*180*/	  r6.y = r6.y * r7.x + r0.w;
/*181*/	  r8.x = r2.w * 8.000000;
/*182*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*183*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*184*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*185*/	}
/*186*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*187*/	r0.y = max(r0.x, 0.000000);
/*188*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*189*/	if(floatBitsToUint(r0.x) != 0u) {
/*190*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*191*/	  r0.x = max(r0.x, -1.000000);
/*192*/	  r0.x = min(r0.x, 1.000000);
/*193*/	  r0.z = -abs(r0.x) + 1.000000;
/*194*/	  r0.z = sqrt(r0.z);
/*195*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*196*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*197*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*198*/	  r5.z = r0.z * r5.y;
/*199*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*200*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*201*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*202*/	  r0.x = r5.y * r0.z + r0.x;
/*203*/	  r0.z = r3.x * r3.x;
/*204*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*205*/	  r0.z = r0.z * r3.x + r6.x;
/*206*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*207*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*208*/	  r3.x = -r0.z * r0.z + 1.000000;
/*209*/	  r3.x = max(r3.x, 0.001000);
/*210*/	  r3.x = log2(r3.x);
/*211*/	  r5.x = r3.x * 4.950617;
/*212*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*213*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*214*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*215*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*216*/	  r0.z = floatBitsToInt(r0.z);
/*217*/	  r5.x = r3.x * r3.x + -r5.x;
/*218*/	  r5.x = sqrt(r5.x);
/*219*/	  r3.x = -r3.x + r5.x;
/*220*/	  r3.x = max(r3.x, 0.000000);
/*221*/	  r3.x = sqrt(r3.x);
/*222*/	  r0.z = r0.z * r3.x;
/*223*/	  r0.z = r0.z * 1.414214;
/*224*/	  r0.z = 0.008727 / r0.z;
/*225*/	  r0.z = max(r0.z, 0.000100);
/*226*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*227*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*228*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*229*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*230*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*231*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*232*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*233*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*234*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*235*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*236*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*237*/	  r0.x = floatBitsToInt(r0.x);
/*238*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*239*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*240*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*241*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*242*/	  r0.x = r0.x * r5.x + 1.000000;
/*243*/	  r0.x = r0.x * 0.500000;
/*244*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*245*/	  r0.z = r0.z * r5.y + 1.000000;
/*246*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*247*/	  r0.z = min(r0.y, 1.000000);
/*248*/	  r2.w = r2.w * 1.570796;
/*249*/	  r2.w = sin(r2.w);
/*250*/	  r0.z = r0.z + -1.000000;
/*251*/	  r0.z = r2.w * r0.z + 1.000000;
/*252*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*253*/	  r2.w = max(r2.w, 0.000000);
/*254*/	  r2.w = log2(r2.w);
/*255*/	  r2.w = r2.w * 10.000000;
/*256*/	  r2.w = exp2(r2.w);
/*257*/	  r2.w = r6.w * r2.w;
/*258*/	  r2.w = r2.w * r7.x + r0.w;
/*259*/	  r0.x = r0.z * abs(r0.x);
/*260*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*261*/	} else {
/*262*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*263*/	}
/*264*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*265*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*266*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*267*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*268*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*269*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*270*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*271*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*272*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*273*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*274*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*275*/	r2.w = 1.000000;
/*276*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*277*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*278*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*279*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*280*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*281*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*282*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*283*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*284*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*285*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*286*/	if(r0.w != 0) discard;
/*287*/	r0.w = sqrt(r1.w);
/*288*/	r1.x = saturate(cb3.data[0].w)/**/;
/*289*/	r1.x = -r1.x + 1.000000;
/*290*/	r1.x = r1.x * 8.000000 + -4.000000;
/*291*/	r1.y = saturate(cb3.data[1].x)/**/;
/*292*/	r1.y = -r1.y + 1.000000;
/*293*/	r1.y = r1.y * 1000.000000;
/*294*/	r0.w = r0.w / r1.y;
/*295*/	r0.w = r0.w + r1.x;
/*296*/	r0.w = r0.w * 1.442695;
/*297*/	r0.w = exp2(r0.w);
/*298*/	r0.w = cb3.data[1].y / r0.w;
/*299*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*300*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*301*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*302*/	r1.x = r1.x + -cb3.data[1].z;
/*303*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*304*/	r1.x = saturate(r1.y * r1.x);
/*305*/	r1.y = r1.x * -2.000000 + 3.000000;
/*306*/	r1.x = r1.x * r1.x;
/*307*/	r1.x = r1.x * r1.y;
/*308*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*309*/	r1.y = sqrt(r1.y);
/*310*/	r1.z = max(cb3.data[2].z, 0.001000);
/*311*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*312*/	r1.y = r1.z * r1.y;
/*313*/	r1.y = min(r1.y, 1.000000);
/*314*/	r1.z = r1.y * -2.000000 + 3.000000;
/*315*/	r1.y = r1.y * r1.y;
/*316*/	r1.y = r1.y * r1.z;
/*317*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*318*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*319*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*320*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*321*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*322*/	r4.w = max(r4.y, 0.000000);
/*323*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*324*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*325*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*326*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*327*/	r0.w = saturate(r0.w * r1.y);
/*328*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*329*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*330*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*331*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*332*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*333*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*334*/	return;
}
