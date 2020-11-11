//
//
// Shader Model 4
// Fragment Shader
//
// id: 986 - fxc/glsl_SM_3_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;

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
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r3.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*24*/	r4.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*25*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*26*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*27*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*28*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*29*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*30*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*31*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*32*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*33*/	if(floatBitsToUint(r1.w) != 0u) {
/*34*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*35*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*37*/	  r1.w = -r1.w + 1.000000;
/*38*/	  r1.w = max(r1.w, 0.000000);
/*39*/	  r5.z = sqrt(r1.w);
/*40*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*41*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*42*/	  r1.w = r3.y * r7.w;
/*43*/	  r3.y = r1.w * -0.500000 + r3.y;
/*44*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*45*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*46*/	  r1.w = -r4.w * r6.w + 1.000000;
/*47*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*48*/	  r4.xyz = (-r0.xywx + r5.xyzx).xyz;
/*49*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*50*/	}
/*51*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*52*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy).zw;
/*53*/	r4.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx + vsOut_T6.yzyy).xy;
/*54*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*55*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*56*/	r1.w = r4.w * r5.w;
/*57*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*58*/	r1.xyz = (r1.wwww * r5.xyzx + r1.xyzx).xyz;
/*59*/	r0.xy = (r4.xyxx * r4.wwww + r0.xyxx).xy;
/*60*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*61*/	r2.w = inversesqrt(r2.w);
/*62*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*63*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*64*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*65*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*66*/	r2.w = saturate(-r2.w + r4.w);
/*67*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*68*/	if(floatBitsToUint(r2.w) != 0u) {
/*69*/	  r2.w = -r4.w + 1.000000;
/*70*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*71*/	  r2.w = -r2.w + 1.000000;
/*72*/	  r2.w = -r2.w * r2.w + 1.000000;
/*73*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*74*/	  r4.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*75*/	  r2.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*76*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*77*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*78*/	  r5.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*79*/	  r1.xyz = (r2.wwww * r5.xyzx + r4.xyzx).xyz;
/*80*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*81*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*82*/	} else {
/*83*/	  r5.xyz = (r1.wwww * r2.xyzx).xyz;
/*84*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*85*/	}
/*86*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*89*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*92*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*95*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*96*/	r7.xyz = (r0.xxxx * r2.xyzx + r7.xyzx).xyz;
/*97*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*98*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*101*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*102*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*103*/	if(floatBitsToUint(r0.w) != 0u) {
/*104*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*105*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*106*/	  r0.w = r3.w * cb1.data[26].x;
/*107*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*108*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*109*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*110*/	  r4.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r4.xyzx).xyz;
/*111*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*112*/	}
/*113*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*114*/	if(floatBitsToUint(r0.w) != 0u) {
/*115*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*116*/	  if(floatBitsToUint(r0.w) != 0u) {
/*117*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*118*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*119*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*120*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*121*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*122*/	    r0.w = -r0.w + 1.000000;
/*123*/	    r0.w = max(r0.w, 0.000000);
/*124*/	    r8.z = sqrt(r0.w);
/*125*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*126*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*127*/	    r0.w = inversesqrt(r0.w);
/*128*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*129*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*130*/	    r10.y = -1.000000;
/*131*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*132*/	    r0.w = inversesqrt(r0.w);
/*133*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*134*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*135*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*136*/	    r1.w = r1.w * 1.250000;
/*137*/	    r1.w = min(r1.w, 1.000000);
/*138*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*139*/	    r2.w = r2.w * 4.000000;
/*140*/	    r1.w = r1.w * 0.200000 + r2.w;
/*141*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*142*/	    r0.w = r0.w + -r1.w;
/*143*/	    r0.w = saturate(r0.w * 200.000000);
/*144*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*145*/	    r0.w = r0.w * r0.w;
/*146*/	    r0.w = r0.w * r1.w;
/*147*/	    r3.x = r0.w * -r3.x + r3.x;
/*148*/	    r1.w = -r3.y + 0.200000;
/*149*/	    r3.y = r0.w * r1.w + r3.y;
/*150*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*151*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*152*/	    r9.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*153*/	    r4.xyz = (r0.wwww * r9.xyzx + r4.xyzx).xyz;
/*154*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*155*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*156*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*157*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*158*/	    r1.w = -r1.w + 1.000000;
/*159*/	    r1.w = max(r1.w, 0.000000);
/*160*/	    r7.z = sqrt(r1.w);
/*161*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*162*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*163*/	    r1.w = sqrt(r1.w);
/*164*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*165*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*166*/	    r1.w = inversesqrt(r1.w);
/*167*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*168*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*169*/	    r2.xyz = (r7.xxxx * r2.xyzx + r5.xyzx).xyz;
/*170*/	    r2.xyz = (r7.zzzz * r6.xyzx + r2.xyzx).xyz;
/*171*/	    r1.w = -r0.y + 1.000000;
/*172*/	    r0.w = min(r0.w, r1.w);
/*173*/	    r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*174*/	    r2.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*175*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*176*/	    r0.w = inversesqrt(r0.w);
/*177*/	    r0.xyz = (r0.wwww * r2.xyzx).xyz;
/*178*/	  }
/*179*/	}
/*180*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*181*/	r2.xyz = (r1.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*182*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*183*/	r1.xyz = saturate(vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*184*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*185*/	r2.xyz = (-r1.xyzx + r1.wwww).xyz;
/*186*/	r1.xyz = (vsOut_T7.zzzz * r2.xyzx + r1.xyzx).xyz;
/*187*/	r1.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*188*/	r2.xyz = (-r4.xyzx + r1.wwww).xyz;
/*189*/	r2.xyz = (vsOut_T7.zzzz * r2.xyzx + r4.xyzx).xyz;
/*190*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*191*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*192*/	r1.w = inversesqrt(r1.w);
/*193*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*194*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*195*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*196*/	r2.w = inversesqrt(r1.w);
/*197*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*198*/	r2.w = -r3.x + 1.000000;
/*199*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*200*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*201*/	r5.y = r5.y + r5.y;
/*202*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*203*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*204*/	r6.w = r2.w * 1.539380;
/*205*/	r6.w = cos((r6.w));
/*206*/	r6.w = inversesqrt(r6.w);
/*207*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*208*/	r7.x = saturate(r0.w * 60.000000);
/*209*/	r7.x = -r0.w + r7.x;
/*210*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*211*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*212*/	r8.x = inversesqrt(r8.x);
/*213*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*214*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*215*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*216*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*217*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*218*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*219*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*220*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*221*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*222*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*223*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*224*/	r6.y = -r0.w + 1.000000;
/*225*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*226*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*227*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*228*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*229*/	  r6.y = max(r6.y, 0.000000);
/*230*/	  r6.y = log2(r6.y);
/*231*/	  r6.y = r6.y * 10.000000;
/*232*/	  r6.y = exp2(r6.y);
/*233*/	  r6.y = r6.w * r6.y;
/*234*/	  r6.y = r6.y * r7.x + r0.w;
/*235*/	  r8.x = r2.w * 8.000000;
/*236*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*237*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*238*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*239*/	}
/*240*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*241*/	r0.y = max(r0.x, 0.000000);
/*242*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*243*/	if(floatBitsToUint(r0.x) != 0u) {
/*244*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*245*/	  r0.x = max(r0.x, -1.000000);
/*246*/	  r0.x = min(r0.x, 1.000000);
/*247*/	  r0.z = -abs(r0.x) + 1.000000;
/*248*/	  r0.z = sqrt(r0.z);
/*249*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*250*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*251*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*252*/	  r5.z = r0.z * r5.y;
/*253*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*254*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*255*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*256*/	  r0.x = r5.y * r0.z + r0.x;
/*257*/	  r0.z = r3.x * r3.x;
/*258*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*259*/	  r0.z = r0.z * r3.x + r6.x;
/*260*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*261*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*262*/	  r3.x = -r0.z * r0.z + 1.000000;
/*263*/	  r3.x = max(r3.x, 0.001000);
/*264*/	  r3.x = log2(r3.x);
/*265*/	  r5.x = r3.x * 4.950617;
/*266*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*267*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*268*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*269*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*270*/	  r0.z = floatBitsToInt(r0.z);
/*271*/	  r5.x = r3.x * r3.x + -r5.x;
/*272*/	  r5.x = sqrt(r5.x);
/*273*/	  r3.x = -r3.x + r5.x;
/*274*/	  r3.x = max(r3.x, 0.000000);
/*275*/	  r3.x = sqrt(r3.x);
/*276*/	  r0.z = r0.z * r3.x;
/*277*/	  r0.z = r0.z * 1.414214;
/*278*/	  r0.z = 0.008727 / r0.z;
/*279*/	  r0.z = max(r0.z, 0.000100);
/*280*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*281*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*282*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*283*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*284*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*285*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*286*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*287*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*288*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*289*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*290*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*291*/	  r0.x = floatBitsToInt(r0.x);
/*292*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*293*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*294*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*295*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*296*/	  r0.x = r0.x * r5.x + 1.000000;
/*297*/	  r0.x = r0.x * 0.500000;
/*298*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*299*/	  r0.z = r0.z * r5.y + 1.000000;
/*300*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*301*/	  r0.z = min(r0.y, 1.000000);
/*302*/	  r2.w = r2.w * 1.570796;
/*303*/	  r2.w = sin(r2.w);
/*304*/	  r0.z = r0.z + -1.000000;
/*305*/	  r0.z = r2.w * r0.z + 1.000000;
/*306*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*307*/	  r2.w = max(r2.w, 0.000000);
/*308*/	  r2.w = log2(r2.w);
/*309*/	  r2.w = r2.w * 10.000000;
/*310*/	  r2.w = exp2(r2.w);
/*311*/	  r2.w = r6.w * r2.w;
/*312*/	  r2.w = r2.w * r7.x + r0.w;
/*313*/	  r0.x = r0.z * abs(r0.x);
/*314*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*315*/	} else {
/*316*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*317*/	}
/*318*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*319*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*320*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*321*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*322*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*323*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*324*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*325*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*326*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*327*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*328*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*329*/	r2.w = 1.000000;
/*330*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*331*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*332*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*333*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*334*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*335*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*336*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*337*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*338*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*339*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*340*/	if(r0.w != 0) discard;
/*341*/	r0.w = sqrt(r1.w);
/*342*/	r1.x = saturate(cb3.data[0].w)/**/;
/*343*/	r1.x = -r1.x + 1.000000;
/*344*/	r1.x = r1.x * 8.000000 + -4.000000;
/*345*/	r1.y = saturate(cb3.data[1].x)/**/;
/*346*/	r1.y = -r1.y + 1.000000;
/*347*/	r1.y = r1.y * 1000.000000;
/*348*/	r0.w = r0.w / r1.y;
/*349*/	r0.w = r0.w + r1.x;
/*350*/	r0.w = r0.w * 1.442695;
/*351*/	r0.w = exp2(r0.w);
/*352*/	r0.w = cb3.data[1].y / r0.w;
/*353*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*354*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*355*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*356*/	r1.x = r1.x + -cb3.data[1].z;
/*357*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*358*/	r1.x = saturate(r1.y * r1.x);
/*359*/	r1.y = r1.x * -2.000000 + 3.000000;
/*360*/	r1.x = r1.x * r1.x;
/*361*/	r1.x = r1.x * r1.y;
/*362*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*363*/	r1.y = sqrt(r1.y);
/*364*/	r1.z = max(cb3.data[2].z, 0.001000);
/*365*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*366*/	r1.y = r1.z * r1.y;
/*367*/	r1.y = min(r1.y, 1.000000);
/*368*/	r1.z = r1.y * -2.000000 + 3.000000;
/*369*/	r1.y = r1.y * r1.y;
/*370*/	r1.y = r1.y * r1.z;
/*371*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*372*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*373*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*374*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*375*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*376*/	r4.w = max(r4.y, 0.000000);
/*377*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*378*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*379*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*380*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*381*/	r0.w = saturate(r0.w * r1.y);
/*382*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*383*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*384*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*385*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*386*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*387*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*388*/	return;
}
