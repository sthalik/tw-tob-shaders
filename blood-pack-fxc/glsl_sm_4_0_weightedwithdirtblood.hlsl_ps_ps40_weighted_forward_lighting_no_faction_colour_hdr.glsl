//
//
// Shader Model 4
// Fragment Shader
//
// id: 2751 - fxc/glsl_SM_4_0_weightedwithdirtblood.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r2.z = sqrt(r0.w);
/*11*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r1.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*13*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*14*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*15*/	r0.w = r3.w * r4.w;
/*16*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*17*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*19*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*20*/	r1.x = inversesqrt(r1.x);
/*21*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*22*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*23*/	if(r1.w != 0) discard;
/*24*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*26*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*27*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*28*/	r1.w = saturate(-r1.w + r2.w);
/*29*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*30*/	if(floatBitsToUint(r1.w) != 0u) {
/*31*/	  r1.w = -r2.w + 1.000000;
/*32*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*33*/	  r1.w = -r1.w + 1.000000;
/*34*/	  r1.w = -r1.w * r1.w + 1.000000;
/*35*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*36*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*37*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*38*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*39*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*40*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*41*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*42*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*43*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*44*/	} else {
/*45*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*48*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*49*/	}
/*50*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*51*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*52*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*53*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*54*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*55*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*56*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*57*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*58*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*59*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*60*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*61*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*64*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*67*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*70*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*71*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*72*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*73*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*74*/	r1.w = inversesqrt(r1.w);
/*75*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*76*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*77*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*78*/	r1.w = inversesqrt(r1.w);
/*79*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*80*/	r1.w = -r3.x + 1.000000;
/*81*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*82*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*83*/	r4.x = r4.x + r4.x;
/*84*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*85*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*86*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*87*/	r4.w = cos((r6.x));
/*88*/	r4.w = inversesqrt(r4.w);
/*89*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*90*/	r5.w = saturate(r0.w * 60.000000);
/*91*/	r5.w = -r0.w + r5.w;
/*92*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*93*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*94*/	r7.x = inversesqrt(r7.x);
/*95*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*96*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*97*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*98*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*99*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*100*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*101*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*102*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*103*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*104*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*105*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*106*/	r5.y = -r0.w + 1.000000;
/*107*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*108*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*109*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*110*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*111*/	  r5.y = max(r5.y, 0.000000);
/*112*/	  r5.y = log2(r5.y);
/*113*/	  r5.y = r5.y * 10.000000;
/*114*/	  r5.y = exp2(r5.y);
/*115*/	  r5.y = r4.w * r5.y;
/*116*/	  r5.y = r5.y * r5.w + r0.w;
/*117*/	  r7.x = r1.w * 8.000000;
/*118*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*119*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*120*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*121*/	}
/*122*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*123*/	r7.x = max(r5.y, 0.000000);
/*124*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*125*/	if(floatBitsToUint(r5.y) != 0u) {
/*126*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*127*/	  r4.x = max(r4.x, -1.000000);
/*128*/	  r4.x = min(r4.x, 1.000000);
/*129*/	  r4.y = -abs(r4.x) + 1.000000;
/*130*/	  r4.y = sqrt(r4.y);
/*131*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*132*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*133*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*134*/	  r5.y = r4.y * r4.z;
/*135*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*136*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*137*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*138*/	  r4.x = r4.z * r4.y + r4.x;
/*139*/	  r3.x = r3.x * r3.x;
/*140*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*141*/	  r2.w = r3.x * r2.w + r5.x;
/*142*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*143*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*144*/	  r3.x = -r2.w * r2.w + 1.000000;
/*145*/	  r3.x = max(r3.x, 0.001000);
/*146*/	  r3.x = log2(r3.x);
/*147*/	  r4.y = r3.x * 4.950617;
/*148*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*149*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*150*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*151*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*152*/	  r2.w = floatBitsToInt(r2.w);
/*153*/	  r4.y = r3.x * r3.x + -r4.y;
/*154*/	  r4.y = sqrt(r4.y);
/*155*/	  r3.x = -r3.x + r4.y;
/*156*/	  r3.x = max(r3.x, 0.000000);
/*157*/	  r3.x = sqrt(r3.x);
/*158*/	  r2.w = r2.w * r3.x;
/*159*/	  r2.w = r2.w * 1.414214;
/*160*/	  r2.w = 0.008727 / r2.w;
/*161*/	  r2.w = max(r2.w, 0.000100);
/*162*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*163*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*164*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*165*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*166*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*167*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*168*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*169*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*170*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*171*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*172*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*173*/	  r2.w = floatBitsToInt(r2.w);
/*174*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*175*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*176*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*177*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*178*/	  r2.w = r2.w * r4.x + 1.000000;
/*179*/	  r2.w = r2.w * 0.500000;
/*180*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*181*/	  r3.x = r3.x * r4.y + 1.000000;
/*182*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*183*/	  r3.x = min(r7.x, 1.000000);
/*184*/	  r1.w = r1.w * 1.570796;
/*185*/	  r1.w = sin(r1.w);
/*186*/	  r3.x = r3.x + -1.000000;
/*187*/	  r1.w = r1.w * r3.x + 1.000000;
/*188*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*189*/	  r3.x = max(r3.x, 0.000000);
/*190*/	  r3.x = log2(r3.x);
/*191*/	  r3.x = r3.x * 10.000000;
/*192*/	  r3.x = exp2(r3.x);
/*193*/	  r3.x = r4.w * r3.x;
/*194*/	  r3.x = r3.x * r5.w + r0.w;
/*195*/	  r1.w = r1.w * abs(r2.w);
/*196*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*197*/	} else {
/*198*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*199*/	}
/*200*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*201*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*202*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*203*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*204*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*205*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*206*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*207*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*208*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*209*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*210*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*211*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*212*/	r1.w = inversesqrt(r1.w);
/*213*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*214*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*215*/	r1.w = r1.w + r1.w;
/*216*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*217*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*218*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*219*/	r1.x = max(r1.x, 0.000000);
/*220*/	r1.x = log2(r1.x);
/*221*/	r1.x = r1.x * 10.000000;
/*222*/	r1.x = exp2(r1.x);
/*223*/	r1.x = r4.w * r1.x;
/*224*/	r0.w = r1.x * r5.w + r0.w;
/*225*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*226*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*227*/	color0.w = 2.000000;
/*228*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*229*/	r0.w = 1.000000;
/*230*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*231*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*232*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*233*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*234*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*235*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*236*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*237*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*238*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*239*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*240*/	if(r0.x != 0) discard;
/*241*/	color1.x = 1.000000;
/*242*/	return;
}
