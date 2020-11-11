//
//
// Shader Model 4
// Fragment Shader
//
// id: 1151 - fxc/glsl_SM_4_0_rigidwithdecalbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

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
/*19*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb4.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb4.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb4.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb4.data[2].xyxz).xyw;
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
/*41*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*42*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*43*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*44*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*45*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*46*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*47*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*48*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*49*/	r4.z = vsOut_T6.x;
/*50*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*51*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*52*/	if(floatBitsToUint(r1.w) != 0u) {
/*53*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*54*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*55*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*56*/	  r1.w = -r1.w + 1.000000;
/*57*/	  r1.w = max(r1.w, 0.000000);
/*58*/	  r4.z = sqrt(r1.w);
/*59*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*60*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*61*/	  r1.w = r3.y * r7.w;
/*62*/	  r3.y = r1.w * -0.500000 + r3.y;
/*63*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*64*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*65*/	  r1.w = -r5.w * r6.w + 1.000000;
/*66*/	  r0.xyw = (r1.wwww * r0.xyxw + r7.xyxz).xyw;
/*67*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*68*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*69*/	}
/*70*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
/*71*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*72*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*73*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*74*/	r1.w = saturate(-r1.w + r4.w);
/*75*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*76*/	if(floatBitsToUint(r1.w) != 0u) {
/*77*/	  r1.w = -r4.w + 1.000000;
/*78*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*79*/	  r1.w = -r1.w + 1.000000;
/*80*/	  r1.w = -r1.w * r1.w + 1.000000;
/*81*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*82*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*83*/	  r1.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*84*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*85*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*86*/	  r5.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*87*/	  r0.xyw = (r1.wwww * r5.xyxz + r4.xyxz).xyw;
/*88*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*89*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*90*/	}
/*91*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*92*/	r1.w = inversesqrt(r1.w);
/*93*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*94*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*95*/	r1.w = inversesqrt(r1.w);
/*96*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*97*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*98*/	r1.w = inversesqrt(r1.w);
/*99*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*100*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*101*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*102*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*103*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*104*/	r1.w = inversesqrt(r1.w);
/*105*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*106*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*107*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*108*/	if(floatBitsToUint(r0.z) != 0u) {
/*109*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*110*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*111*/	  r0.z = r3.w * cb0.data[26].x;
/*112*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*113*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*114*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*115*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*116*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*117*/	}
/*118*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*119*/	if(floatBitsToUint(r0.z) != 0u) {
/*120*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*121*/	  if(floatBitsToUint(r0.z) != 0u) {
/*122*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*123*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*124*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*125*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*126*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*127*/	    r0.z = -r0.z + 1.000000;
/*128*/	    r0.z = max(r0.z, 0.000000);
/*129*/	    r8.z = sqrt(r0.z);
/*130*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*131*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*132*/	    r0.z = inversesqrt(r0.z);
/*133*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*134*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*135*/	    r10.y = -1.000000;
/*136*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*137*/	    r0.z = inversesqrt(r0.z);
/*138*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*139*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*140*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*141*/	    r1.w = r1.w * 1.250000;
/*142*/	    r1.w = min(r1.w, 1.000000);
/*143*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*144*/	    r2.w = r2.w * 4.000000;
/*145*/	    r1.w = r1.w * 0.200000 + r2.w;
/*146*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*147*/	    r0.z = r0.z + -r1.w;
/*148*/	    r0.z = saturate(r0.z * 200.000000);
/*149*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*150*/	    r0.z = r0.z * r0.z;
/*151*/	    r0.z = r0.z * r1.w;
/*152*/	    r3.x = r0.z * -r3.x + r3.x;
/*153*/	    r1.w = -r3.y + 0.200000;
/*154*/	    r3.y = r0.z * r1.w + r3.y;
/*155*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*156*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*157*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*158*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*159*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*160*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*161*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*162*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*163*/	    r1.w = -r1.w + 1.000000;
/*164*/	    r1.w = max(r1.w, 0.000000);
/*165*/	    r7.z = sqrt(r1.w);
/*166*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*167*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*168*/	    r1.w = sqrt(r1.w);
/*169*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*170*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*171*/	    r1.w = inversesqrt(r1.w);
/*172*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*173*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*174*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*175*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*176*/	    r1.w = -r1.y + 1.000000;
/*177*/	    r0.z = min(r0.z, r1.w);
/*178*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*179*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*180*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*181*/	    r0.z = inversesqrt(r0.z);
/*182*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*183*/	  }
/*184*/	}
/*185*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*186*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*187*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*188*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*189*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*190*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*191*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*192*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*193*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*194*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*195*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*196*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*197*/	r1.w = inversesqrt(r1.w);
/*198*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*199*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*200*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*201*/	r1.w = inversesqrt(r1.w);
/*202*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*203*/	r1.w = -r3.x + 1.000000;
/*204*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*205*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*206*/	r4.x = r4.x + r4.x;
/*207*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*208*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*209*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*210*/	r4.w = cos((r6.x));
/*211*/	r4.w = inversesqrt(r4.w);
/*212*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*213*/	r5.w = saturate(r0.z * 60.000000);
/*214*/	r5.w = -r0.z + r5.w;
/*215*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*216*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*217*/	r7.x = inversesqrt(r7.x);
/*218*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*219*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*220*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*221*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*222*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*223*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*224*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*225*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*226*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*227*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*228*/	r6.xzw = (r0.xxyw * r6.xxzw).xzw;
/*229*/	r5.y = -r0.z + 1.000000;
/*230*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*231*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*232*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*233*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*234*/	  r5.y = max(r5.y, 0.000000);
/*235*/	  r5.y = log2(r5.y);
/*236*/	  r5.y = r5.y * 10.000000;
/*237*/	  r5.y = exp2(r5.y);
/*238*/	  r5.y = r4.w * r5.y;
/*239*/	  r5.y = r5.y * r5.w + r0.z;
/*240*/	  r7.x = r1.w * 8.000000;
/*241*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*242*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*243*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*244*/	}
/*245*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*246*/	r7.x = max(r5.y, 0.000000);
/*247*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*248*/	if(floatBitsToUint(r5.y) != 0u) {
/*249*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*250*/	  r4.x = max(r4.x, -1.000000);
/*251*/	  r4.x = min(r4.x, 1.000000);
/*252*/	  r4.y = -abs(r4.x) + 1.000000;
/*253*/	  r4.y = sqrt(r4.y);
/*254*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*255*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*256*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*257*/	  r5.y = r4.y * r4.z;
/*258*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*259*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*260*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*261*/	  r4.x = r4.z * r4.y + r4.x;
/*262*/	  r3.x = r3.x * r3.x;
/*263*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*264*/	  r2.w = r3.x * r2.w + r5.x;
/*265*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*266*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*267*/	  r3.x = -r2.w * r2.w + 1.000000;
/*268*/	  r3.x = max(r3.x, 0.001000);
/*269*/	  r3.x = log2(r3.x);
/*270*/	  r4.y = r3.x * 4.950617;
/*271*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*272*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*273*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*274*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*275*/	  r2.w = floatBitsToInt(r2.w);
/*276*/	  r4.y = r3.x * r3.x + -r4.y;
/*277*/	  r4.y = sqrt(r4.y);
/*278*/	  r3.x = -r3.x + r4.y;
/*279*/	  r3.x = max(r3.x, 0.000000);
/*280*/	  r3.x = sqrt(r3.x);
/*281*/	  r2.w = r2.w * r3.x;
/*282*/	  r2.w = r2.w * 1.414214;
/*283*/	  r2.w = 0.008727 / r2.w;
/*284*/	  r2.w = max(r2.w, 0.000100);
/*285*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*286*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*287*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*288*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*289*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*290*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*291*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*292*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*293*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*294*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*295*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*296*/	  r2.w = floatBitsToInt(r2.w);
/*297*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*298*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*299*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*300*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*301*/	  r2.w = r2.w * r4.x + 1.000000;
/*302*/	  r2.w = r2.w * 0.500000;
/*303*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*304*/	  r3.x = r3.x * r4.y + 1.000000;
/*305*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*306*/	  r3.x = min(r7.x, 1.000000);
/*307*/	  r1.w = r1.w * 1.570796;
/*308*/	  r1.w = sin(r1.w);
/*309*/	  r3.x = r3.x + -1.000000;
/*310*/	  r1.w = r1.w * r3.x + 1.000000;
/*311*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*312*/	  r3.x = max(r3.x, 0.000000);
/*313*/	  r3.x = log2(r3.x);
/*314*/	  r3.x = r3.x * 10.000000;
/*315*/	  r3.x = exp2(r3.x);
/*316*/	  r3.x = r4.w * r3.x;
/*317*/	  r3.x = r3.x * r5.w + r0.z;
/*318*/	  r1.w = r1.w * abs(r2.w);
/*319*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*320*/	} else {
/*321*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*322*/	}
/*323*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*324*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*325*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*326*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*327*/	r0.xyw = (r0.xyxw * r7.xxxx).xyw;
/*328*/	r0.xyw = (r0.xyxw * cb1.data[1].xyxz).xyw;
/*329*/	r0.xyw = (r3.xyxz * r0.xyxw).xyw;
/*330*/	r0.xyw = (r5.xxxx * r0.xyxw).xyw;
/*331*/	r0.xyw = (r4.xyxz * cb1.data[1].xyxz + r0.xyxw).xyw;
/*332*/	r0.xyw = (r0.xyxw + r6.xzxw).xyw;
/*333*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*334*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*335*/	r1.w = inversesqrt(r1.w);
/*336*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*337*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*338*/	r1.w = r1.w + r1.w;
/*339*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*340*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*341*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*342*/	r1.x = max(r1.x, 0.000000);
/*343*/	r1.x = log2(r1.x);
/*344*/	r1.x = r1.x * 10.000000;
/*345*/	r1.x = exp2(r1.x);
/*346*/	r1.x = r4.w * r1.x;
/*347*/	r0.z = r1.x * r5.w + r0.z;
/*348*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*349*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*350*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*351*/	r0.w = 1.000000;
/*352*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*353*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*354*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*355*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*356*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*357*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*358*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*359*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*360*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*361*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*362*/	if(r0.x != 0) discard;
/*363*/	color1.x = 1.000000;
/*364*/	return;
}
