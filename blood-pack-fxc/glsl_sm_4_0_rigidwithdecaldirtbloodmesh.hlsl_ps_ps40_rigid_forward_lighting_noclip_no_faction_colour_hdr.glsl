//
//
// Shader Model 4
// Fragment Shader
//
// id: 996 - fxc/glsl_SM_4_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*20*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*21*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*22*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*23*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*24*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*25*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*26*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*27*/	r4.z = vsOut_T6.x;
/*28*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*29*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*30*/	if(floatBitsToUint(r1.w) != 0u) {
/*31*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*32*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*33*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*34*/	  r1.w = -r1.w + 1.000000;
/*35*/	  r1.w = max(r1.w, 0.000000);
/*36*/	  r4.z = sqrt(r1.w);
/*37*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*38*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*39*/	  r1.w = r3.y * r7.w;
/*40*/	  r3.y = r1.w * -0.500000 + r3.y;
/*41*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*42*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*43*/	  r1.w = -r5.w * r6.w + 1.000000;
/*44*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*45*/	  r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*46*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*47*/	}
/*48*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*49*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
/*50*/	r4.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*51*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*52*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*53*/	r1.w = r4.w * r5.w;
/*54*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*55*/	r1.xyz = (r1.wwww * r5.xyzx + r1.xyzx).xyz;
/*56*/	r0.xy = (r4.xyxx * r4.wwww + r0.xyxx).xy;
/*57*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*58*/	r2.w = inversesqrt(r2.w);
/*59*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*60*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*61*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*62*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*63*/	r2.w = saturate(-r2.w + r4.w);
/*64*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r2.w) != 0u) {
/*66*/	  r2.w = -r4.w + 1.000000;
/*67*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*68*/	  r2.w = -r2.w + 1.000000;
/*69*/	  r2.w = -r2.w * r2.w + 1.000000;
/*70*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*71*/	  r4.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*72*/	  r2.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*73*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*74*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*75*/	  r5.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*76*/	  r1.xyz = (r2.wwww * r5.xyzx + r4.xyzx).xyz;
/*77*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*78*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*79*/	} else {
/*80*/	  r5.xyz = (r1.wwww * r2.xyzx).xyz;
/*81*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*82*/	}
/*83*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*89*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*92*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*93*/	r7.xyz = (r0.xxxx * r2.xyzx + r7.xyzx).xyz;
/*94*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*95*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*96*/	r1.w = inversesqrt(r1.w);
/*97*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*98*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*99*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*100*/	if(floatBitsToUint(r0.w) != 0u) {
/*101*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*102*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*103*/	  r0.w = r3.w * cb0.data[26].x;
/*104*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*105*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*106*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*107*/	  r4.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r4.xyzx).xyz;
/*108*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*109*/	}
/*110*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*111*/	if(floatBitsToUint(r0.w) != 0u) {
/*112*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*113*/	  if(floatBitsToUint(r0.w) != 0u) {
/*114*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*115*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*116*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*117*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*118*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*119*/	    r0.w = -r0.w + 1.000000;
/*120*/	    r0.w = max(r0.w, 0.000000);
/*121*/	    r8.z = sqrt(r0.w);
/*122*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*123*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*124*/	    r0.w = inversesqrt(r0.w);
/*125*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*126*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*127*/	    r10.y = -1.000000;
/*128*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*129*/	    r0.w = inversesqrt(r0.w);
/*130*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*131*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*132*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*133*/	    r1.w = r1.w * 1.250000;
/*134*/	    r1.w = min(r1.w, 1.000000);
/*135*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*136*/	    r2.w = r2.w * 4.000000;
/*137*/	    r1.w = r1.w * 0.200000 + r2.w;
/*138*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*139*/	    r0.w = r0.w + -r1.w;
/*140*/	    r0.w = saturate(r0.w * 200.000000);
/*141*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*142*/	    r0.w = r0.w * r0.w;
/*143*/	    r0.w = r0.w * r1.w;
/*144*/	    r3.x = r0.w * -r3.x + r3.x;
/*145*/	    r1.w = -r3.y + 0.200000;
/*146*/	    r3.y = r0.w * r1.w + r3.y;
/*147*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*148*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*149*/	    r9.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*150*/	    r4.xyz = (r0.wwww * r9.xyzx + r4.xyzx).xyz;
/*151*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*152*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*153*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*154*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*155*/	    r1.w = -r1.w + 1.000000;
/*156*/	    r1.w = max(r1.w, 0.000000);
/*157*/	    r7.z = sqrt(r1.w);
/*158*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*159*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*160*/	    r1.w = sqrt(r1.w);
/*161*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*162*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*163*/	    r1.w = inversesqrt(r1.w);
/*164*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*165*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*166*/	    r2.xyz = (r7.xxxx * r2.xyzx + r5.xyzx).xyz;
/*167*/	    r2.xyz = (r7.zzzz * r6.xyzx + r2.xyzx).xyz;
/*168*/	    r1.w = -r0.y + 1.000000;
/*169*/	    r0.w = min(r0.w, r1.w);
/*170*/	    r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*171*/	    r2.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*172*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*173*/	    r0.w = inversesqrt(r0.w);
/*174*/	    r0.xyz = (r0.wwww * r2.xyzx).xyz;
/*175*/	  }
/*176*/	}
/*177*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*178*/	r2.xyz = (r1.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*179*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*180*/	r1.xyz = saturate(vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*181*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*182*/	r2.xyz = (-r1.xyzx + r1.wwww).xyz;
/*183*/	r1.xyz = (vsOut_T7.zzzz * r2.xyzx + r1.xyzx).xyz;
/*184*/	r1.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*185*/	r2.xyz = (-r4.xyzx + r1.wwww).xyz;
/*186*/	r2.xyz = (vsOut_T7.zzzz * r2.xyzx + r4.xyzx).xyz;
/*187*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*188*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*189*/	r1.w = inversesqrt(r1.w);
/*190*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*191*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*192*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*193*/	r1.w = inversesqrt(r1.w);
/*194*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*195*/	r1.w = -r3.x + 1.000000;
/*196*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*197*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*198*/	r4.x = r4.x + r4.x;
/*199*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*200*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*201*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*202*/	r4.w = cos((r6.x));
/*203*/	r4.w = inversesqrt(r4.w);
/*204*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*205*/	r5.w = saturate(r0.w * 60.000000);
/*206*/	r5.w = -r0.w + r5.w;
/*207*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*208*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*209*/	r7.x = inversesqrt(r7.x);
/*210*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*211*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*212*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*213*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*214*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*215*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*216*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*217*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*218*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*219*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*220*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*221*/	r5.y = -r0.w + 1.000000;
/*222*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*223*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*224*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*225*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*226*/	  r5.y = max(r5.y, 0.000000);
/*227*/	  r5.y = log2(r5.y);
/*228*/	  r5.y = r5.y * 10.000000;
/*229*/	  r5.y = exp2(r5.y);
/*230*/	  r5.y = r4.w * r5.y;
/*231*/	  r5.y = r5.y * r5.w + r0.w;
/*232*/	  r7.x = r1.w * 8.000000;
/*233*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*234*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*235*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*236*/	}
/*237*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*238*/	r7.x = max(r5.y, 0.000000);
/*239*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*240*/	if(floatBitsToUint(r5.y) != 0u) {
/*241*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*242*/	  r4.x = max(r4.x, -1.000000);
/*243*/	  r4.x = min(r4.x, 1.000000);
/*244*/	  r4.y = -abs(r4.x) + 1.000000;
/*245*/	  r4.y = sqrt(r4.y);
/*246*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*247*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*248*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*249*/	  r5.y = r4.y * r4.z;
/*250*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*251*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*252*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*253*/	  r4.x = r4.z * r4.y + r4.x;
/*254*/	  r3.x = r3.x * r3.x;
/*255*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*256*/	  r2.w = r3.x * r2.w + r5.x;
/*257*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*258*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*259*/	  r3.x = -r2.w * r2.w + 1.000000;
/*260*/	  r3.x = max(r3.x, 0.001000);
/*261*/	  r3.x = log2(r3.x);
/*262*/	  r4.y = r3.x * 4.950617;
/*263*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*264*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*265*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*266*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*267*/	  r2.w = floatBitsToInt(r2.w);
/*268*/	  r4.y = r3.x * r3.x + -r4.y;
/*269*/	  r4.y = sqrt(r4.y);
/*270*/	  r3.x = -r3.x + r4.y;
/*271*/	  r3.x = max(r3.x, 0.000000);
/*272*/	  r3.x = sqrt(r3.x);
/*273*/	  r2.w = r2.w * r3.x;
/*274*/	  r2.w = r2.w * 1.414214;
/*275*/	  r2.w = 0.008727 / r2.w;
/*276*/	  r2.w = max(r2.w, 0.000100);
/*277*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*278*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*279*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*280*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*281*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*282*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*283*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*284*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*285*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*286*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*287*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*288*/	  r2.w = floatBitsToInt(r2.w);
/*289*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*290*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*291*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*292*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*293*/	  r2.w = r2.w * r4.x + 1.000000;
/*294*/	  r2.w = r2.w * 0.500000;
/*295*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*296*/	  r3.x = r3.x * r4.y + 1.000000;
/*297*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*298*/	  r3.x = min(r7.x, 1.000000);
/*299*/	  r1.w = r1.w * 1.570796;
/*300*/	  r1.w = sin(r1.w);
/*301*/	  r3.x = r3.x + -1.000000;
/*302*/	  r1.w = r1.w * r3.x + 1.000000;
/*303*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*304*/	  r3.x = max(r3.x, 0.000000);
/*305*/	  r3.x = log2(r3.x);
/*306*/	  r3.x = r3.x * 10.000000;
/*307*/	  r3.x = exp2(r3.x);
/*308*/	  r3.x = r4.w * r3.x;
/*309*/	  r3.x = r3.x * r5.w + r0.w;
/*310*/	  r1.w = r1.w * abs(r2.w);
/*311*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*312*/	} else {
/*313*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*314*/	}
/*315*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*316*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*317*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*318*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*319*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*320*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*321*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*322*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*323*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*324*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*325*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*326*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*327*/	r1.w = inversesqrt(r1.w);
/*328*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*329*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*330*/	r1.w = r1.w + r1.w;
/*331*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*332*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*333*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*334*/	r0.x = max(r0.x, 0.000000);
/*335*/	r0.x = log2(r0.x);
/*336*/	r0.x = r0.x * 10.000000;
/*337*/	r0.x = exp2(r0.x);
/*338*/	r0.x = r4.w * r0.x;
/*339*/	r0.x = r0.x * r5.w + r0.w;
/*340*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*341*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*342*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*343*/	r0.w = 1.000000;
/*344*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*345*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*346*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*347*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*348*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*349*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*350*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*351*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*352*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*353*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*354*/	if(r0.x != 0) discard;
/*355*/	color1.x = 1.000000;
/*356*/	return;
}
