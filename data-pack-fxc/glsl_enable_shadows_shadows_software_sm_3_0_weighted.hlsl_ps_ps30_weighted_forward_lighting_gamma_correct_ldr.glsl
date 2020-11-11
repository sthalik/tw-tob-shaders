//
//
// Shader Model 4
// Fragment Shader
//
// id: 5686 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weighted.hlsl_PS_ps30_weighted_forward_lighting_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r0.w = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*32*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*33*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*34*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*36*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*37*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*38*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*39*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*40*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*41*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*42*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	r2.z = inversesqrt(r2.z);
/*44*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*45*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*46*/	r2.z = inversesqrt(r2.z);
/*47*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*48*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r2.z = inversesqrt(r2.z);
/*50*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*51*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*52*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*53*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*57*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*58*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*59*/	r2.w = inversesqrt(r0.w);
/*60*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*61*/	r2.w = -r3.x + 1.000000;
/*62*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*63*/	r5.y = dot(vec3(r3.yzwy), vec3(r2.xyzx));
/*64*/	r5.y = r5.y + r5.y;
/*65*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*66*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*67*/	r6.w = r2.w * 1.539380;
/*68*/	r6.w = cos((r6.w));
/*69*/	r6.w = inversesqrt(r6.w);
/*70*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*71*/	r7.x = saturate(r1.w * 60.000000);
/*72*/	r7.x = -r1.w + r7.x;
/*73*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*74*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*75*/	r8.x = inversesqrt(r8.x);
/*76*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*77*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*78*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*79*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*80*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*81*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*82*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*83*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*84*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*85*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*86*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*87*/	r6.y = -r1.w + 1.000000;
/*88*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*89*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*90*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*91*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*92*/	  r6.y = max(r6.y, 0.000000);
/*93*/	  r6.y = log2(r6.y);
/*94*/	  r6.y = r6.y * 10.000000;
/*95*/	  r6.y = exp2(r6.y);
/*96*/	  r6.y = r6.w * r6.y;
/*97*/	  r6.y = r6.y * r7.x + r1.w;
/*98*/	  r8.x = r2.w * 8.000000;
/*99*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*100*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*101*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*102*/	}
/*103*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*104*/	r2.y = max(r2.x, 0.000000);
/*105*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*106*/	if(floatBitsToUint(r2.x) != 0u) {
/*107*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*108*/	  r2.x = max(r2.x, -1.000000);
/*109*/	  r2.x = min(r2.x, 1.000000);
/*110*/	  r2.z = -abs(r2.x) + 1.000000;
/*111*/	  r2.z = sqrt(r2.z);
/*112*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*113*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*114*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*115*/	  r5.z = r2.z * r5.y;
/*116*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*117*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*118*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*119*/	  r2.x = r5.y * r2.z + r2.x;
/*120*/	  r2.z = r3.x * r3.x;
/*121*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*122*/	  r2.z = r2.z * r3.x + r6.x;
/*123*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*124*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*125*/	  r3.x = -r2.z * r2.z + 1.000000;
/*126*/	  r3.x = max(r3.x, 0.001000);
/*127*/	  r3.x = log2(r3.x);
/*128*/	  r5.x = r3.x * 4.950617;
/*129*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*130*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*131*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*132*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*133*/	  r2.z = floatBitsToInt(r2.z);
/*134*/	  r5.x = r3.x * r3.x + -r5.x;
/*135*/	  r5.x = sqrt(r5.x);
/*136*/	  r3.x = -r3.x + r5.x;
/*137*/	  r3.x = max(r3.x, 0.000000);
/*138*/	  r3.x = sqrt(r3.x);
/*139*/	  r2.z = r2.z * r3.x;
/*140*/	  r2.z = r2.z * 1.414214;
/*141*/	  r2.z = 0.008727 / r2.z;
/*142*/	  r2.z = max(r2.z, 0.000100);
/*143*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*144*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*145*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*146*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*147*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*148*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*149*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*150*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*151*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*152*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*153*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*154*/	  r2.x = floatBitsToInt(r2.x);
/*155*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*156*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*157*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*158*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*159*/	  r2.x = r2.x * r5.x + 1.000000;
/*160*/	  r2.x = r2.x * 0.500000;
/*161*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*162*/	  r2.z = r2.z * r5.y + 1.000000;
/*163*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*164*/	  r2.z = min(r2.y, 1.000000);
/*165*/	  r2.w = r2.w * 1.570796;
/*166*/	  r2.w = sin(r2.w);
/*167*/	  r2.z = r2.z + -1.000000;
/*168*/	  r2.z = r2.w * r2.z + 1.000000;
/*169*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*170*/	  r2.w = max(r2.w, 0.000000);
/*171*/	  r2.w = log2(r2.w);
/*172*/	  r2.w = r2.w * 10.000000;
/*173*/	  r2.w = exp2(r2.w);
/*174*/	  r2.w = r6.w * r2.w;
/*175*/	  r2.w = r2.w * r7.x + r1.w;
/*176*/	  r2.x = r2.z * abs(r2.x);
/*177*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*178*/	} else {
/*179*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*180*/	}
/*181*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*182*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*183*/	r2.xzw = (max(r1.wwww, r2.xxzw)).xzw;
/*184*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*185*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*186*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*187*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*188*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*189*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*190*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*191*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*192*/	r1.w = 1.000000;
/*193*/	r2.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*194*/	r2.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*195*/	r1.x = dot(r1.xyzw, cb1.data[12].xyzw);
/*196*/	r1.xy = (r2.xyxx / r1.xxxx).xy;
/*197*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*198*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*199*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*200*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r1.x));
/*201*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*202*/	r1.x = uintBitsToFloat(~floatBitsToUint(r1.x));
/*203*/	if(r1.x != 0) discard;
/*204*/	r0.w = sqrt(r0.w);
/*205*/	r1.x = saturate(cb3.data[0].w)/**/;
/*206*/	r1.x = -r1.x + 1.000000;
/*207*/	r1.x = r1.x * 8.000000 + -4.000000;
/*208*/	r1.y = saturate(cb3.data[1].x)/**/;
/*209*/	r1.y = -r1.y + 1.000000;
/*210*/	r1.y = r1.y * 1000.000000;
/*211*/	r0.w = r0.w / r1.y;
/*212*/	r0.w = r0.w + r1.x;
/*213*/	r0.w = r0.w * 1.442695;
/*214*/	r0.w = exp2(r0.w);
/*215*/	r0.w = cb3.data[1].y / r0.w;
/*216*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*217*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*218*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*219*/	r1.x = r1.x + -cb3.data[1].z;
/*220*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*221*/	r1.x = saturate(r1.y * r1.x);
/*222*/	r1.y = r1.x * -2.000000 + 3.000000;
/*223*/	r1.x = r1.x * r1.x;
/*224*/	r1.x = r1.x * r1.y;
/*225*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*226*/	r1.y = sqrt(r1.y);
/*227*/	r1.z = max(cb3.data[2].z, 0.001000);
/*228*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*229*/	r1.y = r1.z * r1.y;
/*230*/	r1.y = min(r1.y, 1.000000);
/*231*/	r1.z = r1.y * -2.000000 + 3.000000;
/*232*/	r1.y = r1.y * r1.y;
/*233*/	r1.y = r1.y * r1.z;
/*234*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*235*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*236*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*237*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*238*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*239*/	r4.w = max(r4.y, 0.000000);
/*240*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*241*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*242*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*243*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*244*/	r0.w = saturate(r0.w * r1.y);
/*245*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*246*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*247*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*248*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*249*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*250*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*251*/	color0.w = 1.000000;
/*252*/	return;
}
