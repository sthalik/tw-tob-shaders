//
//
// Shader Model 4
// Fragment Shader
//
// id: 6445 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_alpha_overlay_no_faction_colour.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*11*/	r2.z = sqrt(r1.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*13*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*15*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*17*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*18*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*19*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*20*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*21*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*22*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*23*/	if(floatBitsToUint(r1.w) != 0u) {
/*24*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*27*/	  r1.w = -r1.w + 1.000000;
/*28*/	  r1.w = max(r1.w, 0.000000);
/*29*/	  r5.z = sqrt(r1.w);
/*30*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*31*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*32*/	  r1.w = r3.x * r7.w;
/*33*/	  r3.x = r1.w * -0.500000 + r3.x;
/*34*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*35*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*36*/	  r1.w = -r4.w * r6.w + 1.000000;
/*37*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*38*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*39*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*40*/	}
/*41*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*42*/	if(r1.w != 0) discard;
/*43*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*44*/	r3.zw = (r3.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*45*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*46*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*47*/	r1.w = saturate(-r1.w + r4.w);
/*48*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*49*/	if(floatBitsToUint(r1.w) != 0u) {
/*50*/	  r1.w = -r4.w + 1.000000;
/*51*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*52*/	  r1.w = -r1.w + 1.000000;
/*53*/	  r1.w = -r1.w * r1.w + 1.000000;
/*54*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*55*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*56*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*57*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*58*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*59*/	  r4.w = 1.000000;
/*60*/	  r5.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r4.xzzw;
/*61*/	  r0.xyzw = r1.wwww * r5.xyzw + r4.xyzw;
/*62*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*63*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*64*/	}
/*65*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*67*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*68*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*70*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*71*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*72*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*73*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*74*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*75*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*76*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*77*/	r2.w = inversesqrt(r2.w);
/*78*/	r3.xzw = (r2.wwww * vsOut_T3.xxyz).xzw;
/*79*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*80*/	r2.w = inversesqrt(r2.w);
/*81*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*82*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*83*/	r2.w = inversesqrt(r2.w);
/*84*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*85*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*86*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*87*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*88*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*89*/	r2.w = inversesqrt(r2.w);
/*90*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*91*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*92*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*93*/	r3.x = inversesqrt(r2.w);
/*94*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*95*/	r5.x = -r3.y + 1.000000;
/*96*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*97*/	r5.z = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*98*/	r5.z = r5.z + r5.z;
/*99*/	r6.xyz = (r2.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*100*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*101*/	r5.z = r5.x * 1.539380;
/*102*/	r5.z = cos((r5.z));
/*103*/	r5.z = inversesqrt(r5.z);
/*104*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*105*/	r5.w = saturate(r1.w * 60.000000);
/*106*/	r5.w = -r1.w + r5.w;
/*107*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*108*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*109*/	r6.w = inversesqrt(r6.w);
/*110*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*111*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*112*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*113*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*114*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*115*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*116*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*117*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*118*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*119*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*120*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*121*/	r6.w = -r1.w + 1.000000;
/*122*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*123*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*124*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*125*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*126*/	  r6.w = max(r6.w, 0.000000);
/*127*/	  r6.w = log2(r6.w);
/*128*/	  r6.w = r6.w * 10.000000;
/*129*/	  r6.w = exp2(r6.w);
/*130*/	  r6.w = r5.z * r6.w;
/*131*/	  r6.w = r6.w * r5.w + r1.w;
/*132*/	  r7.y = r5.x * 8.000000;
/*133*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*134*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*135*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*136*/	}
/*137*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*138*/	r2.y = max(r2.x, 0.000000);
/*139*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*140*/	if(floatBitsToUint(r2.x) != 0u) {
/*141*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*142*/	  r2.x = max(r2.x, -1.000000);
/*143*/	  r2.x = min(r2.x, 1.000000);
/*144*/	  r2.z = -abs(r2.x) + 1.000000;
/*145*/	  r2.z = sqrt(r2.z);
/*146*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*147*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*148*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*149*/	  r6.y = r2.z * r6.x;
/*150*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*151*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*152*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*153*/	  r2.x = r6.x * r2.z + r2.x;
/*154*/	  r2.z = r3.y * r3.y;
/*155*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*156*/	  r2.z = r2.z * r3.y + r7.x;
/*157*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*158*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*159*/	  r3.y = -r2.z * r2.z + 1.000000;
/*160*/	  r3.y = max(r3.y, 0.001000);
/*161*/	  r3.y = log2(r3.y);
/*162*/	  r5.y = r3.y * 4.950617;
/*163*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*164*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*165*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*166*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*167*/	  r2.z = floatBitsToInt(r2.z);
/*168*/	  r5.y = r3.y * r3.y + -r5.y;
/*169*/	  r5.y = sqrt(r5.y);
/*170*/	  r3.y = -r3.y + r5.y;
/*171*/	  r3.y = max(r3.y, 0.000000);
/*172*/	  r3.y = sqrt(r3.y);
/*173*/	  r2.z = r2.z * r3.y;
/*174*/	  r2.z = r2.z * 1.414214;
/*175*/	  r2.z = 0.008727 / r2.z;
/*176*/	  r2.z = max(r2.z, 0.000100);
/*177*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*178*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*179*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*180*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*181*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*182*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*183*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*184*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*185*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*186*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*187*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*188*/	  r2.x = floatBitsToInt(r2.x);
/*189*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*190*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*191*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*192*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*193*/	  r2.x = r2.x * r6.x + 1.000000;
/*194*/	  r2.x = r2.x * 0.500000;
/*195*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*196*/	  r2.z = r2.z * r6.y + 1.000000;
/*197*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*198*/	  r2.z = min(r2.y, 1.000000);
/*199*/	  r3.y = r5.x * 1.570796;
/*200*/	  r3.y = sin(r3.y);
/*201*/	  r2.z = r2.z + -1.000000;
/*202*/	  r2.z = r3.y * r2.z + 1.000000;
/*203*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*204*/	  r3.x = max(r3.x, 0.000000);
/*205*/	  r3.x = log2(r3.x);
/*206*/	  r3.x = r3.x * 10.000000;
/*207*/	  r3.x = exp2(r3.x);
/*208*/	  r3.x = r5.z * r3.x;
/*209*/	  r3.x = r3.x * r5.w + r1.w;
/*210*/	  r2.x = r2.z * abs(r2.x);
/*211*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*212*/	} else {
/*213*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*214*/	}
/*215*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*216*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*217*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*218*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*219*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*220*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*221*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*222*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*223*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*224*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*225*/	r1.x = sqrt(r2.w);
/*226*/	r1.y = saturate(cb2.data[0].w)/**/;
/*227*/	r1.y = -r1.y + 1.000000;
/*228*/	r1.y = r1.y * 8.000000 + -4.000000;
/*229*/	r1.z = saturate(cb2.data[1].x)/**/;
/*230*/	r1.z = -r1.z + 1.000000;
/*231*/	r1.z = r1.z * 1000.000000;
/*232*/	r1.x = r1.x / r1.z;
/*233*/	r1.x = r1.x + r1.y;
/*234*/	r1.x = r1.x * 1.442695;
/*235*/	r1.x = exp2(r1.x);
/*236*/	r1.x = cb2.data[1].y / r1.x;
/*237*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*238*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*239*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*240*/	r1.y = r1.y + -cb2.data[1].z;
/*241*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*242*/	r1.y = saturate(r1.z * r1.y);
/*243*/	r1.z = r1.y * -2.000000 + 3.000000;
/*244*/	r1.y = r1.y * r1.y;
/*245*/	r1.y = r1.y * r1.z;
/*246*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*247*/	r1.z = sqrt(r1.z);
/*248*/	r1.w = max(cb2.data[2].z, 0.001000);
/*249*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*250*/	r1.z = r1.w * r1.z;
/*251*/	r1.z = min(r1.z, 1.000000);
/*252*/	r1.w = r1.z * -2.000000 + 3.000000;
/*253*/	r1.z = r1.z * r1.z;
/*254*/	r1.z = r1.z * r1.w;
/*255*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*256*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*257*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*258*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*259*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*260*/	r4.w = max(r4.y, 0.000000);
/*261*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*262*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*263*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*264*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*265*/	r1.x = saturate(r1.x * r1.z);
/*266*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*267*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*268*/	color0.w = r0.w * vsOut_T6.w;
/*269*/	return;
}
