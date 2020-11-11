//
//
// Shader Model 4
// Fragment Shader
//
// id: 1175 - fxc/glsl_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*52*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*53*/	r4.x = 0;
/*54*/	r4.y = cb0.data[26].x * 0.050000;
/*55*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*56*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*57*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*58*/	r1.w = saturate(r4.x * 5.000000);
/*59*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*60*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*62*/	r2.w = log2(r5.z);
/*63*/	r2.w = r2.w * 1.800000;
/*64*/	r2.w = exp2(r2.w);
/*65*/	r2.w = r2.w * 10.000000;
/*66*/	r2.w = min(r2.w, 1.000000);
/*67*/	r1.w = r1.w + r2.w;
/*68*/	r1.w = r1.w * 0.500000;
/*69*/	r2.w = -r5.w + 1.000000;
/*70*/	r2.w = log2(r2.w);
/*71*/	r2.w = r2.w * vsOut_T7.x;
/*72*/	r2.w = exp2(r2.w);
/*73*/	r2.w = min(r2.w, 1.000000);
/*74*/	r2.w = r2.w * vsOut_T7.x;
/*75*/	r3.z = r5.z * 0.250000;
/*76*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*77*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*78*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*79*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*80*/	r1.w = vsOut_T7.x + -0.025000;
/*81*/	r1.w = max(r1.w, 0.000000);
/*82*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*83*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*84*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*87*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*88*/	r1.w = inversesqrt(r1.w);
/*89*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*90*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*93*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*94*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*95*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*96*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*97*/	r1.w = inversesqrt(r1.w);
/*98*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*99*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*100*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*101*/	if(floatBitsToUint(r0.w) != 0u) {
/*102*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*103*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*104*/	  r0.w = r3.w * cb0.data[26].x;
/*105*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*106*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*107*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*108*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*109*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*110*/	}
/*111*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*112*/	if(floatBitsToUint(r0.w) != 0u) {
/*113*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*114*/	  if(floatBitsToUint(r0.w) != 0u) {
/*115*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*116*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*117*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*118*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*119*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*120*/	    r0.w = -r0.w + 1.000000;
/*121*/	    r0.w = max(r0.w, 0.000000);
/*122*/	    r8.z = sqrt(r0.w);
/*123*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*124*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*125*/	    r0.w = inversesqrt(r0.w);
/*126*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*127*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*128*/	    r10.y = -1.000000;
/*129*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*130*/	    r0.w = inversesqrt(r0.w);
/*131*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*132*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*133*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*134*/	    r1.w = r1.w * 1.250000;
/*135*/	    r1.w = min(r1.w, 1.000000);
/*136*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*137*/	    r2.w = r2.w * 4.000000;
/*138*/	    r1.w = r1.w * 0.200000 + r2.w;
/*139*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*140*/	    r0.w = r0.w + -r1.w;
/*141*/	    r0.w = saturate(r0.w * 200.000000);
/*142*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*143*/	    r0.w = r0.w * r0.w;
/*144*/	    r0.w = r0.w * r1.w;
/*145*/	    r3.y = r0.w * -r3.y + r3.y;
/*146*/	    r1.w = -r3.x + 0.200000;
/*147*/	    r3.x = r0.w * r1.w + r3.x;
/*148*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*149*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*150*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*151*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*152*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*153*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*154*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*155*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*156*/	    r1.w = -r1.w + 1.000000;
/*157*/	    r1.w = max(r1.w, 0.000000);
/*158*/	    r7.z = sqrt(r1.w);
/*159*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*160*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*161*/	    r1.w = sqrt(r1.w);
/*162*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*163*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*164*/	    r1.w = inversesqrt(r1.w);
/*165*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*166*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*167*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*168*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*169*/	    r1.w = -r0.y + 1.000000;
/*170*/	    r0.w = min(r0.w, r1.w);
/*171*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*172*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*173*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*174*/	    r0.w = inversesqrt(r0.w);
/*175*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*176*/	  }
/*177*/	}
/*178*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*179*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*180*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*181*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*182*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*183*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*184*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*185*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*186*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*187*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*188*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*189*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*190*/	r1.w = inversesqrt(r1.w);
/*191*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*192*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*193*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*194*/	r1.w = inversesqrt(r1.w);
/*195*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*196*/	r1.w = -r3.y + 1.000000;
/*197*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*198*/	r4.x = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*199*/	r4.x = r4.x + r4.x;
/*200*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*201*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*202*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*203*/	r4.w = cos((r6.x));
/*204*/	r4.w = inversesqrt(r4.w);
/*205*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*206*/	r5.w = saturate(r0.w * 60.000000);
/*207*/	r5.w = -r0.w + r5.w;
/*208*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*209*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*210*/	r7.x = inversesqrt(r7.x);
/*211*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*212*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*213*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*214*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*215*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*216*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*217*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*218*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*219*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*220*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*221*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*222*/	r5.y = -r0.w + 1.000000;
/*223*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*224*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*225*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*226*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*227*/	  r5.y = max(r5.y, 0.000000);
/*228*/	  r5.y = log2(r5.y);
/*229*/	  r5.y = r5.y * 10.000000;
/*230*/	  r5.y = exp2(r5.y);
/*231*/	  r5.y = r4.w * r5.y;
/*232*/	  r5.y = r5.y * r5.w + r0.w;
/*233*/	  r7.x = r1.w * 8.000000;
/*234*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*235*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*236*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*237*/	}
/*238*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*239*/	r7.x = max(r5.y, 0.000000);
/*240*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*241*/	if(floatBitsToUint(r5.y) != 0u) {
/*242*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*243*/	  r4.x = max(r4.x, -1.000000);
/*244*/	  r4.x = min(r4.x, 1.000000);
/*245*/	  r4.y = -abs(r4.x) + 1.000000;
/*246*/	  r4.y = sqrt(r4.y);
/*247*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*248*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*249*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*250*/	  r5.y = r4.y * r4.z;
/*251*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*252*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*253*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*254*/	  r4.x = r4.z * r4.y + r4.x;
/*255*/	  r3.y = r3.y * r3.y;
/*256*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*257*/	  r2.w = r3.y * r2.w + r5.x;
/*258*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*259*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*260*/	  r3.y = -r2.w * r2.w + 1.000000;
/*261*/	  r3.y = max(r3.y, 0.001000);
/*262*/	  r3.y = log2(r3.y);
/*263*/	  r4.y = r3.y * 4.950617;
/*264*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*265*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*266*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*267*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*268*/	  r2.w = floatBitsToInt(r2.w);
/*269*/	  r4.y = r3.y * r3.y + -r4.y;
/*270*/	  r4.y = sqrt(r4.y);
/*271*/	  r3.y = -r3.y + r4.y;
/*272*/	  r3.y = max(r3.y, 0.000000);
/*273*/	  r3.y = sqrt(r3.y);
/*274*/	  r2.w = r2.w * r3.y;
/*275*/	  r2.w = r2.w * 1.414214;
/*276*/	  r2.w = 0.008727 / r2.w;
/*277*/	  r2.w = max(r2.w, 0.000100);
/*278*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*279*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*280*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*281*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*282*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*283*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*284*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*285*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*286*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*287*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*288*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*289*/	  r2.w = floatBitsToInt(r2.w);
/*290*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*291*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*292*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*293*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*294*/	  r2.w = r2.w * r4.x + 1.000000;
/*295*/	  r2.w = r2.w * 0.500000;
/*296*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*297*/	  r3.y = r3.y * r4.y + 1.000000;
/*298*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*299*/	  r3.y = min(r7.x, 1.000000);
/*300*/	  r1.w = r1.w * 1.570796;
/*301*/	  r1.w = sin(r1.w);
/*302*/	  r3.y = r3.y + -1.000000;
/*303*/	  r1.w = r1.w * r3.y + 1.000000;
/*304*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*305*/	  r3.x = max(r3.x, 0.000000);
/*306*/	  r3.x = log2(r3.x);
/*307*/	  r3.x = r3.x * 10.000000;
/*308*/	  r3.x = exp2(r3.x);
/*309*/	  r3.x = r4.w * r3.x;
/*310*/	  r3.x = r3.x * r5.w + r0.w;
/*311*/	  r1.w = r1.w * abs(r2.w);
/*312*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*313*/	} else {
/*314*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*315*/	}
/*316*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*317*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*318*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*319*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*320*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*321*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*322*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*323*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*324*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*325*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*326*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*327*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*328*/	r1.w = inversesqrt(r1.w);
/*329*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*330*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*331*/	r1.w = r1.w + r1.w;
/*332*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*333*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*334*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*335*/	r0.x = max(r0.x, 0.000000);
/*336*/	r0.x = log2(r0.x);
/*337*/	r0.x = r0.x * 10.000000;
/*338*/	r0.x = exp2(r0.x);
/*339*/	r0.x = r4.w * r0.x;
/*340*/	r0.x = r0.x * r5.w + r0.w;
/*341*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*342*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*343*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*344*/	r0.w = 1.000000;
/*345*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*346*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*347*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*348*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*349*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*350*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*351*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*352*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*353*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*354*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*355*/	if(r0.x != 0) discard;
/*356*/	color1.x = 1.000000;
/*357*/	return;
}
