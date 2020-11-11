//
//
// Shader Model 4
// Fragment Shader
//
// id: 1264 - fxc/glsl_SM_4_0_rigidwithdirtburnmesh.hlsl_PS_ps30_alpha_overlay_40.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_sky;
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
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*19*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
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
/*42*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
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
/*54*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*55*/	r4.x = 0;
/*56*/	r4.y = cb0.data[26].x * 0.050000;
/*57*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*58*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*59*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*60*/	r1.w = saturate(r4.x * 5.000000);
/*61*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*62*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*64*/	r2.w = log2(r5.z);
/*65*/	r2.w = r2.w * 1.800000;
/*66*/	r2.w = exp2(r2.w);
/*67*/	r2.w = r2.w * 10.000000;
/*68*/	r2.w = min(r2.w, 1.000000);
/*69*/	r1.w = r1.w + r2.w;
/*70*/	r1.w = r1.w * 0.500000;
/*71*/	r2.w = -r5.w + 1.000000;
/*72*/	r2.w = log2(r2.w);
/*73*/	r2.w = r2.w * vsOut_T7.x;
/*74*/	r2.w = exp2(r2.w);
/*75*/	r2.w = min(r2.w, 1.000000);
/*76*/	r2.w = r2.w * vsOut_T7.x;
/*77*/	r3.z = r5.z * 0.250000;
/*78*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*79*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*80*/	r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*81*/	r0.xyw = (r2.wwww * r4.xyxz + r0.xyxw).xyw;
/*82*/	r1.w = vsOut_T7.x + -0.025000;
/*83*/	r1.w = max(r1.w, 0.000000);
/*84*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*85*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*86*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*89*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*92*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*95*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*96*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*97*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*98*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*101*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*102*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*103*/	if(floatBitsToUint(r0.z) != 0u) {
/*104*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*105*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*106*/	  r0.z = r3.w * cb0.data[26].x;
/*107*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*108*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*109*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*110*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*111*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*112*/	}
/*113*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*114*/	if(floatBitsToUint(r0.z) != 0u) {
/*115*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*116*/	  if(floatBitsToUint(r0.z) != 0u) {
/*117*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*118*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*119*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*120*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*121*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*122*/	    r0.z = -r0.z + 1.000000;
/*123*/	    r0.z = max(r0.z, 0.000000);
/*124*/	    r8.z = sqrt(r0.z);
/*125*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*126*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*127*/	    r0.z = inversesqrt(r0.z);
/*128*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*129*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*130*/	    r10.y = -1.000000;
/*131*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*132*/	    r0.z = inversesqrt(r0.z);
/*133*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*134*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*135*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*136*/	    r1.w = r1.w * 1.250000;
/*137*/	    r1.w = min(r1.w, 1.000000);
/*138*/	    r2.w = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*139*/	    r2.w = r2.w * 4.000000;
/*140*/	    r1.w = r1.w * 0.200000 + r2.w;
/*141*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*142*/	    r0.z = r0.z + -r1.w;
/*143*/	    r0.z = saturate(r0.z * 200.000000);
/*144*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*145*/	    r0.z = r0.z * r0.z;
/*146*/	    r0.z = r0.z * r1.w;
/*147*/	    r3.x = r0.z * -r3.x + r3.x;
/*148*/	    r1.w = -r3.y + 0.200000;
/*149*/	    r3.y = r0.z * r1.w + r3.y;
/*150*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*151*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*152*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*153*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*154*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*155*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*156*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*157*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*158*/	    r1.w = -r1.w + 1.000000;
/*159*/	    r1.w = max(r1.w, 0.000000);
/*160*/	    r7.z = sqrt(r1.w);
/*161*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*162*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*163*/	    r1.w = sqrt(r1.w);
/*164*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*165*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*166*/	    r1.w = inversesqrt(r1.w);
/*167*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*168*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*169*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*170*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*171*/	    r1.w = -r1.y + 1.000000;
/*172*/	    r0.z = min(r0.z, r1.w);
/*173*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*174*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*175*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*176*/	    r0.z = inversesqrt(r0.z);
/*177*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*178*/	  }
/*179*/	}
/*180*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*181*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*182*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*183*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*184*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*185*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*186*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*187*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*188*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*189*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*190*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*191*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*192*/	r1.w = inversesqrt(r1.w);
/*193*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*194*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*195*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*196*/	r2.w = inversesqrt(r1.w);
/*197*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*198*/	r2.w = -r3.x + 1.000000;
/*199*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*200*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*201*/	r5.y = r5.y + r5.y;
/*202*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*203*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*204*/	r6.w = r2.w * 1.539380;
/*205*/	r6.w = cos((r6.w));
/*206*/	r6.w = inversesqrt(r6.w);
/*207*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*208*/	r7.x = saturate(r0.z * 60.000000);
/*209*/	r7.x = -r0.z + r7.x;
/*210*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*211*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*212*/	r8.x = inversesqrt(r8.x);
/*213*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*214*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*215*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*216*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*217*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*218*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*219*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*220*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*221*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*222*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*223*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*224*/	r6.y = -r0.z + 1.000000;
/*225*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*226*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*227*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*228*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*229*/	  r6.y = max(r6.y, 0.000000);
/*230*/	  r6.y = log2(r6.y);
/*231*/	  r6.y = r6.y * 10.000000;
/*232*/	  r6.y = exp2(r6.y);
/*233*/	  r6.y = r6.w * r6.y;
/*234*/	  r6.y = r6.y * r7.x + r0.z;
/*235*/	  r8.x = r2.w * 8.000000;
/*236*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*237*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*238*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*239*/	}
/*240*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*241*/	r1.y = max(r1.x, 0.000000);
/*242*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*243*/	if(floatBitsToUint(r1.x) != 0u) {
/*244*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*245*/	  r1.x = max(r1.x, -1.000000);
/*246*/	  r1.x = min(r1.x, 1.000000);
/*247*/	  r1.z = -abs(r1.x) + 1.000000;
/*248*/	  r1.z = sqrt(r1.z);
/*249*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*250*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*251*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*252*/	  r5.z = r1.z * r5.y;
/*253*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*254*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*255*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*256*/	  r1.x = r5.y * r1.z + r1.x;
/*257*/	  r1.z = r3.x * r3.x;
/*258*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*259*/	  r1.z = r1.z * r3.x + r6.x;
/*260*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*261*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*262*/	  r3.x = -r1.z * r1.z + 1.000000;
/*263*/	  r3.x = max(r3.x, 0.001000);
/*264*/	  r3.x = log2(r3.x);
/*265*/	  r5.x = r3.x * 4.950617;
/*266*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*267*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*268*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*269*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*270*/	  r1.z = floatBitsToInt(r1.z);
/*271*/	  r5.x = r3.x * r3.x + -r5.x;
/*272*/	  r5.x = sqrt(r5.x);
/*273*/	  r3.x = -r3.x + r5.x;
/*274*/	  r3.x = max(r3.x, 0.000000);
/*275*/	  r3.x = sqrt(r3.x);
/*276*/	  r1.z = r1.z * r3.x;
/*277*/	  r1.z = r1.z * 1.414214;
/*278*/	  r1.z = 0.008727 / r1.z;
/*279*/	  r1.z = max(r1.z, 0.000100);
/*280*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*281*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*282*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*283*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*284*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*285*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*286*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*287*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*288*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*289*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*290*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*291*/	  r1.x = floatBitsToInt(r1.x);
/*292*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*293*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*294*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*295*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*296*/	  r1.x = r1.x * r5.x + 1.000000;
/*297*/	  r1.x = r1.x * 0.500000;
/*298*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*299*/	  r1.z = r1.z * r5.y + 1.000000;
/*300*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*301*/	  r1.z = min(r1.y, 1.000000);
/*302*/	  r2.w = r2.w * 1.570796;
/*303*/	  r2.w = sin(r2.w);
/*304*/	  r1.z = r1.z + -1.000000;
/*305*/	  r1.z = r2.w * r1.z + 1.000000;
/*306*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*307*/	  r2.w = max(r2.w, 0.000000);
/*308*/	  r2.w = log2(r2.w);
/*309*/	  r2.w = r2.w * 10.000000;
/*310*/	  r2.w = exp2(r2.w);
/*311*/	  r2.w = r6.w * r2.w;
/*312*/	  r2.w = r2.w * r7.x + r0.z;
/*313*/	  r1.x = r1.z * abs(r1.x);
/*314*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*315*/	} else {
/*316*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*317*/	}
/*318*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*319*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*320*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*321*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*322*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*323*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*324*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*325*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*326*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*327*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*328*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*329*/	r2.w = 1.000000;
/*330*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*331*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*332*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*333*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*334*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*335*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*336*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*337*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*338*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*339*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*340*/	if(r0.w != 0) discard;
/*341*/	r0.w = sqrt(r1.w);
/*342*/	r1.x = saturate(cb2.data[0].w)/**/;
/*343*/	r1.x = -r1.x + 1.000000;
/*344*/	r1.x = r1.x * 8.000000 + -4.000000;
/*345*/	r1.y = saturate(cb2.data[1].x)/**/;
/*346*/	r1.y = -r1.y + 1.000000;
/*347*/	r1.y = r1.y * 1000.000000;
/*348*/	r0.w = r0.w / r1.y;
/*349*/	r0.w = r0.w + r1.x;
/*350*/	r0.w = r0.w * 1.442695;
/*351*/	r0.w = exp2(r0.w);
/*352*/	r0.w = cb2.data[1].y / r0.w;
/*353*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*354*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*355*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*356*/	r1.x = r1.x + -cb2.data[1].z;
/*357*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*358*/	r1.x = saturate(r1.y * r1.x);
/*359*/	r1.y = r1.x * -2.000000 + 3.000000;
/*360*/	r1.x = r1.x * r1.x;
/*361*/	r1.x = r1.x * r1.y;
/*362*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*363*/	r1.y = sqrt(r1.y);
/*364*/	r1.z = max(cb2.data[2].z, 0.001000);
/*365*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*366*/	r1.y = r1.z * r1.y;
/*367*/	r1.y = min(r1.y, 1.000000);
/*368*/	r1.z = r1.y * -2.000000 + 3.000000;
/*369*/	r1.y = r1.y * r1.y;
/*370*/	r1.y = r1.y * r1.z;
/*371*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*372*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*373*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*374*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*375*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*376*/	r4.w = max(r4.y, 0.000000);
/*377*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*378*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*379*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*380*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*381*/	r0.w = saturate(r0.w * r1.y);
/*382*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*383*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*384*/	return;
}
