//
//
// Shader Model 4
// Fragment Shader
//
// id: 1296 - fxc/glsl_SM_4_0_rigidwithdirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*24*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.yyyz).zw;
/*25*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*26*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*27*/	r1.w = r4.w * r5.w;
/*28*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*29*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*30*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*31*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*32*/	r2.w = inversesqrt(r2.w);
/*33*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*34*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*35*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*36*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*37*/	r4.x = 0;
/*38*/	r4.y = cb0.data[26].x * 0.050000;
/*39*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*40*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*41*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*42*/	r1.w = saturate(r4.x * 5.000000);
/*43*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*44*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*46*/	r2.w = log2(r5.z);
/*47*/	r2.w = r2.w * 1.800000;
/*48*/	r2.w = exp2(r2.w);
/*49*/	r2.w = r2.w * 10.000000;
/*50*/	r2.w = min(r2.w, 1.000000);
/*51*/	r1.w = r1.w + r2.w;
/*52*/	r1.w = r1.w * 0.500000;
/*53*/	r2.w = -r5.w + 1.000000;
/*54*/	r2.w = log2(r2.w);
/*55*/	r2.w = r2.w * vsOut_T7.x;
/*56*/	r2.w = exp2(r2.w);
/*57*/	r2.w = min(r2.w, 1.000000);
/*58*/	r2.w = r2.w * vsOut_T7.x;
/*59*/	r3.z = r5.z * 0.250000;
/*60*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*61*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*62*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*63*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*64*/	r1.w = vsOut_T7.x + -0.025000;
/*65*/	r1.w = max(r1.w, 0.000000);
/*66*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*67*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*68*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*71*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*74*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*77*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*78*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*79*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*80*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*81*/	r1.w = inversesqrt(r1.w);
/*82*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*83*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*84*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*85*/	if(floatBitsToUint(r0.w) != 0u) {
/*86*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*87*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*88*/	  r0.w = r3.w * cb0.data[26].x;
/*89*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*90*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*91*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*92*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*93*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*94*/	}
/*95*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*96*/	if(floatBitsToUint(r0.w) != 0u) {
/*97*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*98*/	  if(floatBitsToUint(r0.w) != 0u) {
/*99*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*100*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*101*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*102*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*103*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*104*/	    r0.w = -r0.w + 1.000000;
/*105*/	    r0.w = max(r0.w, 0.000000);
/*106*/	    r8.z = sqrt(r0.w);
/*107*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*108*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*109*/	    r0.w = inversesqrt(r0.w);
/*110*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*111*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*112*/	    r10.y = -1.000000;
/*113*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*114*/	    r0.w = inversesqrt(r0.w);
/*115*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*116*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*117*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*118*/	    r1.w = r1.w * 1.250000;
/*119*/	    r1.w = min(r1.w, 1.000000);
/*120*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*121*/	    r2.w = r2.w * 4.000000;
/*122*/	    r1.w = r1.w * 0.200000 + r2.w;
/*123*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*124*/	    r0.w = r0.w + -r1.w;
/*125*/	    r0.w = saturate(r0.w * 200.000000);
/*126*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*127*/	    r0.w = r0.w * r0.w;
/*128*/	    r0.w = r0.w * r1.w;
/*129*/	    r3.x = r0.w * -r3.x + r3.x;
/*130*/	    r1.w = -r3.y + 0.200000;
/*131*/	    r3.y = r0.w * r1.w + r3.y;
/*132*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*133*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*134*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*135*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*136*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*137*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*138*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*139*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*140*/	    r1.w = -r1.w + 1.000000;
/*141*/	    r1.w = max(r1.w, 0.000000);
/*142*/	    r7.z = sqrt(r1.w);
/*143*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*144*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*145*/	    r1.w = sqrt(r1.w);
/*146*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*147*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*148*/	    r1.w = inversesqrt(r1.w);
/*149*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*150*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*151*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*152*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*153*/	    r1.w = -r0.y + 1.000000;
/*154*/	    r0.w = min(r0.w, r1.w);
/*155*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*156*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*157*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*158*/	    r0.w = inversesqrt(r0.w);
/*159*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*160*/	  }
/*161*/	}
/*162*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*163*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*164*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*165*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*166*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*167*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*168*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*169*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*170*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*171*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*172*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*173*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*174*/	r1.w = inversesqrt(r1.w);
/*175*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*176*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*177*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*178*/	r1.w = inversesqrt(r1.w);
/*179*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*180*/	r1.w = -r3.x + 1.000000;
/*181*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*182*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*183*/	r4.x = r4.x + r4.x;
/*184*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*185*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*186*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*187*/	r4.w = cos((r6.x));
/*188*/	r4.w = inversesqrt(r4.w);
/*189*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*190*/	r5.w = saturate(r0.w * 60.000000);
/*191*/	r5.w = -r0.w + r5.w;
/*192*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*193*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*194*/	r7.x = inversesqrt(r7.x);
/*195*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*196*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*197*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*198*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*199*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*200*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*201*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*202*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*203*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*204*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*205*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*206*/	r5.y = -r0.w + 1.000000;
/*207*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*208*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*209*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*210*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*211*/	  r5.y = max(r5.y, 0.000000);
/*212*/	  r5.y = log2(r5.y);
/*213*/	  r5.y = r5.y * 10.000000;
/*214*/	  r5.y = exp2(r5.y);
/*215*/	  r5.y = r4.w * r5.y;
/*216*/	  r5.y = r5.y * r5.w + r0.w;
/*217*/	  r7.x = r1.w * 8.000000;
/*218*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*219*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*220*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*221*/	}
/*222*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*223*/	r7.x = max(r5.y, 0.000000);
/*224*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*225*/	if(floatBitsToUint(r5.y) != 0u) {
/*226*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*227*/	  r4.x = max(r4.x, -1.000000);
/*228*/	  r4.x = min(r4.x, 1.000000);
/*229*/	  r4.y = -abs(r4.x) + 1.000000;
/*230*/	  r4.y = sqrt(r4.y);
/*231*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*232*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*233*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*234*/	  r5.y = r4.y * r4.z;
/*235*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*236*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*237*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*238*/	  r4.x = r4.z * r4.y + r4.x;
/*239*/	  r3.x = r3.x * r3.x;
/*240*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*241*/	  r2.w = r3.x * r2.w + r5.x;
/*242*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*243*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*244*/	  r3.x = -r2.w * r2.w + 1.000000;
/*245*/	  r3.x = max(r3.x, 0.001000);
/*246*/	  r3.x = log2(r3.x);
/*247*/	  r4.y = r3.x * 4.950617;
/*248*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*249*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*250*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*251*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*252*/	  r2.w = floatBitsToInt(r2.w);
/*253*/	  r4.y = r3.x * r3.x + -r4.y;
/*254*/	  r4.y = sqrt(r4.y);
/*255*/	  r3.x = -r3.x + r4.y;
/*256*/	  r3.x = max(r3.x, 0.000000);
/*257*/	  r3.x = sqrt(r3.x);
/*258*/	  r2.w = r2.w * r3.x;
/*259*/	  r2.w = r2.w * 1.414214;
/*260*/	  r2.w = 0.008727 / r2.w;
/*261*/	  r2.w = max(r2.w, 0.000100);
/*262*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*263*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*264*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*265*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*266*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*267*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*268*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*269*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*270*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*271*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*272*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*273*/	  r2.w = floatBitsToInt(r2.w);
/*274*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*275*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*276*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*277*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*278*/	  r2.w = r2.w * r4.x + 1.000000;
/*279*/	  r2.w = r2.w * 0.500000;
/*280*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*281*/	  r3.x = r3.x * r4.y + 1.000000;
/*282*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*283*/	  r3.x = min(r7.x, 1.000000);
/*284*/	  r1.w = r1.w * 1.570796;
/*285*/	  r1.w = sin(r1.w);
/*286*/	  r3.x = r3.x + -1.000000;
/*287*/	  r1.w = r1.w * r3.x + 1.000000;
/*288*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*289*/	  r3.x = max(r3.x, 0.000000);
/*290*/	  r3.x = log2(r3.x);
/*291*/	  r3.x = r3.x * 10.000000;
/*292*/	  r3.x = exp2(r3.x);
/*293*/	  r3.x = r4.w * r3.x;
/*294*/	  r3.x = r3.x * r5.w + r0.w;
/*295*/	  r1.w = r1.w * abs(r2.w);
/*296*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*297*/	} else {
/*298*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*299*/	}
/*300*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*301*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*302*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*303*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*304*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*305*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*306*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*307*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*308*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*309*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*310*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*311*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*312*/	r1.w = inversesqrt(r1.w);
/*313*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*314*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*315*/	r1.w = r1.w + r1.w;
/*316*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*317*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*318*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*319*/	r0.x = max(r0.x, 0.000000);
/*320*/	r0.x = log2(r0.x);
/*321*/	r0.x = r0.x * 10.000000;
/*322*/	r0.x = exp2(r0.x);
/*323*/	r0.x = r4.w * r0.x;
/*324*/	r0.x = r0.x * r5.w + r0.w;
/*325*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*326*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*327*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*328*/	r0.w = 1.000000;
/*329*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*330*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*331*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*332*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*333*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*334*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*335*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*336*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*337*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*338*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*339*/	if(r0.x != 0) discard;
/*340*/	color1.x = 1.000000;
/*341*/	return;
}
