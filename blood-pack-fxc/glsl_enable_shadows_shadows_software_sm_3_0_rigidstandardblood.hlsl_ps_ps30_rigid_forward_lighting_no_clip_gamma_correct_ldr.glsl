//
//
// Shader Model 4
// Fragment Shader
//
// id: 4772 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidstandardblood.hlsl_PS_ps30_rigid_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*7*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*8*/	color0.w = r0.x * r1.w;
/*9*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*11*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*12*/	r0.x = saturate(vsOut_N0.w);
/*13*/	r3.xyz = (r3.xyzx + -cb6.data[0].xyzx).xyz;
/*14*/	r3.xyz = (r0.xxxx * r3.xyzx + cb6.data[0].xyzx).xyz;
/*15*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*16*/	r4.xyz = (r4.xyzx + -cb6.data[1].xyzx).xyz;
/*17*/	r4.xyz = (r0.xxxx * r4.xyzx + cb6.data[1].xyzx).xyz;
/*18*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*19*/	r5.xyz = (r5.xyzx + -cb6.data[2].xyzx).xyz;
/*20*/	r0.xyw = (r0.xxxx * r5.xyxz + cb6.data[2].xyxz).xyw;
/*21*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*22*/	r1.xyz = (r2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*23*/	r3.xyz = (r4.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r2.yyyy * r3.xyzx + r1.xyzx).xyz;
/*25*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*26*/	r0.xyw = (r2.zzzz * r0.xyxw + r1.xyxz).xyw;
/*27*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*29*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*31*/	r1.w = -r1.w + 1.000000;
/*32*/	r1.w = max(r1.w, 0.000000);
/*33*/	r1.z = sqrt(r1.w);
/*34*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*35*/	r2.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx).xy;
/*36*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*37*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*38*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*39*/	r1.w = saturate(-r1.w + r2.w);
/*40*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*41*/	if(floatBitsToUint(r1.w) != 0u) {
/*42*/	  r1.w = -r2.w + 1.000000;
/*43*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*44*/	  r1.w = -r1.w + 1.000000;
/*45*/	  r1.w = -r1.w * r1.w + 1.000000;
/*46*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*47*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*48*/	  r1.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*49*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*50*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*51*/	  r3.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*52*/	  r0.xyw = (r1.wwww * r3.xyxz + r2.xyxz).xyw;
/*53*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*54*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*55*/	} else {
/*56*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*57*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*58*/	}
/*59*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*60*/	r1.w = inversesqrt(r1.w);
/*61*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*62*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*63*/	r1.w = inversesqrt(r1.w);
/*64*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*65*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*68*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*69*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*70*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*71*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*74*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*75*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*76*/	if(floatBitsToUint(r0.z) != 0u) {
/*77*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*78*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*79*/	  r0.z = r3.w * cb1.data[26].x;
/*80*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*81*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*82*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*83*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*84*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*85*/	}
/*86*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*87*/	if(floatBitsToUint(r0.z) != 0u) {
/*88*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*89*/	  if(floatBitsToUint(r0.z) != 0u) {
/*90*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*91*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*92*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*93*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*94*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*95*/	    r0.z = -r0.z + 1.000000;
/*96*/	    r0.z = max(r0.z, 0.000000);
/*97*/	    r8.z = sqrt(r0.z);
/*98*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*99*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*100*/	    r0.z = inversesqrt(r0.z);
/*101*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*102*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*103*/	    r10.y = -1.000000;
/*104*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*105*/	    r0.z = inversesqrt(r0.z);
/*106*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*107*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*108*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*109*/	    r1.w = r1.w * 1.250000;
/*110*/	    r1.w = min(r1.w, 1.000000);
/*111*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*112*/	    r2.w = r2.w * 4.000000;
/*113*/	    r1.w = r1.w * 0.200000 + r2.w;
/*114*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*115*/	    r0.z = r0.z + -r1.w;
/*116*/	    r0.z = saturate(r0.z * 200.000000);
/*117*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*118*/	    r0.z = r0.z * r0.z;
/*119*/	    r0.z = r0.z * r1.w;
/*120*/	    r3.x = r0.z * -r3.x + r3.x;
/*121*/	    r1.w = -r3.y + 0.200000;
/*122*/	    r3.y = r0.z * r1.w + r3.y;
/*123*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*124*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*125*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*126*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*127*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*128*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*129*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*130*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*131*/	    r1.w = -r1.w + 1.000000;
/*132*/	    r1.w = max(r1.w, 0.000000);
/*133*/	    r7.z = sqrt(r1.w);
/*134*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*135*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*136*/	    r1.w = sqrt(r1.w);
/*137*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*138*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*139*/	    r1.w = inversesqrt(r1.w);
/*140*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*141*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*142*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*143*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*144*/	    r1.w = -r1.y + 1.000000;
/*145*/	    r0.z = min(r0.z, r1.w);
/*146*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*147*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*148*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*149*/	    r0.z = inversesqrt(r0.z);
/*150*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*151*/	  }
/*152*/	}
/*153*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*154*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*155*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*156*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*157*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*158*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*159*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*160*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*161*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*162*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*163*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*164*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*165*/	r1.w = inversesqrt(r1.w);
/*166*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*167*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*168*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*169*/	r2.w = inversesqrt(r1.w);
/*170*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*171*/	r2.w = -r3.x + 1.000000;
/*172*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*173*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*174*/	r5.y = r5.y + r5.y;
/*175*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*176*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*177*/	r6.w = r2.w * 1.539380;
/*178*/	r6.w = cos((r6.w));
/*179*/	r6.w = inversesqrt(r6.w);
/*180*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*181*/	r7.x = saturate(r0.z * 60.000000);
/*182*/	r7.x = -r0.z + r7.x;
/*183*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*184*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*185*/	r8.x = inversesqrt(r8.x);
/*186*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*187*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*188*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*189*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*190*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*191*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*192*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*193*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*194*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*195*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*196*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*197*/	r6.y = -r0.z + 1.000000;
/*198*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*199*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*200*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*201*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*202*/	  r6.y = max(r6.y, 0.000000);
/*203*/	  r6.y = log2(r6.y);
/*204*/	  r6.y = r6.y * 10.000000;
/*205*/	  r6.y = exp2(r6.y);
/*206*/	  r6.y = r6.w * r6.y;
/*207*/	  r6.y = r6.y * r7.x + r0.z;
/*208*/	  r8.x = r2.w * 8.000000;
/*209*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*210*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*211*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*212*/	}
/*213*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*214*/	r1.y = max(r1.x, 0.000000);
/*215*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*216*/	if(floatBitsToUint(r1.x) != 0u) {
/*217*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*218*/	  r1.x = max(r1.x, -1.000000);
/*219*/	  r1.x = min(r1.x, 1.000000);
/*220*/	  r1.z = -abs(r1.x) + 1.000000;
/*221*/	  r1.z = sqrt(r1.z);
/*222*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*223*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*224*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*225*/	  r5.z = r1.z * r5.y;
/*226*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*227*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*228*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*229*/	  r1.x = r5.y * r1.z + r1.x;
/*230*/	  r1.z = r3.x * r3.x;
/*231*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*232*/	  r1.z = r1.z * r3.x + r6.x;
/*233*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*234*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*235*/	  r3.x = -r1.z * r1.z + 1.000000;
/*236*/	  r3.x = max(r3.x, 0.001000);
/*237*/	  r3.x = log2(r3.x);
/*238*/	  r5.x = r3.x * 4.950617;
/*239*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*240*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*241*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*242*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*243*/	  r1.z = floatBitsToInt(r1.z);
/*244*/	  r5.x = r3.x * r3.x + -r5.x;
/*245*/	  r5.x = sqrt(r5.x);
/*246*/	  r3.x = -r3.x + r5.x;
/*247*/	  r3.x = max(r3.x, 0.000000);
/*248*/	  r3.x = sqrt(r3.x);
/*249*/	  r1.z = r1.z * r3.x;
/*250*/	  r1.z = r1.z * 1.414214;
/*251*/	  r1.z = 0.008727 / r1.z;
/*252*/	  r1.z = max(r1.z, 0.000100);
/*253*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*254*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*255*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*256*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*257*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*258*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*259*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*260*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*261*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*262*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*263*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*264*/	  r1.x = floatBitsToInt(r1.x);
/*265*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*266*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*267*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*268*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*269*/	  r1.x = r1.x * r5.x + 1.000000;
/*270*/	  r1.x = r1.x * 0.500000;
/*271*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*272*/	  r1.z = r1.z * r5.y + 1.000000;
/*273*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*274*/	  r1.z = min(r1.y, 1.000000);
/*275*/	  r2.w = r2.w * 1.570796;
/*276*/	  r2.w = sin(r2.w);
/*277*/	  r1.z = r1.z + -1.000000;
/*278*/	  r1.z = r2.w * r1.z + 1.000000;
/*279*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*280*/	  r2.w = max(r2.w, 0.000000);
/*281*/	  r2.w = log2(r2.w);
/*282*/	  r2.w = r2.w * 10.000000;
/*283*/	  r2.w = exp2(r2.w);
/*284*/	  r2.w = r6.w * r2.w;
/*285*/	  r2.w = r2.w * r7.x + r0.z;
/*286*/	  r1.x = r1.z * abs(r1.x);
/*287*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*288*/	} else {
/*289*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*290*/	}
/*291*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*292*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*293*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*294*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*295*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*296*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*297*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*298*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*299*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*300*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*301*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*302*/	r2.w = 1.000000;
/*303*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*304*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*305*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*306*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*307*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*308*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*309*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*310*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*311*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*312*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*313*/	if(r0.w != 0) discard;
/*314*/	r0.w = sqrt(r1.w);
/*315*/	r1.x = saturate(cb3.data[0].w)/**/;
/*316*/	r1.x = -r1.x + 1.000000;
/*317*/	r1.x = r1.x * 8.000000 + -4.000000;
/*318*/	r1.y = saturate(cb3.data[1].x)/**/;
/*319*/	r1.y = -r1.y + 1.000000;
/*320*/	r1.y = r1.y * 1000.000000;
/*321*/	r0.w = r0.w / r1.y;
/*322*/	r0.w = r0.w + r1.x;
/*323*/	r0.w = r0.w * 1.442695;
/*324*/	r0.w = exp2(r0.w);
/*325*/	r0.w = cb3.data[1].y / r0.w;
/*326*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*327*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*328*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*329*/	r1.x = r1.x + -cb3.data[1].z;
/*330*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*331*/	r1.x = saturate(r1.y * r1.x);
/*332*/	r1.y = r1.x * -2.000000 + 3.000000;
/*333*/	r1.x = r1.x * r1.x;
/*334*/	r1.x = r1.x * r1.y;
/*335*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*336*/	r1.y = sqrt(r1.y);
/*337*/	r1.z = max(cb3.data[2].z, 0.001000);
/*338*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*339*/	r1.y = r1.z * r1.y;
/*340*/	r1.y = min(r1.y, 1.000000);
/*341*/	r1.z = r1.y * -2.000000 + 3.000000;
/*342*/	r1.y = r1.y * r1.y;
/*343*/	r1.y = r1.y * r1.z;
/*344*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*345*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*346*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*347*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*348*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*349*/	r4.w = max(r4.y, 0.000000);
/*350*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*351*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*352*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*353*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*354*/	r0.w = saturate(r0.w * r1.y);
/*355*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*356*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*357*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*358*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*359*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*360*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*361*/	return;
}
