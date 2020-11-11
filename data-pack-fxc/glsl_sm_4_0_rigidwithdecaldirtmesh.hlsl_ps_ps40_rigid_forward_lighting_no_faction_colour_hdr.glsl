//
//
// Shader Model 4
// Fragment Shader
//
// id: 937 - fxc/glsl_SM_4_0_rigidwithdecaldirtmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
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
/*52*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*53*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.yyyz).zw;
/*54*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*55*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*56*/	r1.w = r4.w * r5.w;
/*57*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*58*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*59*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*60*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*61*/	r2.w = inversesqrt(r2.w);
/*62*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*63*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*64*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*65*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*68*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*71*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*74*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*75*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*76*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*77*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*78*/	r1.w = inversesqrt(r1.w);
/*79*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*80*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*81*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*82*/	if(floatBitsToUint(r0.w) != 0u) {
/*83*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*84*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*85*/	  r0.w = r3.w * cb0.data[26].x;
/*86*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*87*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*88*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*89*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*90*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*91*/	}
/*92*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*93*/	if(floatBitsToUint(r0.w) != 0u) {
/*94*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*95*/	  if(floatBitsToUint(r0.w) != 0u) {
/*96*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*97*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*98*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*99*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*100*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*101*/	    r0.w = -r0.w + 1.000000;
/*102*/	    r0.w = max(r0.w, 0.000000);
/*103*/	    r8.z = sqrt(r0.w);
/*104*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*105*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*106*/	    r0.w = inversesqrt(r0.w);
/*107*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*108*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*109*/	    r10.y = -1.000000;
/*110*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*111*/	    r0.w = inversesqrt(r0.w);
/*112*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*113*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*114*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*115*/	    r1.w = r1.w * 1.250000;
/*116*/	    r1.w = min(r1.w, 1.000000);
/*117*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*118*/	    r2.w = r2.w * 4.000000;
/*119*/	    r1.w = r1.w * 0.200000 + r2.w;
/*120*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*121*/	    r0.w = r0.w + -r1.w;
/*122*/	    r0.w = saturate(r0.w * 200.000000);
/*123*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*124*/	    r0.w = r0.w * r0.w;
/*125*/	    r0.w = r0.w * r1.w;
/*126*/	    r3.y = r0.w * -r3.y + r3.y;
/*127*/	    r1.w = -r3.x + 0.200000;
/*128*/	    r3.x = r0.w * r1.w + r3.x;
/*129*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*130*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*131*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*132*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*133*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*134*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*135*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*136*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*137*/	    r1.w = -r1.w + 1.000000;
/*138*/	    r1.w = max(r1.w, 0.000000);
/*139*/	    r7.z = sqrt(r1.w);
/*140*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*141*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*142*/	    r1.w = sqrt(r1.w);
/*143*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*144*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*145*/	    r1.w = inversesqrt(r1.w);
/*146*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*147*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*148*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*149*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*150*/	    r1.w = -r0.y + 1.000000;
/*151*/	    r0.w = min(r0.w, r1.w);
/*152*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*153*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*154*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*155*/	    r0.w = inversesqrt(r0.w);
/*156*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*157*/	  }
/*158*/	}
/*159*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*160*/	r3.xzw = (r1.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*161*/	r3.xzw = (-r1.xxyz + r3.xxzw).xzw;
/*162*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*163*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*164*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*165*/	r1.xyz = (vsOut_T7.zzzz * r3.xzwx + r1.xyzx).xyz;
/*166*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*167*/	r3.xzw = (-r2.xxyz + r1.wwww).xzw;
/*168*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*169*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*170*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*171*/	r1.w = inversesqrt(r1.w);
/*172*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*173*/	r3.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*174*/	r1.w = dot(vec3(r3.xzwx), vec3(r3.xzwx));
/*175*/	r1.w = inversesqrt(r1.w);
/*176*/	r3.xzw = (r1.wwww * r3.xxzw).xzw;
/*177*/	r1.w = -r3.y + 1.000000;
/*178*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*179*/	r4.x = dot(vec3(r3.xzwx), vec3(r0.xyzx));
/*180*/	r4.x = r4.x + r4.x;
/*181*/	r4.xyz = (r0.xyzx * -r4.xxxx + r3.xzwx).xyz;
/*182*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*183*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*184*/	r4.w = cos((r6.x));
/*185*/	r4.w = inversesqrt(r4.w);
/*186*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*187*/	r5.w = saturate(r0.w * 60.000000);
/*188*/	r5.w = -r0.w + r5.w;
/*189*/	r6.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*190*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*191*/	r7.x = inversesqrt(r7.x);
/*192*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*193*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*194*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*195*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*196*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*197*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*198*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*199*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*200*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*201*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*202*/	r6.xzw = (r1.xxyz * r6.xxzw).xzw;
/*203*/	r5.y = -r0.w + 1.000000;
/*204*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*205*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*206*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*207*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.xzwx));
/*208*/	  r5.y = max(r5.y, 0.000000);
/*209*/	  r5.y = log2(r5.y);
/*210*/	  r5.y = r5.y * 10.000000;
/*211*/	  r5.y = exp2(r5.y);
/*212*/	  r5.y = r4.w * r5.y;
/*213*/	  r5.y = r5.y * r5.w + r0.w;
/*214*/	  r7.x = r1.w * 8.000000;
/*215*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*216*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*217*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*218*/	}
/*219*/	r5.y = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*220*/	r7.x = max(r5.y, 0.000000);
/*221*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*222*/	if(floatBitsToUint(r5.y) != 0u) {
/*223*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*224*/	  r4.x = max(r4.x, -1.000000);
/*225*/	  r4.x = min(r4.x, 1.000000);
/*226*/	  r4.y = -abs(r4.x) + 1.000000;
/*227*/	  r4.y = sqrt(r4.y);
/*228*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*229*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*230*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*231*/	  r5.y = r4.y * r4.z;
/*232*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*233*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*234*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*235*/	  r4.x = r4.z * r4.y + r4.x;
/*236*/	  r3.y = r3.y * r3.y;
/*237*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*238*/	  r2.w = r3.y * r2.w + r5.x;
/*239*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*240*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*241*/	  r3.y = -r2.w * r2.w + 1.000000;
/*242*/	  r3.y = max(r3.y, 0.001000);
/*243*/	  r3.y = log2(r3.y);
/*244*/	  r4.y = r3.y * 4.950617;
/*245*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*246*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*247*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*248*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*249*/	  r2.w = floatBitsToInt(r2.w);
/*250*/	  r4.y = r3.y * r3.y + -r4.y;
/*251*/	  r4.y = sqrt(r4.y);
/*252*/	  r3.y = -r3.y + r4.y;
/*253*/	  r3.y = max(r3.y, 0.000000);
/*254*/	  r3.y = sqrt(r3.y);
/*255*/	  r2.w = r2.w * r3.y;
/*256*/	  r2.w = r2.w * 1.414214;
/*257*/	  r2.w = 0.008727 / r2.w;
/*258*/	  r2.w = max(r2.w, 0.000100);
/*259*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*260*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*261*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*262*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*263*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*264*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*265*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*266*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*267*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*268*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*269*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*270*/	  r2.w = floatBitsToInt(r2.w);
/*271*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*272*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*273*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*274*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*275*/	  r2.w = r2.w * r4.x + 1.000000;
/*276*/	  r2.w = r2.w * 0.500000;
/*277*/	  r3.y = 1 + ~floatBitsToInt(r4.z);
/*278*/	  r3.y = r3.y * r4.y + 1.000000;
/*279*/	  r2.w = r3.y * 0.500000 + -r2.w;
/*280*/	  r3.y = min(r7.x, 1.000000);
/*281*/	  r1.w = r1.w * 1.570796;
/*282*/	  r1.w = sin(r1.w);
/*283*/	  r3.y = r3.y + -1.000000;
/*284*/	  r1.w = r1.w * r3.y + 1.000000;
/*285*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*286*/	  r3.x = max(r3.x, 0.000000);
/*287*/	  r3.x = log2(r3.x);
/*288*/	  r3.x = r3.x * 10.000000;
/*289*/	  r3.x = exp2(r3.x);
/*290*/	  r3.x = r4.w * r3.x;
/*291*/	  r3.x = r3.x * r5.w + r0.w;
/*292*/	  r1.w = r1.w * abs(r2.w);
/*293*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*294*/	} else {
/*295*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*296*/	}
/*297*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*298*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*299*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*300*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*301*/	r1.xyz = (r1.xyzx * r7.xxxx).xyz;
/*302*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*303*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*304*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*305*/	r1.xyz = (r4.xyzx * cb1.data[1].xyzx + r1.xyzx).xyz;
/*306*/	r1.xyz = (r1.xyzx + r6.xzwx).xyz;
/*307*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*308*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*309*/	r1.w = inversesqrt(r1.w);
/*310*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*311*/	r1.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*312*/	r1.w = r1.w + r1.w;
/*313*/	r0.xyz = (r0.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*314*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r6.y)).xyzw;
/*315*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*316*/	r0.x = max(r0.x, 0.000000);
/*317*/	r0.x = log2(r0.x);
/*318*/	r0.x = r0.x * 10.000000;
/*319*/	r0.x = exp2(r0.x);
/*320*/	r0.x = r4.w * r0.x;
/*321*/	r0.x = r0.x * r5.w + r0.w;
/*322*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*323*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*324*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*325*/	r0.w = 1.000000;
/*326*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*327*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*328*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*329*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*330*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*331*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*332*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*333*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*334*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*335*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*336*/	if(r0.x != 0) discard;
/*337*/	color1.x = 1.000000;
/*338*/	return;
}
