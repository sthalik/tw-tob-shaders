//
//
// Shader Model 4
// Fragment Shader
//
// id: 1249 - fxc/glsl_SM_4_0_rigidwithdirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*7*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*8*/	r0.y = r1.w + -0.500000;
/*9*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*10*/	if(r0.y != 0) discard;
/*11*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*12*/	color0.w = r0.x * r1.w;
/*13*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r0.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*15*/	r2.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*16*/	r0.x = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*17*/	r0.x = -r0.x + 1.000000;
/*18*/	r0.x = max(r0.x, 0.000000);
/*19*/	r2.z = sqrt(r0.x);
/*20*/	r0.xyw = (mix(r2.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*21*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*22*/	r2.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx).xy;
/*23*/	r3.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*24*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*25*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = r2.w * r3.w;
/*27*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*28*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*29*/	r0.xy = (r3.xyxx * r2.wwww + r0.xyxx).xy;
/*30*/	r2.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*31*/	r2.z = inversesqrt(r2.z);
/*32*/	r0.xyw = (r0.xyxw * r2.zzzz).xyw;
/*33*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*34*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*35*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*36*/	r2.x = saturate(-r2.x + r2.w);
/*37*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*38*/	if(floatBitsToUint(r2.x) != 0u) {
/*39*/	  r2.x = -r2.w + 1.000000;
/*40*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*41*/	  r2.x = -r2.x + 1.000000;
/*42*/	  r2.x = -r2.x * r2.x + 1.000000;
/*43*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*44*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*45*/	  r2.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*46*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*47*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*48*/	  r3.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*49*/	  r1.xyz = (r2.wwww * r3.xyzx + r2.xyzx).xyz;
/*50*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*51*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*52*/	} else {
/*53*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*54*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*55*/	  r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*56*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*57*/	}
/*58*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*61*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*64*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*67*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*68*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*69*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*70*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*73*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*74*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*75*/	if(floatBitsToUint(r0.w) != 0u) {
/*76*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*77*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*78*/	  r0.w = r3.w * cb0.data[26].x;
/*79*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*80*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*81*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*82*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*83*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*84*/	}
/*85*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*86*/	if(floatBitsToUint(r0.w) != 0u) {
/*87*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*88*/	  if(floatBitsToUint(r0.w) != 0u) {
/*89*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*90*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*91*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*92*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*93*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*94*/	    r0.w = -r0.w + 1.000000;
/*95*/	    r0.w = max(r0.w, 0.000000);
/*96*/	    r8.z = sqrt(r0.w);
/*97*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*98*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*99*/	    r0.w = inversesqrt(r0.w);
/*100*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*101*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*102*/	    r10.y = -1.000000;
/*103*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*104*/	    r0.w = inversesqrt(r0.w);
/*105*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*106*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*107*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*108*/	    r1.w = r1.w * 1.250000;
/*109*/	    r1.w = min(r1.w, 1.000000);
/*110*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*111*/	    r2.w = r2.w * 4.000000;
/*112*/	    r1.w = r1.w * 0.200000 + r2.w;
/*113*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*114*/	    r0.w = r0.w + -r1.w;
/*115*/	    r0.w = saturate(r0.w * 200.000000);
/*116*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*117*/	    r0.w = r0.w * r0.w;
/*118*/	    r0.w = r0.w * r1.w;
/*119*/	    r3.x = r0.w * -r3.x + r3.x;
/*120*/	    r1.w = -r3.y + 0.200000;
/*121*/	    r3.y = r0.w * r1.w + r3.y;
/*122*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*123*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*124*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*125*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*126*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*127*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*128*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*129*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*130*/	    r1.w = -r1.w + 1.000000;
/*131*/	    r1.w = max(r1.w, 0.000000);
/*132*/	    r7.z = sqrt(r1.w);
/*133*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*134*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*135*/	    r1.w = sqrt(r1.w);
/*136*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*137*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*138*/	    r1.w = inversesqrt(r1.w);
/*139*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*140*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*141*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*142*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*143*/	    r1.w = -r0.y + 1.000000;
/*144*/	    r0.w = min(r0.w, r1.w);
/*145*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*146*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*147*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*148*/	    r0.w = inversesqrt(r0.w);
/*149*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*150*/	  }
/*151*/	}
/*152*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*153*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*154*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*155*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*156*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*157*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*158*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*159*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*160*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*161*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*162*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*163*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*164*/	r1.w = inversesqrt(r1.w);
/*165*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*166*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*167*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*168*/	r1.w = inversesqrt(r1.w);
/*169*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*170*/	r1.w = -r3.x + 1.000000;
/*171*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*172*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*173*/	r4.x = r4.x + r4.x;
/*174*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*175*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*176*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*177*/	r4.w = cos((r6.x));
/*178*/	r4.w = inversesqrt(r4.w);
/*179*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*180*/	r5.w = saturate(r0.w * 60.000000);
/*181*/	r5.w = -r0.w + r5.w;
/*182*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*183*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*184*/	r7.x = inversesqrt(r7.x);
/*185*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*186*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*187*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*188*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*189*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*190*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*191*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*192*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*193*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*194*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*195*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*196*/	r5.y = -r0.w + 1.000000;
/*197*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*198*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*199*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*200*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*201*/	  r5.y = max(r5.y, 0.000000);
/*202*/	  r5.y = log2(r5.y);
/*203*/	  r5.y = r5.y * 10.000000;
/*204*/	  r5.y = exp2(r5.y);
/*205*/	  r5.y = r4.w * r5.y;
/*206*/	  r5.y = r5.y * r5.w + r0.w;
/*207*/	  r7.x = r1.w * 8.000000;
/*208*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*209*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*210*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*211*/	}
/*212*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*213*/	r7.x = max(r5.y, 0.000000);
/*214*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*215*/	if(floatBitsToUint(r5.y) != 0u) {
/*216*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*217*/	  r4.x = max(r4.x, -1.000000);
/*218*/	  r4.x = min(r4.x, 1.000000);
/*219*/	  r4.y = -abs(r4.x) + 1.000000;
/*220*/	  r4.y = sqrt(r4.y);
/*221*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*222*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*223*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*224*/	  r5.y = r4.y * r4.z;
/*225*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*226*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*227*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*228*/	  r4.x = r4.z * r4.y + r4.x;
/*229*/	  r3.x = r3.x * r3.x;
/*230*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*231*/	  r2.w = r3.x * r2.w + r5.x;
/*232*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*233*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*234*/	  r3.x = -r2.w * r2.w + 1.000000;
/*235*/	  r3.x = max(r3.x, 0.001000);
/*236*/	  r3.x = log2(r3.x);
/*237*/	  r4.y = r3.x * 4.950617;
/*238*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*239*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*240*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*241*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*242*/	  r2.w = floatBitsToInt(r2.w);
/*243*/	  r4.y = r3.x * r3.x + -r4.y;
/*244*/	  r4.y = sqrt(r4.y);
/*245*/	  r3.x = -r3.x + r4.y;
/*246*/	  r3.x = max(r3.x, 0.000000);
/*247*/	  r3.x = sqrt(r3.x);
/*248*/	  r2.w = r2.w * r3.x;
/*249*/	  r2.w = r2.w * 1.414214;
/*250*/	  r2.w = 0.008727 / r2.w;
/*251*/	  r2.w = max(r2.w, 0.000100);
/*252*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*253*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*254*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*255*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*256*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*257*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*258*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*259*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*260*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*261*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*262*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*263*/	  r2.w = floatBitsToInt(r2.w);
/*264*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*265*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*266*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*267*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*268*/	  r2.w = r2.w * r4.x + 1.000000;
/*269*/	  r2.w = r2.w * 0.500000;
/*270*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*271*/	  r3.x = r3.x * r4.y + 1.000000;
/*272*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*273*/	  r3.x = min(r7.x, 1.000000);
/*274*/	  r1.w = r1.w * 1.570796;
/*275*/	  r1.w = sin(r1.w);
/*276*/	  r3.x = r3.x + -1.000000;
/*277*/	  r1.w = r1.w * r3.x + 1.000000;
/*278*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*279*/	  r3.x = max(r3.x, 0.000000);
/*280*/	  r3.x = log2(r3.x);
/*281*/	  r3.x = r3.x * 10.000000;
/*282*/	  r3.x = exp2(r3.x);
/*283*/	  r3.x = r4.w * r3.x;
/*284*/	  r3.x = r3.x * r5.w + r0.w;
/*285*/	  r1.w = r1.w * abs(r2.w);
/*286*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*287*/	} else {
/*288*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*289*/	}
/*290*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*291*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*292*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*293*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*294*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*295*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*296*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*297*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*298*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*299*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*300*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*301*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*302*/	r1.w = inversesqrt(r1.w);
/*303*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*304*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*305*/	r1.w = r1.w + r1.w;
/*306*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*307*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*308*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*309*/	r0.x = max(r0.x, 0.000000);
/*310*/	r0.x = log2(r0.x);
/*311*/	r0.x = r0.x * 10.000000;
/*312*/	r0.x = exp2(r0.x);
/*313*/	r0.x = r4.w * r0.x;
/*314*/	r0.x = r0.x * r5.w + r0.w;
/*315*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*316*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*317*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*318*/	r0.w = 1.000000;
/*319*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*320*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*321*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*322*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*323*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*324*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*325*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*326*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*327*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*328*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*329*/	if(r0.x != 0) discard;
/*330*/	color1.x = 1.000000;
/*331*/	return;
}
