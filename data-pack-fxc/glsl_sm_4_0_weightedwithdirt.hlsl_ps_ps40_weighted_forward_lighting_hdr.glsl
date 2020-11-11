//
//
// Shader Model 4
// Fragment Shader
//
// id: 1689 - fxc/glsl_SM_4_0_weightedwithdirt.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r3.z = sqrt(r0.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r0.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*42*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*46*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*47*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*49*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*50*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*51*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*52*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*53*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*55*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*58*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*61*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*64*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*65*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*66*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*67*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*70*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*71*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*74*/	r1.w = -r4.x + 1.000000;
/*75*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r3.w = dot(vec3(r3.xyzx), vec3(r2.xyzx));
/*77*/	r3.w = r3.w + r3.w;
/*78*/	r4.yzw = (r2.xxyz * -r3.wwww + r3.xxyz).yzw;
/*79*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*80*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*81*/	r3.w = cos((r6.x));
/*82*/	r3.w = inversesqrt(r3.w);
/*83*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*84*/	r5.w = saturate(r0.w * 60.000000);
/*85*/	r5.w = -r0.w + r5.w;
/*86*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*87*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*88*/	r7.x = inversesqrt(r7.x);
/*89*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*90*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*91*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*92*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*93*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*94*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*95*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*96*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*97*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*98*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*99*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*100*/	r5.y = -r0.w + 1.000000;
/*101*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*102*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*103*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*104*/	  r5.y = dot(vec3(r4.yzwy), vec3(r3.xyzx));
/*105*/	  r5.y = max(r5.y, 0.000000);
/*106*/	  r5.y = log2(r5.y);
/*107*/	  r5.y = r5.y * 10.000000;
/*108*/	  r5.y = exp2(r5.y);
/*109*/	  r5.y = r3.w * r5.y;
/*110*/	  r5.y = r5.y * r5.w + r0.w;
/*111*/	  r7.x = r1.w * 8.000000;
/*112*/	  r7.xyzw = (textureLod(s_environment, r4.yzwy.stp, r7.x)).xyzw;
/*113*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*114*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*115*/	}
/*116*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*117*/	r7.x = max(r5.y, 0.000000);
/*118*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*119*/	if(floatBitsToUint(r5.y) != 0u) {
/*120*/	  r4.y = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*121*/	  r4.y = max(r4.y, -1.000000);
/*122*/	  r4.y = min(r4.y, 1.000000);
/*123*/	  r4.z = -abs(r4.y) + 1.000000;
/*124*/	  r4.z = sqrt(r4.z);
/*125*/	  r4.w = abs(r4.y) * -0.018729 + 0.074261;
/*126*/	  r4.w = r4.w * abs(r4.y) + -0.212114;
/*127*/	  r4.w = r4.w * abs(r4.y) + 1.570729;
/*128*/	  r5.y = r4.z * r4.w;
/*129*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*130*/	  r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*131*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.y));
/*132*/	  r4.y = r4.w * r4.z + r4.y;
/*133*/	  r4.x = r4.x * r4.x;
/*134*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*135*/	  r2.w = r4.x * r2.w + r5.x;
/*136*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*137*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*138*/	  r4.x = -r2.w * r2.w + 1.000000;
/*139*/	  r4.x = max(r4.x, 0.001000);
/*140*/	  r4.x = log2(r4.x);
/*141*/	  r4.z = r4.x * 4.950617;
/*142*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*143*/	  r4.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*144*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*145*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.w) + floatBitsToInt(r2.w));
/*146*/	  r2.w = floatBitsToInt(r2.w);
/*147*/	  r4.z = r4.x * r4.x + -r4.z;
/*148*/	  r4.z = sqrt(r4.z);
/*149*/	  r4.x = -r4.x + r4.z;
/*150*/	  r4.x = max(r4.x, 0.000000);
/*151*/	  r4.x = sqrt(r4.x);
/*152*/	  r2.w = r2.w * r4.x;
/*153*/	  r2.w = r2.w * 1.414214;
/*154*/	  r2.w = 0.008727 / r2.w;
/*155*/	  r2.w = max(r2.w, 0.000100);
/*156*/	  r4.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*157*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*158*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*159*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*160*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*161*/	  r8.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*162*/	  r7.yz = (r8.xxzx / r8.yywy).yz;
/*163*/	  r4.zw = (-r4.zzzw * r7.yyyz).zw;
/*164*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*165*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*166*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r7.y) + floatBitsToInt(r2.w));
/*167*/	  r2.w = floatBitsToInt(r2.w);
/*168*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*169*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*170*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*171*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*172*/	  r2.w = r2.w * r4.x + 1.000000;
/*173*/	  r2.w = r2.w * 0.500000;
/*174*/	  r4.x = 1 + ~floatBitsToInt(r7.z);
/*175*/	  r4.x = r4.x * r4.y + 1.000000;
/*176*/	  r2.w = r4.x * 0.500000 + -r2.w;
/*177*/	  r4.x = min(r7.x, 1.000000);
/*178*/	  r1.w = r1.w * 1.570796;
/*179*/	  r1.w = sin(r1.w);
/*180*/	  r4.x = r4.x + -1.000000;
/*181*/	  r1.w = r1.w * r4.x + 1.000000;
/*182*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*183*/	  r3.x = max(r3.x, 0.000000);
/*184*/	  r3.x = log2(r3.x);
/*185*/	  r3.x = r3.x * 10.000000;
/*186*/	  r3.x = exp2(r3.x);
/*187*/	  r3.x = r3.w * r3.x;
/*188*/	  r3.x = r3.x * r5.w + r0.w;
/*189*/	  r1.w = r1.w * abs(r2.w);
/*190*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*191*/	} else {
/*192*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*193*/	}
/*194*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*195*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*196*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*197*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*198*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*199*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*200*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*201*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*202*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*203*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*204*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*205*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*206*/	r1.w = inversesqrt(r1.w);
/*207*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*208*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*209*/	r1.w = r1.w + r1.w;
/*210*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*211*/	r4.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*212*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*213*/	r1.w = max(r1.w, 0.000000);
/*214*/	r1.w = log2(r1.w);
/*215*/	r1.w = r1.w * 10.000000;
/*216*/	r1.w = exp2(r1.w);
/*217*/	r1.w = r3.w * r1.w;
/*218*/	r0.w = r1.w * r5.w + r0.w;
/*219*/	r2.xyz = (r4.xyzx * r0.wwww).xyz;
/*220*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*221*/	color0.w = 2.000000;
/*222*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*223*/	r0.w = 1.000000;
/*224*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*225*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*226*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*227*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*228*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*229*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*230*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*231*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*232*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*233*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*234*/	if(r0.x != 0) discard;
/*235*/	color1.x = 1.000000;
/*236*/	return;
}
