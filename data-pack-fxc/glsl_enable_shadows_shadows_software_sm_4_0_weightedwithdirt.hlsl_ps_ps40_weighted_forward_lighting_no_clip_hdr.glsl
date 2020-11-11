//
//
// Shader Model 4
// Fragment Shader
//
// id: 5754 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirt.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;

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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r3.z = sqrt(r0.w);
/*27*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*31*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*32*/	r0.w = r5.w * r6.w;
/*33*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*34*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*35*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*36*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*37*/	r1.w = inversesqrt(r1.w);
/*38*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*39*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*40*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*41*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*42*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*43*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*46*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*47*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*48*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*49*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*50*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*51*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*52*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*53*/	r1.w = inversesqrt(r1.w);
/*54*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*55*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*58*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*61*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*62*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*63*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*64*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*67*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*68*/	r3.w = 1.000000;
/*69*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*70*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*71*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*74*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*75*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*76*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*77*/	r4.y = intBitsToFloat(int(r2.w));
/*78*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*79*/	if(floatBitsToUint(r4.z) != 0u) {
/*80*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*81*/	  r5.w = vsOut_T0.w;
/*82*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*83*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*84*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*85*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*86*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*87*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*88*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*89*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*90*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*91*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*92*/	  if(floatBitsToUint(r4.w) == 0u) {
/*93*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*94*/	    r7.xy = floor((r6.xyxx).xy);
/*95*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*96*/	    r4.z = -0.000400 / r4.z;
/*97*/	    r4.z = r4.z + r6.z;
/*98*/	    r8.z = -r8.y + 1.000000;
/*99*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*100*/	    r8.w = -r8.y;
/*101*/	    r10.x = cb1.data[0].z/**/;
/*102*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*103*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*104*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*105*/	    r10.w = -cb1.data[0].w/**/;
/*106*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*107*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*108*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*109*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*110*/	    r8.x = r9.x;
/*111*/	    r8.y = r11.x;
/*112*/	    r8.z = r10.x;
/*113*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*114*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*115*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*116*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*117*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*118*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*119*/	    r4.z = -r6.x + r6.y;
/*120*/	    r4.z = r4.w * r4.z + r6.x;
/*121*/	  } else {
/*122*/	    r4.z = 1.000000;
/*123*/	  }
/*124*/	} else {
/*125*/	  r4.z = 1.000000;
/*126*/	}
/*127*/	r4.w = cb1.data[34].w + -1.000000;
/*128*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*129*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*130*/	if(floatBitsToUint(r2.w) == 0u) {
/*131*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*132*/	  r2.w = floatBitsToInt(r2.w);
/*133*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*134*/	  if(floatBitsToUint(r2.w) != 0u) {
/*135*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*136*/	    r5.w = vsOut_T0.w;
/*137*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*138*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*139*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*140*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*141*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*142*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*143*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*144*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*145*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*146*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*147*/	    if(floatBitsToUint(r5.w) == 0u) {
/*148*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*149*/	      r6.xy = floor((r5.xyxx).xy);
/*150*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*151*/	      r2.w = -0.000400 / r2.w;
/*152*/	      r2.w = r2.w + r5.z;
/*153*/	      r7.z = -r7.y + 1.000000;
/*154*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*155*/	      r7.w = -r7.y;
/*156*/	      r9.x = cb1.data[0].z/**/;
/*157*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*158*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*159*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*160*/	      r9.w = -cb1.data[0].w/**/;
/*161*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*162*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*163*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*164*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*165*/	      r7.x = r8.x;
/*166*/	      r7.y = r10.x;
/*167*/	      r7.z = r9.x;
/*168*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*169*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*170*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*171*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*172*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*173*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*174*/	      r2.w = -r5.x + r5.z;
/*175*/	      r2.w = r5.y * r2.w + r5.x;
/*176*/	    } else {
/*177*/	      r2.w = 1.000000;
/*178*/	    }
/*179*/	  } else {
/*180*/	    r2.w = 1.000000;
/*181*/	  }
/*182*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*183*/	  r5.y = r5.x * cb1.data[34].x;
/*184*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*185*/	  r5.x = r1.w + -r5.x;
/*186*/	  r5.x = saturate(r5.x / r5.y);
/*187*/	  r2.w = -r4.z + r2.w;
/*188*/	  r4.z = r5.x * r2.w + r4.z;
/*189*/	}
/*190*/	if(floatBitsToUint(r4.w) != 0u) {
/*191*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*192*/	  r4.w = r2.w * cb1.data[34].y;
/*193*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*194*/	  r2.w = r1.w + -r2.w;
/*195*/	  r2.w = saturate(r2.w / r4.w);
/*196*/	  r4.y = -r4.z + 1.000000;
/*197*/	  r4.z = r2.w * r4.y + r4.z;
/*198*/	}
/*199*/	r4.z = saturate(r4.z);
/*200*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*201*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*202*/	r2.w = inversesqrt(r2.w);
/*203*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*204*/	r2.w = -r4.x + 1.000000;
/*205*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*206*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*207*/	r4.w = r4.w + r4.w;
/*208*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*209*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*210*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*211*/	r4.w = cos((r8.x));
/*212*/	r4.w = inversesqrt(r4.w);
/*213*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*214*/	r5.w = saturate(r0.w * 60.000000);
/*215*/	r5.w = -r0.w + r5.w;
/*216*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*217*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*218*/	r6.w = inversesqrt(r6.w);
/*219*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*220*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*221*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*222*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*223*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*224*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*225*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*226*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*227*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*228*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*229*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*230*/	r6.w = -r0.w + 1.000000;
/*231*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*232*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*233*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*234*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*235*/	  r6.w = max(r6.w, 0.000000);
/*236*/	  r6.w = log2(r6.w);
/*237*/	  r6.w = r6.w * 10.000000;
/*238*/	  r6.w = exp2(r6.w);
/*239*/	  r6.w = r4.w * r6.w;
/*240*/	  r6.w = r6.w * r5.w + r0.w;
/*241*/	  r7.y = r2.w * 8.000000;
/*242*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*243*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*244*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*245*/	}
/*246*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*247*/	r7.y = max(r6.w, 0.000000);
/*248*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*249*/	if(floatBitsToUint(r6.w) != 0u) {
/*250*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*251*/	  r6.x = max(r6.x, -1.000000);
/*252*/	  r6.x = min(r6.x, 1.000000);
/*253*/	  r6.y = -abs(r6.x) + 1.000000;
/*254*/	  r6.y = sqrt(r6.y);
/*255*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*256*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*257*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*258*/	  r6.w = r6.y * r6.z;
/*259*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*260*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*261*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*262*/	  r6.x = r6.z * r6.y + r6.x;
/*263*/	  r4.x = r4.x * r4.x;
/*264*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*265*/	  r4.x = r4.x * r4.y + r7.x;
/*266*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*267*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*268*/	  r4.y = -r4.x * r4.x + 1.000000;
/*269*/	  r4.y = max(r4.y, 0.001000);
/*270*/	  r4.y = log2(r4.y);
/*271*/	  r6.y = r4.y * 4.950617;
/*272*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*273*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*274*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*275*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*276*/	  r4.x = floatBitsToInt(r4.x);
/*277*/	  r6.y = r4.y * r4.y + -r6.y;
/*278*/	  r6.y = sqrt(r6.y);
/*279*/	  r4.y = -r4.y + r6.y;
/*280*/	  r4.y = max(r4.y, 0.000000);
/*281*/	  r4.y = sqrt(r4.y);
/*282*/	  r4.x = r4.y * r4.x;
/*283*/	  r4.x = r4.x * 1.414214;
/*284*/	  r4.x = 0.008727 / r4.x;
/*285*/	  r4.x = max(r4.x, 0.000100);
/*286*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*287*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*288*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*289*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*290*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*291*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*292*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*293*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*294*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*295*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*296*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*297*/	  r4.x = floatBitsToInt(r4.x);
/*298*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*299*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*300*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*301*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*302*/	  r4.x = r4.x * r6.x + 1.000000;
/*303*/	  r4.x = r4.x * 0.500000;
/*304*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*305*/	  r4.y = r4.y * r6.y + 1.000000;
/*306*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*307*/	  r4.y = min(r7.y, 1.000000);
/*308*/	  r2.w = r2.w * 1.570796;
/*309*/	  r2.w = sin(r2.w);
/*310*/	  r4.y = r4.y + -1.000000;
/*311*/	  r2.w = r2.w * r4.y + 1.000000;
/*312*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*313*/	  r4.y = max(r4.y, 0.000000);
/*314*/	  r4.y = log2(r4.y);
/*315*/	  r4.y = r4.y * 10.000000;
/*316*/	  r4.y = exp2(r4.y);
/*317*/	  r4.y = r4.w * r4.y;
/*318*/	  r4.y = r4.y * r5.w + r0.w;
/*319*/	  r2.w = r2.w * abs(r4.x);
/*320*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*321*/	} else {
/*322*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*323*/	}
/*324*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*325*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*326*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*327*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*328*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*329*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*330*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*331*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*332*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*333*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*334*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*335*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*336*/	r2.w = inversesqrt(r2.w);
/*337*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*338*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*339*/	r2.w = r2.w + r2.w;
/*340*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*341*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*342*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*343*/	r2.x = max(r2.x, 0.000000);
/*344*/	r2.x = log2(r2.x);
/*345*/	r2.x = r2.x * 10.000000;
/*346*/	r2.x = exp2(r2.x);
/*347*/	r2.x = r4.w * r2.x;
/*348*/	r0.w = r2.x * r5.w + r0.w;
/*349*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*350*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*351*/	color0.w = 2.000000;
/*352*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*353*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*354*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*355*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*356*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*357*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*358*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*359*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*360*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*361*/	if(r0.x != 0) discard;
/*362*/	color1.x = 1.000000;
/*363*/	return;
}
