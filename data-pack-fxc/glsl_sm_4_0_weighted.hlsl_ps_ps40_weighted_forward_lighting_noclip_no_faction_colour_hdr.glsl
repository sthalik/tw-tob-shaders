//
//
// Shader Model 4
// Fragment Shader
//
// id: 1636 - fxc/glsl_SM_4_0_weighted.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r0.w = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*11*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*12*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*13*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*14*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*15*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*16*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*17*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*18*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*19*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*20*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*21*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*22*/	r2.z = inversesqrt(r2.z);
/*23*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*24*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*25*/	r2.z = inversesqrt(r2.z);
/*26*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*27*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*28*/	r2.z = inversesqrt(r2.z);
/*29*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*30*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*31*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*32*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*33*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*34*/	r0.w = inversesqrt(r0.w);
/*35*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*36*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*37*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*38*/	r0.w = inversesqrt(r0.w);
/*39*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*40*/	r0.w = -r3.x + 1.000000;
/*41*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*42*/	r4.x = dot(vec3(r3.yzwy), vec3(r2.xyzx));
/*43*/	r4.x = r4.x + r4.x;
/*44*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*45*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*46*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*47*/	r4.w = cos((r6.x));
/*48*/	r4.w = inversesqrt(r4.w);
/*49*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*50*/	r5.w = saturate(r1.w * 60.000000);
/*51*/	r5.w = -r1.w + r5.w;
/*52*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*53*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*54*/	r7.x = inversesqrt(r7.x);
/*55*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*56*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*57*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*58*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*59*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*60*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*61*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*62*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*63*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*64*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*65*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*66*/	r5.y = -r1.w + 1.000000;
/*67*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*68*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*69*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*70*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*71*/	  r5.y = max(r5.y, 0.000000);
/*72*/	  r5.y = log2(r5.y);
/*73*/	  r5.y = r5.y * 10.000000;
/*74*/	  r5.y = exp2(r5.y);
/*75*/	  r5.y = r4.w * r5.y;
/*76*/	  r5.y = r5.y * r5.w + r1.w;
/*77*/	  r7.x = r0.w * 8.000000;
/*78*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*79*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*80*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*81*/	}
/*82*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*83*/	r7.x = max(r5.y, 0.000000);
/*84*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*85*/	if(floatBitsToUint(r5.y) != 0u) {
/*86*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*87*/	  r4.x = max(r4.x, -1.000000);
/*88*/	  r4.x = min(r4.x, 1.000000);
/*89*/	  r4.y = -abs(r4.x) + 1.000000;
/*90*/	  r4.y = sqrt(r4.y);
/*91*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*92*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*93*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*94*/	  r5.y = r4.y * r4.z;
/*95*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*96*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*97*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*98*/	  r4.x = r4.z * r4.y + r4.x;
/*99*/	  r3.x = r3.x * r3.x;
/*100*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*101*/	  r2.w = r3.x * r2.w + r5.x;
/*102*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*103*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*104*/	  r3.x = -r2.w * r2.w + 1.000000;
/*105*/	  r3.x = max(r3.x, 0.001000);
/*106*/	  r3.x = log2(r3.x);
/*107*/	  r4.y = r3.x * 4.950617;
/*108*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*109*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*110*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*111*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*112*/	  r2.w = floatBitsToInt(r2.w);
/*113*/	  r4.y = r3.x * r3.x + -r4.y;
/*114*/	  r4.y = sqrt(r4.y);
/*115*/	  r3.x = -r3.x + r4.y;
/*116*/	  r3.x = max(r3.x, 0.000000);
/*117*/	  r3.x = sqrt(r3.x);
/*118*/	  r2.w = r2.w * r3.x;
/*119*/	  r2.w = r2.w * 1.414214;
/*120*/	  r2.w = 0.008727 / r2.w;
/*121*/	  r2.w = max(r2.w, 0.000100);
/*122*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*123*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*124*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*125*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*126*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*127*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*128*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*129*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*130*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*131*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*132*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*133*/	  r2.w = floatBitsToInt(r2.w);
/*134*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*135*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*136*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*137*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*138*/	  r2.w = r2.w * r4.x + 1.000000;
/*139*/	  r2.w = r2.w * 0.500000;
/*140*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*141*/	  r3.x = r3.x * r4.y + 1.000000;
/*142*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*143*/	  r3.x = min(r7.x, 1.000000);
/*144*/	  r0.w = r0.w * 1.570796;
/*145*/	  r0.w = sin(r0.w);
/*146*/	  r3.x = r3.x + -1.000000;
/*147*/	  r0.w = r0.w * r3.x + 1.000000;
/*148*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*149*/	  r3.x = max(r3.x, 0.000000);
/*150*/	  r3.x = log2(r3.x);
/*151*/	  r3.x = r3.x * 10.000000;
/*152*/	  r3.x = exp2(r3.x);
/*153*/	  r3.x = r4.w * r3.x;
/*154*/	  r3.x = r3.x * r5.w + r1.w;
/*155*/	  r0.w = r0.w * abs(r2.w);
/*156*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*157*/	} else {
/*158*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*159*/	}
/*160*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*161*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*162*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*163*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*164*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*165*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*166*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*167*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*168*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*169*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*170*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*171*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*172*/	r0.w = inversesqrt(r0.w);
/*173*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*174*/	r0.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*175*/	r0.w = r0.w + r0.w;
/*176*/	r2.xyz = (r2.xyzx * -r0.wwww + -r3.xyzx).xyz;
/*177*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*178*/	r0.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*179*/	r0.w = max(r0.w, 0.000000);
/*180*/	r0.w = log2(r0.w);
/*181*/	r0.w = r0.w * 10.000000;
/*182*/	r0.w = exp2(r0.w);
/*183*/	r0.w = r4.w * r0.w;
/*184*/	r0.w = r0.w * r5.w + r1.w;
/*185*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*186*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*187*/	color0.w = 2.000000;
/*188*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*189*/	r0.w = 1.000000;
/*190*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*191*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*192*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*193*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*194*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*195*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*196*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*197*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*198*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*199*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*200*/	if(r0.x != 0) discard;
/*201*/	color1.x = 1.000000;
/*202*/	return;
}
