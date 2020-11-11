//
//
// Shader Model 4
// Fragment Shader
//
// id: 1202 - fxc/glsl_SM_4_0_rigidwithdirtmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*24*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.yyyz).zw;
/*25*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*26*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*27*/	r1.w = r4.w * r5.w;
/*28*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*29*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*30*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*31*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*32*/	r2.w = inversesqrt(r2.w);
/*33*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*34*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*35*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*36*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*37*/	r1.w = inversesqrt(r1.w);
/*38*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*39*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*42*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*43*/	r1.w = inversesqrt(r1.w);
/*44*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*45*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*46*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*47*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*48*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*51*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*52*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*53*/	if(floatBitsToUint(r0.w) != 0u) {
/*54*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*55*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*56*/	  r0.w = r3.w * cb0.data[26].x;
/*57*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*58*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*59*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*60*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*61*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*62*/	}
/*63*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*64*/	if(floatBitsToUint(r0.w) != 0u) {
/*65*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*66*/	  if(floatBitsToUint(r0.w) != 0u) {
/*67*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*68*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*69*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*70*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*71*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*72*/	    r0.w = -r0.w + 1.000000;
/*73*/	    r0.w = max(r0.w, 0.000000);
/*74*/	    r8.z = sqrt(r0.w);
/*75*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*76*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*77*/	    r0.w = inversesqrt(r0.w);
/*78*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*79*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*80*/	    r10.y = -1.000000;
/*81*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*82*/	    r0.w = inversesqrt(r0.w);
/*83*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*84*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*85*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*86*/	    r1.w = r1.w * 1.250000;
/*87*/	    r1.w = min(r1.w, 1.000000);
/*88*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*89*/	    r2.w = r2.w * 4.000000;
/*90*/	    r1.w = r1.w * 0.200000 + r2.w;
/*91*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*92*/	    r0.w = r0.w + -r1.w;
/*93*/	    r0.w = saturate(r0.w * 200.000000);
/*94*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*95*/	    r0.w = r0.w * r0.w;
/*96*/	    r0.w = r0.w * r1.w;
/*97*/	    r3.x = r0.w * -r3.x + r3.x;
/*98*/	    r1.w = -r3.y + 0.200000;
/*99*/	    r3.y = r0.w * r1.w + r3.y;
/*100*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*101*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*102*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*103*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*104*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*105*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*106*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*107*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*108*/	    r1.w = -r1.w + 1.000000;
/*109*/	    r1.w = max(r1.w, 0.000000);
/*110*/	    r7.z = sqrt(r1.w);
/*111*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*112*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*113*/	    r1.w = sqrt(r1.w);
/*114*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*115*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*116*/	    r1.w = inversesqrt(r1.w);
/*117*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*118*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*119*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*120*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*121*/	    r1.w = -r0.y + 1.000000;
/*122*/	    r0.w = min(r0.w, r1.w);
/*123*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*124*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*125*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*126*/	    r0.w = inversesqrt(r0.w);
/*127*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*128*/	  }
/*129*/	}
/*130*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*131*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*132*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*133*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*134*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*135*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*136*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*137*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*138*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*139*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*140*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*141*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*142*/	r1.w = inversesqrt(r1.w);
/*143*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*144*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*145*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*146*/	r1.w = inversesqrt(r1.w);
/*147*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*148*/	r1.w = -r3.x + 1.000000;
/*149*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*150*/	r4.x = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*151*/	r4.x = r4.x + r4.x;
/*152*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*153*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*154*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*155*/	r4.w = cos((r6.x));
/*156*/	r4.w = inversesqrt(r4.w);
/*157*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*158*/	r5.w = saturate(r0.w * 60.000000);
/*159*/	r5.w = -r0.w + r5.w;
/*160*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*161*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*162*/	r7.x = inversesqrt(r7.x);
/*163*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*164*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*165*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*166*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*167*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*168*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*169*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*170*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*171*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*172*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*173*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*174*/	r5.y = -r0.w + 1.000000;
/*175*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*176*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*177*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*178*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*179*/	  r5.y = max(r5.y, 0.000000);
/*180*/	  r5.y = log2(r5.y);
/*181*/	  r5.y = r5.y * 10.000000;
/*182*/	  r5.y = exp2(r5.y);
/*183*/	  r5.y = r4.w * r5.y;
/*184*/	  r5.y = r5.y * r5.w + r0.w;
/*185*/	  r7.x = r1.w * 8.000000;
/*186*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*187*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*188*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*189*/	}
/*190*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*191*/	r7.x = max(r5.y, 0.000000);
/*192*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*193*/	if(floatBitsToUint(r5.y) != 0u) {
/*194*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*195*/	  r4.x = max(r4.x, -1.000000);
/*196*/	  r4.x = min(r4.x, 1.000000);
/*197*/	  r4.y = -abs(r4.x) + 1.000000;
/*198*/	  r4.y = sqrt(r4.y);
/*199*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*200*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*201*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*202*/	  r5.y = r4.y * r4.z;
/*203*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*204*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*205*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*206*/	  r4.x = r4.z * r4.y + r4.x;
/*207*/	  r3.x = r3.x * r3.x;
/*208*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*209*/	  r2.w = r3.x * r2.w + r5.x;
/*210*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*211*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*212*/	  r3.x = -r2.w * r2.w + 1.000000;
/*213*/	  r3.x = max(r3.x, 0.001000);
/*214*/	  r3.x = log2(r3.x);
/*215*/	  r4.y = r3.x * 4.950617;
/*216*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*217*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*218*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*219*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*220*/	  r2.w = floatBitsToInt(r2.w);
/*221*/	  r4.y = r3.x * r3.x + -r4.y;
/*222*/	  r4.y = sqrt(r4.y);
/*223*/	  r3.x = -r3.x + r4.y;
/*224*/	  r3.x = max(r3.x, 0.000000);
/*225*/	  r3.x = sqrt(r3.x);
/*226*/	  r2.w = r2.w * r3.x;
/*227*/	  r2.w = r2.w * 1.414214;
/*228*/	  r2.w = 0.008727 / r2.w;
/*229*/	  r2.w = max(r2.w, 0.000100);
/*230*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*231*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*232*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*233*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*234*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*235*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*236*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*237*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*238*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*239*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*240*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*241*/	  r2.w = floatBitsToInt(r2.w);
/*242*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*243*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*244*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*245*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*246*/	  r2.w = r2.w * r4.x + 1.000000;
/*247*/	  r2.w = r2.w * 0.500000;
/*248*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*249*/	  r3.x = r3.x * r4.y + 1.000000;
/*250*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*251*/	  r3.x = min(r7.x, 1.000000);
/*252*/	  r1.w = r1.w * 1.570796;
/*253*/	  r1.w = sin(r1.w);
/*254*/	  r3.x = r3.x + -1.000000;
/*255*/	  r1.w = r1.w * r3.x + 1.000000;
/*256*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*257*/	  r3.x = max(r3.x, 0.000000);
/*258*/	  r3.x = log2(r3.x);
/*259*/	  r3.x = r3.x * 10.000000;
/*260*/	  r3.x = exp2(r3.x);
/*261*/	  r3.x = r4.w * r3.x;
/*262*/	  r3.x = r3.x * r5.w + r0.w;
/*263*/	  r1.w = r1.w * abs(r2.w);
/*264*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*265*/	} else {
/*266*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*267*/	}
/*268*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*269*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*270*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*271*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*272*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*273*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*274*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*275*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*276*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*277*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*278*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*279*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*280*/	r1.w = inversesqrt(r1.w);
/*281*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*282*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*283*/	r1.w = r1.w + r1.w;
/*284*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*285*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*286*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*287*/	r0.x = max(r0.x, 0.000000);
/*288*/	r0.x = log2(r0.x);
/*289*/	r0.x = r0.x * 10.000000;
/*290*/	r0.x = exp2(r0.x);
/*291*/	r0.x = r4.w * r0.x;
/*292*/	r0.x = r0.x * r5.w + r0.w;
/*293*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*294*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*295*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*296*/	r0.w = 1.000000;
/*297*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*298*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*299*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*300*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*301*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*302*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*303*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*304*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*305*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*306*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*307*/	if(r0.x != 0) discard;
/*308*/	color1.x = 1.000000;
/*309*/	return;
}
