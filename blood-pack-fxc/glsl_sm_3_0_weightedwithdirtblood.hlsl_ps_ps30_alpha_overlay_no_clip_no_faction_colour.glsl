//
//
// Shader Model 4
// Fragment Shader
//
// id: 2241 - fxc/glsl_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_alpha_overlay_no_clip_no_faction_colour.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*7*/	r2.z = sqrt(r1.z);
/*8*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*10*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*11*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*12*/	r2.w = r3.w * r4.w;
/*13*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*14*/	r0.xyz = (r2.wwww * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*16*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*17*/	r1.x = inversesqrt(r1.x);
/*18*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*19*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r1.w != 0) discard;
/*21*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*23*/	r3.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*24*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*25*/	r1.w = saturate(-r1.w + r3.w);
/*26*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r1.w) != 0u) {
/*28*/	  r1.w = -r3.w + 1.000000;
/*29*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*30*/	  r1.w = -r1.w + 1.000000;
/*31*/	  r1.w = -r1.w * r1.w + 1.000000;
/*32*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*33*/	  r3.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*34*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*35*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*36*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*37*/	  r3.w = 1.000000;
/*38*/	  r4.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r3.xzzw;
/*39*/	  r0.xyzw = r1.wwww * r4.xyzw + r3.xyzw;
/*40*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*41*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*42*/	} else {
/*43*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*44*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*45*/	  r5.xyz = (r2.wwww * r4.xyzx).xyz;
/*46*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*47*/	}
/*48*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*50*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*51*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*52*/	r4.xyz = (-r2.xyzx + r1.wwww).xyz;
/*53*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*54*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*55*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*56*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*57*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*58*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*59*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*60*/	r2.w = inversesqrt(r2.w);
/*61*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*62*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*63*/	r2.w = inversesqrt(r2.w);
/*64*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*65*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*66*/	r2.w = inversesqrt(r2.w);
/*67*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*68*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*69*/	r3.yzw = (r1.xxxx * r3.yyzw + r4.xxyz).yzw;
/*70*/	r1.xyz = (r1.zzzz * r5.xyzx + r3.yzwy).xyz;
/*71*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*72*/	r2.w = inversesqrt(r2.w);
/*73*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*74*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*75*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*76*/	r3.y = inversesqrt(r2.w);
/*77*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*78*/	r5.x = -r3.x + 1.000000;
/*79*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*80*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*81*/	r5.z = r5.z + r5.z;
/*82*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*83*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*84*/	r5.z = r5.x * 1.539380;
/*85*/	r5.z = cos((r5.z));
/*86*/	r5.z = inversesqrt(r5.z);
/*87*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*88*/	r5.w = saturate(r1.w * 60.000000);
/*89*/	r5.w = -r1.w + r5.w;
/*90*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*91*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*92*/	r6.w = inversesqrt(r6.w);
/*93*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*94*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*95*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*96*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*97*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*98*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*99*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*100*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*101*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*102*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*103*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*104*/	r6.w = -r1.w + 1.000000;
/*105*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*106*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*107*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*108*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*109*/	  r6.w = max(r6.w, 0.000000);
/*110*/	  r6.w = log2(r6.w);
/*111*/	  r6.w = r6.w * 10.000000;
/*112*/	  r6.w = exp2(r6.w);
/*113*/	  r6.w = r5.z * r6.w;
/*114*/	  r6.w = r6.w * r5.w + r1.w;
/*115*/	  r7.y = r5.x * 8.000000;
/*116*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*117*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*118*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*119*/	}
/*120*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*121*/	r1.y = max(r1.x, 0.000000);
/*122*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*123*/	if(floatBitsToUint(r1.x) != 0u) {
/*124*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*125*/	  r1.x = max(r1.x, -1.000000);
/*126*/	  r1.x = min(r1.x, 1.000000);
/*127*/	  r1.z = -abs(r1.x) + 1.000000;
/*128*/	  r1.z = sqrt(r1.z);
/*129*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*130*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*131*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*132*/	  r6.y = r1.z * r6.x;
/*133*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*134*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*135*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*136*/	  r1.x = r6.x * r1.z + r1.x;
/*137*/	  r1.z = r3.x * r3.x;
/*138*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*139*/	  r1.z = r1.z * r3.x + r7.x;
/*140*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*141*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*142*/	  r3.x = -r1.z * r1.z + 1.000000;
/*143*/	  r3.x = max(r3.x, 0.001000);
/*144*/	  r3.x = log2(r3.x);
/*145*/	  r5.y = r3.x * 4.950617;
/*146*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*147*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*148*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*149*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*150*/	  r1.z = floatBitsToInt(r1.z);
/*151*/	  r5.y = r3.x * r3.x + -r5.y;
/*152*/	  r5.y = sqrt(r5.y);
/*153*/	  r3.x = -r3.x + r5.y;
/*154*/	  r3.x = max(r3.x, 0.000000);
/*155*/	  r3.x = sqrt(r3.x);
/*156*/	  r1.z = r1.z * r3.x;
/*157*/	  r1.z = r1.z * 1.414214;
/*158*/	  r1.z = 0.008727 / r1.z;
/*159*/	  r1.z = max(r1.z, 0.000100);
/*160*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*161*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*162*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*163*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*164*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*165*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*166*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*167*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*168*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*169*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*170*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*171*/	  r1.x = floatBitsToInt(r1.x);
/*172*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*173*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*174*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*175*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*176*/	  r1.x = r1.x * r6.x + 1.000000;
/*177*/	  r1.x = r1.x * 0.500000;
/*178*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*179*/	  r1.z = r1.z * r6.y + 1.000000;
/*180*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*181*/	  r1.z = min(r1.y, 1.000000);
/*182*/	  r3.x = r5.x * 1.570796;
/*183*/	  r3.x = sin(r3.x);
/*184*/	  r1.z = r1.z + -1.000000;
/*185*/	  r1.z = r3.x * r1.z + 1.000000;
/*186*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*187*/	  r3.x = max(r3.x, 0.000000);
/*188*/	  r3.x = log2(r3.x);
/*189*/	  r3.x = r3.x * 10.000000;
/*190*/	  r3.x = exp2(r3.x);
/*191*/	  r3.x = r5.z * r3.x;
/*192*/	  r3.x = r3.x * r5.w + r1.w;
/*193*/	  r1.x = r1.z * abs(r1.x);
/*194*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*195*/	} else {
/*196*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*197*/	}
/*198*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*199*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*200*/	r1.xzw = (max(r1.wwww, r3.xxyz)).xzw;
/*201*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*202*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*203*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*204*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*205*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*206*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*207*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*208*/	r1.x = sqrt(r2.w);
/*209*/	r1.y = saturate(cb2.data[0].w)/**/;
/*210*/	r1.y = -r1.y + 1.000000;
/*211*/	r1.y = r1.y * 8.000000 + -4.000000;
/*212*/	r1.z = saturate(cb2.data[1].x)/**/;
/*213*/	r1.z = -r1.z + 1.000000;
/*214*/	r1.z = r1.z * 1000.000000;
/*215*/	r1.x = r1.x / r1.z;
/*216*/	r1.x = r1.x + r1.y;
/*217*/	r1.x = r1.x * 1.442695;
/*218*/	r1.x = exp2(r1.x);
/*219*/	r1.x = cb2.data[1].y / r1.x;
/*220*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*221*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*222*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*223*/	r1.y = r1.y + -cb2.data[1].z;
/*224*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*225*/	r1.y = saturate(r1.z * r1.y);
/*226*/	r1.z = r1.y * -2.000000 + 3.000000;
/*227*/	r1.y = r1.y * r1.y;
/*228*/	r1.y = r1.y * r1.z;
/*229*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*230*/	r1.z = sqrt(r1.z);
/*231*/	r1.w = max(cb2.data[2].z, 0.001000);
/*232*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*233*/	r1.z = r1.w * r1.z;
/*234*/	r1.z = min(r1.z, 1.000000);
/*235*/	r1.w = r1.z * -2.000000 + 3.000000;
/*236*/	r1.z = r1.z * r1.z;
/*237*/	r1.z = r1.z * r1.w;
/*238*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*239*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*240*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*241*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*242*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*243*/	r4.w = max(r4.y, 0.000000);
/*244*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*245*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*246*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*247*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*248*/	r1.x = saturate(r1.x * r1.z);
/*249*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*250*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*251*/	color0.w = r0.w * vsOut_T6.w;
/*252*/	return;
}
