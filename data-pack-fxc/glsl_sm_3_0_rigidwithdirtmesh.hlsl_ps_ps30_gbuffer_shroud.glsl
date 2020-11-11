//
//
// Shader Model 4
// Fragment Shader
//
// id: 1178 - fxc/glsl_SM_3_0_rigidwithdirtmesh.hlsl_PS_ps30_gbuffer_shroud.glsl
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
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_shroud;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
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
/*1*/	r0.y = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.zw = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb3.data[0].yyyz)) * 0xffffffffu)).zw;
/*4*/	if(floatBitsToUint(r0.z) != 0u) {
/*5*/	  r2.xy = (vsOut_C1.xyxx / vsOut_C1.zzzz).xy;
/*6*/	  r2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r2.xy = (r2.xyxx * cb0.data[27].xyxx).xy;
/*8*/	  r2.xy = (r2.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*9*/	  r2.xyzw = (texture(s_dissolve_map, r2.xyxx.st)).xyzw;
/*10*/	  r0.x = -r0.x * 0.001000 + 1.000000;
/*11*/	  r1.x = -r2.x * r0.x + r0.y;
/*12*/	} else {
/*13*/	  r0.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb3.data[0].x))) * 0xffffffffu)).x;
/*14*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*15*/	  r1.x = r0.x * r1.x;
/*16*/	}
/*17*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*19*/	r0.x = r1.w + -0.500000;
/*20*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	if(r0.x != 0) discard;
/*22*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*23*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*24*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*26*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*27*/	r2.w = saturate(vsOut_N0.w);
/*28*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*29*/	r5.xyz = (r2.wwww * r5.xyzx + cb4.data[0].xyzx).xyz;
/*30*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*31*/	r4.xyw = (r4.xyxw + -cb4.data[1].xyxz).xyw;
/*32*/	r4.xyw = (r2.wwww * r4.xyxw + cb4.data[1].xyxz).xyw;
/*33*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*34*/	r6.xyz = (r6.xyzx + -cb4.data[2].xyzx).xyz;
/*35*/	r6.xyz = (r2.wwww * r6.xyzx + cb4.data[2].xyzx).xyz;
/*36*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*38*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*39*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*40*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*41*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*42*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*44*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	r2.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*46*/	r2.w = -r2.w + 1.000000;
/*47*/	r2.w = max(r2.w, 0.000000);
/*48*/	r3.z = sqrt(r2.w);
/*49*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*50*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*51*/	r4.w = 1.000000;
/*52*/	r2.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*53*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*54*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*55*/	r4.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*56*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*57*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*58*/	r4.z = r4.w * r5.w;
/*59*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*60*/	r0.xyz = (r4.zzzz * r5.xyzx + r0.xyzx).xyz;
/*61*/	r3.xy = (r4.xyxx * r4.wwww + r3.xyxx).xy;
/*62*/	r4.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*63*/	r4.x = inversesqrt(r4.x);
/*64*/	r3.xyz = (r3.xyzx * r4.xxxx).xyz;
/*65*/	r4.xyz = (r2.xyzx * r4.zzzz).xyz;
/*66*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*67*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*68*/	r4.x = inversesqrt(r4.x);
/*69*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*70*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*71*/	r4.w = inversesqrt(r4.w);
/*72*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*73*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*74*/	r4.w = inversesqrt(r4.w);
/*75*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*76*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*77*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*78*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*79*/	r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*80*/	r4.w = inversesqrt(r4.w);
/*81*/	r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*82*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*83*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*84*/	if(floatBitsToUint(r0.w) != 0u) {
/*85*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*86*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*87*/	  r0.w = r7.y * cb0.data[26].x;
/*88*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*89*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*90*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*91*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*92*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*93*/	}
/*94*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*95*/	if(floatBitsToUint(r0.w) != 0u) {
/*96*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*97*/	  if(floatBitsToUint(r0.w) != 0u) {
/*98*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*99*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*100*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*101*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*102*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*103*/	    r0.w = -r0.w + 1.000000;
/*104*/	    r0.w = max(r0.w, 0.000000);
/*105*/	    r8.z = sqrt(r0.w);
/*106*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*107*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*108*/	    r0.w = inversesqrt(r0.w);
/*109*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*110*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*111*/	    r10.y = -1.000000;
/*112*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*115*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*116*/	    r4.w = cb2.data[1].x * cb2.data[1].x;
/*117*/	    r4.w = r4.w * 1.250000;
/*118*/	    r4.w = min(r4.w, 1.000000);
/*119*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*120*/	    r5.w = r5.w * 4.000000;
/*121*/	    r4.w = r4.w * 0.200000 + r5.w;
/*122*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*123*/	    r0.w = r0.w + -r4.w;
/*124*/	    r0.w = saturate(r0.w * 200.000000);
/*125*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*126*/	    r0.w = r0.w * r0.w;
/*127*/	    r0.w = r0.w * r4.w;
/*128*/	    r1.w = r0.w * -r1.w + r1.w;
/*129*/	    r4.w = -r1.x + 0.200000;
/*130*/	    r1.x = r0.w * r4.w + r1.x;
/*131*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*132*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*133*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*134*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*135*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*136*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*137*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*138*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*139*/	    r4.w = -r4.w + 1.000000;
/*140*/	    r4.w = max(r4.w, 0.000000);
/*141*/	    r7.z = sqrt(r4.w);
/*142*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*143*/	    r4.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*144*/	    r4.w = sqrt(r4.w);
/*145*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*146*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*147*/	    r4.w = inversesqrt(r4.w);
/*148*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*149*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*150*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*151*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*152*/	    r4.w = -r3.y + 1.000000;
/*153*/	    r0.w = min(r0.w, r4.w);
/*154*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*155*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*156*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*157*/	    r0.w = inversesqrt(r0.w);
/*158*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*159*/	  }
/*160*/	}
/*161*/	r0.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*162*/	if(floatBitsToUint(r0.w) != 0u) {
/*163*/	  r4.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*164*/	  r5.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*165*/	  r4.xyzw = r4.xyzw / r5.xyzw;
/*166*/	  r5.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*167*/	  r4.xyzw = r4.xyzw * r5.xyzw + cb1.data[4].xyxy;
/*168*/	  r5.xyzw = (textureLod(s_shroud, r4.zwzz.st, r4.w)).xyzw;
/*169*/	  r4.xyzw = r4.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*170*/	  r4.xyzw = saturate(r4.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*171*/	  r6.xyzw = r4.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*172*/	  r4.xyzw = r4.xyzw * r4.xyzw;
/*173*/	  r4.xyzw = r4.xyzw * r6.xyzw;
/*174*/	  r0.w = r5.x * r4.x;
/*175*/	  r0.w = r0.w * r4.y;
/*176*/	  r0.w = r4.z * -r0.w + r0.w;
/*177*/	  r0.w = r4.w * -r0.w + r0.w;
/*178*/	} else {
/*179*/	  r0.w = 1.000000;
/*180*/	}
/*181*/	r4.xy = (r0.wwww + vec4(-0.100000, -0.500000, 0.000000, 0.000000)).xy;
/*182*/	r0.w = saturate(r4.x * 2.500000);
/*183*/	r4.x = r0.w * -2.000000 + 3.000000;
/*184*/	r0.w = r0.w * r0.w;
/*185*/	r0.w = r0.w * r4.x;
/*186*/	r4.x = saturate(r4.y + r4.y);
/*187*/	r4.y = r4.x * -2.000000 + 3.000000;
/*188*/	r4.x = r4.x * r4.x;
/*189*/	r4.x = r4.x * r4.y;
/*190*/	r0.w = r0.w * 0.200000;
/*191*/	r4.yzw = saturate(r0.wwww * r0.xxyz).yzw;
/*192*/	r0.xyz = (r0.xyzx + -r4.yzwy).xyz;
/*193*/	r0.xyz = (r4.xxxx * r0.xyzx + r4.yzwy).xyz;
/*194*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*195*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*196*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*197*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*198*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*199*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*200*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*201*/	r4.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*202*/	r4.xyz = (-r2.xyzx + r4.xxxx).xyz;
/*203*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r2.xyzx).xyz;
/*204*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*205*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*206*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*207*/	r2.x = inversesqrt(r2.x);
/*208*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*209*/	color3.x = r2.w / r3.w;
/*210*/	r2.w = max(abs(r2.z), abs(r2.y));
/*211*/	r2.w = max(r2.w, abs(r2.x));
/*212*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*213*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*214*/	color0.xyzw = saturate(r1.xyzw);
/*215*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*216*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*217*/	color2.xyzw = saturate(r4.xyzw);
/*218*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*219*/	color4 = vsOut_P1;
/*220*/	return;
}
