//
//
// Shader Model 4
// Fragment Shader
//
// id: 2743 - fxc/glsl_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_weighted_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
/*10*/	r2.z = sqrt(r0.w);
/*11*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r1.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*13*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*14*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*15*/	r0.w = r3.w * r4.w;
/*16*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*17*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*19*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*20*/	r1.x = inversesqrt(r1.x);
/*21*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*22*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*23*/	if(r1.w != 0) discard;
/*24*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * cb4.data[2].xyxx + vsOut_T6.xyxx).xy;
/*26*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*27*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*28*/	r1.w = saturate(-r1.w + r2.w);
/*29*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*30*/	if(floatBitsToUint(r1.w) != 0u) {
/*31*/	  r1.w = -r2.w + 1.000000;
/*32*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*33*/	  r1.w = -r1.w + 1.000000;
/*34*/	  r1.w = -r1.w * r1.w + 1.000000;
/*35*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*36*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*37*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*38*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*39*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*40*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*41*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*42*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*43*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*44*/	} else {
/*45*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*48*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*49*/	}
/*50*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*51*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*52*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*53*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*54*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*55*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*56*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*57*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*58*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*59*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*60*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*61*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*64*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*67*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*70*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*71*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*72*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*73*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*74*/	r1.w = inversesqrt(r1.w);
/*75*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*76*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*77*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*78*/	r2.w = inversesqrt(r1.w);
/*79*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*80*/	r2.w = -r3.x + 1.000000;
/*81*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*82*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*83*/	r5.y = r5.y + r5.y;
/*84*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*85*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*86*/	r6.w = r2.w * 1.539380;
/*87*/	r6.w = cos((r6.w));
/*88*/	r6.w = inversesqrt(r6.w);
/*89*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*90*/	r7.x = saturate(r0.w * 60.000000);
/*91*/	r7.x = -r0.w + r7.x;
/*92*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*93*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*94*/	r8.x = inversesqrt(r8.x);
/*95*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*96*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*97*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*98*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*99*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*100*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*101*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*102*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*103*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*104*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*105*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*106*/	r6.y = -r0.w + 1.000000;
/*107*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*108*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*109*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*110*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*111*/	  r6.y = max(r6.y, 0.000000);
/*112*/	  r6.y = log2(r6.y);
/*113*/	  r6.y = r6.y * 10.000000;
/*114*/	  r6.y = exp2(r6.y);
/*115*/	  r6.y = r6.w * r6.y;
/*116*/	  r6.y = r6.y * r7.x + r0.w;
/*117*/	  r8.x = r2.w * 8.000000;
/*118*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*119*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*120*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*121*/	}
/*122*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*123*/	r1.y = max(r1.x, 0.000000);
/*124*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*125*/	if(floatBitsToUint(r1.x) != 0u) {
/*126*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*127*/	  r1.x = max(r1.x, -1.000000);
/*128*/	  r1.x = min(r1.x, 1.000000);
/*129*/	  r1.z = -abs(r1.x) + 1.000000;
/*130*/	  r1.z = sqrt(r1.z);
/*131*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*132*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*133*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*134*/	  r5.z = r1.z * r5.y;
/*135*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*136*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*137*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*138*/	  r1.x = r5.y * r1.z + r1.x;
/*139*/	  r1.z = r3.x * r3.x;
/*140*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*141*/	  r1.z = r1.z * r3.x + r6.x;
/*142*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*143*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*144*/	  r3.x = -r1.z * r1.z + 1.000000;
/*145*/	  r3.x = max(r3.x, 0.001000);
/*146*/	  r3.x = log2(r3.x);
/*147*/	  r5.x = r3.x * 4.950617;
/*148*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*149*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*150*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*151*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*152*/	  r1.z = floatBitsToInt(r1.z);
/*153*/	  r5.x = r3.x * r3.x + -r5.x;
/*154*/	  r5.x = sqrt(r5.x);
/*155*/	  r3.x = -r3.x + r5.x;
/*156*/	  r3.x = max(r3.x, 0.000000);
/*157*/	  r3.x = sqrt(r3.x);
/*158*/	  r1.z = r1.z * r3.x;
/*159*/	  r1.z = r1.z * 1.414214;
/*160*/	  r1.z = 0.008727 / r1.z;
/*161*/	  r1.z = max(r1.z, 0.000100);
/*162*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*163*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*164*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*165*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*166*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*167*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*168*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*169*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*170*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*171*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*172*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*173*/	  r1.x = floatBitsToInt(r1.x);
/*174*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*175*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*176*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*177*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*178*/	  r1.x = r1.x * r5.x + 1.000000;
/*179*/	  r1.x = r1.x * 0.500000;
/*180*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*181*/	  r1.z = r1.z * r5.y + 1.000000;
/*182*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*183*/	  r1.z = min(r1.y, 1.000000);
/*184*/	  r2.w = r2.w * 1.570796;
/*185*/	  r2.w = sin(r2.w);
/*186*/	  r1.z = r1.z + -1.000000;
/*187*/	  r1.z = r2.w * r1.z + 1.000000;
/*188*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*189*/	  r2.w = max(r2.w, 0.000000);
/*190*/	  r2.w = log2(r2.w);
/*191*/	  r2.w = r2.w * 10.000000;
/*192*/	  r2.w = exp2(r2.w);
/*193*/	  r2.w = r6.w * r2.w;
/*194*/	  r2.w = r2.w * r7.x + r0.w;
/*195*/	  r1.x = r1.z * abs(r1.x);
/*196*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*197*/	} else {
/*198*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*199*/	}
/*200*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*201*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*202*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*203*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*204*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*205*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*206*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*207*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*208*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*209*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*210*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*211*/	r2.w = 1.000000;
/*212*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*213*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*214*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*215*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*216*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*217*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*218*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*219*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*220*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*221*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*222*/	if(r0.w != 0) discard;
/*223*/	r0.w = sqrt(r1.w);
/*224*/	r1.x = saturate(cb3.data[0].w)/**/;
/*225*/	r1.x = -r1.x + 1.000000;
/*226*/	r1.x = r1.x * 8.000000 + -4.000000;
/*227*/	r1.y = saturate(cb3.data[1].x)/**/;
/*228*/	r1.y = -r1.y + 1.000000;
/*229*/	r1.y = r1.y * 1000.000000;
/*230*/	r0.w = r0.w / r1.y;
/*231*/	r0.w = r0.w + r1.x;
/*232*/	r0.w = r0.w * 1.442695;
/*233*/	r0.w = exp2(r0.w);
/*234*/	r0.w = cb3.data[1].y / r0.w;
/*235*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*236*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*237*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*238*/	r1.x = r1.x + -cb3.data[1].z;
/*239*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*240*/	r1.x = saturate(r1.y * r1.x);
/*241*/	r1.y = r1.x * -2.000000 + 3.000000;
/*242*/	r1.x = r1.x * r1.x;
/*243*/	r1.x = r1.x * r1.y;
/*244*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*245*/	r1.y = sqrt(r1.y);
/*246*/	r1.z = max(cb3.data[2].z, 0.001000);
/*247*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*248*/	r1.y = r1.z * r1.y;
/*249*/	r1.y = min(r1.y, 1.000000);
/*250*/	r1.z = r1.y * -2.000000 + 3.000000;
/*251*/	r1.y = r1.y * r1.y;
/*252*/	r1.y = r1.y * r1.z;
/*253*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*254*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*255*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*256*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*257*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*258*/	r4.w = max(r4.y, 0.000000);
/*259*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*260*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*261*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*262*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*263*/	r0.w = saturate(r0.w * r1.y);
/*264*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*265*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*266*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*267*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*268*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*269*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*270*/	color0.w = 1.000000;
/*271*/	return;
}
