//
//
// Shader Model 4
// Fragment Shader
//
// id: 6946 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalblood.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

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
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r0.w = -r0.w + 1.000000;
/*10*/	r0.w = max(r0.w, 0.000000);
/*11*/	r2.z = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*13*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*15*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*16*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*17*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*20*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*21*/	r4.z = vsOut_T6.z;
/*22*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*23*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*24*/	if(floatBitsToUint(r0.w) != 0u) {
/*25*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*26*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*27*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*28*/	  r0.w = -r0.w + 1.000000;
/*29*/	  r0.w = max(r0.w, 0.000000);
/*30*/	  r4.z = sqrt(r0.w);
/*31*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*33*/	  r0.w = r3.x * r7.w;
/*34*/	  r3.x = r0.w * -0.500000 + r3.x;
/*35*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*36*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*37*/	  r0.w = -r5.w * r6.w + 1.000000;
/*38*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*39*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*40*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*41*/	}
/*42*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*43*/	if(r0.w != 0) discard;
/*44*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*45*/	r3.zw = (r3.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*46*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*47*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*48*/	r0.w = saturate(-r0.w + r4.w);
/*49*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*50*/	if(floatBitsToUint(r0.w) != 0u) {
/*51*/	  r0.w = -r4.w + 1.000000;
/*52*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*53*/	  r0.w = -r0.w + 1.000000;
/*54*/	  r0.w = -r0.w * r0.w + 1.000000;
/*55*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*56*/	  r4.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*57*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*58*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*59*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*60*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*61*/	  r0.xyz = (r0.wwww * r5.xyzx + r4.xyzx).xyz;
/*62*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*63*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*64*/	}
/*65*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*67*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*68*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*70*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*71*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*72*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*73*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*74*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*75*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*76*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*79*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*82*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*85*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*86*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*87*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*88*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*89*/	r1.w = inversesqrt(r1.w);
/*90*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*91*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*92*/	r4.w = 1.000000;
/*93*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*94*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*95*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*96*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*97*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*98*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*99*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*100*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*101*/	r3.x = intBitsToFloat(int(r2.w));
/*102*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*103*/	if(floatBitsToUint(r3.z) != 0u) {
/*104*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*105*/	  r5.w = vsOut_T0.w;
/*106*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*107*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*108*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*109*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*110*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*111*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*112*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*113*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*114*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*115*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*116*/	  if(floatBitsToUint(r3.w) == 0u) {
/*117*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*118*/	    r7.xy = floor((r6.xyxx).xy);
/*119*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*120*/	    r3.z = -0.000400 / r3.z;
/*121*/	    r3.z = r3.z + r6.z;
/*122*/	    r8.z = -r8.y + 1.000000;
/*123*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*124*/	    r8.w = -r8.y;
/*125*/	    r10.x = cb1.data[0].z/**/;
/*126*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*127*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*128*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*129*/	    r10.w = -cb1.data[0].w/**/;
/*130*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*131*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*132*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*133*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*134*/	    r8.x = r9.x;
/*135*/	    r8.y = r11.x;
/*136*/	    r8.z = r10.x;
/*137*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*138*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*139*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*140*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*141*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*142*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*143*/	    r3.z = -r6.x + r6.y;
/*144*/	    r3.z = r3.w * r3.z + r6.x;
/*145*/	  } else {
/*146*/	    r3.z = 1.000000;
/*147*/	  }
/*148*/	} else {
/*149*/	  r3.z = 1.000000;
/*150*/	}
/*151*/	r3.w = cb1.data[34].w + -1.000000;
/*152*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*153*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*154*/	if(floatBitsToUint(r2.w) == 0u) {
/*155*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*156*/	  r2.w = floatBitsToInt(r2.w);
/*157*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*158*/	  if(floatBitsToUint(r2.w) != 0u) {
/*159*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*160*/	    r5.w = vsOut_T0.w;
/*161*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*162*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*163*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*164*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*165*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*166*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*167*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*168*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*169*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*170*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*171*/	    if(floatBitsToUint(r5.w) == 0u) {
/*172*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*173*/	      r6.xy = floor((r5.xyxx).xy);
/*174*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*175*/	      r2.w = -0.000400 / r2.w;
/*176*/	      r2.w = r2.w + r5.z;
/*177*/	      r7.z = -r7.y + 1.000000;
/*178*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*179*/	      r7.w = -r7.y;
/*180*/	      r9.x = cb1.data[0].z/**/;
/*181*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*182*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*183*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*184*/	      r9.w = -cb1.data[0].w/**/;
/*185*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*186*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*187*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*188*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*189*/	      r7.x = r8.x;
/*190*/	      r7.y = r10.x;
/*191*/	      r7.z = r9.x;
/*192*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*193*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*194*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*195*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*196*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*197*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*198*/	      r2.w = -r5.x + r5.z;
/*199*/	      r2.w = r5.y * r2.w + r5.x;
/*200*/	    } else {
/*201*/	      r2.w = 1.000000;
/*202*/	    }
/*203*/	  } else {
/*204*/	    r2.w = 1.000000;
/*205*/	  }
/*206*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*207*/	  r5.y = r5.x * cb1.data[34].x;
/*208*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*209*/	  r5.x = r1.w + -r5.x;
/*210*/	  r5.x = saturate(r5.x / r5.y);
/*211*/	  r2.w = -r3.z + r2.w;
/*212*/	  r3.z = r5.x * r2.w + r3.z;
/*213*/	}
/*214*/	if(floatBitsToUint(r3.w) != 0u) {
/*215*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*216*/	  r3.w = r2.w * cb1.data[34].y;
/*217*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*218*/	  r2.w = r1.w + -r2.w;
/*219*/	  r2.w = saturate(r2.w / r3.w);
/*220*/	  r3.x = -r3.z + 1.000000;
/*221*/	  r3.z = r2.w * r3.x + r3.z;
/*222*/	}
/*223*/	r3.z = saturate(r3.z);
/*224*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*225*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*226*/	r2.w = inversesqrt(r2.w);
/*227*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*228*/	r2.w = -r3.y + 1.000000;
/*229*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*230*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*231*/	r3.w = r3.w + r3.w;
/*232*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*233*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*234*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*235*/	r3.w = cos((r8.x));
/*236*/	r3.w = inversesqrt(r3.w);
/*237*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*238*/	r5.w = saturate(r0.w * 60.000000);
/*239*/	r5.w = -r0.w + r5.w;
/*240*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*241*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*242*/	r6.w = inversesqrt(r6.w);
/*243*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*244*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*245*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*246*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*247*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*248*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*249*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*250*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*251*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*252*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*253*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*254*/	r6.w = -r0.w + 1.000000;
/*255*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*256*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*257*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*258*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*259*/	  r6.w = max(r6.w, 0.000000);
/*260*/	  r6.w = log2(r6.w);
/*261*/	  r6.w = r6.w * 10.000000;
/*262*/	  r6.w = exp2(r6.w);
/*263*/	  r6.w = r3.w * r6.w;
/*264*/	  r6.w = r6.w * r5.w + r0.w;
/*265*/	  r7.y = r2.w * 8.000000;
/*266*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*267*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*268*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*269*/	}
/*270*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*271*/	r7.y = max(r6.w, 0.000000);
/*272*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*273*/	if(floatBitsToUint(r6.w) != 0u) {
/*274*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*275*/	  r6.x = max(r6.x, -1.000000);
/*276*/	  r6.x = min(r6.x, 1.000000);
/*277*/	  r6.y = -abs(r6.x) + 1.000000;
/*278*/	  r6.y = sqrt(r6.y);
/*279*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*280*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*281*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*282*/	  r6.w = r6.y * r6.z;
/*283*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*284*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*285*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*286*/	  r6.x = r6.z * r6.y + r6.x;
/*287*/	  r3.y = r3.y * r3.y;
/*288*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*289*/	  r3.x = r3.y * r3.x + r7.x;
/*290*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*291*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*292*/	  r3.y = -r3.x * r3.x + 1.000000;
/*293*/	  r3.y = max(r3.y, 0.001000);
/*294*/	  r3.y = log2(r3.y);
/*295*/	  r6.y = r3.y * 4.950617;
/*296*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*297*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*298*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*299*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*300*/	  r3.x = floatBitsToInt(r3.x);
/*301*/	  r6.y = r3.y * r3.y + -r6.y;
/*302*/	  r6.y = sqrt(r6.y);
/*303*/	  r3.y = -r3.y + r6.y;
/*304*/	  r3.y = max(r3.y, 0.000000);
/*305*/	  r3.y = sqrt(r3.y);
/*306*/	  r3.x = r3.y * r3.x;
/*307*/	  r3.x = r3.x * 1.414214;
/*308*/	  r3.x = 0.008727 / r3.x;
/*309*/	  r3.x = max(r3.x, 0.000100);
/*310*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*311*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*312*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*313*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*314*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*315*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*316*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*317*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*318*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*319*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*320*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*321*/	  r3.x = floatBitsToInt(r3.x);
/*322*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*323*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*324*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*325*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*326*/	  r3.x = r3.x * r6.x + 1.000000;
/*327*/	  r3.x = r3.x * 0.500000;
/*328*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*329*/	  r3.y = r3.y * r6.y + 1.000000;
/*330*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*331*/	  r3.y = min(r7.y, 1.000000);
/*332*/	  r2.w = r2.w * 1.570796;
/*333*/	  r2.w = sin(r2.w);
/*334*/	  r3.y = r3.y + -1.000000;
/*335*/	  r2.w = r2.w * r3.y + 1.000000;
/*336*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*337*/	  r3.y = max(r3.y, 0.000000);
/*338*/	  r3.y = log2(r3.y);
/*339*/	  r3.y = r3.y * 10.000000;
/*340*/	  r3.y = exp2(r3.y);
/*341*/	  r3.y = r3.w * r3.y;
/*342*/	  r3.y = r3.y * r5.w + r0.w;
/*343*/	  r2.w = r2.w * abs(r3.x);
/*344*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*345*/	} else {
/*346*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*347*/	}
/*348*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*349*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*350*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*351*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*352*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*353*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*354*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*355*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*356*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*357*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*358*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*359*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*360*/	r2.w = inversesqrt(r2.w);
/*361*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*362*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*363*/	r2.w = r2.w + r2.w;
/*364*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*365*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*366*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*367*/	r2.x = max(r2.x, 0.000000);
/*368*/	r2.x = log2(r2.x);
/*369*/	r2.x = r2.x * 10.000000;
/*370*/	r2.x = exp2(r2.x);
/*371*/	r2.x = r3.w * r2.x;
/*372*/	r0.w = r2.x * r5.w + r0.w;
/*373*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*374*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*375*/	color0.w = 2.000000;
/*376*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*377*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*378*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*379*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*380*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*381*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*382*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*383*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*384*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*385*/	if(r0.x != 0) discard;
/*386*/	color1.x = 1.000000;
/*387*/	return;
}
