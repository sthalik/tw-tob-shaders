//
//
// Shader Model 4
// Fragment Shader
//
// id: 1198 - fxc/glsl_SM_4_0_rigidwithdirtmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*17*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*18*/	r0.x = saturate(vsOut_N0.w);
/*19*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb4.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb4.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb4.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb4.data[2].xyxz).xyw;
/*27*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*29*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*30*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*31*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*32*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*33*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*34*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*35*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*37*/	r1.w = -r1.w + 1.000000;
/*38*/	r1.w = max(r1.w, 0.000000);
/*39*/	r1.z = sqrt(r1.w);
/*40*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*41*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*42*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.yyyz).zw;
/*43*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*44*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*45*/	r1.w = r4.w * r5.w;
/*46*/	r4.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*47*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*48*/	r1.xy = (r3.zwzz * r4.wwww + r1.xyxx).xy;
/*49*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*50*/	r2.w = inversesqrt(r2.w);
/*51*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*52*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*53*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*54*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*55*/	r1.w = inversesqrt(r1.w);
/*56*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*57*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*60*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*61*/	r1.w = inversesqrt(r1.w);
/*62*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*63*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*64*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*65*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*66*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*69*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*70*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*71*/	if(floatBitsToUint(r0.z) != 0u) {
/*72*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*73*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*74*/	  r0.z = r3.w * cb0.data[26].x;
/*75*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*76*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*77*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*78*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*79*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*80*/	}
/*81*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r0.z) != 0u) {
/*83*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*84*/	  if(floatBitsToUint(r0.z) != 0u) {
/*85*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*86*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*87*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*88*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*89*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*90*/	    r0.z = -r0.z + 1.000000;
/*91*/	    r0.z = max(r0.z, 0.000000);
/*92*/	    r8.z = sqrt(r0.z);
/*93*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*94*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*95*/	    r0.z = inversesqrt(r0.z);
/*96*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*97*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*98*/	    r10.y = -1.000000;
/*99*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*100*/	    r0.z = inversesqrt(r0.z);
/*101*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*102*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*103*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*104*/	    r1.w = r1.w * 1.250000;
/*105*/	    r1.w = min(r1.w, 1.000000);
/*106*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*107*/	    r2.w = r2.w * 4.000000;
/*108*/	    r1.w = r1.w * 0.200000 + r2.w;
/*109*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*110*/	    r0.z = r0.z + -r1.w;
/*111*/	    r0.z = saturate(r0.z * 200.000000);
/*112*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*113*/	    r0.z = r0.z * r0.z;
/*114*/	    r0.z = r0.z * r1.w;
/*115*/	    r3.x = r0.z * -r3.x + r3.x;
/*116*/	    r1.w = -r3.y + 0.200000;
/*117*/	    r3.y = r0.z * r1.w + r3.y;
/*118*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*119*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*120*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*121*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*122*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*123*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*124*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*125*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*126*/	    r1.w = -r1.w + 1.000000;
/*127*/	    r1.w = max(r1.w, 0.000000);
/*128*/	    r7.z = sqrt(r1.w);
/*129*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*130*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*131*/	    r1.w = sqrt(r1.w);
/*132*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*133*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*134*/	    r1.w = inversesqrt(r1.w);
/*135*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*136*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*137*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*138*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*139*/	    r1.w = -r1.y + 1.000000;
/*140*/	    r0.z = min(r0.z, r1.w);
/*141*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*142*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*143*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*144*/	    r0.z = inversesqrt(r0.z);
/*145*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*146*/	  }
/*147*/	}
/*148*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*149*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*150*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*151*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*152*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*153*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*154*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*155*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*156*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*157*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*158*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*159*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*160*/	r1.w = inversesqrt(r1.w);
/*161*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*162*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*163*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*164*/	r1.w = inversesqrt(r1.w);
/*165*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*166*/	r1.w = -r3.x + 1.000000;
/*167*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*168*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*169*/	r4.x = r4.x + r4.x;
/*170*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*171*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*172*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*173*/	r4.w = cos((r6.x));
/*174*/	r4.w = inversesqrt(r4.w);
/*175*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*176*/	r5.w = saturate(r0.z * 60.000000);
/*177*/	r5.w = -r0.z + r5.w;
/*178*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*179*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*180*/	r7.x = inversesqrt(r7.x);
/*181*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*182*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*183*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*184*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*185*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*186*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*187*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*188*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*189*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*190*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*191*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*192*/	r5.y = -r0.z + 1.000000;
/*193*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*194*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*195*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*196*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*197*/	  r5.y = max(r5.y, 0.000000);
/*198*/	  r5.y = log2(r5.y);
/*199*/	  r5.y = r5.y * 10.000000;
/*200*/	  r5.y = exp2(r5.y);
/*201*/	  r5.y = r4.w * r5.y;
/*202*/	  r5.y = r5.y * r5.w + r0.z;
/*203*/	  r7.x = r1.w * 8.000000;
/*204*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*205*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*206*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*207*/	}
/*208*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*209*/	r7.x = max(r5.y, 0.000000);
/*210*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*211*/	if(floatBitsToUint(r5.y) != 0u) {
/*212*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*213*/	  r4.x = max(r4.x, -1.000000);
/*214*/	  r4.x = min(r4.x, 1.000000);
/*215*/	  r4.y = -abs(r4.x) + 1.000000;
/*216*/	  r4.y = sqrt(r4.y);
/*217*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*218*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*219*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*220*/	  r5.y = r4.y * r4.z;
/*221*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*222*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*223*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*224*/	  r4.x = r4.z * r4.y + r4.x;
/*225*/	  r3.x = r3.x * r3.x;
/*226*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*227*/	  r2.w = r3.x * r2.w + r5.x;
/*228*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*229*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*230*/	  r3.x = -r2.w * r2.w + 1.000000;
/*231*/	  r3.x = max(r3.x, 0.001000);
/*232*/	  r3.x = log2(r3.x);
/*233*/	  r4.y = r3.x * 4.950617;
/*234*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*235*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*236*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*237*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*238*/	  r2.w = floatBitsToInt(r2.w);
/*239*/	  r4.y = r3.x * r3.x + -r4.y;
/*240*/	  r4.y = sqrt(r4.y);
/*241*/	  r3.x = -r3.x + r4.y;
/*242*/	  r3.x = max(r3.x, 0.000000);
/*243*/	  r3.x = sqrt(r3.x);
/*244*/	  r2.w = r2.w * r3.x;
/*245*/	  r2.w = r2.w * 1.414214;
/*246*/	  r2.w = 0.008727 / r2.w;
/*247*/	  r2.w = max(r2.w, 0.000100);
/*248*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*249*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*250*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*251*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*252*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*253*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*254*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*255*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*256*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*257*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*258*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*259*/	  r2.w = floatBitsToInt(r2.w);
/*260*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*261*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*262*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*263*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*264*/	  r2.w = r2.w * r4.x + 1.000000;
/*265*/	  r2.w = r2.w * 0.500000;
/*266*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*267*/	  r3.x = r3.x * r4.y + 1.000000;
/*268*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*269*/	  r3.x = min(r7.x, 1.000000);
/*270*/	  r1.w = r1.w * 1.570796;
/*271*/	  r1.w = sin(r1.w);
/*272*/	  r3.x = r3.x + -1.000000;
/*273*/	  r1.w = r1.w * r3.x + 1.000000;
/*274*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*275*/	  r3.x = max(r3.x, 0.000000);
/*276*/	  r3.x = log2(r3.x);
/*277*/	  r3.x = r3.x * 10.000000;
/*278*/	  r3.x = exp2(r3.x);
/*279*/	  r3.x = r4.w * r3.x;
/*280*/	  r3.x = r3.x * r5.w + r0.z;
/*281*/	  r1.w = r1.w * abs(r2.w);
/*282*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*283*/	} else {
/*284*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*285*/	}
/*286*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*287*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*288*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*289*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*290*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*291*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*292*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*293*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*294*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*295*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*296*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*297*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*298*/	r1.w = inversesqrt(r1.w);
/*299*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*300*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*301*/	r1.w = r1.w + r1.w;
/*302*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*303*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*304*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*305*/	r1.x = max(r1.x, 0.000000);
/*306*/	r1.x = log2(r1.x);
/*307*/	r1.x = r1.x * 10.000000;
/*308*/	r1.x = exp2(r1.x);
/*309*/	r1.x = r4.w * r1.x;
/*310*/	r0.z = r1.x * r5.w + r0.z;
/*311*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*312*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*313*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*314*/	r0.w = 1.000000;
/*315*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*316*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*317*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*318*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*319*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*320*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*321*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*322*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*323*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*324*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*325*/	if(r0.x != 0) discard;
/*326*/	color1.x = 1.000000;
/*327*/	return;
}