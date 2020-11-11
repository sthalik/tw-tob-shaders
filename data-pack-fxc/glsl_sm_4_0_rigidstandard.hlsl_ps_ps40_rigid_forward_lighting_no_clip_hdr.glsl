//
//
// Shader Model 4
// Fragment Shader
//
// id: 676 - fxc/glsl_SM_4_0_rigidstandard.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C2;
flat in vec4 vsOut_N0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
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
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.x = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb3.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*13*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*14*/	r0.x = saturate(vsOut_N0.w);
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb4.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb4.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb4.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb4.data[2].xyxz).xyw;
/*23*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*25*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*27*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*28*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*29*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*33*/	r1.w = -r1.w + 1.000000;
/*34*/	r1.w = max(r1.w, 0.000000);
/*35*/	r1.z = sqrt(r1.w);
/*36*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*38*/	r1.w = inversesqrt(r1.w);
/*39*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*40*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*41*/	r1.w = inversesqrt(r1.w);
/*42*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*43*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*44*/	r1.w = inversesqrt(r1.w);
/*45*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*46*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*47*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*48*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*49*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*50*/	r1.w = inversesqrt(r1.w);
/*51*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*52*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*53*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*54*/	if(floatBitsToUint(r0.z) != 0u) {
/*55*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*56*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*57*/	  r0.z = r3.w * cb0.data[26].x;
/*58*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*59*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*60*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*61*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*62*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*63*/	}
/*64*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r0.z) != 0u) {
/*66*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*67*/	  if(floatBitsToUint(r0.z) != 0u) {
/*68*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*69*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*70*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*71*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*72*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*73*/	    r0.z = -r0.z + 1.000000;
/*74*/	    r0.z = max(r0.z, 0.000000);
/*75*/	    r8.z = sqrt(r0.z);
/*76*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*77*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*78*/	    r0.z = inversesqrt(r0.z);
/*79*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*80*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*81*/	    r10.y = -1.000000;
/*82*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*83*/	    r0.z = inversesqrt(r0.z);
/*84*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*85*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*86*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*87*/	    r1.w = r1.w * 1.250000;
/*88*/	    r1.w = min(r1.w, 1.000000);
/*89*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*90*/	    r2.w = r2.w * 4.000000;
/*91*/	    r1.w = r1.w * 0.200000 + r2.w;
/*92*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*93*/	    r0.z = r0.z + -r1.w;
/*94*/	    r0.z = saturate(r0.z * 200.000000);
/*95*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*96*/	    r0.z = r0.z * r0.z;
/*97*/	    r0.z = r0.z * r1.w;
/*98*/	    r3.x = r0.z * -r3.x + r3.x;
/*99*/	    r1.w = -r3.y + 0.200000;
/*100*/	    r3.y = r0.z * r1.w + r3.y;
/*101*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*102*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*103*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*104*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*105*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*106*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*107*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*108*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*109*/	    r1.w = -r1.w + 1.000000;
/*110*/	    r1.w = max(r1.w, 0.000000);
/*111*/	    r7.z = sqrt(r1.w);
/*112*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*113*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*114*/	    r1.w = sqrt(r1.w);
/*115*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*116*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*117*/	    r1.w = inversesqrt(r1.w);
/*118*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*119*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*120*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*121*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*122*/	    r1.w = -r1.y + 1.000000;
/*123*/	    r0.z = min(r0.z, r1.w);
/*124*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*125*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*126*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*127*/	    r0.z = inversesqrt(r0.z);
/*128*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*129*/	  }
/*130*/	}
/*131*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*132*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*133*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*134*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*135*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*136*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*137*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*138*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*139*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*140*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*141*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*142*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*143*/	r1.w = inversesqrt(r1.w);
/*144*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*145*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*146*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*147*/	r1.w = inversesqrt(r1.w);
/*148*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*149*/	r1.w = -r3.x + 1.000000;
/*150*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*151*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*152*/	r4.x = r4.x + r4.x;
/*153*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*154*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*155*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*156*/	r4.w = cos((r6.x));
/*157*/	r4.w = inversesqrt(r4.w);
/*158*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*159*/	r5.w = saturate(r0.z * 60.000000);
/*160*/	r5.w = -r0.z + r5.w;
/*161*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*162*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*163*/	r7.x = inversesqrt(r7.x);
/*164*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*165*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*166*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*167*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*168*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*169*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*170*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*171*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*172*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*173*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*174*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*175*/	r5.y = -r0.z + 1.000000;
/*176*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*177*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*178*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*179*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*180*/	  r5.y = max(r5.y, 0.000000);
/*181*/	  r5.y = log2(r5.y);
/*182*/	  r5.y = r5.y * 10.000000;
/*183*/	  r5.y = exp2(r5.y);
/*184*/	  r5.y = r4.w * r5.y;
/*185*/	  r5.y = r5.y * r5.w + r0.z;
/*186*/	  r7.x = r1.w * 8.000000;
/*187*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*188*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*189*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*190*/	}
/*191*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*192*/	r7.x = max(r5.y, 0.000000);
/*193*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*194*/	if(floatBitsToUint(r5.y) != 0u) {
/*195*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*196*/	  r4.x = max(r4.x, -1.000000);
/*197*/	  r4.x = min(r4.x, 1.000000);
/*198*/	  r4.y = -abs(r4.x) + 1.000000;
/*199*/	  r4.y = sqrt(r4.y);
/*200*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*201*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*202*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*203*/	  r5.y = r4.y * r4.z;
/*204*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*205*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*206*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*207*/	  r4.x = r4.z * r4.y + r4.x;
/*208*/	  r3.x = r3.x * r3.x;
/*209*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*210*/	  r2.w = r3.x * r2.w + r5.x;
/*211*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*212*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*213*/	  r3.x = -r2.w * r2.w + 1.000000;
/*214*/	  r3.x = max(r3.x, 0.001000);
/*215*/	  r3.x = log2(r3.x);
/*216*/	  r4.y = r3.x * 4.950617;
/*217*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*218*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*219*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*220*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*221*/	  r2.w = floatBitsToInt(r2.w);
/*222*/	  r4.y = r3.x * r3.x + -r4.y;
/*223*/	  r4.y = sqrt(r4.y);
/*224*/	  r3.x = -r3.x + r4.y;
/*225*/	  r3.x = max(r3.x, 0.000000);
/*226*/	  r3.x = sqrt(r3.x);
/*227*/	  r2.w = r2.w * r3.x;
/*228*/	  r2.w = r2.w * 1.414214;
/*229*/	  r2.w = 0.008727 / r2.w;
/*230*/	  r2.w = max(r2.w, 0.000100);
/*231*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*232*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*233*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*234*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*235*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*236*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*237*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*238*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*239*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*240*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*241*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*242*/	  r2.w = floatBitsToInt(r2.w);
/*243*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*244*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*245*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*246*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*247*/	  r2.w = r2.w * r4.x + 1.000000;
/*248*/	  r2.w = r2.w * 0.500000;
/*249*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*250*/	  r3.x = r3.x * r4.y + 1.000000;
/*251*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*252*/	  r3.x = min(r7.x, 1.000000);
/*253*/	  r1.w = r1.w * 1.570796;
/*254*/	  r1.w = sin(r1.w);
/*255*/	  r3.x = r3.x + -1.000000;
/*256*/	  r1.w = r1.w * r3.x + 1.000000;
/*257*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*258*/	  r3.x = max(r3.x, 0.000000);
/*259*/	  r3.x = log2(r3.x);
/*260*/	  r3.x = r3.x * 10.000000;
/*261*/	  r3.x = exp2(r3.x);
/*262*/	  r3.x = r4.w * r3.x;
/*263*/	  r3.x = r3.x * r5.w + r0.z;
/*264*/	  r1.w = r1.w * abs(r2.w);
/*265*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*266*/	} else {
/*267*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*268*/	}
/*269*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*270*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*271*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*272*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*273*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*274*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*275*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*276*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*277*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*278*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*279*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*280*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*281*/	r1.w = inversesqrt(r1.w);
/*282*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*283*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*284*/	r1.w = r1.w + r1.w;
/*285*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*286*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*287*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*288*/	r1.x = max(r1.x, 0.000000);
/*289*/	r1.x = log2(r1.x);
/*290*/	r1.x = r1.x * 10.000000;
/*291*/	r1.x = exp2(r1.x);
/*292*/	r1.x = r4.w * r1.x;
/*293*/	r0.z = r1.x * r5.w + r0.z;
/*294*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*295*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*296*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*297*/	r0.w = 1.000000;
/*298*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*299*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*300*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*301*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*302*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*303*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*304*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*305*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*306*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*307*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*308*/	if(r0.x != 0) discard;
/*309*/	color1.x = 1.000000;
/*310*/	return;
}
