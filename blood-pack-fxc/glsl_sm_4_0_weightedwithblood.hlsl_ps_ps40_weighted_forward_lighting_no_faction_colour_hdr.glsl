//
//
// Shader Model 4
// Fragment Shader
//
// id: 2612 - fxc/glsl_SM_4_0_weightedwithblood.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_decal_blood_map;
uniform samplerCube s_environment;

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
/*14*/	r1.zw = (r1.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
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
/*63*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*64*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*65*/	r0.w = inversesqrt(r0.w);
/*66*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*67*/	r0.w = -r3.x + 1.000000;
/*68*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*69*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xywx));
/*70*/	r4.x = r4.x + r4.x;
/*71*/	r4.xyz = (r1.xywx * -r4.xxxx + r3.yzwy).xyz;
/*72*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*73*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*74*/	r4.w = cos((r6.x));
/*75*/	r4.w = inversesqrt(r4.w);
/*76*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*77*/	r5.w = saturate(r1.z * 60.000000);
/*78*/	r5.w = -r1.z + r5.w;
/*79*/	r6.xzw = (r1.xxyw * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*80*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*81*/	r7.x = inversesqrt(r7.x);
/*82*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*83*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*84*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*85*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*86*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*87*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*88*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*89*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*90*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*91*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*92*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*93*/	r5.y = -r1.z + 1.000000;
/*94*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*95*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*96*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*97*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*98*/	  r5.y = max(r5.y, 0.000000);
/*99*/	  r5.y = log2(r5.y);
/*100*/	  r5.y = r5.y * 10.000000;
/*101*/	  r5.y = exp2(r5.y);
/*102*/	  r5.y = r4.w * r5.y;
/*103*/	  r5.y = r5.y * r5.w + r1.z;
/*104*/	  r7.x = r0.w * 8.000000;
/*105*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*106*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*107*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*108*/	}
/*109*/	r5.y = dot(vec3(r1.xywx), vec3(-cb1.data[0].yzwy));
/*110*/	r7.x = max(r5.y, 0.000000);
/*111*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*112*/	if(floatBitsToUint(r5.y) != 0u) {
/*113*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*114*/	  r4.x = max(r4.x, -1.000000);
/*115*/	  r4.x = min(r4.x, 1.000000);
/*116*/	  r4.y = -abs(r4.x) + 1.000000;
/*117*/	  r4.y = sqrt(r4.y);
/*118*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*119*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*120*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*121*/	  r5.y = r4.y * r4.z;
/*122*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*123*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*124*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*125*/	  r4.x = r4.z * r4.y + r4.x;
/*126*/	  r3.x = r3.x * r3.x;
/*127*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*128*/	  r2.w = r3.x * r2.w + r5.x;
/*129*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*130*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*131*/	  r3.x = -r2.w * r2.w + 1.000000;
/*132*/	  r3.x = max(r3.x, 0.001000);
/*133*/	  r3.x = log2(r3.x);
/*134*/	  r4.y = r3.x * 4.950617;
/*135*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*136*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*137*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*138*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*139*/	  r2.w = floatBitsToInt(r2.w);
/*140*/	  r4.y = r3.x * r3.x + -r4.y;
/*141*/	  r4.y = sqrt(r4.y);
/*142*/	  r3.x = -r3.x + r4.y;
/*143*/	  r3.x = max(r3.x, 0.000000);
/*144*/	  r3.x = sqrt(r3.x);
/*145*/	  r2.w = r2.w * r3.x;
/*146*/	  r2.w = r2.w * 1.414214;
/*147*/	  r2.w = 0.008727 / r2.w;
/*148*/	  r2.w = max(r2.w, 0.000100);
/*149*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*150*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*151*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*152*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*153*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*154*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*155*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*156*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*157*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*158*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*159*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*160*/	  r2.w = floatBitsToInt(r2.w);
/*161*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*162*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*163*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*164*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*165*/	  r2.w = r2.w * r4.x + 1.000000;
/*166*/	  r2.w = r2.w * 0.500000;
/*167*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*168*/	  r3.x = r3.x * r4.y + 1.000000;
/*169*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*170*/	  r3.x = min(r7.x, 1.000000);
/*171*/	  r0.w = r0.w * 1.570796;
/*172*/	  r0.w = sin(r0.w);
/*173*/	  r3.x = r3.x + -1.000000;
/*174*/	  r0.w = r0.w * r3.x + 1.000000;
/*175*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*176*/	  r3.x = max(r3.x, 0.000000);
/*177*/	  r3.x = log2(r3.x);
/*178*/	  r3.x = r3.x * 10.000000;
/*179*/	  r3.x = exp2(r3.x);
/*180*/	  r3.x = r4.w * r3.x;
/*181*/	  r3.x = r3.x * r5.w + r1.z;
/*182*/	  r0.w = r0.w * abs(r2.w);
/*183*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*184*/	} else {
/*185*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*186*/	}
/*187*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*188*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*189*/	r3.xyz = (max(r1.zzzz, r3.xyzx)).xyz;
/*190*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*191*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*192*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*193*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*194*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*195*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*196*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*197*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*198*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*199*/	r0.w = inversesqrt(r0.w);
/*200*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*201*/	r0.w = dot(vec3(-r3.xyzx), vec3(r1.xywx));
/*202*/	r0.w = r0.w + r0.w;
/*203*/	r1.xyw = (r1.xyxw * -r0.wwww + -r3.xyxz).xyw;
/*204*/	r6.xyzw = (textureLod(s_environment, r1.xywx.stp, r6.y)).xyzw;
/*205*/	r0.w = dot(vec3(r1.xywx), vec3(-r3.xyzx));
/*206*/	r0.w = max(r0.w, 0.000000);
/*207*/	r0.w = log2(r0.w);
/*208*/	r0.w = r0.w * 10.000000;
/*209*/	r0.w = exp2(r0.w);
/*210*/	r0.w = r4.w * r0.w;
/*211*/	r0.w = r0.w * r5.w + r1.z;
/*212*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*213*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*214*/	color0.w = 2.000000;
/*215*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*216*/	r0.w = 1.000000;
/*217*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*218*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*219*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*220*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*221*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*222*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*223*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*224*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*225*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*226*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*227*/	if(r0.x != 0) discard;
/*228*/	color1.x = 1.000000;
/*229*/	return;
}
