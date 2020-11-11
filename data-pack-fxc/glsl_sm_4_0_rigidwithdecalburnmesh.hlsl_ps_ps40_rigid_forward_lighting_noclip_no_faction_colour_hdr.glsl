//
//
// Shader Model 4
// Fragment Shader
//
// id: 1177 - fxc/glsl_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

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
  color0 = vec4(0);
  color1 = vec4(0);
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
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*20*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*21*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*22*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*23*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*24*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*25*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*26*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*27*/	r4.z = vsOut_T6.x;
/*28*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*29*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*30*/	if(floatBitsToUint(r1.w) != 0u) {
/*31*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*32*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*33*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*34*/	  r1.w = -r1.w + 1.000000;
/*35*/	  r1.w = max(r1.w, 0.000000);
/*36*/	  r4.z = sqrt(r1.w);
/*37*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*38*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*39*/	  r1.w = r3.x * r7.w;
/*40*/	  r3.x = r1.w * -0.500000 + r3.x;
/*41*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*42*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*43*/	  r1.w = -r5.w * r6.w + 1.000000;
/*44*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*45*/	  r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*46*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*47*/	}
/*48*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*49*/	r4.x = 0;
/*50*/	r4.y = cb0.data[26].x * 0.050000;
/*51*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*52*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*53*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*54*/	r1.w = saturate(r4.x * 5.000000);
/*55*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*56*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*57*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*58*/	r2.w = log2(r5.z);
/*59*/	r2.w = r2.w * 1.800000;
/*60*/	r2.w = exp2(r2.w);
/*61*/	r2.w = r2.w * 10.000000;
/*62*/	r2.w = min(r2.w, 1.000000);
/*63*/	r1.w = r1.w + r2.w;
/*64*/	r1.w = r1.w * 0.500000;
/*65*/	r2.w = -r5.w + 1.000000;
/*66*/	r2.w = log2(r2.w);
/*67*/	r2.w = r2.w * vsOut_T7.x;
/*68*/	r2.w = exp2(r2.w);
/*69*/	r2.w = min(r2.w, 1.000000);
/*70*/	r2.w = r2.w * vsOut_T7.x;
/*71*/	r3.z = r5.z * 0.250000;
/*72*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*73*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*74*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*75*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*76*/	r1.w = vsOut_T7.x + -0.025000;
/*77*/	r1.w = max(r1.w, 0.000000);
/*78*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*79*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*80*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*81*/	r1.w = inversesqrt(r1.w);
/*82*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*83*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*89*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*90*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*91*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*92*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*95*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*96*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*97*/	if(floatBitsToUint(r0.w) != 0u) {
/*98*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*99*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*100*/	  r0.w = r3.w * cb0.data[26].x;
/*101*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*102*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*103*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*104*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*105*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*106*/	}
/*107*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*108*/	if(floatBitsToUint(r0.w) != 0u) {
/*109*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*110*/	  if(floatBitsToUint(r0.w) != 0u) {
/*111*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*112*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*113*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*114*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*115*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*116*/	    r0.w = -r0.w + 1.000000;
/*117*/	    r0.w = max(r0.w, 0.000000);
/*118*/	    r8.z = sqrt(r0.w);
/*119*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*120*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*121*/	    r0.w = inversesqrt(r0.w);
/*122*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*123*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*124*/	    r10.y = -1.000000;
/*125*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*126*/	    r0.w = inversesqrt(r0.w);
/*127*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*128*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*129*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*130*/	    r1.w = r1.w * 1.250000;
/*131*/	    r1.w = min(r1.w, 1.000000);
/*132*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*133*/	    r2.w = r2.w * 4.000000;
/*134*/	    r1.w = r1.w * 0.200000 + r2.w;
/*135*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*136*/	    r0.w = r0.w + -r1.w;
/*137*/	    r0.w = saturate(r0.w * 200.000000);
/*138*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*139*/	    r0.w = r0.w * r0.w;
/*140*/	    r0.w = r0.w * r1.w;
/*141*/	    r3.y = r0.w * -r3.y + r3.y;
/*142*/	    r1.w = -r3.x + 0.200000;
/*143*/	    r3.x = r0.w * r1.w + r3.x;
/*144*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*145*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*146*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*147*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*148*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*149*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*150*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*151*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*152*/	    r1.w = -r1.w + 1.000000;
/*153*/	    r1.w = max(r1.w, 0.000000);
/*154*/	    r7.z = sqrt(r1.w);
/*155*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*156*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*157*/	    r1.w = sqrt(r1.w);
/*158*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*159*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*160*/	    r1.w = inversesqrt(r1.w);
/*161*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*162*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*163*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*164*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*165*/	    r1.w = -r0.y + 1.000000;
/*166*/	    r0.w = min(r0.w, r1.w);
/*167*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*168*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*169*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*170*/	    r0.w = inversesqrt(r0.w);
/*171*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*172*/	  }
/*173*/	}
/*174*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*175*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*176*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*177*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*178*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*179*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*180*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*181*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*182*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*183*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*184*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*185*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*186*/	r1.w = inversesqrt(r1.w);
/*187*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*188*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*189*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*190*/	r1.w = inversesqrt(r1.w);
/*191*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*192*/	r1.w = -r3.y + 1.000000;
/*193*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*194*/	r4.x = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*195*/	r4.x = r4.x + r4.x;
/*196*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*197*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*198*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*199*/	r4.w = cos((r6.x));
/*200*/	r4.w = inversesqrt(r4.w);
/*201*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*202*/	r5.w = saturate(r0.w * 60.000000);
/*203*/	r5.w = -r0.w + r5.w;
/*204*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*205*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*206*/	r7.x = inversesqrt(r7.x);
/*207*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*208*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*209*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*210*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*211*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*212*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*213*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*214*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*215*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*216*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*217*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*218*/	r5.y = -r0.w + 1.000000;
/*219*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*220*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*221*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*222*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*223*/	  r5.y = max(r5.y, 0.000000);
/*224*/	  r5.y = log2(r5.y);
/*225*/	  r5.y = r5.y * 10.000000;
/*226*/	  r5.y = exp2(r5.y);
/*227*/	  r5.y = r4.w * r5.y;
/*228*/	  r5.y = r5.y * r5.w + r0.w;
/*229*/	  r7.x = r1.w * 8.000000;
/*230*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*231*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*232*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*233*/	}
/*234*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*235*/	r7.x = max(r5.y, 0.000000);
/*236*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*237*/	if(floatBitsToUint(r5.y) != 0u) {
/*238*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*239*/	  r4.x = max(r4.x, -1.000000);
/*240*/	  r4.x = min(r4.x, 1.000000);
/*241*/	  r4.y = -abs(r4.x) + 1.000000;
/*242*/	  r4.y = sqrt(r4.y);
/*243*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*244*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*245*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*246*/	  r5.y = r4.y * r4.z;
/*247*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*248*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*249*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*250*/	  r4.x = r4.z * r4.y + r4.x;
/*251*/	  r3.y = r3.y * r3.y;
/*252*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*253*/	  r2.w = r3.y * r2.w + r5.x;
/*254*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*255*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*256*/	  r3.y = -r2.w * r2.w + 1.000000;
/*257*/	  r3.y = max(r3.y, 0.001000);
/*258*/	  r3.y = log2(r3.y);
/*259*/	  r4.y = r3.y * 4.950617;
/*260*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*261*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*262*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*263*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*264*/	  r2.w = floatBitsToInt(r2.w);
/*265*/	  r4.y = r3.y * r3.y + -r4.y;
/*266*/	  r4.y = sqrt(r4.y);
/*267*/	  r3.y = -r3.y + r4.y;
/*268*/	  r3.y = max(r3.y, 0.000000);
/*269*/	  r3.y = sqrt(r3.y);
/*270*/	  r2.w = r2.w * r3.y;
/*271*/	  r2.w = r2.w * 1.414214;
/*272*/	  r2.w = 0.008727 / r2.w;
/*273*/	  r2.w = max(r2.w, 0.000100);
/*274*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*275*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*276*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*277*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*278*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*279*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*280*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*281*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*282*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*283*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*284*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*285*/	  r2.w = floatBitsToInt(r2.w);
/*286*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*287*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*288*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*289*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*290*/	  r2.w = r2.w * r4.x + 1.000000;
/*291*/	  r2.w = r2.w * 0.500000;
/*292*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*293*/	  r3.y = r3.y * r4.y + 1.000000;
/*294*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*295*/	  r3.y = min(r7.x, 1.000000);
/*296*/	  r1.w = r1.w * 1.570796;
/*297*/	  r1.w = sin(r1.w);
/*298*/	  r3.y = r3.y + -1.000000;
/*299*/	  r1.w = r1.w * r3.y + 1.000000;
/*300*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*301*/	  r3.x = max(r3.x, 0.000000);
/*302*/	  r3.x = log2(r3.x);
/*303*/	  r3.x = r3.x * 10.000000;
/*304*/	  r3.x = exp2(r3.x);
/*305*/	  r3.x = r4.w * r3.x;
/*306*/	  r3.x = r3.x * r5.w + r0.w;
/*307*/	  r1.w = r1.w * abs(r2.w);
/*308*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*309*/	} else {
/*310*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*311*/	}
/*312*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*313*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*314*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*315*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*316*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*317*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*318*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*319*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*320*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*321*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*322*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*323*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*324*/	r1.w = inversesqrt(r1.w);
/*325*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*326*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*327*/	r1.w = r1.w + r1.w;
/*328*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*329*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*330*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*331*/	r0.x = max(r0.x, 0.000000);
/*332*/	r0.x = log2(r0.x);
/*333*/	r0.x = r0.x * 10.000000;
/*334*/	r0.x = exp2(r0.x);
/*335*/	r0.x = r4.w * r0.x;
/*336*/	r0.x = r0.x * r5.w + r0.w;
/*337*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*338*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*339*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*340*/	r0.w = 1.000000;
/*341*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*342*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*343*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*344*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*345*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*346*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*347*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*348*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*349*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*350*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*351*/	if(r0.x != 0) discard;
/*352*/	color1.x = 1.000000;
/*353*/	return;
}
