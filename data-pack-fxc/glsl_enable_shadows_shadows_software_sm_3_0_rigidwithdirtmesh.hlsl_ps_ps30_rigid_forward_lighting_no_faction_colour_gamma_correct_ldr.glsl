//
//
// Shader Model 4
// Fragment Shader
//
// id: 5246 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdirtmesh.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
/*23*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*24*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.yyyz).zw;
/*25*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*26*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*27*/	r1.w = r4.w * r5.w;
/*28*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*29*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*30*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*31*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*32*/	r2.w = inversesqrt(r2.w);
/*33*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*34*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*35*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*36*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*37*/	r1.w = inversesqrt(r1.w);
/*38*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*39*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*42*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*43*/	r1.w = inversesqrt(r1.w);
/*44*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*45*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*46*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*47*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*48*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*51*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*52*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*53*/	if(floatBitsToUint(r0.w) != 0u) {
/*54*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*55*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*56*/	  r0.w = r3.w * cb1.data[26].x;
/*57*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*58*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*59*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*60*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*61*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*62*/	}
/*63*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*64*/	if(floatBitsToUint(r0.w) != 0u) {
/*65*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*66*/	  if(floatBitsToUint(r0.w) != 0u) {
/*67*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*68*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*69*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*70*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*71*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*72*/	    r0.w = -r0.w + 1.000000;
/*73*/	    r0.w = max(r0.w, 0.000000);
/*74*/	    r8.z = sqrt(r0.w);
/*75*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*76*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*77*/	    r0.w = inversesqrt(r0.w);
/*78*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*79*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*80*/	    r10.y = -1.000000;
/*81*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*82*/	    r0.w = inversesqrt(r0.w);
/*83*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*84*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*85*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*86*/	    r1.w = r1.w * 1.250000;
/*87*/	    r1.w = min(r1.w, 1.000000);
/*88*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*89*/	    r2.w = r2.w * 4.000000;
/*90*/	    r1.w = r1.w * 0.200000 + r2.w;
/*91*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*92*/	    r0.w = r0.w + -r1.w;
/*93*/	    r0.w = saturate(r0.w * 200.000000);
/*94*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*95*/	    r0.w = r0.w * r0.w;
/*96*/	    r0.w = r0.w * r1.w;
/*97*/	    r3.x = r0.w * -r3.x + r3.x;
/*98*/	    r1.w = -r3.y + 0.200000;
/*99*/	    r3.y = r0.w * r1.w + r3.y;
/*100*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*101*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*102*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*103*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*104*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*105*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*106*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*107*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*108*/	    r1.w = -r1.w + 1.000000;
/*109*/	    r1.w = max(r1.w, 0.000000);
/*110*/	    r7.z = sqrt(r1.w);
/*111*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*112*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*113*/	    r1.w = sqrt(r1.w);
/*114*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*115*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*116*/	    r1.w = inversesqrt(r1.w);
/*117*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*118*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*119*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*120*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*121*/	    r1.w = -r0.y + 1.000000;
/*122*/	    r0.w = min(r0.w, r1.w);
/*123*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*124*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*125*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*126*/	    r0.w = inversesqrt(r0.w);
/*127*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*128*/	  }
/*129*/	}
/*130*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*131*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*132*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*133*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*134*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*135*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*136*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*137*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*138*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*139*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*140*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*141*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*142*/	r1.w = inversesqrt(r1.w);
/*143*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*144*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*145*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*146*/	r2.w = inversesqrt(r1.w);
/*147*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*148*/	r2.w = -r3.x + 1.000000;
/*149*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*150*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*151*/	r5.y = r5.y + r5.y;
/*152*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*153*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*154*/	r6.w = r2.w * 1.539380;
/*155*/	r6.w = cos((r6.w));
/*156*/	r6.w = inversesqrt(r6.w);
/*157*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*158*/	r7.x = saturate(r0.w * 60.000000);
/*159*/	r7.x = -r0.w + r7.x;
/*160*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*161*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*162*/	r8.x = inversesqrt(r8.x);
/*163*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*164*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*165*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*166*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*167*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*168*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*169*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*170*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*171*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*172*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*173*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*174*/	r6.y = -r0.w + 1.000000;
/*175*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*176*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*177*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*178*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*179*/	  r6.y = max(r6.y, 0.000000);
/*180*/	  r6.y = log2(r6.y);
/*181*/	  r6.y = r6.y * 10.000000;
/*182*/	  r6.y = exp2(r6.y);
/*183*/	  r6.y = r6.w * r6.y;
/*184*/	  r6.y = r6.y * r7.x + r0.w;
/*185*/	  r8.x = r2.w * 8.000000;
/*186*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*187*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*188*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*189*/	}
/*190*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*191*/	r0.y = max(r0.x, 0.000000);
/*192*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*193*/	if(floatBitsToUint(r0.x) != 0u) {
/*194*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*195*/	  r0.x = max(r0.x, -1.000000);
/*196*/	  r0.x = min(r0.x, 1.000000);
/*197*/	  r0.z = -abs(r0.x) + 1.000000;
/*198*/	  r0.z = sqrt(r0.z);
/*199*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*200*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*201*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*202*/	  r5.z = r0.z * r5.y;
/*203*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*204*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*205*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*206*/	  r0.x = r5.y * r0.z + r0.x;
/*207*/	  r0.z = r3.x * r3.x;
/*208*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*209*/	  r0.z = r0.z * r3.x + r6.x;
/*210*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*211*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*212*/	  r3.x = -r0.z * r0.z + 1.000000;
/*213*/	  r3.x = max(r3.x, 0.001000);
/*214*/	  r3.x = log2(r3.x);
/*215*/	  r5.x = r3.x * 4.950617;
/*216*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*217*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*218*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*219*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*220*/	  r0.z = floatBitsToInt(r0.z);
/*221*/	  r5.x = r3.x * r3.x + -r5.x;
/*222*/	  r5.x = sqrt(r5.x);
/*223*/	  r3.x = -r3.x + r5.x;
/*224*/	  r3.x = max(r3.x, 0.000000);
/*225*/	  r3.x = sqrt(r3.x);
/*226*/	  r0.z = r0.z * r3.x;
/*227*/	  r0.z = r0.z * 1.414214;
/*228*/	  r0.z = 0.008727 / r0.z;
/*229*/	  r0.z = max(r0.z, 0.000100);
/*230*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*231*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*232*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*233*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*234*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*235*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*236*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*237*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*238*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*239*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*240*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*241*/	  r0.x = floatBitsToInt(r0.x);
/*242*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*243*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*244*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*245*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*246*/	  r0.x = r0.x * r5.x + 1.000000;
/*247*/	  r0.x = r0.x * 0.500000;
/*248*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*249*/	  r0.z = r0.z * r5.y + 1.000000;
/*250*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*251*/	  r0.z = min(r0.y, 1.000000);
/*252*/	  r2.w = r2.w * 1.570796;
/*253*/	  r2.w = sin(r2.w);
/*254*/	  r0.z = r0.z + -1.000000;
/*255*/	  r0.z = r2.w * r0.z + 1.000000;
/*256*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*257*/	  r2.w = max(r2.w, 0.000000);
/*258*/	  r2.w = log2(r2.w);
/*259*/	  r2.w = r2.w * 10.000000;
/*260*/	  r2.w = exp2(r2.w);
/*261*/	  r2.w = r6.w * r2.w;
/*262*/	  r2.w = r2.w * r7.x + r0.w;
/*263*/	  r0.x = r0.z * abs(r0.x);
/*264*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*265*/	} else {
/*266*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*267*/	}
/*268*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*269*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*270*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*271*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*272*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*273*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*274*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*275*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*276*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*277*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*278*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*279*/	r2.w = 1.000000;
/*280*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*281*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*282*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*283*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*284*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*285*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*286*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*287*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*288*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*289*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*290*/	if(r0.w != 0) discard;
/*291*/	r0.w = sqrt(r1.w);
/*292*/	r1.x = saturate(cb3.data[0].w)/**/;
/*293*/	r1.x = -r1.x + 1.000000;
/*294*/	r1.x = r1.x * 8.000000 + -4.000000;
/*295*/	r1.y = saturate(cb3.data[1].x)/**/;
/*296*/	r1.y = -r1.y + 1.000000;
/*297*/	r1.y = r1.y * 1000.000000;
/*298*/	r0.w = r0.w / r1.y;
/*299*/	r0.w = r0.w + r1.x;
/*300*/	r0.w = r0.w * 1.442695;
/*301*/	r0.w = exp2(r0.w);
/*302*/	r0.w = cb3.data[1].y / r0.w;
/*303*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*304*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*305*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*306*/	r1.x = r1.x + -cb3.data[1].z;
/*307*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*308*/	r1.x = saturate(r1.y * r1.x);
/*309*/	r1.y = r1.x * -2.000000 + 3.000000;
/*310*/	r1.x = r1.x * r1.x;
/*311*/	r1.x = r1.x * r1.y;
/*312*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*313*/	r1.y = sqrt(r1.y);
/*314*/	r1.z = max(cb3.data[2].z, 0.001000);
/*315*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*316*/	r1.y = r1.z * r1.y;
/*317*/	r1.y = min(r1.y, 1.000000);
/*318*/	r1.z = r1.y * -2.000000 + 3.000000;
/*319*/	r1.y = r1.y * r1.y;
/*320*/	r1.y = r1.y * r1.z;
/*321*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*322*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*323*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*324*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*325*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*326*/	r4.w = max(r4.y, 0.000000);
/*327*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*328*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*329*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*330*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*331*/	r0.w = saturate(r0.w * r1.y);
/*332*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*333*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*334*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*335*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*336*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*337*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*338*/	return;
}
