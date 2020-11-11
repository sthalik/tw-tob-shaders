//
//
// Shader Model 4
// Fragment Shader
//
// id: 5874 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirt.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;

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
/*39*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*40*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*41*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*42*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*43*/	r0.w = r4.w * r5.w;
/*44*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*45*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*46*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*47*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*50*/	r4.xyz = (r0.wwww * r1.xyzx).xyz;
/*51*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*52*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*54*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*55*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*57*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*58*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*59*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*60*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*61*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*62*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*63*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*64*/	r1.w = inversesqrt(r1.w);
/*65*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*66*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*69*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*72*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*73*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*74*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*75*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*78*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*79*/	r4.w = 1.000000;
/*80*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*81*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*82*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*83*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*84*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*85*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*87*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*88*/	r3.x = intBitsToFloat(int(r2.w));
/*89*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*90*/	if(floatBitsToUint(r3.z) != 0u) {
/*91*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*92*/	  r5.w = vsOut_T0.w;
/*93*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*94*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*95*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*96*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*97*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*98*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*99*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*100*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*101*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*102*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*103*/	  if(floatBitsToUint(r3.w) == 0u) {
/*104*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*105*/	    r7.xy = floor((r6.xyxx).xy);
/*106*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*107*/	    r3.z = -0.000400 / r3.z;
/*108*/	    r3.z = r3.z + r6.z;
/*109*/	    r8.z = -r8.y + 1.000000;
/*110*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*111*/	    r8.w = -r8.y;
/*112*/	    r10.x = cb1.data[0].z/**/;
/*113*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*114*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*115*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*116*/	    r10.w = -cb1.data[0].w/**/;
/*117*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*118*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*119*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*120*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*121*/	    r8.x = r9.x;
/*122*/	    r8.y = r11.x;
/*123*/	    r8.z = r10.x;
/*124*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*125*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*126*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*127*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*128*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*129*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*130*/	    r3.z = -r6.x + r6.y;
/*131*/	    r3.z = r3.w * r3.z + r6.x;
/*132*/	  } else {
/*133*/	    r3.z = 1.000000;
/*134*/	  }
/*135*/	} else {
/*136*/	  r3.z = 1.000000;
/*137*/	}
/*138*/	r3.w = cb1.data[34].w + -1.000000;
/*139*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*140*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*141*/	if(floatBitsToUint(r2.w) == 0u) {
/*142*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*143*/	  r2.w = floatBitsToInt(r2.w);
/*144*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*145*/	  if(floatBitsToUint(r2.w) != 0u) {
/*146*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*147*/	    r5.w = vsOut_T0.w;
/*148*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*149*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*150*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*151*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*152*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*153*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*154*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*155*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*156*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*157*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*158*/	    if(floatBitsToUint(r5.w) == 0u) {
/*159*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*160*/	      r6.xy = floor((r5.xyxx).xy);
/*161*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*162*/	      r2.w = -0.000400 / r2.w;
/*163*/	      r2.w = r2.w + r5.z;
/*164*/	      r7.z = -r7.y + 1.000000;
/*165*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*166*/	      r7.w = -r7.y;
/*167*/	      r9.x = cb1.data[0].z/**/;
/*168*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*169*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*170*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*171*/	      r9.w = -cb1.data[0].w/**/;
/*172*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*173*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*174*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*175*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*176*/	      r7.x = r8.x;
/*177*/	      r7.y = r10.x;
/*178*/	      r7.z = r9.x;
/*179*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*180*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*181*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*182*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*183*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*184*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*185*/	      r2.w = -r5.x + r5.z;
/*186*/	      r2.w = r5.y * r2.w + r5.x;
/*187*/	    } else {
/*188*/	      r2.w = 1.000000;
/*189*/	    }
/*190*/	  } else {
/*191*/	    r2.w = 1.000000;
/*192*/	  }
/*193*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*194*/	  r5.y = r5.x * cb1.data[34].x;
/*195*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*196*/	  r5.x = r1.w + -r5.x;
/*197*/	  r5.x = saturate(r5.x / r5.y);
/*198*/	  r2.w = -r3.z + r2.w;
/*199*/	  r3.z = r5.x * r2.w + r3.z;
/*200*/	}
/*201*/	if(floatBitsToUint(r3.w) != 0u) {
/*202*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*203*/	  r3.w = r2.w * cb1.data[34].y;
/*204*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*205*/	  r2.w = r1.w + -r2.w;
/*206*/	  r2.w = saturate(r2.w / r3.w);
/*207*/	  r3.x = -r3.z + 1.000000;
/*208*/	  r3.z = r2.w * r3.x + r3.z;
/*209*/	}
/*210*/	r3.z = saturate(r3.z);
/*211*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*212*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*213*/	r2.w = inversesqrt(r2.w);
/*214*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*215*/	r2.w = -r3.y + 1.000000;
/*216*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*217*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*218*/	r3.w = r3.w + r3.w;
/*219*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*220*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*221*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*222*/	r3.w = cos((r8.x));
/*223*/	r3.w = inversesqrt(r3.w);
/*224*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*225*/	r5.w = saturate(r0.w * 60.000000);
/*226*/	r5.w = -r0.w + r5.w;
/*227*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*228*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*229*/	r6.w = inversesqrt(r6.w);
/*230*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*231*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*232*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*233*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*234*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*235*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*236*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*237*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*238*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*239*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*240*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*241*/	r6.w = -r0.w + 1.000000;
/*242*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*243*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*244*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*245*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*246*/	  r6.w = max(r6.w, 0.000000);
/*247*/	  r6.w = log2(r6.w);
/*248*/	  r6.w = r6.w * 10.000000;
/*249*/	  r6.w = exp2(r6.w);
/*250*/	  r6.w = r3.w * r6.w;
/*251*/	  r6.w = r6.w * r5.w + r0.w;
/*252*/	  r7.y = r2.w * 8.000000;
/*253*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*254*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*255*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*256*/	}
/*257*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*258*/	r7.y = max(r6.w, 0.000000);
/*259*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*260*/	if(floatBitsToUint(r6.w) != 0u) {
/*261*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*262*/	  r6.x = max(r6.x, -1.000000);
/*263*/	  r6.x = min(r6.x, 1.000000);
/*264*/	  r6.y = -abs(r6.x) + 1.000000;
/*265*/	  r6.y = sqrt(r6.y);
/*266*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*267*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*268*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*269*/	  r6.w = r6.y * r6.z;
/*270*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*271*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*272*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*273*/	  r6.x = r6.z * r6.y + r6.x;
/*274*/	  r3.y = r3.y * r3.y;
/*275*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*276*/	  r3.x = r3.y * r3.x + r7.x;
/*277*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*278*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*279*/	  r3.y = -r3.x * r3.x + 1.000000;
/*280*/	  r3.y = max(r3.y, 0.001000);
/*281*/	  r3.y = log2(r3.y);
/*282*/	  r6.y = r3.y * 4.950617;
/*283*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*284*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*285*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*286*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*287*/	  r3.x = floatBitsToInt(r3.x);
/*288*/	  r6.y = r3.y * r3.y + -r6.y;
/*289*/	  r6.y = sqrt(r6.y);
/*290*/	  r3.y = -r3.y + r6.y;
/*291*/	  r3.y = max(r3.y, 0.000000);
/*292*/	  r3.y = sqrt(r3.y);
/*293*/	  r3.x = r3.y * r3.x;
/*294*/	  r3.x = r3.x * 1.414214;
/*295*/	  r3.x = 0.008727 / r3.x;
/*296*/	  r3.x = max(r3.x, 0.000100);
/*297*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*298*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*299*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*300*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*301*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*302*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*303*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*304*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*305*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*306*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*307*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*308*/	  r3.x = floatBitsToInt(r3.x);
/*309*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*310*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*311*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*312*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*313*/	  r3.x = r3.x * r6.x + 1.000000;
/*314*/	  r3.x = r3.x * 0.500000;
/*315*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*316*/	  r3.y = r3.y * r6.y + 1.000000;
/*317*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*318*/	  r3.y = min(r7.y, 1.000000);
/*319*/	  r2.w = r2.w * 1.570796;
/*320*/	  r2.w = sin(r2.w);
/*321*/	  r3.y = r3.y + -1.000000;
/*322*/	  r2.w = r2.w * r3.y + 1.000000;
/*323*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*324*/	  r3.y = max(r3.y, 0.000000);
/*325*/	  r3.y = log2(r3.y);
/*326*/	  r3.y = r3.y * 10.000000;
/*327*/	  r3.y = exp2(r3.y);
/*328*/	  r3.y = r3.w * r3.y;
/*329*/	  r3.y = r3.y * r5.w + r0.w;
/*330*/	  r2.w = r2.w * abs(r3.x);
/*331*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*332*/	} else {
/*333*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*334*/	}
/*335*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*336*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*337*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*338*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*339*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*340*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*341*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*342*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*343*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*344*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*345*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*346*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*347*/	r2.w = inversesqrt(r2.w);
/*348*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*349*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*350*/	r2.w = r2.w + r2.w;
/*351*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*352*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*353*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*354*/	r2.x = max(r2.x, 0.000000);
/*355*/	r2.x = log2(r2.x);
/*356*/	r2.x = r2.x * 10.000000;
/*357*/	r2.x = exp2(r2.x);
/*358*/	r2.x = r3.w * r2.x;
/*359*/	r0.w = r2.x * r5.w + r0.w;
/*360*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*361*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*362*/	color0.w = 2.000000;
/*363*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*364*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*365*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*366*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*367*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*368*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*369*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*370*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*371*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*372*/	if(r0.x != 0) discard;
/*373*/	color1.x = 1.000000;
/*374*/	return;
}
