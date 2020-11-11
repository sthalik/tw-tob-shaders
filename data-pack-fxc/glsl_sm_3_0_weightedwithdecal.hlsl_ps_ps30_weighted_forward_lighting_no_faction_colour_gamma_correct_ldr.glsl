//
//
// Shader Model 4
// Fragment Shader
//
// id: 1743 - fxc/glsl_SM_3_0_weightedwithdecal.hlsl_PS_ps30_weighted_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*13*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*15*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*17*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*20*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*21*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*22*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*23*/	if(floatBitsToUint(r0.w) != 0u) {
/*24*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*27*/	  r0.w = -r0.w + 1.000000;
/*28*/	  r0.w = max(r0.w, 0.000000);
/*29*/	  r5.z = sqrt(r0.w);
/*30*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*31*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*32*/	  r0.w = r3.x * r7.w;
/*33*/	  r3.x = r0.w * -0.500000 + r3.x;
/*34*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*35*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*36*/	  r0.w = -r4.w * r6.w + 1.000000;
/*37*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*38*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*39*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*40*/	}
/*41*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*42*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*43*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*46*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*47*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*48*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*49*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*50*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*51*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*52*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*53*/	r1.w = inversesqrt(r1.w);
/*54*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*55*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*58*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*61*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*62*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*63*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*64*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*67*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*68*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*69*/	r2.w = inversesqrt(r1.w);
/*70*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*71*/	r2.w = -r3.y + 1.000000;
/*72*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*74*/	r5.y = r5.y + r5.y;
/*75*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*76*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*77*/	r6.w = r2.w * 1.539380;
/*78*/	r6.w = cos((r6.w));
/*79*/	r6.w = inversesqrt(r6.w);
/*80*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*81*/	r7.x = saturate(r0.w * 60.000000);
/*82*/	r7.x = -r0.w + r7.x;
/*83*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*84*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*85*/	r8.x = inversesqrt(r8.x);
/*86*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*87*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*88*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*89*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*90*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*91*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*92*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*93*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*94*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*95*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*96*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*97*/	r6.y = -r0.w + 1.000000;
/*98*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*99*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*100*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*101*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*102*/	  r6.y = max(r6.y, 0.000000);
/*103*/	  r6.y = log2(r6.y);
/*104*/	  r6.y = r6.y * 10.000000;
/*105*/	  r6.y = exp2(r6.y);
/*106*/	  r6.y = r6.w * r6.y;
/*107*/	  r6.y = r6.y * r7.x + r0.w;
/*108*/	  r8.x = r2.w * 8.000000;
/*109*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*110*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*111*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*112*/	}
/*113*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*114*/	r2.y = max(r2.x, 0.000000);
/*115*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*116*/	if(floatBitsToUint(r2.x) != 0u) {
/*117*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*118*/	  r2.x = max(r2.x, -1.000000);
/*119*/	  r2.x = min(r2.x, 1.000000);
/*120*/	  r2.z = -abs(r2.x) + 1.000000;
/*121*/	  r2.z = sqrt(r2.z);
/*122*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*123*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*124*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*125*/	  r5.z = r2.z * r5.y;
/*126*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*127*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*128*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*129*/	  r2.x = r5.y * r2.z + r2.x;
/*130*/	  r2.z = r3.y * r3.y;
/*131*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*132*/	  r2.z = r2.z * r3.y + r6.x;
/*133*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*134*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*135*/	  r3.y = -r2.z * r2.z + 1.000000;
/*136*/	  r3.y = max(r3.y, 0.001000);
/*137*/	  r3.y = log2(r3.y);
/*138*/	  r5.x = r3.y * 4.950617;
/*139*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*140*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*141*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*142*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*143*/	  r2.z = floatBitsToInt(r2.z);
/*144*/	  r5.x = r3.y * r3.y + -r5.x;
/*145*/	  r5.x = sqrt(r5.x);
/*146*/	  r3.y = -r3.y + r5.x;
/*147*/	  r3.y = max(r3.y, 0.000000);
/*148*/	  r3.y = sqrt(r3.y);
/*149*/	  r2.z = r2.z * r3.y;
/*150*/	  r2.z = r2.z * 1.414214;
/*151*/	  r2.z = 0.008727 / r2.z;
/*152*/	  r2.z = max(r2.z, 0.000100);
/*153*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*154*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*155*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*156*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*157*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*158*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*159*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*160*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*161*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*162*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*163*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*164*/	  r2.x = floatBitsToInt(r2.x);
/*165*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*166*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*167*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*168*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*169*/	  r2.x = r2.x * r5.x + 1.000000;
/*170*/	  r2.x = r2.x * 0.500000;
/*171*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*172*/	  r2.z = r2.z * r5.y + 1.000000;
/*173*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*174*/	  r2.z = min(r2.y, 1.000000);
/*175*/	  r2.w = r2.w * 1.570796;
/*176*/	  r2.w = sin(r2.w);
/*177*/	  r2.z = r2.z + -1.000000;
/*178*/	  r2.z = r2.w * r2.z + 1.000000;
/*179*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*180*/	  r2.w = max(r2.w, 0.000000);
/*181*/	  r2.w = log2(r2.w);
/*182*/	  r2.w = r2.w * 10.000000;
/*183*/	  r2.w = exp2(r2.w);
/*184*/	  r2.w = r6.w * r2.w;
/*185*/	  r2.w = r2.w * r7.x + r0.w;
/*186*/	  r2.x = r2.z * abs(r2.x);
/*187*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*188*/	} else {
/*189*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*190*/	}
/*191*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*192*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*193*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*194*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*195*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*196*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*197*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*198*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*199*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*200*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*201*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*202*/	r2.w = 1.000000;
/*203*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*204*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*205*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*206*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*207*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*208*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*209*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*210*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*211*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*212*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*213*/	if(r0.w != 0) discard;
/*214*/	r0.w = sqrt(r1.w);
/*215*/	r1.x = saturate(cb3.data[0].w)/**/;
/*216*/	r1.x = -r1.x + 1.000000;
/*217*/	r1.x = r1.x * 8.000000 + -4.000000;
/*218*/	r1.y = saturate(cb3.data[1].x)/**/;
/*219*/	r1.y = -r1.y + 1.000000;
/*220*/	r1.y = r1.y * 1000.000000;
/*221*/	r0.w = r0.w / r1.y;
/*222*/	r0.w = r0.w + r1.x;
/*223*/	r0.w = r0.w * 1.442695;
/*224*/	r0.w = exp2(r0.w);
/*225*/	r0.w = cb3.data[1].y / r0.w;
/*226*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*227*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*228*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*229*/	r1.x = r1.x + -cb3.data[1].z;
/*230*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*231*/	r1.x = saturate(r1.y * r1.x);
/*232*/	r1.y = r1.x * -2.000000 + 3.000000;
/*233*/	r1.x = r1.x * r1.x;
/*234*/	r1.x = r1.x * r1.y;
/*235*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*236*/	r1.y = sqrt(r1.y);
/*237*/	r1.z = max(cb3.data[2].z, 0.001000);
/*238*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*239*/	r1.y = r1.z * r1.y;
/*240*/	r1.y = min(r1.y, 1.000000);
/*241*/	r1.z = r1.y * -2.000000 + 3.000000;
/*242*/	r1.y = r1.y * r1.y;
/*243*/	r1.y = r1.y * r1.z;
/*244*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*245*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*246*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*247*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*248*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*249*/	r4.w = max(r4.y, 0.000000);
/*250*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*251*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*252*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*253*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*254*/	r0.w = saturate(r0.w * r1.y);
/*255*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*256*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*257*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*258*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*259*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*260*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*261*/	color0.w = 1.000000;
/*262*/	return;
}
