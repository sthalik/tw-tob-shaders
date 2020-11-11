//
//
// Shader Model 4
// Fragment Shader
//
// id: 1123 - fxc/glsl_SM_4_0_rigidwithdecalburnmesh.hlsl_PS_ps30_gbuffer_40.glsl
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
flat in uint vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  color3 = vec4(0);
  color4 = uint(0);
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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].z))) * 0xffffffffu)).w;
/*3*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*4*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*5*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*6*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_N0.w);
/*9*/	r5.xyz = (r5.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r5.xyz = (r1.wwww * r5.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*12*/	r4.xyw = (r4.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r4.xyw = (r1.wwww * r4.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*15*/	r6.xyz = (r6.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r6.xyz = (r1.wwww * r6.xyzx + cb3.data[2].xyzx).xyz;
/*17*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*19*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*21*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*23*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*24*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*31*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*32*/	r4.w = 1.000000;
/*33*/	r1.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*34*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*35*/	r4.xy = (-cb2.data[3].xyxx + cb2.data[3].zwzz).xy;
/*36*/	r4.zw = (vsOut_T1.xxxy + -cb2.data[3].xxxy).zw;
/*37*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*38*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*39*/	r5.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*40*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.z) & floatBitsToUint(r5.x));
/*41*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r4.w));
/*42*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.w) & floatBitsToUint(r4.w));
/*43*/	r4.z = vsOut_T6.x;
/*44*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*45*/	r6.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*46*/	if(floatBitsToUint(r4.w) != 0u) {
/*47*/	  r4.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*48*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*49*/	  r4.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*50*/	  r4.w = -r4.w + 1.000000;
/*51*/	  r4.w = max(r4.w, 0.000000);
/*52*/	  r4.z = sqrt(r4.w);
/*53*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*54*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*55*/	  r4.w = r2.x * r7.w;
/*56*/	  r2.x = r4.w * -0.500000 + r2.x;
/*57*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*58*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*59*/	  r4.w = -r5.w * r6.w + 1.000000;
/*60*/	  r0.xyz = (r4.wwww * r0.xyzx + r7.xyzx).xyz;
/*61*/	  r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*62*/	  r3.xyz = (r7.wwww * r4.xyzx + r3.xyzx).xyz;
/*63*/	}
/*64*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*65*/	r5.x = 0;
/*66*/	r5.y = cb0.data[26].x * 0.050000;
/*67*/	r4.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r5.xxxy).zw;
/*68*/	r5.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*69*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*70*/	r4.x = saturate(r5.x * 5.000000);
/*71*/	r5.xyz = (r4.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*72*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r4.x = saturate(-r4.x * 15.000000 + 1.000000);
/*74*/	r4.y = log2(r4.z);
/*75*/	r4.y = r4.y * 1.800000;
/*76*/	r4.y = exp2(r4.y);
/*77*/	r4.y = r4.y * 10.000000;
/*78*/	r4.y = min(r4.y, 1.000000);
/*79*/	r4.x = r4.y + r4.x;
/*80*/	r4.y = -r4.w + 1.000000;
/*81*/	r4.y = log2(r4.y);
/*82*/	r4.y = r4.y * vsOut_T7.x;
/*83*/	r4.y = exp2(r4.y);
/*84*/	r4.y = min(r4.y, 1.000000);
/*85*/	r4.y = r4.y * vsOut_T7.x;
/*86*/	r4.xw = (r4.xxxz * vec4(0.500000, 0.000000, 0.000000, 0.250000)).xw;
/*87*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r4.wwww).xyz;
/*88*/	r5.xyz = (r4.xxxx * r5.xyzx + r4.wwww).xyz;
/*89*/	r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*90*/	r0.xyz = (r4.yyyy * r5.xyzx + r0.xyzx).xyz;
/*91*/	r4.x = vsOut_T7.x + -0.025000;
/*92*/	r4.x = max(r4.x, 0.000000);
/*93*/	r4.yzw = (r4.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*94*/	r0.xyz = (r4.xxxx * r4.yzwy + r0.xyzx).xyz;
/*95*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*96*/	r4.x = inversesqrt(r4.x);
/*97*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*98*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*99*/	r4.w = inversesqrt(r4.w);
/*100*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*101*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*102*/	r4.w = inversesqrt(r4.w);
/*103*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*104*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*105*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*106*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*107*/	r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*108*/	r4.w = inversesqrt(r4.w);
/*109*/	r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*110*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*111*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*112*/	if(floatBitsToUint(r0.w) != 0u) {
/*113*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*114*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*115*/	  r0.w = r7.y * cb0.data[26].x;
/*116*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*117*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*118*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*119*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*120*/	  r2.xy = (r2.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*121*/	}
/*122*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*123*/	if(floatBitsToUint(r0.w) != 0u) {
/*124*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*125*/	  if(floatBitsToUint(r0.w) != 0u) {
/*126*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*127*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*128*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*129*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*130*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*131*/	    r0.w = -r0.w + 1.000000;
/*132*/	    r0.w = max(r0.w, 0.000000);
/*133*/	    r8.z = sqrt(r0.w);
/*134*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*135*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*136*/	    r0.w = inversesqrt(r0.w);
/*137*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*138*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*139*/	    r10.y = -1.000000;
/*140*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*141*/	    r0.w = inversesqrt(r0.w);
/*142*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*143*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*144*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*145*/	    r4.w = r4.w * 1.250000;
/*146*/	    r4.w = min(r4.w, 1.000000);
/*147*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*148*/	    r5.w = r5.w * 4.000000;
/*149*/	    r4.w = r4.w * 0.200000 + r5.w;
/*150*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*151*/	    r0.w = r0.w + -r4.w;
/*152*/	    r0.w = saturate(r0.w * 200.000000);
/*153*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*154*/	    r0.w = r0.w * r0.w;
/*155*/	    r0.w = r0.w * r4.w;
/*156*/	    r2.y = r0.w * -r2.y + r2.y;
/*157*/	    r4.w = -r2.x + 0.200000;
/*158*/	    r2.x = r0.w * r4.w + r2.x;
/*159*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*160*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*161*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*162*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*163*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*164*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*165*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*166*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*167*/	    r4.w = -r4.w + 1.000000;
/*168*/	    r4.w = max(r4.w, 0.000000);
/*169*/	    r7.z = sqrt(r4.w);
/*170*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*171*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*172*/	    r4.w = sqrt(r4.w);
/*173*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*174*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*175*/	    r4.w = inversesqrt(r4.w);
/*176*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*177*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*178*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*179*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*180*/	    r4.w = -r3.y + 1.000000;
/*181*/	    r0.w = min(r0.w, r4.w);
/*182*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*183*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*184*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*185*/	    r0.w = inversesqrt(r0.w);
/*186*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*187*/	  }
/*188*/	}
/*189*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*190*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*191*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*192*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*193*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*194*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*195*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*196*/	r4.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*197*/	r4.xyz = (-r1.xyzx + r4.xxxx).xyz;
/*198*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r1.xyzx).xyz;
/*199*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*200*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*201*/	r1.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*202*/	r1.x = inversesqrt(r1.x);
/*203*/	r1.xyz = (r1.xxxx * r3.xyzx).xyz;
/*204*/	color3.x = r1.w / r3.w;
/*205*/	r1.w = max(abs(r1.z), abs(r1.y));
/*206*/	r1.w = max(r1.w, abs(r1.x));
/*207*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*208*/	r2.xzw = (r1.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*209*/	color0.xyzw = saturate(r2.xzwy);
/*210*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*211*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*212*/	color2.xyzw = saturate(r4.xyzw);
/*213*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*214*/	color4 = vsOut_P1;
/*215*/	return;
}
