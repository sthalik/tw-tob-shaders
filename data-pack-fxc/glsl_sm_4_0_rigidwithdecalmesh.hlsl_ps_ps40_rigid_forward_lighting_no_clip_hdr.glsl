//
//
// Shader Model 4
// Fragment Shader
//
// id: 1098 - fxc/glsl_SM_4_0_rigidwithdecalmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;

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
/*66*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*69*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*72*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*75*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*76*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*77*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*78*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*81*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*82*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*83*/	if(floatBitsToUint(r0.z) != 0u) {
/*84*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*85*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*86*/	  r0.z = r3.w * cb0.data[26].x;
/*87*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*88*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*89*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*90*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*91*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*92*/	}
/*93*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*94*/	if(floatBitsToUint(r0.z) != 0u) {
/*95*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*96*/	  if(floatBitsToUint(r0.z) != 0u) {
/*97*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*98*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*99*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*100*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*101*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*102*/	    r0.z = -r0.z + 1.000000;
/*103*/	    r0.z = max(r0.z, 0.000000);
/*104*/	    r8.z = sqrt(r0.z);
/*105*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*106*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*107*/	    r0.z = inversesqrt(r0.z);
/*108*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*109*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*110*/	    r10.y = -1.000000;
/*111*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*112*/	    r0.z = inversesqrt(r0.z);
/*113*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*114*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*115*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*116*/	    r1.w = r1.w * 1.250000;
/*117*/	    r1.w = min(r1.w, 1.000000);
/*118*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*119*/	    r2.w = r2.w * 4.000000;
/*120*/	    r1.w = r1.w * 0.200000 + r2.w;
/*121*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*122*/	    r0.z = r0.z + -r1.w;
/*123*/	    r0.z = saturate(r0.z * 200.000000);
/*124*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*125*/	    r0.z = r0.z * r0.z;
/*126*/	    r0.z = r0.z * r1.w;
/*127*/	    r3.y = r0.z * -r3.y + r3.y;
/*128*/	    r1.w = -r3.x + 0.200000;
/*129*/	    r3.x = r0.z * r1.w + r3.x;
/*130*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*131*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*132*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*133*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*134*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*135*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*136*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*137*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*138*/	    r1.w = -r1.w + 1.000000;
/*139*/	    r1.w = max(r1.w, 0.000000);
/*140*/	    r7.z = sqrt(r1.w);
/*141*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*142*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*143*/	    r1.w = sqrt(r1.w);
/*144*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*145*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*146*/	    r1.w = inversesqrt(r1.w);
/*147*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*148*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*149*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*150*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*151*/	    r1.w = -r1.y + 1.000000;
/*152*/	    r0.z = min(r0.z, r1.w);
/*153*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*154*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*155*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*156*/	    r0.z = inversesqrt(r0.z);
/*157*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*158*/	  }
/*159*/	}
/*160*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*161*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*162*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*163*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*164*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*165*/	r3.xzw = (-r0.xxyw + r1.wwww).xzw;
/*166*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*167*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*168*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*169*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*170*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*171*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*172*/	r1.w = inversesqrt(r1.w);
/*173*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*174*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*175*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*176*/	r1.w = inversesqrt(r1.w);
/*177*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*178*/	r1.w = -r3.y + 1.000000;
/*179*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*180*/	r4.x = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*181*/	r4.x = r4.x + r4.x;
/*182*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*183*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*184*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*185*/	r4.w = cos((r6.x));
/*186*/	r4.w = inversesqrt(r4.w);
/*187*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*188*/	r5.w = saturate(r0.z * 60.000000);
/*189*/	r5.w = -r0.z + r5.w;
/*190*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*191*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*192*/	r7.x = inversesqrt(r7.x);
/*193*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*194*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*195*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*196*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*197*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*198*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*199*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*200*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*201*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*202*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*203*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*204*/	r5.y = -r0.z + 1.000000;
/*205*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*206*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*207*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*208*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*209*/	  r5.y = max(r5.y, 0.000000);
/*210*/	  r5.y = log2(r5.y);
/*211*/	  r5.y = r5.y * 10.000000;
/*212*/	  r5.y = exp2(r5.y);
/*213*/	  r5.y = r4.w * r5.y;
/*214*/	  r5.y = r5.y * r5.w + r0.z;
/*215*/	  r7.x = r1.w * 8.000000;
/*216*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*217*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*218*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*219*/	}
/*220*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*221*/	r7.x = max(r5.y, 0.000000);
/*222*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*223*/	if(floatBitsToUint(r5.y) != 0u) {
/*224*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*225*/	  r4.x = max(r4.x, -1.000000);
/*226*/	  r4.x = min(r4.x, 1.000000);
/*227*/	  r4.y = -abs(r4.x) + 1.000000;
/*228*/	  r4.y = sqrt(r4.y);
/*229*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*230*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*231*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*232*/	  r5.y = r4.y * r4.z;
/*233*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*234*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*235*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*236*/	  r4.x = r4.z * r4.y + r4.x;
/*237*/	  r3.y = r3.y * r3.y;
/*238*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*239*/	  r2.w = r3.y * r2.w + r5.x;
/*240*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*241*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*242*/	  r3.y = -r2.w * r2.w + 1.000000;
/*243*/	  r3.y = max(r3.y, 0.001000);
/*244*/	  r3.y = log2(r3.y);
/*245*/	  r4.y = r3.y * 4.950617;
/*246*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*247*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*248*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*249*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*250*/	  r2.w = floatBitsToInt(r2.w);
/*251*/	  r4.y = r3.y * r3.y + -r4.y;
/*252*/	  r4.y = sqrt(r4.y);
/*253*/	  r3.y = -r3.y + r4.y;
/*254*/	  r3.y = max(r3.y, 0.000000);
/*255*/	  r3.y = sqrt(r3.y);
/*256*/	  r2.w = r2.w * r3.y;
/*257*/	  r2.w = r2.w * 1.414214;
/*258*/	  r2.w = 0.008727 / r2.w;
/*259*/	  r2.w = max(r2.w, 0.000100);
/*260*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*261*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*262*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*263*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*264*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*265*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*266*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*267*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*268*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*269*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*270*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*271*/	  r2.w = floatBitsToInt(r2.w);
/*272*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*273*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*274*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*275*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*276*/	  r2.w = r2.w * r4.x + 1.000000;
/*277*/	  r2.w = r2.w * 0.500000;
/*278*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*279*/	  r3.y = r3.y * r4.y + 1.000000;
/*280*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*281*/	  r3.y = min(r7.x, 1.000000);
/*282*/	  r1.w = r1.w * 1.570796;
/*283*/	  r1.w = sin(r1.w);
/*284*/	  r3.y = r3.y + -1.000000;
/*285*/	  r1.w = r1.w * r3.y + 1.000000;
/*286*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*287*/	  r3.x = max(r3.x, 0.000000);
/*288*/	  r3.x = log2(r3.x);
/*289*/	  r3.x = r3.x * 10.000000;
/*290*/	  r3.x = exp2(r3.x);
/*291*/	  r3.x = r4.w * r3.x;
/*292*/	  r3.x = r3.x * r5.w + r0.z;
/*293*/	  r1.w = r1.w * abs(r2.w);
/*294*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*295*/	} else {
/*296*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*297*/	}
/*298*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*299*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*300*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*301*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*302*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*303*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*304*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*305*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*306*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*307*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*308*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*309*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*310*/	r1.w = inversesqrt(r1.w);
/*311*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*312*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*313*/	r1.w = r1.w + r1.w;
/*314*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*315*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*316*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*317*/	r1.x = max(r1.x, 0.000000);
/*318*/	r1.x = log2(r1.x);
/*319*/	r1.x = r1.x * 10.000000;
/*320*/	r1.x = exp2(r1.x);
/*321*/	r1.x = r4.w * r1.x;
/*322*/	r0.z = r1.x * r5.w + r0.z;
/*323*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*324*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*325*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*326*/	r0.w = 1.000000;
/*327*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*328*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*329*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*330*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*331*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*332*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*333*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*334*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*335*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*336*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*337*/	if(r0.x != 0) discard;
/*338*/	color1.x = 1.000000;
/*339*/	return;
}
