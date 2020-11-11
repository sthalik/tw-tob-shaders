//
//
// Shader Model 4
// Fragment Shader
//
// id: 5641 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weighted.hlsl_PS_ps30_alpha_overlay.glsl
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
/*2*/	r1.w = r0.w + -0.501961;
/*3*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r1.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r1.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r1.w = sqrt(r1.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*32*/	r4.xyz = (-r0.xyzx + r2.zzzz).xyz;
/*33*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*34*/	r2.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r4.xyz = (-r1.xyzx + r2.zzzz).xyz;
/*36*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*37*/	r2.z = vsOut_T7.y * -r3.y + r3.y;
/*38*/	r2.z = vsOut_T7.x * -r2.z + r2.z;
/*39*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*40*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*41*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*42*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	r2.w = inversesqrt(r2.w);
/*44*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*45*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*46*/	r2.w = inversesqrt(r2.w);
/*47*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*48*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r2.w = inversesqrt(r2.w);
/*50*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*51*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*52*/	r2.xyw = (r2.xxxx * r3.yzyw + r4.xyxz).xyw;
/*53*/	r2.xyw = (r1.wwww * r5.xyxz + r2.xyxw).xyw;
/*54*/	r1.w = dot(vec3(r2.xywx), vec3(r2.xywx));
/*55*/	r1.w = inversesqrt(r1.w);
/*56*/	r2.xyw = (r1.wwww * r2.xyxw).xyw;
/*57*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*58*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*59*/	r3.y = inversesqrt(r1.w);
/*60*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*61*/	r5.x = -r3.x + 1.000000;
/*62*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*63*/	r5.z = dot(vec3(r3.yzwy), vec3(r2.xywx));
/*64*/	r5.z = r5.z + r5.z;
/*65*/	r6.xyz = (r2.xywx * -r5.zzzz + r3.yzwy).xyz;
/*66*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*67*/	r5.z = r5.x * 1.539380;
/*68*/	r5.z = cos((r5.z));
/*69*/	r5.z = inversesqrt(r5.z);
/*70*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*71*/	r5.w = saturate(r2.z * 60.000000);
/*72*/	r5.w = -r2.z + r5.w;
/*73*/	r8.xyz = (r2.xywx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*74*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*75*/	r6.w = inversesqrt(r6.w);
/*76*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*77*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*78*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*79*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*80*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*81*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*82*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*83*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*84*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*85*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*86*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*87*/	r6.w = -r2.z + 1.000000;
/*88*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*89*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*90*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*91*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*92*/	  r6.w = max(r6.w, 0.000000);
/*93*/	  r6.w = log2(r6.w);
/*94*/	  r6.w = r6.w * 10.000000;
/*95*/	  r6.w = exp2(r6.w);
/*96*/	  r6.w = r5.z * r6.w;
/*97*/	  r6.w = r6.w * r5.w + r2.z;
/*98*/	  r7.y = r5.x * 8.000000;
/*99*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*100*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*101*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*102*/	}
/*103*/	r2.x = dot(vec3(r2.xywx), vec3(-cb1.data[0].yzwy));
/*104*/	r2.y = max(r2.x, 0.000000);
/*105*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*106*/	if(floatBitsToUint(r2.x) != 0u) {
/*107*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*108*/	  r2.x = max(r2.x, -1.000000);
/*109*/	  r2.x = min(r2.x, 1.000000);
/*110*/	  r2.w = -abs(r2.x) + 1.000000;
/*111*/	  r2.w = sqrt(r2.w);
/*112*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*113*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*114*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*115*/	  r6.y = r2.w * r6.x;
/*116*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*117*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*118*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*119*/	  r2.x = r6.x * r2.w + r2.x;
/*120*/	  r2.w = r3.x * r3.x;
/*121*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*122*/	  r2.w = r2.w * r3.x + r7.x;
/*123*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*124*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*125*/	  r3.x = -r2.w * r2.w + 1.000000;
/*126*/	  r3.x = max(r3.x, 0.001000);
/*127*/	  r3.x = log2(r3.x);
/*128*/	  r5.y = r3.x * 4.950617;
/*129*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*130*/	  r6.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*131*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*132*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.w));
/*133*/	  r2.w = floatBitsToInt(r2.w);
/*134*/	  r5.y = r3.x * r3.x + -r5.y;
/*135*/	  r5.y = sqrt(r5.y);
/*136*/	  r3.x = -r3.x + r5.y;
/*137*/	  r3.x = max(r3.x, 0.000000);
/*138*/	  r3.x = sqrt(r3.x);
/*139*/	  r2.w = r2.w * r3.x;
/*140*/	  r2.w = r2.w * 1.414214;
/*141*/	  r2.w = 0.008727 / r2.w;
/*142*/	  r2.w = max(r2.w, 0.000100);
/*143*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*144*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).x;
/*145*/	  r2.xw = (r2.xxxx * r6.xxxy).xw;
/*146*/	  r6.xy = (r2.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*147*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*148*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*149*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*150*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*151*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxw)) * 0xffffffffu)).zw;
/*152*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*153*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*154*/	  r2.x = floatBitsToInt(r2.x);
/*155*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*156*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*157*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*158*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*159*/	  r2.x = r2.x * r6.x + 1.000000;
/*160*/	  r2.x = r2.x * 0.500000;
/*161*/	  r2.w = 1 + ~floatBitsToInt(r6.w);
/*162*/	  r2.w = r2.w * r6.y + 1.000000;
/*163*/	  r2.x = r2.w * 0.500000 + -r2.x;
/*164*/	  r2.w = min(r2.y, 1.000000);
/*165*/	  r3.x = r5.x * 1.570796;
/*166*/	  r3.x = sin(r3.x);
/*167*/	  r2.w = r2.w + -1.000000;
/*168*/	  r2.w = r3.x * r2.w + 1.000000;
/*169*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*170*/	  r3.x = max(r3.x, 0.000000);
/*171*/	  r3.x = log2(r3.x);
/*172*/	  r3.x = r3.x * 10.000000;
/*173*/	  r3.x = exp2(r3.x);
/*174*/	  r3.x = r5.z * r3.x;
/*175*/	  r3.x = r3.x * r5.w + r2.z;
/*176*/	  r2.x = r2.w * abs(r2.x);
/*177*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*178*/	} else {
/*179*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*180*/	}
/*181*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*182*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*183*/	r2.xzw = (max(r2.zzzz, r3.xxyz)).xzw;
/*184*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*185*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*186*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*187*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*188*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*189*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*190*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*191*/	r1.x = sqrt(r1.w);
/*192*/	r1.y = saturate(cb2.data[0].w)/**/;
/*193*/	r1.y = -r1.y + 1.000000;
/*194*/	r1.y = r1.y * 8.000000 + -4.000000;
/*195*/	r1.z = saturate(cb2.data[1].x)/**/;
/*196*/	r1.z = -r1.z + 1.000000;
/*197*/	r1.z = r1.z * 1000.000000;
/*198*/	r1.x = r1.x / r1.z;
/*199*/	r1.x = r1.x + r1.y;
/*200*/	r1.x = r1.x * 1.442695;
/*201*/	r1.x = exp2(r1.x);
/*202*/	r1.x = cb2.data[1].y / r1.x;
/*203*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*204*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*205*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*206*/	r1.y = r1.y + -cb2.data[1].z;
/*207*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*208*/	r1.y = saturate(r1.z * r1.y);
/*209*/	r1.z = r1.y * -2.000000 + 3.000000;
/*210*/	r1.y = r1.y * r1.y;
/*211*/	r1.y = r1.y * r1.z;
/*212*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*213*/	r1.z = sqrt(r1.z);
/*214*/	r1.w = max(cb2.data[2].z, 0.001000);
/*215*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*216*/	r1.z = r1.w * r1.z;
/*217*/	r1.z = min(r1.z, 1.000000);
/*218*/	r1.w = r1.z * -2.000000 + 3.000000;
/*219*/	r1.z = r1.z * r1.z;
/*220*/	r1.z = r1.z * r1.w;
/*221*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*222*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*223*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*224*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*225*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*226*/	r4.w = max(r4.y, 0.000000);
/*227*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*228*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*229*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*230*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*231*/	r1.x = saturate(r1.x * r1.z);
/*232*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*233*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*234*/	color0.w = r0.w * vsOut_T6.w;
/*235*/	return;
}
