//
//
// Shader Model 4
// Fragment Shader
//
// id: 2604 - fxc/glsl_SM_3_0_weightedwithblood.hlsl_PS_ps30_weighted_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r0.w = sqrt(r0.w);
/*11*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*12*/	if(r1.z != 0) discard;
/*13*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*14*/	r1.zw = (r1.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*16*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*17*/	r1.z = saturate(-r1.z + r2.w);
/*18*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*19*/	if(floatBitsToUint(r1.z) != 0u) {
/*20*/	  r1.z = -r2.w + 1.000000;
/*21*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*22*/	  r1.z = -r1.z + 1.000000;
/*23*/	  r1.z = -r1.z * r1.z + 1.000000;
/*24*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*25*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*26*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*27*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*28*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*29*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*30*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*31*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*32*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*33*/	} else {
/*34*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*35*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*36*/	}
/*37*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*39*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*40*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*41*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*42*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*43*/	r1.z = vsOut_T7.y * -r3.y + r3.y;
/*44*/	r1.z = vsOut_T7.x * -r1.z + r1.z;
/*45*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*46*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*47*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*48*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*51*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*54*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*55*/	r1.w = inversesqrt(r1.w);
/*56*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*57*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*58*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*59*/	r1.xyw = (r0.wwww * r5.xyxz + r1.xyxw).xyw;
/*60*/	r0.w = dot(vec3(r1.xywx), vec3(r1.xywx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r1.xyw = (r0.wwww * r1.xyxw).xyw;
/*63*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*64*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*65*/	r2.w = inversesqrt(r0.w);
/*66*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*67*/	r2.w = -r3.x + 1.000000;
/*68*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*69*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xywx));
/*70*/	r5.y = r5.y + r5.y;
/*71*/	r5.yzw = (r1.xxyw * -r5.yyyy + r3.yyzw).yzw;
/*72*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*73*/	r6.w = r2.w * 1.539380;
/*74*/	r6.w = cos((r6.w));
/*75*/	r6.w = inversesqrt(r6.w);
/*76*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*77*/	r7.x = saturate(r1.z * 60.000000);
/*78*/	r7.x = -r1.z + r7.x;
/*79*/	r7.yzw = (r1.xxyw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*80*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*81*/	r8.x = inversesqrt(r8.x);
/*82*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*83*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*84*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*85*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*86*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*87*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*88*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*89*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*90*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*91*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*92*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*93*/	r6.y = -r1.z + 1.000000;
/*94*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*95*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*96*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*97*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*98*/	  r6.y = max(r6.y, 0.000000);
/*99*/	  r6.y = log2(r6.y);
/*100*/	  r6.y = r6.y * 10.000000;
/*101*/	  r6.y = exp2(r6.y);
/*102*/	  r6.y = r6.w * r6.y;
/*103*/	  r6.y = r6.y * r7.x + r1.z;
/*104*/	  r8.x = r2.w * 8.000000;
/*105*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*106*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*107*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*108*/	}
/*109*/	r1.x = dot(vec3(r1.xywx), vec3(-cb2.data[0].yzwy));
/*110*/	r1.y = max(r1.x, 0.000000);
/*111*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*112*/	if(floatBitsToUint(r1.x) != 0u) {
/*113*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*114*/	  r1.x = max(r1.x, -1.000000);
/*115*/	  r1.x = min(r1.x, 1.000000);
/*116*/	  r1.w = -abs(r1.x) + 1.000000;
/*117*/	  r1.w = sqrt(r1.w);
/*118*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*119*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*120*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*121*/	  r5.z = r1.w * r5.y;
/*122*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*123*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*124*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*125*/	  r1.x = r5.y * r1.w + r1.x;
/*126*/	  r1.w = r3.x * r3.x;
/*127*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*128*/	  r1.w = r1.w * r3.x + r6.x;
/*129*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*130*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*131*/	  r3.x = -r1.w * r1.w + 1.000000;
/*132*/	  r3.x = max(r3.x, 0.001000);
/*133*/	  r3.x = log2(r3.x);
/*134*/	  r5.x = r3.x * 4.950617;
/*135*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*136*/	  r5.y = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*137*/	  r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*138*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.w));
/*139*/	  r1.w = floatBitsToInt(r1.w);
/*140*/	  r5.x = r3.x * r3.x + -r5.x;
/*141*/	  r5.x = sqrt(r5.x);
/*142*/	  r3.x = -r3.x + r5.x;
/*143*/	  r3.x = max(r3.x, 0.000000);
/*144*/	  r3.x = sqrt(r3.x);
/*145*/	  r1.w = r1.w * r3.x;
/*146*/	  r1.w = r1.w * 1.414214;
/*147*/	  r1.w = 0.008727 / r1.w;
/*148*/	  r1.w = max(r1.w, 0.000100);
/*149*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*150*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).x;
/*151*/	  r1.xw = (r1.xxxx * r5.xxxy).xw;
/*152*/	  r5.xy = (r1.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*153*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*154*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*155*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*156*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*157*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxw)) * 0xffffffffu)).zw;
/*158*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*159*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*160*/	  r1.x = floatBitsToInt(r1.x);
/*161*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*162*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*163*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*164*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*165*/	  r1.x = r1.x * r5.x + 1.000000;
/*166*/	  r1.x = r1.x * 0.500000;
/*167*/	  r1.w = 1 + ~floatBitsToInt(r5.w);
/*168*/	  r1.w = r1.w * r5.y + 1.000000;
/*169*/	  r1.x = r1.w * 0.500000 + -r1.x;
/*170*/	  r1.w = min(r1.y, 1.000000);
/*171*/	  r2.w = r2.w * 1.570796;
/*172*/	  r2.w = sin(r2.w);
/*173*/	  r1.w = r1.w + -1.000000;
/*174*/	  r1.w = r2.w * r1.w + 1.000000;
/*175*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*176*/	  r2.w = max(r2.w, 0.000000);
/*177*/	  r2.w = log2(r2.w);
/*178*/	  r2.w = r2.w * 10.000000;
/*179*/	  r2.w = exp2(r2.w);
/*180*/	  r2.w = r6.w * r2.w;
/*181*/	  r2.w = r2.w * r7.x + r1.z;
/*182*/	  r1.x = r1.w * abs(r1.x);
/*183*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*184*/	} else {
/*185*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*186*/	}
/*187*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*188*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*189*/	r1.xzw = (max(r1.zzzz, r3.xxyz)).xzw;
/*190*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*191*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*192*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*193*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*194*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*195*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*196*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*197*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*198*/	r1.w = 1.000000;
/*199*/	r2.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*200*/	r2.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*201*/	r1.x = dot(r1.xyzw, cb1.data[12].xyzw);
/*202*/	r1.xy = (r2.xyxx / r1.xxxx).xy;
/*203*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*204*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*205*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*206*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r1.x));
/*207*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*208*/	r1.x = uintBitsToFloat(~floatBitsToUint(r1.x));
/*209*/	if(r1.x != 0) discard;
/*210*/	r0.w = sqrt(r0.w);
/*211*/	r1.x = saturate(cb3.data[0].w)/**/;
/*212*/	r1.x = -r1.x + 1.000000;
/*213*/	r1.x = r1.x * 8.000000 + -4.000000;
/*214*/	r1.y = saturate(cb3.data[1].x)/**/;
/*215*/	r1.y = -r1.y + 1.000000;
/*216*/	r1.y = r1.y * 1000.000000;
/*217*/	r0.w = r0.w / r1.y;
/*218*/	r0.w = r0.w + r1.x;
/*219*/	r0.w = r0.w * 1.442695;
/*220*/	r0.w = exp2(r0.w);
/*221*/	r0.w = cb3.data[1].y / r0.w;
/*222*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*223*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*224*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*225*/	r1.x = r1.x + -cb3.data[1].z;
/*226*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*227*/	r1.x = saturate(r1.y * r1.x);
/*228*/	r1.y = r1.x * -2.000000 + 3.000000;
/*229*/	r1.x = r1.x * r1.x;
/*230*/	r1.x = r1.x * r1.y;
/*231*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*232*/	r1.y = sqrt(r1.y);
/*233*/	r1.z = max(cb3.data[2].z, 0.001000);
/*234*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*235*/	r1.y = r1.z * r1.y;
/*236*/	r1.y = min(r1.y, 1.000000);
/*237*/	r1.z = r1.y * -2.000000 + 3.000000;
/*238*/	r1.y = r1.y * r1.y;
/*239*/	r1.y = r1.y * r1.z;
/*240*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*241*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*242*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*243*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*244*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*245*/	r4.w = max(r4.y, 0.000000);
/*246*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*247*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*248*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*249*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*250*/	r0.w = saturate(r0.w * r1.y);
/*251*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*252*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*253*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*254*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*255*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*256*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*257*/	color0.w = 1.000000;
/*258*/	return;
}
