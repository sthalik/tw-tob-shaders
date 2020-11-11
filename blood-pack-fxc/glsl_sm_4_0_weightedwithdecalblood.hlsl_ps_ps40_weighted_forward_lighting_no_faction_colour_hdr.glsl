//
//
// Shader Model 4
// Fragment Shader
//
// id: 2889 - fxc/glsl_SM_4_0_weightedwithdecalblood.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
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
/*11*/	r2.z = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*13*/	r3.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*15*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*16*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*17*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*20*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*21*/	r4.z = vsOut_T6.z;
/*22*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*23*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*24*/	if(floatBitsToUint(r0.w) != 0u) {
/*25*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*26*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*27*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*28*/	  r0.w = -r0.w + 1.000000;
/*29*/	  r0.w = max(r0.w, 0.000000);
/*30*/	  r4.z = sqrt(r0.w);
/*31*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*33*/	  r0.w = r3.x * r7.w;
/*34*/	  r3.x = r0.w * -0.500000 + r3.x;
/*35*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*36*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*37*/	  r0.w = -r5.w * r6.w + 1.000000;
/*38*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*39*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*40*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*41*/	}
/*42*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*43*/	if(r0.w != 0) discard;
/*44*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*45*/	r3.zw = (r3.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*46*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*47*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*48*/	r0.w = saturate(-r0.w + r4.w);
/*49*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*50*/	if(floatBitsToUint(r0.w) != 0u) {
/*51*/	  r0.w = -r4.w + 1.000000;
/*52*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*53*/	  r0.w = -r0.w + 1.000000;
/*54*/	  r0.w = -r0.w * r0.w + 1.000000;
/*55*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*56*/	  r4.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*57*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*58*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*59*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*60*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*61*/	  r0.xyz = (r0.wwww * r5.xyzx + r4.xyzx).xyz;
/*62*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*63*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*64*/	}
/*65*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*67*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*68*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*70*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*71*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*72*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*73*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*74*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*75*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*76*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*79*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*82*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*85*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*86*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*87*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*88*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*89*/	r1.w = inversesqrt(r1.w);
/*90*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*91*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*92*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*95*/	r1.w = -r3.y + 1.000000;
/*96*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*97*/	r4.x = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*98*/	r4.x = r4.x + r4.x;
/*99*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*100*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*101*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*102*/	r4.w = cos((r6.x));
/*103*/	r4.w = inversesqrt(r4.w);
/*104*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*105*/	r5.w = saturate(r0.w * 60.000000);
/*106*/	r5.w = -r0.w + r5.w;
/*107*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*108*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*109*/	r7.x = inversesqrt(r7.x);
/*110*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*111*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*112*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*113*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*114*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*115*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*116*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*117*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*118*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*119*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*120*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*121*/	r5.y = -r0.w + 1.000000;
/*122*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*123*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*124*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*125*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*126*/	  r5.y = max(r5.y, 0.000000);
/*127*/	  r5.y = log2(r5.y);
/*128*/	  r5.y = r5.y * 10.000000;
/*129*/	  r5.y = exp2(r5.y);
/*130*/	  r5.y = r4.w * r5.y;
/*131*/	  r5.y = r5.y * r5.w + r0.w;
/*132*/	  r7.x = r1.w * 8.000000;
/*133*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*134*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*135*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*136*/	}
/*137*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*138*/	r7.x = max(r5.y, 0.000000);
/*139*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*140*/	if(floatBitsToUint(r5.y) != 0u) {
/*141*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*142*/	  r4.x = max(r4.x, -1.000000);
/*143*/	  r4.x = min(r4.x, 1.000000);
/*144*/	  r4.y = -abs(r4.x) + 1.000000;
/*145*/	  r4.y = sqrt(r4.y);
/*146*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*147*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*148*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*149*/	  r5.y = r4.y * r4.z;
/*150*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*151*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*152*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*153*/	  r4.x = r4.z * r4.y + r4.x;
/*154*/	  r3.y = r3.y * r3.y;
/*155*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*156*/	  r2.w = r3.y * r2.w + r5.x;
/*157*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*158*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*159*/	  r3.y = -r2.w * r2.w + 1.000000;
/*160*/	  r3.y = max(r3.y, 0.001000);
/*161*/	  r3.y = log2(r3.y);
/*162*/	  r4.y = r3.y * 4.950617;
/*163*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*164*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*165*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*166*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*167*/	  r2.w = floatBitsToInt(r2.w);
/*168*/	  r4.y = r3.y * r3.y + -r4.y;
/*169*/	  r4.y = sqrt(r4.y);
/*170*/	  r3.y = -r3.y + r4.y;
/*171*/	  r3.y = max(r3.y, 0.000000);
/*172*/	  r3.y = sqrt(r3.y);
/*173*/	  r2.w = r2.w * r3.y;
/*174*/	  r2.w = r2.w * 1.414214;
/*175*/	  r2.w = 0.008727 / r2.w;
/*176*/	  r2.w = max(r2.w, 0.000100);
/*177*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*178*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*179*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*180*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*181*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*182*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*183*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*184*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*185*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*186*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*187*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*188*/	  r2.w = floatBitsToInt(r2.w);
/*189*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*190*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*191*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*192*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*193*/	  r2.w = r2.w * r4.x + 1.000000;
/*194*/	  r2.w = r2.w * 0.500000;
/*195*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*196*/	  r3.y = r3.y * r4.y + 1.000000;
/*197*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*198*/	  r3.y = min(r7.x, 1.000000);
/*199*/	  r1.w = r1.w * 1.570796;
/*200*/	  r1.w = sin(r1.w);
/*201*/	  r3.y = r3.y + -1.000000;
/*202*/	  r1.w = r1.w * r3.y + 1.000000;
/*203*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*204*/	  r3.x = max(r3.x, 0.000000);
/*205*/	  r3.x = log2(r3.x);
/*206*/	  r3.x = r3.x * 10.000000;
/*207*/	  r3.x = exp2(r3.x);
/*208*/	  r3.x = r4.w * r3.x;
/*209*/	  r3.x = r3.x * r5.w + r0.w;
/*210*/	  r1.w = r1.w * abs(r2.w);
/*211*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*212*/	} else {
/*213*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*214*/	}
/*215*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*216*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*217*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*218*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*219*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*220*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*221*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*222*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*223*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*224*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*225*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*226*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*227*/	r1.w = inversesqrt(r1.w);
/*228*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*229*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*230*/	r1.w = r1.w + r1.w;
/*231*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*232*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*233*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*234*/	r1.w = max(r1.w, 0.000000);
/*235*/	r1.w = log2(r1.w);
/*236*/	r1.w = r1.w * 10.000000;
/*237*/	r1.w = exp2(r1.w);
/*238*/	r1.w = r4.w * r1.w;
/*239*/	r0.w = r1.w * r5.w + r0.w;
/*240*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*241*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*242*/	color0.w = 2.000000;
/*243*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*244*/	r0.w = 1.000000;
/*245*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*246*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*247*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*248*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*249*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*250*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*251*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*252*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*253*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*254*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*255*/	if(r0.x != 0) discard;
/*256*/	color1.x = 1.000000;
/*257*/	return;
}
