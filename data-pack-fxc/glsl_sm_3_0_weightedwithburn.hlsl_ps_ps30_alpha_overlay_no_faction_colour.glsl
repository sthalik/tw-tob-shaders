//
//
// Shader Model 4
// Fragment Shader
//
// id: 2167 - fxc/glsl_SM_3_0_weightedwithburn.hlsl_PS_ps30_alpha_overlay_no_faction_colour.glsl
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
flat in vec4 vsOut_T6;
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
/*2*/	r1.w = r0.w + -0.501961;
/*3*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r1.w = -r1.w + 1.000000;
/*10*/	r1.w = max(r1.w, 0.000000);
/*11*/	r1.w = sqrt(r1.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*14*/	r4.x = r2.z;
/*15*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*16*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*17*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*18*/	r2.z = saturate(r4.x * 5.000000);
/*19*/	r4.xyzw = r2.zzzz * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*20*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*21*/	r2.z = saturate(-r2.z * 15.000000 + 1.000000);
/*22*/	r2.w = log2(r5.z);
/*23*/	r2.w = r2.w * 1.800000;
/*24*/	r2.w = exp2(r2.w);
/*25*/	r2.w = r2.w * 10.000000;
/*26*/	r2.w = min(r2.w, 1.000000);
/*27*/	r2.z = r2.w + r2.z;
/*28*/	r2.z = r2.z * 0.500000;
/*29*/	r2.w = -r5.w + 1.000000;
/*30*/	r2.w = log2(r2.w);
/*31*/	r2.w = r2.w * vsOut_T7.z;
/*32*/	r2.w = exp2(r2.w);
/*33*/	r2.w = min(r2.w, 1.000000);
/*34*/	r2.w = r2.w * vsOut_T7.z;
/*35*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*36*/	r5.w = 1.000000;
/*37*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*38*/	r4.xyzw = r2.zzzz * r4.xyzw + r5.zzzw;
/*39*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*40*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*41*/	r2.z = vsOut_T7.z + -0.025000;
/*42*/	r2.z = max(r2.z, 0.000000);
/*43*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*44*/	r0.xyzw = r2.zzzz * r4.xyzw + r0.xyzw;
/*45*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*46*/	r4.xyz = (-r0.xyzx + r2.zzzz).xyz;
/*47*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*48*/	r2.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r4.xyz = (-r1.xyzx + r2.zzzz).xyz;
/*50*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*51*/	r2.z = vsOut_T7.y * -r3.y + r3.y;
/*52*/	r2.z = vsOut_T7.x * -r2.z + r2.z;
/*53*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*54*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*55*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*56*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*57*/	r2.w = inversesqrt(r2.w);
/*58*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*59*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*60*/	r2.w = inversesqrt(r2.w);
/*61*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*62*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*63*/	r2.w = inversesqrt(r2.w);
/*64*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*65*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*66*/	r2.xyw = (r2.xxxx * r3.yzyw + r4.xyxz).xyw;
/*67*/	r2.xyw = (r1.wwww * r5.xyxz + r2.xyxw).xyw;
/*68*/	r1.w = dot(vec3(r2.xywx), vec3(r2.xywx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r2.xyw = (r1.wwww * r2.xyxw).xyw;
/*71*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*72*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*73*/	r3.y = inversesqrt(r1.w);
/*74*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*75*/	r5.x = -r3.x + 1.000000;
/*76*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*77*/	r5.z = dot(vec3(r3.yzwy), vec3(r2.xywx));
/*78*/	r5.z = r5.z + r5.z;
/*79*/	r6.xyz = (r2.xywx * -r5.zzzz + r3.yzwy).xyz;
/*80*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*81*/	r5.z = r5.x * 1.539380;
/*82*/	r5.z = cos((r5.z));
/*83*/	r5.z = inversesqrt(r5.z);
/*84*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*85*/	r5.w = saturate(r2.z * 60.000000);
/*86*/	r5.w = -r2.z + r5.w;
/*87*/	r8.xyz = (r2.xywx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*88*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*89*/	r6.w = inversesqrt(r6.w);
/*90*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*91*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*92*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*93*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*94*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*95*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*96*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*97*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*98*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*99*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*100*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*101*/	r6.w = -r2.z + 1.000000;
/*102*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*103*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*104*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*105*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*106*/	  r6.w = max(r6.w, 0.000000);
/*107*/	  r6.w = log2(r6.w);
/*108*/	  r6.w = r6.w * 10.000000;
/*109*/	  r6.w = exp2(r6.w);
/*110*/	  r6.w = r5.z * r6.w;
/*111*/	  r6.w = r6.w * r5.w + r2.z;
/*112*/	  r7.y = r5.x * 8.000000;
/*113*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*114*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*115*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*116*/	}
/*117*/	r2.x = dot(vec3(r2.xywx), vec3(-cb1.data[0].yzwy));
/*118*/	r2.y = max(r2.x, 0.000000);
/*119*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*120*/	if(floatBitsToUint(r2.x) != 0u) {
/*121*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*122*/	  r2.x = max(r2.x, -1.000000);
/*123*/	  r2.x = min(r2.x, 1.000000);
/*124*/	  r2.w = -abs(r2.x) + 1.000000;
/*125*/	  r2.w = sqrt(r2.w);
/*126*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*127*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*128*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*129*/	  r6.y = r2.w * r6.x;
/*130*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*131*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*132*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*133*/	  r2.x = r6.x * r2.w + r2.x;
/*134*/	  r2.w = r3.x * r3.x;
/*135*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*136*/	  r2.w = r2.w * r3.x + r7.x;
/*137*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*138*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*139*/	  r3.x = -r2.w * r2.w + 1.000000;
/*140*/	  r3.x = max(r3.x, 0.001000);
/*141*/	  r3.x = log2(r3.x);
/*142*/	  r5.y = r3.x * 4.950617;
/*143*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*144*/	  r6.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*145*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*146*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.w));
/*147*/	  r2.w = floatBitsToInt(r2.w);
/*148*/	  r5.y = r3.x * r3.x + -r5.y;
/*149*/	  r5.y = sqrt(r5.y);
/*150*/	  r3.x = -r3.x + r5.y;
/*151*/	  r3.x = max(r3.x, 0.000000);
/*152*/	  r3.x = sqrt(r3.x);
/*153*/	  r2.w = r2.w * r3.x;
/*154*/	  r2.w = r2.w * 1.414214;
/*155*/	  r2.w = 0.008727 / r2.w;
/*156*/	  r2.w = max(r2.w, 0.000100);
/*157*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*158*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).x;
/*159*/	  r2.xw = (r2.xxxx * r6.xxxy).xw;
/*160*/	  r6.xy = (r2.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*161*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*162*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*163*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*164*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*165*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxw)) * 0xffffffffu)).zw;
/*166*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*167*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*168*/	  r2.x = floatBitsToInt(r2.x);
/*169*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*170*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*171*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*172*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*173*/	  r2.x = r2.x * r6.x + 1.000000;
/*174*/	  r2.x = r2.x * 0.500000;
/*175*/	  r2.w = 1 + ~floatBitsToInt(r6.w);
/*176*/	  r2.w = r2.w * r6.y + 1.000000;
/*177*/	  r2.x = r2.w * 0.500000 + -r2.x;
/*178*/	  r2.w = min(r2.y, 1.000000);
/*179*/	  r3.x = r5.x * 1.570796;
/*180*/	  r3.x = sin(r3.x);
/*181*/	  r2.w = r2.w + -1.000000;
/*182*/	  r2.w = r3.x * r2.w + 1.000000;
/*183*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*184*/	  r3.x = max(r3.x, 0.000000);
/*185*/	  r3.x = log2(r3.x);
/*186*/	  r3.x = r3.x * 10.000000;
/*187*/	  r3.x = exp2(r3.x);
/*188*/	  r3.x = r5.z * r3.x;
/*189*/	  r3.x = r3.x * r5.w + r2.z;
/*190*/	  r2.x = r2.w * abs(r2.x);
/*191*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*192*/	} else {
/*193*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*194*/	}
/*195*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*196*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*197*/	r2.xzw = (max(r2.zzzz, r3.xxyz)).xzw;
/*198*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*199*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*200*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*201*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*202*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*203*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*204*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*205*/	r1.x = sqrt(r1.w);
/*206*/	r1.y = saturate(cb2.data[0].w)/**/;
/*207*/	r1.y = -r1.y + 1.000000;
/*208*/	r1.y = r1.y * 8.000000 + -4.000000;
/*209*/	r1.z = saturate(cb2.data[1].x)/**/;
/*210*/	r1.z = -r1.z + 1.000000;
/*211*/	r1.z = r1.z * 1000.000000;
/*212*/	r1.x = r1.x / r1.z;
/*213*/	r1.x = r1.x + r1.y;
/*214*/	r1.x = r1.x * 1.442695;
/*215*/	r1.x = exp2(r1.x);
/*216*/	r1.x = cb2.data[1].y / r1.x;
/*217*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*218*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*219*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*220*/	r1.y = r1.y + -cb2.data[1].z;
/*221*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*222*/	r1.y = saturate(r1.z * r1.y);
/*223*/	r1.z = r1.y * -2.000000 + 3.000000;
/*224*/	r1.y = r1.y * r1.y;
/*225*/	r1.y = r1.y * r1.z;
/*226*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*227*/	r1.z = sqrt(r1.z);
/*228*/	r1.w = max(cb2.data[2].z, 0.001000);
/*229*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*230*/	r1.z = r1.w * r1.z;
/*231*/	r1.z = min(r1.z, 1.000000);
/*232*/	r1.w = r1.z * -2.000000 + 3.000000;
/*233*/	r1.z = r1.z * r1.z;
/*234*/	r1.z = r1.z * r1.w;
/*235*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*236*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*237*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*238*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*239*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*240*/	r4.w = max(r4.y, 0.000000);
/*241*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*242*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*243*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*244*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*245*/	r1.x = saturate(r1.x * r1.z);
/*246*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*247*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*248*/	color0.w = r0.w * vsOut_T6.w;
/*249*/	return;
}
