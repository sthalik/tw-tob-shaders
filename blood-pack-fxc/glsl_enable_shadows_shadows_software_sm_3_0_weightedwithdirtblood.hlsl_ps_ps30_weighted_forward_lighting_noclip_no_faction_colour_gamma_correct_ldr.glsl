//
//
// Shader Model 4
// Fragment Shader
//
// id: 6802 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_weighted_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r2.z = sqrt(r0.w);
/*8*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*10*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*11*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*12*/	r0.w = r3.w * r4.w;
/*13*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*14*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*16*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*17*/	r1.x = inversesqrt(r1.x);
/*18*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*19*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r1.w != 0) discard;
/*21*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * cb4.data[2].xyxx + vsOut_T6.xyxx).xy;
/*23*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*24*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*25*/	r1.w = saturate(-r1.w + r2.w);
/*26*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r1.w) != 0u) {
/*28*/	  r1.w = -r2.w + 1.000000;
/*29*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*30*/	  r1.w = -r1.w + 1.000000;
/*31*/	  r1.w = -r1.w * r1.w + 1.000000;
/*32*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*33*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*34*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*35*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*36*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*37*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*38*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*39*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*40*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*41*/	} else {
/*42*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*44*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*45*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*46*/	}
/*47*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*49*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*50*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*51*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*52*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*53*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*54*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*55*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*56*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*57*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*58*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*61*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*64*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*67*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*68*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*69*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*70*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*73*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*74*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*75*/	r2.w = inversesqrt(r1.w);
/*76*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*77*/	r2.w = -r3.x + 1.000000;
/*78*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*79*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*80*/	r5.y = r5.y + r5.y;
/*81*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*82*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*83*/	r6.w = r2.w * 1.539380;
/*84*/	r6.w = cos((r6.w));
/*85*/	r6.w = inversesqrt(r6.w);
/*86*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*87*/	r7.x = saturate(r0.w * 60.000000);
/*88*/	r7.x = -r0.w + r7.x;
/*89*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*90*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*91*/	r8.x = inversesqrt(r8.x);
/*92*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*93*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*94*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*95*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*96*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*97*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*98*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*99*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*100*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*101*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*102*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*103*/	r6.y = -r0.w + 1.000000;
/*104*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*105*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*106*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*107*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*108*/	  r6.y = max(r6.y, 0.000000);
/*109*/	  r6.y = log2(r6.y);
/*110*/	  r6.y = r6.y * 10.000000;
/*111*/	  r6.y = exp2(r6.y);
/*112*/	  r6.y = r6.w * r6.y;
/*113*/	  r6.y = r6.y * r7.x + r0.w;
/*114*/	  r8.x = r2.w * 8.000000;
/*115*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*116*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*117*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*118*/	}
/*119*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*120*/	r1.y = max(r1.x, 0.000000);
/*121*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*122*/	if(floatBitsToUint(r1.x) != 0u) {
/*123*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*124*/	  r1.x = max(r1.x, -1.000000);
/*125*/	  r1.x = min(r1.x, 1.000000);
/*126*/	  r1.z = -abs(r1.x) + 1.000000;
/*127*/	  r1.z = sqrt(r1.z);
/*128*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*129*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*130*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*131*/	  r5.z = r1.z * r5.y;
/*132*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*133*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*134*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*135*/	  r1.x = r5.y * r1.z + r1.x;
/*136*/	  r1.z = r3.x * r3.x;
/*137*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*138*/	  r1.z = r1.z * r3.x + r6.x;
/*139*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*140*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*141*/	  r3.x = -r1.z * r1.z + 1.000000;
/*142*/	  r3.x = max(r3.x, 0.001000);
/*143*/	  r3.x = log2(r3.x);
/*144*/	  r5.x = r3.x * 4.950617;
/*145*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*146*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*147*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*148*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*149*/	  r1.z = floatBitsToInt(r1.z);
/*150*/	  r5.x = r3.x * r3.x + -r5.x;
/*151*/	  r5.x = sqrt(r5.x);
/*152*/	  r3.x = -r3.x + r5.x;
/*153*/	  r3.x = max(r3.x, 0.000000);
/*154*/	  r3.x = sqrt(r3.x);
/*155*/	  r1.z = r1.z * r3.x;
/*156*/	  r1.z = r1.z * 1.414214;
/*157*/	  r1.z = 0.008727 / r1.z;
/*158*/	  r1.z = max(r1.z, 0.000100);
/*159*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*160*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*161*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*162*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*163*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*164*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*165*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*166*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*167*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*168*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*169*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*170*/	  r1.x = floatBitsToInt(r1.x);
/*171*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*172*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*173*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*174*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*175*/	  r1.x = r1.x * r5.x + 1.000000;
/*176*/	  r1.x = r1.x * 0.500000;
/*177*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*178*/	  r1.z = r1.z * r5.y + 1.000000;
/*179*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*180*/	  r1.z = min(r1.y, 1.000000);
/*181*/	  r2.w = r2.w * 1.570796;
/*182*/	  r2.w = sin(r2.w);
/*183*/	  r1.z = r1.z + -1.000000;
/*184*/	  r1.z = r2.w * r1.z + 1.000000;
/*185*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*186*/	  r2.w = max(r2.w, 0.000000);
/*187*/	  r2.w = log2(r2.w);
/*188*/	  r2.w = r2.w * 10.000000;
/*189*/	  r2.w = exp2(r2.w);
/*190*/	  r2.w = r6.w * r2.w;
/*191*/	  r2.w = r2.w * r7.x + r0.w;
/*192*/	  r1.x = r1.z * abs(r1.x);
/*193*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*194*/	} else {
/*195*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*196*/	}
/*197*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*198*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*199*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*200*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*201*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*202*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*203*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*204*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*205*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*206*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*207*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*208*/	r2.w = 1.000000;
/*209*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*210*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*211*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*212*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*213*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*214*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*215*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*216*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*217*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*218*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*219*/	if(r0.w != 0) discard;
/*220*/	r0.w = sqrt(r1.w);
/*221*/	r1.x = saturate(cb3.data[0].w)/**/;
/*222*/	r1.x = -r1.x + 1.000000;
/*223*/	r1.x = r1.x * 8.000000 + -4.000000;
/*224*/	r1.y = saturate(cb3.data[1].x)/**/;
/*225*/	r1.y = -r1.y + 1.000000;
/*226*/	r1.y = r1.y * 1000.000000;
/*227*/	r0.w = r0.w / r1.y;
/*228*/	r0.w = r0.w + r1.x;
/*229*/	r0.w = r0.w * 1.442695;
/*230*/	r0.w = exp2(r0.w);
/*231*/	r0.w = cb3.data[1].y / r0.w;
/*232*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*233*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*234*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*235*/	r1.x = r1.x + -cb3.data[1].z;
/*236*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*237*/	r1.x = saturate(r1.y * r1.x);
/*238*/	r1.y = r1.x * -2.000000 + 3.000000;
/*239*/	r1.x = r1.x * r1.x;
/*240*/	r1.x = r1.x * r1.y;
/*241*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*242*/	r1.y = sqrt(r1.y);
/*243*/	r1.z = max(cb3.data[2].z, 0.001000);
/*244*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*245*/	r1.y = r1.z * r1.y;
/*246*/	r1.y = min(r1.y, 1.000000);
/*247*/	r1.z = r1.y * -2.000000 + 3.000000;
/*248*/	r1.y = r1.y * r1.y;
/*249*/	r1.y = r1.y * r1.z;
/*250*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*251*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*252*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*253*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*254*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*255*/	r4.w = max(r4.y, 0.000000);
/*256*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*257*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*258*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*259*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*260*/	r0.w = saturate(r0.w * r1.y);
/*261*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*262*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*263*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*264*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*265*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*266*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*267*/	color0.w = 1.000000;
/*268*/	return;
}
