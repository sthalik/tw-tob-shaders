//
//
// Shader Model 4
// Fragment Shader
//
// id: 5643 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weighted.hlsl_PS_ps30_alpha_overlay_no_clip.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r1.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r1.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r1.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r1.w = -r1.w + 1.000000;
/*25*/	r1.w = max(r1.w, 0.000000);
/*26*/	r1.w = sqrt(r1.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*29*/	r4.xyz = (-r0.xyzx + r2.zzzz).xyz;
/*30*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*31*/	r2.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*32*/	r4.xyz = (-r1.xyzx + r2.zzzz).xyz;
/*33*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*34*/	r2.z = vsOut_T7.y * -r3.y + r3.y;
/*35*/	r2.z = vsOut_T7.x * -r2.z + r2.z;
/*36*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*37*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*38*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*39*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*40*/	r2.w = inversesqrt(r2.w);
/*41*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*42*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*43*/	r2.w = inversesqrt(r2.w);
/*44*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*45*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r2.w = inversesqrt(r2.w);
/*47*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*48*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*49*/	r2.xyw = (r2.xxxx * r3.yzyw + r4.xyxz).xyw;
/*50*/	r2.xyw = (r1.wwww * r5.xyxz + r2.xyxw).xyw;
/*51*/	r1.w = dot(vec3(r2.xywx), vec3(r2.xywx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r2.xyw = (r1.wwww * r2.xyxw).xyw;
/*54*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*55*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*56*/	r3.y = inversesqrt(r1.w);
/*57*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*58*/	r5.x = -r3.x + 1.000000;
/*59*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*60*/	r5.z = dot(vec3(r3.yzwy), vec3(r2.xywx));
/*61*/	r5.z = r5.z + r5.z;
/*62*/	r6.xyz = (r2.xywx * -r5.zzzz + r3.yzwy).xyz;
/*63*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*64*/	r5.z = r5.x * 1.539380;
/*65*/	r5.z = cos((r5.z));
/*66*/	r5.z = inversesqrt(r5.z);
/*67*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*68*/	r5.w = saturate(r2.z * 60.000000);
/*69*/	r5.w = -r2.z + r5.w;
/*70*/	r8.xyz = (r2.xywx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*71*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*72*/	r6.w = inversesqrt(r6.w);
/*73*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*74*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*75*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*76*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*77*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*78*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*79*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*80*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*81*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*82*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*83*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*84*/	r6.w = -r2.z + 1.000000;
/*85*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*86*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*87*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*88*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*89*/	  r6.w = max(r6.w, 0.000000);
/*90*/	  r6.w = log2(r6.w);
/*91*/	  r6.w = r6.w * 10.000000;
/*92*/	  r6.w = exp2(r6.w);
/*93*/	  r6.w = r5.z * r6.w;
/*94*/	  r6.w = r6.w * r5.w + r2.z;
/*95*/	  r7.y = r5.x * 8.000000;
/*96*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*97*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*98*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*99*/	}
/*100*/	r2.x = dot(vec3(r2.xywx), vec3(-cb1.data[0].yzwy));
/*101*/	r2.y = max(r2.x, 0.000000);
/*102*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*103*/	if(floatBitsToUint(r2.x) != 0u) {
/*104*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*105*/	  r2.x = max(r2.x, -1.000000);
/*106*/	  r2.x = min(r2.x, 1.000000);
/*107*/	  r2.w = -abs(r2.x) + 1.000000;
/*108*/	  r2.w = sqrt(r2.w);
/*109*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*110*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*111*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*112*/	  r6.y = r2.w * r6.x;
/*113*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*114*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*115*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*116*/	  r2.x = r6.x * r2.w + r2.x;
/*117*/	  r2.w = r3.x * r3.x;
/*118*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*119*/	  r2.w = r2.w * r3.x + r7.x;
/*120*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*121*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*122*/	  r3.x = -r2.w * r2.w + 1.000000;
/*123*/	  r3.x = max(r3.x, 0.001000);
/*124*/	  r3.x = log2(r3.x);
/*125*/	  r5.y = r3.x * 4.950617;
/*126*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*127*/	  r6.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*128*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*129*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.w));
/*130*/	  r2.w = floatBitsToInt(r2.w);
/*131*/	  r5.y = r3.x * r3.x + -r5.y;
/*132*/	  r5.y = sqrt(r5.y);
/*133*/	  r3.x = -r3.x + r5.y;
/*134*/	  r3.x = max(r3.x, 0.000000);
/*135*/	  r3.x = sqrt(r3.x);
/*136*/	  r2.w = r2.w * r3.x;
/*137*/	  r2.w = r2.w * 1.414214;
/*138*/	  r2.w = 0.008727 / r2.w;
/*139*/	  r2.w = max(r2.w, 0.000100);
/*140*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*141*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).x;
/*142*/	  r2.xw = (r2.xxxx * r6.xxxy).xw;
/*143*/	  r6.xy = (r2.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*144*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*145*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*146*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*147*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*148*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxw)) * 0xffffffffu)).zw;
/*149*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*150*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*151*/	  r2.x = floatBitsToInt(r2.x);
/*152*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*153*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*154*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*155*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*156*/	  r2.x = r2.x * r6.x + 1.000000;
/*157*/	  r2.x = r2.x * 0.500000;
/*158*/	  r2.w = 1 + ~floatBitsToInt(r6.w);
/*159*/	  r2.w = r2.w * r6.y + 1.000000;
/*160*/	  r2.x = r2.w * 0.500000 + -r2.x;
/*161*/	  r2.w = min(r2.y, 1.000000);
/*162*/	  r3.x = r5.x * 1.570796;
/*163*/	  r3.x = sin(r3.x);
/*164*/	  r2.w = r2.w + -1.000000;
/*165*/	  r2.w = r3.x * r2.w + 1.000000;
/*166*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*167*/	  r3.x = max(r3.x, 0.000000);
/*168*/	  r3.x = log2(r3.x);
/*169*/	  r3.x = r3.x * 10.000000;
/*170*/	  r3.x = exp2(r3.x);
/*171*/	  r3.x = r5.z * r3.x;
/*172*/	  r3.x = r3.x * r5.w + r2.z;
/*173*/	  r2.x = r2.w * abs(r2.x);
/*174*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*175*/	} else {
/*176*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*177*/	}
/*178*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*179*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*180*/	r2.xzw = (max(r2.zzzz, r3.xxyz)).xzw;
/*181*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*182*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*183*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*184*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*185*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*186*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*187*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*188*/	r1.x = sqrt(r1.w);
/*189*/	r1.y = saturate(cb2.data[0].w)/**/;
/*190*/	r1.y = -r1.y + 1.000000;
/*191*/	r1.y = r1.y * 8.000000 + -4.000000;
/*192*/	r1.z = saturate(cb2.data[1].x)/**/;
/*193*/	r1.z = -r1.z + 1.000000;
/*194*/	r1.z = r1.z * 1000.000000;
/*195*/	r1.x = r1.x / r1.z;
/*196*/	r1.x = r1.x + r1.y;
/*197*/	r1.x = r1.x * 1.442695;
/*198*/	r1.x = exp2(r1.x);
/*199*/	r1.x = cb2.data[1].y / r1.x;
/*200*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*201*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*202*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*203*/	r1.y = r1.y + -cb2.data[1].z;
/*204*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*205*/	r1.y = saturate(r1.z * r1.y);
/*206*/	r1.z = r1.y * -2.000000 + 3.000000;
/*207*/	r1.y = r1.y * r1.y;
/*208*/	r1.y = r1.y * r1.z;
/*209*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*210*/	r1.z = sqrt(r1.z);
/*211*/	r1.w = max(cb2.data[2].z, 0.001000);
/*212*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*213*/	r1.z = r1.w * r1.z;
/*214*/	r1.z = min(r1.z, 1.000000);
/*215*/	r1.w = r1.z * -2.000000 + 3.000000;
/*216*/	r1.z = r1.z * r1.z;
/*217*/	r1.z = r1.z * r1.w;
/*218*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*219*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*220*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*221*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*222*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*223*/	r4.w = max(r4.y, 0.000000);
/*224*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*225*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*226*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*227*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*228*/	r1.x = saturate(r1.x * r1.z);
/*229*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*230*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*231*/	color0.w = r0.w * vsOut_T6.w;
/*232*/	return;
}
