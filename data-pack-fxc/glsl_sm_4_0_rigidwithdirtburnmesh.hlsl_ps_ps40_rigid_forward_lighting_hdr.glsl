//
//
// Shader Model 4
// Fragment Shader
//
// id: 1292 - fxc/glsl_SM_4_0_rigidwithdirtburnmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*102*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
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
/*115*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
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
/*129*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*130*/	    r10.y = -1.000000;
/*131*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*132*/	    r0.z = inversesqrt(r0.z);
/*133*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*134*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*135*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*136*/	    r1.w = r1.w * 1.250000;
/*137*/	    r1.w = min(r1.w, 1.000000);
/*138*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
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
/*162*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
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
/*194*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*195*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*196*/	r1.w = inversesqrt(r1.w);
/*197*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*198*/	r1.w = -r3.x + 1.000000;
/*199*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*200*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*201*/	r4.x = r4.x + r4.x;
/*202*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*203*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*204*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*205*/	r4.w = cos((r6.x));
/*206*/	r4.w = inversesqrt(r4.w);
/*207*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*208*/	r5.w = saturate(r0.z * 60.000000);
/*209*/	r5.w = -r0.z + r5.w;
/*210*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*211*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*212*/	r7.x = inversesqrt(r7.x);
/*213*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*214*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*215*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*216*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*217*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*218*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*219*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*220*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*221*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*222*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*223*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*224*/	r5.y = -r0.z + 1.000000;
/*225*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*226*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*227*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*228*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*229*/	  r5.y = max(r5.y, 0.000000);
/*230*/	  r5.y = log2(r5.y);
/*231*/	  r5.y = r5.y * 10.000000;
/*232*/	  r5.y = exp2(r5.y);
/*233*/	  r5.y = r4.w * r5.y;
/*234*/	  r5.y = r5.y * r5.w + r0.z;
/*235*/	  r7.x = r1.w * 8.000000;
/*236*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*237*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*238*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*239*/	}
/*240*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*241*/	r7.x = max(r5.y, 0.000000);
/*242*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*243*/	if(floatBitsToUint(r5.y) != 0u) {
/*244*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*245*/	  r4.x = max(r4.x, -1.000000);
/*246*/	  r4.x = min(r4.x, 1.000000);
/*247*/	  r4.y = -abs(r4.x) + 1.000000;
/*248*/	  r4.y = sqrt(r4.y);
/*249*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*250*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*251*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*252*/	  r5.y = r4.y * r4.z;
/*253*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*254*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*255*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*256*/	  r4.x = r4.z * r4.y + r4.x;
/*257*/	  r3.x = r3.x * r3.x;
/*258*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*259*/	  r2.w = r3.x * r2.w + r5.x;
/*260*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*261*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*262*/	  r3.x = -r2.w * r2.w + 1.000000;
/*263*/	  r3.x = max(r3.x, 0.001000);
/*264*/	  r3.x = log2(r3.x);
/*265*/	  r4.y = r3.x * 4.950617;
/*266*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*267*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*268*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*269*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*270*/	  r2.w = floatBitsToInt(r2.w);
/*271*/	  r4.y = r3.x * r3.x + -r4.y;
/*272*/	  r4.y = sqrt(r4.y);
/*273*/	  r3.x = -r3.x + r4.y;
/*274*/	  r3.x = max(r3.x, 0.000000);
/*275*/	  r3.x = sqrt(r3.x);
/*276*/	  r2.w = r2.w * r3.x;
/*277*/	  r2.w = r2.w * 1.414214;
/*278*/	  r2.w = 0.008727 / r2.w;
/*279*/	  r2.w = max(r2.w, 0.000100);
/*280*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*281*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*282*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*283*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*284*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*285*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*286*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*287*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*288*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*289*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*290*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*291*/	  r2.w = floatBitsToInt(r2.w);
/*292*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*293*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*294*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*295*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*296*/	  r2.w = r2.w * r4.x + 1.000000;
/*297*/	  r2.w = r2.w * 0.500000;
/*298*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*299*/	  r3.x = r3.x * r4.y + 1.000000;
/*300*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*301*/	  r3.x = min(r7.x, 1.000000);
/*302*/	  r1.w = r1.w * 1.570796;
/*303*/	  r1.w = sin(r1.w);
/*304*/	  r3.x = r3.x + -1.000000;
/*305*/	  r1.w = r1.w * r3.x + 1.000000;
/*306*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*307*/	  r3.x = max(r3.x, 0.000000);
/*308*/	  r3.x = log2(r3.x);
/*309*/	  r3.x = r3.x * 10.000000;
/*310*/	  r3.x = exp2(r3.x);
/*311*/	  r3.x = r4.w * r3.x;
/*312*/	  r3.x = r3.x * r5.w + r0.z;
/*313*/	  r1.w = r1.w * abs(r2.w);
/*314*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*315*/	} else {
/*316*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*317*/	}
/*318*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*319*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*320*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*321*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*322*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*323*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*324*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*325*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*326*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*327*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*328*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*329*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*330*/	r1.w = inversesqrt(r1.w);
/*331*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*332*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*333*/	r1.w = r1.w + r1.w;
/*334*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*335*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*336*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*337*/	r1.x = max(r1.x, 0.000000);
/*338*/	r1.x = log2(r1.x);
/*339*/	r1.x = r1.x * 10.000000;
/*340*/	r1.x = exp2(r1.x);
/*341*/	r1.x = r4.w * r1.x;
/*342*/	r0.z = r1.x * r5.w + r0.z;
/*343*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*344*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*345*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*346*/	r0.w = 1.000000;
/*347*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*348*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*349*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*350*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*351*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*352*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*353*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*354*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*355*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*356*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*357*/	if(r0.x != 0) discard;
/*358*/	color1.x = 1.000000;
/*359*/	return;
}
