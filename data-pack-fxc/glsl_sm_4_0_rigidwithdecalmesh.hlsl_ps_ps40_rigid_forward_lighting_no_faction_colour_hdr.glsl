//
//
// Shader Model 4
// Fragment Shader
//
// id: 1100 - fxc/glsl_SM_4_0_rigidwithdecalmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

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
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*24*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*25*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*26*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*27*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*28*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*29*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*30*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*31*/	r4.z = vsOut_T6.x;
/*32*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*33*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*34*/	if(floatBitsToUint(r1.w) != 0u) {
/*35*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*36*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*37*/	  r1.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*38*/	  r1.w = -r1.w + 1.000000;
/*39*/	  r1.w = max(r1.w, 0.000000);
/*40*/	  r4.z = sqrt(r1.w);
/*41*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*42*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*43*/	  r1.w = r3.x * r7.w;
/*44*/	  r3.x = r1.w * -0.500000 + r3.x;
/*45*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*46*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*47*/	  r1.w = -r5.w * r6.w + 1.000000;
/*48*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*49*/	  r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*50*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*51*/	}
/*52*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*53*/	r1.w = inversesqrt(r1.w);
/*54*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*55*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*58*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*61*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*62*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*63*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*64*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*67*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*68*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*69*/	if(floatBitsToUint(r0.w) != 0u) {
/*70*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*71*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*72*/	  r0.w = r3.w * cb0.data[26].x;
/*73*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*74*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*75*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*76*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*77*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*78*/	}
/*79*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*80*/	if(floatBitsToUint(r0.w) != 0u) {
/*81*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*82*/	  if(floatBitsToUint(r0.w) != 0u) {
/*83*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*84*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*85*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*86*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*87*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*88*/	    r0.w = -r0.w + 1.000000;
/*89*/	    r0.w = max(r0.w, 0.000000);
/*90*/	    r8.z = sqrt(r0.w);
/*91*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*92*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*93*/	    r0.w = inversesqrt(r0.w);
/*94*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*95*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*96*/	    r10.y = -1.000000;
/*97*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*98*/	    r0.w = inversesqrt(r0.w);
/*99*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*100*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*101*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*102*/	    r1.w = r1.w * 1.250000;
/*103*/	    r1.w = min(r1.w, 1.000000);
/*104*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*105*/	    r2.w = r2.w * 4.000000;
/*106*/	    r1.w = r1.w * 0.200000 + r2.w;
/*107*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*108*/	    r0.w = r0.w + -r1.w;
/*109*/	    r0.w = saturate(r0.w * 200.000000);
/*110*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*111*/	    r0.w = r0.w * r0.w;
/*112*/	    r0.w = r0.w * r1.w;
/*113*/	    r3.y = r0.w * -r3.y + r3.y;
/*114*/	    r1.w = -r3.x + 0.200000;
/*115*/	    r3.x = r0.w * r1.w + r3.x;
/*116*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*117*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*118*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*119*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*120*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*121*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*122*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*123*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*124*/	    r1.w = -r1.w + 1.000000;
/*125*/	    r1.w = max(r1.w, 0.000000);
/*126*/	    r7.z = sqrt(r1.w);
/*127*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*128*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*129*/	    r1.w = sqrt(r1.w);
/*130*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*131*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*132*/	    r1.w = inversesqrt(r1.w);
/*133*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*134*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*135*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*136*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*137*/	    r1.w = -r0.y + 1.000000;
/*138*/	    r0.w = min(r0.w, r1.w);
/*139*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*140*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*141*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*142*/	    r0.w = inversesqrt(r0.w);
/*143*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*144*/	  }
/*145*/	}
/*146*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*147*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*148*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*149*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*150*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*151*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*152*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*153*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*154*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*155*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*156*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*157*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*158*/	r1.w = inversesqrt(r1.w);
/*159*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*160*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*161*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*162*/	r1.w = inversesqrt(r1.w);
/*163*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*164*/	r1.w = -r3.y + 1.000000;
/*165*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*166*/	r4.x = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*167*/	r4.x = r4.x + r4.x;
/*168*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*169*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*170*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*171*/	r4.w = cos((r6.x));
/*172*/	r4.w = inversesqrt(r4.w);
/*173*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*174*/	r5.w = saturate(r0.w * 60.000000);
/*175*/	r5.w = -r0.w + r5.w;
/*176*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*177*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*178*/	r7.x = inversesqrt(r7.x);
/*179*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*180*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*181*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*182*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*183*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*184*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*185*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*186*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*187*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*188*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*189*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*190*/	r5.y = -r0.w + 1.000000;
/*191*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*192*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*193*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*194*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*195*/	  r5.y = max(r5.y, 0.000000);
/*196*/	  r5.y = log2(r5.y);
/*197*/	  r5.y = r5.y * 10.000000;
/*198*/	  r5.y = exp2(r5.y);
/*199*/	  r5.y = r4.w * r5.y;
/*200*/	  r5.y = r5.y * r5.w + r0.w;
/*201*/	  r7.x = r1.w * 8.000000;
/*202*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*203*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*204*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*205*/	}
/*206*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*207*/	r7.x = max(r5.y, 0.000000);
/*208*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*209*/	if(floatBitsToUint(r5.y) != 0u) {
/*210*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*211*/	  r4.x = max(r4.x, -1.000000);
/*212*/	  r4.x = min(r4.x, 1.000000);
/*213*/	  r4.y = -abs(r4.x) + 1.000000;
/*214*/	  r4.y = sqrt(r4.y);
/*215*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*216*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*217*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*218*/	  r5.y = r4.y * r4.z;
/*219*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*220*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*221*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*222*/	  r4.x = r4.z * r4.y + r4.x;
/*223*/	  r3.y = r3.y * r3.y;
/*224*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*225*/	  r2.w = r3.y * r2.w + r5.x;
/*226*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*227*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*228*/	  r3.y = -r2.w * r2.w + 1.000000;
/*229*/	  r3.y = max(r3.y, 0.001000);
/*230*/	  r3.y = log2(r3.y);
/*231*/	  r4.y = r3.y * 4.950617;
/*232*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*233*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*234*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*235*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*236*/	  r2.w = floatBitsToInt(r2.w);
/*237*/	  r4.y = r3.y * r3.y + -r4.y;
/*238*/	  r4.y = sqrt(r4.y);
/*239*/	  r3.y = -r3.y + r4.y;
/*240*/	  r3.y = max(r3.y, 0.000000);
/*241*/	  r3.y = sqrt(r3.y);
/*242*/	  r2.w = r2.w * r3.y;
/*243*/	  r2.w = r2.w * 1.414214;
/*244*/	  r2.w = 0.008727 / r2.w;
/*245*/	  r2.w = max(r2.w, 0.000100);
/*246*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*247*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*248*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*249*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*250*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*251*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*252*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*253*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*254*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*255*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*256*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*257*/	  r2.w = floatBitsToInt(r2.w);
/*258*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*259*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*260*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*261*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*262*/	  r2.w = r2.w * r4.x + 1.000000;
/*263*/	  r2.w = r2.w * 0.500000;
/*264*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*265*/	  r3.y = r3.y * r4.y + 1.000000;
/*266*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*267*/	  r3.y = min(r7.x, 1.000000);
/*268*/	  r1.w = r1.w * 1.570796;
/*269*/	  r1.w = sin(r1.w);
/*270*/	  r3.y = r3.y + -1.000000;
/*271*/	  r1.w = r1.w * r3.y + 1.000000;
/*272*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*273*/	  r3.x = max(r3.x, 0.000000);
/*274*/	  r3.x = log2(r3.x);
/*275*/	  r3.x = r3.x * 10.000000;
/*276*/	  r3.x = exp2(r3.x);
/*277*/	  r3.x = r4.w * r3.x;
/*278*/	  r3.x = r3.x * r5.w + r0.w;
/*279*/	  r1.w = r1.w * abs(r2.w);
/*280*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*281*/	} else {
/*282*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*283*/	}
/*284*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*285*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*286*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*287*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*288*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*289*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*290*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*291*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*292*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*293*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*294*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*295*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*296*/	r1.w = inversesqrt(r1.w);
/*297*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*298*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*299*/	r1.w = r1.w + r1.w;
/*300*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*301*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*302*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*303*/	r0.x = max(r0.x, 0.000000);
/*304*/	r0.x = log2(r0.x);
/*305*/	r0.x = r0.x * 10.000000;
/*306*/	r0.x = exp2(r0.x);
/*307*/	r0.x = r4.w * r0.x;
/*308*/	r0.x = r0.x * r5.w + r0.w;
/*309*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*310*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*311*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*312*/	r0.w = 1.000000;
/*313*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*314*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*315*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*316*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*317*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*318*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*319*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*320*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*321*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*322*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*323*/	if(r0.x != 0) discard;
/*324*/	color1.x = 1.000000;
/*325*/	return;
}
