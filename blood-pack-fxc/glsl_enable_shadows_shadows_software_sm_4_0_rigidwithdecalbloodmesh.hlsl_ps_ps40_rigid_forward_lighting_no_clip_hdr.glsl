//
//
// Shader Model 4
// Fragment Shader
//
// id: 5200 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

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
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*13*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*14*/	r0.x = saturate(vsOut_N0.w);
/*15*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
/*23*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*25*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*27*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*28*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*29*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*33*/	r1.w = -r1.w + 1.000000;
/*34*/	r1.w = max(r1.w, 0.000000);
/*35*/	r1.z = sqrt(r1.w);
/*36*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*38*/	r4.w = 1.000000;
/*39*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*40*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*41*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*42*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*43*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*44*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*45*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*46*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*47*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*48*/	r5.z = vsOut_T6.x;
/*49*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*50*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*51*/	if(floatBitsToUint(r2.w) != 0u) {
/*52*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*53*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*54*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*55*/	  r2.w = -r2.w + 1.000000;
/*56*/	  r2.w = max(r2.w, 0.000000);
/*57*/	  r5.z = sqrt(r2.w);
/*58*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*59*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*60*/	  r2.w = r3.y * r8.w;
/*61*/	  r3.y = r2.w * -0.500000 + r3.y;
/*62*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*63*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*64*/	  r2.w = -r6.w * r7.w + 1.000000;
/*65*/	  r0.xyw = (r2.wwww * r0.xyxw + r8.xyxz).xyw;
/*66*/	  r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*67*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*68*/	}
/*69*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*70*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*71*/	r5.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*72*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*73*/	r2.w = saturate(-r2.w + r5.w);
/*74*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*75*/	if(floatBitsToUint(r2.w) != 0u) {
/*76*/	  r2.w = -r5.w + 1.000000;
/*77*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*78*/	  r2.w = -r2.w + 1.000000;
/*79*/	  r2.w = -r2.w * r2.w + 1.000000;
/*80*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*81*/	  r5.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*82*/	  r2.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*83*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*84*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*85*/	  r6.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r5.xzzx).xyz;
/*86*/	  r0.xyw = (r2.wwww * r6.xyxz + r5.xyxz).xyw;
/*87*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*88*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*89*/	}
/*90*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*91*/	r2.w = inversesqrt(r2.w);
/*92*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*93*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*94*/	r2.w = inversesqrt(r2.w);
/*95*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*96*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*97*/	r2.w = inversesqrt(r2.w);
/*98*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*99*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*100*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*101*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*102*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*103*/	r2.w = inversesqrt(r2.w);
/*104*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*105*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*106*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*107*/	if(floatBitsToUint(r0.z) != 0u) {
/*108*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*109*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*110*/	  r0.z = r3.w * cb0.data[26].x;
/*111*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*112*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*113*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*114*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*115*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*116*/	}
/*117*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*118*/	if(floatBitsToUint(r0.z) != 0u) {
/*119*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*120*/	  if(floatBitsToUint(r0.z) != 0u) {
/*121*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*122*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*123*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*124*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*125*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*126*/	    r0.z = -r0.z + 1.000000;
/*127*/	    r0.z = max(r0.z, 0.000000);
/*128*/	    r9.z = sqrt(r0.z);
/*129*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*130*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*131*/	    r0.z = inversesqrt(r0.z);
/*132*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*133*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*134*/	    r11.y = -1.000000;
/*135*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*136*/	    r0.z = inversesqrt(r0.z);
/*137*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*138*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*139*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*140*/	    r2.w = r2.w * 1.250000;
/*141*/	    r2.w = min(r2.w, 1.000000);
/*142*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*143*/	    r3.z = r3.z * 4.000000;
/*144*/	    r2.w = r2.w * 0.200000 + r3.z;
/*145*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*146*/	    r0.z = r0.z + -r2.w;
/*147*/	    r0.z = saturate(r0.z * 200.000000);
/*148*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*149*/	    r0.z = r0.z * r0.z;
/*150*/	    r0.z = r0.z * r2.w;
/*151*/	    r3.x = r0.z * -r3.x + r3.x;
/*152*/	    r2.w = -r3.y + 0.200000;
/*153*/	    r3.y = r0.z * r2.w + r3.y;
/*154*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*155*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*156*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*157*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*158*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*159*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*160*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*161*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*162*/	    r2.w = -r2.w + 1.000000;
/*163*/	    r2.w = max(r2.w, 0.000000);
/*164*/	    r8.z = sqrt(r2.w);
/*165*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*166*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*167*/	    r2.w = sqrt(r2.w);
/*168*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*169*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*170*/	    r2.w = inversesqrt(r2.w);
/*171*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*172*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*173*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*174*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*175*/	    r2.w = -r1.y + 1.000000;
/*176*/	    r0.z = min(r0.z, r2.w);
/*177*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*178*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*179*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*180*/	    r0.z = inversesqrt(r0.z);
/*181*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*182*/	  }
/*183*/	}
/*184*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*185*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*186*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*187*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*188*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*189*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*190*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*191*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*192*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*193*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*194*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*195*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*196*/	r2.w = inversesqrt(r2.w);
/*197*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*198*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*199*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*200*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*201*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*202*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*203*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*204*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*205*/	r3.y = intBitsToFloat(int(r2.w));
/*206*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*207*/	if(floatBitsToUint(r3.z) != 0u) {
/*208*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*209*/	  r5.w = vsOut_T0.w;
/*210*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*211*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*212*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*213*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*214*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*215*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*216*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*217*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*218*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*219*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*220*/	  if(floatBitsToUint(r3.w) == 0u) {
/*221*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*222*/	    r7.xy = floor((r6.xyxx).xy);
/*223*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*224*/	    r3.z = -0.000400 / r3.z;
/*225*/	    r3.z = r3.z + r6.z;
/*226*/	    r8.z = -r8.y + 1.000000;
/*227*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*228*/	    r8.w = -r8.y;
/*229*/	    r10.x = cb1.data[0].z/**/;
/*230*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*231*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*232*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*233*/	    r10.w = -cb1.data[0].w/**/;
/*234*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*235*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*236*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*237*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*238*/	    r8.x = r9.x;
/*239*/	    r8.y = r11.x;
/*240*/	    r8.z = r10.x;
/*241*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*242*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*243*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*244*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*245*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*246*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*247*/	    r3.z = -r6.x + r6.y;
/*248*/	    r3.z = r3.w * r3.z + r6.x;
/*249*/	  } else {
/*250*/	    r3.z = 1.000000;
/*251*/	  }
/*252*/	} else {
/*253*/	  r3.z = 1.000000;
/*254*/	}
/*255*/	r3.w = cb1.data[34].w + -1.000000;
/*256*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*257*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*258*/	if(floatBitsToUint(r2.w) == 0u) {
/*259*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*260*/	  r2.w = floatBitsToInt(r2.w);
/*261*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*262*/	  if(floatBitsToUint(r2.w) != 0u) {
/*263*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*264*/	    r5.w = vsOut_T0.w;
/*265*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*266*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*267*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*268*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*269*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*270*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*271*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*272*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*273*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*274*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*275*/	    if(floatBitsToUint(r5.w) == 0u) {
/*276*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*277*/	      r6.xy = floor((r5.xyxx).xy);
/*278*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*279*/	      r2.w = -0.000400 / r2.w;
/*280*/	      r2.w = r2.w + r5.z;
/*281*/	      r7.z = -r7.y + 1.000000;
/*282*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*283*/	      r7.w = -r7.y;
/*284*/	      r9.x = cb1.data[0].z/**/;
/*285*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*286*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*287*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*288*/	      r9.w = -cb1.data[0].w/**/;
/*289*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*290*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*291*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*292*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*293*/	      r7.x = r8.x;
/*294*/	      r7.y = r10.x;
/*295*/	      r7.z = r9.x;
/*296*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*297*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*298*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*299*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*300*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*301*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*302*/	      r2.w = -r5.x + r5.z;
/*303*/	      r2.w = r5.y * r2.w + r5.x;
/*304*/	    } else {
/*305*/	      r2.w = 1.000000;
/*306*/	    }
/*307*/	  } else {
/*308*/	    r2.w = 1.000000;
/*309*/	  }
/*310*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*311*/	  r5.y = r5.x * cb1.data[34].x;
/*312*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*313*/	  r5.x = r1.w + -r5.x;
/*314*/	  r5.x = saturate(r5.x / r5.y);
/*315*/	  r2.w = -r3.z + r2.w;
/*316*/	  r3.z = r5.x * r2.w + r3.z;
/*317*/	}
/*318*/	if(floatBitsToUint(r3.w) != 0u) {
/*319*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*320*/	  r3.w = r2.w * cb1.data[34].y;
/*321*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*322*/	  r2.w = r1.w + -r2.w;
/*323*/	  r2.w = saturate(r2.w / r3.w);
/*324*/	  r3.y = -r3.z + 1.000000;
/*325*/	  r3.z = r2.w * r3.y + r3.z;
/*326*/	}
/*327*/	r3.z = saturate(r3.z);
/*328*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*329*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*330*/	r2.w = inversesqrt(r2.w);
/*331*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*332*/	r2.w = -r3.x + 1.000000;
/*333*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*334*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*335*/	r3.w = r3.w + r3.w;
/*336*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*337*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*338*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*339*/	r3.w = cos((r8.x));
/*340*/	r3.w = inversesqrt(r3.w);
/*341*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*342*/	r5.w = saturate(r0.z * 60.000000);
/*343*/	r5.w = -r0.z + r5.w;
/*344*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*345*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*346*/	r6.w = inversesqrt(r6.w);
/*347*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*348*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*349*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*350*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*351*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*352*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*353*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*354*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*355*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*356*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*357*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*358*/	r6.w = -r0.z + 1.000000;
/*359*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*360*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*361*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*362*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*363*/	  r6.w = max(r6.w, 0.000000);
/*364*/	  r6.w = log2(r6.w);
/*365*/	  r6.w = r6.w * 10.000000;
/*366*/	  r6.w = exp2(r6.w);
/*367*/	  r6.w = r3.w * r6.w;
/*368*/	  r6.w = r6.w * r5.w + r0.z;
/*369*/	  r7.y = r2.w * 8.000000;
/*370*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*371*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*372*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*373*/	}
/*374*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*375*/	r7.y = max(r6.w, 0.000000);
/*376*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*377*/	if(floatBitsToUint(r6.w) != 0u) {
/*378*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*379*/	  r6.x = max(r6.x, -1.000000);
/*380*/	  r6.x = min(r6.x, 1.000000);
/*381*/	  r6.y = -abs(r6.x) + 1.000000;
/*382*/	  r6.y = sqrt(r6.y);
/*383*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*384*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*385*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*386*/	  r6.w = r6.y * r6.z;
/*387*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*388*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*389*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*390*/	  r6.x = r6.z * r6.y + r6.x;
/*391*/	  r3.x = r3.x * r3.x;
/*392*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*393*/	  r3.x = r3.x * r3.y + r7.x;
/*394*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*395*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*396*/	  r3.y = -r3.x * r3.x + 1.000000;
/*397*/	  r3.y = max(r3.y, 0.001000);
/*398*/	  r3.y = log2(r3.y);
/*399*/	  r6.y = r3.y * 4.950617;
/*400*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*401*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*402*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*403*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*404*/	  r3.x = floatBitsToInt(r3.x);
/*405*/	  r6.y = r3.y * r3.y + -r6.y;
/*406*/	  r6.y = sqrt(r6.y);
/*407*/	  r3.y = -r3.y + r6.y;
/*408*/	  r3.y = max(r3.y, 0.000000);
/*409*/	  r3.y = sqrt(r3.y);
/*410*/	  r3.x = r3.y * r3.x;
/*411*/	  r3.x = r3.x * 1.414214;
/*412*/	  r3.x = 0.008727 / r3.x;
/*413*/	  r3.x = max(r3.x, 0.000100);
/*414*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*415*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*416*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*417*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*418*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*419*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*420*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*421*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*422*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*423*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*424*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*425*/	  r3.x = floatBitsToInt(r3.x);
/*426*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*427*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*428*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*429*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*430*/	  r3.x = r3.x * r6.x + 1.000000;
/*431*/	  r3.x = r3.x * 0.500000;
/*432*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*433*/	  r3.y = r3.y * r6.y + 1.000000;
/*434*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*435*/	  r3.y = min(r7.y, 1.000000);
/*436*/	  r2.w = r2.w * 1.570796;
/*437*/	  r2.w = sin(r2.w);
/*438*/	  r3.y = r3.y + -1.000000;
/*439*/	  r2.w = r2.w * r3.y + 1.000000;
/*440*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*441*/	  r3.y = max(r3.y, 0.000000);
/*442*/	  r3.y = log2(r3.y);
/*443*/	  r3.y = r3.y * 10.000000;
/*444*/	  r3.y = exp2(r3.y);
/*445*/	  r3.y = r3.w * r3.y;
/*446*/	  r3.y = r3.y * r5.w + r0.z;
/*447*/	  r2.w = r2.w * abs(r3.x);
/*448*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*449*/	} else {
/*450*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*451*/	}
/*452*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*453*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*454*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*455*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*456*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*457*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*458*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*459*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*460*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*461*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*462*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*463*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*464*/	r2.w = inversesqrt(r2.w);
/*465*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*466*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*467*/	r2.w = r2.w + r2.w;
/*468*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*469*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*470*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*471*/	r1.x = max(r1.x, 0.000000);
/*472*/	r1.x = log2(r1.x);
/*473*/	r1.x = r1.x * 10.000000;
/*474*/	r1.x = exp2(r1.x);
/*475*/	r1.x = r3.w * r1.x;
/*476*/	r0.z = r1.x * r5.w + r0.z;
/*477*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*478*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*479*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*480*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*481*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*482*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*483*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*484*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*485*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*486*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*487*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*488*/	if(r0.x != 0) discard;
/*489*/	color1.x = 1.000000;
/*490*/	return;
}
