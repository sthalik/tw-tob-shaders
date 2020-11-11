//
//
// Shader Model 4
// Fragment Shader
//
// id: 768 - fxc/glsl_SM_4_0_rigidstandardblood.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*7*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*8*/	r0.y = r1.w + -0.500000;
/*9*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*10*/	if(r0.y != 0) discard;
/*11*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*12*/	color0.w = r0.x * r1.w;
/*13*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*15*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*16*/	r0.x = saturate(vsOut_N0.w);
/*17*/	r3.xyz = (r3.xyzx + -cb4.data[0].xyzx).xyz;
/*18*/	r3.xyz = (r0.xxxx * r3.xyzx + cb4.data[0].xyzx).xyz;
/*19*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*20*/	r4.xyz = (r4.xyzx + -cb4.data[1].xyzx).xyz;
/*21*/	r4.xyz = (r0.xxxx * r4.xyzx + cb4.data[1].xyzx).xyz;
/*22*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*23*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*24*/	r0.xyw = (r0.xxxx * r5.xyxz + cb4.data[2].xyxz).xyw;
/*25*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*27*/	r3.xyz = (r4.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r2.yyyy * r3.xyzx + r1.xyzx).xyz;
/*29*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*30*/	r0.xyw = (r2.zzzz * r0.xyxw + r1.xyxz).xyw;
/*31*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*33*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*34*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*35*/	r1.w = -r1.w + 1.000000;
/*36*/	r1.w = max(r1.w, 0.000000);
/*37*/	r1.z = sqrt(r1.w);
/*38*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*39*/	r2.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx).xy;
/*40*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*41*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*42*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*43*/	r1.w = saturate(-r1.w + r2.w);
/*44*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*45*/	if(floatBitsToUint(r1.w) != 0u) {
/*46*/	  r1.w = -r2.w + 1.000000;
/*47*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*48*/	  r1.w = -r1.w + 1.000000;
/*49*/	  r1.w = -r1.w * r1.w + 1.000000;
/*50*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*51*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*52*/	  r1.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*53*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*54*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*55*/	  r3.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*56*/	  r0.xyw = (r1.wwww * r3.xyxz + r2.xyxz).xyw;
/*57*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*58*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*59*/	} else {
/*60*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*62*/	}
/*63*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*64*/	r1.w = inversesqrt(r1.w);
/*65*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*66*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*69*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*72*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*73*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*74*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*75*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*78*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*79*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*80*/	if(floatBitsToUint(r0.z) != 0u) {
/*81*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*82*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*83*/	  r0.z = r3.w * cb0.data[26].x;
/*84*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*85*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*86*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*87*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*88*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*89*/	}
/*90*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*91*/	if(floatBitsToUint(r0.z) != 0u) {
/*92*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*93*/	  if(floatBitsToUint(r0.z) != 0u) {
/*94*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*95*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*96*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*97*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*98*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*99*/	    r0.z = -r0.z + 1.000000;
/*100*/	    r0.z = max(r0.z, 0.000000);
/*101*/	    r8.z = sqrt(r0.z);
/*102*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*103*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*104*/	    r0.z = inversesqrt(r0.z);
/*105*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*106*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*107*/	    r10.y = -1.000000;
/*108*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*109*/	    r0.z = inversesqrt(r0.z);
/*110*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*111*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*112*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*113*/	    r1.w = r1.w * 1.250000;
/*114*/	    r1.w = min(r1.w, 1.000000);
/*115*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*116*/	    r2.w = r2.w * 4.000000;
/*117*/	    r1.w = r1.w * 0.200000 + r2.w;
/*118*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*119*/	    r0.z = r0.z + -r1.w;
/*120*/	    r0.z = saturate(r0.z * 200.000000);
/*121*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*122*/	    r0.z = r0.z * r0.z;
/*123*/	    r0.z = r0.z * r1.w;
/*124*/	    r3.x = r0.z * -r3.x + r3.x;
/*125*/	    r1.w = -r3.y + 0.200000;
/*126*/	    r3.y = r0.z * r1.w + r3.y;
/*127*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*128*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*129*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*130*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*131*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*132*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*133*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*134*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*135*/	    r1.w = -r1.w + 1.000000;
/*136*/	    r1.w = max(r1.w, 0.000000);
/*137*/	    r7.z = sqrt(r1.w);
/*138*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*139*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*140*/	    r1.w = sqrt(r1.w);
/*141*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*142*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*143*/	    r1.w = inversesqrt(r1.w);
/*144*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*145*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*146*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*147*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*148*/	    r1.w = -r1.y + 1.000000;
/*149*/	    r0.z = min(r0.z, r1.w);
/*150*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*151*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*152*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*153*/	    r0.z = inversesqrt(r0.z);
/*154*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*155*/	  }
/*156*/	}
/*157*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*158*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*159*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*160*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*161*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*162*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*163*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*164*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*165*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*166*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*167*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*168*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*169*/	r1.w = inversesqrt(r1.w);
/*170*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*171*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*172*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*173*/	r1.w = inversesqrt(r1.w);
/*174*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*175*/	r1.w = -r3.x + 1.000000;
/*176*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*177*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*178*/	r4.x = r4.x + r4.x;
/*179*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*180*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*181*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*182*/	r4.w = cos((r6.x));
/*183*/	r4.w = inversesqrt(r4.w);
/*184*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*185*/	r5.w = saturate(r0.z * 60.000000);
/*186*/	r5.w = -r0.z + r5.w;
/*187*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*188*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*189*/	r7.x = inversesqrt(r7.x);
/*190*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*191*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*192*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*193*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*194*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*195*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*196*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*197*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*198*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*199*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*200*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*201*/	r5.y = -r0.z + 1.000000;
/*202*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*203*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*204*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*205*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*206*/	  r5.y = max(r5.y, 0.000000);
/*207*/	  r5.y = log2(r5.y);
/*208*/	  r5.y = r5.y * 10.000000;
/*209*/	  r5.y = exp2(r5.y);
/*210*/	  r5.y = r4.w * r5.y;
/*211*/	  r5.y = r5.y * r5.w + r0.z;
/*212*/	  r7.x = r1.w * 8.000000;
/*213*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*214*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*215*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*216*/	}
/*217*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*218*/	r7.x = max(r5.y, 0.000000);
/*219*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*220*/	if(floatBitsToUint(r5.y) != 0u) {
/*221*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*222*/	  r4.x = max(r4.x, -1.000000);
/*223*/	  r4.x = min(r4.x, 1.000000);
/*224*/	  r4.y = -abs(r4.x) + 1.000000;
/*225*/	  r4.y = sqrt(r4.y);
/*226*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*227*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*228*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*229*/	  r5.y = r4.y * r4.z;
/*230*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*231*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*232*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*233*/	  r4.x = r4.z * r4.y + r4.x;
/*234*/	  r3.x = r3.x * r3.x;
/*235*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*236*/	  r2.w = r3.x * r2.w + r5.x;
/*237*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*238*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*239*/	  r3.x = -r2.w * r2.w + 1.000000;
/*240*/	  r3.x = max(r3.x, 0.001000);
/*241*/	  r3.x = log2(r3.x);
/*242*/	  r4.y = r3.x * 4.950617;
/*243*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*244*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*245*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*246*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*247*/	  r2.w = floatBitsToInt(r2.w);
/*248*/	  r4.y = r3.x * r3.x + -r4.y;
/*249*/	  r4.y = sqrt(r4.y);
/*250*/	  r3.x = -r3.x + r4.y;
/*251*/	  r3.x = max(r3.x, 0.000000);
/*252*/	  r3.x = sqrt(r3.x);
/*253*/	  r2.w = r2.w * r3.x;
/*254*/	  r2.w = r2.w * 1.414214;
/*255*/	  r2.w = 0.008727 / r2.w;
/*256*/	  r2.w = max(r2.w, 0.000100);
/*257*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*258*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*259*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*260*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*261*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*262*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*263*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*264*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*265*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*266*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*267*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*268*/	  r2.w = floatBitsToInt(r2.w);
/*269*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*270*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*271*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*272*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*273*/	  r2.w = r2.w * r4.x + 1.000000;
/*274*/	  r2.w = r2.w * 0.500000;
/*275*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*276*/	  r3.x = r3.x * r4.y + 1.000000;
/*277*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*278*/	  r3.x = min(r7.x, 1.000000);
/*279*/	  r1.w = r1.w * 1.570796;
/*280*/	  r1.w = sin(r1.w);
/*281*/	  r3.x = r3.x + -1.000000;
/*282*/	  r1.w = r1.w * r3.x + 1.000000;
/*283*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*284*/	  r3.x = max(r3.x, 0.000000);
/*285*/	  r3.x = log2(r3.x);
/*286*/	  r3.x = r3.x * 10.000000;
/*287*/	  r3.x = exp2(r3.x);
/*288*/	  r3.x = r4.w * r3.x;
/*289*/	  r3.x = r3.x * r5.w + r0.z;
/*290*/	  r1.w = r1.w * abs(r2.w);
/*291*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*292*/	} else {
/*293*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*294*/	}
/*295*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*296*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*297*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*298*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*299*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*300*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*301*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*302*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*303*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*304*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*305*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*306*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*307*/	r1.w = inversesqrt(r1.w);
/*308*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*309*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*310*/	r1.w = r1.w + r1.w;
/*311*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*312*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*313*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*314*/	r1.x = max(r1.x, 0.000000);
/*315*/	r1.x = log2(r1.x);
/*316*/	r1.x = r1.x * 10.000000;
/*317*/	r1.x = exp2(r1.x);
/*318*/	r1.x = r4.w * r1.x;
/*319*/	r0.z = r1.x * r5.w + r0.z;
/*320*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*321*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*322*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*323*/	r0.w = 1.000000;
/*324*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*325*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*326*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*327*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*328*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*329*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*330*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*331*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*332*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*333*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*334*/	if(r0.x != 0) discard;
/*335*/	color1.x = 1.000000;
/*336*/	return;
}
