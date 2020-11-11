//
//
// Shader Model 4
// Fragment Shader
//
// id: 4962 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*23*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*24*/	r4.w = 1.000000;
/*25*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*26*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*27*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*28*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*29*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*30*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*31*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*32*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*33*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*34*/	r5.z = vsOut_T6.x;
/*35*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*36*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*37*/	if(floatBitsToUint(r2.w) != 0u) {
/*38*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*39*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*40*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*41*/	  r2.w = -r2.w + 1.000000;
/*42*/	  r2.w = max(r2.w, 0.000000);
/*43*/	  r5.z = sqrt(r2.w);
/*44*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*45*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*46*/	  r2.w = r3.x * r8.w;
/*47*/	  r3.x = r2.w * -0.500000 + r3.x;
/*48*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*49*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*50*/	  r2.w = -r6.w * r7.w + 1.000000;
/*51*/	  r1.xyz = (r2.wwww * r1.xyzx + r8.xyzx).xyz;
/*52*/	  r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*53*/	  r0.xyw = (r8.wwww * r5.xyxz + r0.xyxw).xyw;
/*54*/	}
/*55*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*56*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*57*/	r6.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*58*/	r3.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*59*/	r2.w = r5.w * r6.w;
/*60*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*61*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*62*/	r0.xy = (r3.zwzz * r5.wwww + r0.xyxx).xy;
/*63*/	r3.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*64*/	r3.z = inversesqrt(r3.z);
/*65*/	r0.xyw = (r0.xyxw * r3.zzzz).xyw;
/*66*/	r5.xyz = (r2.wwww * r2.xyzx).xyz;
/*67*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*68*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*69*/	r2.w = inversesqrt(r2.w);
/*70*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*71*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*72*/	r2.w = inversesqrt(r2.w);
/*73*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*74*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*77*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*78*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*79*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*80*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*81*/	r2.w = inversesqrt(r2.w);
/*82*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*83*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*84*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*85*/	if(floatBitsToUint(r0.w) != 0u) {
/*86*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*87*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*88*/	  r0.w = r3.w * cb0.data[26].x;
/*89*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*90*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*91*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*92*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*93*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*94*/	}
/*95*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*96*/	if(floatBitsToUint(r0.w) != 0u) {
/*97*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*98*/	  if(floatBitsToUint(r0.w) != 0u) {
/*99*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*100*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*101*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*102*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*103*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*104*/	    r0.w = -r0.w + 1.000000;
/*105*/	    r0.w = max(r0.w, 0.000000);
/*106*/	    r9.z = sqrt(r0.w);
/*107*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*108*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*109*/	    r0.w = inversesqrt(r0.w);
/*110*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*111*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*112*/	    r11.y = -1.000000;
/*113*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*114*/	    r0.w = inversesqrt(r0.w);
/*115*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*116*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*117*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*118*/	    r2.w = r2.w * 1.250000;
/*119*/	    r2.w = min(r2.w, 1.000000);
/*120*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*121*/	    r3.z = r3.z * 4.000000;
/*122*/	    r2.w = r2.w * 0.200000 + r3.z;
/*123*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*124*/	    r0.w = r0.w + -r2.w;
/*125*/	    r0.w = saturate(r0.w * 200.000000);
/*126*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*127*/	    r0.w = r0.w * r0.w;
/*128*/	    r0.w = r0.w * r2.w;
/*129*/	    r3.y = r0.w * -r3.y + r3.y;
/*130*/	    r2.w = -r3.x + 0.200000;
/*131*/	    r3.x = r0.w * r2.w + r3.x;
/*132*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*133*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*134*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*135*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*136*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*137*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*138*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*139*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*140*/	    r2.w = -r2.w + 1.000000;
/*141*/	    r2.w = max(r2.w, 0.000000);
/*142*/	    r8.z = sqrt(r2.w);
/*143*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*144*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*145*/	    r2.w = sqrt(r2.w);
/*146*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*147*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*148*/	    r2.w = inversesqrt(r2.w);
/*149*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*150*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*151*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*152*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*153*/	    r2.w = -r0.y + 1.000000;
/*154*/	    r0.w = min(r0.w, r2.w);
/*155*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*156*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*157*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*158*/	    r0.w = inversesqrt(r0.w);
/*159*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*160*/	  }
/*161*/	}
/*162*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*163*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*164*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*165*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*166*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*167*/	r3.xzw = (-r1.xxyz + r2.wwww).xzw;
/*168*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*169*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*170*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*171*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*172*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*173*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*174*/	r2.w = inversesqrt(r2.w);
/*175*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*176*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*177*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*178*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*179*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*180*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*181*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*182*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*183*/	r3.x = intBitsToFloat(int(r2.w));
/*184*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*185*/	if(floatBitsToUint(r3.z) != 0u) {
/*186*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*187*/	  r5.w = vsOut_T0.w;
/*188*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*189*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*190*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*191*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*192*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*193*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*194*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*195*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*196*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*197*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*198*/	  if(floatBitsToUint(r3.w) == 0u) {
/*199*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*200*/	    r7.xy = floor((r6.xyxx).xy);
/*201*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*202*/	    r3.z = -0.000400 / r3.z;
/*203*/	    r3.z = r3.z + r6.z;
/*204*/	    r8.z = -r8.y + 1.000000;
/*205*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*206*/	    r8.w = -r8.y;
/*207*/	    r10.x = cb1.data[0].z/**/;
/*208*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*209*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*210*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*211*/	    r10.w = -cb1.data[0].w/**/;
/*212*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*213*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*214*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*215*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*216*/	    r8.x = r9.x;
/*217*/	    r8.y = r11.x;
/*218*/	    r8.z = r10.x;
/*219*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*220*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*221*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*222*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*223*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*224*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*225*/	    r3.z = -r6.x + r6.y;
/*226*/	    r3.z = r3.w * r3.z + r6.x;
/*227*/	  } else {
/*228*/	    r3.z = 1.000000;
/*229*/	  }
/*230*/	} else {
/*231*/	  r3.z = 1.000000;
/*232*/	}
/*233*/	r3.w = cb1.data[34].w + -1.000000;
/*234*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*235*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*236*/	if(floatBitsToUint(r2.w) == 0u) {
/*237*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*238*/	  r2.w = floatBitsToInt(r2.w);
/*239*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*240*/	  if(floatBitsToUint(r2.w) != 0u) {
/*241*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*242*/	    r5.w = vsOut_T0.w;
/*243*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*244*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*245*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*246*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*247*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*248*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*249*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*250*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*251*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*252*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*253*/	    if(floatBitsToUint(r5.w) == 0u) {
/*254*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*255*/	      r6.xy = floor((r5.xyxx).xy);
/*256*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*257*/	      r2.w = -0.000400 / r2.w;
/*258*/	      r2.w = r2.w + r5.z;
/*259*/	      r7.z = -r7.y + 1.000000;
/*260*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*261*/	      r7.w = -r7.y;
/*262*/	      r9.x = cb1.data[0].z/**/;
/*263*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*264*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*265*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*266*/	      r9.w = -cb1.data[0].w/**/;
/*267*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*268*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*269*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*270*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*271*/	      r7.x = r8.x;
/*272*/	      r7.y = r10.x;
/*273*/	      r7.z = r9.x;
/*274*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*275*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*276*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*277*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*278*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*279*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*280*/	      r2.w = -r5.x + r5.z;
/*281*/	      r2.w = r5.y * r2.w + r5.x;
/*282*/	    } else {
/*283*/	      r2.w = 1.000000;
/*284*/	    }
/*285*/	  } else {
/*286*/	    r2.w = 1.000000;
/*287*/	  }
/*288*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*289*/	  r5.y = r5.x * cb1.data[34].x;
/*290*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*291*/	  r5.x = r1.w + -r5.x;
/*292*/	  r5.x = saturate(r5.x / r5.y);
/*293*/	  r2.w = -r3.z + r2.w;
/*294*/	  r3.z = r5.x * r2.w + r3.z;
/*295*/	}
/*296*/	if(floatBitsToUint(r3.w) != 0u) {
/*297*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*298*/	  r3.w = r2.w * cb1.data[34].y;
/*299*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*300*/	  r2.w = r1.w + -r2.w;
/*301*/	  r2.w = saturate(r2.w / r3.w);
/*302*/	  r3.x = -r3.z + 1.000000;
/*303*/	  r3.z = r2.w * r3.x + r3.z;
/*304*/	}
/*305*/	r3.z = saturate(r3.z);
/*306*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*307*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*308*/	r2.w = inversesqrt(r2.w);
/*309*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*310*/	r2.w = -r3.y + 1.000000;
/*311*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*312*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*313*/	r3.w = r3.w + r3.w;
/*314*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*315*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*316*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*317*/	r3.w = cos((r8.x));
/*318*/	r3.w = inversesqrt(r3.w);
/*319*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*320*/	r5.w = saturate(r0.w * 60.000000);
/*321*/	r5.w = -r0.w + r5.w;
/*322*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*323*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*324*/	r6.w = inversesqrt(r6.w);
/*325*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*326*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*327*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*328*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*329*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*330*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*331*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*332*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*333*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*334*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*335*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*336*/	r6.w = -r0.w + 1.000000;
/*337*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*338*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*339*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*340*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*341*/	  r6.w = max(r6.w, 0.000000);
/*342*/	  r6.w = log2(r6.w);
/*343*/	  r6.w = r6.w * 10.000000;
/*344*/	  r6.w = exp2(r6.w);
/*345*/	  r6.w = r3.w * r6.w;
/*346*/	  r6.w = r6.w * r5.w + r0.w;
/*347*/	  r7.y = r2.w * 8.000000;
/*348*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*349*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*350*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*351*/	}
/*352*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*353*/	r7.y = max(r6.w, 0.000000);
/*354*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*355*/	if(floatBitsToUint(r6.w) != 0u) {
/*356*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*357*/	  r6.x = max(r6.x, -1.000000);
/*358*/	  r6.x = min(r6.x, 1.000000);
/*359*/	  r6.y = -abs(r6.x) + 1.000000;
/*360*/	  r6.y = sqrt(r6.y);
/*361*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*362*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*363*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*364*/	  r6.w = r6.y * r6.z;
/*365*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*366*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*367*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*368*/	  r6.x = r6.z * r6.y + r6.x;
/*369*/	  r3.y = r3.y * r3.y;
/*370*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*371*/	  r3.x = r3.y * r3.x + r7.x;
/*372*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*373*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*374*/	  r3.y = -r3.x * r3.x + 1.000000;
/*375*/	  r3.y = max(r3.y, 0.001000);
/*376*/	  r3.y = log2(r3.y);
/*377*/	  r6.y = r3.y * 4.950617;
/*378*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*379*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*380*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*381*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*382*/	  r3.x = floatBitsToInt(r3.x);
/*383*/	  r6.y = r3.y * r3.y + -r6.y;
/*384*/	  r6.y = sqrt(r6.y);
/*385*/	  r3.y = -r3.y + r6.y;
/*386*/	  r3.y = max(r3.y, 0.000000);
/*387*/	  r3.y = sqrt(r3.y);
/*388*/	  r3.x = r3.y * r3.x;
/*389*/	  r3.x = r3.x * 1.414214;
/*390*/	  r3.x = 0.008727 / r3.x;
/*391*/	  r3.x = max(r3.x, 0.000100);
/*392*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*393*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*394*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*395*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*396*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*397*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*398*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*399*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*400*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*401*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*402*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*403*/	  r3.x = floatBitsToInt(r3.x);
/*404*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*405*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*406*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*407*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*408*/	  r3.x = r3.x * r6.x + 1.000000;
/*409*/	  r3.x = r3.x * 0.500000;
/*410*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*411*/	  r3.y = r3.y * r6.y + 1.000000;
/*412*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*413*/	  r3.y = min(r7.y, 1.000000);
/*414*/	  r2.w = r2.w * 1.570796;
/*415*/	  r2.w = sin(r2.w);
/*416*/	  r3.y = r3.y + -1.000000;
/*417*/	  r2.w = r2.w * r3.y + 1.000000;
/*418*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*419*/	  r3.y = max(r3.y, 0.000000);
/*420*/	  r3.y = log2(r3.y);
/*421*/	  r3.y = r3.y * 10.000000;
/*422*/	  r3.y = exp2(r3.y);
/*423*/	  r3.y = r3.w * r3.y;
/*424*/	  r3.y = r3.y * r5.w + r0.w;
/*425*/	  r2.w = r2.w * abs(r3.x);
/*426*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*427*/	} else {
/*428*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*429*/	}
/*430*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*431*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*432*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*433*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*434*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*435*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*436*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*437*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*438*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*439*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*440*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*441*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*442*/	r2.w = inversesqrt(r2.w);
/*443*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*444*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*445*/	r2.w = r2.w + r2.w;
/*446*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*447*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*448*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*449*/	r0.x = max(r0.x, 0.000000);
/*450*/	r0.x = log2(r0.x);
/*451*/	r0.x = r0.x * 10.000000;
/*452*/	r0.x = exp2(r0.x);
/*453*/	r0.x = r3.w * r0.x;
/*454*/	r0.x = r0.x * r5.w + r0.w;
/*455*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*456*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*457*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*458*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*459*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*460*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*461*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*462*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*463*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*464*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*465*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*466*/	if(r0.x != 0) discard;
/*467*/	color1.x = 1.000000;
/*468*/	return;
}
