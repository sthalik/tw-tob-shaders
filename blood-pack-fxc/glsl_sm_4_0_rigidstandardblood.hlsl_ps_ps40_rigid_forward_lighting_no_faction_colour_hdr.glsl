//
//
// Shader Model 4
// Fragment Shader
//
// id: 772 - fxc/glsl_SM_4_0_rigidstandardblood.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*21*/	r2.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*23*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*24*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*25*/	r1.w = saturate(-r1.w + r2.w);
/*26*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r1.w) != 0u) {
/*28*/	  r1.w = -r2.w + 1.000000;
/*29*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*30*/	  r1.w = -r1.w + 1.000000;
/*31*/	  r1.w = -r1.w * r1.w + 1.000000;
/*32*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*33*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*34*/	  r1.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*35*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*36*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*37*/	  r3.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*38*/	  r1.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*39*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*40*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*41*/	} else {
/*42*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*44*/	}
/*45*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*46*/	r1.w = inversesqrt(r1.w);
/*47*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*48*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*51*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*54*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*55*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*56*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*57*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*60*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*61*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*62*/	if(floatBitsToUint(r0.w) != 0u) {
/*63*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*64*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*65*/	  r0.w = r3.w * cb0.data[26].x;
/*66*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*67*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*68*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*69*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*70*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*71*/	}
/*72*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*73*/	if(floatBitsToUint(r0.w) != 0u) {
/*74*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*75*/	  if(floatBitsToUint(r0.w) != 0u) {
/*76*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*77*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*78*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*79*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*80*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*81*/	    r0.w = -r0.w + 1.000000;
/*82*/	    r0.w = max(r0.w, 0.000000);
/*83*/	    r8.z = sqrt(r0.w);
/*84*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*85*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*86*/	    r0.w = inversesqrt(r0.w);
/*87*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*88*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*89*/	    r10.y = -1.000000;
/*90*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*91*/	    r0.w = inversesqrt(r0.w);
/*92*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*93*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*94*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*95*/	    r1.w = r1.w * 1.250000;
/*96*/	    r1.w = min(r1.w, 1.000000);
/*97*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*98*/	    r2.w = r2.w * 4.000000;
/*99*/	    r1.w = r1.w * 0.200000 + r2.w;
/*100*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*101*/	    r0.w = r0.w + -r1.w;
/*102*/	    r0.w = saturate(r0.w * 200.000000);
/*103*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*104*/	    r0.w = r0.w * r0.w;
/*105*/	    r0.w = r0.w * r1.w;
/*106*/	    r3.x = r0.w * -r3.x + r3.x;
/*107*/	    r1.w = -r3.y + 0.200000;
/*108*/	    r3.y = r0.w * r1.w + r3.y;
/*109*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*110*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*111*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*112*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*113*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*114*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*115*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*116*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*117*/	    r1.w = -r1.w + 1.000000;
/*118*/	    r1.w = max(r1.w, 0.000000);
/*119*/	    r7.z = sqrt(r1.w);
/*120*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*121*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*122*/	    r1.w = sqrt(r1.w);
/*123*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*124*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*125*/	    r1.w = inversesqrt(r1.w);
/*126*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*127*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*128*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*129*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*130*/	    r1.w = -r0.y + 1.000000;
/*131*/	    r0.w = min(r0.w, r1.w);
/*132*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*133*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*134*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*135*/	    r0.w = inversesqrt(r0.w);
/*136*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*137*/	  }
/*138*/	}
/*139*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*140*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*141*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*142*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*143*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*144*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*145*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*146*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*147*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*148*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*149*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*150*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*151*/	r1.w = inversesqrt(r1.w);
/*152*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*153*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*154*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*155*/	r1.w = inversesqrt(r1.w);
/*156*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*157*/	r1.w = -r3.x + 1.000000;
/*158*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*159*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*160*/	r4.x = r4.x + r4.x;
/*161*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*162*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*163*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*164*/	r4.w = cos((r6.x));
/*165*/	r4.w = inversesqrt(r4.w);
/*166*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*167*/	r5.w = saturate(r0.w * 60.000000);
/*168*/	r5.w = -r0.w + r5.w;
/*169*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*170*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*171*/	r7.x = inversesqrt(r7.x);
/*172*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*173*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*174*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*175*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*176*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*177*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*178*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*179*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*180*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*181*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*182*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*183*/	r5.y = -r0.w + 1.000000;
/*184*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*185*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*186*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*187*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*188*/	  r5.y = max(r5.y, 0.000000);
/*189*/	  r5.y = log2(r5.y);
/*190*/	  r5.y = r5.y * 10.000000;
/*191*/	  r5.y = exp2(r5.y);
/*192*/	  r5.y = r4.w * r5.y;
/*193*/	  r5.y = r5.y * r5.w + r0.w;
/*194*/	  r7.x = r1.w * 8.000000;
/*195*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*196*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*197*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*198*/	}
/*199*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*200*/	r7.x = max(r5.y, 0.000000);
/*201*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*202*/	if(floatBitsToUint(r5.y) != 0u) {
/*203*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*204*/	  r4.x = max(r4.x, -1.000000);
/*205*/	  r4.x = min(r4.x, 1.000000);
/*206*/	  r4.y = -abs(r4.x) + 1.000000;
/*207*/	  r4.y = sqrt(r4.y);
/*208*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*209*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*210*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*211*/	  r5.y = r4.y * r4.z;
/*212*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*213*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*214*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*215*/	  r4.x = r4.z * r4.y + r4.x;
/*216*/	  r3.x = r3.x * r3.x;
/*217*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*218*/	  r2.w = r3.x * r2.w + r5.x;
/*219*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*220*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*221*/	  r3.x = -r2.w * r2.w + 1.000000;
/*222*/	  r3.x = max(r3.x, 0.001000);
/*223*/	  r3.x = log2(r3.x);
/*224*/	  r4.y = r3.x * 4.950617;
/*225*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*226*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*227*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*228*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*229*/	  r2.w = floatBitsToInt(r2.w);
/*230*/	  r4.y = r3.x * r3.x + -r4.y;
/*231*/	  r4.y = sqrt(r4.y);
/*232*/	  r3.x = -r3.x + r4.y;
/*233*/	  r3.x = max(r3.x, 0.000000);
/*234*/	  r3.x = sqrt(r3.x);
/*235*/	  r2.w = r2.w * r3.x;
/*236*/	  r2.w = r2.w * 1.414214;
/*237*/	  r2.w = 0.008727 / r2.w;
/*238*/	  r2.w = max(r2.w, 0.000100);
/*239*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*240*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*241*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*242*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*243*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*244*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*245*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*246*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*247*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*248*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*249*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*250*/	  r2.w = floatBitsToInt(r2.w);
/*251*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*252*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*253*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*254*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*255*/	  r2.w = r2.w * r4.x + 1.000000;
/*256*/	  r2.w = r2.w * 0.500000;
/*257*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*258*/	  r3.x = r3.x * r4.y + 1.000000;
/*259*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*260*/	  r3.x = min(r7.x, 1.000000);
/*261*/	  r1.w = r1.w * 1.570796;
/*262*/	  r1.w = sin(r1.w);
/*263*/	  r3.x = r3.x + -1.000000;
/*264*/	  r1.w = r1.w * r3.x + 1.000000;
/*265*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*266*/	  r3.x = max(r3.x, 0.000000);
/*267*/	  r3.x = log2(r3.x);
/*268*/	  r3.x = r3.x * 10.000000;
/*269*/	  r3.x = exp2(r3.x);
/*270*/	  r3.x = r4.w * r3.x;
/*271*/	  r3.x = r3.x * r5.w + r0.w;
/*272*/	  r1.w = r1.w * abs(r2.w);
/*273*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*274*/	} else {
/*275*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*276*/	}
/*277*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*278*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*279*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*280*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*281*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*282*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*283*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*284*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*285*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*286*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*287*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*288*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*289*/	r1.w = inversesqrt(r1.w);
/*290*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*291*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*292*/	r1.w = r1.w + r1.w;
/*293*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*294*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*295*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*296*/	r0.x = max(r0.x, 0.000000);
/*297*/	r0.x = log2(r0.x);
/*298*/	r0.x = r0.x * 10.000000;
/*299*/	r0.x = exp2(r0.x);
/*300*/	r0.x = r4.w * r0.x;
/*301*/	r0.x = r0.x * r5.w + r0.w;
/*302*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*303*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*304*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*305*/	r0.w = 1.000000;
/*306*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*307*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*308*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*309*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*310*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*311*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*312*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*313*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*314*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*315*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*316*/	if(r0.x != 0) discard;
/*317*/	color1.x = 1.000000;
/*318*/	return;
}
