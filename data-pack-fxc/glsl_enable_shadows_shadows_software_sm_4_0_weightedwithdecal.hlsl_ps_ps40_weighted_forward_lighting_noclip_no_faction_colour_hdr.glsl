//
//
// Shader Model 4
// Fragment Shader
//
// id: 5816 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecal.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r2.z = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*11*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*12*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*13*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*14*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*18*/	r4.z = vsOut_T6.z;
/*19*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*20*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*21*/	if(floatBitsToUint(r0.w) != 0u) {
/*22*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*23*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*25*/	  r0.w = -r0.w + 1.000000;
/*26*/	  r0.w = max(r0.w, 0.000000);
/*27*/	  r4.z = sqrt(r0.w);
/*28*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*30*/	  r0.w = r3.x * r7.w;
/*31*/	  r3.x = r0.w * -0.500000 + r3.x;
/*32*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*33*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*34*/	  r0.w = -r5.w * r6.w + 1.000000;
/*35*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*36*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*37*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*38*/	}
/*39*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*40*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*41*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*42*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*43*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*44*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*45*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*46*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*47*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*48*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*49*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*50*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*51*/	r1.w = inversesqrt(r1.w);
/*52*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*53*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*56*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*57*/	r1.w = inversesqrt(r1.w);
/*58*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*59*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*60*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*61*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*62*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*63*/	r1.w = inversesqrt(r1.w);
/*64*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*65*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*66*/	r4.w = 1.000000;
/*67*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*68*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*69*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*70*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*71*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*74*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*75*/	r3.x = intBitsToFloat(int(r2.w));
/*76*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*77*/	if(floatBitsToUint(r3.z) != 0u) {
/*78*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*79*/	  r5.w = vsOut_T0.w;
/*80*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*81*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*82*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*83*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*84*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*85*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*86*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*87*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*88*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*89*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*90*/	  if(floatBitsToUint(r3.w) == 0u) {
/*91*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*92*/	    r7.xy = floor((r6.xyxx).xy);
/*93*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*94*/	    r3.z = -0.000400 / r3.z;
/*95*/	    r3.z = r3.z + r6.z;
/*96*/	    r8.z = -r8.y + 1.000000;
/*97*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*98*/	    r8.w = -r8.y;
/*99*/	    r10.x = cb1.data[0].z/**/;
/*100*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*101*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*102*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*103*/	    r10.w = -cb1.data[0].w/**/;
/*104*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*105*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*106*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*107*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*108*/	    r8.x = r9.x;
/*109*/	    r8.y = r11.x;
/*110*/	    r8.z = r10.x;
/*111*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*112*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*113*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*114*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*115*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*116*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*117*/	    r3.z = -r6.x + r6.y;
/*118*/	    r3.z = r3.w * r3.z + r6.x;
/*119*/	  } else {
/*120*/	    r3.z = 1.000000;
/*121*/	  }
/*122*/	} else {
/*123*/	  r3.z = 1.000000;
/*124*/	}
/*125*/	r3.w = cb1.data[34].w + -1.000000;
/*126*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*127*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*128*/	if(floatBitsToUint(r2.w) == 0u) {
/*129*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*130*/	  r2.w = floatBitsToInt(r2.w);
/*131*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*132*/	  if(floatBitsToUint(r2.w) != 0u) {
/*133*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*134*/	    r5.w = vsOut_T0.w;
/*135*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*136*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*137*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*138*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*139*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*140*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*141*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*142*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*143*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*144*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*145*/	    if(floatBitsToUint(r5.w) == 0u) {
/*146*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*147*/	      r6.xy = floor((r5.xyxx).xy);
/*148*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*149*/	      r2.w = -0.000400 / r2.w;
/*150*/	      r2.w = r2.w + r5.z;
/*151*/	      r7.z = -r7.y + 1.000000;
/*152*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*153*/	      r7.w = -r7.y;
/*154*/	      r9.x = cb1.data[0].z/**/;
/*155*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*156*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*157*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*158*/	      r9.w = -cb1.data[0].w/**/;
/*159*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*160*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*161*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*162*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*163*/	      r7.x = r8.x;
/*164*/	      r7.y = r10.x;
/*165*/	      r7.z = r9.x;
/*166*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*167*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*168*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*169*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*170*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*171*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*172*/	      r2.w = -r5.x + r5.z;
/*173*/	      r2.w = r5.y * r2.w + r5.x;
/*174*/	    } else {
/*175*/	      r2.w = 1.000000;
/*176*/	    }
/*177*/	  } else {
/*178*/	    r2.w = 1.000000;
/*179*/	  }
/*180*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*181*/	  r5.y = r5.x * cb1.data[34].x;
/*182*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*183*/	  r5.x = r1.w + -r5.x;
/*184*/	  r5.x = saturate(r5.x / r5.y);
/*185*/	  r2.w = -r3.z + r2.w;
/*186*/	  r3.z = r5.x * r2.w + r3.z;
/*187*/	}
/*188*/	if(floatBitsToUint(r3.w) != 0u) {
/*189*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*190*/	  r3.w = r2.w * cb1.data[34].y;
/*191*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*192*/	  r2.w = r1.w + -r2.w;
/*193*/	  r2.w = saturate(r2.w / r3.w);
/*194*/	  r3.x = -r3.z + 1.000000;
/*195*/	  r3.z = r2.w * r3.x + r3.z;
/*196*/	}
/*197*/	r3.z = saturate(r3.z);
/*198*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*199*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*200*/	r2.w = inversesqrt(r2.w);
/*201*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*202*/	r2.w = -r3.y + 1.000000;
/*203*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*204*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*205*/	r3.w = r3.w + r3.w;
/*206*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*207*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*208*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*209*/	r3.w = cos((r8.x));
/*210*/	r3.w = inversesqrt(r3.w);
/*211*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*212*/	r5.w = saturate(r0.w * 60.000000);
/*213*/	r5.w = -r0.w + r5.w;
/*214*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*215*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*216*/	r6.w = inversesqrt(r6.w);
/*217*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*218*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*219*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*220*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*221*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*222*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*223*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*224*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*225*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*226*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*227*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*228*/	r6.w = -r0.w + 1.000000;
/*229*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*230*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*231*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*232*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*233*/	  r6.w = max(r6.w, 0.000000);
/*234*/	  r6.w = log2(r6.w);
/*235*/	  r6.w = r6.w * 10.000000;
/*236*/	  r6.w = exp2(r6.w);
/*237*/	  r6.w = r3.w * r6.w;
/*238*/	  r6.w = r6.w * r5.w + r0.w;
/*239*/	  r7.y = r2.w * 8.000000;
/*240*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*241*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*242*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*243*/	}
/*244*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*245*/	r7.y = max(r6.w, 0.000000);
/*246*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*247*/	if(floatBitsToUint(r6.w) != 0u) {
/*248*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*249*/	  r6.x = max(r6.x, -1.000000);
/*250*/	  r6.x = min(r6.x, 1.000000);
/*251*/	  r6.y = -abs(r6.x) + 1.000000;
/*252*/	  r6.y = sqrt(r6.y);
/*253*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*254*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*255*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*256*/	  r6.w = r6.y * r6.z;
/*257*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*258*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*259*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*260*/	  r6.x = r6.z * r6.y + r6.x;
/*261*/	  r3.y = r3.y * r3.y;
/*262*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*263*/	  r3.x = r3.y * r3.x + r7.x;
/*264*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*265*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*266*/	  r3.y = -r3.x * r3.x + 1.000000;
/*267*/	  r3.y = max(r3.y, 0.001000);
/*268*/	  r3.y = log2(r3.y);
/*269*/	  r6.y = r3.y * 4.950617;
/*270*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*271*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*272*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*273*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*274*/	  r3.x = floatBitsToInt(r3.x);
/*275*/	  r6.y = r3.y * r3.y + -r6.y;
/*276*/	  r6.y = sqrt(r6.y);
/*277*/	  r3.y = -r3.y + r6.y;
/*278*/	  r3.y = max(r3.y, 0.000000);
/*279*/	  r3.y = sqrt(r3.y);
/*280*/	  r3.x = r3.y * r3.x;
/*281*/	  r3.x = r3.x * 1.414214;
/*282*/	  r3.x = 0.008727 / r3.x;
/*283*/	  r3.x = max(r3.x, 0.000100);
/*284*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*285*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*286*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*287*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*288*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*289*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*290*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*291*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*292*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*293*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*294*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*295*/	  r3.x = floatBitsToInt(r3.x);
/*296*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*297*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*298*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*299*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*300*/	  r3.x = r3.x * r6.x + 1.000000;
/*301*/	  r3.x = r3.x * 0.500000;
/*302*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*303*/	  r3.y = r3.y * r6.y + 1.000000;
/*304*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*305*/	  r3.y = min(r7.y, 1.000000);
/*306*/	  r2.w = r2.w * 1.570796;
/*307*/	  r2.w = sin(r2.w);
/*308*/	  r3.y = r3.y + -1.000000;
/*309*/	  r2.w = r2.w * r3.y + 1.000000;
/*310*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*311*/	  r3.y = max(r3.y, 0.000000);
/*312*/	  r3.y = log2(r3.y);
/*313*/	  r3.y = r3.y * 10.000000;
/*314*/	  r3.y = exp2(r3.y);
/*315*/	  r3.y = r3.w * r3.y;
/*316*/	  r3.y = r3.y * r5.w + r0.w;
/*317*/	  r2.w = r2.w * abs(r3.x);
/*318*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*319*/	} else {
/*320*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*321*/	}
/*322*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*323*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*324*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*325*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*326*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*327*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*328*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*329*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*330*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*331*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*332*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*333*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*334*/	r2.w = inversesqrt(r2.w);
/*335*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*336*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*337*/	r2.w = r2.w + r2.w;
/*338*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*339*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*340*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*341*/	r2.x = max(r2.x, 0.000000);
/*342*/	r2.x = log2(r2.x);
/*343*/	r2.x = r2.x * 10.000000;
/*344*/	r2.x = exp2(r2.x);
/*345*/	r2.x = r3.w * r2.x;
/*346*/	r0.w = r2.x * r5.w + r0.w;
/*347*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*348*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*349*/	color0.w = 2.000000;
/*350*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*351*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*352*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*353*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*354*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*355*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*356*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*357*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*358*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*359*/	if(r0.x != 0) discard;
/*360*/	color1.x = 1.000000;
/*361*/	return;
}
