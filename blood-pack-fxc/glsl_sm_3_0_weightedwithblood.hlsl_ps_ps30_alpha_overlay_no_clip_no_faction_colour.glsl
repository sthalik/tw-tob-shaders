//
//
// Shader Model 4
// Fragment Shader
//
// id: 2094 - fxc/glsl_SM_3_0_weightedwithblood.hlsl_PS_ps30_alpha_overlay_no_clip_no_faction_colour.glsl
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r1.z = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r1.z = -r1.z + 1.000000;
/*6*/	r1.z = max(r1.z, 0.000000);
/*7*/	r1.z = sqrt(r1.z);
/*8*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*9*/	if(r1.w != 0) discard;
/*10*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*11*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*12*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*13*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*14*/	r1.w = saturate(-r1.w + r2.w);
/*15*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*16*/	if(floatBitsToUint(r1.w) != 0u) {
/*17*/	  r1.w = -r2.w + 1.000000;
/*18*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*19*/	  r1.w = -r1.w + 1.000000;
/*20*/	  r1.w = -r1.w * r1.w + 1.000000;
/*21*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*22*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*23*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*24*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*25*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*26*/	  r2.w = 1.000000;
/*27*/	  r3.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r2.xzzw;
/*28*/	  r0.xyzw = r1.wwww * r3.xyzw + r2.xyzw;
/*29*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*30*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*31*/	} else {
/*32*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*33*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*34*/	}
/*35*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*36*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*37*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*38*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*39*/	r4.xyz = (-r2.xyzx + r1.wwww).xyz;
/*40*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*41*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*42*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*43*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*44*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*45*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*46*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*47*/	r2.w = inversesqrt(r2.w);
/*48*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*49*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*50*/	r2.w = inversesqrt(r2.w);
/*51*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*52*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*53*/	r2.w = inversesqrt(r2.w);
/*54*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*55*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*56*/	r3.yzw = (r1.xxxx * r3.yyzw + r4.xxyz).yzw;
/*57*/	r1.xyz = (r1.zzzz * r5.xyzx + r3.yzwy).xyz;
/*58*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*59*/	r2.w = inversesqrt(r2.w);
/*60*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*61*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*62*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*63*/	r3.y = inversesqrt(r2.w);
/*64*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*65*/	r5.x = -r3.x + 1.000000;
/*66*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*67*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*68*/	r5.z = r5.z + r5.z;
/*69*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*70*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*71*/	r5.z = r5.x * 1.539380;
/*72*/	r5.z = cos((r5.z));
/*73*/	r5.z = inversesqrt(r5.z);
/*74*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*75*/	r5.w = saturate(r1.w * 60.000000);
/*76*/	r5.w = -r1.w + r5.w;
/*77*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*78*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*79*/	r6.w = inversesqrt(r6.w);
/*80*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*81*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*82*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*83*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*84*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*85*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*86*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*87*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*88*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*89*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*90*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*91*/	r6.w = -r1.w + 1.000000;
/*92*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*93*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*94*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*95*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*96*/	  r6.w = max(r6.w, 0.000000);
/*97*/	  r6.w = log2(r6.w);
/*98*/	  r6.w = r6.w * 10.000000;
/*99*/	  r6.w = exp2(r6.w);
/*100*/	  r6.w = r5.z * r6.w;
/*101*/	  r6.w = r6.w * r5.w + r1.w;
/*102*/	  r7.y = r5.x * 8.000000;
/*103*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*104*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*105*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*106*/	}
/*107*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*108*/	r1.y = max(r1.x, 0.000000);
/*109*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*110*/	if(floatBitsToUint(r1.x) != 0u) {
/*111*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*112*/	  r1.x = max(r1.x, -1.000000);
/*113*/	  r1.x = min(r1.x, 1.000000);
/*114*/	  r1.z = -abs(r1.x) + 1.000000;
/*115*/	  r1.z = sqrt(r1.z);
/*116*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*117*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*118*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*119*/	  r6.y = r1.z * r6.x;
/*120*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*121*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*122*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*123*/	  r1.x = r6.x * r1.z + r1.x;
/*124*/	  r1.z = r3.x * r3.x;
/*125*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*126*/	  r1.z = r1.z * r3.x + r7.x;
/*127*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*128*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*129*/	  r3.x = -r1.z * r1.z + 1.000000;
/*130*/	  r3.x = max(r3.x, 0.001000);
/*131*/	  r3.x = log2(r3.x);
/*132*/	  r5.y = r3.x * 4.950617;
/*133*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*134*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*135*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*136*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*137*/	  r1.z = floatBitsToInt(r1.z);
/*138*/	  r5.y = r3.x * r3.x + -r5.y;
/*139*/	  r5.y = sqrt(r5.y);
/*140*/	  r3.x = -r3.x + r5.y;
/*141*/	  r3.x = max(r3.x, 0.000000);
/*142*/	  r3.x = sqrt(r3.x);
/*143*/	  r1.z = r1.z * r3.x;
/*144*/	  r1.z = r1.z * 1.414214;
/*145*/	  r1.z = 0.008727 / r1.z;
/*146*/	  r1.z = max(r1.z, 0.000100);
/*147*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*148*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*149*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*150*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*151*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*152*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*153*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*154*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*155*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*156*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*157*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*158*/	  r1.x = floatBitsToInt(r1.x);
/*159*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*160*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*161*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*162*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*163*/	  r1.x = r1.x * r6.x + 1.000000;
/*164*/	  r1.x = r1.x * 0.500000;
/*165*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*166*/	  r1.z = r1.z * r6.y + 1.000000;
/*167*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*168*/	  r1.z = min(r1.y, 1.000000);
/*169*/	  r3.x = r5.x * 1.570796;
/*170*/	  r3.x = sin(r3.x);
/*171*/	  r1.z = r1.z + -1.000000;
/*172*/	  r1.z = r3.x * r1.z + 1.000000;
/*173*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*174*/	  r3.x = max(r3.x, 0.000000);
/*175*/	  r3.x = log2(r3.x);
/*176*/	  r3.x = r3.x * 10.000000;
/*177*/	  r3.x = exp2(r3.x);
/*178*/	  r3.x = r5.z * r3.x;
/*179*/	  r3.x = r3.x * r5.w + r1.w;
/*180*/	  r1.x = r1.z * abs(r1.x);
/*181*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*182*/	} else {
/*183*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*184*/	}
/*185*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*186*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*187*/	r1.xzw = (max(r1.wwww, r3.xxyz)).xzw;
/*188*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*189*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*190*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*191*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*192*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*193*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*194*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*195*/	r1.x = sqrt(r2.w);
/*196*/	r1.y = saturate(cb2.data[0].w)/**/;
/*197*/	r1.y = -r1.y + 1.000000;
/*198*/	r1.y = r1.y * 8.000000 + -4.000000;
/*199*/	r1.z = saturate(cb2.data[1].x)/**/;
/*200*/	r1.z = -r1.z + 1.000000;
/*201*/	r1.z = r1.z * 1000.000000;
/*202*/	r1.x = r1.x / r1.z;
/*203*/	r1.x = r1.x + r1.y;
/*204*/	r1.x = r1.x * 1.442695;
/*205*/	r1.x = exp2(r1.x);
/*206*/	r1.x = cb2.data[1].y / r1.x;
/*207*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*208*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*209*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*210*/	r1.y = r1.y + -cb2.data[1].z;
/*211*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*212*/	r1.y = saturate(r1.z * r1.y);
/*213*/	r1.z = r1.y * -2.000000 + 3.000000;
/*214*/	r1.y = r1.y * r1.y;
/*215*/	r1.y = r1.y * r1.z;
/*216*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*217*/	r1.z = sqrt(r1.z);
/*218*/	r1.w = max(cb2.data[2].z, 0.001000);
/*219*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*220*/	r1.z = r1.w * r1.z;
/*221*/	r1.z = min(r1.z, 1.000000);
/*222*/	r1.w = r1.z * -2.000000 + 3.000000;
/*223*/	r1.z = r1.z * r1.z;
/*224*/	r1.z = r1.z * r1.w;
/*225*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*226*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*227*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*228*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*229*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*230*/	r4.w = max(r4.y, 0.000000);
/*231*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*232*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*233*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*234*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*235*/	r1.x = saturate(r1.x * r1.z);
/*236*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*237*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*238*/	color0.w = r0.w * vsOut_T6.w;
/*239*/	return;
}
