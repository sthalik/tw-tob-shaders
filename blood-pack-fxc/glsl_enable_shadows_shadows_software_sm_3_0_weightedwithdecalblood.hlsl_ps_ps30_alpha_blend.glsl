//
//
// Shader Model 4
// Fragment Shader
//
// id: 6439 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_alpha_blend.glsl
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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r1.w = -r1.w + 1.000000;
/*7*/	r1.w = max(r1.w, 0.000000);
/*8*/	r2.z = sqrt(r1.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*11*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*12*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*13*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*14*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*15*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*16*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*17*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*18*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*19*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*20*/	if(floatBitsToUint(r1.w) != 0u) {
/*21*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*22*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*24*/	  r1.w = -r1.w + 1.000000;
/*25*/	  r1.w = max(r1.w, 0.000000);
/*26*/	  r5.z = sqrt(r1.w);
/*27*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*29*/	  r1.w = r3.x * r7.w;
/*30*/	  r3.x = r1.w * -0.500000 + r3.x;
/*31*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*32*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*33*/	  r1.w = -r4.w * r6.w + 1.000000;
/*34*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*35*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*36*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*37*/	}
/*38*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*39*/	if(r1.w != 0) discard;
/*40*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*41*/	r3.zw = (r3.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*42*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*43*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*44*/	r1.w = saturate(-r1.w + r4.w);
/*45*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*46*/	if(floatBitsToUint(r1.w) != 0u) {
/*47*/	  r1.w = -r4.w + 1.000000;
/*48*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*49*/	  r1.w = -r1.w + 1.000000;
/*50*/	  r1.w = -r1.w * r1.w + 1.000000;
/*51*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*52*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*53*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*54*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*55*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*56*/	  r4.w = 1.000000;
/*57*/	  r5.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r4.xzzw;
/*58*/	  r0.xyzw = r1.wwww * r5.xyzw + r4.xyzw;
/*59*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*60*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*61*/	}
/*62*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*64*/	r4.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*65*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r5.xyz = (-r1.xyzx + r1.wwww).xyz;
/*67*/	r1.xyz = (vsOut_T7.yyyy * r5.xyzx + r1.xyzx).xyz;
/*68*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*69*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*70*/	r3.xzw = (r4.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*71*/	r3.xzw = (-r4.xxyz + r3.xxzw).xzw;
/*72*/	r3.xzw = saturate(vsOut_T7.xxxx * r3.xxzw + r4.xxyz).xzw;
/*73*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*74*/	r2.w = inversesqrt(r2.w);
/*75*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*76*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*77*/	r2.w = inversesqrt(r2.w);
/*78*/	r5.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*79*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*80*/	r2.w = inversesqrt(r2.w);
/*81*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*82*/	r5.xyz = (r2.yyyy * r5.xyzx).xyz;
/*83*/	r2.xyw = (r2.xxxx * r4.xyxz + r5.xyxz).xyw;
/*84*/	r2.xyz = (r2.zzzz * r6.xyzx + r2.xywx).xyz;
/*85*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*86*/	r2.w = inversesqrt(r2.w);
/*87*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*88*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*89*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*90*/	r5.x = inversesqrt(r2.w);
/*91*/	r5.xyz = (r4.xyzx * r5.xxxx).xyz;
/*92*/	r5.w = -r3.y + 1.000000;
/*93*/	r6.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*94*/	r6.y = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*95*/	r6.y = r6.y + r6.y;
/*96*/	r6.yzw = (r2.xxyz * -r6.yyyy + r5.xxyz).yzw;
/*97*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz;
/*98*/	r7.w = r5.w * 1.539380;
/*99*/	r7.w = cos((r7.w));
/*100*/	r7.w = inversesqrt(r7.w);
/*101*/	r7.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r7.w)).w;
/*102*/	r8.x = saturate(r1.w * 60.000000);
/*103*/	r8.x = -r1.w + r8.x;
/*104*/	r8.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*105*/	r9.x = dot(vec3(r8.yzwy), vec3(r8.yzwy));
/*106*/	r9.x = inversesqrt(r9.x);
/*107*/	r8.yzw = (r8.yyzw * r9.xxxx).yzw;
/*108*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*109*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*110*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*111*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*112*/	r8.yzw = (r8.yyzw * r8.yyzw).yzw;
/*113*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*114*/	r9.xyz = (r8.yyyy * r10.xyzx + r9.xyzx).xyz;
/*115*/	r8.yzw = (r8.wwww * r11.xxyz + r9.xxyz).yzw;
/*116*/	r8.yzw = (r7.yyyy * r8.yyzw).yzw;
/*117*/	r8.yzw = (r3.xxzw * r8.yyzw).yzw;
/*118*/	r7.y = -r1.w + 1.000000;
/*119*/	r8.yzw = (r7.yyyy * r8.yyzw).yzw;
/*120*/	r8.yzw = (r7.xxxx * r8.yyzw).yzw;
/*121*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*122*/	  r7.y = dot(vec3(r6.yzwy), vec3(r5.xyzx));
/*123*/	  r7.y = max(r7.y, 0.000000);
/*124*/	  r7.y = log2(r7.y);
/*125*/	  r7.y = r7.y * 10.000000;
/*126*/	  r7.y = exp2(r7.y);
/*127*/	  r7.y = r7.w * r7.y;
/*128*/	  r7.y = r7.y * r8.x + r1.w;
/*129*/	  r9.x = r5.w * 8.000000;
/*130*/	  r9.xyzw = (textureLod(s_environment, r6.yzwy.stp, r9.x)).xyzw;
/*131*/	  r9.xyz = (r7.yyyy * r9.xyzx).xyz;
/*132*/	  r8.yzw = (r9.xxyz * r1.xxyz + r8.yyzw).yzw;
/*133*/	}
/*134*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*135*/	r2.y = max(r2.x, 0.000000);
/*136*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*137*/	if(floatBitsToUint(r2.x) != 0u) {
/*138*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.yzwy));
/*139*/	  r2.x = max(r2.x, -1.000000);
/*140*/	  r2.x = min(r2.x, 1.000000);
/*141*/	  r2.z = -abs(r2.x) + 1.000000;
/*142*/	  r2.z = sqrt(r2.z);
/*143*/	  r6.y = abs(r2.x) * -0.018729 + 0.074261;
/*144*/	  r6.y = r6.y * abs(r2.x) + -0.212114;
/*145*/	  r6.y = r6.y * abs(r2.x) + 1.570729;
/*146*/	  r6.z = r2.z * r6.y;
/*147*/	  r6.z = r6.z * -2.000000 + 3.141593;
/*148*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*149*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.z));
/*150*/	  r2.x = r6.y * r2.z + r2.x;
/*151*/	  r2.z = r3.y * r3.y;
/*152*/	    r3.y = (floatBitsToUint(r6.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*153*/	  r2.z = r2.z * r3.y + r7.x;
/*154*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*155*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*156*/	  r3.y = -r2.z * r2.z + 1.000000;
/*157*/	  r3.y = max(r3.y, 0.001000);
/*158*/	  r3.y = log2(r3.y);
/*159*/	  r6.x = r3.y * 4.950617;
/*160*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*161*/	  r6.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*162*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*163*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.y) + floatBitsToInt(r2.z));
/*164*/	  r2.z = floatBitsToInt(r2.z);
/*165*/	  r6.x = r3.y * r3.y + -r6.x;
/*166*/	  r6.x = sqrt(r6.x);
/*167*/	  r3.y = -r3.y + r6.x;
/*168*/	  r3.y = max(r3.y, 0.000000);
/*169*/	  r3.y = sqrt(r3.y);
/*170*/	  r2.z = r2.z * r3.y;
/*171*/	  r2.z = r2.z * 1.414214;
/*172*/	  r2.z = 0.008727 / r2.z;
/*173*/	  r2.z = max(r2.z, 0.000100);
/*174*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*175*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*176*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*177*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*178*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*179*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*180*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*181*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*182*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*183*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*184*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*185*/	  r2.x = floatBitsToInt(r2.x);
/*186*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*187*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*188*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*189*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*190*/	  r2.x = r2.x * r6.x + 1.000000;
/*191*/	  r2.x = r2.x * 0.500000;
/*192*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*193*/	  r2.z = r2.z * r6.y + 1.000000;
/*194*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*195*/	  r2.z = min(r2.y, 1.000000);
/*196*/	  r3.y = r5.w * 1.570796;
/*197*/	  r3.y = sin(r3.y);
/*198*/	  r2.z = r2.z + -1.000000;
/*199*/	  r2.z = r3.y * r2.z + 1.000000;
/*200*/	  r3.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.xyzx));
/*201*/	  r3.y = max(r3.y, 0.000000);
/*202*/	  r3.y = log2(r3.y);
/*203*/	  r3.y = r3.y * 10.000000;
/*204*/	  r3.y = exp2(r3.y);
/*205*/	  r3.y = r7.w * r3.y;
/*206*/	  r3.y = r3.y * r8.x + r1.w;
/*207*/	  r2.x = r2.z * abs(r2.x);
/*208*/	  r5.xyz = (r3.yyyy * r2.xxxx).xyz;
/*209*/	} else {
/*210*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*211*/	}
/*212*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*213*/	r1.xyz = (r1.xyzx * r6.xyzx).xyz;
/*214*/	r5.xyz = (max(r1.wwww, r5.xyzx)).xyz;
/*215*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*216*/	r2.xyz = (r2.yyyy * r3.xzwx).xyz;
/*217*/	r2.xyz = (r2.xyzx * cb1.data[1].xyzx).xyz;
/*218*/	r2.xyz = (r5.xyzx * r2.xyzx).xyz;
/*219*/	r2.xyz = (r7.xxxx * r2.xyzx).xyz;
/*220*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx + r2.xyzx).xyz;
/*221*/	r1.xyz = (r1.xyzx + r8.yzwy).xyz;
/*222*/	r1.w = sqrt(r2.w);
/*223*/	r2.x = saturate(cb2.data[0].w)/**/;
/*224*/	r2.x = -r2.x + 1.000000;
/*225*/	r2.x = r2.x * 8.000000 + -4.000000;
/*226*/	r2.y = saturate(cb2.data[1].x)/**/;
/*227*/	r2.y = -r2.y + 1.000000;
/*228*/	r2.y = r2.y * 1000.000000;
/*229*/	r1.w = r1.w / r2.y;
/*230*/	r1.w = r1.w + r2.x;
/*231*/	r1.w = r1.w * 1.442695;
/*232*/	r1.w = exp2(r1.w);
/*233*/	r1.w = cb2.data[1].y / r1.w;
/*234*/	r1.w = saturate(-r1.w + cb2.data[1].y);
/*235*/	r2.x = -vsOut_T0.y + cb2.data[1].w;
/*236*/	r2.y = -cb2.data[1].z + cb2.data[1].w;
/*237*/	r2.x = r2.x + -cb2.data[1].z;
/*238*/	r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.y)).y;
/*239*/	r2.x = saturate(r2.y * r2.x);
/*240*/	r2.y = r2.x * -2.000000 + 3.000000;
/*241*/	r2.x = r2.x * r2.x;
/*242*/	r2.x = r2.x * r2.y;
/*243*/	r2.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*244*/	r2.y = sqrt(r2.y);
/*245*/	r2.z = max(cb2.data[2].z, 0.001000);
/*246*/	r2.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).z;
/*247*/	r2.y = r2.z * r2.y;
/*248*/	r2.y = min(r2.y, 1.000000);
/*249*/	r2.z = r2.y * -2.000000 + 3.000000;
/*250*/	r2.y = r2.y * r2.y;
/*251*/	r2.y = r2.y * r2.z;
/*252*/	r1.w = cb2.data[2].x * r2.x + r1.w;
/*253*/	r2.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*254*/	r2.xzw = (r2.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*255*/	r2.xzw = (r2.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*256*/	r3.xyz = (r7.xxxx * r2.xzwx).xyz;
/*257*/	r4.w = max(r4.y, 0.000000);
/*258*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*259*/	r3.w = saturate(dot(vec2(r1.wwww), vec2(cb2.data[2].yyyy)));
/*260*/	r2.xzw = (-r2.xxzw * r7.xxxx + r4.xxyz).xzw;
/*261*/	r2.xzw = (r3.wwww * r2.xxzw + r3.xxyz).xzw;
/*262*/	r1.w = saturate(r1.w * r2.y);
/*263*/	r2.xyz = (-r1.xyzx + r2.xzwx).xyz;
/*264*/	r0.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*265*/	color0.xyzw = r0.xyzw;
/*266*/	return;
}
