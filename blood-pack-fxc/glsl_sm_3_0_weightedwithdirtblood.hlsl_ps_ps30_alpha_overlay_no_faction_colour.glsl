//
//
// Shader Model 4
// Fragment Shader
//
// id: 2239 - fxc/glsl_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_alpha_overlay_no_faction_colour.glsl
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
/*1*/	r1.x = r0.w + -0.501961;
/*2*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r1.x != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r1.z = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r1.z = -r1.z + 1.000000;
/*9*/	r1.z = max(r1.z, 0.000000);
/*10*/	r2.z = sqrt(r1.z);
/*11*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*13*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*14*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*15*/	r2.w = r3.w * r4.w;
/*16*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*17*/	r0.xyz = (r2.wwww * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*19*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*20*/	r1.x = inversesqrt(r1.x);
/*21*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*22*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*23*/	if(r1.w != 0) discard;
/*24*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*26*/	r3.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*27*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*28*/	r1.w = saturate(-r1.w + r3.w);
/*29*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*30*/	if(floatBitsToUint(r1.w) != 0u) {
/*31*/	  r1.w = -r3.w + 1.000000;
/*32*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*33*/	  r1.w = -r1.w + 1.000000;
/*34*/	  r1.w = -r1.w * r1.w + 1.000000;
/*35*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*36*/	  r3.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*37*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*38*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*39*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*40*/	  r3.w = 1.000000;
/*41*/	  r4.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r3.xzzw;
/*42*/	  r0.xyzw = r1.wwww * r4.xyzw + r3.xyzw;
/*43*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*44*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*45*/	} else {
/*46*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*48*/	  r5.xyz = (r2.wwww * r4.xyzx).xyz;
/*49*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*50*/	}
/*51*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*52*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*53*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*54*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*55*/	r4.xyz = (-r2.xyzx + r1.wwww).xyz;
/*56*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*57*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*58*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*59*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*60*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*61*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*62*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*63*/	r2.w = inversesqrt(r2.w);
/*64*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*65*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*66*/	r2.w = inversesqrt(r2.w);
/*67*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*68*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*69*/	r2.w = inversesqrt(r2.w);
/*70*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*71*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*72*/	r3.yzw = (r1.xxxx * r3.yyzw + r4.xxyz).yzw;
/*73*/	r1.xyz = (r1.zzzz * r5.xyzx + r3.yzwy).xyz;
/*74*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*77*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*78*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*79*/	r3.y = inversesqrt(r2.w);
/*80*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*81*/	r5.x = -r3.x + 1.000000;
/*82*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*83*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*84*/	r5.z = r5.z + r5.z;
/*85*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*86*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*87*/	r5.z = r5.x * 1.539380;
/*88*/	r5.z = cos((r5.z));
/*89*/	r5.z = inversesqrt(r5.z);
/*90*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*91*/	r5.w = saturate(r1.w * 60.000000);
/*92*/	r5.w = -r1.w + r5.w;
/*93*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*94*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*95*/	r6.w = inversesqrt(r6.w);
/*96*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*97*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*98*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*99*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*100*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*101*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*102*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*103*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*104*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*105*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*106*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*107*/	r6.w = -r1.w + 1.000000;
/*108*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*109*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*110*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*111*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*112*/	  r6.w = max(r6.w, 0.000000);
/*113*/	  r6.w = log2(r6.w);
/*114*/	  r6.w = r6.w * 10.000000;
/*115*/	  r6.w = exp2(r6.w);
/*116*/	  r6.w = r5.z * r6.w;
/*117*/	  r6.w = r6.w * r5.w + r1.w;
/*118*/	  r7.y = r5.x * 8.000000;
/*119*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*120*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*121*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*122*/	}
/*123*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*124*/	r1.y = max(r1.x, 0.000000);
/*125*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*126*/	if(floatBitsToUint(r1.x) != 0u) {
/*127*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*128*/	  r1.x = max(r1.x, -1.000000);
/*129*/	  r1.x = min(r1.x, 1.000000);
/*130*/	  r1.z = -abs(r1.x) + 1.000000;
/*131*/	  r1.z = sqrt(r1.z);
/*132*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*133*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*134*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*135*/	  r6.y = r1.z * r6.x;
/*136*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*137*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*138*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*139*/	  r1.x = r6.x * r1.z + r1.x;
/*140*/	  r1.z = r3.x * r3.x;
/*141*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*142*/	  r1.z = r1.z * r3.x + r7.x;
/*143*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*144*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*145*/	  r3.x = -r1.z * r1.z + 1.000000;
/*146*/	  r3.x = max(r3.x, 0.001000);
/*147*/	  r3.x = log2(r3.x);
/*148*/	  r5.y = r3.x * 4.950617;
/*149*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*150*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*151*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*152*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*153*/	  r1.z = floatBitsToInt(r1.z);
/*154*/	  r5.y = r3.x * r3.x + -r5.y;
/*155*/	  r5.y = sqrt(r5.y);
/*156*/	  r3.x = -r3.x + r5.y;
/*157*/	  r3.x = max(r3.x, 0.000000);
/*158*/	  r3.x = sqrt(r3.x);
/*159*/	  r1.z = r1.z * r3.x;
/*160*/	  r1.z = r1.z * 1.414214;
/*161*/	  r1.z = 0.008727 / r1.z;
/*162*/	  r1.z = max(r1.z, 0.000100);
/*163*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*164*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*165*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*166*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*167*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*168*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*169*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*170*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*171*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*172*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*173*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*174*/	  r1.x = floatBitsToInt(r1.x);
/*175*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*176*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*177*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*178*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*179*/	  r1.x = r1.x * r6.x + 1.000000;
/*180*/	  r1.x = r1.x * 0.500000;
/*181*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*182*/	  r1.z = r1.z * r6.y + 1.000000;
/*183*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*184*/	  r1.z = min(r1.y, 1.000000);
/*185*/	  r3.x = r5.x * 1.570796;
/*186*/	  r3.x = sin(r3.x);
/*187*/	  r1.z = r1.z + -1.000000;
/*188*/	  r1.z = r3.x * r1.z + 1.000000;
/*189*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*190*/	  r3.x = max(r3.x, 0.000000);
/*191*/	  r3.x = log2(r3.x);
/*192*/	  r3.x = r3.x * 10.000000;
/*193*/	  r3.x = exp2(r3.x);
/*194*/	  r3.x = r5.z * r3.x;
/*195*/	  r3.x = r3.x * r5.w + r1.w;
/*196*/	  r1.x = r1.z * abs(r1.x);
/*197*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*198*/	} else {
/*199*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*200*/	}
/*201*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*202*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*203*/	r1.xzw = (max(r1.wwww, r3.xxyz)).xzw;
/*204*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*205*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*206*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*207*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*208*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*209*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*210*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*211*/	r1.x = sqrt(r2.w);
/*212*/	r1.y = saturate(cb2.data[0].w)/**/;
/*213*/	r1.y = -r1.y + 1.000000;
/*214*/	r1.y = r1.y * 8.000000 + -4.000000;
/*215*/	r1.z = saturate(cb2.data[1].x)/**/;
/*216*/	r1.z = -r1.z + 1.000000;
/*217*/	r1.z = r1.z * 1000.000000;
/*218*/	r1.x = r1.x / r1.z;
/*219*/	r1.x = r1.x + r1.y;
/*220*/	r1.x = r1.x * 1.442695;
/*221*/	r1.x = exp2(r1.x);
/*222*/	r1.x = cb2.data[1].y / r1.x;
/*223*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*224*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*225*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*226*/	r1.y = r1.y + -cb2.data[1].z;
/*227*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*228*/	r1.y = saturate(r1.z * r1.y);
/*229*/	r1.z = r1.y * -2.000000 + 3.000000;
/*230*/	r1.y = r1.y * r1.y;
/*231*/	r1.y = r1.y * r1.z;
/*232*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*233*/	r1.z = sqrt(r1.z);
/*234*/	r1.w = max(cb2.data[2].z, 0.001000);
/*235*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*236*/	r1.z = r1.w * r1.z;
/*237*/	r1.z = min(r1.z, 1.000000);
/*238*/	r1.w = r1.z * -2.000000 + 3.000000;
/*239*/	r1.z = r1.z * r1.z;
/*240*/	r1.z = r1.z * r1.w;
/*241*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*242*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*243*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*244*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*245*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*246*/	r4.w = max(r4.y, 0.000000);
/*247*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*248*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*249*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*250*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*251*/	r1.x = saturate(r1.x * r1.z);
/*252*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*253*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*254*/	color0.w = r0.w * vsOut_T6.w;
/*255*/	return;
}
