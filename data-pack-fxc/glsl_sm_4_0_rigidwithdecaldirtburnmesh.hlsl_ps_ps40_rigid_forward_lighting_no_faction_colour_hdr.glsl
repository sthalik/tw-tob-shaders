//
//
// Shader Model 4
// Fragment Shader
//
// id: 1045 - fxc/glsl_SM_4_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
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
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*24*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*25*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*26*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*27*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*28*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*29*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*30*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*31*/	r4.z = vsOut_T6.x;
/*32*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*33*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*34*/	if(floatBitsToUint(r1.w) != 0u) {
/*35*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*36*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*37*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*38*/	  r1.w = -r1.w + 1.000000;
/*39*/	  r1.w = max(r1.w, 0.000000);
/*40*/	  r4.z = sqrt(r1.w);
/*41*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*42*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*43*/	  r1.w = r3.x * r7.w;
/*44*/	  r3.x = r1.w * -0.500000 + r3.x;
/*45*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*46*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*47*/	  r1.w = -r5.w * r6.w + 1.000000;
/*48*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*49*/	  r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*50*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*51*/	}
/*52*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*53*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.yyyz).zw;
/*54*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*55*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*56*/	r1.w = r4.w * r5.w;
/*57*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*58*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*59*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*60*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*61*/	r2.w = inversesqrt(r2.w);
/*62*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*63*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*64*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*65*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*66*/	r4.x = 0;
/*67*/	r4.y = cb0.data[26].x * 0.050000;
/*68*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*69*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*70*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*71*/	r1.w = saturate(r4.x * 5.000000);
/*72*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*73*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*74*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*75*/	r2.w = log2(r5.z);
/*76*/	r2.w = r2.w * 1.800000;
/*77*/	r2.w = exp2(r2.w);
/*78*/	r2.w = r2.w * 10.000000;
/*79*/	r2.w = min(r2.w, 1.000000);
/*80*/	r1.w = r1.w + r2.w;
/*81*/	r1.w = r1.w * 0.500000;
/*82*/	r2.w = -r5.w + 1.000000;
/*83*/	r2.w = log2(r2.w);
/*84*/	r2.w = r2.w * vsOut_T7.x;
/*85*/	r2.w = exp2(r2.w);
/*86*/	r2.w = min(r2.w, 1.000000);
/*87*/	r2.w = r2.w * vsOut_T7.x;
/*88*/	r3.z = r5.z * 0.250000;
/*89*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*90*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*91*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*92*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*93*/	r1.w = vsOut_T7.x + -0.025000;
/*94*/	r1.w = max(r1.w, 0.000000);
/*95*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*96*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*97*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*98*/	r1.w = inversesqrt(r1.w);
/*99*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*100*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*101*/	r1.w = inversesqrt(r1.w);
/*102*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*103*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*104*/	r1.w = inversesqrt(r1.w);
/*105*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*106*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*107*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*108*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*109*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*110*/	r1.w = inversesqrt(r1.w);
/*111*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*112*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*113*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*114*/	if(floatBitsToUint(r0.w) != 0u) {
/*115*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*116*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*117*/	  r0.w = r3.w * cb0.data[26].x;
/*118*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*119*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*120*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*121*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*122*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*123*/	}
/*124*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*125*/	if(floatBitsToUint(r0.w) != 0u) {
/*126*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*127*/	  if(floatBitsToUint(r0.w) != 0u) {
/*128*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*129*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*130*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*131*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*132*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*133*/	    r0.w = -r0.w + 1.000000;
/*134*/	    r0.w = max(r0.w, 0.000000);
/*135*/	    r8.z = sqrt(r0.w);
/*136*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*137*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*138*/	    r0.w = inversesqrt(r0.w);
/*139*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*140*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*141*/	    r10.y = -1.000000;
/*142*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*143*/	    r0.w = inversesqrt(r0.w);
/*144*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*145*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*146*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*147*/	    r1.w = r1.w * 1.250000;
/*148*/	    r1.w = min(r1.w, 1.000000);
/*149*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*150*/	    r2.w = r2.w * 4.000000;
/*151*/	    r1.w = r1.w * 0.200000 + r2.w;
/*152*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*153*/	    r0.w = r0.w + -r1.w;
/*154*/	    r0.w = saturate(r0.w * 200.000000);
/*155*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*156*/	    r0.w = r0.w * r0.w;
/*157*/	    r0.w = r0.w * r1.w;
/*158*/	    r3.y = r0.w * -r3.y + r3.y;
/*159*/	    r1.w = -r3.x + 0.200000;
/*160*/	    r3.x = r0.w * r1.w + r3.x;
/*161*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*162*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*163*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*164*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*165*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*166*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*167*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*168*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*169*/	    r1.w = -r1.w + 1.000000;
/*170*/	    r1.w = max(r1.w, 0.000000);
/*171*/	    r7.z = sqrt(r1.w);
/*172*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*173*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*174*/	    r1.w = sqrt(r1.w);
/*175*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*176*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*177*/	    r1.w = inversesqrt(r1.w);
/*178*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*179*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*180*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*181*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*182*/	    r1.w = -r0.y + 1.000000;
/*183*/	    r0.w = min(r0.w, r1.w);
/*184*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*185*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*186*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*187*/	    r0.w = inversesqrt(r0.w);
/*188*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*189*/	  }
/*190*/	}
/*191*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*192*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*193*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*194*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*195*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*196*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*197*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*198*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*199*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*200*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*201*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*202*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*203*/	r1.w = inversesqrt(r1.w);
/*204*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*205*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*206*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*207*/	r1.w = inversesqrt(r1.w);
/*208*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*209*/	r1.w = -r3.y + 1.000000;
/*210*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*211*/	r4.x = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*212*/	r4.x = r4.x + r4.x;
/*213*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*214*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*215*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*216*/	r4.w = cos((r6.x));
/*217*/	r4.w = inversesqrt(r4.w);
/*218*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*219*/	r5.w = saturate(r0.w * 60.000000);
/*220*/	r5.w = -r0.w + r5.w;
/*221*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*222*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*223*/	r7.x = inversesqrt(r7.x);
/*224*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*225*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*226*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*227*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*228*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*229*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*230*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*231*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*232*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*233*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*234*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*235*/	r5.y = -r0.w + 1.000000;
/*236*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*237*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*238*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*239*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*240*/	  r5.y = max(r5.y, 0.000000);
/*241*/	  r5.y = log2(r5.y);
/*242*/	  r5.y = r5.y * 10.000000;
/*243*/	  r5.y = exp2(r5.y);
/*244*/	  r5.y = r4.w * r5.y;
/*245*/	  r5.y = r5.y * r5.w + r0.w;
/*246*/	  r7.x = r1.w * 8.000000;
/*247*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*248*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*249*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*250*/	}
/*251*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*252*/	r7.x = max(r5.y, 0.000000);
/*253*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*254*/	if(floatBitsToUint(r5.y) != 0u) {
/*255*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*256*/	  r4.x = max(r4.x, -1.000000);
/*257*/	  r4.x = min(r4.x, 1.000000);
/*258*/	  r4.y = -abs(r4.x) + 1.000000;
/*259*/	  r4.y = sqrt(r4.y);
/*260*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*261*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*262*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*263*/	  r5.y = r4.y * r4.z;
/*264*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*265*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*266*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*267*/	  r4.x = r4.z * r4.y + r4.x;
/*268*/	  r3.y = r3.y * r3.y;
/*269*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*270*/	  r2.w = r3.y * r2.w + r5.x;
/*271*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*272*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*273*/	  r3.y = -r2.w * r2.w + 1.000000;
/*274*/	  r3.y = max(r3.y, 0.001000);
/*275*/	  r3.y = log2(r3.y);
/*276*/	  r4.y = r3.y * 4.950617;
/*277*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*278*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*279*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*280*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*281*/	  r2.w = floatBitsToInt(r2.w);
/*282*/	  r4.y = r3.y * r3.y + -r4.y;
/*283*/	  r4.y = sqrt(r4.y);
/*284*/	  r3.y = -r3.y + r4.y;
/*285*/	  r3.y = max(r3.y, 0.000000);
/*286*/	  r3.y = sqrt(r3.y);
/*287*/	  r2.w = r2.w * r3.y;
/*288*/	  r2.w = r2.w * 1.414214;
/*289*/	  r2.w = 0.008727 / r2.w;
/*290*/	  r2.w = max(r2.w, 0.000100);
/*291*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*292*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*293*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*294*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*295*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*296*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*297*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*298*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*299*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*300*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*301*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*302*/	  r2.w = floatBitsToInt(r2.w);
/*303*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*304*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*305*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*306*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*307*/	  r2.w = r2.w * r4.x + 1.000000;
/*308*/	  r2.w = r2.w * 0.500000;
/*309*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*310*/	  r3.y = r3.y * r4.y + 1.000000;
/*311*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*312*/	  r3.y = min(r7.x, 1.000000);
/*313*/	  r1.w = r1.w * 1.570796;
/*314*/	  r1.w = sin(r1.w);
/*315*/	  r3.y = r3.y + -1.000000;
/*316*/	  r1.w = r1.w * r3.y + 1.000000;
/*317*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*318*/	  r3.x = max(r3.x, 0.000000);
/*319*/	  r3.x = log2(r3.x);
/*320*/	  r3.x = r3.x * 10.000000;
/*321*/	  r3.x = exp2(r3.x);
/*322*/	  r3.x = r4.w * r3.x;
/*323*/	  r3.x = r3.x * r5.w + r0.w;
/*324*/	  r1.w = r1.w * abs(r2.w);
/*325*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*326*/	} else {
/*327*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*328*/	}
/*329*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*330*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*331*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*332*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*333*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*334*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*335*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*336*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*337*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*338*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*339*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*340*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*341*/	r1.w = inversesqrt(r1.w);
/*342*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*343*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*344*/	r1.w = r1.w + r1.w;
/*345*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*346*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*347*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*348*/	r0.x = max(r0.x, 0.000000);
/*349*/	r0.x = log2(r0.x);
/*350*/	r0.x = r0.x * 10.000000;
/*351*/	r0.x = exp2(r0.x);
/*352*/	r0.x = r4.w * r0.x;
/*353*/	r0.x = r0.x * r5.w + r0.w;
/*354*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*355*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*356*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*357*/	r0.w = 1.000000;
/*358*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*359*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*360*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*361*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*362*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*363*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*364*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*365*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*366*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*367*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*368*/	if(r0.x != 0) discard;
/*369*/	color1.x = 1.000000;
/*370*/	return;
}
