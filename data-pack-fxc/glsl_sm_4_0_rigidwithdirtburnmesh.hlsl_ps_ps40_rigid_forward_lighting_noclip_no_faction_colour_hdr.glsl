//
//
// Shader Model 4
// Fragment Shader
//
// id: 1298 - fxc/glsl_SM_4_0_rigidwithdirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*20*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.yyyz).zw;
/*21*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*22*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*23*/	r1.w = r4.w * r5.w;
/*24*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*25*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*26*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*27*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*28*/	r2.w = inversesqrt(r2.w);
/*29*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*30*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*31*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*32*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*33*/	r4.x = 0;
/*34*/	r4.y = cb0.data[26].x * 0.050000;
/*35*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*36*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*37*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*38*/	r1.w = saturate(r4.x * 5.000000);
/*39*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*40*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*41*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*42*/	r2.w = log2(r5.z);
/*43*/	r2.w = r2.w * 1.800000;
/*44*/	r2.w = exp2(r2.w);
/*45*/	r2.w = r2.w * 10.000000;
/*46*/	r2.w = min(r2.w, 1.000000);
/*47*/	r1.w = r1.w + r2.w;
/*48*/	r1.w = r1.w * 0.500000;
/*49*/	r2.w = -r5.w + 1.000000;
/*50*/	r2.w = log2(r2.w);
/*51*/	r2.w = r2.w * vsOut_T7.x;
/*52*/	r2.w = exp2(r2.w);
/*53*/	r2.w = min(r2.w, 1.000000);
/*54*/	r2.w = r2.w * vsOut_T7.x;
/*55*/	r3.z = r5.z * 0.250000;
/*56*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*57*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*58*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*59*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*60*/	r1.w = vsOut_T7.x + -0.025000;
/*61*/	r1.w = max(r1.w, 0.000000);
/*62*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*63*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*64*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*67*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*70*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*73*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*74*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*75*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*76*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*79*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*80*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*81*/	if(floatBitsToUint(r0.w) != 0u) {
/*82*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*83*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*84*/	  r0.w = r3.w * cb0.data[26].x;
/*85*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*86*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*87*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*88*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*89*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*90*/	}
/*91*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*92*/	if(floatBitsToUint(r0.w) != 0u) {
/*93*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*94*/	  if(floatBitsToUint(r0.w) != 0u) {
/*95*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*96*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*97*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*98*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*99*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*100*/	    r0.w = -r0.w + 1.000000;
/*101*/	    r0.w = max(r0.w, 0.000000);
/*102*/	    r8.z = sqrt(r0.w);
/*103*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*104*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*105*/	    r0.w = inversesqrt(r0.w);
/*106*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*107*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*108*/	    r10.y = -1.000000;
/*109*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*110*/	    r0.w = inversesqrt(r0.w);
/*111*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*112*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*113*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*114*/	    r1.w = r1.w * 1.250000;
/*115*/	    r1.w = min(r1.w, 1.000000);
/*116*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*117*/	    r2.w = r2.w * 4.000000;
/*118*/	    r1.w = r1.w * 0.200000 + r2.w;
/*119*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*120*/	    r0.w = r0.w + -r1.w;
/*121*/	    r0.w = saturate(r0.w * 200.000000);
/*122*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*123*/	    r0.w = r0.w * r0.w;
/*124*/	    r0.w = r0.w * r1.w;
/*125*/	    r3.x = r0.w * -r3.x + r3.x;
/*126*/	    r1.w = -r3.y + 0.200000;
/*127*/	    r3.y = r0.w * r1.w + r3.y;
/*128*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*129*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*130*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*131*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*132*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*133*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*134*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*135*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*136*/	    r1.w = -r1.w + 1.000000;
/*137*/	    r1.w = max(r1.w, 0.000000);
/*138*/	    r7.z = sqrt(r1.w);
/*139*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*140*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*141*/	    r1.w = sqrt(r1.w);
/*142*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*143*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*144*/	    r1.w = inversesqrt(r1.w);
/*145*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*146*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*147*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*148*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*149*/	    r1.w = -r0.y + 1.000000;
/*150*/	    r0.w = min(r0.w, r1.w);
/*151*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*152*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*153*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*154*/	    r0.w = inversesqrt(r0.w);
/*155*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*156*/	  }
/*157*/	}
/*158*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*159*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*160*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*161*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*162*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*163*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*164*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*165*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*166*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*167*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*168*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*169*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*170*/	r1.w = inversesqrt(r1.w);
/*171*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*172*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*173*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*174*/	r1.w = inversesqrt(r1.w);
/*175*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*176*/	r1.w = -r3.x + 1.000000;
/*177*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*178*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*179*/	r4.x = r4.x + r4.x;
/*180*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*181*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*182*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*183*/	r4.w = cos((r6.x));
/*184*/	r4.w = inversesqrt(r4.w);
/*185*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*186*/	r5.w = saturate(r0.w * 60.000000);
/*187*/	r5.w = -r0.w + r5.w;
/*188*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*189*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*190*/	r7.x = inversesqrt(r7.x);
/*191*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*192*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*193*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*194*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*195*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*196*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*197*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*198*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*199*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*200*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*201*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*202*/	r5.y = -r0.w + 1.000000;
/*203*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*204*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*205*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*206*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*207*/	  r5.y = max(r5.y, 0.000000);
/*208*/	  r5.y = log2(r5.y);
/*209*/	  r5.y = r5.y * 10.000000;
/*210*/	  r5.y = exp2(r5.y);
/*211*/	  r5.y = r4.w * r5.y;
/*212*/	  r5.y = r5.y * r5.w + r0.w;
/*213*/	  r7.x = r1.w * 8.000000;
/*214*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*215*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*216*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*217*/	}
/*218*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*219*/	r7.x = max(r5.y, 0.000000);
/*220*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*221*/	if(floatBitsToUint(r5.y) != 0u) {
/*222*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*223*/	  r4.x = max(r4.x, -1.000000);
/*224*/	  r4.x = min(r4.x, 1.000000);
/*225*/	  r4.y = -abs(r4.x) + 1.000000;
/*226*/	  r4.y = sqrt(r4.y);
/*227*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*228*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*229*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*230*/	  r5.y = r4.y * r4.z;
/*231*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*232*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*233*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*234*/	  r4.x = r4.z * r4.y + r4.x;
/*235*/	  r3.x = r3.x * r3.x;
/*236*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*237*/	  r2.w = r3.x * r2.w + r5.x;
/*238*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*239*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*240*/	  r3.x = -r2.w * r2.w + 1.000000;
/*241*/	  r3.x = max(r3.x, 0.001000);
/*242*/	  r3.x = log2(r3.x);
/*243*/	  r4.y = r3.x * 4.950617;
/*244*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*245*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*246*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*247*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*248*/	  r2.w = floatBitsToInt(r2.w);
/*249*/	  r4.y = r3.x * r3.x + -r4.y;
/*250*/	  r4.y = sqrt(r4.y);
/*251*/	  r3.x = -r3.x + r4.y;
/*252*/	  r3.x = max(r3.x, 0.000000);
/*253*/	  r3.x = sqrt(r3.x);
/*254*/	  r2.w = r2.w * r3.x;
/*255*/	  r2.w = r2.w * 1.414214;
/*256*/	  r2.w = 0.008727 / r2.w;
/*257*/	  r2.w = max(r2.w, 0.000100);
/*258*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*259*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*260*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*261*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*262*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*263*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*264*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*265*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*266*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*267*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*268*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*269*/	  r2.w = floatBitsToInt(r2.w);
/*270*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*271*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*272*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*273*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*274*/	  r2.w = r2.w * r4.x + 1.000000;
/*275*/	  r2.w = r2.w * 0.500000;
/*276*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*277*/	  r3.x = r3.x * r4.y + 1.000000;
/*278*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*279*/	  r3.x = min(r7.x, 1.000000);
/*280*/	  r1.w = r1.w * 1.570796;
/*281*/	  r1.w = sin(r1.w);
/*282*/	  r3.x = r3.x + -1.000000;
/*283*/	  r1.w = r1.w * r3.x + 1.000000;
/*284*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*285*/	  r3.x = max(r3.x, 0.000000);
/*286*/	  r3.x = log2(r3.x);
/*287*/	  r3.x = r3.x * 10.000000;
/*288*/	  r3.x = exp2(r3.x);
/*289*/	  r3.x = r4.w * r3.x;
/*290*/	  r3.x = r3.x * r5.w + r0.w;
/*291*/	  r1.w = r1.w * abs(r2.w);
/*292*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*293*/	} else {
/*294*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*295*/	}
/*296*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*297*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*298*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*299*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*300*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*301*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*302*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*303*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*304*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*305*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*306*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*307*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*308*/	r1.w = inversesqrt(r1.w);
/*309*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*310*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*311*/	r1.w = r1.w + r1.w;
/*312*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*313*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*314*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*315*/	r0.x = max(r0.x, 0.000000);
/*316*/	r0.x = log2(r0.x);
/*317*/	r0.x = r0.x * 10.000000;
/*318*/	r0.x = exp2(r0.x);
/*319*/	r0.x = r4.w * r0.x;
/*320*/	r0.x = r0.x * r5.w + r0.w;
/*321*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*322*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*323*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*324*/	r0.w = 1.000000;
/*325*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*326*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*327*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*328*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*329*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*330*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*331*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*332*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*333*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*334*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*335*/	if(r0.x != 0) discard;
/*336*/	color1.x = 1.000000;
/*337*/	return;
}
