//
//
// Shader Model 4
// Fragment Shader
//
// id: 934 - fxc/glsl_SM_4_0_rigidwithdecaldirtmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
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
/*37*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*38*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*39*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*40*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*41*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*42*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*43*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*44*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*45*/	r4.z = vsOut_T6.x;
/*46*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*47*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*48*/	if(floatBitsToUint(r1.w) != 0u) {
/*49*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*50*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*51*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*52*/	  r1.w = -r1.w + 1.000000;
/*53*/	  r1.w = max(r1.w, 0.000000);
/*54*/	  r4.z = sqrt(r1.w);
/*55*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*56*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*57*/	  r1.w = r3.x * r7.w;
/*58*/	  r3.x = r1.w * -0.500000 + r3.x;
/*59*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*60*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*61*/	  r1.w = -r5.w * r6.w + 1.000000;
/*62*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*63*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*64*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*65*/	}
/*66*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*67*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.yyyz).zw;
/*68*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*69*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*70*/	r1.w = r4.w * r5.w;
/*71*/	r4.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*72*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*73*/	r1.xy = (r3.zwzz * r4.wwww + r1.xyxx).xy;
/*74*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*77*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*78*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*79*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*82*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*85*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*86*/	r1.w = inversesqrt(r1.w);
/*87*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*88*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*89*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*90*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*91*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*92*/	r1.w = inversesqrt(r1.w);
/*93*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*94*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*95*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*96*/	if(floatBitsToUint(r0.z) != 0u) {
/*97*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*98*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*99*/	  r0.z = r3.w * cb0.data[26].x;
/*100*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*101*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*102*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*103*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*104*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*105*/	}
/*106*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*107*/	if(floatBitsToUint(r0.z) != 0u) {
/*108*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*109*/	  if(floatBitsToUint(r0.z) != 0u) {
/*110*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*111*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*112*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*113*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*114*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*115*/	    r0.z = -r0.z + 1.000000;
/*116*/	    r0.z = max(r0.z, 0.000000);
/*117*/	    r8.z = sqrt(r0.z);
/*118*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*119*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*120*/	    r0.z = inversesqrt(r0.z);
/*121*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*122*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*123*/	    r10.y = -1.000000;
/*124*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*125*/	    r0.z = inversesqrt(r0.z);
/*126*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*127*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*128*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*129*/	    r1.w = r1.w * 1.250000;
/*130*/	    r1.w = min(r1.w, 1.000000);
/*131*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*132*/	    r2.w = r2.w * 4.000000;
/*133*/	    r1.w = r1.w * 0.200000 + r2.w;
/*134*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*135*/	    r0.z = r0.z + -r1.w;
/*136*/	    r0.z = saturate(r0.z * 200.000000);
/*137*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*138*/	    r0.z = r0.z * r0.z;
/*139*/	    r0.z = r0.z * r1.w;
/*140*/	    r3.y = r0.z * -r3.y + r3.y;
/*141*/	    r1.w = -r3.x + 0.200000;
/*142*/	    r3.x = r0.z * r1.w + r3.x;
/*143*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*144*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*145*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*146*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*147*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*148*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*149*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*150*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*151*/	    r1.w = -r1.w + 1.000000;
/*152*/	    r1.w = max(r1.w, 0.000000);
/*153*/	    r7.z = sqrt(r1.w);
/*154*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*155*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*156*/	    r1.w = sqrt(r1.w);
/*157*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*158*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*159*/	    r1.w = inversesqrt(r1.w);
/*160*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*161*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*162*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*163*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*164*/	    r1.w = -r1.y + 1.000000;
/*165*/	    r0.z = min(r0.z, r1.w);
/*166*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*167*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*168*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*169*/	    r0.z = inversesqrt(r0.z);
/*170*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*171*/	  }
/*172*/	}
/*173*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*174*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*175*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*176*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*177*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*178*/	r3.xzw = (-r0.xxyw + r1.wwww).xzw;
/*179*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*180*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*181*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*182*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*183*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*184*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*185*/	r1.w = inversesqrt(r1.w);
/*186*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*187*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*188*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*189*/	r1.w = inversesqrt(r1.w);
/*190*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*191*/	r1.w = -r3.y + 1.000000;
/*192*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*193*/	r4.x = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*194*/	r4.x = r4.x + r4.x;
/*195*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*196*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*197*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*198*/	r4.w = cos((r6.x));
/*199*/	r4.w = inversesqrt(r4.w);
/*200*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*201*/	r5.w = saturate(r0.z * 60.000000);
/*202*/	r5.w = -r0.z + r5.w;
/*203*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*204*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*205*/	r7.x = inversesqrt(r7.x);
/*206*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*207*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*208*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*209*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*210*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*211*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*212*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*213*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*214*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*215*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*216*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*217*/	r5.y = -r0.z + 1.000000;
/*218*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*219*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*220*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*221*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*222*/	  r5.y = max(r5.y, 0.000000);
/*223*/	  r5.y = log2(r5.y);
/*224*/	  r5.y = r5.y * 10.000000;
/*225*/	  r5.y = exp2(r5.y);
/*226*/	  r5.y = r4.w * r5.y;
/*227*/	  r5.y = r5.y * r5.w + r0.z;
/*228*/	  r7.x = r1.w * 8.000000;
/*229*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*230*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*231*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*232*/	}
/*233*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*234*/	r7.x = max(r5.y, 0.000000);
/*235*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*236*/	if(floatBitsToUint(r5.y) != 0u) {
/*237*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*238*/	  r4.x = max(r4.x, -1.000000);
/*239*/	  r4.x = min(r4.x, 1.000000);
/*240*/	  r4.y = -abs(r4.x) + 1.000000;
/*241*/	  r4.y = sqrt(r4.y);
/*242*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*243*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*244*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*245*/	  r5.y = r4.y * r4.z;
/*246*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*247*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*248*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*249*/	  r4.x = r4.z * r4.y + r4.x;
/*250*/	  r3.y = r3.y * r3.y;
/*251*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*252*/	  r2.w = r3.y * r2.w + r5.x;
/*253*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*254*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*255*/	  r3.y = -r2.w * r2.w + 1.000000;
/*256*/	  r3.y = max(r3.y, 0.001000);
/*257*/	  r3.y = log2(r3.y);
/*258*/	  r4.y = r3.y * 4.950617;
/*259*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*260*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*261*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*262*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*263*/	  r2.w = floatBitsToInt(r2.w);
/*264*/	  r4.y = r3.y * r3.y + -r4.y;
/*265*/	  r4.y = sqrt(r4.y);
/*266*/	  r3.y = -r3.y + r4.y;
/*267*/	  r3.y = max(r3.y, 0.000000);
/*268*/	  r3.y = sqrt(r3.y);
/*269*/	  r2.w = r2.w * r3.y;
/*270*/	  r2.w = r2.w * 1.414214;
/*271*/	  r2.w = 0.008727 / r2.w;
/*272*/	  r2.w = max(r2.w, 0.000100);
/*273*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*274*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*275*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*276*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*277*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*278*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*279*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*280*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*281*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*282*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*283*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*284*/	  r2.w = floatBitsToInt(r2.w);
/*285*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*286*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*287*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*288*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*289*/	  r2.w = r2.w * r4.x + 1.000000;
/*290*/	  r2.w = r2.w * 0.500000;
/*291*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*292*/	  r3.y = r3.y * r4.y + 1.000000;
/*293*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*294*/	  r3.y = min(r7.x, 1.000000);
/*295*/	  r1.w = r1.w * 1.570796;
/*296*/	  r1.w = sin(r1.w);
/*297*/	  r3.y = r3.y + -1.000000;
/*298*/	  r1.w = r1.w * r3.y + 1.000000;
/*299*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*300*/	  r3.x = max(r3.x, 0.000000);
/*301*/	  r3.x = log2(r3.x);
/*302*/	  r3.x = r3.x * 10.000000;
/*303*/	  r3.x = exp2(r3.x);
/*304*/	  r3.x = r4.w * r3.x;
/*305*/	  r3.x = r3.x * r5.w + r0.z;
/*306*/	  r1.w = r1.w * abs(r2.w);
/*307*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*308*/	} else {
/*309*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*310*/	}
/*311*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*312*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*313*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*314*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*315*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*316*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*317*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*318*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*319*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*320*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*321*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*322*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*323*/	r1.w = inversesqrt(r1.w);
/*324*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*325*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*326*/	r1.w = r1.w + r1.w;
/*327*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*328*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*329*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*330*/	r1.x = max(r1.x, 0.000000);
/*331*/	r1.x = log2(r1.x);
/*332*/	r1.x = r1.x * 10.000000;
/*333*/	r1.x = exp2(r1.x);
/*334*/	r1.x = r4.w * r1.x;
/*335*/	r0.z = r1.x * r5.w + r0.z;
/*336*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*337*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*338*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*339*/	r0.w = 1.000000;
/*340*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*341*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*342*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*343*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*344*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*345*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*346*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*347*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*348*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*349*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*350*/	if(r0.x != 0) discard;
/*351*/	color1.x = 1.000000;
/*352*/	return;
}
