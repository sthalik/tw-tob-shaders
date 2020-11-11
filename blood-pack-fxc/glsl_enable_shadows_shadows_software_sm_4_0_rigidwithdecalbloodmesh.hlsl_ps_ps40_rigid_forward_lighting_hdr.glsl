//
//
// Shader Model 4
// Fragment Shader
//
// id: 5198 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*19*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
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
/*41*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*42*/	r4.w = 1.000000;
/*43*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*44*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*45*/	r5.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*46*/	r5.xy = (r5.xyxx / r3.zwzz).xy;
/*47*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*48*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*49*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r6.x));
/*50*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*51*/	r2.w = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r2.w));
/*52*/	r5.z = vsOut_T6.x;
/*53*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyzx.stp)).xyzw;
/*54*/	r5.xyzw = (texture(s_decal_normal, r5.xyzx.stp)).xyzw;
/*55*/	if(floatBitsToUint(r2.w) != 0u) {
/*56*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*57*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*58*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*59*/	  r2.w = -r2.w + 1.000000;
/*60*/	  r2.w = max(r2.w, 0.000000);
/*61*/	  r5.z = sqrt(r2.w);
/*62*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*63*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*64*/	  r2.w = r3.y * r8.w;
/*65*/	  r3.y = r2.w * -0.500000 + r3.y;
/*66*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*67*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*68*/	  r2.w = -r6.w * r7.w + 1.000000;
/*69*/	  r0.xyw = (r2.wwww * r0.xyxw + r8.xyxz).xyw;
/*70*/	  r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*71*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*72*/	}
/*73*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*74*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*75*/	r5.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*76*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*77*/	r2.w = saturate(-r2.w + r5.w);
/*78*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*79*/	if(floatBitsToUint(r2.w) != 0u) {
/*80*/	  r2.w = -r5.w + 1.000000;
/*81*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*82*/	  r2.w = -r2.w + 1.000000;
/*83*/	  r2.w = -r2.w * r2.w + 1.000000;
/*84*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*85*/	  r5.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*86*/	  r2.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*87*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*88*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*89*/	  r6.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r5.xzzx).xyz;
/*90*/	  r0.xyw = (r2.wwww * r6.xyxz + r5.xyxz).xyw;
/*91*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*92*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*93*/	}
/*94*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*95*/	r2.w = inversesqrt(r2.w);
/*96*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*97*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*98*/	r2.w = inversesqrt(r2.w);
/*99*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*100*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*101*/	r2.w = inversesqrt(r2.w);
/*102*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*103*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*104*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*105*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*106*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*107*/	r2.w = inversesqrt(r2.w);
/*108*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*109*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*110*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*111*/	if(floatBitsToUint(r0.z) != 0u) {
/*112*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*113*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*114*/	  r0.z = r3.w * cb0.data[26].x;
/*115*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*116*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*117*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*118*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*119*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*120*/	}
/*121*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*122*/	if(floatBitsToUint(r0.z) != 0u) {
/*123*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*124*/	  if(floatBitsToUint(r0.z) != 0u) {
/*125*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*126*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*127*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*128*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*129*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*130*/	    r0.z = -r0.z + 1.000000;
/*131*/	    r0.z = max(r0.z, 0.000000);
/*132*/	    r9.z = sqrt(r0.z);
/*133*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*134*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*135*/	    r0.z = inversesqrt(r0.z);
/*136*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*137*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*138*/	    r11.y = -1.000000;
/*139*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*140*/	    r0.z = inversesqrt(r0.z);
/*141*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*142*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*143*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*144*/	    r2.w = r2.w * 1.250000;
/*145*/	    r2.w = min(r2.w, 1.000000);
/*146*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*147*/	    r3.z = r3.z * 4.000000;
/*148*/	    r2.w = r2.w * 0.200000 + r3.z;
/*149*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*150*/	    r0.z = r0.z + -r2.w;
/*151*/	    r0.z = saturate(r0.z * 200.000000);
/*152*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*153*/	    r0.z = r0.z * r0.z;
/*154*/	    r0.z = r0.z * r2.w;
/*155*/	    r3.x = r0.z * -r3.x + r3.x;
/*156*/	    r2.w = -r3.y + 0.200000;
/*157*/	    r3.y = r0.z * r2.w + r3.y;
/*158*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*159*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*160*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*161*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*162*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*163*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*164*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*165*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*166*/	    r2.w = -r2.w + 1.000000;
/*167*/	    r2.w = max(r2.w, 0.000000);
/*168*/	    r8.z = sqrt(r2.w);
/*169*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*170*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*171*/	    r2.w = sqrt(r2.w);
/*172*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*173*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*174*/	    r2.w = inversesqrt(r2.w);
/*175*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*176*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*177*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*178*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*179*/	    r2.w = -r1.y + 1.000000;
/*180*/	    r0.z = min(r0.z, r2.w);
/*181*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*182*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*183*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*184*/	    r0.z = inversesqrt(r0.z);
/*185*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*186*/	  }
/*187*/	}
/*188*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*189*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*190*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*191*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*192*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*193*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*194*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*195*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*196*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*197*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*198*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*199*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*200*/	r2.w = inversesqrt(r2.w);
/*201*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*202*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*203*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*204*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*205*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*206*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*207*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*208*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*209*/	r3.y = intBitsToFloat(int(r2.w));
/*210*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*211*/	if(floatBitsToUint(r3.z) != 0u) {
/*212*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*213*/	  r5.w = vsOut_T0.w;
/*214*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*215*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*216*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*217*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*218*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*219*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*220*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*221*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*222*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*223*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*224*/	  if(floatBitsToUint(r3.w) == 0u) {
/*225*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*226*/	    r7.xy = floor((r6.xyxx).xy);
/*227*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*228*/	    r3.z = -0.000400 / r3.z;
/*229*/	    r3.z = r3.z + r6.z;
/*230*/	    r8.z = -r8.y + 1.000000;
/*231*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*232*/	    r8.w = -r8.y;
/*233*/	    r10.x = cb1.data[0].z/**/;
/*234*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*235*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*236*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*237*/	    r10.w = -cb1.data[0].w/**/;
/*238*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*239*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*240*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*241*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*242*/	    r8.x = r9.x;
/*243*/	    r8.y = r11.x;
/*244*/	    r8.z = r10.x;
/*245*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*246*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*247*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*248*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*249*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*250*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*251*/	    r3.z = -r6.x + r6.y;
/*252*/	    r3.z = r3.w * r3.z + r6.x;
/*253*/	  } else {
/*254*/	    r3.z = 1.000000;
/*255*/	  }
/*256*/	} else {
/*257*/	  r3.z = 1.000000;
/*258*/	}
/*259*/	r3.w = cb1.data[34].w + -1.000000;
/*260*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*261*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*262*/	if(floatBitsToUint(r2.w) == 0u) {
/*263*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*264*/	  r2.w = floatBitsToInt(r2.w);
/*265*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*266*/	  if(floatBitsToUint(r2.w) != 0u) {
/*267*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*268*/	    r5.w = vsOut_T0.w;
/*269*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*270*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*271*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*272*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*273*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*274*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*275*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*276*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*277*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*278*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*279*/	    if(floatBitsToUint(r5.w) == 0u) {
/*280*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*281*/	      r6.xy = floor((r5.xyxx).xy);
/*282*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*283*/	      r2.w = -0.000400 / r2.w;
/*284*/	      r2.w = r2.w + r5.z;
/*285*/	      r7.z = -r7.y + 1.000000;
/*286*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*287*/	      r7.w = -r7.y;
/*288*/	      r9.x = cb1.data[0].z/**/;
/*289*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*290*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*291*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*292*/	      r9.w = -cb1.data[0].w/**/;
/*293*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*294*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*295*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*296*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*297*/	      r7.x = r8.x;
/*298*/	      r7.y = r10.x;
/*299*/	      r7.z = r9.x;
/*300*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*301*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*302*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*303*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*304*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*305*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*306*/	      r2.w = -r5.x + r5.z;
/*307*/	      r2.w = r5.y * r2.w + r5.x;
/*308*/	    } else {
/*309*/	      r2.w = 1.000000;
/*310*/	    }
/*311*/	  } else {
/*312*/	    r2.w = 1.000000;
/*313*/	  }
/*314*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*315*/	  r5.y = r5.x * cb1.data[34].x;
/*316*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*317*/	  r5.x = r1.w + -r5.x;
/*318*/	  r5.x = saturate(r5.x / r5.y);
/*319*/	  r2.w = -r3.z + r2.w;
/*320*/	  r3.z = r5.x * r2.w + r3.z;
/*321*/	}
/*322*/	if(floatBitsToUint(r3.w) != 0u) {
/*323*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*324*/	  r3.w = r2.w * cb1.data[34].y;
/*325*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*326*/	  r2.w = r1.w + -r2.w;
/*327*/	  r2.w = saturate(r2.w / r3.w);
/*328*/	  r3.y = -r3.z + 1.000000;
/*329*/	  r3.z = r2.w * r3.y + r3.z;
/*330*/	}
/*331*/	r3.z = saturate(r3.z);
/*332*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*333*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*334*/	r2.w = inversesqrt(r2.w);
/*335*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*336*/	r2.w = -r3.x + 1.000000;
/*337*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*338*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*339*/	r3.w = r3.w + r3.w;
/*340*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*341*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*342*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*343*/	r3.w = cos((r8.x));
/*344*/	r3.w = inversesqrt(r3.w);
/*345*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*346*/	r5.w = saturate(r0.z * 60.000000);
/*347*/	r5.w = -r0.z + r5.w;
/*348*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*349*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*350*/	r6.w = inversesqrt(r6.w);
/*351*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*352*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*353*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*354*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*355*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*356*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*357*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*358*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*359*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*360*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*361*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*362*/	r6.w = -r0.z + 1.000000;
/*363*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*364*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*365*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*366*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*367*/	  r6.w = max(r6.w, 0.000000);
/*368*/	  r6.w = log2(r6.w);
/*369*/	  r6.w = r6.w * 10.000000;
/*370*/	  r6.w = exp2(r6.w);
/*371*/	  r6.w = r3.w * r6.w;
/*372*/	  r6.w = r6.w * r5.w + r0.z;
/*373*/	  r7.y = r2.w * 8.000000;
/*374*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*375*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*376*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*377*/	}
/*378*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*379*/	r7.y = max(r6.w, 0.000000);
/*380*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*381*/	if(floatBitsToUint(r6.w) != 0u) {
/*382*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*383*/	  r6.x = max(r6.x, -1.000000);
/*384*/	  r6.x = min(r6.x, 1.000000);
/*385*/	  r6.y = -abs(r6.x) + 1.000000;
/*386*/	  r6.y = sqrt(r6.y);
/*387*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*388*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*389*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*390*/	  r6.w = r6.y * r6.z;
/*391*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*392*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*393*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*394*/	  r6.x = r6.z * r6.y + r6.x;
/*395*/	  r3.x = r3.x * r3.x;
/*396*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*397*/	  r3.x = r3.x * r3.y + r7.x;
/*398*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*399*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*400*/	  r3.y = -r3.x * r3.x + 1.000000;
/*401*/	  r3.y = max(r3.y, 0.001000);
/*402*/	  r3.y = log2(r3.y);
/*403*/	  r6.y = r3.y * 4.950617;
/*404*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*405*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*406*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*407*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*408*/	  r3.x = floatBitsToInt(r3.x);
/*409*/	  r6.y = r3.y * r3.y + -r6.y;
/*410*/	  r6.y = sqrt(r6.y);
/*411*/	  r3.y = -r3.y + r6.y;
/*412*/	  r3.y = max(r3.y, 0.000000);
/*413*/	  r3.y = sqrt(r3.y);
/*414*/	  r3.x = r3.y * r3.x;
/*415*/	  r3.x = r3.x * 1.414214;
/*416*/	  r3.x = 0.008727 / r3.x;
/*417*/	  r3.x = max(r3.x, 0.000100);
/*418*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*419*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*420*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*421*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*422*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*423*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*424*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*425*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*426*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*427*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*428*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*429*/	  r3.x = floatBitsToInt(r3.x);
/*430*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*431*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*432*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*433*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*434*/	  r3.x = r3.x * r6.x + 1.000000;
/*435*/	  r3.x = r3.x * 0.500000;
/*436*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*437*/	  r3.y = r3.y * r6.y + 1.000000;
/*438*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*439*/	  r3.y = min(r7.y, 1.000000);
/*440*/	  r2.w = r2.w * 1.570796;
/*441*/	  r2.w = sin(r2.w);
/*442*/	  r3.y = r3.y + -1.000000;
/*443*/	  r2.w = r2.w * r3.y + 1.000000;
/*444*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*445*/	  r3.y = max(r3.y, 0.000000);
/*446*/	  r3.y = log2(r3.y);
/*447*/	  r3.y = r3.y * 10.000000;
/*448*/	  r3.y = exp2(r3.y);
/*449*/	  r3.y = r3.w * r3.y;
/*450*/	  r3.y = r3.y * r5.w + r0.z;
/*451*/	  r2.w = r2.w * abs(r3.x);
/*452*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*453*/	} else {
/*454*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*455*/	}
/*456*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*457*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*458*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*459*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*460*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*461*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*462*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*463*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*464*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*465*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*466*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*467*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*468*/	r2.w = inversesqrt(r2.w);
/*469*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*470*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*471*/	r2.w = r2.w + r2.w;
/*472*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*473*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*474*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*475*/	r1.x = max(r1.x, 0.000000);
/*476*/	r1.x = log2(r1.x);
/*477*/	r1.x = r1.x * 10.000000;
/*478*/	r1.x = exp2(r1.x);
/*479*/	r1.x = r3.w * r1.x;
/*480*/	r0.z = r1.x * r5.w + r0.z;
/*481*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*482*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*483*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*484*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*485*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*486*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*487*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*488*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*489*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*490*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*491*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*492*/	if(r0.x != 0) discard;
/*493*/	color1.x = 1.000000;
/*494*/	return;
}
