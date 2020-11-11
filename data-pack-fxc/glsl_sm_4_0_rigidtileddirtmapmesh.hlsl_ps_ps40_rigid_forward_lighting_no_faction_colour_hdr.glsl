//
//
// Shader Model 4
// Fragment Shader
//
// id: 833 - fxc/glsl_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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
/*23*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
/*24*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*25*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*26*/	r1.w = r4.w + -1.000000;
/*27*/	r1.w = r5.x * r1.w + 1.000000;
/*28*/	r1.w = saturate(r1.w * r5.x);
/*29*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*30*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*31*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*32*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*33*/	r1.w = inversesqrt(r1.w);
/*34*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*35*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*36*/	r1.w = inversesqrt(r1.w);
/*37*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*38*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*39*/	r1.w = inversesqrt(r1.w);
/*40*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*41*/	r9.xyz = (r0.yyyy * r7.xyzx).xyz;
/*42*/	r9.xyz = (r0.xxxx * r6.xyzx + r9.xyzx).xyz;
/*43*/	r0.xyw = (r0.wwww * r8.xyxz + r9.xyxz).xyw;
/*44*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*45*/	r1.w = inversesqrt(r1.w);
/*46*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*47*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*48*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*49*/	if(floatBitsToUint(r0.w) != 0u) {
/*50*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*51*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*52*/	  r0.w = r3.w * cb0.data[26].x;
/*53*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*54*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*55*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*56*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*57*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*58*/	}
/*59*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*60*/	if(floatBitsToUint(r0.w) != 0u) {
/*61*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*62*/	  if(floatBitsToUint(r0.w) != 0u) {
/*63*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*64*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*65*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*66*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*67*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*68*/	    r0.w = -r0.w + 1.000000;
/*69*/	    r0.w = max(r0.w, 0.000000);
/*70*/	    r10.z = sqrt(r0.w);
/*71*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*72*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*73*/	    r0.w = inversesqrt(r0.w);
/*74*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*75*/	    r12.xz = (cb2.data[0].xxyx).xz/**/;
/*76*/	    r12.y = -1.000000;
/*77*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*78*/	    r0.w = inversesqrt(r0.w);
/*79*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*80*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*81*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*82*/	    r1.w = r1.w * 1.250000;
/*83*/	    r1.w = min(r1.w, 1.000000);
/*84*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
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
/*96*/	    r1.xyz = (-r1.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*97*/	    r5.xyz = (r0.wwww * r1.xyzx + r5.xyzx).xyz;
/*98*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*99*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*100*/	    r1.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*101*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*102*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*103*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*104*/	    r1.w = -r1.w + 1.000000;
/*105*/	    r1.w = max(r1.w, 0.000000);
/*106*/	    r1.z = sqrt(r1.w);
/*107*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*108*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*109*/	    r1.w = sqrt(r1.w);
/*110*/	    r1.xyz = (r4.xyzx * r1.wwww + r1.xyzx).xyz;
/*111*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*112*/	    r1.w = inversesqrt(r1.w);
/*113*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*114*/	    r4.xyz = (r7.xyzx * r1.yyyy).xyz;
/*115*/	    r1.xyw = (r1.xxxx * r6.xyxz + r4.xyxz).xyw;
/*116*/	    r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*117*/	    r1.w = -r0.y + 1.000000;
/*118*/	    r0.w = min(r0.w, r1.w);
/*119*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*120*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*121*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*122*/	    r0.w = inversesqrt(r0.w);
/*123*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*124*/	  }
/*125*/	}
/*126*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*127*/	r1.xyz = (r5.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*128*/	r1.xyz = (-r5.xyzx + r1.xyzx).xyz;
/*129*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r5.xyzx).xyz;
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
/*140*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*141*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*142*/	r1.w = inversesqrt(r1.w);
/*143*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*144*/	r1.w = -r3.x + 1.000000;
/*145*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*146*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*147*/	r4.x = r4.x + r4.x;
/*148*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*149*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*150*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*151*/	r4.w = cos((r6.x));
/*152*/	r4.w = inversesqrt(r4.w);
/*153*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*154*/	r5.w = saturate(r0.w * 60.000000);
/*155*/	r5.w = -r0.w + r5.w;
/*156*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*157*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*158*/	r7.x = inversesqrt(r7.x);
/*159*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*160*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*161*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*162*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*163*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*164*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*165*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*166*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*167*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*168*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*169*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*170*/	r5.y = -r0.w + 1.000000;
/*171*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*172*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*173*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*174*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*175*/	  r5.y = max(r5.y, 0.000000);
/*176*/	  r5.y = log2(r5.y);
/*177*/	  r5.y = r5.y * 10.000000;
/*178*/	  r5.y = exp2(r5.y);
/*179*/	  r5.y = r4.w * r5.y;
/*180*/	  r5.y = r5.y * r5.w + r0.w;
/*181*/	  r7.x = r1.w * 8.000000;
/*182*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*183*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*184*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*185*/	}
/*186*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*187*/	r7.x = max(r5.y, 0.000000);
/*188*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*189*/	if(floatBitsToUint(r5.y) != 0u) {
/*190*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*191*/	  r4.x = max(r4.x, -1.000000);
/*192*/	  r4.x = min(r4.x, 1.000000);
/*193*/	  r4.y = -abs(r4.x) + 1.000000;
/*194*/	  r4.y = sqrt(r4.y);
/*195*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*196*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*197*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*198*/	  r5.y = r4.y * r4.z;
/*199*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*200*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*201*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*202*/	  r4.x = r4.z * r4.y + r4.x;
/*203*/	  r3.x = r3.x * r3.x;
/*204*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*205*/	  r2.w = r3.x * r2.w + r5.x;
/*206*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*207*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*208*/	  r3.x = -r2.w * r2.w + 1.000000;
/*209*/	  r3.x = max(r3.x, 0.001000);
/*210*/	  r3.x = log2(r3.x);
/*211*/	  r4.y = r3.x * 4.950617;
/*212*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*213*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*214*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*215*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*216*/	  r2.w = floatBitsToInt(r2.w);
/*217*/	  r4.y = r3.x * r3.x + -r4.y;
/*218*/	  r4.y = sqrt(r4.y);
/*219*/	  r3.x = -r3.x + r4.y;
/*220*/	  r3.x = max(r3.x, 0.000000);
/*221*/	  r3.x = sqrt(r3.x);
/*222*/	  r2.w = r2.w * r3.x;
/*223*/	  r2.w = r2.w * 1.414214;
/*224*/	  r2.w = 0.008727 / r2.w;
/*225*/	  r2.w = max(r2.w, 0.000100);
/*226*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*227*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*228*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*229*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*230*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*231*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*232*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*233*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*234*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*235*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*236*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*237*/	  r2.w = floatBitsToInt(r2.w);
/*238*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*239*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*240*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*241*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*242*/	  r2.w = r2.w * r4.x + 1.000000;
/*243*/	  r2.w = r2.w * 0.500000;
/*244*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*245*/	  r3.x = r3.x * r4.y + 1.000000;
/*246*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*247*/	  r3.x = min(r7.x, 1.000000);
/*248*/	  r1.w = r1.w * 1.570796;
/*249*/	  r1.w = sin(r1.w);
/*250*/	  r3.x = r3.x + -1.000000;
/*251*/	  r1.w = r1.w * r3.x + 1.000000;
/*252*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*253*/	  r3.x = max(r3.x, 0.000000);
/*254*/	  r3.x = log2(r3.x);
/*255*/	  r3.x = r3.x * 10.000000;
/*256*/	  r3.x = exp2(r3.x);
/*257*/	  r3.x = r4.w * r3.x;
/*258*/	  r3.x = r3.x * r5.w + r0.w;
/*259*/	  r1.w = r1.w * abs(r2.w);
/*260*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*261*/	} else {
/*262*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*263*/	}
/*264*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*265*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*266*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*267*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*268*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*269*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*270*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*271*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*272*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*273*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*274*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*275*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*276*/	r1.w = inversesqrt(r1.w);
/*277*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*278*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*279*/	r1.w = r1.w + r1.w;
/*280*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*281*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*282*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*283*/	r0.x = max(r0.x, 0.000000);
/*284*/	r0.x = log2(r0.x);
/*285*/	r0.x = r0.x * 10.000000;
/*286*/	r0.x = exp2(r0.x);
/*287*/	r0.x = r4.w * r0.x;
/*288*/	r0.x = r0.x * r5.w + r0.w;
/*289*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*290*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*291*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*292*/	r0.w = 1.000000;
/*293*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*294*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*295*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*296*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*297*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*298*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*299*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*300*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*301*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*302*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*303*/	if(r0.x != 0) discard;
/*304*/	color1.x = 1.000000;
/*305*/	return;
}
