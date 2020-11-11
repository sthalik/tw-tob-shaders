//
//
// Shader Model 4
// Fragment Shader
//
// id: 678 - fxc/glsl_SM_4_0_rigidstandard.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*23*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*24*/	r1.w = inversesqrt(r1.w);
/*25*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*26*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*27*/	r1.w = inversesqrt(r1.w);
/*28*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*29*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*30*/	r1.w = inversesqrt(r1.w);
/*31*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*32*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*33*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*34*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*35*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*36*/	r1.w = inversesqrt(r1.w);
/*37*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*38*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*39*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*40*/	if(floatBitsToUint(r0.w) != 0u) {
/*41*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*42*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*43*/	  r0.w = r3.w * cb0.data[26].x;
/*44*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*45*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*46*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*47*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*48*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*49*/	}
/*50*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*51*/	if(floatBitsToUint(r0.w) != 0u) {
/*52*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*53*/	  if(floatBitsToUint(r0.w) != 0u) {
/*54*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*55*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*56*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*57*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*58*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*59*/	    r0.w = -r0.w + 1.000000;
/*60*/	    r0.w = max(r0.w, 0.000000);
/*61*/	    r8.z = sqrt(r0.w);
/*62*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*63*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*64*/	    r0.w = inversesqrt(r0.w);
/*65*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*66*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*67*/	    r10.y = -1.000000;
/*68*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*69*/	    r0.w = inversesqrt(r0.w);
/*70*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*71*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*72*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*73*/	    r1.w = r1.w * 1.250000;
/*74*/	    r1.w = min(r1.w, 1.000000);
/*75*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*76*/	    r2.w = r2.w * 4.000000;
/*77*/	    r1.w = r1.w * 0.200000 + r2.w;
/*78*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*79*/	    r0.w = r0.w + -r1.w;
/*80*/	    r0.w = saturate(r0.w * 200.000000);
/*81*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*82*/	    r0.w = r0.w * r0.w;
/*83*/	    r0.w = r0.w * r1.w;
/*84*/	    r3.x = r0.w * -r3.x + r3.x;
/*85*/	    r1.w = -r3.y + 0.200000;
/*86*/	    r3.y = r0.w * r1.w + r3.y;
/*87*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*88*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*89*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*90*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*91*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*92*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*93*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*94*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*95*/	    r1.w = -r1.w + 1.000000;
/*96*/	    r1.w = max(r1.w, 0.000000);
/*97*/	    r7.z = sqrt(r1.w);
/*98*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*99*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*100*/	    r1.w = sqrt(r1.w);
/*101*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*102*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*103*/	    r1.w = inversesqrt(r1.w);
/*104*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*105*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*106*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*107*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*108*/	    r1.w = -r0.y + 1.000000;
/*109*/	    r0.w = min(r0.w, r1.w);
/*110*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*111*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*112*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*115*/	  }
/*116*/	}
/*117*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*118*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*119*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*120*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*121*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*122*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*123*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*124*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*125*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*126*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*127*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*128*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*129*/	r1.w = inversesqrt(r1.w);
/*130*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*131*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*132*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*133*/	r1.w = inversesqrt(r1.w);
/*134*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*135*/	r1.w = -r3.x + 1.000000;
/*136*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*137*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*138*/	r4.x = r4.x + r4.x;
/*139*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*140*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*141*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*142*/	r4.w = cos((r6.x));
/*143*/	r4.w = inversesqrt(r4.w);
/*144*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*145*/	r5.w = saturate(r0.w * 60.000000);
/*146*/	r5.w = -r0.w + r5.w;
/*147*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*148*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*149*/	r7.x = inversesqrt(r7.x);
/*150*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*151*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*152*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*153*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*154*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*155*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*156*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*157*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*158*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*159*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*160*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*161*/	r5.y = -r0.w + 1.000000;
/*162*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*163*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*164*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*165*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*166*/	  r5.y = max(r5.y, 0.000000);
/*167*/	  r5.y = log2(r5.y);
/*168*/	  r5.y = r5.y * 10.000000;
/*169*/	  r5.y = exp2(r5.y);
/*170*/	  r5.y = r4.w * r5.y;
/*171*/	  r5.y = r5.y * r5.w + r0.w;
/*172*/	  r7.x = r1.w * 8.000000;
/*173*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*174*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*175*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*176*/	}
/*177*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*178*/	r7.x = max(r5.y, 0.000000);
/*179*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*180*/	if(floatBitsToUint(r5.y) != 0u) {
/*181*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*182*/	  r4.x = max(r4.x, -1.000000);
/*183*/	  r4.x = min(r4.x, 1.000000);
/*184*/	  r4.y = -abs(r4.x) + 1.000000;
/*185*/	  r4.y = sqrt(r4.y);
/*186*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*187*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*188*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*189*/	  r5.y = r4.y * r4.z;
/*190*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*191*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*192*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*193*/	  r4.x = r4.z * r4.y + r4.x;
/*194*/	  r3.x = r3.x * r3.x;
/*195*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*196*/	  r2.w = r3.x * r2.w + r5.x;
/*197*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*198*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*199*/	  r3.x = -r2.w * r2.w + 1.000000;
/*200*/	  r3.x = max(r3.x, 0.001000);
/*201*/	  r3.x = log2(r3.x);
/*202*/	  r4.y = r3.x * 4.950617;
/*203*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*204*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*205*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*206*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*207*/	  r2.w = floatBitsToInt(r2.w);
/*208*/	  r4.y = r3.x * r3.x + -r4.y;
/*209*/	  r4.y = sqrt(r4.y);
/*210*/	  r3.x = -r3.x + r4.y;
/*211*/	  r3.x = max(r3.x, 0.000000);
/*212*/	  r3.x = sqrt(r3.x);
/*213*/	  r2.w = r2.w * r3.x;
/*214*/	  r2.w = r2.w * 1.414214;
/*215*/	  r2.w = 0.008727 / r2.w;
/*216*/	  r2.w = max(r2.w, 0.000100);
/*217*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*218*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*219*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*220*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*221*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*222*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*223*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*224*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*225*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*226*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*227*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*228*/	  r2.w = floatBitsToInt(r2.w);
/*229*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*230*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*231*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*232*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*233*/	  r2.w = r2.w * r4.x + 1.000000;
/*234*/	  r2.w = r2.w * 0.500000;
/*235*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*236*/	  r3.x = r3.x * r4.y + 1.000000;
/*237*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*238*/	  r3.x = min(r7.x, 1.000000);
/*239*/	  r1.w = r1.w * 1.570796;
/*240*/	  r1.w = sin(r1.w);
/*241*/	  r3.x = r3.x + -1.000000;
/*242*/	  r1.w = r1.w * r3.x + 1.000000;
/*243*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*244*/	  r3.x = max(r3.x, 0.000000);
/*245*/	  r3.x = log2(r3.x);
/*246*/	  r3.x = r3.x * 10.000000;
/*247*/	  r3.x = exp2(r3.x);
/*248*/	  r3.x = r4.w * r3.x;
/*249*/	  r3.x = r3.x * r5.w + r0.w;
/*250*/	  r1.w = r1.w * abs(r2.w);
/*251*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*252*/	} else {
/*253*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*254*/	}
/*255*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*256*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*257*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*258*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*259*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*260*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*261*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*262*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*263*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*264*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*265*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*266*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*267*/	r1.w = inversesqrt(r1.w);
/*268*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*269*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*270*/	r1.w = r1.w + r1.w;
/*271*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*272*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*273*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*274*/	r0.x = max(r0.x, 0.000000);
/*275*/	r0.x = log2(r0.x);
/*276*/	r0.x = r0.x * 10.000000;
/*277*/	r0.x = exp2(r0.x);
/*278*/	r0.x = r4.w * r0.x;
/*279*/	r0.x = r0.x * r5.w + r0.w;
/*280*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*281*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*282*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*283*/	r0.w = 1.000000;
/*284*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*285*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*286*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*287*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*288*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*289*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*290*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*291*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*292*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*293*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*294*/	if(r0.x != 0) discard;
/*295*/	color1.x = 1.000000;
/*296*/	return;
}
