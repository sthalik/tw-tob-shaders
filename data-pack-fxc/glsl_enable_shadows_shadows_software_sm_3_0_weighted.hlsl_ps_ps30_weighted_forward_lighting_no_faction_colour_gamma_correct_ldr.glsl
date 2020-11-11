//
//
// Shader Model 4
// Fragment Shader
//
// id: 5690 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weighted.hlsl_PS_ps30_weighted_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
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
/*39*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*40*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*41*/	r2.w = inversesqrt(r0.w);
/*42*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*43*/	r2.w = -r3.x + 1.000000;
/*44*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*45*/	r5.y = dot(vec3(r3.yzwy), vec3(r2.xyzx));
/*46*/	r5.y = r5.y + r5.y;
/*47*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*48*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*49*/	r6.w = r2.w * 1.539380;
/*50*/	r6.w = cos((r6.w));
/*51*/	r6.w = inversesqrt(r6.w);
/*52*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*53*/	r7.x = saturate(r1.w * 60.000000);
/*54*/	r7.x = -r1.w + r7.x;
/*55*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*56*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*57*/	r8.x = inversesqrt(r8.x);
/*58*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*59*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*60*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*61*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*62*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*63*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*64*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*65*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*66*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*67*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*68*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*69*/	r6.y = -r1.w + 1.000000;
/*70*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*71*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*72*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*73*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*74*/	  r6.y = max(r6.y, 0.000000);
/*75*/	  r6.y = log2(r6.y);
/*76*/	  r6.y = r6.y * 10.000000;
/*77*/	  r6.y = exp2(r6.y);
/*78*/	  r6.y = r6.w * r6.y;
/*79*/	  r6.y = r6.y * r7.x + r1.w;
/*80*/	  r8.x = r2.w * 8.000000;
/*81*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*82*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*83*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*84*/	}
/*85*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*86*/	r2.y = max(r2.x, 0.000000);
/*87*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*88*/	if(floatBitsToUint(r2.x) != 0u) {
/*89*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*90*/	  r2.x = max(r2.x, -1.000000);
/*91*/	  r2.x = min(r2.x, 1.000000);
/*92*/	  r2.z = -abs(r2.x) + 1.000000;
/*93*/	  r2.z = sqrt(r2.z);
/*94*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*95*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*96*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*97*/	  r5.z = r2.z * r5.y;
/*98*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*99*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*100*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*101*/	  r2.x = r5.y * r2.z + r2.x;
/*102*/	  r2.z = r3.x * r3.x;
/*103*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*104*/	  r2.z = r2.z * r3.x + r6.x;
/*105*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*106*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*107*/	  r3.x = -r2.z * r2.z + 1.000000;
/*108*/	  r3.x = max(r3.x, 0.001000);
/*109*/	  r3.x = log2(r3.x);
/*110*/	  r5.x = r3.x * 4.950617;
/*111*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*112*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*113*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*114*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*115*/	  r2.z = floatBitsToInt(r2.z);
/*116*/	  r5.x = r3.x * r3.x + -r5.x;
/*117*/	  r5.x = sqrt(r5.x);
/*118*/	  r3.x = -r3.x + r5.x;
/*119*/	  r3.x = max(r3.x, 0.000000);
/*120*/	  r3.x = sqrt(r3.x);
/*121*/	  r2.z = r2.z * r3.x;
/*122*/	  r2.z = r2.z * 1.414214;
/*123*/	  r2.z = 0.008727 / r2.z;
/*124*/	  r2.z = max(r2.z, 0.000100);
/*125*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*126*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*127*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*128*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*129*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*130*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*131*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*132*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*133*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*134*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*135*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*136*/	  r2.x = floatBitsToInt(r2.x);
/*137*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*138*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*139*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*140*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*141*/	  r2.x = r2.x * r5.x + 1.000000;
/*142*/	  r2.x = r2.x * 0.500000;
/*143*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*144*/	  r2.z = r2.z * r5.y + 1.000000;
/*145*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*146*/	  r2.z = min(r2.y, 1.000000);
/*147*/	  r2.w = r2.w * 1.570796;
/*148*/	  r2.w = sin(r2.w);
/*149*/	  r2.z = r2.z + -1.000000;
/*150*/	  r2.z = r2.w * r2.z + 1.000000;
/*151*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*152*/	  r2.w = max(r2.w, 0.000000);
/*153*/	  r2.w = log2(r2.w);
/*154*/	  r2.w = r2.w * 10.000000;
/*155*/	  r2.w = exp2(r2.w);
/*156*/	  r2.w = r6.w * r2.w;
/*157*/	  r2.w = r2.w * r7.x + r1.w;
/*158*/	  r2.x = r2.z * abs(r2.x);
/*159*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*160*/	} else {
/*161*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*162*/	}
/*163*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*164*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*165*/	r2.xzw = (max(r1.wwww, r2.xxzw)).xzw;
/*166*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*167*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*168*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*169*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*170*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*171*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*172*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*173*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*174*/	r1.w = 1.000000;
/*175*/	r2.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*176*/	r2.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*177*/	r1.x = dot(r1.xyzw, cb1.data[12].xyzw);
/*178*/	r1.xy = (r2.xyxx / r1.xxxx).xy;
/*179*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*180*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*181*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*182*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r1.x));
/*183*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*184*/	r1.x = uintBitsToFloat(~floatBitsToUint(r1.x));
/*185*/	if(r1.x != 0) discard;
/*186*/	r0.w = sqrt(r0.w);
/*187*/	r1.x = saturate(cb3.data[0].w)/**/;
/*188*/	r1.x = -r1.x + 1.000000;
/*189*/	r1.x = r1.x * 8.000000 + -4.000000;
/*190*/	r1.y = saturate(cb3.data[1].x)/**/;
/*191*/	r1.y = -r1.y + 1.000000;
/*192*/	r1.y = r1.y * 1000.000000;
/*193*/	r0.w = r0.w / r1.y;
/*194*/	r0.w = r0.w + r1.x;
/*195*/	r0.w = r0.w * 1.442695;
/*196*/	r0.w = exp2(r0.w);
/*197*/	r0.w = cb3.data[1].y / r0.w;
/*198*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*199*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*200*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*201*/	r1.x = r1.x + -cb3.data[1].z;
/*202*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*203*/	r1.x = saturate(r1.y * r1.x);
/*204*/	r1.y = r1.x * -2.000000 + 3.000000;
/*205*/	r1.x = r1.x * r1.x;
/*206*/	r1.x = r1.x * r1.y;
/*207*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*208*/	r1.y = sqrt(r1.y);
/*209*/	r1.z = max(cb3.data[2].z, 0.001000);
/*210*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*211*/	r1.y = r1.z * r1.y;
/*212*/	r1.y = min(r1.y, 1.000000);
/*213*/	r1.z = r1.y * -2.000000 + 3.000000;
/*214*/	r1.y = r1.y * r1.y;
/*215*/	r1.y = r1.y * r1.z;
/*216*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*217*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*218*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*219*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*220*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*221*/	r4.w = max(r4.y, 0.000000);
/*222*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*223*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*224*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*225*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*226*/	r0.w = saturate(r0.w * r1.y);
/*227*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*228*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*229*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*230*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*231*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*232*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*233*/	color0.w = 1.000000;
/*234*/	return;
}
