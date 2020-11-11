//
//
// Shader Model 4
// Fragment Shader
//
// id: 6853 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_weighted_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
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
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
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
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r0.w = -r0.w + 1.000000;
/*10*/	r0.w = max(r0.w, 0.000000);
/*11*/	r3.z = sqrt(r0.w);
/*12*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*16*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*17*/	r0.w = r5.w * r6.w;
/*18*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*19*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*20*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*21*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*22*/	r1.w = inversesqrt(r1.w);
/*23*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*24*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*25*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*26*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*27*/	r5.x = r3.x;
/*28*/	r5.y = cb1.data[26].x * 0.050000 + r3.y;
/*29*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*30*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*31*/	r0.w = saturate(r5.x * 5.000000);
/*32*/	r5.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*33*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*34*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*35*/	r1.w = log2(r3.z);
/*36*/	r1.w = r1.w * 1.800000;
/*37*/	r1.w = exp2(r1.w);
/*38*/	r1.w = r1.w * 10.000000;
/*39*/	r1.w = min(r1.w, 1.000000);
/*40*/	r0.w = r0.w + r1.w;
/*41*/	r0.w = r0.w * 0.500000;
/*42*/	r1.w = -r3.w + 1.000000;
/*43*/	r1.w = log2(r1.w);
/*44*/	r1.w = r1.w * vsOut_T7.z;
/*45*/	r1.w = exp2(r1.w);
/*46*/	r1.w = min(r1.w, 1.000000);
/*47*/	r1.w = r1.w * vsOut_T7.z;
/*48*/	r2.w = r3.z * 0.250000;
/*49*/	r3.xyw = (r5.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*50*/	r3.xyw = (r0.wwww * r3.xyxw + r2.wwww).xyw;
/*51*/	r3.xyw = (-r0.xyxz + r3.xyxw).xyw;
/*52*/	r0.xyz = (r1.wwww * r3.xywx + r0.xyzx).xyz;
/*53*/	r0.w = vsOut_T7.z + -0.025000;
/*54*/	r0.w = max(r0.w, 0.000000);
/*55*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*56*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*57*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*58*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*59*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*60*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*62*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*63*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*64*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*65*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*66*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*67*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*68*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*71*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*74*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*77*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*78*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*79*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*80*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*81*/	r1.w = inversesqrt(r1.w);
/*82*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*83*/	r3.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*84*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*85*/	r2.w = inversesqrt(r1.w);
/*86*/	r4.yzw = (r2.wwww * r3.xxyz).yzw;
/*87*/	r2.w = -r4.x + 1.000000;
/*88*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*89*/	r5.y = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*90*/	r5.y = r5.y + r5.y;
/*91*/	r5.yzw = (r2.xxyz * -r5.yyyy + r4.yyzw).yzw;
/*92*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*93*/	r6.w = r2.w * 1.539380;
/*94*/	r6.w = cos((r6.w));
/*95*/	r6.w = inversesqrt(r6.w);
/*96*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*97*/	r7.x = saturate(r0.w * 60.000000);
/*98*/	r7.x = -r0.w + r7.x;
/*99*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*100*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*101*/	r8.x = inversesqrt(r8.x);
/*102*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*103*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*104*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*105*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*106*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*107*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*108*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*109*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*110*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*111*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*112*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*113*/	r6.y = -r0.w + 1.000000;
/*114*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*115*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*116*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*117*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.yzwy));
/*118*/	  r6.y = max(r6.y, 0.000000);
/*119*/	  r6.y = log2(r6.y);
/*120*/	  r6.y = r6.y * 10.000000;
/*121*/	  r6.y = exp2(r6.y);
/*122*/	  r6.y = r6.w * r6.y;
/*123*/	  r6.y = r6.y * r7.x + r0.w;
/*124*/	  r8.x = r2.w * 8.000000;
/*125*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*126*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*127*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*128*/	}
/*129*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*130*/	r2.y = max(r2.x, 0.000000);
/*131*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*132*/	if(floatBitsToUint(r2.x) != 0u) {
/*133*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*134*/	  r2.x = max(r2.x, -1.000000);
/*135*/	  r2.x = min(r2.x, 1.000000);
/*136*/	  r2.z = -abs(r2.x) + 1.000000;
/*137*/	  r2.z = sqrt(r2.z);
/*138*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*139*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*140*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*141*/	  r5.z = r2.z * r5.y;
/*142*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*143*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*144*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*145*/	  r2.x = r5.y * r2.z + r2.x;
/*146*/	  r2.z = r4.x * r4.x;
/*147*/	    r4.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*148*/	  r2.z = r2.z * r4.x + r6.x;
/*149*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*150*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*151*/	  r4.x = -r2.z * r2.z + 1.000000;
/*152*/	  r4.x = max(r4.x, 0.001000);
/*153*/	  r4.x = log2(r4.x);
/*154*/	  r5.x = r4.x * 4.950617;
/*155*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*156*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*157*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*158*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*159*/	  r2.z = floatBitsToInt(r2.z);
/*160*/	  r5.x = r4.x * r4.x + -r5.x;
/*161*/	  r5.x = sqrt(r5.x);
/*162*/	  r4.x = -r4.x + r5.x;
/*163*/	  r4.x = max(r4.x, 0.000000);
/*164*/	  r4.x = sqrt(r4.x);
/*165*/	  r2.z = r2.z * r4.x;
/*166*/	  r2.z = r2.z * 1.414214;
/*167*/	  r2.z = 0.008727 / r2.z;
/*168*/	  r2.z = max(r2.z, 0.000100);
/*169*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*170*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*171*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*172*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*173*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*174*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*175*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*176*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*177*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*178*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*179*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*180*/	  r2.x = floatBitsToInt(r2.x);
/*181*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*182*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*183*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*184*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*185*/	  r2.x = r2.x * r5.x + 1.000000;
/*186*/	  r2.x = r2.x * 0.500000;
/*187*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*188*/	  r2.z = r2.z * r5.y + 1.000000;
/*189*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*190*/	  r2.z = min(r2.y, 1.000000);
/*191*/	  r2.w = r2.w * 1.570796;
/*192*/	  r2.w = sin(r2.w);
/*193*/	  r2.z = r2.z + -1.000000;
/*194*/	  r2.z = r2.w * r2.z + 1.000000;
/*195*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r4.yzwy));
/*196*/	  r2.w = max(r2.w, 0.000000);
/*197*/	  r2.w = log2(r2.w);
/*198*/	  r2.w = r2.w * 10.000000;
/*199*/	  r2.w = exp2(r2.w);
/*200*/	  r2.w = r6.w * r2.w;
/*201*/	  r2.w = r2.w * r7.x + r0.w;
/*202*/	  r2.x = r2.z * abs(r2.x);
/*203*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*204*/	} else {
/*205*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*206*/	}
/*207*/	r4.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*208*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*209*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*210*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*211*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*212*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*213*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*214*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*215*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*216*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*217*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*218*/	r2.w = 1.000000;
/*219*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*220*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*221*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*222*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*223*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*224*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*225*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*226*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*227*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*228*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*229*/	if(r0.w != 0) discard;
/*230*/	r0.w = sqrt(r1.w);
/*231*/	r1.x = saturate(cb3.data[0].w)/**/;
/*232*/	r1.x = -r1.x + 1.000000;
/*233*/	r1.x = r1.x * 8.000000 + -4.000000;
/*234*/	r1.y = saturate(cb3.data[1].x)/**/;
/*235*/	r1.y = -r1.y + 1.000000;
/*236*/	r1.y = r1.y * 1000.000000;
/*237*/	r0.w = r0.w / r1.y;
/*238*/	r0.w = r0.w + r1.x;
/*239*/	r0.w = r0.w * 1.442695;
/*240*/	r0.w = exp2(r0.w);
/*241*/	r0.w = cb3.data[1].y / r0.w;
/*242*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*243*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*244*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*245*/	r1.x = r1.x + -cb3.data[1].z;
/*246*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*247*/	r1.x = saturate(r1.y * r1.x);
/*248*/	r1.y = r1.x * -2.000000 + 3.000000;
/*249*/	r1.x = r1.x * r1.x;
/*250*/	r1.x = r1.x * r1.y;
/*251*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*252*/	r1.y = sqrt(r1.y);
/*253*/	r1.z = max(cb3.data[2].z, 0.001000);
/*254*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*255*/	r1.y = r1.z * r1.y;
/*256*/	r1.y = min(r1.y, 1.000000);
/*257*/	r1.z = r1.y * -2.000000 + 3.000000;
/*258*/	r1.y = r1.y * r1.y;
/*259*/	r1.y = r1.y * r1.z;
/*260*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*261*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*262*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*263*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*264*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*265*/	r3.w = max(r3.y, 0.000000);
/*266*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*267*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*268*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*269*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*270*/	r0.w = saturate(r0.w * r1.y);
/*271*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*272*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*273*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*274*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*275*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*276*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*277*/	color0.w = 1.000000;
/*278*/	return;
}
