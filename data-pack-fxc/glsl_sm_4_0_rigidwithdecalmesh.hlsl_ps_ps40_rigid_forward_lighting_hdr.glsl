//
//
// Shader Model 4
// Fragment Shader
//
// id: 1096 - fxc/glsl_SM_4_0_rigidwithdecalmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
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
/*41*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*42*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*43*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*44*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*45*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*46*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*47*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*48*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*49*/	r4.z = vsOut_T6.x;
/*50*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*51*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*52*/	if(floatBitsToUint(r1.w) != 0u) {
/*53*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*54*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*55*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*56*/	  r1.w = -r1.w + 1.000000;
/*57*/	  r1.w = max(r1.w, 0.000000);
/*58*/	  r4.z = sqrt(r1.w);
/*59*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*60*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*61*/	  r1.w = r3.x * r7.w;
/*62*/	  r3.x = r1.w * -0.500000 + r3.x;
/*63*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*64*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*65*/	  r1.w = -r5.w * r6.w + 1.000000;
/*66*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*67*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*68*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*69*/	}
/*70*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*73*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*74*/	r1.w = inversesqrt(r1.w);
/*75*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*76*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*79*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*80*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*81*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*82*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*85*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*86*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*87*/	if(floatBitsToUint(r0.z) != 0u) {
/*88*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*89*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*90*/	  r0.z = r3.w * cb0.data[26].x;
/*91*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*92*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*93*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*94*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*95*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*96*/	}
/*97*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*98*/	if(floatBitsToUint(r0.z) != 0u) {
/*99*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*100*/	  if(floatBitsToUint(r0.z) != 0u) {
/*101*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*102*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*103*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*104*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*105*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*106*/	    r0.z = -r0.z + 1.000000;
/*107*/	    r0.z = max(r0.z, 0.000000);
/*108*/	    r8.z = sqrt(r0.z);
/*109*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*110*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*111*/	    r0.z = inversesqrt(r0.z);
/*112*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*113*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*114*/	    r10.y = -1.000000;
/*115*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*116*/	    r0.z = inversesqrt(r0.z);
/*117*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*118*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*119*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*120*/	    r1.w = r1.w * 1.250000;
/*121*/	    r1.w = min(r1.w, 1.000000);
/*122*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*123*/	    r2.w = r2.w * 4.000000;
/*124*/	    r1.w = r1.w * 0.200000 + r2.w;
/*125*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*126*/	    r0.z = r0.z + -r1.w;
/*127*/	    r0.z = saturate(r0.z * 200.000000);
/*128*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*129*/	    r0.z = r0.z * r0.z;
/*130*/	    r0.z = r0.z * r1.w;
/*131*/	    r3.y = r0.z * -r3.y + r3.y;
/*132*/	    r1.w = -r3.x + 0.200000;
/*133*/	    r3.x = r0.z * r1.w + r3.x;
/*134*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*135*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*136*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*137*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*138*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*139*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*140*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*141*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*142*/	    r1.w = -r1.w + 1.000000;
/*143*/	    r1.w = max(r1.w, 0.000000);
/*144*/	    r7.z = sqrt(r1.w);
/*145*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*146*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*147*/	    r1.w = sqrt(r1.w);
/*148*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*149*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*150*/	    r1.w = inversesqrt(r1.w);
/*151*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*152*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*153*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*154*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*155*/	    r1.w = -r1.y + 1.000000;
/*156*/	    r0.z = min(r0.z, r1.w);
/*157*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*158*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*159*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*160*/	    r0.z = inversesqrt(r0.z);
/*161*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*162*/	  }
/*163*/	}
/*164*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*165*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*166*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*167*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*168*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*169*/	r3.xzw = (-r0.xxyw + r1.wwww).xzw;
/*170*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*171*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*172*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*173*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*174*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*175*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*176*/	r1.w = inversesqrt(r1.w);
/*177*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*178*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*179*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*180*/	r1.w = inversesqrt(r1.w);
/*181*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*182*/	r1.w = -r3.y + 1.000000;
/*183*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*184*/	r4.x = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*185*/	r4.x = r4.x + r4.x;
/*186*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*187*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*188*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*189*/	r4.w = cos((r6.x));
/*190*/	r4.w = inversesqrt(r4.w);
/*191*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*192*/	r5.w = saturate(r0.z * 60.000000);
/*193*/	r5.w = -r0.z + r5.w;
/*194*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*195*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*196*/	r7.x = inversesqrt(r7.x);
/*197*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*198*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*199*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*200*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*201*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*202*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*203*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*204*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*205*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*206*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*207*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*208*/	r5.y = -r0.z + 1.000000;
/*209*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*210*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*211*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*212*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*213*/	  r5.y = max(r5.y, 0.000000);
/*214*/	  r5.y = log2(r5.y);
/*215*/	  r5.y = r5.y * 10.000000;
/*216*/	  r5.y = exp2(r5.y);
/*217*/	  r5.y = r4.w * r5.y;
/*218*/	  r5.y = r5.y * r5.w + r0.z;
/*219*/	  r7.x = r1.w * 8.000000;
/*220*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*221*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*222*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*223*/	}
/*224*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*225*/	r7.x = max(r5.y, 0.000000);
/*226*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*227*/	if(floatBitsToUint(r5.y) != 0u) {
/*228*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*229*/	  r4.x = max(r4.x, -1.000000);
/*230*/	  r4.x = min(r4.x, 1.000000);
/*231*/	  r4.y = -abs(r4.x) + 1.000000;
/*232*/	  r4.y = sqrt(r4.y);
/*233*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*234*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*235*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*236*/	  r5.y = r4.y * r4.z;
/*237*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*238*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*239*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*240*/	  r4.x = r4.z * r4.y + r4.x;
/*241*/	  r3.y = r3.y * r3.y;
/*242*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*243*/	  r2.w = r3.y * r2.w + r5.x;
/*244*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*245*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*246*/	  r3.y = -r2.w * r2.w + 1.000000;
/*247*/	  r3.y = max(r3.y, 0.001000);
/*248*/	  r3.y = log2(r3.y);
/*249*/	  r4.y = r3.y * 4.950617;
/*250*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*251*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*252*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*253*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*254*/	  r2.w = floatBitsToInt(r2.w);
/*255*/	  r4.y = r3.y * r3.y + -r4.y;
/*256*/	  r4.y = sqrt(r4.y);
/*257*/	  r3.y = -r3.y + r4.y;
/*258*/	  r3.y = max(r3.y, 0.000000);
/*259*/	  r3.y = sqrt(r3.y);
/*260*/	  r2.w = r2.w * r3.y;
/*261*/	  r2.w = r2.w * 1.414214;
/*262*/	  r2.w = 0.008727 / r2.w;
/*263*/	  r2.w = max(r2.w, 0.000100);
/*264*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*265*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*266*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*267*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*268*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*269*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*270*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*271*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*272*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*273*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*274*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*275*/	  r2.w = floatBitsToInt(r2.w);
/*276*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*277*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*278*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*279*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*280*/	  r2.w = r2.w * r4.x + 1.000000;
/*281*/	  r2.w = r2.w * 0.500000;
/*282*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*283*/	  r3.y = r3.y * r4.y + 1.000000;
/*284*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*285*/	  r3.y = min(r7.x, 1.000000);
/*286*/	  r1.w = r1.w * 1.570796;
/*287*/	  r1.w = sin(r1.w);
/*288*/	  r3.y = r3.y + -1.000000;
/*289*/	  r1.w = r1.w * r3.y + 1.000000;
/*290*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*291*/	  r3.x = max(r3.x, 0.000000);
/*292*/	  r3.x = log2(r3.x);
/*293*/	  r3.x = r3.x * 10.000000;
/*294*/	  r3.x = exp2(r3.x);
/*295*/	  r3.x = r4.w * r3.x;
/*296*/	  r3.x = r3.x * r5.w + r0.z;
/*297*/	  r1.w = r1.w * abs(r2.w);
/*298*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*299*/	} else {
/*300*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*301*/	}
/*302*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*303*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*304*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*305*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*306*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*307*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*308*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*309*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*310*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*311*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*312*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*313*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*314*/	r1.w = inversesqrt(r1.w);
/*315*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*316*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*317*/	r1.w = r1.w + r1.w;
/*318*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*319*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*320*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*321*/	r1.x = max(r1.x, 0.000000);
/*322*/	r1.x = log2(r1.x);
/*323*/	r1.x = r1.x * 10.000000;
/*324*/	r1.x = exp2(r1.x);
/*325*/	r1.x = r4.w * r1.x;
/*326*/	r0.z = r1.x * r5.w + r0.z;
/*327*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*328*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*329*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*330*/	r0.w = 1.000000;
/*331*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*332*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*333*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*334*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*335*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*336*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*337*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*338*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*339*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*340*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*341*/	if(r0.x != 0) discard;
/*342*/	color1.x = 1.000000;
/*343*/	return;
}
