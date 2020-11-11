//
//
// Shader Model 4
// Fragment Shader
//
// id: 2614 - fxc/glsl_SM_4_0_weightedwithblood.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*11*/	r1.zw = (r1.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
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
/*60*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*61*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*64*/	r0.w = -r3.x + 1.000000;
/*65*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*66*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xywx));
/*67*/	r4.x = r4.x + r4.x;
/*68*/	r4.xyz = (r1.xywx * -r4.xxxx + r3.yzwy).xyz;
/*69*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*70*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*71*/	r4.w = cos((r6.x));
/*72*/	r4.w = inversesqrt(r4.w);
/*73*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*74*/	r5.w = saturate(r1.z * 60.000000);
/*75*/	r5.w = -r1.z + r5.w;
/*76*/	r6.xzw = (r1.xxyw * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*77*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*78*/	r7.x = inversesqrt(r7.x);
/*79*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*80*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*81*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*82*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*83*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*84*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*85*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*86*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*87*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*88*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*89*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*90*/	r5.y = -r1.z + 1.000000;
/*91*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*92*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*93*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*94*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*95*/	  r5.y = max(r5.y, 0.000000);
/*96*/	  r5.y = log2(r5.y);
/*97*/	  r5.y = r5.y * 10.000000;
/*98*/	  r5.y = exp2(r5.y);
/*99*/	  r5.y = r4.w * r5.y;
/*100*/	  r5.y = r5.y * r5.w + r1.z;
/*101*/	  r7.x = r0.w * 8.000000;
/*102*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*103*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*104*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*105*/	}
/*106*/	r5.y = dot(vec3(r1.xywx), vec3(-cb1.data[0].yzwy));
/*107*/	r7.x = max(r5.y, 0.000000);
/*108*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*109*/	if(floatBitsToUint(r5.y) != 0u) {
/*110*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*111*/	  r4.x = max(r4.x, -1.000000);
/*112*/	  r4.x = min(r4.x, 1.000000);
/*113*/	  r4.y = -abs(r4.x) + 1.000000;
/*114*/	  r4.y = sqrt(r4.y);
/*115*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*116*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*117*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*118*/	  r5.y = r4.y * r4.z;
/*119*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*120*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*121*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*122*/	  r4.x = r4.z * r4.y + r4.x;
/*123*/	  r3.x = r3.x * r3.x;
/*124*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*125*/	  r2.w = r3.x * r2.w + r5.x;
/*126*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*127*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*128*/	  r3.x = -r2.w * r2.w + 1.000000;
/*129*/	  r3.x = max(r3.x, 0.001000);
/*130*/	  r3.x = log2(r3.x);
/*131*/	  r4.y = r3.x * 4.950617;
/*132*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*133*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*134*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*135*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*136*/	  r2.w = floatBitsToInt(r2.w);
/*137*/	  r4.y = r3.x * r3.x + -r4.y;
/*138*/	  r4.y = sqrt(r4.y);
/*139*/	  r3.x = -r3.x + r4.y;
/*140*/	  r3.x = max(r3.x, 0.000000);
/*141*/	  r3.x = sqrt(r3.x);
/*142*/	  r2.w = r2.w * r3.x;
/*143*/	  r2.w = r2.w * 1.414214;
/*144*/	  r2.w = 0.008727 / r2.w;
/*145*/	  r2.w = max(r2.w, 0.000100);
/*146*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*147*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*148*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*149*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*150*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*151*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*152*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*153*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*154*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*155*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*156*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*157*/	  r2.w = floatBitsToInt(r2.w);
/*158*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*159*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*160*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*161*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*162*/	  r2.w = r2.w * r4.x + 1.000000;
/*163*/	  r2.w = r2.w * 0.500000;
/*164*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*165*/	  r3.x = r3.x * r4.y + 1.000000;
/*166*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*167*/	  r3.x = min(r7.x, 1.000000);
/*168*/	  r0.w = r0.w * 1.570796;
/*169*/	  r0.w = sin(r0.w);
/*170*/	  r3.x = r3.x + -1.000000;
/*171*/	  r0.w = r0.w * r3.x + 1.000000;
/*172*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*173*/	  r3.x = max(r3.x, 0.000000);
/*174*/	  r3.x = log2(r3.x);
/*175*/	  r3.x = r3.x * 10.000000;
/*176*/	  r3.x = exp2(r3.x);
/*177*/	  r3.x = r4.w * r3.x;
/*178*/	  r3.x = r3.x * r5.w + r1.z;
/*179*/	  r0.w = r0.w * abs(r2.w);
/*180*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*181*/	} else {
/*182*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*183*/	}
/*184*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*185*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*186*/	r3.xyz = (max(r1.zzzz, r3.xyzx)).xyz;
/*187*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*188*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*189*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*190*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*191*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*192*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*193*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*194*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*195*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*196*/	r0.w = inversesqrt(r0.w);
/*197*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*198*/	r0.w = dot(vec3(-r3.xyzx), vec3(r1.xywx));
/*199*/	r0.w = r0.w + r0.w;
/*200*/	r1.xyw = (r1.xyxw * -r0.wwww + -r3.xyxz).xyw;
/*201*/	r6.xyzw = (textureLod(s_environment, r1.xywx.stp, r6.y)).xyzw;
/*202*/	r0.w = dot(vec3(r1.xywx), vec3(-r3.xyzx));
/*203*/	r0.w = max(r0.w, 0.000000);
/*204*/	r0.w = log2(r0.w);
/*205*/	r0.w = r0.w * 10.000000;
/*206*/	r0.w = exp2(r0.w);
/*207*/	r0.w = r4.w * r0.w;
/*208*/	r0.w = r0.w * r5.w + r1.z;
/*209*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*210*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*211*/	color0.w = 2.000000;
/*212*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*213*/	r0.w = 1.000000;
/*214*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*215*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*216*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*217*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*218*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*219*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*220*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*221*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*222*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*223*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*224*/	if(r0.x != 0) discard;
/*225*/	color1.x = 1.000000;
/*226*/	return;
}
