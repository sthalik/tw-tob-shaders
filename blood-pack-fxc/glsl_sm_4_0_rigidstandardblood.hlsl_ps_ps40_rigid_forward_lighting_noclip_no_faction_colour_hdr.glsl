//
//
// Shader Model 4
// Fragment Shader
//
// id: 774 - fxc/glsl_SM_4_0_rigidstandardblood.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*17*/	r2.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx).xy;
/*18*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*19*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*20*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*21*/	r1.w = saturate(-r1.w + r2.w);
/*22*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*23*/	if(floatBitsToUint(r1.w) != 0u) {
/*24*/	  r1.w = -r2.w + 1.000000;
/*25*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*26*/	  r1.w = -r1.w + 1.000000;
/*27*/	  r1.w = -r1.w * r1.w + 1.000000;
/*28*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*29*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*30*/	  r1.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*31*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*32*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*33*/	  r3.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*34*/	  r1.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*35*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*36*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*37*/	} else {
/*38*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*39*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*40*/	}
/*41*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*42*/	r1.w = inversesqrt(r1.w);
/*43*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*44*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*45*/	r1.w = inversesqrt(r1.w);
/*46*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*47*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*50*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*51*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*52*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*53*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*56*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*57*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*58*/	if(floatBitsToUint(r0.w) != 0u) {
/*59*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*60*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*61*/	  r0.w = r3.w * cb0.data[26].x;
/*62*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*63*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*64*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*65*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*66*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*67*/	}
/*68*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*69*/	if(floatBitsToUint(r0.w) != 0u) {
/*70*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*71*/	  if(floatBitsToUint(r0.w) != 0u) {
/*72*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*73*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*74*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*75*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*76*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*77*/	    r0.w = -r0.w + 1.000000;
/*78*/	    r0.w = max(r0.w, 0.000000);
/*79*/	    r8.z = sqrt(r0.w);
/*80*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*81*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*82*/	    r0.w = inversesqrt(r0.w);
/*83*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*84*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*85*/	    r10.y = -1.000000;
/*86*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*87*/	    r0.w = inversesqrt(r0.w);
/*88*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*89*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*90*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*91*/	    r1.w = r1.w * 1.250000;
/*92*/	    r1.w = min(r1.w, 1.000000);
/*93*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*94*/	    r2.w = r2.w * 4.000000;
/*95*/	    r1.w = r1.w * 0.200000 + r2.w;
/*96*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*97*/	    r0.w = r0.w + -r1.w;
/*98*/	    r0.w = saturate(r0.w * 200.000000);
/*99*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*100*/	    r0.w = r0.w * r0.w;
/*101*/	    r0.w = r0.w * r1.w;
/*102*/	    r3.x = r0.w * -r3.x + r3.x;
/*103*/	    r1.w = -r3.y + 0.200000;
/*104*/	    r3.y = r0.w * r1.w + r3.y;
/*105*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*106*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*107*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*108*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*109*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*110*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*111*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*112*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*113*/	    r1.w = -r1.w + 1.000000;
/*114*/	    r1.w = max(r1.w, 0.000000);
/*115*/	    r7.z = sqrt(r1.w);
/*116*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*117*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*118*/	    r1.w = sqrt(r1.w);
/*119*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*120*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*121*/	    r1.w = inversesqrt(r1.w);
/*122*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*123*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*124*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*125*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*126*/	    r1.w = -r0.y + 1.000000;
/*127*/	    r0.w = min(r0.w, r1.w);
/*128*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*129*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*130*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*131*/	    r0.w = inversesqrt(r0.w);
/*132*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*133*/	  }
/*134*/	}
/*135*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*136*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*137*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*138*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*139*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*140*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*141*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*142*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*143*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*144*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*145*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*146*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*147*/	r1.w = inversesqrt(r1.w);
/*148*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*149*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*150*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*151*/	r1.w = inversesqrt(r1.w);
/*152*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*153*/	r1.w = -r3.x + 1.000000;
/*154*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*155*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*156*/	r4.x = r4.x + r4.x;
/*157*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*158*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*159*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*160*/	r4.w = cos((r6.x));
/*161*/	r4.w = inversesqrt(r4.w);
/*162*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*163*/	r5.w = saturate(r0.w * 60.000000);
/*164*/	r5.w = -r0.w + r5.w;
/*165*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*166*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*167*/	r7.x = inversesqrt(r7.x);
/*168*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*169*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*170*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*171*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*172*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*173*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*174*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*175*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*176*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*177*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*178*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*179*/	r5.y = -r0.w + 1.000000;
/*180*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*181*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*182*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*183*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*184*/	  r5.y = max(r5.y, 0.000000);
/*185*/	  r5.y = log2(r5.y);
/*186*/	  r5.y = r5.y * 10.000000;
/*187*/	  r5.y = exp2(r5.y);
/*188*/	  r5.y = r4.w * r5.y;
/*189*/	  r5.y = r5.y * r5.w + r0.w;
/*190*/	  r7.x = r1.w * 8.000000;
/*191*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*192*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*193*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*194*/	}
/*195*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*196*/	r7.x = max(r5.y, 0.000000);
/*197*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*198*/	if(floatBitsToUint(r5.y) != 0u) {
/*199*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*200*/	  r4.x = max(r4.x, -1.000000);
/*201*/	  r4.x = min(r4.x, 1.000000);
/*202*/	  r4.y = -abs(r4.x) + 1.000000;
/*203*/	  r4.y = sqrt(r4.y);
/*204*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*205*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*206*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*207*/	  r5.y = r4.y * r4.z;
/*208*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*209*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*210*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*211*/	  r4.x = r4.z * r4.y + r4.x;
/*212*/	  r3.x = r3.x * r3.x;
/*213*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*214*/	  r2.w = r3.x * r2.w + r5.x;
/*215*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*216*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*217*/	  r3.x = -r2.w * r2.w + 1.000000;
/*218*/	  r3.x = max(r3.x, 0.001000);
/*219*/	  r3.x = log2(r3.x);
/*220*/	  r4.y = r3.x * 4.950617;
/*221*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*222*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*223*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*224*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*225*/	  r2.w = floatBitsToInt(r2.w);
/*226*/	  r4.y = r3.x * r3.x + -r4.y;
/*227*/	  r4.y = sqrt(r4.y);
/*228*/	  r3.x = -r3.x + r4.y;
/*229*/	  r3.x = max(r3.x, 0.000000);
/*230*/	  r3.x = sqrt(r3.x);
/*231*/	  r2.w = r2.w * r3.x;
/*232*/	  r2.w = r2.w * 1.414214;
/*233*/	  r2.w = 0.008727 / r2.w;
/*234*/	  r2.w = max(r2.w, 0.000100);
/*235*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*236*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*237*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*238*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*239*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*240*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*241*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*242*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*243*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*244*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*245*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*246*/	  r2.w = floatBitsToInt(r2.w);
/*247*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*248*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*249*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*250*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*251*/	  r2.w = r2.w * r4.x + 1.000000;
/*252*/	  r2.w = r2.w * 0.500000;
/*253*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*254*/	  r3.x = r3.x * r4.y + 1.000000;
/*255*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*256*/	  r3.x = min(r7.x, 1.000000);
/*257*/	  r1.w = r1.w * 1.570796;
/*258*/	  r1.w = sin(r1.w);
/*259*/	  r3.x = r3.x + -1.000000;
/*260*/	  r1.w = r1.w * r3.x + 1.000000;
/*261*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*262*/	  r3.x = max(r3.x, 0.000000);
/*263*/	  r3.x = log2(r3.x);
/*264*/	  r3.x = r3.x * 10.000000;
/*265*/	  r3.x = exp2(r3.x);
/*266*/	  r3.x = r4.w * r3.x;
/*267*/	  r3.x = r3.x * r5.w + r0.w;
/*268*/	  r1.w = r1.w * abs(r2.w);
/*269*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*270*/	} else {
/*271*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*272*/	}
/*273*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*274*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*275*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*276*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*277*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*278*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*279*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*280*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*281*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*282*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*283*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*284*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*285*/	r1.w = inversesqrt(r1.w);
/*286*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*287*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*288*/	r1.w = r1.w + r1.w;
/*289*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*290*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*291*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*292*/	r0.x = max(r0.x, 0.000000);
/*293*/	r0.x = log2(r0.x);
/*294*/	r0.x = r0.x * 10.000000;
/*295*/	r0.x = exp2(r0.x);
/*296*/	r0.x = r4.w * r0.x;
/*297*/	r0.x = r0.x * r5.w + r0.w;
/*298*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*299*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*300*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*301*/	r0.w = 1.000000;
/*302*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*303*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*304*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*305*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*306*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*307*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*308*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*309*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*310*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*311*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*312*/	if(r0.x != 0) discard;
/*313*/	color1.x = 1.000000;
/*314*/	return;
}
