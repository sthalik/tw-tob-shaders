//
//
// Shader Model 4
// Fragment Shader
//
// id: 515 - fxc/glsl_SM_4_0_rigidambientmapmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_ambient_map;
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
  vec4 r11;
  vec4 r12;
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
/*19*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*21*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*22*/	r1.w = inversesqrt(r1.w);
/*23*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*24*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*25*/	r1.w = inversesqrt(r1.w);
/*26*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*27*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*28*/	r1.w = inversesqrt(r1.w);
/*29*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*30*/	r9.xyz = (r0.yyyy * r7.xyzx).xyz;
/*31*/	r9.xyz = (r0.xxxx * r6.xyzx + r9.xyzx).xyz;
/*32*/	r0.xyw = (r0.wwww * r8.xyxz + r9.xyxz).xyw;
/*33*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*34*/	r1.w = inversesqrt(r1.w);
/*35*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*36*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*38*/	if(floatBitsToUint(r0.w) != 0u) {
/*39*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*40*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*41*/	  r0.w = r3.w * cb0.data[26].x;
/*42*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*43*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*44*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*45*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*46*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*47*/	}
/*48*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*49*/	if(floatBitsToUint(r0.w) != 0u) {
/*50*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*51*/	  if(floatBitsToUint(r0.w) != 0u) {
/*52*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*53*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*54*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*55*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*56*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*57*/	    r0.w = -r0.w + 1.000000;
/*58*/	    r0.w = max(r0.w, 0.000000);
/*59*/	    r10.z = sqrt(r0.w);
/*60*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*61*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*62*/	    r0.w = inversesqrt(r0.w);
/*63*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*64*/	    r12.xz = (cb2.data[0].xxyx).xz/**/;
/*65*/	    r12.y = -1.000000;
/*66*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*67*/	    r0.w = inversesqrt(r0.w);
/*68*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*69*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*70*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*71*/	    r1.w = r1.w * 1.250000;
/*72*/	    r1.w = min(r1.w, 1.000000);
/*73*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*74*/	    r2.w = r2.w * 4.000000;
/*75*/	    r1.w = r1.w * 0.200000 + r2.w;
/*76*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*77*/	    r0.w = r0.w + -r1.w;
/*78*/	    r0.w = saturate(r0.w * 200.000000);
/*79*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*80*/	    r0.w = r0.w * r0.w;
/*81*/	    r0.w = r0.w * r1.w;
/*82*/	    r3.x = r0.w * -r3.x + r3.x;
/*83*/	    r1.w = -r3.y + 0.200000;
/*84*/	    r3.y = r0.w * r1.w + r3.y;
/*85*/	    r1.xyz = (-r1.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*86*/	    r5.xyz = (r0.wwww * r1.xyzx + r5.xyzx).xyz;
/*87*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*88*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*89*/	    r1.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*90*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*91*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*92*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*93*/	    r1.w = -r1.w + 1.000000;
/*94*/	    r1.w = max(r1.w, 0.000000);
/*95*/	    r1.z = sqrt(r1.w);
/*96*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*97*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*98*/	    r1.w = sqrt(r1.w);
/*99*/	    r1.xyz = (r4.xyzx * r1.wwww + r1.xyzx).xyz;
/*100*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*101*/	    r1.w = inversesqrt(r1.w);
/*102*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*103*/	    r4.xyz = (r7.xyzx * r1.yyyy).xyz;
/*104*/	    r1.xyw = (r1.xxxx * r6.xyxz + r4.xyxz).xyw;
/*105*/	    r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*106*/	    r1.w = -r0.y + 1.000000;
/*107*/	    r0.w = min(r0.w, r1.w);
/*108*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*109*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*110*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*111*/	    r0.w = inversesqrt(r0.w);
/*112*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*113*/	  }
/*114*/	}
/*115*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*116*/	r1.xyz = (r5.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*117*/	r1.xyz = (-r5.xyzx + r1.xyzx).xyz;
/*118*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r5.xyzx).xyz;
/*119*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*120*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*121*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*122*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*123*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*124*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*125*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*126*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*127*/	r1.w = inversesqrt(r1.w);
/*128*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*129*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*130*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*131*/	r1.w = inversesqrt(r1.w);
/*132*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*133*/	r1.w = -r3.x + 1.000000;
/*134*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*135*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*136*/	r4.x = r4.x + r4.x;
/*137*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*138*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*139*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*140*/	r4.w = cos((r6.x));
/*141*/	r4.w = inversesqrt(r4.w);
/*142*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*143*/	r5.w = saturate(r0.w * 60.000000);
/*144*/	r5.w = -r0.w + r5.w;
/*145*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*146*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*147*/	r7.x = inversesqrt(r7.x);
/*148*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*149*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*150*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*151*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*152*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*153*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*154*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*155*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*156*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*157*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*158*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*159*/	r5.y = -r0.w + 1.000000;
/*160*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*161*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*162*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*163*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*164*/	  r5.y = max(r5.y, 0.000000);
/*165*/	  r5.y = log2(r5.y);
/*166*/	  r5.y = r5.y * 10.000000;
/*167*/	  r5.y = exp2(r5.y);
/*168*/	  r5.y = r4.w * r5.y;
/*169*/	  r5.y = r5.y * r5.w + r0.w;
/*170*/	  r7.x = r1.w * 8.000000;
/*171*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*172*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*173*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*174*/	}
/*175*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*176*/	r7.x = max(r5.y, 0.000000);
/*177*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*178*/	if(floatBitsToUint(r5.y) != 0u) {
/*179*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*180*/	  r4.x = max(r4.x, -1.000000);
/*181*/	  r4.x = min(r4.x, 1.000000);
/*182*/	  r4.y = -abs(r4.x) + 1.000000;
/*183*/	  r4.y = sqrt(r4.y);
/*184*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*185*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*186*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*187*/	  r5.y = r4.y * r4.z;
/*188*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*189*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*190*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*191*/	  r4.x = r4.z * r4.y + r4.x;
/*192*/	  r3.x = r3.x * r3.x;
/*193*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*194*/	  r2.w = r3.x * r2.w + r5.x;
/*195*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*196*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*197*/	  r3.x = -r2.w * r2.w + 1.000000;
/*198*/	  r3.x = max(r3.x, 0.001000);
/*199*/	  r3.x = log2(r3.x);
/*200*/	  r4.y = r3.x * 4.950617;
/*201*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*202*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*203*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*204*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*205*/	  r2.w = floatBitsToInt(r2.w);
/*206*/	  r4.y = r3.x * r3.x + -r4.y;
/*207*/	  r4.y = sqrt(r4.y);
/*208*/	  r3.x = -r3.x + r4.y;
/*209*/	  r3.x = max(r3.x, 0.000000);
/*210*/	  r3.x = sqrt(r3.x);
/*211*/	  r2.w = r2.w * r3.x;
/*212*/	  r2.w = r2.w * 1.414214;
/*213*/	  r2.w = 0.008727 / r2.w;
/*214*/	  r2.w = max(r2.w, 0.000100);
/*215*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*216*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*217*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*218*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*219*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*220*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*221*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*222*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*223*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*224*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*225*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*226*/	  r2.w = floatBitsToInt(r2.w);
/*227*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*228*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*229*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*230*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*231*/	  r2.w = r2.w * r4.x + 1.000000;
/*232*/	  r2.w = r2.w * 0.500000;
/*233*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*234*/	  r3.x = r3.x * r4.y + 1.000000;
/*235*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*236*/	  r3.x = min(r7.x, 1.000000);
/*237*/	  r1.w = r1.w * 1.570796;
/*238*/	  r1.w = sin(r1.w);
/*239*/	  r3.x = r3.x + -1.000000;
/*240*/	  r1.w = r1.w * r3.x + 1.000000;
/*241*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*242*/	  r3.x = max(r3.x, 0.000000);
/*243*/	  r3.x = log2(r3.x);
/*244*/	  r3.x = r3.x * 10.000000;
/*245*/	  r3.x = exp2(r3.x);
/*246*/	  r3.x = r4.w * r3.x;
/*247*/	  r3.x = r3.x * r5.w + r0.w;
/*248*/	  r1.w = r1.w * abs(r2.w);
/*249*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*250*/	} else {
/*251*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*252*/	}
/*253*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*254*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*255*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*256*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*257*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*258*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*259*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*260*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*261*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*262*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*263*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*264*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*265*/	r1.w = inversesqrt(r1.w);
/*266*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*267*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*268*/	r1.w = r1.w + r1.w;
/*269*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*270*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*271*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*272*/	r0.x = max(r0.x, 0.000000);
/*273*/	r0.x = log2(r0.x);
/*274*/	r0.x = r0.x * 10.000000;
/*275*/	r0.x = exp2(r0.x);
/*276*/	r0.x = r4.w * r0.x;
/*277*/	r0.x = r0.x * r5.w + r0.w;
/*278*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*279*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*280*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*281*/	r0.w = 1.000000;
/*282*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*283*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*284*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*285*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*286*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*287*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*288*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*289*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*290*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*291*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*292*/	if(r0.x != 0) discard;
/*293*/	color1.x = 1.000000;
/*294*/	return;
}
