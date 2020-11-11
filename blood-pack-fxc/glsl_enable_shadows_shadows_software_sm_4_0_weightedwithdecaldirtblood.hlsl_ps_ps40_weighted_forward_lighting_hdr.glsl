//
//
// Shader Model 4
// Fragment Shader
//
// id: 7085 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
  vec4 r11;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r2.z = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*33*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*34*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*35*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*36*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*37*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*38*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*39*/	r4.z = vsOut_T6.z;
/*40*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*41*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*42*/	if(floatBitsToUint(r0.w) != 0u) {
/*43*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*44*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*46*/	  r0.w = -r0.w + 1.000000;
/*47*/	  r0.w = max(r0.w, 0.000000);
/*48*/	  r4.z = sqrt(r0.w);
/*49*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*50*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*51*/	  r0.w = r3.x * r7.w;
/*52*/	  r3.x = r0.w * -0.500000 + r3.x;
/*53*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*54*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*55*/	  r0.w = -r5.w * r6.w + 1.000000;
/*56*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*57*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*58*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*59*/	}
/*60*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*62*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*63*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*64*/	r0.w = r4.w * r5.w;
/*65*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*66*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*67*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*68*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*71*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*72*/	if(r1.w != 0) discard;
/*73*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*74*/	r3.zw = (r3.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*75*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*76*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*77*/	r1.w = saturate(-r1.w + r4.w);
/*78*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*79*/	if(floatBitsToUint(r1.w) != 0u) {
/*80*/	  r1.w = -r4.w + 1.000000;
/*81*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*82*/	  r1.w = -r1.w + 1.000000;
/*83*/	  r1.w = -r1.w * r1.w + 1.000000;
/*84*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*85*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*86*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*87*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*88*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*89*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*90*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*91*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*92*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*93*/	} else {
/*94*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*95*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*96*/	}
/*97*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*98*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*99*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*100*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*101*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*102*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*103*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*104*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*105*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*106*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*107*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*108*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*109*/	r1.w = inversesqrt(r1.w);
/*110*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*111*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*112*/	r1.w = inversesqrt(r1.w);
/*113*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*114*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*115*/	r1.w = inversesqrt(r1.w);
/*116*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*117*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*118*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*119*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*120*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*121*/	r1.w = inversesqrt(r1.w);
/*122*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*123*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*124*/	r4.w = 1.000000;
/*125*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*126*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*127*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*128*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*129*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*130*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*131*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*132*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*133*/	r3.x = intBitsToFloat(int(r2.w));
/*134*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*135*/	if(floatBitsToUint(r3.z) != 0u) {
/*136*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*137*/	  r5.w = vsOut_T0.w;
/*138*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*139*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*140*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*141*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*142*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*143*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*144*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*145*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*146*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*147*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*148*/	  if(floatBitsToUint(r3.w) == 0u) {
/*149*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*150*/	    r7.xy = floor((r6.xyxx).xy);
/*151*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*152*/	    r3.z = -0.000400 / r3.z;
/*153*/	    r3.z = r3.z + r6.z;
/*154*/	    r8.z = -r8.y + 1.000000;
/*155*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*156*/	    r8.w = -r8.y;
/*157*/	    r10.x = cb1.data[0].z/**/;
/*158*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*159*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*160*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*161*/	    r10.w = -cb1.data[0].w/**/;
/*162*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*163*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*164*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*165*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*166*/	    r8.x = r9.x;
/*167*/	    r8.y = r11.x;
/*168*/	    r8.z = r10.x;
/*169*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*170*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*171*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*172*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*173*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*174*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*175*/	    r3.z = -r6.x + r6.y;
/*176*/	    r3.z = r3.w * r3.z + r6.x;
/*177*/	  } else {
/*178*/	    r3.z = 1.000000;
/*179*/	  }
/*180*/	} else {
/*181*/	  r3.z = 1.000000;
/*182*/	}
/*183*/	r3.w = cb1.data[34].w + -1.000000;
/*184*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*185*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*186*/	if(floatBitsToUint(r2.w) == 0u) {
/*187*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*188*/	  r2.w = floatBitsToInt(r2.w);
/*189*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*190*/	  if(floatBitsToUint(r2.w) != 0u) {
/*191*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*192*/	    r5.w = vsOut_T0.w;
/*193*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*194*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*195*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*196*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*197*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*198*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*199*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*200*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*201*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*202*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*203*/	    if(floatBitsToUint(r5.w) == 0u) {
/*204*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*205*/	      r6.xy = floor((r5.xyxx).xy);
/*206*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*207*/	      r2.w = -0.000400 / r2.w;
/*208*/	      r2.w = r2.w + r5.z;
/*209*/	      r7.z = -r7.y + 1.000000;
/*210*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*211*/	      r7.w = -r7.y;
/*212*/	      r9.x = cb1.data[0].z/**/;
/*213*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*214*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*215*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*216*/	      r9.w = -cb1.data[0].w/**/;
/*217*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*218*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*219*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*220*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*221*/	      r7.x = r8.x;
/*222*/	      r7.y = r10.x;
/*223*/	      r7.z = r9.x;
/*224*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*225*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*226*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*227*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*228*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*229*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*230*/	      r2.w = -r5.x + r5.z;
/*231*/	      r2.w = r5.y * r2.w + r5.x;
/*232*/	    } else {
/*233*/	      r2.w = 1.000000;
/*234*/	    }
/*235*/	  } else {
/*236*/	    r2.w = 1.000000;
/*237*/	  }
/*238*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*239*/	  r5.y = r5.x * cb1.data[34].x;
/*240*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*241*/	  r5.x = r1.w + -r5.x;
/*242*/	  r5.x = saturate(r5.x / r5.y);
/*243*/	  r2.w = -r3.z + r2.w;
/*244*/	  r3.z = r5.x * r2.w + r3.z;
/*245*/	}
/*246*/	if(floatBitsToUint(r3.w) != 0u) {
/*247*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*248*/	  r3.w = r2.w * cb1.data[34].y;
/*249*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*250*/	  r2.w = r1.w + -r2.w;
/*251*/	  r2.w = saturate(r2.w / r3.w);
/*252*/	  r3.x = -r3.z + 1.000000;
/*253*/	  r3.z = r2.w * r3.x + r3.z;
/*254*/	}
/*255*/	r3.z = saturate(r3.z);
/*256*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*257*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*258*/	r2.w = inversesqrt(r2.w);
/*259*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*260*/	r2.w = -r3.y + 1.000000;
/*261*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*262*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*263*/	r3.w = r3.w + r3.w;
/*264*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*265*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*266*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*267*/	r3.w = cos((r8.x));
/*268*/	r3.w = inversesqrt(r3.w);
/*269*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*270*/	r5.w = saturate(r0.w * 60.000000);
/*271*/	r5.w = -r0.w + r5.w;
/*272*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*273*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*274*/	r6.w = inversesqrt(r6.w);
/*275*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*276*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*277*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*278*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*279*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*280*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*281*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*282*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*283*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*284*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*285*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*286*/	r6.w = -r0.w + 1.000000;
/*287*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*288*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*289*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*290*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*291*/	  r6.w = max(r6.w, 0.000000);
/*292*/	  r6.w = log2(r6.w);
/*293*/	  r6.w = r6.w * 10.000000;
/*294*/	  r6.w = exp2(r6.w);
/*295*/	  r6.w = r3.w * r6.w;
/*296*/	  r6.w = r6.w * r5.w + r0.w;
/*297*/	  r7.y = r2.w * 8.000000;
/*298*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*299*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*300*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*301*/	}
/*302*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*303*/	r7.y = max(r6.w, 0.000000);
/*304*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*305*/	if(floatBitsToUint(r6.w) != 0u) {
/*306*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*307*/	  r6.x = max(r6.x, -1.000000);
/*308*/	  r6.x = min(r6.x, 1.000000);
/*309*/	  r6.y = -abs(r6.x) + 1.000000;
/*310*/	  r6.y = sqrt(r6.y);
/*311*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*312*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*313*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*314*/	  r6.w = r6.y * r6.z;
/*315*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*316*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*317*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*318*/	  r6.x = r6.z * r6.y + r6.x;
/*319*/	  r3.y = r3.y * r3.y;
/*320*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*321*/	  r3.x = r3.y * r3.x + r7.x;
/*322*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*323*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*324*/	  r3.y = -r3.x * r3.x + 1.000000;
/*325*/	  r3.y = max(r3.y, 0.001000);
/*326*/	  r3.y = log2(r3.y);
/*327*/	  r6.y = r3.y * 4.950617;
/*328*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*329*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*330*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*331*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*332*/	  r3.x = floatBitsToInt(r3.x);
/*333*/	  r6.y = r3.y * r3.y + -r6.y;
/*334*/	  r6.y = sqrt(r6.y);
/*335*/	  r3.y = -r3.y + r6.y;
/*336*/	  r3.y = max(r3.y, 0.000000);
/*337*/	  r3.y = sqrt(r3.y);
/*338*/	  r3.x = r3.y * r3.x;
/*339*/	  r3.x = r3.x * 1.414214;
/*340*/	  r3.x = 0.008727 / r3.x;
/*341*/	  r3.x = max(r3.x, 0.000100);
/*342*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*343*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*344*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*345*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*346*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*347*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*348*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*349*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*350*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*351*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*352*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*353*/	  r3.x = floatBitsToInt(r3.x);
/*354*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*355*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*356*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*357*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*358*/	  r3.x = r3.x * r6.x + 1.000000;
/*359*/	  r3.x = r3.x * 0.500000;
/*360*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*361*/	  r3.y = r3.y * r6.y + 1.000000;
/*362*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*363*/	  r3.y = min(r7.y, 1.000000);
/*364*/	  r2.w = r2.w * 1.570796;
/*365*/	  r2.w = sin(r2.w);
/*366*/	  r3.y = r3.y + -1.000000;
/*367*/	  r2.w = r2.w * r3.y + 1.000000;
/*368*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*369*/	  r3.y = max(r3.y, 0.000000);
/*370*/	  r3.y = log2(r3.y);
/*371*/	  r3.y = r3.y * 10.000000;
/*372*/	  r3.y = exp2(r3.y);
/*373*/	  r3.y = r3.w * r3.y;
/*374*/	  r3.y = r3.y * r5.w + r0.w;
/*375*/	  r2.w = r2.w * abs(r3.x);
/*376*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*377*/	} else {
/*378*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*379*/	}
/*380*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*381*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*382*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*383*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*384*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*385*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*386*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*387*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*388*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*389*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*390*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*391*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*392*/	r2.w = inversesqrt(r2.w);
/*393*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*394*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*395*/	r2.w = r2.w + r2.w;
/*396*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*397*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*398*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*399*/	r2.x = max(r2.x, 0.000000);
/*400*/	r2.x = log2(r2.x);
/*401*/	r2.x = r2.x * 10.000000;
/*402*/	r2.x = exp2(r2.x);
/*403*/	r2.x = r3.w * r2.x;
/*404*/	r0.w = r2.x * r5.w + r0.w;
/*405*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*406*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*407*/	color0.w = 2.000000;
/*408*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*409*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*410*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*411*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*412*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*413*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*414*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*415*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*416*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*417*/	if(r0.x != 0) discard;
/*418*/	color1.x = 1.000000;
/*419*/	return;
}
