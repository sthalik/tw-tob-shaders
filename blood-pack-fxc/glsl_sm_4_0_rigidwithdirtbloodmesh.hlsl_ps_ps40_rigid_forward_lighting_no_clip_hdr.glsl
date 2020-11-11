//
//
// Shader Model 4
// Fragment Shader
//
// id: 1247 - fxc/glsl_SM_4_0_rigidwithdirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform samplerCube s_environment;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*8*/	color0.w = r0.x * r1.w;
/*9*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*11*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*12*/	r0.x = saturate(vsOut_N0.w);
/*13*/	r3.xyz = (r3.xyzx + -cb4.data[0].xyzx).xyz;
/*14*/	r3.xyz = (r0.xxxx * r3.xyzx + cb4.data[0].xyzx).xyz;
/*15*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*16*/	r4.xyz = (r4.xyzx + -cb4.data[1].xyzx).xyz;
/*17*/	r4.xyz = (r0.xxxx * r4.xyzx + cb4.data[1].xyzx).xyz;
/*18*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*19*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*20*/	r0.xyw = (r0.xxxx * r5.xyxz + cb4.data[2].xyxz).xyw;
/*21*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*22*/	r1.xyz = (r2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*23*/	r3.xyz = (r4.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r2.yyyy * r3.xyzx + r1.xyzx).xyz;
/*25*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*26*/	r0.xyw = (r2.zzzz * r0.xyxw + r1.xyxz).xyw;
/*27*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*29*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*31*/	r1.w = -r1.w + 1.000000;
/*32*/	r1.w = max(r1.w, 0.000000);
/*33*/	r1.z = sqrt(r1.w);
/*34*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*35*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*36*/	r2.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx).xy;
/*37*/	r3.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*38*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*39*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*40*/	r1.w = r2.w * r3.w;
/*41*/	r4.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*42*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*43*/	r1.xy = (r3.xyxx * r2.wwww + r1.xyxx).xy;
/*44*/	r2.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*45*/	r2.z = inversesqrt(r2.z);
/*46*/	r1.xyz = (r1.xyzx * r2.zzzz).xyz;
/*47*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*48*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*49*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*50*/	r2.x = saturate(-r2.x + r2.w);
/*51*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*52*/	if(floatBitsToUint(r2.x) != 0u) {
/*53*/	  r2.x = -r2.w + 1.000000;
/*54*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*55*/	  r2.x = -r2.x + 1.000000;
/*56*/	  r2.x = -r2.x * r2.x + 1.000000;
/*57*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*58*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*59*/	  r2.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*60*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*61*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*62*/	  r3.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*63*/	  r0.xyw = (r2.wwww * r3.xyxz + r2.xyxz).xyw;
/*64*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*65*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*66*/	} else {
/*67*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*68*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*69*/	  r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*70*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*71*/	}
/*72*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*75*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*78*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*81*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*82*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*83*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*84*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*87*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*88*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*89*/	if(floatBitsToUint(r0.z) != 0u) {
/*90*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*91*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*92*/	  r0.z = r3.w * cb0.data[26].x;
/*93*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*94*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*95*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*96*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*97*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*98*/	}
/*99*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*100*/	if(floatBitsToUint(r0.z) != 0u) {
/*101*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*102*/	  if(floatBitsToUint(r0.z) != 0u) {
/*103*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*104*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*105*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*106*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*107*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*108*/	    r0.z = -r0.z + 1.000000;
/*109*/	    r0.z = max(r0.z, 0.000000);
/*110*/	    r8.z = sqrt(r0.z);
/*111*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*112*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*113*/	    r0.z = inversesqrt(r0.z);
/*114*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*115*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*116*/	    r10.y = -1.000000;
/*117*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*118*/	    r0.z = inversesqrt(r0.z);
/*119*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*120*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*121*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*122*/	    r1.w = r1.w * 1.250000;
/*123*/	    r1.w = min(r1.w, 1.000000);
/*124*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*125*/	    r2.w = r2.w * 4.000000;
/*126*/	    r1.w = r1.w * 0.200000 + r2.w;
/*127*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*128*/	    r0.z = r0.z + -r1.w;
/*129*/	    r0.z = saturate(r0.z * 200.000000);
/*130*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*131*/	    r0.z = r0.z * r0.z;
/*132*/	    r0.z = r0.z * r1.w;
/*133*/	    r3.x = r0.z * -r3.x + r3.x;
/*134*/	    r1.w = -r3.y + 0.200000;
/*135*/	    r3.y = r0.z * r1.w + r3.y;
/*136*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*137*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*138*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*139*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*140*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*141*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*142*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*143*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*144*/	    r1.w = -r1.w + 1.000000;
/*145*/	    r1.w = max(r1.w, 0.000000);
/*146*/	    r7.z = sqrt(r1.w);
/*147*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*148*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*149*/	    r1.w = sqrt(r1.w);
/*150*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*151*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*152*/	    r1.w = inversesqrt(r1.w);
/*153*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*154*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*155*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*156*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*157*/	    r1.w = -r1.y + 1.000000;
/*158*/	    r0.z = min(r0.z, r1.w);
/*159*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*160*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*161*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*162*/	    r0.z = inversesqrt(r0.z);
/*163*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*164*/	  }
/*165*/	}
/*166*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*167*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*168*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*169*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*170*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*171*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*172*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*173*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*174*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*175*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*176*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*177*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*178*/	r1.w = inversesqrt(r1.w);
/*179*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*180*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*181*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*182*/	r1.w = inversesqrt(r1.w);
/*183*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*184*/	r1.w = -r3.x + 1.000000;
/*185*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*186*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*187*/	r4.x = r4.x + r4.x;
/*188*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*189*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*190*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*191*/	r4.w = cos((r6.x));
/*192*/	r4.w = inversesqrt(r4.w);
/*193*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*194*/	r5.w = saturate(r0.z * 60.000000);
/*195*/	r5.w = -r0.z + r5.w;
/*196*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*197*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*198*/	r7.x = inversesqrt(r7.x);
/*199*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*200*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*201*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*202*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*203*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*204*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*205*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*206*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*207*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*208*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*209*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*210*/	r5.y = -r0.z + 1.000000;
/*211*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*212*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*213*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*214*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*215*/	  r5.y = max(r5.y, 0.000000);
/*216*/	  r5.y = log2(r5.y);
/*217*/	  r5.y = r5.y * 10.000000;
/*218*/	  r5.y = exp2(r5.y);
/*219*/	  r5.y = r4.w * r5.y;
/*220*/	  r5.y = r5.y * r5.w + r0.z;
/*221*/	  r7.x = r1.w * 8.000000;
/*222*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*223*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*224*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*225*/	}
/*226*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*227*/	r7.x = max(r5.y, 0.000000);
/*228*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*229*/	if(floatBitsToUint(r5.y) != 0u) {
/*230*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*231*/	  r4.x = max(r4.x, -1.000000);
/*232*/	  r4.x = min(r4.x, 1.000000);
/*233*/	  r4.y = -abs(r4.x) + 1.000000;
/*234*/	  r4.y = sqrt(r4.y);
/*235*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*236*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*237*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*238*/	  r5.y = r4.y * r4.z;
/*239*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*240*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*241*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*242*/	  r4.x = r4.z * r4.y + r4.x;
/*243*/	  r3.x = r3.x * r3.x;
/*244*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*245*/	  r2.w = r3.x * r2.w + r5.x;
/*246*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*247*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*248*/	  r3.x = -r2.w * r2.w + 1.000000;
/*249*/	  r3.x = max(r3.x, 0.001000);
/*250*/	  r3.x = log2(r3.x);
/*251*/	  r4.y = r3.x * 4.950617;
/*252*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*253*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*254*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*255*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*256*/	  r2.w = floatBitsToInt(r2.w);
/*257*/	  r4.y = r3.x * r3.x + -r4.y;
/*258*/	  r4.y = sqrt(r4.y);
/*259*/	  r3.x = -r3.x + r4.y;
/*260*/	  r3.x = max(r3.x, 0.000000);
/*261*/	  r3.x = sqrt(r3.x);
/*262*/	  r2.w = r2.w * r3.x;
/*263*/	  r2.w = r2.w * 1.414214;
/*264*/	  r2.w = 0.008727 / r2.w;
/*265*/	  r2.w = max(r2.w, 0.000100);
/*266*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*267*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*268*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*269*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*270*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*271*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*272*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*273*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*274*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*275*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*276*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*277*/	  r2.w = floatBitsToInt(r2.w);
/*278*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*279*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*280*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*281*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*282*/	  r2.w = r2.w * r4.x + 1.000000;
/*283*/	  r2.w = r2.w * 0.500000;
/*284*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*285*/	  r3.x = r3.x * r4.y + 1.000000;
/*286*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*287*/	  r3.x = min(r7.x, 1.000000);
/*288*/	  r1.w = r1.w * 1.570796;
/*289*/	  r1.w = sin(r1.w);
/*290*/	  r3.x = r3.x + -1.000000;
/*291*/	  r1.w = r1.w * r3.x + 1.000000;
/*292*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*293*/	  r3.x = max(r3.x, 0.000000);
/*294*/	  r3.x = log2(r3.x);
/*295*/	  r3.x = r3.x * 10.000000;
/*296*/	  r3.x = exp2(r3.x);
/*297*/	  r3.x = r4.w * r3.x;
/*298*/	  r3.x = r3.x * r5.w + r0.z;
/*299*/	  r1.w = r1.w * abs(r2.w);
/*300*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*301*/	} else {
/*302*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*303*/	}
/*304*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*305*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*306*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*307*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*308*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*309*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*310*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*311*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*312*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*313*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*314*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*315*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*316*/	r1.w = inversesqrt(r1.w);
/*317*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*318*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*319*/	r1.w = r1.w + r1.w;
/*320*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*321*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*322*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*323*/	r1.x = max(r1.x, 0.000000);
/*324*/	r1.x = log2(r1.x);
/*325*/	r1.x = r1.x * 10.000000;
/*326*/	r1.x = exp2(r1.x);
/*327*/	r1.x = r4.w * r1.x;
/*328*/	r0.z = r1.x * r5.w + r0.z;
/*329*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*330*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*331*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*332*/	r0.w = 1.000000;
/*333*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*334*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*335*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*336*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*337*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*338*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*339*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*340*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*341*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*342*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*343*/	if(r0.x != 0) discard;
/*344*/	color1.x = 1.000000;
/*345*/	return;
}
