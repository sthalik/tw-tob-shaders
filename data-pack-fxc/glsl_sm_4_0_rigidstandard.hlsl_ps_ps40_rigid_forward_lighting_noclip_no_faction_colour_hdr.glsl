//
//
// Shader Model 4
// Fragment Shader
//
// id: 680 - fxc/glsl_SM_4_0_rigidstandard.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*19*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*20*/	r1.w = inversesqrt(r1.w);
/*21*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*22*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*23*/	r1.w = inversesqrt(r1.w);
/*24*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*25*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*26*/	r1.w = inversesqrt(r1.w);
/*27*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*28*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*29*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*30*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*31*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*32*/	r1.w = inversesqrt(r1.w);
/*33*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*34*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*35*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*36*/	if(floatBitsToUint(r0.w) != 0u) {
/*37*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*38*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*39*/	  r0.w = r3.w * cb0.data[26].x;
/*40*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*41*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*42*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*43*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*44*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*45*/	}
/*46*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*47*/	if(floatBitsToUint(r0.w) != 0u) {
/*48*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*49*/	  if(floatBitsToUint(r0.w) != 0u) {
/*50*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*51*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*52*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*53*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*54*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*55*/	    r0.w = -r0.w + 1.000000;
/*56*/	    r0.w = max(r0.w, 0.000000);
/*57*/	    r8.z = sqrt(r0.w);
/*58*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*59*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*60*/	    r0.w = inversesqrt(r0.w);
/*61*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*62*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*63*/	    r10.y = -1.000000;
/*64*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*65*/	    r0.w = inversesqrt(r0.w);
/*66*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*67*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*68*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*69*/	    r1.w = r1.w * 1.250000;
/*70*/	    r1.w = min(r1.w, 1.000000);
/*71*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*72*/	    r2.w = r2.w * 4.000000;
/*73*/	    r1.w = r1.w * 0.200000 + r2.w;
/*74*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*75*/	    r0.w = r0.w + -r1.w;
/*76*/	    r0.w = saturate(r0.w * 200.000000);
/*77*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*78*/	    r0.w = r0.w * r0.w;
/*79*/	    r0.w = r0.w * r1.w;
/*80*/	    r3.x = r0.w * -r3.x + r3.x;
/*81*/	    r1.w = -r3.y + 0.200000;
/*82*/	    r3.y = r0.w * r1.w + r3.y;
/*83*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*84*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*85*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*86*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*87*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*88*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*89*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*90*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*91*/	    r1.w = -r1.w + 1.000000;
/*92*/	    r1.w = max(r1.w, 0.000000);
/*93*/	    r7.z = sqrt(r1.w);
/*94*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*95*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*96*/	    r1.w = sqrt(r1.w);
/*97*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*98*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*99*/	    r1.w = inversesqrt(r1.w);
/*100*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*101*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*102*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*103*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*104*/	    r1.w = -r0.y + 1.000000;
/*105*/	    r0.w = min(r0.w, r1.w);
/*106*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*107*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*108*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*109*/	    r0.w = inversesqrt(r0.w);
/*110*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*111*/	  }
/*112*/	}
/*113*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*114*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*115*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*116*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*117*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*118*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*119*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*120*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*121*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*122*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*123*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*124*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*125*/	r1.w = inversesqrt(r1.w);
/*126*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*127*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*128*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*129*/	r1.w = inversesqrt(r1.w);
/*130*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*131*/	r1.w = -r3.x + 1.000000;
/*132*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*133*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*134*/	r4.x = r4.x + r4.x;
/*135*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*136*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*137*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*138*/	r4.w = cos((r6.x));
/*139*/	r4.w = inversesqrt(r4.w);
/*140*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*141*/	r5.w = saturate(r0.w * 60.000000);
/*142*/	r5.w = -r0.w + r5.w;
/*143*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*144*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*145*/	r7.x = inversesqrt(r7.x);
/*146*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*147*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*148*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*149*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*150*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*151*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*152*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*153*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*154*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*155*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*156*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*157*/	r5.y = -r0.w + 1.000000;
/*158*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*159*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*160*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*161*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*162*/	  r5.y = max(r5.y, 0.000000);
/*163*/	  r5.y = log2(r5.y);
/*164*/	  r5.y = r5.y * 10.000000;
/*165*/	  r5.y = exp2(r5.y);
/*166*/	  r5.y = r4.w * r5.y;
/*167*/	  r5.y = r5.y * r5.w + r0.w;
/*168*/	  r7.x = r1.w * 8.000000;
/*169*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*170*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*171*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*172*/	}
/*173*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*174*/	r7.x = max(r5.y, 0.000000);
/*175*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*176*/	if(floatBitsToUint(r5.y) != 0u) {
/*177*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*178*/	  r4.x = max(r4.x, -1.000000);
/*179*/	  r4.x = min(r4.x, 1.000000);
/*180*/	  r4.y = -abs(r4.x) + 1.000000;
/*181*/	  r4.y = sqrt(r4.y);
/*182*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*183*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*184*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*185*/	  r5.y = r4.y * r4.z;
/*186*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*187*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*188*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*189*/	  r4.x = r4.z * r4.y + r4.x;
/*190*/	  r3.x = r3.x * r3.x;
/*191*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*192*/	  r2.w = r3.x * r2.w + r5.x;
/*193*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*194*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*195*/	  r3.x = -r2.w * r2.w + 1.000000;
/*196*/	  r3.x = max(r3.x, 0.001000);
/*197*/	  r3.x = log2(r3.x);
/*198*/	  r4.y = r3.x * 4.950617;
/*199*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*200*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*201*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*202*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*203*/	  r2.w = floatBitsToInt(r2.w);
/*204*/	  r4.y = r3.x * r3.x + -r4.y;
/*205*/	  r4.y = sqrt(r4.y);
/*206*/	  r3.x = -r3.x + r4.y;
/*207*/	  r3.x = max(r3.x, 0.000000);
/*208*/	  r3.x = sqrt(r3.x);
/*209*/	  r2.w = r2.w * r3.x;
/*210*/	  r2.w = r2.w * 1.414214;
/*211*/	  r2.w = 0.008727 / r2.w;
/*212*/	  r2.w = max(r2.w, 0.000100);
/*213*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*214*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*215*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*216*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*217*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*218*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*219*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*220*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*221*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*222*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*223*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*224*/	  r2.w = floatBitsToInt(r2.w);
/*225*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*226*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*227*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*228*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*229*/	  r2.w = r2.w * r4.x + 1.000000;
/*230*/	  r2.w = r2.w * 0.500000;
/*231*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*232*/	  r3.x = r3.x * r4.y + 1.000000;
/*233*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*234*/	  r3.x = min(r7.x, 1.000000);
/*235*/	  r1.w = r1.w * 1.570796;
/*236*/	  r1.w = sin(r1.w);
/*237*/	  r3.x = r3.x + -1.000000;
/*238*/	  r1.w = r1.w * r3.x + 1.000000;
/*239*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*240*/	  r3.x = max(r3.x, 0.000000);
/*241*/	  r3.x = log2(r3.x);
/*242*/	  r3.x = r3.x * 10.000000;
/*243*/	  r3.x = exp2(r3.x);
/*244*/	  r3.x = r4.w * r3.x;
/*245*/	  r3.x = r3.x * r5.w + r0.w;
/*246*/	  r1.w = r1.w * abs(r2.w);
/*247*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*248*/	} else {
/*249*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*250*/	}
/*251*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*252*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*253*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*254*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*255*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*256*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*257*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*258*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*259*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*260*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*261*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*262*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*263*/	r1.w = inversesqrt(r1.w);
/*264*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*265*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*266*/	r1.w = r1.w + r1.w;
/*267*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*268*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*269*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*270*/	r0.x = max(r0.x, 0.000000);
/*271*/	r0.x = log2(r0.x);
/*272*/	r0.x = r0.x * 10.000000;
/*273*/	r0.x = exp2(r0.x);
/*274*/	r0.x = r4.w * r0.x;
/*275*/	r0.x = r0.x * r5.w + r0.w;
/*276*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*277*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*278*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*279*/	r0.w = 1.000000;
/*280*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*281*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*282*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*283*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*284*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*285*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*286*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*287*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*288*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*289*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*290*/	if(r0.x != 0) discard;
/*291*/	color1.x = 1.000000;
/*292*/	return;
}
