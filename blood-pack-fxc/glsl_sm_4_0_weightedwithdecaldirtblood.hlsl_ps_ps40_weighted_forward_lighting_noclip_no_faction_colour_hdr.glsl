//
//
// Shader Model 4
// Fragment Shader
//
// id: 3034 - fxc/glsl_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r2.z = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r3.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*11*/	r4.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*12*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*13*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*14*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*18*/	r4.z = vsOut_T6.z;
/*19*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*20*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*21*/	if(floatBitsToUint(r0.w) != 0u) {
/*22*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*23*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*25*/	  r0.w = -r0.w + 1.000000;
/*26*/	  r0.w = max(r0.w, 0.000000);
/*27*/	  r4.z = sqrt(r0.w);
/*28*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*30*/	  r0.w = r3.x * r7.w;
/*31*/	  r3.x = r0.w * -0.500000 + r3.x;
/*32*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*33*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*34*/	  r0.w = -r5.w * r6.w + 1.000000;
/*35*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*36*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*37*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*38*/	}
/*39*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*40*/	r3.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*41*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*42*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*43*/	r0.w = r4.w * r5.w;
/*44*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*45*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*46*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*47*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*50*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*51*/	if(r1.w != 0) discard;
/*52*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*53*/	r3.zw = (r3.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*54*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*55*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*56*/	r1.w = saturate(-r1.w + r4.w);
/*57*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*58*/	if(floatBitsToUint(r1.w) != 0u) {
/*59*/	  r1.w = -r4.w + 1.000000;
/*60*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*61*/	  r1.w = -r1.w + 1.000000;
/*62*/	  r1.w = -r1.w * r1.w + 1.000000;
/*63*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*64*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*65*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*66*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*67*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*68*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*69*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*70*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*71*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*72*/	} else {
/*73*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*74*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*75*/	}
/*76*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*78*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*79*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*80*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*81*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*82*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*83*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*84*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*85*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*86*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*87*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*88*/	r1.w = inversesqrt(r1.w);
/*89*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*90*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*93*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*94*/	r1.w = inversesqrt(r1.w);
/*95*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*96*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*97*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*98*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*99*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*100*/	r1.w = inversesqrt(r1.w);
/*101*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*102*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*103*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*104*/	r1.w = inversesqrt(r1.w);
/*105*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*106*/	r1.w = -r3.y + 1.000000;
/*107*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*108*/	r4.x = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*109*/	r4.x = r4.x + r4.x;
/*110*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*111*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*112*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*113*/	r4.w = cos((r6.x));
/*114*/	r4.w = inversesqrt(r4.w);
/*115*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*116*/	r5.w = saturate(r0.w * 60.000000);
/*117*/	r5.w = -r0.w + r5.w;
/*118*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*119*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*120*/	r7.x = inversesqrt(r7.x);
/*121*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*122*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*123*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*124*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*125*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*126*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*127*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*128*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*129*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*130*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*131*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*132*/	r5.y = -r0.w + 1.000000;
/*133*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*134*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*135*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*136*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*137*/	  r5.y = max(r5.y, 0.000000);
/*138*/	  r5.y = log2(r5.y);
/*139*/	  r5.y = r5.y * 10.000000;
/*140*/	  r5.y = exp2(r5.y);
/*141*/	  r5.y = r4.w * r5.y;
/*142*/	  r5.y = r5.y * r5.w + r0.w;
/*143*/	  r7.x = r1.w * 8.000000;
/*144*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*145*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*146*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*147*/	}
/*148*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*149*/	r7.x = max(r5.y, 0.000000);
/*150*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*151*/	if(floatBitsToUint(r5.y) != 0u) {
/*152*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*153*/	  r4.x = max(r4.x, -1.000000);
/*154*/	  r4.x = min(r4.x, 1.000000);
/*155*/	  r4.y = -abs(r4.x) + 1.000000;
/*156*/	  r4.y = sqrt(r4.y);
/*157*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*158*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*159*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*160*/	  r5.y = r4.y * r4.z;
/*161*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*162*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*163*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*164*/	  r4.x = r4.z * r4.y + r4.x;
/*165*/	  r3.y = r3.y * r3.y;
/*166*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*167*/	  r2.w = r3.y * r2.w + r5.x;
/*168*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*169*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*170*/	  r3.y = -r2.w * r2.w + 1.000000;
/*171*/	  r3.y = max(r3.y, 0.001000);
/*172*/	  r3.y = log2(r3.y);
/*173*/	  r4.y = r3.y * 4.950617;
/*174*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*175*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*176*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*177*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*178*/	  r2.w = floatBitsToInt(r2.w);
/*179*/	  r4.y = r3.y * r3.y + -r4.y;
/*180*/	  r4.y = sqrt(r4.y);
/*181*/	  r3.y = -r3.y + r4.y;
/*182*/	  r3.y = max(r3.y, 0.000000);
/*183*/	  r3.y = sqrt(r3.y);
/*184*/	  r2.w = r2.w * r3.y;
/*185*/	  r2.w = r2.w * 1.414214;
/*186*/	  r2.w = 0.008727 / r2.w;
/*187*/	  r2.w = max(r2.w, 0.000100);
/*188*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*189*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*190*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*191*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*192*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*193*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*194*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*195*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*196*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*197*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*198*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*199*/	  r2.w = floatBitsToInt(r2.w);
/*200*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*201*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*202*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*203*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*204*/	  r2.w = r2.w * r4.x + 1.000000;
/*205*/	  r2.w = r2.w * 0.500000;
/*206*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*207*/	  r3.y = r3.y * r4.y + 1.000000;
/*208*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*209*/	  r3.y = min(r7.x, 1.000000);
/*210*/	  r1.w = r1.w * 1.570796;
/*211*/	  r1.w = sin(r1.w);
/*212*/	  r3.y = r3.y + -1.000000;
/*213*/	  r1.w = r1.w * r3.y + 1.000000;
/*214*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*215*/	  r3.x = max(r3.x, 0.000000);
/*216*/	  r3.x = log2(r3.x);
/*217*/	  r3.x = r3.x * 10.000000;
/*218*/	  r3.x = exp2(r3.x);
/*219*/	  r3.x = r4.w * r3.x;
/*220*/	  r3.x = r3.x * r5.w + r0.w;
/*221*/	  r1.w = r1.w * abs(r2.w);
/*222*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*223*/	} else {
/*224*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*225*/	}
/*226*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*227*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*228*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*229*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*230*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*231*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*232*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*233*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*234*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*235*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*236*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*237*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*238*/	r1.w = inversesqrt(r1.w);
/*239*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*240*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*241*/	r1.w = r1.w + r1.w;
/*242*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*243*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*244*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*245*/	r1.w = max(r1.w, 0.000000);
/*246*/	r1.w = log2(r1.w);
/*247*/	r1.w = r1.w * 10.000000;
/*248*/	r1.w = exp2(r1.w);
/*249*/	r1.w = r4.w * r1.w;
/*250*/	r0.w = r1.w * r5.w + r0.w;
/*251*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*252*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*253*/	color0.w = 2.000000;
/*254*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*255*/	r0.w = 1.000000;
/*256*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*257*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*258*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*259*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*260*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*261*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*262*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*263*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*264*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*265*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*266*/	if(r0.x != 0) discard;
/*267*/	color1.x = 1.000000;
/*268*/	return;
}
