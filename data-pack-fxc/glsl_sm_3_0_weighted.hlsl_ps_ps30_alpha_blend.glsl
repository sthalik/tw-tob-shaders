//
//
// Shader Model 4
// Fragment Shader
//
// id: 1572 - fxc/glsl_SM_3_0_weighted.hlsl_PS_ps30_alpha_blend.glsl
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
/*10*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*11*/	r4.xyz = (-r0.xyzx + r2.zzzz).xyz;
/*12*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*13*/	r2.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*14*/	r4.xyz = (-r1.xyzx + r2.zzzz).xyz;
/*15*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*16*/	r2.z = vsOut_T7.y * -r3.y + r3.y;
/*17*/	r2.z = vsOut_T7.x * -r2.z + r2.z;
/*18*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*19*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*20*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*21*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*22*/	r2.w = inversesqrt(r2.w);
/*23*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*24*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*25*/	r2.w = inversesqrt(r2.w);
/*26*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*27*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*28*/	r2.w = inversesqrt(r2.w);
/*29*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*30*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*31*/	r2.xyw = (r2.xxxx * r3.yzyw + r4.xyxz).xyw;
/*32*/	r2.xyw = (r1.wwww * r5.xyxz + r2.xyxw).xyw;
/*33*/	r1.w = dot(vec3(r2.xywx), vec3(r2.xywx));
/*34*/	r1.w = inversesqrt(r1.w);
/*35*/	r2.xyw = (r1.wwww * r2.xyxw).xyw;
/*36*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*37*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*38*/	r3.y = inversesqrt(r1.w);
/*39*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*40*/	r5.x = -r3.x + 1.000000;
/*41*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*42*/	r5.z = dot(vec3(r3.yzwy), vec3(r2.xywx));
/*43*/	r5.z = r5.z + r5.z;
/*44*/	r6.xyz = (r2.xywx * -r5.zzzz + r3.yzwy).xyz;
/*45*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*46*/	r5.z = r5.x * 1.539380;
/*47*/	r5.z = cos((r5.z));
/*48*/	r5.z = inversesqrt(r5.z);
/*49*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*50*/	r5.w = saturate(r2.z * 60.000000);
/*51*/	r5.w = -r2.z + r5.w;
/*52*/	r8.xyz = (r2.xywx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*53*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*54*/	r6.w = inversesqrt(r6.w);
/*55*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*56*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*57*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*58*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*59*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*60*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*61*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*62*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*63*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*64*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*65*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*66*/	r6.w = -r2.z + 1.000000;
/*67*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*68*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*69*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*70*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*71*/	  r6.w = max(r6.w, 0.000000);
/*72*/	  r6.w = log2(r6.w);
/*73*/	  r6.w = r6.w * 10.000000;
/*74*/	  r6.w = exp2(r6.w);
/*75*/	  r6.w = r5.z * r6.w;
/*76*/	  r6.w = r6.w * r5.w + r2.z;
/*77*/	  r7.y = r5.x * 8.000000;
/*78*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*79*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*80*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*81*/	}
/*82*/	r2.x = dot(vec3(r2.xywx), vec3(-cb1.data[0].yzwy));
/*83*/	r2.y = max(r2.x, 0.000000);
/*84*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*85*/	if(floatBitsToUint(r2.x) != 0u) {
/*86*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*87*/	  r2.x = max(r2.x, -1.000000);
/*88*/	  r2.x = min(r2.x, 1.000000);
/*89*/	  r2.w = -abs(r2.x) + 1.000000;
/*90*/	  r2.w = sqrt(r2.w);
/*91*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*92*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*93*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*94*/	  r6.y = r2.w * r6.x;
/*95*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*96*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*97*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*98*/	  r2.x = r6.x * r2.w + r2.x;
/*99*/	  r2.w = r3.x * r3.x;
/*100*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*101*/	  r2.w = r2.w * r3.x + r7.x;
/*102*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*103*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*104*/	  r3.x = -r2.w * r2.w + 1.000000;
/*105*/	  r3.x = max(r3.x, 0.001000);
/*106*/	  r3.x = log2(r3.x);
/*107*/	  r5.y = r3.x * 4.950617;
/*108*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*109*/	  r6.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*110*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*111*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.w));
/*112*/	  r2.w = floatBitsToInt(r2.w);
/*113*/	  r5.y = r3.x * r3.x + -r5.y;
/*114*/	  r5.y = sqrt(r5.y);
/*115*/	  r3.x = -r3.x + r5.y;
/*116*/	  r3.x = max(r3.x, 0.000000);
/*117*/	  r3.x = sqrt(r3.x);
/*118*/	  r2.w = r2.w * r3.x;
/*119*/	  r2.w = r2.w * 1.414214;
/*120*/	  r2.w = 0.008727 / r2.w;
/*121*/	  r2.w = max(r2.w, 0.000100);
/*122*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*123*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).x;
/*124*/	  r2.xw = (r2.xxxx * r6.xxxy).xw;
/*125*/	  r6.xy = (r2.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*126*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*127*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*128*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*129*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*130*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxw)) * 0xffffffffu)).zw;
/*131*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*132*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*133*/	  r2.x = floatBitsToInt(r2.x);
/*134*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*135*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*136*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*137*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*138*/	  r2.x = r2.x * r6.x + 1.000000;
/*139*/	  r2.x = r2.x * 0.500000;
/*140*/	  r2.w = 1 + ~floatBitsToInt(r6.w);
/*141*/	  r2.w = r2.w * r6.y + 1.000000;
/*142*/	  r2.x = r2.w * 0.500000 + -r2.x;
/*143*/	  r2.w = min(r2.y, 1.000000);
/*144*/	  r3.x = r5.x * 1.570796;
/*145*/	  r3.x = sin(r3.x);
/*146*/	  r2.w = r2.w + -1.000000;
/*147*/	  r2.w = r3.x * r2.w + 1.000000;
/*148*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*149*/	  r3.x = max(r3.x, 0.000000);
/*150*/	  r3.x = log2(r3.x);
/*151*/	  r3.x = r3.x * 10.000000;
/*152*/	  r3.x = exp2(r3.x);
/*153*/	  r3.x = r5.z * r3.x;
/*154*/	  r3.x = r3.x * r5.w + r2.z;
/*155*/	  r2.x = r2.w * abs(r2.x);
/*156*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*157*/	} else {
/*158*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*159*/	}
/*160*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*161*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*162*/	r2.xzw = (max(r2.zzzz, r3.xxyz)).xzw;
/*163*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*164*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*165*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*166*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*167*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*168*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*169*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*170*/	r1.x = sqrt(r1.w);
/*171*/	r1.y = saturate(cb2.data[0].w)/**/;
/*172*/	r1.y = -r1.y + 1.000000;
/*173*/	r1.y = r1.y * 8.000000 + -4.000000;
/*174*/	r1.z = saturate(cb2.data[1].x)/**/;
/*175*/	r1.z = -r1.z + 1.000000;
/*176*/	r1.z = r1.z * 1000.000000;
/*177*/	r1.x = r1.x / r1.z;
/*178*/	r1.x = r1.x + r1.y;
/*179*/	r1.x = r1.x * 1.442695;
/*180*/	r1.x = exp2(r1.x);
/*181*/	r1.x = cb2.data[1].y / r1.x;
/*182*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*183*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*184*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*185*/	r1.y = r1.y + -cb2.data[1].z;
/*186*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*187*/	r1.y = saturate(r1.z * r1.y);
/*188*/	r1.z = r1.y * -2.000000 + 3.000000;
/*189*/	r1.y = r1.y * r1.y;
/*190*/	r1.y = r1.y * r1.z;
/*191*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*192*/	r1.z = sqrt(r1.z);
/*193*/	r1.w = max(cb2.data[2].z, 0.001000);
/*194*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*195*/	r1.z = r1.w * r1.z;
/*196*/	r1.z = min(r1.z, 1.000000);
/*197*/	r1.w = r1.z * -2.000000 + 3.000000;
/*198*/	r1.z = r1.z * r1.z;
/*199*/	r1.z = r1.z * r1.w;
/*200*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*201*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*202*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*203*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*204*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*205*/	r4.w = max(r4.y, 0.000000);
/*206*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*207*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*208*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*209*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*210*/	r1.x = saturate(r1.x * r1.z);
/*211*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*212*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*213*/	color0.w = r0.w;
/*214*/	return;
}
