//
//
// Shader Model 4
// Fragment Shader
//
// id: 1634 - fxc/glsl_SM_4_0_weighted.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform samplerCube s_environment;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;

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
/*11*/	r0.w = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*14*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*15*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*16*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*17*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*18*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*19*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*20*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*21*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*22*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*23*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*24*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*25*/	r2.z = inversesqrt(r2.z);
/*26*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*27*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*28*/	r2.z = inversesqrt(r2.z);
/*29*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*30*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*31*/	r2.z = inversesqrt(r2.z);
/*32*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*33*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*34*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*35*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*36*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*37*/	r0.w = inversesqrt(r0.w);
/*38*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*39*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*40*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*41*/	r0.w = inversesqrt(r0.w);
/*42*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*43*/	r0.w = -r3.x + 1.000000;
/*44*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*45*/	r4.x = dot(vec3(r3.yzwy), vec3(r2.xyzx));
/*46*/	r4.x = r4.x + r4.x;
/*47*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*48*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*49*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*50*/	r4.w = cos((r6.x));
/*51*/	r4.w = inversesqrt(r4.w);
/*52*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*53*/	r5.w = saturate(r1.w * 60.000000);
/*54*/	r5.w = -r1.w + r5.w;
/*55*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*56*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*57*/	r7.x = inversesqrt(r7.x);
/*58*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*59*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*60*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*61*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*62*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*63*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*64*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*65*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*66*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*67*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*68*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*69*/	r5.y = -r1.w + 1.000000;
/*70*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*71*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*72*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*73*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*74*/	  r5.y = max(r5.y, 0.000000);
/*75*/	  r5.y = log2(r5.y);
/*76*/	  r5.y = r5.y * 10.000000;
/*77*/	  r5.y = exp2(r5.y);
/*78*/	  r5.y = r4.w * r5.y;
/*79*/	  r5.y = r5.y * r5.w + r1.w;
/*80*/	  r7.x = r0.w * 8.000000;
/*81*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*82*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*83*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*84*/	}
/*85*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*86*/	r7.x = max(r5.y, 0.000000);
/*87*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*88*/	if(floatBitsToUint(r5.y) != 0u) {
/*89*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*90*/	  r4.x = max(r4.x, -1.000000);
/*91*/	  r4.x = min(r4.x, 1.000000);
/*92*/	  r4.y = -abs(r4.x) + 1.000000;
/*93*/	  r4.y = sqrt(r4.y);
/*94*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*95*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*96*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*97*/	  r5.y = r4.y * r4.z;
/*98*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*99*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*100*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*101*/	  r4.x = r4.z * r4.y + r4.x;
/*102*/	  r3.x = r3.x * r3.x;
/*103*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*104*/	  r2.w = r3.x * r2.w + r5.x;
/*105*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*106*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*107*/	  r3.x = -r2.w * r2.w + 1.000000;
/*108*/	  r3.x = max(r3.x, 0.001000);
/*109*/	  r3.x = log2(r3.x);
/*110*/	  r4.y = r3.x * 4.950617;
/*111*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*112*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*113*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*114*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*115*/	  r2.w = floatBitsToInt(r2.w);
/*116*/	  r4.y = r3.x * r3.x + -r4.y;
/*117*/	  r4.y = sqrt(r4.y);
/*118*/	  r3.x = -r3.x + r4.y;
/*119*/	  r3.x = max(r3.x, 0.000000);
/*120*/	  r3.x = sqrt(r3.x);
/*121*/	  r2.w = r2.w * r3.x;
/*122*/	  r2.w = r2.w * 1.414214;
/*123*/	  r2.w = 0.008727 / r2.w;
/*124*/	  r2.w = max(r2.w, 0.000100);
/*125*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*126*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*127*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*128*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*129*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*130*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*131*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*132*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*133*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*134*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*135*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*136*/	  r2.w = floatBitsToInt(r2.w);
/*137*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*138*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*139*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*140*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*141*/	  r2.w = r2.w * r4.x + 1.000000;
/*142*/	  r2.w = r2.w * 0.500000;
/*143*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*144*/	  r3.x = r3.x * r4.y + 1.000000;
/*145*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*146*/	  r3.x = min(r7.x, 1.000000);
/*147*/	  r0.w = r0.w * 1.570796;
/*148*/	  r0.w = sin(r0.w);
/*149*/	  r3.x = r3.x + -1.000000;
/*150*/	  r0.w = r0.w * r3.x + 1.000000;
/*151*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*152*/	  r3.x = max(r3.x, 0.000000);
/*153*/	  r3.x = log2(r3.x);
/*154*/	  r3.x = r3.x * 10.000000;
/*155*/	  r3.x = exp2(r3.x);
/*156*/	  r3.x = r4.w * r3.x;
/*157*/	  r3.x = r3.x * r5.w + r1.w;
/*158*/	  r0.w = r0.w * abs(r2.w);
/*159*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*160*/	} else {
/*161*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*162*/	}
/*163*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*164*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*165*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*166*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*167*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*168*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*169*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*170*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*171*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*172*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*173*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*174*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*175*/	r0.w = inversesqrt(r0.w);
/*176*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*177*/	r0.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*178*/	r0.w = r0.w + r0.w;
/*179*/	r2.xyz = (r2.xyzx * -r0.wwww + -r3.xyzx).xyz;
/*180*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*181*/	r0.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*182*/	r0.w = max(r0.w, 0.000000);
/*183*/	r0.w = log2(r0.w);
/*184*/	r0.w = r0.w * 10.000000;
/*185*/	r0.w = exp2(r0.w);
/*186*/	r0.w = r4.w * r0.w;
/*187*/	r0.w = r0.w * r5.w + r1.w;
/*188*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*189*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*190*/	color0.w = 2.000000;
/*191*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*192*/	r0.w = 1.000000;
/*193*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*194*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*195*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*196*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*197*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*198*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*199*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*200*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*201*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*202*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*203*/	if(r0.x != 0) discard;
/*204*/	color1.x = 1.000000;
/*205*/	return;
}
