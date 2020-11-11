//
//
// Shader Model 4
// Fragment Shader
//
// id: 1088 - fxc/glsl_SM_3_0_rigidwithdecalmesh.hlsl_PS_ps30_rigid_forward_lighting_gamma_correct_LDR.glsl
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb4;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb5;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb6;

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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb5.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*19*/	r5.xyz = (r5.xyzx + -cb6.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb6.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb6.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb6.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb6.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb6.data[2].xyxz).xyw;
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
/*41*/	r3.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*42*/	r4.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*43*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*44*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*45*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*46*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*47*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*48*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*49*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*50*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*51*/	if(floatBitsToUint(r1.w) != 0u) {
/*52*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*53*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*54*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*55*/	  r1.w = -r1.w + 1.000000;
/*56*/	  r1.w = max(r1.w, 0.000000);
/*57*/	  r5.z = sqrt(r1.w);
/*58*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*59*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*60*/	  r1.w = r3.x * r7.w;
/*61*/	  r3.x = r1.w * -0.500000 + r3.x;
/*62*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*63*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*64*/	  r1.w = -r4.w * r6.w + 1.000000;
/*65*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*66*/	  r4.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*67*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*68*/	}
/*69*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*72*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*75*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*78*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*79*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*80*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*81*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*82*/	r1.w = inversesqrt(r1.w);
/*83*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*84*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*85*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*86*/	if(floatBitsToUint(r0.z) != 0u) {
/*87*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*88*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*89*/	  r0.z = r3.w * cb1.data[26].x;
/*90*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*91*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*92*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*93*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*94*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*95*/	}
/*96*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*97*/	if(floatBitsToUint(r0.z) != 0u) {
/*98*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*99*/	  if(floatBitsToUint(r0.z) != 0u) {
/*100*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*101*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*102*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*103*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*104*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*105*/	    r0.z = -r0.z + 1.000000;
/*106*/	    r0.z = max(r0.z, 0.000000);
/*107*/	    r8.z = sqrt(r0.z);
/*108*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*109*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*110*/	    r0.z = inversesqrt(r0.z);
/*111*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*112*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*113*/	    r10.y = -1.000000;
/*114*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*115*/	    r0.z = inversesqrt(r0.z);
/*116*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*117*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*118*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*119*/	    r1.w = r1.w * 1.250000;
/*120*/	    r1.w = min(r1.w, 1.000000);
/*121*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*122*/	    r2.w = r2.w * 4.000000;
/*123*/	    r1.w = r1.w * 0.200000 + r2.w;
/*124*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*125*/	    r0.z = r0.z + -r1.w;
/*126*/	    r0.z = saturate(r0.z * 200.000000);
/*127*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*128*/	    r0.z = r0.z * r0.z;
/*129*/	    r0.z = r0.z * r1.w;
/*130*/	    r3.y = r0.z * -r3.y + r3.y;
/*131*/	    r1.w = -r3.x + 0.200000;
/*132*/	    r3.x = r0.z * r1.w + r3.x;
/*133*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*134*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*135*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*136*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*137*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*138*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*139*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*140*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*141*/	    r1.w = -r1.w + 1.000000;
/*142*/	    r1.w = max(r1.w, 0.000000);
/*143*/	    r7.z = sqrt(r1.w);
/*144*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*145*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*146*/	    r1.w = sqrt(r1.w);
/*147*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*148*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*149*/	    r1.w = inversesqrt(r1.w);
/*150*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*151*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*152*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*153*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*154*/	    r1.w = -r1.y + 1.000000;
/*155*/	    r0.z = min(r0.z, r1.w);
/*156*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*157*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*158*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*159*/	    r0.z = inversesqrt(r0.z);
/*160*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*161*/	  }
/*162*/	}
/*163*/	r0.z = vsOut_T7.y * -r3.x + r3.x;
/*164*/	r3.xzw = (r0.xxyw * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*165*/	r3.xzw = (-r0.xxyw + r3.xxzw).xzw;
/*166*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.xzxw + r0.xyxw).xyw;
/*167*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*168*/	r3.xzw = (-r0.xxyw + r1.wwww).xzw;
/*169*/	r0.xyw = (vsOut_T7.zzzz * r3.xzxw + r0.xyxw).xyw;
/*170*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*171*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*172*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*173*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*174*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*175*/	r1.w = inversesqrt(r1.w);
/*176*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*177*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*178*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*179*/	r2.w = inversesqrt(r1.w);
/*180*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*181*/	r2.w = -r3.y + 1.000000;
/*182*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*183*/	r5.y = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*184*/	r5.y = r5.y + r5.y;
/*185*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*186*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*187*/	r6.w = r2.w * 1.539380;
/*188*/	r6.w = cos((r6.w));
/*189*/	r6.w = inversesqrt(r6.w);
/*190*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*191*/	r7.x = saturate(r0.z * 60.000000);
/*192*/	r7.x = -r0.z + r7.x;
/*193*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*194*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*195*/	r8.x = inversesqrt(r8.x);
/*196*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*197*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*198*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*199*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*200*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*201*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*202*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*203*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*204*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*205*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*206*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*207*/	r6.y = -r0.z + 1.000000;
/*208*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*209*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*210*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*211*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*212*/	  r6.y = max(r6.y, 0.000000);
/*213*/	  r6.y = log2(r6.y);
/*214*/	  r6.y = r6.y * 10.000000;
/*215*/	  r6.y = exp2(r6.y);
/*216*/	  r6.y = r6.w * r6.y;
/*217*/	  r6.y = r6.y * r7.x + r0.z;
/*218*/	  r8.x = r2.w * 8.000000;
/*219*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*220*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*221*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*222*/	}
/*223*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*224*/	r1.y = max(r1.x, 0.000000);
/*225*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*226*/	if(floatBitsToUint(r1.x) != 0u) {
/*227*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*228*/	  r1.x = max(r1.x, -1.000000);
/*229*/	  r1.x = min(r1.x, 1.000000);
/*230*/	  r1.z = -abs(r1.x) + 1.000000;
/*231*/	  r1.z = sqrt(r1.z);
/*232*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*233*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*234*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*235*/	  r5.z = r1.z * r5.y;
/*236*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*237*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*238*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*239*/	  r1.x = r5.y * r1.z + r1.x;
/*240*/	  r1.z = r3.y * r3.y;
/*241*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*242*/	  r1.z = r1.z * r3.y + r6.x;
/*243*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*244*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*245*/	  r3.y = -r1.z * r1.z + 1.000000;
/*246*/	  r3.y = max(r3.y, 0.001000);
/*247*/	  r3.y = log2(r3.y);
/*248*/	  r5.x = r3.y * 4.950617;
/*249*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*250*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*251*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*252*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*253*/	  r1.z = floatBitsToInt(r1.z);
/*254*/	  r5.x = r3.y * r3.y + -r5.x;
/*255*/	  r5.x = sqrt(r5.x);
/*256*/	  r3.y = -r3.y + r5.x;
/*257*/	  r3.y = max(r3.y, 0.000000);
/*258*/	  r3.y = sqrt(r3.y);
/*259*/	  r1.z = r1.z * r3.y;
/*260*/	  r1.z = r1.z * 1.414214;
/*261*/	  r1.z = 0.008727 / r1.z;
/*262*/	  r1.z = max(r1.z, 0.000100);
/*263*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*264*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*265*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*266*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*267*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*268*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*269*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*270*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*271*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*272*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*273*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*274*/	  r1.x = floatBitsToInt(r1.x);
/*275*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*276*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*277*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*278*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*279*/	  r1.x = r1.x * r5.x + 1.000000;
/*280*/	  r1.x = r1.x * 0.500000;
/*281*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*282*/	  r1.z = r1.z * r5.y + 1.000000;
/*283*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*284*/	  r1.z = min(r1.y, 1.000000);
/*285*/	  r2.w = r2.w * 1.570796;
/*286*/	  r2.w = sin(r2.w);
/*287*/	  r1.z = r1.z + -1.000000;
/*288*/	  r1.z = r2.w * r1.z + 1.000000;
/*289*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*290*/	  r2.w = max(r2.w, 0.000000);
/*291*/	  r2.w = log2(r2.w);
/*292*/	  r2.w = r2.w * 10.000000;
/*293*/	  r2.w = exp2(r2.w);
/*294*/	  r2.w = r6.w * r2.w;
/*295*/	  r2.w = r2.w * r7.x + r0.z;
/*296*/	  r1.x = r1.z * abs(r1.x);
/*297*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*298*/	} else {
/*299*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*300*/	}
/*301*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*302*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*303*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*304*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*305*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*306*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*307*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*308*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*309*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*310*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*311*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*312*/	r2.w = 1.000000;
/*313*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*314*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*315*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*316*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*317*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*318*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*319*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*320*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*321*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*322*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*323*/	if(r0.w != 0) discard;
/*324*/	r0.w = sqrt(r1.w);
/*325*/	r1.x = saturate(cb3.data[0].w)/**/;
/*326*/	r1.x = -r1.x + 1.000000;
/*327*/	r1.x = r1.x * 8.000000 + -4.000000;
/*328*/	r1.y = saturate(cb3.data[1].x)/**/;
/*329*/	r1.y = -r1.y + 1.000000;
/*330*/	r1.y = r1.y * 1000.000000;
/*331*/	r0.w = r0.w / r1.y;
/*332*/	r0.w = r0.w + r1.x;
/*333*/	r0.w = r0.w * 1.442695;
/*334*/	r0.w = exp2(r0.w);
/*335*/	r0.w = cb3.data[1].y / r0.w;
/*336*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*337*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*338*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*339*/	r1.x = r1.x + -cb3.data[1].z;
/*340*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*341*/	r1.x = saturate(r1.y * r1.x);
/*342*/	r1.y = r1.x * -2.000000 + 3.000000;
/*343*/	r1.x = r1.x * r1.x;
/*344*/	r1.x = r1.x * r1.y;
/*345*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*346*/	r1.y = sqrt(r1.y);
/*347*/	r1.z = max(cb3.data[2].z, 0.001000);
/*348*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*349*/	r1.y = r1.z * r1.y;
/*350*/	r1.y = min(r1.y, 1.000000);
/*351*/	r1.z = r1.y * -2.000000 + 3.000000;
/*352*/	r1.y = r1.y * r1.y;
/*353*/	r1.y = r1.y * r1.z;
/*354*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*355*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*356*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*357*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*358*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*359*/	r4.w = max(r4.y, 0.000000);
/*360*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*361*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*362*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*363*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*364*/	r0.w = saturate(r0.w * r1.y);
/*365*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*366*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*367*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*368*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*369*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*370*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*371*/	return;
}
