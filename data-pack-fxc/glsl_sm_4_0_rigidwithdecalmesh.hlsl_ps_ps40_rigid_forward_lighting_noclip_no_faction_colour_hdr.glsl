//
//
// Shader Model 4
// Fragment Shader
//
// id: 1102 - fxc/glsl_SM_4_0_rigidwithdecalmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*39*/	  r1.w = r3.x * r7.w;
/*40*/	  r3.x = r1.w * -0.500000 + r3.x;
/*41*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*42*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*43*/	  r1.w = -r5.w * r6.w + 1.000000;
/*44*/	  r1.xyz = (r1.wwww * r1.xyzx + r7.xyzx).xyz;
/*45*/	  r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*46*/	  r0.xyw = (r7.wwww * r4.xyxz + r0.xyxw).xyw;
/*47*/	}
/*48*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*51*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*54*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*55*/	r1.w = inversesqrt(r1.w);
/*56*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*57*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*58*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*59*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*60*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*61*/	r1.w = inversesqrt(r1.w);
/*62*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*63*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*64*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*65*/	if(floatBitsToUint(r0.w) != 0u) {
/*66*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*67*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*68*/	  r0.w = r3.w * cb0.data[26].x;
/*69*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*70*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*71*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*72*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*73*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*74*/	}
/*75*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*76*/	if(floatBitsToUint(r0.w) != 0u) {
/*77*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*78*/	  if(floatBitsToUint(r0.w) != 0u) {
/*79*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*80*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*81*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*82*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*83*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*84*/	    r0.w = -r0.w + 1.000000;
/*85*/	    r0.w = max(r0.w, 0.000000);
/*86*/	    r8.z = sqrt(r0.w);
/*87*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*88*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*89*/	    r0.w = inversesqrt(r0.w);
/*90*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*91*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*92*/	    r10.y = -1.000000;
/*93*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*94*/	    r0.w = inversesqrt(r0.w);
/*95*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*96*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*97*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*98*/	    r1.w = r1.w * 1.250000;
/*99*/	    r1.w = min(r1.w, 1.000000);
/*100*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*101*/	    r2.w = r2.w * 4.000000;
/*102*/	    r1.w = r1.w * 0.200000 + r2.w;
/*103*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*104*/	    r0.w = r0.w + -r1.w;
/*105*/	    r0.w = saturate(r0.w * 200.000000);
/*106*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*107*/	    r0.w = r0.w * r0.w;
/*108*/	    r0.w = r0.w * r1.w;
/*109*/	    r3.y = r0.w * -r3.y + r3.y;
/*110*/	    r1.w = -r3.x + 0.200000;
/*111*/	    r3.x = r0.w * r1.w + r3.x;
/*112*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*113*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*114*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*115*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*116*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*117*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*118*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*119*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*120*/	    r1.w = -r1.w + 1.000000;
/*121*/	    r1.w = max(r1.w, 0.000000);
/*122*/	    r7.z = sqrt(r1.w);
/*123*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*124*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*125*/	    r1.w = sqrt(r1.w);
/*126*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*127*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*128*/	    r1.w = inversesqrt(r1.w);
/*129*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*130*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*131*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*132*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*133*/	    r1.w = -r0.y + 1.000000;
/*134*/	    r0.w = min(r0.w, r1.w);
/*135*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*136*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*137*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*138*/	    r0.w = inversesqrt(r0.w);
/*139*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*140*/	  }
/*141*/	}
/*142*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*143*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*144*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*145*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*146*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*147*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*148*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*149*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*150*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*151*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*152*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*153*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*154*/	r1.w = inversesqrt(r1.w);
/*155*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*156*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*157*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*158*/	r1.w = inversesqrt(r1.w);
/*159*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*160*/	r1.w = -r3.y + 1.000000;
/*161*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*162*/	r4.x = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*163*/	r4.x = r4.x + r4.x;
/*164*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*165*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*166*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*167*/	r4.w = cos((r6.x));
/*168*/	r4.w = inversesqrt(r4.w);
/*169*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*170*/	r5.w = saturate(r0.w * 60.000000);
/*171*/	r5.w = -r0.w + r5.w;
/*172*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*173*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*174*/	r7.x = inversesqrt(r7.x);
/*175*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*176*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*177*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*178*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*179*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*180*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*181*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*182*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*183*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*184*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*185*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*186*/	r5.y = -r0.w + 1.000000;
/*187*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*188*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*189*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*190*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*191*/	  r5.y = max(r5.y, 0.000000);
/*192*/	  r5.y = log2(r5.y);
/*193*/	  r5.y = r5.y * 10.000000;
/*194*/	  r5.y = exp2(r5.y);
/*195*/	  r5.y = r4.w * r5.y;
/*196*/	  r5.y = r5.y * r5.w + r0.w;
/*197*/	  r7.x = r1.w * 8.000000;
/*198*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*199*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*200*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*201*/	}
/*202*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*203*/	r7.x = max(r5.y, 0.000000);
/*204*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*205*/	if(floatBitsToUint(r5.y) != 0u) {
/*206*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*207*/	  r4.x = max(r4.x, -1.000000);
/*208*/	  r4.x = min(r4.x, 1.000000);
/*209*/	  r4.y = -abs(r4.x) + 1.000000;
/*210*/	  r4.y = sqrt(r4.y);
/*211*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*212*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*213*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*214*/	  r5.y = r4.y * r4.z;
/*215*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*216*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*217*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*218*/	  r4.x = r4.z * r4.y + r4.x;
/*219*/	  r3.y = r3.y * r3.y;
/*220*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*221*/	  r2.w = r3.y * r2.w + r5.x;
/*222*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*223*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*224*/	  r3.y = -r2.w * r2.w + 1.000000;
/*225*/	  r3.y = max(r3.y, 0.001000);
/*226*/	  r3.y = log2(r3.y);
/*227*/	  r4.y = r3.y * 4.950617;
/*228*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*229*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*230*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*231*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*232*/	  r2.w = floatBitsToInt(r2.w);
/*233*/	  r4.y = r3.y * r3.y + -r4.y;
/*234*/	  r4.y = sqrt(r4.y);
/*235*/	  r3.y = -r3.y + r4.y;
/*236*/	  r3.y = max(r3.y, 0.000000);
/*237*/	  r3.y = sqrt(r3.y);
/*238*/	  r2.w = r2.w * r3.y;
/*239*/	  r2.w = r2.w * 1.414214;
/*240*/	  r2.w = 0.008727 / r2.w;
/*241*/	  r2.w = max(r2.w, 0.000100);
/*242*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*243*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*244*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*245*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*246*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*247*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*248*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*249*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*250*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*251*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*252*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*253*/	  r2.w = floatBitsToInt(r2.w);
/*254*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*255*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*256*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*257*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*258*/	  r2.w = r2.w * r4.x + 1.000000;
/*259*/	  r2.w = r2.w * 0.500000;
/*260*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*261*/	  r3.y = r3.y * r4.y + 1.000000;
/*262*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*263*/	  r3.y = min(r7.x, 1.000000);
/*264*/	  r1.w = r1.w * 1.570796;
/*265*/	  r1.w = sin(r1.w);
/*266*/	  r3.y = r3.y + -1.000000;
/*267*/	  r1.w = r1.w * r3.y + 1.000000;
/*268*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*269*/	  r3.x = max(r3.x, 0.000000);
/*270*/	  r3.x = log2(r3.x);
/*271*/	  r3.x = r3.x * 10.000000;
/*272*/	  r3.x = exp2(r3.x);
/*273*/	  r3.x = r4.w * r3.x;
/*274*/	  r3.x = r3.x * r5.w + r0.w;
/*275*/	  r1.w = r1.w * abs(r2.w);
/*276*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*277*/	} else {
/*278*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*279*/	}
/*280*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*281*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*282*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*283*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*284*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*285*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*286*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*287*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*288*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*289*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*290*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*291*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*292*/	r1.w = inversesqrt(r1.w);
/*293*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*294*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*295*/	r1.w = r1.w + r1.w;
/*296*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*297*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*298*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*299*/	r0.x = max(r0.x, 0.000000);
/*300*/	r0.x = log2(r0.x);
/*301*/	r0.x = r0.x * 10.000000;
/*302*/	r0.x = exp2(r0.x);
/*303*/	r0.x = r4.w * r0.x;
/*304*/	r0.x = r0.x * r5.w + r0.w;
/*305*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*306*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*307*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*308*/	r0.w = 1.000000;
/*309*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*310*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*311*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*312*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*313*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*314*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*315*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*316*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*317*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*318*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*319*/	if(r0.x != 0) discard;
/*320*/	color1.x = 1.000000;
/*321*/	return;
}
