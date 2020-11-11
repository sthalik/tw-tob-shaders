//
//
// Shader Model 4
// Fragment Shader
//
// id: 4966 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2D sHardShadowBuffer;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shadowmap_PS
{
  vec4 data[45];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*20*/	r4.w = 1.000000;
/*21*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*22*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*23*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*24*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*25*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*26*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*27*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*28*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*29*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*30*/	r5.z = vsOut_T6.x;
/*31*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*32*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*33*/	if(floatBitsToUint(r2.w) != 0u) {
/*34*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*35*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*37*/	  r2.w = -r2.w + 1.000000;
/*38*/	  r2.w = max(r2.w, 0.000000);
/*39*/	  r5.z = sqrt(r2.w);
/*40*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*41*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*42*/	  r2.w = r3.x * r8.w;
/*43*/	  r3.x = r2.w * -0.500000 + r3.x;
/*44*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*45*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*46*/	  r2.w = -r6.w * r7.w + 1.000000;
/*47*/	  r1.xyz = (r2.wwww * r1.xyzx + r8.xyzx).xyz;
/*48*/	  r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*49*/	  r0.xyw = (r8.wwww * r5.xyxz + r0.xyxw).xyw;
/*50*/	}
/*51*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*52*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*53*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*54*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*55*/	r2.w = r5.w * r6.w;
/*56*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*57*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*58*/	r0.xy = (r3.zwzz * r5.wwww + r0.xyxx).xy;
/*59*/	r3.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*60*/	r3.z = inversesqrt(r3.z);
/*61*/	r0.xyw = (r0.xyxw * r3.zzzz).xyw;
/*62*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*63*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*64*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*65*/	r2.w = inversesqrt(r2.w);
/*66*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*67*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*68*/	r2.w = inversesqrt(r2.w);
/*69*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*70*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*71*/	r2.w = inversesqrt(r2.w);
/*72*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*73*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*74*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*75*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*76*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*77*/	r2.w = inversesqrt(r2.w);
/*78*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*79*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*80*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*81*/	if(floatBitsToUint(r0.w) != 0u) {
/*82*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*83*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*84*/	  r0.w = r3.w * cb0.data[26].x;
/*85*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*86*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*87*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*88*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*89*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*90*/	}
/*91*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*92*/	if(floatBitsToUint(r0.w) != 0u) {
/*93*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*94*/	  if(floatBitsToUint(r0.w) != 0u) {
/*95*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*96*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*97*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*98*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*99*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*100*/	    r0.w = -r0.w + 1.000000;
/*101*/	    r0.w = max(r0.w, 0.000000);
/*102*/	    r9.z = sqrt(r0.w);
/*103*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*104*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*105*/	    r0.w = inversesqrt(r0.w);
/*106*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*107*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*108*/	    r11.y = -1.000000;
/*109*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*110*/	    r0.w = inversesqrt(r0.w);
/*111*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*112*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*113*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*114*/	    r2.w = r2.w * 1.250000;
/*115*/	    r2.w = min(r2.w, 1.000000);
/*116*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*117*/	    r3.z = r3.z * 4.000000;
/*118*/	    r2.w = r2.w * 0.200000 + r3.z;
/*119*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*120*/	    r0.w = r0.w + -r2.w;
/*121*/	    r0.w = saturate(r0.w * 200.000000);
/*122*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*123*/	    r0.w = r0.w * r0.w;
/*124*/	    r0.w = r0.w * r2.w;
/*125*/	    r3.y = r0.w * -r3.y + r3.y;
/*126*/	    r2.w = -r3.x + 0.200000;
/*127*/	    r3.x = r0.w * r2.w + r3.x;
/*128*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*129*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*130*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*131*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*132*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*133*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*134*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*135*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*136*/	    r2.w = -r2.w + 1.000000;
/*137*/	    r2.w = max(r2.w, 0.000000);
/*138*/	    r8.z = sqrt(r2.w);
/*139*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*140*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*141*/	    r2.w = sqrt(r2.w);
/*142*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*143*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*144*/	    r2.w = inversesqrt(r2.w);
/*145*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*146*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*147*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*148*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*149*/	    r2.w = -r0.y + 1.000000;
/*150*/	    r0.w = min(r0.w, r2.w);
/*151*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*152*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*153*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*154*/	    r0.w = inversesqrt(r0.w);
/*155*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*156*/	  }
/*157*/	}
/*158*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*159*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*160*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*161*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*162*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*163*/	r3.xzw = (-r1.xxyz + r2.wwww).xzw;
/*164*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*165*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*166*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*167*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*168*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*169*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*170*/	r2.w = inversesqrt(r2.w);
/*171*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*172*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*173*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*174*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*175*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*176*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*177*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*178*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*179*/	r3.x = intBitsToFloat(int(r2.w));
/*180*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*181*/	if(floatBitsToUint(r3.z) != 0u) {
/*182*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*183*/	  r5.w = vsOut_T0.w;
/*184*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*185*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*186*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*187*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*188*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*189*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*190*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*191*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*192*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*193*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*194*/	  if(floatBitsToUint(r3.w) == 0u) {
/*195*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*196*/	    r7.xy = floor((r6.xyxx).xy);
/*197*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*198*/	    r3.z = -0.000400 / r3.z;
/*199*/	    r3.z = r3.z + r6.z;
/*200*/	    r8.z = -r8.y + 1.000000;
/*201*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*202*/	    r8.w = -r8.y;
/*203*/	    r10.x = cb1.data[0].z/**/;
/*204*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*205*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*206*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*207*/	    r10.w = -cb1.data[0].w/**/;
/*208*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*209*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*210*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*211*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*212*/	    r8.x = r9.x;
/*213*/	    r8.y = r11.x;
/*214*/	    r8.z = r10.x;
/*215*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*216*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*217*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*218*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*219*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*220*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*221*/	    r3.z = -r6.x + r6.y;
/*222*/	    r3.z = r3.w * r3.z + r6.x;
/*223*/	  } else {
/*224*/	    r3.z = 1.000000;
/*225*/	  }
/*226*/	} else {
/*227*/	  r3.z = 1.000000;
/*228*/	}
/*229*/	r3.w = cb1.data[34].w + -1.000000;
/*230*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*231*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*232*/	if(floatBitsToUint(r2.w) == 0u) {
/*233*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*234*/	  r2.w = floatBitsToInt(r2.w);
/*235*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*236*/	  if(floatBitsToUint(r2.w) != 0u) {
/*237*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*238*/	    r5.w = vsOut_T0.w;
/*239*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*240*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*241*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*242*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*243*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*244*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*245*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*246*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*247*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*248*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*249*/	    if(floatBitsToUint(r5.w) == 0u) {
/*250*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*251*/	      r6.xy = floor((r5.xyxx).xy);
/*252*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*253*/	      r2.w = -0.000400 / r2.w;
/*254*/	      r2.w = r2.w + r5.z;
/*255*/	      r7.z = -r7.y + 1.000000;
/*256*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*257*/	      r7.w = -r7.y;
/*258*/	      r9.x = cb1.data[0].z/**/;
/*259*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*260*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*261*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*262*/	      r9.w = -cb1.data[0].w/**/;
/*263*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*264*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*265*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*266*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*267*/	      r7.x = r8.x;
/*268*/	      r7.y = r10.x;
/*269*/	      r7.z = r9.x;
/*270*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*271*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*272*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*273*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*274*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*275*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*276*/	      r2.w = -r5.x + r5.z;
/*277*/	      r2.w = r5.y * r2.w + r5.x;
/*278*/	    } else {
/*279*/	      r2.w = 1.000000;
/*280*/	    }
/*281*/	  } else {
/*282*/	    r2.w = 1.000000;
/*283*/	  }
/*284*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*285*/	  r5.y = r5.x * cb1.data[34].x;
/*286*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*287*/	  r5.x = r1.w + -r5.x;
/*288*/	  r5.x = saturate(r5.x / r5.y);
/*289*/	  r2.w = -r3.z + r2.w;
/*290*/	  r3.z = r5.x * r2.w + r3.z;
/*291*/	}
/*292*/	if(floatBitsToUint(r3.w) != 0u) {
/*293*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*294*/	  r3.w = r2.w * cb1.data[34].y;
/*295*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*296*/	  r2.w = r1.w + -r2.w;
/*297*/	  r2.w = saturate(r2.w / r3.w);
/*298*/	  r3.x = -r3.z + 1.000000;
/*299*/	  r3.z = r2.w * r3.x + r3.z;
/*300*/	}
/*301*/	r3.z = saturate(r3.z);
/*302*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*303*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*304*/	r2.w = inversesqrt(r2.w);
/*305*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*306*/	r2.w = -r3.y + 1.000000;
/*307*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*308*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*309*/	r3.w = r3.w + r3.w;
/*310*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*311*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*312*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*313*/	r3.w = cos((r8.x));
/*314*/	r3.w = inversesqrt(r3.w);
/*315*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*316*/	r5.w = saturate(r0.w * 60.000000);
/*317*/	r5.w = -r0.w + r5.w;
/*318*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*319*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*320*/	r6.w = inversesqrt(r6.w);
/*321*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*322*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*323*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*324*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*325*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*326*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*327*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*328*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*329*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*330*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*331*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*332*/	r6.w = -r0.w + 1.000000;
/*333*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*334*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*335*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*336*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*337*/	  r6.w = max(r6.w, 0.000000);
/*338*/	  r6.w = log2(r6.w);
/*339*/	  r6.w = r6.w * 10.000000;
/*340*/	  r6.w = exp2(r6.w);
/*341*/	  r6.w = r3.w * r6.w;
/*342*/	  r6.w = r6.w * r5.w + r0.w;
/*343*/	  r7.y = r2.w * 8.000000;
/*344*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*345*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*346*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*347*/	}
/*348*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*349*/	r7.y = max(r6.w, 0.000000);
/*350*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*351*/	if(floatBitsToUint(r6.w) != 0u) {
/*352*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*353*/	  r6.x = max(r6.x, -1.000000);
/*354*/	  r6.x = min(r6.x, 1.000000);
/*355*/	  r6.y = -abs(r6.x) + 1.000000;
/*356*/	  r6.y = sqrt(r6.y);
/*357*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*358*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*359*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*360*/	  r6.w = r6.y * r6.z;
/*361*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*362*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*363*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*364*/	  r6.x = r6.z * r6.y + r6.x;
/*365*/	  r3.y = r3.y * r3.y;
/*366*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*367*/	  r3.x = r3.y * r3.x + r7.x;
/*368*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*369*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*370*/	  r3.y = -r3.x * r3.x + 1.000000;
/*371*/	  r3.y = max(r3.y, 0.001000);
/*372*/	  r3.y = log2(r3.y);
/*373*/	  r6.y = r3.y * 4.950617;
/*374*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*375*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*376*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*377*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*378*/	  r3.x = floatBitsToInt(r3.x);
/*379*/	  r6.y = r3.y * r3.y + -r6.y;
/*380*/	  r6.y = sqrt(r6.y);
/*381*/	  r3.y = -r3.y + r6.y;
/*382*/	  r3.y = max(r3.y, 0.000000);
/*383*/	  r3.y = sqrt(r3.y);
/*384*/	  r3.x = r3.y * r3.x;
/*385*/	  r3.x = r3.x * 1.414214;
/*386*/	  r3.x = 0.008727 / r3.x;
/*387*/	  r3.x = max(r3.x, 0.000100);
/*388*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*389*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*390*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*391*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*392*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*393*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*394*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*395*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*396*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*397*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*398*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*399*/	  r3.x = floatBitsToInt(r3.x);
/*400*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*401*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*402*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*403*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*404*/	  r3.x = r3.x * r6.x + 1.000000;
/*405*/	  r3.x = r3.x * 0.500000;
/*406*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*407*/	  r3.y = r3.y * r6.y + 1.000000;
/*408*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*409*/	  r3.y = min(r7.y, 1.000000);
/*410*/	  r2.w = r2.w * 1.570796;
/*411*/	  r2.w = sin(r2.w);
/*412*/	  r3.y = r3.y + -1.000000;
/*413*/	  r2.w = r2.w * r3.y + 1.000000;
/*414*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*415*/	  r3.y = max(r3.y, 0.000000);
/*416*/	  r3.y = log2(r3.y);
/*417*/	  r3.y = r3.y * 10.000000;
/*418*/	  r3.y = exp2(r3.y);
/*419*/	  r3.y = r3.w * r3.y;
/*420*/	  r3.y = r3.y * r5.w + r0.w;
/*421*/	  r2.w = r2.w * abs(r3.x);
/*422*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*423*/	} else {
/*424*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*425*/	}
/*426*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*427*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*428*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*429*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*430*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*431*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*432*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*433*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*434*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*435*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*436*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*437*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*438*/	r2.w = inversesqrt(r2.w);
/*439*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*440*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*441*/	r2.w = r2.w + r2.w;
/*442*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*443*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*444*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*445*/	r0.x = max(r0.x, 0.000000);
/*446*/	r0.x = log2(r0.x);
/*447*/	r0.x = r0.x * 10.000000;
/*448*/	r0.x = exp2(r0.x);
/*449*/	r0.x = r3.w * r0.x;
/*450*/	r0.x = r0.x * r5.w + r0.w;
/*451*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*452*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*453*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*454*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*455*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*456*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*457*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*458*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*459*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*460*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*461*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*462*/	if(r0.x != 0) discard;
/*463*/	color1.x = 1.000000;
/*464*/	return;
}
