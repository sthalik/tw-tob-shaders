//
//
// Shader Model 4
// Fragment Shader
//
// id: 5645 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weighted.hlsl_PS_ps30_alpha_overlay_no_faction_colour.glsl
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
/*13*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*14*/	r4.xyz = (-r0.xyzx + r2.zzzz).xyz;
/*15*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*16*/	r2.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*17*/	r4.xyz = (-r1.xyzx + r2.zzzz).xyz;
/*18*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*19*/	r2.z = vsOut_T7.y * -r3.y + r3.y;
/*20*/	r2.z = vsOut_T7.x * -r2.z + r2.z;
/*21*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*22*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*23*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*24*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*25*/	r2.w = inversesqrt(r2.w);
/*26*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*27*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*28*/	r2.w = inversesqrt(r2.w);
/*29*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*30*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*31*/	r2.w = inversesqrt(r2.w);
/*32*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*33*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*34*/	r2.xyw = (r2.xxxx * r3.yzyw + r4.xyxz).xyw;
/*35*/	r2.xyw = (r1.wwww * r5.xyxz + r2.xyxw).xyw;
/*36*/	r1.w = dot(vec3(r2.xywx), vec3(r2.xywx));
/*37*/	r1.w = inversesqrt(r1.w);
/*38*/	r2.xyw = (r1.wwww * r2.xyxw).xyw;
/*39*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*40*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*41*/	r3.y = inversesqrt(r1.w);
/*42*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*43*/	r5.x = -r3.x + 1.000000;
/*44*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*45*/	r5.z = dot(vec3(r3.yzwy), vec3(r2.xywx));
/*46*/	r5.z = r5.z + r5.z;
/*47*/	r6.xyz = (r2.xywx * -r5.zzzz + r3.yzwy).xyz;
/*48*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*49*/	r5.z = r5.x * 1.539380;
/*50*/	r5.z = cos((r5.z));
/*51*/	r5.z = inversesqrt(r5.z);
/*52*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*53*/	r5.w = saturate(r2.z * 60.000000);
/*54*/	r5.w = -r2.z + r5.w;
/*55*/	r8.xyz = (r2.xywx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*56*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*57*/	r6.w = inversesqrt(r6.w);
/*58*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*59*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*60*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*61*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*62*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*63*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*64*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*65*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*66*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*67*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*68*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*69*/	r6.w = -r2.z + 1.000000;
/*70*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*71*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*72*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*73*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*74*/	  r6.w = max(r6.w, 0.000000);
/*75*/	  r6.w = log2(r6.w);
/*76*/	  r6.w = r6.w * 10.000000;
/*77*/	  r6.w = exp2(r6.w);
/*78*/	  r6.w = r5.z * r6.w;
/*79*/	  r6.w = r6.w * r5.w + r2.z;
/*80*/	  r7.y = r5.x * 8.000000;
/*81*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*82*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*83*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*84*/	}
/*85*/	r2.x = dot(vec3(r2.xywx), vec3(-cb1.data[0].yzwy));
/*86*/	r2.y = max(r2.x, 0.000000);
/*87*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*88*/	if(floatBitsToUint(r2.x) != 0u) {
/*89*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*90*/	  r2.x = max(r2.x, -1.000000);
/*91*/	  r2.x = min(r2.x, 1.000000);
/*92*/	  r2.w = -abs(r2.x) + 1.000000;
/*93*/	  r2.w = sqrt(r2.w);
/*94*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*95*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*96*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*97*/	  r6.y = r2.w * r6.x;
/*98*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*99*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*100*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*101*/	  r2.x = r6.x * r2.w + r2.x;
/*102*/	  r2.w = r3.x * r3.x;
/*103*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*104*/	  r2.w = r2.w * r3.x + r7.x;
/*105*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*106*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*107*/	  r3.x = -r2.w * r2.w + 1.000000;
/*108*/	  r3.x = max(r3.x, 0.001000);
/*109*/	  r3.x = log2(r3.x);
/*110*/	  r5.y = r3.x * 4.950617;
/*111*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*112*/	  r6.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*113*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*114*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.w));
/*115*/	  r2.w = floatBitsToInt(r2.w);
/*116*/	  r5.y = r3.x * r3.x + -r5.y;
/*117*/	  r5.y = sqrt(r5.y);
/*118*/	  r3.x = -r3.x + r5.y;
/*119*/	  r3.x = max(r3.x, 0.000000);
/*120*/	  r3.x = sqrt(r3.x);
/*121*/	  r2.w = r2.w * r3.x;
/*122*/	  r2.w = r2.w * 1.414214;
/*123*/	  r2.w = 0.008727 / r2.w;
/*124*/	  r2.w = max(r2.w, 0.000100);
/*125*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*126*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).x;
/*127*/	  r2.xw = (r2.xxxx * r6.xxxy).xw;
/*128*/	  r6.xy = (r2.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*129*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*130*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*131*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*132*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*133*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxw)) * 0xffffffffu)).zw;
/*134*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*135*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*136*/	  r2.x = floatBitsToInt(r2.x);
/*137*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*138*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*139*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*140*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*141*/	  r2.x = r2.x * r6.x + 1.000000;
/*142*/	  r2.x = r2.x * 0.500000;
/*143*/	  r2.w = 1 + ~floatBitsToInt(r6.w);
/*144*/	  r2.w = r2.w * r6.y + 1.000000;
/*145*/	  r2.x = r2.w * 0.500000 + -r2.x;
/*146*/	  r2.w = min(r2.y, 1.000000);
/*147*/	  r3.x = r5.x * 1.570796;
/*148*/	  r3.x = sin(r3.x);
/*149*/	  r2.w = r2.w + -1.000000;
/*150*/	  r2.w = r3.x * r2.w + 1.000000;
/*151*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*152*/	  r3.x = max(r3.x, 0.000000);
/*153*/	  r3.x = log2(r3.x);
/*154*/	  r3.x = r3.x * 10.000000;
/*155*/	  r3.x = exp2(r3.x);
/*156*/	  r3.x = r5.z * r3.x;
/*157*/	  r3.x = r3.x * r5.w + r2.z;
/*158*/	  r2.x = r2.w * abs(r2.x);
/*159*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*160*/	} else {
/*161*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*162*/	}
/*163*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*164*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*165*/	r2.xzw = (max(r2.zzzz, r3.xxyz)).xzw;
/*166*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*167*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*168*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*169*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*170*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*171*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*172*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*173*/	r1.x = sqrt(r1.w);
/*174*/	r1.y = saturate(cb2.data[0].w)/**/;
/*175*/	r1.y = -r1.y + 1.000000;
/*176*/	r1.y = r1.y * 8.000000 + -4.000000;
/*177*/	r1.z = saturate(cb2.data[1].x)/**/;
/*178*/	r1.z = -r1.z + 1.000000;
/*179*/	r1.z = r1.z * 1000.000000;
/*180*/	r1.x = r1.x / r1.z;
/*181*/	r1.x = r1.x + r1.y;
/*182*/	r1.x = r1.x * 1.442695;
/*183*/	r1.x = exp2(r1.x);
/*184*/	r1.x = cb2.data[1].y / r1.x;
/*185*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*186*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*187*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*188*/	r1.y = r1.y + -cb2.data[1].z;
/*189*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*190*/	r1.y = saturate(r1.z * r1.y);
/*191*/	r1.z = r1.y * -2.000000 + 3.000000;
/*192*/	r1.y = r1.y * r1.y;
/*193*/	r1.y = r1.y * r1.z;
/*194*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*195*/	r1.z = sqrt(r1.z);
/*196*/	r1.w = max(cb2.data[2].z, 0.001000);
/*197*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*198*/	r1.z = r1.w * r1.z;
/*199*/	r1.z = min(r1.z, 1.000000);
/*200*/	r1.w = r1.z * -2.000000 + 3.000000;
/*201*/	r1.z = r1.z * r1.z;
/*202*/	r1.z = r1.z * r1.w;
/*203*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*204*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*205*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*206*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*207*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*208*/	r4.w = max(r4.y, 0.000000);
/*209*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*210*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*211*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*212*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*213*/	r1.x = saturate(r1.x * r1.z);
/*214*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*215*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*216*/	color0.w = r0.w * vsOut_T6.w;
/*217*/	return;
}
