//
//
// Shader Model 4
// Fragment Shader
//
// id: 6222 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithburn.hlsl_PS_ps30_alpha_blend.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_fire_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r1.w = -r1.w + 1.000000;
/*7*/	r1.w = max(r1.w, 0.000000);
/*8*/	r1.w = sqrt(r1.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*11*/	r4.x = r2.z;
/*12*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*13*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*14*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*15*/	r2.z = saturate(r4.x * 5.000000);
/*16*/	r4.xyzw = r2.zzzz * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*17*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*18*/	r2.z = saturate(-r2.z * 15.000000 + 1.000000);
/*19*/	r2.w = log2(r5.z);
/*20*/	r2.w = r2.w * 1.800000;
/*21*/	r2.w = exp2(r2.w);
/*22*/	r2.w = r2.w * 10.000000;
/*23*/	r2.w = min(r2.w, 1.000000);
/*24*/	r2.z = r2.w + r2.z;
/*25*/	r2.z = r2.z * 0.500000;
/*26*/	r2.w = -r5.w + 1.000000;
/*27*/	r2.w = log2(r2.w);
/*28*/	r2.w = r2.w * vsOut_T7.z;
/*29*/	r2.w = exp2(r2.w);
/*30*/	r2.w = min(r2.w, 1.000000);
/*31*/	r2.w = r2.w * vsOut_T7.z;
/*32*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*33*/	r5.w = 1.000000;
/*34*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*35*/	r4.xyzw = r2.zzzz * r4.xyzw + r5.zzzw;
/*36*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*37*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*38*/	r2.z = vsOut_T7.z + -0.025000;
/*39*/	r2.z = max(r2.z, 0.000000);
/*40*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*41*/	r0.xyzw = r2.zzzz * r4.xyzw + r0.xyzw;
/*42*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*43*/	r4.xyz = (-r0.xyzx + r2.zzzz).xyz;
/*44*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*45*/	r2.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*46*/	r4.xyz = (-r1.xyzx + r2.zzzz).xyz;
/*47*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*48*/	r2.z = vsOut_T7.y * -r3.y + r3.y;
/*49*/	r2.z = vsOut_T7.x * -r2.z + r2.z;
/*50*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*51*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*52*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*53*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*54*/	r2.w = inversesqrt(r2.w);
/*55*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*56*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*57*/	r2.w = inversesqrt(r2.w);
/*58*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*59*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*60*/	r2.w = inversesqrt(r2.w);
/*61*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*62*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*63*/	r2.xyw = (r2.xxxx * r3.yzyw + r4.xyxz).xyw;
/*64*/	r2.xyw = (r1.wwww * r5.xyxz + r2.xyxw).xyw;
/*65*/	r1.w = dot(vec3(r2.xywx), vec3(r2.xywx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r2.xyw = (r1.wwww * r2.xyxw).xyw;
/*68*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*69*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*70*/	r3.y = inversesqrt(r1.w);
/*71*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*72*/	r5.x = -r3.x + 1.000000;
/*73*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*74*/	r5.z = dot(vec3(r3.yzwy), vec3(r2.xywx));
/*75*/	r5.z = r5.z + r5.z;
/*76*/	r6.xyz = (r2.xywx * -r5.zzzz + r3.yzwy).xyz;
/*77*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*78*/	r5.z = r5.x * 1.539380;
/*79*/	r5.z = cos((r5.z));
/*80*/	r5.z = inversesqrt(r5.z);
/*81*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*82*/	r5.w = saturate(r2.z * 60.000000);
/*83*/	r5.w = -r2.z + r5.w;
/*84*/	r8.xyz = (r2.xywx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*85*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*86*/	r6.w = inversesqrt(r6.w);
/*87*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*88*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*89*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*90*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*91*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*92*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*93*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*94*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*95*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*96*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*97*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*98*/	r6.w = -r2.z + 1.000000;
/*99*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*100*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*101*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*102*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*103*/	  r6.w = max(r6.w, 0.000000);
/*104*/	  r6.w = log2(r6.w);
/*105*/	  r6.w = r6.w * 10.000000;
/*106*/	  r6.w = exp2(r6.w);
/*107*/	  r6.w = r5.z * r6.w;
/*108*/	  r6.w = r6.w * r5.w + r2.z;
/*109*/	  r7.y = r5.x * 8.000000;
/*110*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*111*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*112*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*113*/	}
/*114*/	r2.x = dot(vec3(r2.xywx), vec3(-cb1.data[0].yzwy));
/*115*/	r2.y = max(r2.x, 0.000000);
/*116*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*117*/	if(floatBitsToUint(r2.x) != 0u) {
/*118*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*119*/	  r2.x = max(r2.x, -1.000000);
/*120*/	  r2.x = min(r2.x, 1.000000);
/*121*/	  r2.w = -abs(r2.x) + 1.000000;
/*122*/	  r2.w = sqrt(r2.w);
/*123*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*124*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*125*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*126*/	  r6.y = r2.w * r6.x;
/*127*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*128*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*129*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*130*/	  r2.x = r6.x * r2.w + r2.x;
/*131*/	  r2.w = r3.x * r3.x;
/*132*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*133*/	  r2.w = r2.w * r3.x + r7.x;
/*134*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*135*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*136*/	  r3.x = -r2.w * r2.w + 1.000000;
/*137*/	  r3.x = max(r3.x, 0.001000);
/*138*/	  r3.x = log2(r3.x);
/*139*/	  r5.y = r3.x * 4.950617;
/*140*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*141*/	  r6.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*142*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*143*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.w));
/*144*/	  r2.w = floatBitsToInt(r2.w);
/*145*/	  r5.y = r3.x * r3.x + -r5.y;
/*146*/	  r5.y = sqrt(r5.y);
/*147*/	  r3.x = -r3.x + r5.y;
/*148*/	  r3.x = max(r3.x, 0.000000);
/*149*/	  r3.x = sqrt(r3.x);
/*150*/	  r2.w = r2.w * r3.x;
/*151*/	  r2.w = r2.w * 1.414214;
/*152*/	  r2.w = 0.008727 / r2.w;
/*153*/	  r2.w = max(r2.w, 0.000100);
/*154*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*155*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).x;
/*156*/	  r2.xw = (r2.xxxx * r6.xxxy).xw;
/*157*/	  r6.xy = (r2.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*158*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*159*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*160*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*161*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*162*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxw)) * 0xffffffffu)).zw;
/*163*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*164*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*165*/	  r2.x = floatBitsToInt(r2.x);
/*166*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*167*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*168*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*169*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*170*/	  r2.x = r2.x * r6.x + 1.000000;
/*171*/	  r2.x = r2.x * 0.500000;
/*172*/	  r2.w = 1 + ~floatBitsToInt(r6.w);
/*173*/	  r2.w = r2.w * r6.y + 1.000000;
/*174*/	  r2.x = r2.w * 0.500000 + -r2.x;
/*175*/	  r2.w = min(r2.y, 1.000000);
/*176*/	  r3.x = r5.x * 1.570796;
/*177*/	  r3.x = sin(r3.x);
/*178*/	  r2.w = r2.w + -1.000000;
/*179*/	  r2.w = r3.x * r2.w + 1.000000;
/*180*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*181*/	  r3.x = max(r3.x, 0.000000);
/*182*/	  r3.x = log2(r3.x);
/*183*/	  r3.x = r3.x * 10.000000;
/*184*/	  r3.x = exp2(r3.x);
/*185*/	  r3.x = r5.z * r3.x;
/*186*/	  r3.x = r3.x * r5.w + r2.z;
/*187*/	  r2.x = r2.w * abs(r2.x);
/*188*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*189*/	} else {
/*190*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*191*/	}
/*192*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*193*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*194*/	r2.xzw = (max(r2.zzzz, r3.xxyz)).xzw;
/*195*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*196*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*197*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*198*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*199*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*200*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*201*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*202*/	r1.x = sqrt(r1.w);
/*203*/	r1.y = saturate(cb2.data[0].w)/**/;
/*204*/	r1.y = -r1.y + 1.000000;
/*205*/	r1.y = r1.y * 8.000000 + -4.000000;
/*206*/	r1.z = saturate(cb2.data[1].x)/**/;
/*207*/	r1.z = -r1.z + 1.000000;
/*208*/	r1.z = r1.z * 1000.000000;
/*209*/	r1.x = r1.x / r1.z;
/*210*/	r1.x = r1.x + r1.y;
/*211*/	r1.x = r1.x * 1.442695;
/*212*/	r1.x = exp2(r1.x);
/*213*/	r1.x = cb2.data[1].y / r1.x;
/*214*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*215*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*216*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*217*/	r1.y = r1.y + -cb2.data[1].z;
/*218*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*219*/	r1.y = saturate(r1.z * r1.y);
/*220*/	r1.z = r1.y * -2.000000 + 3.000000;
/*221*/	r1.y = r1.y * r1.y;
/*222*/	r1.y = r1.y * r1.z;
/*223*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*224*/	r1.z = sqrt(r1.z);
/*225*/	r1.w = max(cb2.data[2].z, 0.001000);
/*226*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*227*/	r1.z = r1.w * r1.z;
/*228*/	r1.z = min(r1.z, 1.000000);
/*229*/	r1.w = r1.z * -2.000000 + 3.000000;
/*230*/	r1.z = r1.z * r1.z;
/*231*/	r1.z = r1.z * r1.w;
/*232*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*233*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*234*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*235*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*236*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*237*/	r4.w = max(r4.y, 0.000000);
/*238*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*239*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*240*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*241*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*242*/	r1.x = saturate(r1.x * r1.z);
/*243*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*244*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*245*/	color0.w = r0.w;
/*246*/	return;
}
