//
//
// Shader Model 4
// Fragment Shader
//
// id: 602 - fxc/glsl_SM_3_0_rigidgrass.hlsl_PS_ps30_gbuffer_no_clip_grass.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D burn_sampler;
uniform sampler2D s_fire_map;
uniform sampler2D s_depth_map;
uniform sampler2D s_far_diffuse_map;
uniform sampler2D s_mid_distance_detail_map_colour;
uniform sampler2D s_mid_distance_detail_map_normal;
uniform sampler2D s_near_distance_detail_map_colour;
uniform sampler2D s_snow_normals;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform ps_height_map_cb
{
  vec4 data[9];
} cb2;
layout(std140) uniform grass_PS
{
  vec4 data[4];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.x = saturate(vsOut_T1.w);
/*1*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(burn_sampler, vsOut_T1.xyxx.st)).xyzw;
/*3*/	r0.yzw = (-r1.xxyz + r2.xxyz).yzw;
/*4*/	r0.yzw = (r0.xxxx * r0.yyzw + r1.xxyz).yzw;
/*5*/	r1.x = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*6*/	r1.yzw = (r0.yyzw / r1.wwww).yzw;
/*7*/	r0.yzw = (mix(r0.yyzw, r1.yyzw, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).yzw;
/*8*/	r1.xy = (vsOut_T1.xyxx * vec4(0.600000, 0.600000, 0.000000, 0.000000)).xy;
/*9*/	r2.x = r1.x;
/*10*/	r2.y = cb0.data[26].x * 0.050000 + r1.y;
/*11*/	r2.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*12*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*13*/	r1.x = saturate(r2.x * 5.000000);
/*14*/	r2.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*15*/	r1.x = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*16*/	r1.x = saturate(-r1.x * 15.000000 + 1.000000);
/*17*/	r1.y = log2(r1.z);
/*18*/	r1.y = r1.y * 1.800000;
/*19*/	r1.y = exp2(r1.y);
/*20*/	r1.y = r1.y * 10.000000;
/*21*/	r1.y = min(r1.y, 1.000000);
/*22*/	r1.x = r1.y + r1.x;
/*23*/	r1.y = -r1.w + 1.000000;
/*24*/	r1.y = log2(r1.y);
/*25*/	r1.y = r0.x * r1.y;
/*26*/	r1.y = exp2(r1.y);
/*27*/	r1.y = min(r1.y, 1.000000);
/*28*/	r1.y = r0.x * r1.y;
/*29*/	r1.xw = (r1.xxxz * vec4(0.500000, 0.000000, 0.000000, 0.250000)).xw;
/*30*/	r2.xyz = (r2.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*31*/	r2.xyz = (r1.xxxx * r2.xyzx + r1.wwww).xyz;
/*32*/	r2.xyz = (-r0.yzwy + r2.xyzx).xyz;
/*33*/	r0.yzw = (r1.yyyy * r2.xxyz + r0.yyzw).yzw;
/*34*/	r0.x = r0.x + -0.025000;
/*35*/	r0.x = max(r0.x, 0.000000);
/*36*/	r1.xyz = (r1.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.yzwy).xyz;
/*37*/	r0.xyz = (r0.xxxx * r1.xyzx + r0.yzwy).xyz;
/*38*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*39*/	r1.w = 1.000000;
/*40*/	r2.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*41*/	r2.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*42*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*43*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*44*/	r1.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*45*/	r2.z = dot(vec3(r1.yzwy), vec3(r1.yzwy));
/*46*/	r2.w = sqrt(r2.z);
/*47*/	r3.x = r2.w * 0.010000;
/*48*/	r3.x = min(r3.x, 1.000000);
/*49*/	r3.y = saturate(vsOut_C0.w * cb3.data[0].y + cb3.data[0].z);
/*50*/	r3.x = -r3.x + 1.000000;
/*51*/	r2.xy = (r2.xyxx / r1.xxxx).xy;
/*52*/	r2.xy = (r2.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*53*/	r2.xy = (r2.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*54*/	r4.xyzw = (textureLod(s_depth_map, r2.xyxx.st, 0.000000)).xyzw;
/*55*/	r2.x = inversesqrt(r2.z);
/*56*/	r1.yzw = (r1.yyzw * r2.xxxx).yzw;
/*57*/	r2.x = cb0.data[13].z/**/;
/*58*/	r2.y = cb0.data[14].z/**/;
/*59*/	r2.z = cb0.data[15].z/**/;
/*60*/	r3.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*61*/	r3.z = inversesqrt(r3.z);
/*62*/	r2.xyz = (r2.xyzx * r3.zzzz).xyz;
/*63*/	r2.x = dot(vec3(r1.yzwy), vec3(r2.xyzx));
/*64*/	r1.yzw = (r1.yyzw / r2.xxxx).yzw;
/*65*/	r1.yzw = (r1.yyzw * r4.xxxx + cb0.data[0].xxyz).yzw;
/*66*/	r2.x = uintBitsToFloat((999999.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*67*/	r2.y = -r3.y * r3.x + 1.000000;
/*68*/	r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? 0 : r2.y;
/*69*/	r1.yzw = (-r1.yyzw + vsOut_T0.xxyz).yzw;
/*70*/	r1.y = dot(vec3(r1.yzwy), vec3(r1.yzwy));
/*71*/	r1.y = sqrt(r1.y);
/*72*/	r1.y = r1.y + -15.000000;
/*73*/	r1.y = saturate(r1.y * 0.200000);
/*74*/	r1.z = r1.y * -2.000000 + 3.000000;
/*75*/	r1.y = r1.y * r1.y;
/*76*/	r1.y = r1.y * r1.z;
/*77*/	r1.y = r1.y * -r2.x + r2.x;
/*78*/	r1.z = -vsOut_C0.w + cb3.data[1].z;
/*79*/	r1.z = saturate(r1.z + 1.000000);
/*80*/	r2.xy = (vsOut_T0.xzxx / cb3.data[2].xyxx).xy;
/*81*/	r2.xy = (r2.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*82*/	r3.xyzw = (texture(s_far_diffuse_map, r2.xyxx.st)).xyzw;
/*83*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb2.data[0].y)).w;
/*84*/	r2.xy = (r1.wwww * vsOut_T0.xzxx).xy;
/*85*/	r4.xyzw = (texture(s_mid_distance_detail_map_colour, r2.xyxx.st)).xyzw;
/*86*/	r5.xyzw = (texture(s_mid_distance_detail_map_normal, r2.xyxx.st)).xyzw;
/*87*/	r2.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*88*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*89*/	r1.w = saturate(r2.w / cb2.data[0].x);
/*90*/	r2.z = r1.w * cb2.data[0].w;
/*91*/	r4.xyz = (r0.xyzx * r4.xxxx + -r0.xyzx).xyz;
/*92*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*93*/	r2.xz = (r2.xxyx * cb2.data[2].xxxx).xz;
/*94*/	r3.w = -cb2.data[2].y + 1.000000;
/*95*/	r4.x = vsOut_T2.y + -cb2.data[2].y;
/*96*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*97*/	r3.w = saturate(r3.w * r4.x);
/*98*/	r4.x = r3.w * -2.000000 + 3.000000;
/*99*/	r3.w = r3.w * r3.w;
/*100*/	r3.w = -r4.x * r3.w + 1.000000;
/*101*/	r1.w = r1.w * r3.w;
/*102*/	r2.y = 0;
/*103*/	r2.xyz = (r1.wwww * r2.xyzx + vsOut_T2.xyzx).xyz;
/*104*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb2.data[1].y)).w;
/*105*/	r4.xy = (r1.wwww * vsOut_T0.xzxx).xy;
/*106*/	r4.xyzw = (texture(s_near_distance_detail_map_colour, r4.xyxx.st)).xyzw;
/*107*/	r1.w = saturate(r2.w / cb2.data[1].x);
/*108*/	r1.w = -r1.w + 1.000000;
/*109*/	r1.w = r1.w * cb2.data[1].z;
/*110*/	r4.xyz = (r0.xyzx * r4.xxxx + -r0.xyzx).xyz;
/*111*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*112*/	r3.xyz = (r3.xyzx * r3.xyzx + -r0.xyzx).xyz;
/*113*/	r0.xyz = (r1.zzzz * r3.xyzx + r0.xyzx).xyz;
/*114*/	r1.z = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*115*/	if(floatBitsToUint(r1.z) != 0u) {
/*116*/	  r3.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*117*/	  r4.xyzw = (texture(s_snow_normals, r3.xyxx.st)).xyzw;
/*118*/	  r1.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*119*/	  r4.xz = (r1.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*120*/	  r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*121*/	  r1.z = -r1.z + 1.000000;
/*122*/	  r1.z = max(r1.z, 0.000000);
/*123*/	  r4.y = sqrt(r1.z);
/*124*/	  r5.xyz = (r4.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r2.xyzx).xyz;
/*125*/	  r1.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*126*/	  r1.z = inversesqrt(r1.z);
/*127*/	  r5.xyz = (r1.zzzz * r5.xyzx).xyz;
/*128*/	  r6.xz = (cb1.data[0].xxyx).xz/**/;
/*129*/	  r6.y = -1.000000;
/*130*/	  r1.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*131*/	  r1.z = inversesqrt(r1.z);
/*132*/	  r6.xyz = (r1.zzzz * r6.xyzx).xyz;
/*133*/	  r1.z = saturate(dot(vec3(-r6.xyzx), vec3(r5.xyzx)));
/*134*/	  r1.w = cb1.data[1].x * cb1.data[1].x;
/*135*/	  r1.w = r1.w * 1.250000;
/*136*/	  r1.w = min(r1.w, 1.000000);
/*137*/	  r2.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*138*/	  r2.w = r2.w * 4.000000;
/*139*/	  r1.w = r1.w * 0.200000 + r2.w;
/*140*/	  r1.w = r1.w * -0.700000 + 1.000000;
/*141*/	  r1.z = -r1.w + r1.z;
/*142*/	  r1.z = saturate(r1.z * 200.000000);
/*143*/	  r1.w = r1.z * -2.000000 + 3.000000;
/*144*/	  r1.z = r1.z * r1.z;
/*145*/	  r1.z = r1.z * r1.w;
/*146*/	  r5.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*147*/	  r0.xyz = (r1.zzzz * r5.xyzx + r0.xyzx).xyz;
/*148*/	  r3.xyzw = (texture(s_snow_normals, r3.zwzz.st)).xyzw;
/*149*/	  r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*150*/	  r3.xz = (r3.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*151*/	  r1.w = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*152*/	  r1.w = -r1.w + 1.000000;
/*153*/	  r1.w = max(r1.w, 0.000000);
/*154*/	  r3.y = sqrt(r1.w);
/*155*/	  r4.xyz = (r4.xyzx + r4.xyzx).xyz;
/*156*/	  r1.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*157*/	  r1.w = sqrt(r1.w);
/*158*/	  r3.xyz = (r4.xyzx * r1.wwww + r3.xyzx).xyz;
/*159*/	  r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*160*/	  r1.w = inversesqrt(r1.w);
/*161*/	  r1.z = r1.z * 0.700000;
/*162*/	  r2.w = -r2.y + 1.000000;
/*163*/	  r1.z = min(r1.z, r2.w);
/*164*/	  r3.xyz = (r3.xyzx * r1.wwww + -r2.xyzx).xyz;
/*165*/	  r3.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*166*/	  r1.z = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*167*/	  r1.z = inversesqrt(r1.z);
/*168*/	  r2.xyz = (r1.zzzz * r3.xyzx).xyz;
/*169*/	}
/*170*/	r3.w = -r1.y + 1.000000;
/*171*/	r1.y = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*172*/	r1.y = inversesqrt(r1.y);
/*173*/	r1.yzw = (r1.yyyy * r2.xxyz).yzw;
/*174*/	color3.x = r0.w / r1.x;
/*175*/	r0.w = max(abs(r1.w), abs(r1.z));
/*176*/	r0.w = max(r0.w, abs(r1.y));
/*177*/	r1.xyz = (r1.yzwy / r0.wwww).xyz;
/*178*/	r3.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*179*/	color0.xyzw = saturate(r3.xyzw);
/*180*/	r3.xyz = (sqrt(r0.xyzx)).xyz;
/*181*/	color1.xyzw = min(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*182*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*183*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*184*/	color4 = uint(0);
/*185*/	return;
}
