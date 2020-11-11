//
//
// Shader Model 4
// Fragment Shader
//
// id: 5706 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirt.hlsl_PS_ps30_alpha_overlay.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

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
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r1.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r1.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r1.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r2.x = inversesqrt(r2.x);
/*41*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*42*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*46*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*47*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*49*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*50*/	r1.w = vsOut_T7.y * -r4.y + r4.y;
/*51*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*52*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*53*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*55*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r2.w = inversesqrt(r2.w);
/*57*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*58*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*59*/	r2.w = inversesqrt(r2.w);
/*60*/	r4.yzw = (r2.wwww * vsOut_T5.xxyz).yzw;
/*61*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r2.w = inversesqrt(r2.w);
/*63*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*64*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*65*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*66*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*67*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*68*/	r2.w = inversesqrt(r2.w);
/*69*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*70*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*71*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*72*/	r4.y = inversesqrt(r2.w);
/*73*/	r4.yzw = (r3.xxyz * r4.yyyy).yzw;
/*74*/	r5.x = -r4.x + 1.000000;
/*75*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r5.z = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*77*/	r5.z = r5.z + r5.z;
/*78*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.yzwy).xyz;
/*79*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*80*/	r5.z = r5.x * 1.539380;
/*81*/	r5.z = cos((r5.z));
/*82*/	r5.z = inversesqrt(r5.z);
/*83*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*84*/	r5.w = saturate(r1.w * 60.000000);
/*85*/	r5.w = -r1.w + r5.w;
/*86*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*87*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*88*/	r6.w = inversesqrt(r6.w);
/*89*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*90*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*91*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*92*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*93*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*94*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*95*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*96*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*97*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*98*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*99*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*100*/	r6.w = -r1.w + 1.000000;
/*101*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*102*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*103*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*104*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.yzwy));
/*105*/	  r6.w = max(r6.w, 0.000000);
/*106*/	  r6.w = log2(r6.w);
/*107*/	  r6.w = r6.w * 10.000000;
/*108*/	  r6.w = exp2(r6.w);
/*109*/	  r6.w = r5.z * r6.w;
/*110*/	  r6.w = r6.w * r5.w + r1.w;
/*111*/	  r7.y = r5.x * 8.000000;
/*112*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*113*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*114*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*115*/	}
/*116*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*117*/	r2.y = max(r2.x, 0.000000);
/*118*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*119*/	if(floatBitsToUint(r2.x) != 0u) {
/*120*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*121*/	  r2.x = max(r2.x, -1.000000);
/*122*/	  r2.x = min(r2.x, 1.000000);
/*123*/	  r2.z = -abs(r2.x) + 1.000000;
/*124*/	  r2.z = sqrt(r2.z);
/*125*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*126*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*127*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*128*/	  r6.y = r2.z * r6.x;
/*129*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*130*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*131*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*132*/	  r2.x = r6.x * r2.z + r2.x;
/*133*/	  r2.z = r4.x * r4.x;
/*134*/	    r4.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*135*/	  r2.z = r2.z * r4.x + r7.x;
/*136*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*137*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*138*/	  r4.x = -r2.z * r2.z + 1.000000;
/*139*/	  r4.x = max(r4.x, 0.001000);
/*140*/	  r4.x = log2(r4.x);
/*141*/	  r5.y = r4.x * 4.950617;
/*142*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*143*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*144*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*145*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*146*/	  r2.z = floatBitsToInt(r2.z);
/*147*/	  r5.y = r4.x * r4.x + -r5.y;
/*148*/	  r5.y = sqrt(r5.y);
/*149*/	  r4.x = -r4.x + r5.y;
/*150*/	  r4.x = max(r4.x, 0.000000);
/*151*/	  r4.x = sqrt(r4.x);
/*152*/	  r2.z = r2.z * r4.x;
/*153*/	  r2.z = r2.z * 1.414214;
/*154*/	  r2.z = 0.008727 / r2.z;
/*155*/	  r2.z = max(r2.z, 0.000100);
/*156*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*157*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*158*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*159*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*160*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*161*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*162*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*163*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*164*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*165*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*166*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*167*/	  r2.x = floatBitsToInt(r2.x);
/*168*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*169*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*170*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*171*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*172*/	  r2.x = r2.x * r6.x + 1.000000;
/*173*/	  r2.x = r2.x * 0.500000;
/*174*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*175*/	  r2.z = r2.z * r6.y + 1.000000;
/*176*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*177*/	  r2.z = min(r2.y, 1.000000);
/*178*/	  r4.x = r5.x * 1.570796;
/*179*/	  r4.x = sin(r4.x);
/*180*/	  r2.z = r2.z + -1.000000;
/*181*/	  r2.z = r4.x * r2.z + 1.000000;
/*182*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*183*/	  r4.x = max(r4.x, 0.000000);
/*184*/	  r4.x = log2(r4.x);
/*185*/	  r4.x = r4.x * 10.000000;
/*186*/	  r4.x = exp2(r4.x);
/*187*/	  r4.x = r5.z * r4.x;
/*188*/	  r4.x = r4.x * r5.w + r1.w;
/*189*/	  r2.x = r2.z * abs(r2.x);
/*190*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*191*/	} else {
/*192*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*193*/	}
/*194*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*195*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*196*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*197*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*198*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*199*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*200*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*201*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*202*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*203*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*204*/	r1.x = sqrt(r2.w);
/*205*/	r1.y = saturate(cb2.data[0].w)/**/;
/*206*/	r1.y = -r1.y + 1.000000;
/*207*/	r1.y = r1.y * 8.000000 + -4.000000;
/*208*/	r1.z = saturate(cb2.data[1].x)/**/;
/*209*/	r1.z = -r1.z + 1.000000;
/*210*/	r1.z = r1.z * 1000.000000;
/*211*/	r1.x = r1.x / r1.z;
/*212*/	r1.x = r1.x + r1.y;
/*213*/	r1.x = r1.x * 1.442695;
/*214*/	r1.x = exp2(r1.x);
/*215*/	r1.x = cb2.data[1].y / r1.x;
/*216*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*217*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*218*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*219*/	r1.y = r1.y + -cb2.data[1].z;
/*220*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*221*/	r1.y = saturate(r1.z * r1.y);
/*222*/	r1.z = r1.y * -2.000000 + 3.000000;
/*223*/	r1.y = r1.y * r1.y;
/*224*/	r1.y = r1.y * r1.z;
/*225*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*226*/	r1.z = sqrt(r1.z);
/*227*/	r1.w = max(cb2.data[2].z, 0.001000);
/*228*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*229*/	r1.z = r1.w * r1.z;
/*230*/	r1.z = min(r1.z, 1.000000);
/*231*/	r1.w = r1.z * -2.000000 + 3.000000;
/*232*/	r1.z = r1.z * r1.z;
/*233*/	r1.z = r1.z * r1.w;
/*234*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*235*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*236*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*237*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*238*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*239*/	r3.w = max(r3.y, 0.000000);
/*240*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*241*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*242*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*243*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*244*/	r1.x = saturate(r1.x * r1.z);
/*245*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*246*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*247*/	color0.w = r0.w * vsOut_T6.w;
/*248*/	return;
}
