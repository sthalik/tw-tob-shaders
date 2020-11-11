//
//
// Shader Model 4
// Fragment Shader
//
// id: 2311 - fxc/glsl_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_alpha_overlay_no_faction_colour.glsl
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
uniform sampler2D s_fire_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
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
/*2*/	r1.w = r0.w + -0.501961;
/*3*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r1.w = -r1.w + 1.000000;
/*10*/	r1.w = max(r1.w, 0.000000);
/*11*/	r3.z = sqrt(r1.w);
/*12*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*16*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*17*/	r1.w = r5.w * r6.w;
/*18*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*19*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*20*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*21*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*22*/	r2.x = inversesqrt(r2.x);
/*23*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*24*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*25*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*26*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*27*/	r5.x = r3.x;
/*28*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*29*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*30*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*31*/	r1.w = saturate(r5.x * 5.000000);
/*32*/	r5.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*33*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*34*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*35*/	r2.w = log2(r3.z);
/*36*/	r2.w = r2.w * 1.800000;
/*37*/	r2.w = exp2(r2.w);
/*38*/	r2.w = r2.w * 10.000000;
/*39*/	r2.w = min(r2.w, 1.000000);
/*40*/	r1.w = r1.w + r2.w;
/*41*/	r1.w = r1.w * 0.500000;
/*42*/	r2.w = -r3.w + 1.000000;
/*43*/	r2.w = log2(r2.w);
/*44*/	r2.w = r2.w * vsOut_T7.z;
/*45*/	r2.w = exp2(r2.w);
/*46*/	r2.w = min(r2.w, 1.000000);
/*47*/	r2.w = r2.w * vsOut_T7.z;
/*48*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*49*/	r3.w = 1.000000;
/*50*/	r5.xyzw = r5.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r3.zzzw;
/*51*/	r5.xyzw = r1.wwww * r5.xyzw + r3.zzzw;
/*52*/	r5.xyzw = -r0.xyzw + r5.xyzw;
/*53*/	r0.xyzw = r2.wwww * r5.xyzw + r0.xyzw;
/*54*/	r1.w = vsOut_T7.z + -0.025000;
/*55*/	r1.w = max(r1.w, 0.000000);
/*56*/	r3.xyzw = -r0.xyzw + r3.xyzw;
/*57*/	r0.xyzw = r1.wwww * r3.xyzw + r0.xyzw;
/*58*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*60*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*61*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*62*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*63*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*64*/	r1.w = vsOut_T7.y * -r4.y + r4.y;
/*65*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*66*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*67*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*68*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*69*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*70*/	r2.w = inversesqrt(r2.w);
/*71*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*72*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*73*/	r2.w = inversesqrt(r2.w);
/*74*/	r4.yzw = (r2.wwww * vsOut_T5.xxyz).yzw;
/*75*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*76*/	r2.w = inversesqrt(r2.w);
/*77*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*78*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*79*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*80*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*81*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*82*/	r2.w = inversesqrt(r2.w);
/*83*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*84*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*85*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*86*/	r4.y = inversesqrt(r2.w);
/*87*/	r4.yzw = (r3.xxyz * r4.yyyy).yzw;
/*88*/	r5.x = -r4.x + 1.000000;
/*89*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*90*/	r5.z = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*91*/	r5.z = r5.z + r5.z;
/*92*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.yzwy).xyz;
/*93*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*94*/	r5.z = r5.x * 1.539380;
/*95*/	r5.z = cos((r5.z));
/*96*/	r5.z = inversesqrt(r5.z);
/*97*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*98*/	r5.w = saturate(r1.w * 60.000000);
/*99*/	r5.w = -r1.w + r5.w;
/*100*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*101*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*102*/	r6.w = inversesqrt(r6.w);
/*103*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*104*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*105*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*106*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*107*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*108*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*109*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*110*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*111*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*112*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*113*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*114*/	r6.w = -r1.w + 1.000000;
/*115*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*116*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*117*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*118*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.yzwy));
/*119*/	  r6.w = max(r6.w, 0.000000);
/*120*/	  r6.w = log2(r6.w);
/*121*/	  r6.w = r6.w * 10.000000;
/*122*/	  r6.w = exp2(r6.w);
/*123*/	  r6.w = r5.z * r6.w;
/*124*/	  r6.w = r6.w * r5.w + r1.w;
/*125*/	  r7.y = r5.x * 8.000000;
/*126*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*127*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*128*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*129*/	}
/*130*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*131*/	r2.y = max(r2.x, 0.000000);
/*132*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*133*/	if(floatBitsToUint(r2.x) != 0u) {
/*134*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*135*/	  r2.x = max(r2.x, -1.000000);
/*136*/	  r2.x = min(r2.x, 1.000000);
/*137*/	  r2.z = -abs(r2.x) + 1.000000;
/*138*/	  r2.z = sqrt(r2.z);
/*139*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*140*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*141*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*142*/	  r6.y = r2.z * r6.x;
/*143*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*144*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*145*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*146*/	  r2.x = r6.x * r2.z + r2.x;
/*147*/	  r2.z = r4.x * r4.x;
/*148*/	    r4.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*149*/	  r2.z = r2.z * r4.x + r7.x;
/*150*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*151*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*152*/	  r4.x = -r2.z * r2.z + 1.000000;
/*153*/	  r4.x = max(r4.x, 0.001000);
/*154*/	  r4.x = log2(r4.x);
/*155*/	  r5.y = r4.x * 4.950617;
/*156*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*157*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*158*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*159*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*160*/	  r2.z = floatBitsToInt(r2.z);
/*161*/	  r5.y = r4.x * r4.x + -r5.y;
/*162*/	  r5.y = sqrt(r5.y);
/*163*/	  r4.x = -r4.x + r5.y;
/*164*/	  r4.x = max(r4.x, 0.000000);
/*165*/	  r4.x = sqrt(r4.x);
/*166*/	  r2.z = r2.z * r4.x;
/*167*/	  r2.z = r2.z * 1.414214;
/*168*/	  r2.z = 0.008727 / r2.z;
/*169*/	  r2.z = max(r2.z, 0.000100);
/*170*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*171*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*172*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*173*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*174*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*175*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*176*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*177*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*178*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*179*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*180*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*181*/	  r2.x = floatBitsToInt(r2.x);
/*182*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*183*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*184*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*185*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*186*/	  r2.x = r2.x * r6.x + 1.000000;
/*187*/	  r2.x = r2.x * 0.500000;
/*188*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*189*/	  r2.z = r2.z * r6.y + 1.000000;
/*190*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*191*/	  r2.z = min(r2.y, 1.000000);
/*192*/	  r4.x = r5.x * 1.570796;
/*193*/	  r4.x = sin(r4.x);
/*194*/	  r2.z = r2.z + -1.000000;
/*195*/	  r2.z = r4.x * r2.z + 1.000000;
/*196*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*197*/	  r4.x = max(r4.x, 0.000000);
/*198*/	  r4.x = log2(r4.x);
/*199*/	  r4.x = r4.x * 10.000000;
/*200*/	  r4.x = exp2(r4.x);
/*201*/	  r4.x = r5.z * r4.x;
/*202*/	  r4.x = r4.x * r5.w + r1.w;
/*203*/	  r2.x = r2.z * abs(r2.x);
/*204*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*205*/	} else {
/*206*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*207*/	}
/*208*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*209*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*210*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*211*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*212*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*213*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*214*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*215*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*216*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*217*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*218*/	r1.x = sqrt(r2.w);
/*219*/	r1.y = saturate(cb2.data[0].w)/**/;
/*220*/	r1.y = -r1.y + 1.000000;
/*221*/	r1.y = r1.y * 8.000000 + -4.000000;
/*222*/	r1.z = saturate(cb2.data[1].x)/**/;
/*223*/	r1.z = -r1.z + 1.000000;
/*224*/	r1.z = r1.z * 1000.000000;
/*225*/	r1.x = r1.x / r1.z;
/*226*/	r1.x = r1.x + r1.y;
/*227*/	r1.x = r1.x * 1.442695;
/*228*/	r1.x = exp2(r1.x);
/*229*/	r1.x = cb2.data[1].y / r1.x;
/*230*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*231*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*232*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*233*/	r1.y = r1.y + -cb2.data[1].z;
/*234*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*235*/	r1.y = saturate(r1.z * r1.y);
/*236*/	r1.z = r1.y * -2.000000 + 3.000000;
/*237*/	r1.y = r1.y * r1.y;
/*238*/	r1.y = r1.y * r1.z;
/*239*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*240*/	r1.z = sqrt(r1.z);
/*241*/	r1.w = max(cb2.data[2].z, 0.001000);
/*242*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*243*/	r1.z = r1.w * r1.z;
/*244*/	r1.z = min(r1.z, 1.000000);
/*245*/	r1.w = r1.z * -2.000000 + 3.000000;
/*246*/	r1.z = r1.z * r1.z;
/*247*/	r1.z = r1.z * r1.w;
/*248*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*249*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*250*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*251*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*252*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*253*/	r3.w = max(r3.y, 0.000000);
/*254*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*255*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*256*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*257*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*258*/	r1.x = saturate(r1.x * r1.z);
/*259*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*260*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*261*/	color0.w = r0.w * vsOut_T6.w;
/*262*/	return;
}
