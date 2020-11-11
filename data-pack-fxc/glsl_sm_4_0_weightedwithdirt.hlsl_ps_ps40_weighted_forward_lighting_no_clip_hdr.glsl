//
//
// Shader Model 4
// Fragment Shader
//
// id: 1691 - fxc/glsl_SM_4_0_weightedwithdirt.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r3.z = sqrt(r0.w);
/*27*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*31*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*32*/	r0.w = r5.w * r6.w;
/*33*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*34*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*35*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*36*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*37*/	r1.w = inversesqrt(r1.w);
/*38*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*39*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*40*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*41*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*42*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*43*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*46*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*47*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*48*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*49*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*50*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*51*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*52*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*53*/	r1.w = inversesqrt(r1.w);
/*54*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*55*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*58*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*61*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*62*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*63*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*64*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*67*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*68*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*71*/	r1.w = -r4.x + 1.000000;
/*72*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r3.w = dot(vec3(r3.xyzx), vec3(r2.xyzx));
/*74*/	r3.w = r3.w + r3.w;
/*75*/	r4.yzw = (r2.xxyz * -r3.wwww + r3.xxyz).yzw;
/*76*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*77*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*78*/	r3.w = cos((r6.x));
/*79*/	r3.w = inversesqrt(r3.w);
/*80*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*81*/	r5.w = saturate(r0.w * 60.000000);
/*82*/	r5.w = -r0.w + r5.w;
/*83*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*84*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*85*/	r7.x = inversesqrt(r7.x);
/*86*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*87*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*88*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*89*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*90*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*91*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*92*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*93*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*94*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*95*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*96*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*97*/	r5.y = -r0.w + 1.000000;
/*98*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*99*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*100*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*101*/	  r5.y = dot(vec3(r4.yzwy), vec3(r3.xyzx));
/*102*/	  r5.y = max(r5.y, 0.000000);
/*103*/	  r5.y = log2(r5.y);
/*104*/	  r5.y = r5.y * 10.000000;
/*105*/	  r5.y = exp2(r5.y);
/*106*/	  r5.y = r3.w * r5.y;
/*107*/	  r5.y = r5.y * r5.w + r0.w;
/*108*/	  r7.x = r1.w * 8.000000;
/*109*/	  r7.xyzw = (textureLod(s_environment, r4.yzwy.stp, r7.x)).xyzw;
/*110*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*111*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*112*/	}
/*113*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*114*/	r7.x = max(r5.y, 0.000000);
/*115*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*116*/	if(floatBitsToUint(r5.y) != 0u) {
/*117*/	  r4.y = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*118*/	  r4.y = max(r4.y, -1.000000);
/*119*/	  r4.y = min(r4.y, 1.000000);
/*120*/	  r4.z = -abs(r4.y) + 1.000000;
/*121*/	  r4.z = sqrt(r4.z);
/*122*/	  r4.w = abs(r4.y) * -0.018729 + 0.074261;
/*123*/	  r4.w = r4.w * abs(r4.y) + -0.212114;
/*124*/	  r4.w = r4.w * abs(r4.y) + 1.570729;
/*125*/	  r5.y = r4.z * r4.w;
/*126*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*127*/	  r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*128*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.y));
/*129*/	  r4.y = r4.w * r4.z + r4.y;
/*130*/	  r4.x = r4.x * r4.x;
/*131*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*132*/	  r2.w = r4.x * r2.w + r5.x;
/*133*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*134*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*135*/	  r4.x = -r2.w * r2.w + 1.000000;
/*136*/	  r4.x = max(r4.x, 0.001000);
/*137*/	  r4.x = log2(r4.x);
/*138*/	  r4.z = r4.x * 4.950617;
/*139*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*140*/	  r4.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*141*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*142*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.w) + floatBitsToInt(r2.w));
/*143*/	  r2.w = floatBitsToInt(r2.w);
/*144*/	  r4.z = r4.x * r4.x + -r4.z;
/*145*/	  r4.z = sqrt(r4.z);
/*146*/	  r4.x = -r4.x + r4.z;
/*147*/	  r4.x = max(r4.x, 0.000000);
/*148*/	  r4.x = sqrt(r4.x);
/*149*/	  r2.w = r2.w * r4.x;
/*150*/	  r2.w = r2.w * 1.414214;
/*151*/	  r2.w = 0.008727 / r2.w;
/*152*/	  r2.w = max(r2.w, 0.000100);
/*153*/	  r4.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*154*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*155*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*156*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*157*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*158*/	  r8.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*159*/	  r7.yz = (r8.xxzx / r8.yywy).yz;
/*160*/	  r4.zw = (-r4.zzzw * r7.yyyz).zw;
/*161*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*162*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*163*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r7.y) + floatBitsToInt(r2.w));
/*164*/	  r2.w = floatBitsToInt(r2.w);
/*165*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*166*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*167*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*168*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*169*/	  r2.w = r2.w * r4.x + 1.000000;
/*170*/	  r2.w = r2.w * 0.500000;
/*171*/	  r4.x = 1 + ~floatBitsToInt(r7.z);
/*172*/	  r4.x = r4.x * r4.y + 1.000000;
/*173*/	  r2.w = r4.x * 0.500000 + -r2.w;
/*174*/	  r4.x = min(r7.x, 1.000000);
/*175*/	  r1.w = r1.w * 1.570796;
/*176*/	  r1.w = sin(r1.w);
/*177*/	  r4.x = r4.x + -1.000000;
/*178*/	  r1.w = r1.w * r4.x + 1.000000;
/*179*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*180*/	  r3.x = max(r3.x, 0.000000);
/*181*/	  r3.x = log2(r3.x);
/*182*/	  r3.x = r3.x * 10.000000;
/*183*/	  r3.x = exp2(r3.x);
/*184*/	  r3.x = r3.w * r3.x;
/*185*/	  r3.x = r3.x * r5.w + r0.w;
/*186*/	  r1.w = r1.w * abs(r2.w);
/*187*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*188*/	} else {
/*189*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*190*/	}
/*191*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*192*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*193*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*194*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*195*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*196*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*197*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*198*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*199*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*200*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*201*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*202*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*203*/	r1.w = inversesqrt(r1.w);
/*204*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*205*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*206*/	r1.w = r1.w + r1.w;
/*207*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*208*/	r4.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*209*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*210*/	r1.w = max(r1.w, 0.000000);
/*211*/	r1.w = log2(r1.w);
/*212*/	r1.w = r1.w * 10.000000;
/*213*/	r1.w = exp2(r1.w);
/*214*/	r1.w = r3.w * r1.w;
/*215*/	r0.w = r1.w * r5.w + r0.w;
/*216*/	r2.xyz = (r4.xyzx * r0.wwww).xyz;
/*217*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*218*/	color0.w = 2.000000;
/*219*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*220*/	r0.w = 1.000000;
/*221*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*222*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*223*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*224*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*225*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*226*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*227*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*228*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*229*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*230*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*231*/	if(r0.x != 0) discard;
/*232*/	color1.x = 1.000000;
/*233*/	return;
}
