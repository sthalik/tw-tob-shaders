//
//
// Shader Model 4
// Fragment Shader
//
// id: 2806 - fxc/glsl_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
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
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r3.z = sqrt(r0.w);
/*9*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*13*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*14*/	r0.w = r5.w * r6.w;
/*15*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*16*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*17*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*18*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*19*/	r1.w = inversesqrt(r1.w);
/*20*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*21*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*22*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*23*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*24*/	r5.x = r3.x;
/*25*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*26*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*27*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*28*/	r0.w = saturate(r5.x * 5.000000);
/*29*/	r5.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*30*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*31*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*32*/	r1.w = log2(r3.z);
/*33*/	r1.w = r1.w * 1.800000;
/*34*/	r1.w = exp2(r1.w);
/*35*/	r1.w = r1.w * 10.000000;
/*36*/	r1.w = min(r1.w, 1.000000);
/*37*/	r0.w = r0.w + r1.w;
/*38*/	r0.w = r0.w * 0.500000;
/*39*/	r1.w = -r3.w + 1.000000;
/*40*/	r1.w = log2(r1.w);
/*41*/	r1.w = r1.w * vsOut_T7.z;
/*42*/	r1.w = exp2(r1.w);
/*43*/	r1.w = min(r1.w, 1.000000);
/*44*/	r1.w = r1.w * vsOut_T7.z;
/*45*/	r2.w = r3.z * 0.250000;
/*46*/	r3.xyw = (r5.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*47*/	r3.xyw = (r0.wwww * r3.xyxw + r2.wwww).xyw;
/*48*/	r3.xyw = (-r0.xyxz + r3.xyxw).xyw;
/*49*/	r0.xyz = (r1.wwww * r3.xywx + r0.xyzx).xyz;
/*50*/	r0.w = vsOut_T7.z + -0.025000;
/*51*/	r0.w = max(r0.w, 0.000000);
/*52*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*53*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*55*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*56*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*57*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*58*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*59*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*60*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*61*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*62*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*63*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*64*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*65*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*68*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*71*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*74*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*75*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*76*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*77*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*78*/	r1.w = inversesqrt(r1.w);
/*79*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*80*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*81*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*82*/	r1.w = inversesqrt(r1.w);
/*83*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*84*/	r1.w = -r4.x + 1.000000;
/*85*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r3.w = dot(vec3(r3.xyzx), vec3(r2.xyzx));
/*87*/	r3.w = r3.w + r3.w;
/*88*/	r4.yzw = (r2.xxyz * -r3.wwww + r3.xxyz).yzw;
/*89*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*90*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*91*/	r3.w = cos((r6.x));
/*92*/	r3.w = inversesqrt(r3.w);
/*93*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*94*/	r5.w = saturate(r0.w * 60.000000);
/*95*/	r5.w = -r0.w + r5.w;
/*96*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*97*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*98*/	r7.x = inversesqrt(r7.x);
/*99*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*100*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*101*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*102*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*103*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*104*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*105*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*106*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*107*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*108*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*109*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*110*/	r5.y = -r0.w + 1.000000;
/*111*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*112*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*113*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*114*/	  r5.y = dot(vec3(r4.yzwy), vec3(r3.xyzx));
/*115*/	  r5.y = max(r5.y, 0.000000);
/*116*/	  r5.y = log2(r5.y);
/*117*/	  r5.y = r5.y * 10.000000;
/*118*/	  r5.y = exp2(r5.y);
/*119*/	  r5.y = r3.w * r5.y;
/*120*/	  r5.y = r5.y * r5.w + r0.w;
/*121*/	  r7.x = r1.w * 8.000000;
/*122*/	  r7.xyzw = (textureLod(s_environment, r4.yzwy.stp, r7.x)).xyzw;
/*123*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*124*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*125*/	}
/*126*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*127*/	r7.x = max(r5.y, 0.000000);
/*128*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*129*/	if(floatBitsToUint(r5.y) != 0u) {
/*130*/	  r4.y = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*131*/	  r4.y = max(r4.y, -1.000000);
/*132*/	  r4.y = min(r4.y, 1.000000);
/*133*/	  r4.z = -abs(r4.y) + 1.000000;
/*134*/	  r4.z = sqrt(r4.z);
/*135*/	  r4.w = abs(r4.y) * -0.018729 + 0.074261;
/*136*/	  r4.w = r4.w * abs(r4.y) + -0.212114;
/*137*/	  r4.w = r4.w * abs(r4.y) + 1.570729;
/*138*/	  r5.y = r4.z * r4.w;
/*139*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*140*/	  r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*141*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.y));
/*142*/	  r4.y = r4.w * r4.z + r4.y;
/*143*/	  r4.x = r4.x * r4.x;
/*144*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*145*/	  r2.w = r4.x * r2.w + r5.x;
/*146*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*147*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*148*/	  r4.x = -r2.w * r2.w + 1.000000;
/*149*/	  r4.x = max(r4.x, 0.001000);
/*150*/	  r4.x = log2(r4.x);
/*151*/	  r4.z = r4.x * 4.950617;
/*152*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*153*/	  r4.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*154*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*155*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.w) + floatBitsToInt(r2.w));
/*156*/	  r2.w = floatBitsToInt(r2.w);
/*157*/	  r4.z = r4.x * r4.x + -r4.z;
/*158*/	  r4.z = sqrt(r4.z);
/*159*/	  r4.x = -r4.x + r4.z;
/*160*/	  r4.x = max(r4.x, 0.000000);
/*161*/	  r4.x = sqrt(r4.x);
/*162*/	  r2.w = r2.w * r4.x;
/*163*/	  r2.w = r2.w * 1.414214;
/*164*/	  r2.w = 0.008727 / r2.w;
/*165*/	  r2.w = max(r2.w, 0.000100);
/*166*/	  r4.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*167*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*168*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*169*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*170*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*171*/	  r8.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*172*/	  r7.yz = (r8.xxzx / r8.yywy).yz;
/*173*/	  r4.zw = (-r4.zzzw * r7.yyyz).zw;
/*174*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*175*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*176*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r7.y) + floatBitsToInt(r2.w));
/*177*/	  r2.w = floatBitsToInt(r2.w);
/*178*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*179*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*180*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*181*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*182*/	  r2.w = r2.w * r4.x + 1.000000;
/*183*/	  r2.w = r2.w * 0.500000;
/*184*/	  r4.x = 1 + ~floatBitsToInt(r7.z);
/*185*/	  r4.x = r4.x * r4.y + 1.000000;
/*186*/	  r2.w = r4.x * 0.500000 + -r2.w;
/*187*/	  r4.x = min(r7.x, 1.000000);
/*188*/	  r1.w = r1.w * 1.570796;
/*189*/	  r1.w = sin(r1.w);
/*190*/	  r4.x = r4.x + -1.000000;
/*191*/	  r1.w = r1.w * r4.x + 1.000000;
/*192*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*193*/	  r3.x = max(r3.x, 0.000000);
/*194*/	  r3.x = log2(r3.x);
/*195*/	  r3.x = r3.x * 10.000000;
/*196*/	  r3.x = exp2(r3.x);
/*197*/	  r3.x = r3.w * r3.x;
/*198*/	  r3.x = r3.x * r5.w + r0.w;
/*199*/	  r1.w = r1.w * abs(r2.w);
/*200*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*201*/	} else {
/*202*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*203*/	}
/*204*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*205*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*206*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*207*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*208*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*209*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*210*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*211*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*212*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*213*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*214*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*215*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*216*/	r1.w = inversesqrt(r1.w);
/*217*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*218*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*219*/	r1.w = r1.w + r1.w;
/*220*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*221*/	r4.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*222*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*223*/	r1.w = max(r1.w, 0.000000);
/*224*/	r1.w = log2(r1.w);
/*225*/	r1.w = r1.w * 10.000000;
/*226*/	r1.w = exp2(r1.w);
/*227*/	r1.w = r3.w * r1.w;
/*228*/	r0.w = r1.w * r5.w + r0.w;
/*229*/	r2.xyz = (r4.xyzx * r0.wwww).xyz;
/*230*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*231*/	color0.w = 2.000000;
/*232*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*233*/	r0.w = 1.000000;
/*234*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*235*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*236*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*237*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*238*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*239*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*240*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*241*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*242*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*243*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*244*/	if(r0.x != 0) discard;
/*245*/	color1.x = 1.000000;
/*246*/	return;
}
