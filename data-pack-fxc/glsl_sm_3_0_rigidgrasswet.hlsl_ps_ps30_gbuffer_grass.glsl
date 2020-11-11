//
//
// Shader Model 4
// Fragment Shader
//
// id: 1370 - fxc/glsl_SM_3_0_rigidgrasswet.hlsl_PS_ps30_gbuffer_grass.glsl
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
uniform sampler2D s_dissolve_map;
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
/*3*/	r2.xyzw = -r1.xyzw + r2.xyzw;
/*4*/	r2.xyzw = r0.xxxx * r2.wxyz + r1.wxyz;
/*5*/	r0.y = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*6*/	r1.xyz = (r2.yzwy / r1.wwww).xyz;
/*7*/	r0.yzw = (mix(r2.yyzw, r1.xxyz, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).yzw;
/*8*/	r2.x = saturate(r2.x);
/*9*/	r1.xyzw = vsOut_T1.xyxy * vec4(0.600000, 0.600000, 100.000000, 100.000000);
/*10*/	r3.x = r1.x;
/*11*/	r3.y = cb0.data[26].x * 0.050000 + r1.y;
/*12*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*13*/	r4.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*14*/	r1.x = saturate(r3.x * 5.000000);
/*15*/	r2.yzw = (r1.xxxx * vec4(0.000000, 0.530000, 0.070000, -0.120000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*16*/	r1.x = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*17*/	r1.x = saturate(-r1.x * 15.000000 + 1.000000);
/*18*/	r1.y = log2(r4.z);
/*19*/	r1.y = r1.y * 1.800000;
/*20*/	r1.y = exp2(r1.y);
/*21*/	r1.y = r1.y * 10.000000;
/*22*/	r1.y = min(r1.y, 1.000000);
/*23*/	r1.x = r1.y + r1.x;
/*24*/	r1.x = r1.x * 0.500000;
/*25*/	r1.y = -r4.w + 1.000000;
/*26*/	r1.y = log2(r1.y);
/*27*/	r1.y = r0.x * r1.y;
/*28*/	r1.y = exp2(r1.y);
/*29*/	r1.y = min(r1.y, 1.000000);
/*30*/	r1.y = r0.x * r1.y;
/*31*/	r3.x = r4.z * 0.250000;
/*32*/	r2.yzw = (r2.yyzw * vec4(0.000000, 2.000000, 2.000000, 2.000000) + -r3.xxxx).yzw;
/*33*/	r2.yzw = (r1.xxxx * r2.yyzw + r3.xxxx).yzw;
/*34*/	r2.yzw = (-r0.yyzw + r2.yyzw).yzw;
/*35*/	r0.yzw = (r1.yyyy * r2.yyzw + r0.yyzw).yzw;
/*36*/	r1.x = r0.x + -0.025000;
/*37*/	r1.x = max(r1.x, 0.000000);
/*38*/	r2.yzw = (r4.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.yyzw).yzw;
/*39*/	r0.yzw = (r1.xxxx * r2.yyzw + r0.yyzw).yzw;
/*40*/	r1.xyzw = (texture(s_dissolve_map, r1.zwzz.st)).xyzw;
/*41*/	r1.y = -r1.x + 1.100000;
/*42*/	r1.x = r0.x * r1.y + r1.x;
/*43*/	r0.x = r0.x * r0.x + 0.010000;
/*44*/	r0.x = r1.x * r2.x + -r0.x;
/*45*/	r1.x = r2.x + -0.500000;
/*46*/	r0.x = min(r0.x, r1.x);
/*47*/	r1.xyz = (dFdy(vsOut_T0.zxyz)).xyz;
/*48*/	r2.xyz = (dFdx(vsOut_T0.yzxy)).xyz;
/*49*/	r3.xyz = (r1.xyzx * r2.xyzx).xyz;
/*50*/	r1.xyz = (r1.zxyz * r2.yzxy + -r3.xyzx).xyz;
/*51*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*54*/	r2.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*55*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*58*/	r1.x = dot(vec3(r1.xyzx), vec3(r2.xyzx));
/*59*/	r1.x = saturate(r1.x + r1.x);
/*60*/	r1.yz = (vsOut_T1.xxyx * vec4(0.000000, 20.000000, 20.000000, 0.000000)).yz;
/*61*/	r2.xyzw = (texture(s_dissolve_map, r1.yzyy.st)).xyzw;
/*62*/	r1.x = r1.x + -r2.x;
/*63*/	r0.x = min(r0.x, r1.x);
/*64*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*65*/	if(r0.x != 0) discard;
/*66*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*67*/	r1.w = 1.000000;
/*68*/	r2.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*69*/	r2.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*70*/	r0.x = dot(r1.xyzw, cb0.data[11].xyzw);
/*71*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*72*/	r1.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*73*/	r2.z = dot(vec3(r1.yzwy), vec3(r1.yzwy));
/*74*/	r2.w = sqrt(r2.z);
/*75*/	r3.x = r2.w * 0.010000;
/*76*/	r3.x = min(r3.x, 1.000000);
/*77*/	r3.y = saturate(vsOut_C0.w * cb3.data[0].y + cb3.data[0].z);
/*78*/	r3.x = -r3.x + 1.000000;
/*79*/	r2.xy = (r2.xyxx / r1.xxxx).xy;
/*80*/	r2.xy = (r2.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*81*/	r2.xy = (r2.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*82*/	r4.xyzw = (textureLod(s_depth_map, r2.xyxx.st, 0.000000)).xyzw;
/*83*/	r2.x = inversesqrt(r2.z);
/*84*/	r1.yzw = (r1.yyzw * r2.xxxx).yzw;
/*85*/	r2.x = cb0.data[13].z/**/;
/*86*/	r2.y = cb0.data[14].z/**/;
/*87*/	r2.z = cb0.data[15].z/**/;
/*88*/	r3.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*89*/	r3.z = inversesqrt(r3.z);
/*90*/	r2.xyz = (r2.xyzx * r3.zzzz).xyz;
/*91*/	r2.x = dot(vec3(r1.yzwy), vec3(r2.xyzx));
/*92*/	r1.yzw = (r1.yyzw / r2.xxxx).yzw;
/*93*/	r1.yzw = (r1.yyzw * r4.xxxx + cb0.data[0].xxyz).yzw;
/*94*/	r2.x = uintBitsToFloat((999999.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*95*/	r2.y = -r3.y * r3.x + 1.000000;
/*96*/	r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? 0 : r2.y;
/*97*/	r1.yzw = (-r1.yyzw + vsOut_T0.xxyz).yzw;
/*98*/	r1.y = dot(vec3(r1.yzwy), vec3(r1.yzwy));
/*99*/	r1.y = sqrt(r1.y);
/*100*/	r1.y = r1.y + -15.000000;
/*101*/	r1.y = saturate(r1.y * 0.200000);
/*102*/	r1.z = r1.y * -2.000000 + 3.000000;
/*103*/	r1.y = r1.y * r1.y;
/*104*/	r1.y = r1.y * r1.z;
/*105*/	r1.y = r1.y * -r2.x + r2.x;
/*106*/	r1.z = -vsOut_C0.w + cb3.data[1].z;
/*107*/	r1.z = saturate(r1.z + 1.000000);
/*108*/	r2.xy = (vsOut_T0.xzxx / cb3.data[2].xyxx).xy;
/*109*/	r2.xy = (r2.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*110*/	r3.xyzw = (texture(s_far_diffuse_map, r2.xyxx.st)).xyzw;
/*111*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb2.data[0].y)).w;
/*112*/	r2.xy = (r1.wwww * vsOut_T0.xzxx).xy;
/*113*/	r4.xyzw = (texture(s_mid_distance_detail_map_colour, r2.xyxx.st)).xyzw;
/*114*/	r5.xyzw = (texture(s_mid_distance_detail_map_normal, r2.xyxx.st)).xyzw;
/*115*/	r2.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*116*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*117*/	r1.w = saturate(r2.w / cb2.data[0].x);
/*118*/	r2.z = r1.w * cb2.data[0].w;
/*119*/	r4.xyz = (r0.yzwy * r4.xxxx + -r0.yzwy).xyz;
/*120*/	r0.yzw = (r2.zzzz * r4.xxyz + r0.yyzw).yzw;
/*121*/	r2.xz = (r2.xxyx * cb2.data[2].xxxx).xz;
/*122*/	r3.w = -cb2.data[2].y + 1.000000;
/*123*/	r4.x = vsOut_T2.y + -cb2.data[2].y;
/*124*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*125*/	r3.w = saturate(r3.w * r4.x);
/*126*/	r4.x = r3.w * -2.000000 + 3.000000;
/*127*/	r3.w = r3.w * r3.w;
/*128*/	r3.w = -r4.x * r3.w + 1.000000;
/*129*/	r1.w = r1.w * r3.w;
/*130*/	r2.y = 0;
/*131*/	r2.xyz = (r1.wwww * r2.xyzx + vsOut_T2.xyzx).xyz;
/*132*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb2.data[1].y)).w;
/*133*/	r4.xy = (r1.wwww * vsOut_T0.xzxx).xy;
/*134*/	r4.xyzw = (texture(s_near_distance_detail_map_colour, r4.xyxx.st)).xyzw;
/*135*/	r1.w = saturate(r2.w / cb2.data[1].x);
/*136*/	r1.w = -r1.w + 1.000000;
/*137*/	r1.w = r1.w * cb2.data[1].z;
/*138*/	r4.xyz = (r0.yzwy * r4.xxxx + -r0.yzwy).xyz;
/*139*/	r0.yzw = (r1.wwww * r4.xxyz + r0.yyzw).yzw;
/*140*/	r3.xyz = (r3.xyzx * r3.xyzx + -r0.yzwy).xyz;
/*141*/	r0.yzw = (r1.zzzz * r3.xxyz + r0.yyzw).yzw;
/*142*/	r1.z = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*143*/	if(floatBitsToUint(r1.z) != 0u) {
/*144*/	  r3.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*145*/	  r4.xyzw = (texture(s_snow_normals, r3.xyxx.st)).xyzw;
/*146*/	  r1.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*147*/	  r4.xz = (r1.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*148*/	  r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*149*/	  r1.z = -r1.z + 1.000000;
/*150*/	  r1.z = max(r1.z, 0.000000);
/*151*/	  r4.y = sqrt(r1.z);
/*152*/	  r5.xyz = (r4.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r2.xyzx).xyz;
/*153*/	  r1.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*154*/	  r1.z = inversesqrt(r1.z);
/*155*/	  r5.xyz = (r1.zzzz * r5.xyzx).xyz;
/*156*/	  r6.xz = (cb1.data[0].xxyx).xz/**/;
/*157*/	  r6.y = -1.000000;
/*158*/	  r1.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*159*/	  r1.z = inversesqrt(r1.z);
/*160*/	  r6.xyz = (r1.zzzz * r6.xyzx).xyz;
/*161*/	  r1.z = saturate(dot(vec3(-r6.xyzx), vec3(r5.xyzx)));
/*162*/	  r1.w = cb1.data[1].x * cb1.data[1].x;
/*163*/	  r1.w = r1.w * 1.250000;
/*164*/	  r1.w = min(r1.w, 1.000000);
/*165*/	  r2.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*166*/	  r2.w = r2.w * 4.000000;
/*167*/	  r1.w = r1.w * 0.200000 + r2.w;
/*168*/	  r1.w = r1.w * -0.700000 + 1.000000;
/*169*/	  r1.z = -r1.w + r1.z;
/*170*/	  r1.z = saturate(r1.z * 200.000000);
/*171*/	  r1.w = r1.z * -2.000000 + 3.000000;
/*172*/	  r1.z = r1.z * r1.z;
/*173*/	  r1.z = r1.z * r1.w;
/*174*/	  r5.xyz = (-r0.yzwy + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*175*/	  r0.yzw = (r1.zzzz * r5.xxyz + r0.yyzw).yzw;
/*176*/	  r3.xyzw = (texture(s_snow_normals, r3.zwzz.st)).xyzw;
/*177*/	  r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*178*/	  r3.xz = (r3.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*179*/	  r1.w = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*180*/	  r1.w = -r1.w + 1.000000;
/*181*/	  r1.w = max(r1.w, 0.000000);
/*182*/	  r3.y = sqrt(r1.w);
/*183*/	  r4.xyz = (r4.xyzx + r4.xyzx).xyz;
/*184*/	  r1.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*185*/	  r1.w = sqrt(r1.w);
/*186*/	  r3.xyz = (r4.xyzx * r1.wwww + r3.xyzx).xyz;
/*187*/	  r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*188*/	  r1.w = inversesqrt(r1.w);
/*189*/	  r1.z = r1.z * 0.700000;
/*190*/	  r2.w = -r2.y + 1.000000;
/*191*/	  r1.z = min(r1.z, r2.w);
/*192*/	  r3.xyz = (r3.xyzx * r1.wwww + -r2.xyzx).xyz;
/*193*/	  r3.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*194*/	  r1.z = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*195*/	  r1.z = inversesqrt(r1.z);
/*196*/	  r2.xyz = (r1.zzzz * r3.xyzx).xyz;
/*197*/	}
/*198*/	r3.w = -r1.y + 1.000000;
/*199*/	r1.y = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*200*/	r1.y = inversesqrt(r1.y);
/*201*/	r1.yzw = (r1.yyyy * r2.xxyz).yzw;
/*202*/	color3.x = r0.x / r1.x;
/*203*/	r0.x = max(abs(r1.w), abs(r1.z));
/*204*/	r0.x = max(r0.x, abs(r1.y));
/*205*/	r1.xyz = (r1.yzwy / r0.xxxx).xyz;
/*206*/	r3.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*207*/	color0.xyzw = saturate(r3.xyzw);
/*208*/	r3.xyz = (sqrt(r0.yzwy)).xyz;
/*209*/	color1.xyzw = min(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*210*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*211*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*212*/	color4 = uint(0);
/*213*/	return;
}
