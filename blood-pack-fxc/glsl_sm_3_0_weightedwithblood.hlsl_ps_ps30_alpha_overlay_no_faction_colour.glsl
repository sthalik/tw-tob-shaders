//
//
// Shader Model 4
// Fragment Shader
//
// id: 2092 - fxc/glsl_SM_3_0_weightedwithblood.hlsl_PS_ps30_alpha_overlay_no_faction_colour.glsl
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
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_blood_map;
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
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.x = r0.w + -0.501961;
/*2*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r1.x != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r1.z = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r1.z = -r1.z + 1.000000;
/*9*/	r1.z = max(r1.z, 0.000000);
/*10*/	r1.z = sqrt(r1.z);
/*11*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*12*/	if(r1.w != 0) discard;
/*13*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*14*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*15*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*16*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*17*/	r1.w = saturate(-r1.w + r2.w);
/*18*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*19*/	if(floatBitsToUint(r1.w) != 0u) {
/*20*/	  r1.w = -r2.w + 1.000000;
/*21*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*22*/	  r1.w = -r1.w + 1.000000;
/*23*/	  r1.w = -r1.w * r1.w + 1.000000;
/*24*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*25*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*26*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*27*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*28*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*29*/	  r2.w = 1.000000;
/*30*/	  r3.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r2.xzzw;
/*31*/	  r0.xyzw = r1.wwww * r3.xyzw + r2.xyzw;
/*32*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*33*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*34*/	} else {
/*35*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*36*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*37*/	}
/*38*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*39*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*40*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*41*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*42*/	r4.xyz = (-r2.xyzx + r1.wwww).xyz;
/*43*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*44*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*45*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*46*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*47*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*48*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*49*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*50*/	r2.w = inversesqrt(r2.w);
/*51*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*52*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*53*/	r2.w = inversesqrt(r2.w);
/*54*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*55*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*56*/	r2.w = inversesqrt(r2.w);
/*57*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*58*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*59*/	r3.yzw = (r1.xxxx * r3.yyzw + r4.xxyz).yzw;
/*60*/	r1.xyz = (r1.zzzz * r5.xyzx + r3.yzwy).xyz;
/*61*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*62*/	r2.w = inversesqrt(r2.w);
/*63*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*64*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*65*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*66*/	r3.y = inversesqrt(r2.w);
/*67*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*68*/	r5.x = -r3.x + 1.000000;
/*69*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*70*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*71*/	r5.z = r5.z + r5.z;
/*72*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*73*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*74*/	r5.z = r5.x * 1.539380;
/*75*/	r5.z = cos((r5.z));
/*76*/	r5.z = inversesqrt(r5.z);
/*77*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*78*/	r5.w = saturate(r1.w * 60.000000);
/*79*/	r5.w = -r1.w + r5.w;
/*80*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*81*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*82*/	r6.w = inversesqrt(r6.w);
/*83*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*84*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*85*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*86*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*87*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*88*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*89*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*90*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*91*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*92*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*93*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*94*/	r6.w = -r1.w + 1.000000;
/*95*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*96*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*97*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*98*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*99*/	  r6.w = max(r6.w, 0.000000);
/*100*/	  r6.w = log2(r6.w);
/*101*/	  r6.w = r6.w * 10.000000;
/*102*/	  r6.w = exp2(r6.w);
/*103*/	  r6.w = r5.z * r6.w;
/*104*/	  r6.w = r6.w * r5.w + r1.w;
/*105*/	  r7.y = r5.x * 8.000000;
/*106*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*107*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*108*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*109*/	}
/*110*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*111*/	r1.y = max(r1.x, 0.000000);
/*112*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*113*/	if(floatBitsToUint(r1.x) != 0u) {
/*114*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*115*/	  r1.x = max(r1.x, -1.000000);
/*116*/	  r1.x = min(r1.x, 1.000000);
/*117*/	  r1.z = -abs(r1.x) + 1.000000;
/*118*/	  r1.z = sqrt(r1.z);
/*119*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*120*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*121*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*122*/	  r6.y = r1.z * r6.x;
/*123*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*124*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*125*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*126*/	  r1.x = r6.x * r1.z + r1.x;
/*127*/	  r1.z = r3.x * r3.x;
/*128*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*129*/	  r1.z = r1.z * r3.x + r7.x;
/*130*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*131*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*132*/	  r3.x = -r1.z * r1.z + 1.000000;
/*133*/	  r3.x = max(r3.x, 0.001000);
/*134*/	  r3.x = log2(r3.x);
/*135*/	  r5.y = r3.x * 4.950617;
/*136*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*137*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*138*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*139*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*140*/	  r1.z = floatBitsToInt(r1.z);
/*141*/	  r5.y = r3.x * r3.x + -r5.y;
/*142*/	  r5.y = sqrt(r5.y);
/*143*/	  r3.x = -r3.x + r5.y;
/*144*/	  r3.x = max(r3.x, 0.000000);
/*145*/	  r3.x = sqrt(r3.x);
/*146*/	  r1.z = r1.z * r3.x;
/*147*/	  r1.z = r1.z * 1.414214;
/*148*/	  r1.z = 0.008727 / r1.z;
/*149*/	  r1.z = max(r1.z, 0.000100);
/*150*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*151*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*152*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*153*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*154*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*155*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*156*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*157*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*158*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*159*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*160*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*161*/	  r1.x = floatBitsToInt(r1.x);
/*162*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*163*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*164*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*165*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*166*/	  r1.x = r1.x * r6.x + 1.000000;
/*167*/	  r1.x = r1.x * 0.500000;
/*168*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*169*/	  r1.z = r1.z * r6.y + 1.000000;
/*170*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*171*/	  r1.z = min(r1.y, 1.000000);
/*172*/	  r3.x = r5.x * 1.570796;
/*173*/	  r3.x = sin(r3.x);
/*174*/	  r1.z = r1.z + -1.000000;
/*175*/	  r1.z = r3.x * r1.z + 1.000000;
/*176*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*177*/	  r3.x = max(r3.x, 0.000000);
/*178*/	  r3.x = log2(r3.x);
/*179*/	  r3.x = r3.x * 10.000000;
/*180*/	  r3.x = exp2(r3.x);
/*181*/	  r3.x = r5.z * r3.x;
/*182*/	  r3.x = r3.x * r5.w + r1.w;
/*183*/	  r1.x = r1.z * abs(r1.x);
/*184*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*185*/	} else {
/*186*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*187*/	}
/*188*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*189*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*190*/	r1.xzw = (max(r1.wwww, r3.xxyz)).xzw;
/*191*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*192*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*193*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*194*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*195*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*196*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*197*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*198*/	r1.x = sqrt(r2.w);
/*199*/	r1.y = saturate(cb2.data[0].w)/**/;
/*200*/	r1.y = -r1.y + 1.000000;
/*201*/	r1.y = r1.y * 8.000000 + -4.000000;
/*202*/	r1.z = saturate(cb2.data[1].x)/**/;
/*203*/	r1.z = -r1.z + 1.000000;
/*204*/	r1.z = r1.z * 1000.000000;
/*205*/	r1.x = r1.x / r1.z;
/*206*/	r1.x = r1.x + r1.y;
/*207*/	r1.x = r1.x * 1.442695;
/*208*/	r1.x = exp2(r1.x);
/*209*/	r1.x = cb2.data[1].y / r1.x;
/*210*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*211*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*212*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*213*/	r1.y = r1.y + -cb2.data[1].z;
/*214*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*215*/	r1.y = saturate(r1.z * r1.y);
/*216*/	r1.z = r1.y * -2.000000 + 3.000000;
/*217*/	r1.y = r1.y * r1.y;
/*218*/	r1.y = r1.y * r1.z;
/*219*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*220*/	r1.z = sqrt(r1.z);
/*221*/	r1.w = max(cb2.data[2].z, 0.001000);
/*222*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*223*/	r1.z = r1.w * r1.z;
/*224*/	r1.z = min(r1.z, 1.000000);
/*225*/	r1.w = r1.z * -2.000000 + 3.000000;
/*226*/	r1.z = r1.z * r1.z;
/*227*/	r1.z = r1.z * r1.w;
/*228*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*229*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*230*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*231*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*232*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*233*/	r4.w = max(r4.y, 0.000000);
/*234*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*235*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*236*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*237*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*238*/	r1.x = saturate(r1.x * r1.z);
/*239*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*240*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*241*/	color0.w = r0.w * vsOut_T6.w;
/*242*/	return;
}
