//
//
// Shader Model 4
// Fragment Shader
//
// id: 6664 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithblood.hlsl_PS_ps30_weighted_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r0.w = sqrt(r0.w);
/*8*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*9*/	if(r1.z != 0) discard;
/*10*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*11*/	r1.zw = (r1.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*13*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*14*/	r1.z = saturate(-r1.z + r2.w);
/*15*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*16*/	if(floatBitsToUint(r1.z) != 0u) {
/*17*/	  r1.z = -r2.w + 1.000000;
/*18*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*19*/	  r1.z = -r1.z + 1.000000;
/*20*/	  r1.z = -r1.z * r1.z + 1.000000;
/*21*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*22*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*23*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*24*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*25*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*26*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*27*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*28*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*29*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*30*/	} else {
/*31*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*32*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*33*/	}
/*34*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*36*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*37*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*39*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*40*/	r1.z = vsOut_T7.y * -r3.y + r3.y;
/*41*/	r1.z = vsOut_T7.x * -r1.z + r1.z;
/*42*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*43*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*44*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*45*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*46*/	r1.w = inversesqrt(r1.w);
/*47*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*48*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*51*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*54*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*55*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*56*/	r1.xyw = (r0.wwww * r5.xyxz + r1.xyxw).xyw;
/*57*/	r0.w = dot(vec3(r1.xywx), vec3(r1.xywx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r1.xyw = (r0.wwww * r1.xyxw).xyw;
/*60*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*61*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*62*/	r2.w = inversesqrt(r0.w);
/*63*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*64*/	r2.w = -r3.x + 1.000000;
/*65*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*66*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xywx));
/*67*/	r5.y = r5.y + r5.y;
/*68*/	r5.yzw = (r1.xxyw * -r5.yyyy + r3.yyzw).yzw;
/*69*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*70*/	r6.w = r2.w * 1.539380;
/*71*/	r6.w = cos((r6.w));
/*72*/	r6.w = inversesqrt(r6.w);
/*73*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*74*/	r7.x = saturate(r1.z * 60.000000);
/*75*/	r7.x = -r1.z + r7.x;
/*76*/	r7.yzw = (r1.xxyw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*77*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*78*/	r8.x = inversesqrt(r8.x);
/*79*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*80*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*81*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*82*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*83*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*84*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*85*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*86*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*87*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*88*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*89*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*90*/	r6.y = -r1.z + 1.000000;
/*91*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*92*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*93*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*94*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*95*/	  r6.y = max(r6.y, 0.000000);
/*96*/	  r6.y = log2(r6.y);
/*97*/	  r6.y = r6.y * 10.000000;
/*98*/	  r6.y = exp2(r6.y);
/*99*/	  r6.y = r6.w * r6.y;
/*100*/	  r6.y = r6.y * r7.x + r1.z;
/*101*/	  r8.x = r2.w * 8.000000;
/*102*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*103*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*104*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*105*/	}
/*106*/	r1.x = dot(vec3(r1.xywx), vec3(-cb2.data[0].yzwy));
/*107*/	r1.y = max(r1.x, 0.000000);
/*108*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*109*/	if(floatBitsToUint(r1.x) != 0u) {
/*110*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*111*/	  r1.x = max(r1.x, -1.000000);
/*112*/	  r1.x = min(r1.x, 1.000000);
/*113*/	  r1.w = -abs(r1.x) + 1.000000;
/*114*/	  r1.w = sqrt(r1.w);
/*115*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*116*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*117*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*118*/	  r5.z = r1.w * r5.y;
/*119*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*120*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*121*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*122*/	  r1.x = r5.y * r1.w + r1.x;
/*123*/	  r1.w = r3.x * r3.x;
/*124*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*125*/	  r1.w = r1.w * r3.x + r6.x;
/*126*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*127*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*128*/	  r3.x = -r1.w * r1.w + 1.000000;
/*129*/	  r3.x = max(r3.x, 0.001000);
/*130*/	  r3.x = log2(r3.x);
/*131*/	  r5.x = r3.x * 4.950617;
/*132*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*133*/	  r5.y = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*134*/	  r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*135*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.w));
/*136*/	  r1.w = floatBitsToInt(r1.w);
/*137*/	  r5.x = r3.x * r3.x + -r5.x;
/*138*/	  r5.x = sqrt(r5.x);
/*139*/	  r3.x = -r3.x + r5.x;
/*140*/	  r3.x = max(r3.x, 0.000000);
/*141*/	  r3.x = sqrt(r3.x);
/*142*/	  r1.w = r1.w * r3.x;
/*143*/	  r1.w = r1.w * 1.414214;
/*144*/	  r1.w = 0.008727 / r1.w;
/*145*/	  r1.w = max(r1.w, 0.000100);
/*146*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*147*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).x;
/*148*/	  r1.xw = (r1.xxxx * r5.xxxy).xw;
/*149*/	  r5.xy = (r1.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*150*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*151*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*152*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*153*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*154*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxw)) * 0xffffffffu)).zw;
/*155*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*156*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*157*/	  r1.x = floatBitsToInt(r1.x);
/*158*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*159*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*160*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*161*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*162*/	  r1.x = r1.x * r5.x + 1.000000;
/*163*/	  r1.x = r1.x * 0.500000;
/*164*/	  r1.w = 1 + ~floatBitsToInt(r5.w);
/*165*/	  r1.w = r1.w * r5.y + 1.000000;
/*166*/	  r1.x = r1.w * 0.500000 + -r1.x;
/*167*/	  r1.w = min(r1.y, 1.000000);
/*168*/	  r2.w = r2.w * 1.570796;
/*169*/	  r2.w = sin(r2.w);
/*170*/	  r1.w = r1.w + -1.000000;
/*171*/	  r1.w = r2.w * r1.w + 1.000000;
/*172*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*173*/	  r2.w = max(r2.w, 0.000000);
/*174*/	  r2.w = log2(r2.w);
/*175*/	  r2.w = r2.w * 10.000000;
/*176*/	  r2.w = exp2(r2.w);
/*177*/	  r2.w = r6.w * r2.w;
/*178*/	  r2.w = r2.w * r7.x + r1.z;
/*179*/	  r1.x = r1.w * abs(r1.x);
/*180*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*181*/	} else {
/*182*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*183*/	}
/*184*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*185*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*186*/	r1.xzw = (max(r1.zzzz, r3.xxyz)).xzw;
/*187*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*188*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*189*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*190*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*191*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*192*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*193*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*194*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*195*/	r1.w = 1.000000;
/*196*/	r2.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*197*/	r2.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*198*/	r1.x = dot(r1.xyzw, cb1.data[12].xyzw);
/*199*/	r1.xy = (r2.xyxx / r1.xxxx).xy;
/*200*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*201*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*202*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*203*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r1.x));
/*204*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*205*/	r1.x = uintBitsToFloat(~floatBitsToUint(r1.x));
/*206*/	if(r1.x != 0) discard;
/*207*/	r0.w = sqrt(r0.w);
/*208*/	r1.x = saturate(cb3.data[0].w)/**/;
/*209*/	r1.x = -r1.x + 1.000000;
/*210*/	r1.x = r1.x * 8.000000 + -4.000000;
/*211*/	r1.y = saturate(cb3.data[1].x)/**/;
/*212*/	r1.y = -r1.y + 1.000000;
/*213*/	r1.y = r1.y * 1000.000000;
/*214*/	r0.w = r0.w / r1.y;
/*215*/	r0.w = r0.w + r1.x;
/*216*/	r0.w = r0.w * 1.442695;
/*217*/	r0.w = exp2(r0.w);
/*218*/	r0.w = cb3.data[1].y / r0.w;
/*219*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*220*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*221*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*222*/	r1.x = r1.x + -cb3.data[1].z;
/*223*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*224*/	r1.x = saturate(r1.y * r1.x);
/*225*/	r1.y = r1.x * -2.000000 + 3.000000;
/*226*/	r1.x = r1.x * r1.x;
/*227*/	r1.x = r1.x * r1.y;
/*228*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*229*/	r1.y = sqrt(r1.y);
/*230*/	r1.z = max(cb3.data[2].z, 0.001000);
/*231*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*232*/	r1.y = r1.z * r1.y;
/*233*/	r1.y = min(r1.y, 1.000000);
/*234*/	r1.z = r1.y * -2.000000 + 3.000000;
/*235*/	r1.y = r1.y * r1.y;
/*236*/	r1.y = r1.y * r1.z;
/*237*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*238*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*239*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*240*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*241*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*242*/	r4.w = max(r4.y, 0.000000);
/*243*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*244*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*245*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*246*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*247*/	r0.w = saturate(r0.w * r1.y);
/*248*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*249*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*250*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*251*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*252*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*253*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*254*/	color0.w = 1.000000;
/*255*/	return;
}
