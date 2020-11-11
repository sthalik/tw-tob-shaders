//
//
// Shader Model 4
// Fragment Shader
//
// id: 3032 - fxc/glsl_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;

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
/*42*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r3.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*44*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*45*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*46*/	r0.w = r4.w * r5.w;
/*47*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*48*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*49*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*50*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*51*/	r1.w = inversesqrt(r1.w);
/*52*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*53*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*54*/	if(r1.w != 0) discard;
/*55*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*56*/	r3.zw = (r3.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*57*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*58*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*59*/	r1.w = saturate(-r1.w + r4.w);
/*60*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*61*/	if(floatBitsToUint(r1.w) != 0u) {
/*62*/	  r1.w = -r4.w + 1.000000;
/*63*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*64*/	  r1.w = -r1.w + 1.000000;
/*65*/	  r1.w = -r1.w * r1.w + 1.000000;
/*66*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*67*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*68*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*69*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*70*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*71*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*72*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*73*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*74*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*75*/	} else {
/*76*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*77*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*78*/	}
/*79*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*80*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*81*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*82*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*83*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*84*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*85*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*86*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*87*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*88*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*89*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*90*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*93*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*94*/	r1.w = inversesqrt(r1.w);
/*95*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*96*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*97*/	r1.w = inversesqrt(r1.w);
/*98*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*99*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*100*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*101*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*102*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*103*/	r1.w = inversesqrt(r1.w);
/*104*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*105*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*106*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*107*/	r1.w = inversesqrt(r1.w);
/*108*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*109*/	r1.w = -r3.y + 1.000000;
/*110*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*111*/	r4.x = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*112*/	r4.x = r4.x + r4.x;
/*113*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*114*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*115*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*116*/	r4.w = cos((r6.x));
/*117*/	r4.w = inversesqrt(r4.w);
/*118*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*119*/	r5.w = saturate(r0.w * 60.000000);
/*120*/	r5.w = -r0.w + r5.w;
/*121*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*122*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*123*/	r7.x = inversesqrt(r7.x);
/*124*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*125*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*126*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*127*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*128*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*129*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*130*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*131*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*132*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*133*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*134*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*135*/	r5.y = -r0.w + 1.000000;
/*136*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*137*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*138*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*139*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*140*/	  r5.y = max(r5.y, 0.000000);
/*141*/	  r5.y = log2(r5.y);
/*142*/	  r5.y = r5.y * 10.000000;
/*143*/	  r5.y = exp2(r5.y);
/*144*/	  r5.y = r4.w * r5.y;
/*145*/	  r5.y = r5.y * r5.w + r0.w;
/*146*/	  r7.x = r1.w * 8.000000;
/*147*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*148*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*149*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*150*/	}
/*151*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*152*/	r7.x = max(r5.y, 0.000000);
/*153*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*154*/	if(floatBitsToUint(r5.y) != 0u) {
/*155*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*156*/	  r4.x = max(r4.x, -1.000000);
/*157*/	  r4.x = min(r4.x, 1.000000);
/*158*/	  r4.y = -abs(r4.x) + 1.000000;
/*159*/	  r4.y = sqrt(r4.y);
/*160*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*161*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*162*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*163*/	  r5.y = r4.y * r4.z;
/*164*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*165*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*166*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*167*/	  r4.x = r4.z * r4.y + r4.x;
/*168*/	  r3.y = r3.y * r3.y;
/*169*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*170*/	  r2.w = r3.y * r2.w + r5.x;
/*171*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*172*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*173*/	  r3.y = -r2.w * r2.w + 1.000000;
/*174*/	  r3.y = max(r3.y, 0.001000);
/*175*/	  r3.y = log2(r3.y);
/*176*/	  r4.y = r3.y * 4.950617;
/*177*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*178*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*179*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*180*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*181*/	  r2.w = floatBitsToInt(r2.w);
/*182*/	  r4.y = r3.y * r3.y + -r4.y;
/*183*/	  r4.y = sqrt(r4.y);
/*184*/	  r3.y = -r3.y + r4.y;
/*185*/	  r3.y = max(r3.y, 0.000000);
/*186*/	  r3.y = sqrt(r3.y);
/*187*/	  r2.w = r2.w * r3.y;
/*188*/	  r2.w = r2.w * 1.414214;
/*189*/	  r2.w = 0.008727 / r2.w;
/*190*/	  r2.w = max(r2.w, 0.000100);
/*191*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*192*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*193*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*194*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*195*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*196*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*197*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*198*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*199*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*200*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*201*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*202*/	  r2.w = floatBitsToInt(r2.w);
/*203*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*204*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*205*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*206*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*207*/	  r2.w = r2.w * r4.x + 1.000000;
/*208*/	  r2.w = r2.w * 0.500000;
/*209*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*210*/	  r3.y = r3.y * r4.y + 1.000000;
/*211*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*212*/	  r3.y = min(r7.x, 1.000000);
/*213*/	  r1.w = r1.w * 1.570796;
/*214*/	  r1.w = sin(r1.w);
/*215*/	  r3.y = r3.y + -1.000000;
/*216*/	  r1.w = r1.w * r3.y + 1.000000;
/*217*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*218*/	  r3.x = max(r3.x, 0.000000);
/*219*/	  r3.x = log2(r3.x);
/*220*/	  r3.x = r3.x * 10.000000;
/*221*/	  r3.x = exp2(r3.x);
/*222*/	  r3.x = r4.w * r3.x;
/*223*/	  r3.x = r3.x * r5.w + r0.w;
/*224*/	  r1.w = r1.w * abs(r2.w);
/*225*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*226*/	} else {
/*227*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*228*/	}
/*229*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*230*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*231*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*232*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*233*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*234*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*235*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*236*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*237*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*238*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*239*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*240*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*241*/	r1.w = inversesqrt(r1.w);
/*242*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*243*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*244*/	r1.w = r1.w + r1.w;
/*245*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*246*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*247*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*248*/	r1.w = max(r1.w, 0.000000);
/*249*/	r1.w = log2(r1.w);
/*250*/	r1.w = r1.w * 10.000000;
/*251*/	r1.w = exp2(r1.w);
/*252*/	r1.w = r4.w * r1.w;
/*253*/	r0.w = r1.w * r5.w + r0.w;
/*254*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*255*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*256*/	color0.w = 2.000000;
/*257*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*258*/	r0.w = 1.000000;
/*259*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*260*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*261*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*262*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*263*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*264*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*265*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*266*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*267*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*268*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*269*/	if(r0.x != 0) discard;
/*270*/	color1.x = 1.000000;
/*271*/	return;
}
