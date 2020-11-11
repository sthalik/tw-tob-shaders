//
//
// Shader Model 4
// Fragment Shader
//
// id: 513 - fxc/glsl_SM_4_0_rigidambientmapmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*23*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*25*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*26*/	r1.w = inversesqrt(r1.w);
/*27*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*28*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*29*/	r1.w = inversesqrt(r1.w);
/*30*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*31*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*32*/	r1.w = inversesqrt(r1.w);
/*33*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*34*/	r9.xyz = (r0.yyyy * r7.xyzx).xyz;
/*35*/	r9.xyz = (r0.xxxx * r6.xyzx + r9.xyzx).xyz;
/*36*/	r0.xyw = (r0.wwww * r8.xyxz + r9.xyxz).xyw;
/*37*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*38*/	r1.w = inversesqrt(r1.w);
/*39*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*40*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*41*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*42*/	if(floatBitsToUint(r0.w) != 0u) {
/*43*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*44*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*45*/	  r0.w = r3.w * cb0.data[26].x;
/*46*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*47*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*48*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*49*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*50*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*51*/	}
/*52*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*53*/	if(floatBitsToUint(r0.w) != 0u) {
/*54*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*55*/	  if(floatBitsToUint(r0.w) != 0u) {
/*56*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*57*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*58*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*59*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*60*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*61*/	    r0.w = -r0.w + 1.000000;
/*62*/	    r0.w = max(r0.w, 0.000000);
/*63*/	    r10.z = sqrt(r0.w);
/*64*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*65*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*66*/	    r0.w = inversesqrt(r0.w);
/*67*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*68*/	    r12.xz = (cb2.data[0].xxyx).xz/**/;
/*69*/	    r12.y = -1.000000;
/*70*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*71*/	    r0.w = inversesqrt(r0.w);
/*72*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*73*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*74*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*75*/	    r1.w = r1.w * 1.250000;
/*76*/	    r1.w = min(r1.w, 1.000000);
/*77*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*78*/	    r2.w = r2.w * 4.000000;
/*79*/	    r1.w = r1.w * 0.200000 + r2.w;
/*80*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*81*/	    r0.w = r0.w + -r1.w;
/*82*/	    r0.w = saturate(r0.w * 200.000000);
/*83*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*84*/	    r0.w = r0.w * r0.w;
/*85*/	    r0.w = r0.w * r1.w;
/*86*/	    r3.x = r0.w * -r3.x + r3.x;
/*87*/	    r1.w = -r3.y + 0.200000;
/*88*/	    r3.y = r0.w * r1.w + r3.y;
/*89*/	    r1.xyz = (-r1.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*90*/	    r5.xyz = (r0.wwww * r1.xyzx + r5.xyzx).xyz;
/*91*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*92*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*93*/	    r1.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*94*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*95*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*96*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*97*/	    r1.w = -r1.w + 1.000000;
/*98*/	    r1.w = max(r1.w, 0.000000);
/*99*/	    r1.z = sqrt(r1.w);
/*100*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*101*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*102*/	    r1.w = sqrt(r1.w);
/*103*/	    r1.xyz = (r4.xyzx * r1.wwww + r1.xyzx).xyz;
/*104*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*105*/	    r1.w = inversesqrt(r1.w);
/*106*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*107*/	    r4.xyz = (r7.xyzx * r1.yyyy).xyz;
/*108*/	    r1.xyw = (r1.xxxx * r6.xyxz + r4.xyxz).xyw;
/*109*/	    r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*110*/	    r1.w = -r0.y + 1.000000;
/*111*/	    r0.w = min(r0.w, r1.w);
/*112*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*113*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*114*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*115*/	    r0.w = inversesqrt(r0.w);
/*116*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*117*/	  }
/*118*/	}
/*119*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*120*/	r1.xyz = (r5.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*121*/	r1.xyz = (-r5.xyzx + r1.xyzx).xyz;
/*122*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r5.xyzx).xyz;
/*123*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*124*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*125*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*126*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*127*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*128*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*129*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*130*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*131*/	r1.w = inversesqrt(r1.w);
/*132*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*133*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*134*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*135*/	r1.w = inversesqrt(r1.w);
/*136*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*137*/	r1.w = -r3.x + 1.000000;
/*138*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*139*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*140*/	r4.x = r4.x + r4.x;
/*141*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*142*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*143*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*144*/	r4.w = cos((r6.x));
/*145*/	r4.w = inversesqrt(r4.w);
/*146*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*147*/	r5.w = saturate(r0.w * 60.000000);
/*148*/	r5.w = -r0.w + r5.w;
/*149*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*150*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*151*/	r7.x = inversesqrt(r7.x);
/*152*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*153*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*154*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*155*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*156*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*157*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*158*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*159*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*160*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*161*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*162*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*163*/	r5.y = -r0.w + 1.000000;
/*164*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*165*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*166*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*167*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*168*/	  r5.y = max(r5.y, 0.000000);
/*169*/	  r5.y = log2(r5.y);
/*170*/	  r5.y = r5.y * 10.000000;
/*171*/	  r5.y = exp2(r5.y);
/*172*/	  r5.y = r4.w * r5.y;
/*173*/	  r5.y = r5.y * r5.w + r0.w;
/*174*/	  r7.x = r1.w * 8.000000;
/*175*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*176*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*177*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*178*/	}
/*179*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*180*/	r7.x = max(r5.y, 0.000000);
/*181*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*182*/	if(floatBitsToUint(r5.y) != 0u) {
/*183*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*184*/	  r4.x = max(r4.x, -1.000000);
/*185*/	  r4.x = min(r4.x, 1.000000);
/*186*/	  r4.y = -abs(r4.x) + 1.000000;
/*187*/	  r4.y = sqrt(r4.y);
/*188*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*189*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*190*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*191*/	  r5.y = r4.y * r4.z;
/*192*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*193*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*194*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*195*/	  r4.x = r4.z * r4.y + r4.x;
/*196*/	  r3.x = r3.x * r3.x;
/*197*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*198*/	  r2.w = r3.x * r2.w + r5.x;
/*199*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*200*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*201*/	  r3.x = -r2.w * r2.w + 1.000000;
/*202*/	  r3.x = max(r3.x, 0.001000);
/*203*/	  r3.x = log2(r3.x);
/*204*/	  r4.y = r3.x * 4.950617;
/*205*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*206*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*207*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*208*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*209*/	  r2.w = floatBitsToInt(r2.w);
/*210*/	  r4.y = r3.x * r3.x + -r4.y;
/*211*/	  r4.y = sqrt(r4.y);
/*212*/	  r3.x = -r3.x + r4.y;
/*213*/	  r3.x = max(r3.x, 0.000000);
/*214*/	  r3.x = sqrt(r3.x);
/*215*/	  r2.w = r2.w * r3.x;
/*216*/	  r2.w = r2.w * 1.414214;
/*217*/	  r2.w = 0.008727 / r2.w;
/*218*/	  r2.w = max(r2.w, 0.000100);
/*219*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*220*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*221*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*222*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*223*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*224*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*225*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*226*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*227*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*228*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*229*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*230*/	  r2.w = floatBitsToInt(r2.w);
/*231*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*232*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*233*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*234*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*235*/	  r2.w = r2.w * r4.x + 1.000000;
/*236*/	  r2.w = r2.w * 0.500000;
/*237*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*238*/	  r3.x = r3.x * r4.y + 1.000000;
/*239*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*240*/	  r3.x = min(r7.x, 1.000000);
/*241*/	  r1.w = r1.w * 1.570796;
/*242*/	  r1.w = sin(r1.w);
/*243*/	  r3.x = r3.x + -1.000000;
/*244*/	  r1.w = r1.w * r3.x + 1.000000;
/*245*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*246*/	  r3.x = max(r3.x, 0.000000);
/*247*/	  r3.x = log2(r3.x);
/*248*/	  r3.x = r3.x * 10.000000;
/*249*/	  r3.x = exp2(r3.x);
/*250*/	  r3.x = r4.w * r3.x;
/*251*/	  r3.x = r3.x * r5.w + r0.w;
/*252*/	  r1.w = r1.w * abs(r2.w);
/*253*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*254*/	} else {
/*255*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*256*/	}
/*257*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*258*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*259*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*260*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*261*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*262*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*263*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*264*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*265*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*266*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*267*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*268*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*269*/	r1.w = inversesqrt(r1.w);
/*270*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*271*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*272*/	r1.w = r1.w + r1.w;
/*273*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*274*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*275*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*276*/	r0.x = max(r0.x, 0.000000);
/*277*/	r0.x = log2(r0.x);
/*278*/	r0.x = r0.x * 10.000000;
/*279*/	r0.x = exp2(r0.x);
/*280*/	r0.x = r4.w * r0.x;
/*281*/	r0.x = r0.x * r5.w + r0.w;
/*282*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*283*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*284*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*285*/	r0.w = 1.000000;
/*286*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*287*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*288*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*289*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*290*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*291*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*292*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*293*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*294*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*295*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*296*/	if(r0.x != 0) discard;
/*297*/	color1.x = 1.000000;
/*298*/	return;
}
