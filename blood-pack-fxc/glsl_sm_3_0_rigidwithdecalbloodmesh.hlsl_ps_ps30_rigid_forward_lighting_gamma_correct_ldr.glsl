//
//
// Shader Model 4
// Fragment Shader
//
// id: 1143 - fxc/glsl_SM_3_0_rigidwithdecalbloodmesh.hlsl_PS_ps30_rigid_forward_lighting_gamma_correct_LDR.glsl
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
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;

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
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
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
/*60*/	  r1.w = r3.y * r7.w;
/*61*/	  r3.y = r1.w * -0.500000 + r3.y;
/*62*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*63*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*64*/	  r1.w = -r4.w * r6.w + 1.000000;
/*65*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*66*/	  r4.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*67*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*68*/	}
/*69*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy).zw;
/*70*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*71*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*72*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*73*/	r1.w = saturate(-r1.w + r4.w);
/*74*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*75*/	if(floatBitsToUint(r1.w) != 0u) {
/*76*/	  r1.w = -r4.w + 1.000000;
/*77*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*78*/	  r1.w = -r1.w + 1.000000;
/*79*/	  r1.w = -r1.w * r1.w + 1.000000;
/*80*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*81*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*82*/	  r1.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*83*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*84*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*85*/	  r5.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*86*/	  r0.xyw = (r1.wwww * r5.xyxz + r4.xyxz).xyw;
/*87*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*88*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*89*/	}
/*90*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*93*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*94*/	r1.w = inversesqrt(r1.w);
/*95*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*96*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*97*/	r1.w = inversesqrt(r1.w);
/*98*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*99*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*100*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*101*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*102*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*103*/	r1.w = inversesqrt(r1.w);
/*104*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*105*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*106*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*107*/	if(floatBitsToUint(r0.z) != 0u) {
/*108*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*109*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*110*/	  r0.z = r3.w * cb1.data[26].x;
/*111*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*112*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*113*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*114*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*115*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*116*/	}
/*117*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*118*/	if(floatBitsToUint(r0.z) != 0u) {
/*119*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*120*/	  if(floatBitsToUint(r0.z) != 0u) {
/*121*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*122*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*123*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*124*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*125*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*126*/	    r0.z = -r0.z + 1.000000;
/*127*/	    r0.z = max(r0.z, 0.000000);
/*128*/	    r8.z = sqrt(r0.z);
/*129*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*130*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*131*/	    r0.z = inversesqrt(r0.z);
/*132*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*133*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*134*/	    r10.y = -1.000000;
/*135*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*136*/	    r0.z = inversesqrt(r0.z);
/*137*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*138*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*139*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*140*/	    r1.w = r1.w * 1.250000;
/*141*/	    r1.w = min(r1.w, 1.000000);
/*142*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*143*/	    r2.w = r2.w * 4.000000;
/*144*/	    r1.w = r1.w * 0.200000 + r2.w;
/*145*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*146*/	    r0.z = r0.z + -r1.w;
/*147*/	    r0.z = saturate(r0.z * 200.000000);
/*148*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*149*/	    r0.z = r0.z * r0.z;
/*150*/	    r0.z = r0.z * r1.w;
/*151*/	    r3.x = r0.z * -r3.x + r3.x;
/*152*/	    r1.w = -r3.y + 0.200000;
/*153*/	    r3.y = r0.z * r1.w + r3.y;
/*154*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*155*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*156*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*157*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*158*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*159*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*160*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*161*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*162*/	    r1.w = -r1.w + 1.000000;
/*163*/	    r1.w = max(r1.w, 0.000000);
/*164*/	    r7.z = sqrt(r1.w);
/*165*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*166*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*167*/	    r1.w = sqrt(r1.w);
/*168*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*169*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*170*/	    r1.w = inversesqrt(r1.w);
/*171*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*172*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*173*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*174*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*175*/	    r1.w = -r1.y + 1.000000;
/*176*/	    r0.z = min(r0.z, r1.w);
/*177*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*178*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*179*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*180*/	    r0.z = inversesqrt(r0.z);
/*181*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*182*/	  }
/*183*/	}
/*184*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*185*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*186*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*187*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*188*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*189*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*190*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*191*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*192*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*193*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*194*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*195*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*196*/	r1.w = inversesqrt(r1.w);
/*197*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*198*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*199*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*200*/	r2.w = inversesqrt(r1.w);
/*201*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*202*/	r2.w = -r3.x + 1.000000;
/*203*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*204*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*205*/	r5.y = r5.y + r5.y;
/*206*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*207*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*208*/	r6.w = r2.w * 1.539380;
/*209*/	r6.w = cos((r6.w));
/*210*/	r6.w = inversesqrt(r6.w);
/*211*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*212*/	r7.x = saturate(r0.z * 60.000000);
/*213*/	r7.x = -r0.z + r7.x;
/*214*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*215*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*216*/	r8.x = inversesqrt(r8.x);
/*217*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*218*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*219*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*220*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*221*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*222*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*223*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*224*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*225*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*226*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*227*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*228*/	r6.y = -r0.z + 1.000000;
/*229*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*230*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*231*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*232*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*233*/	  r6.y = max(r6.y, 0.000000);
/*234*/	  r6.y = log2(r6.y);
/*235*/	  r6.y = r6.y * 10.000000;
/*236*/	  r6.y = exp2(r6.y);
/*237*/	  r6.y = r6.w * r6.y;
/*238*/	  r6.y = r6.y * r7.x + r0.z;
/*239*/	  r8.x = r2.w * 8.000000;
/*240*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*241*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*242*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*243*/	}
/*244*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*245*/	r1.y = max(r1.x, 0.000000);
/*246*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*247*/	if(floatBitsToUint(r1.x) != 0u) {
/*248*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*249*/	  r1.x = max(r1.x, -1.000000);
/*250*/	  r1.x = min(r1.x, 1.000000);
/*251*/	  r1.z = -abs(r1.x) + 1.000000;
/*252*/	  r1.z = sqrt(r1.z);
/*253*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*254*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*255*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*256*/	  r5.z = r1.z * r5.y;
/*257*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*258*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*259*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*260*/	  r1.x = r5.y * r1.z + r1.x;
/*261*/	  r1.z = r3.x * r3.x;
/*262*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*263*/	  r1.z = r1.z * r3.x + r6.x;
/*264*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*265*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*266*/	  r3.x = -r1.z * r1.z + 1.000000;
/*267*/	  r3.x = max(r3.x, 0.001000);
/*268*/	  r3.x = log2(r3.x);
/*269*/	  r5.x = r3.x * 4.950617;
/*270*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*271*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*272*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*273*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*274*/	  r1.z = floatBitsToInt(r1.z);
/*275*/	  r5.x = r3.x * r3.x + -r5.x;
/*276*/	  r5.x = sqrt(r5.x);
/*277*/	  r3.x = -r3.x + r5.x;
/*278*/	  r3.x = max(r3.x, 0.000000);
/*279*/	  r3.x = sqrt(r3.x);
/*280*/	  r1.z = r1.z * r3.x;
/*281*/	  r1.z = r1.z * 1.414214;
/*282*/	  r1.z = 0.008727 / r1.z;
/*283*/	  r1.z = max(r1.z, 0.000100);
/*284*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*285*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*286*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*287*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*288*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*289*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*290*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*291*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*292*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*293*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*294*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*295*/	  r1.x = floatBitsToInt(r1.x);
/*296*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*297*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*298*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*299*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*300*/	  r1.x = r1.x * r5.x + 1.000000;
/*301*/	  r1.x = r1.x * 0.500000;
/*302*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*303*/	  r1.z = r1.z * r5.y + 1.000000;
/*304*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*305*/	  r1.z = min(r1.y, 1.000000);
/*306*/	  r2.w = r2.w * 1.570796;
/*307*/	  r2.w = sin(r2.w);
/*308*/	  r1.z = r1.z + -1.000000;
/*309*/	  r1.z = r2.w * r1.z + 1.000000;
/*310*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*311*/	  r2.w = max(r2.w, 0.000000);
/*312*/	  r2.w = log2(r2.w);
/*313*/	  r2.w = r2.w * 10.000000;
/*314*/	  r2.w = exp2(r2.w);
/*315*/	  r2.w = r6.w * r2.w;
/*316*/	  r2.w = r2.w * r7.x + r0.z;
/*317*/	  r1.x = r1.z * abs(r1.x);
/*318*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*319*/	} else {
/*320*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*321*/	}
/*322*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*323*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*324*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*325*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*326*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*327*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*328*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*329*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*330*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*331*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*332*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*333*/	r2.w = 1.000000;
/*334*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*335*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*336*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*337*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*338*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*339*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*340*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*341*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*342*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*343*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*344*/	if(r0.w != 0) discard;
/*345*/	r0.w = sqrt(r1.w);
/*346*/	r1.x = saturate(cb3.data[0].w)/**/;
/*347*/	r1.x = -r1.x + 1.000000;
/*348*/	r1.x = r1.x * 8.000000 + -4.000000;
/*349*/	r1.y = saturate(cb3.data[1].x)/**/;
/*350*/	r1.y = -r1.y + 1.000000;
/*351*/	r1.y = r1.y * 1000.000000;
/*352*/	r0.w = r0.w / r1.y;
/*353*/	r0.w = r0.w + r1.x;
/*354*/	r0.w = r0.w * 1.442695;
/*355*/	r0.w = exp2(r0.w);
/*356*/	r0.w = cb3.data[1].y / r0.w;
/*357*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*358*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*359*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*360*/	r1.x = r1.x + -cb3.data[1].z;
/*361*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*362*/	r1.x = saturate(r1.y * r1.x);
/*363*/	r1.y = r1.x * -2.000000 + 3.000000;
/*364*/	r1.x = r1.x * r1.x;
/*365*/	r1.x = r1.x * r1.y;
/*366*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*367*/	r1.y = sqrt(r1.y);
/*368*/	r1.z = max(cb3.data[2].z, 0.001000);
/*369*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*370*/	r1.y = r1.z * r1.y;
/*371*/	r1.y = min(r1.y, 1.000000);
/*372*/	r1.z = r1.y * -2.000000 + 3.000000;
/*373*/	r1.y = r1.y * r1.y;
/*374*/	r1.y = r1.y * r1.z;
/*375*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*376*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*377*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*378*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*379*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*380*/	r4.w = max(r4.y, 0.000000);
/*381*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*382*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*383*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*384*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*385*/	r0.w = saturate(r0.w * r1.y);
/*386*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*387*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*388*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*389*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*390*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*391*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*392*/	return;
}
