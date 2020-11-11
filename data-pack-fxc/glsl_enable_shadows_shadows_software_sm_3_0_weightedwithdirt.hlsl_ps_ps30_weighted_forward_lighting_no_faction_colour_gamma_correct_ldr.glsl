//
//
// Shader Model 4
// Fragment Shader
//
// id: 5748 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirt.hlsl_PS_ps30_weighted_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*11*/	r3.z = sqrt(r0.w);
/*12*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*16*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*17*/	r0.w = r5.w * r6.w;
/*18*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*19*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*20*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*21*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*22*/	r1.w = inversesqrt(r1.w);
/*23*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*24*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*25*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*26*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*27*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*28*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*29*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*30*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*31*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*32*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*33*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*34*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*35*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*36*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*37*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*38*/	r1.w = inversesqrt(r1.w);
/*39*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*40*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*41*/	r1.w = inversesqrt(r1.w);
/*42*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*43*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*44*/	r1.w = inversesqrt(r1.w);
/*45*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*46*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*47*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*48*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*49*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*50*/	r1.w = inversesqrt(r1.w);
/*51*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*52*/	r3.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*53*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*54*/	r2.w = inversesqrt(r1.w);
/*55*/	r4.yzw = (r2.wwww * r3.xxyz).yzw;
/*56*/	r2.w = -r4.x + 1.000000;
/*57*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*58*/	r5.y = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*59*/	r5.y = r5.y + r5.y;
/*60*/	r5.yzw = (r2.xxyz * -r5.yyyy + r4.yyzw).yzw;
/*61*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*62*/	r6.w = r2.w * 1.539380;
/*63*/	r6.w = cos((r6.w));
/*64*/	r6.w = inversesqrt(r6.w);
/*65*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*66*/	r7.x = saturate(r0.w * 60.000000);
/*67*/	r7.x = -r0.w + r7.x;
/*68*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*69*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*70*/	r8.x = inversesqrt(r8.x);
/*71*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*72*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*73*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*74*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*75*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*76*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*77*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*78*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*79*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*80*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*81*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*82*/	r6.y = -r0.w + 1.000000;
/*83*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*84*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*85*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*86*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.yzwy));
/*87*/	  r6.y = max(r6.y, 0.000000);
/*88*/	  r6.y = log2(r6.y);
/*89*/	  r6.y = r6.y * 10.000000;
/*90*/	  r6.y = exp2(r6.y);
/*91*/	  r6.y = r6.w * r6.y;
/*92*/	  r6.y = r6.y * r7.x + r0.w;
/*93*/	  r8.x = r2.w * 8.000000;
/*94*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*95*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*96*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*97*/	}
/*98*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*99*/	r2.y = max(r2.x, 0.000000);
/*100*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*101*/	if(floatBitsToUint(r2.x) != 0u) {
/*102*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*103*/	  r2.x = max(r2.x, -1.000000);
/*104*/	  r2.x = min(r2.x, 1.000000);
/*105*/	  r2.z = -abs(r2.x) + 1.000000;
/*106*/	  r2.z = sqrt(r2.z);
/*107*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*108*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*109*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*110*/	  r5.z = r2.z * r5.y;
/*111*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*112*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*113*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*114*/	  r2.x = r5.y * r2.z + r2.x;
/*115*/	  r2.z = r4.x * r4.x;
/*116*/	    r4.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*117*/	  r2.z = r2.z * r4.x + r6.x;
/*118*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*119*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*120*/	  r4.x = -r2.z * r2.z + 1.000000;
/*121*/	  r4.x = max(r4.x, 0.001000);
/*122*/	  r4.x = log2(r4.x);
/*123*/	  r5.x = r4.x * 4.950617;
/*124*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*125*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*126*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*127*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*128*/	  r2.z = floatBitsToInt(r2.z);
/*129*/	  r5.x = r4.x * r4.x + -r5.x;
/*130*/	  r5.x = sqrt(r5.x);
/*131*/	  r4.x = -r4.x + r5.x;
/*132*/	  r4.x = max(r4.x, 0.000000);
/*133*/	  r4.x = sqrt(r4.x);
/*134*/	  r2.z = r2.z * r4.x;
/*135*/	  r2.z = r2.z * 1.414214;
/*136*/	  r2.z = 0.008727 / r2.z;
/*137*/	  r2.z = max(r2.z, 0.000100);
/*138*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*139*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*140*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*141*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*142*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*143*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*144*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*145*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*146*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*147*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*148*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*149*/	  r2.x = floatBitsToInt(r2.x);
/*150*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*151*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*152*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*153*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*154*/	  r2.x = r2.x * r5.x + 1.000000;
/*155*/	  r2.x = r2.x * 0.500000;
/*156*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*157*/	  r2.z = r2.z * r5.y + 1.000000;
/*158*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*159*/	  r2.z = min(r2.y, 1.000000);
/*160*/	  r2.w = r2.w * 1.570796;
/*161*/	  r2.w = sin(r2.w);
/*162*/	  r2.z = r2.z + -1.000000;
/*163*/	  r2.z = r2.w * r2.z + 1.000000;
/*164*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r4.yzwy));
/*165*/	  r2.w = max(r2.w, 0.000000);
/*166*/	  r2.w = log2(r2.w);
/*167*/	  r2.w = r2.w * 10.000000;
/*168*/	  r2.w = exp2(r2.w);
/*169*/	  r2.w = r6.w * r2.w;
/*170*/	  r2.w = r2.w * r7.x + r0.w;
/*171*/	  r2.x = r2.z * abs(r2.x);
/*172*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*173*/	} else {
/*174*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*175*/	}
/*176*/	r4.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*177*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*178*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*179*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*180*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*181*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*182*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*183*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*184*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*185*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*186*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*187*/	r2.w = 1.000000;
/*188*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*189*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*190*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*191*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*192*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*193*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*194*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*195*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*196*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*197*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*198*/	if(r0.w != 0) discard;
/*199*/	r0.w = sqrt(r1.w);
/*200*/	r1.x = saturate(cb3.data[0].w)/**/;
/*201*/	r1.x = -r1.x + 1.000000;
/*202*/	r1.x = r1.x * 8.000000 + -4.000000;
/*203*/	r1.y = saturate(cb3.data[1].x)/**/;
/*204*/	r1.y = -r1.y + 1.000000;
/*205*/	r1.y = r1.y * 1000.000000;
/*206*/	r0.w = r0.w / r1.y;
/*207*/	r0.w = r0.w + r1.x;
/*208*/	r0.w = r0.w * 1.442695;
/*209*/	r0.w = exp2(r0.w);
/*210*/	r0.w = cb3.data[1].y / r0.w;
/*211*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*212*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*213*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*214*/	r1.x = r1.x + -cb3.data[1].z;
/*215*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*216*/	r1.x = saturate(r1.y * r1.x);
/*217*/	r1.y = r1.x * -2.000000 + 3.000000;
/*218*/	r1.x = r1.x * r1.x;
/*219*/	r1.x = r1.x * r1.y;
/*220*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*221*/	r1.y = sqrt(r1.y);
/*222*/	r1.z = max(cb3.data[2].z, 0.001000);
/*223*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*224*/	r1.y = r1.z * r1.y;
/*225*/	r1.y = min(r1.y, 1.000000);
/*226*/	r1.z = r1.y * -2.000000 + 3.000000;
/*227*/	r1.y = r1.y * r1.y;
/*228*/	r1.y = r1.y * r1.z;
/*229*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*230*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*231*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*232*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*233*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*234*/	r3.w = max(r3.y, 0.000000);
/*235*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*236*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*237*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*238*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*239*/	r0.w = saturate(r0.w * r1.y);
/*240*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*241*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*242*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*243*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*244*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*245*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*246*/	color0.w = 1.000000;
/*247*/	return;
}
