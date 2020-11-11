//
//
// Shader Model 4
// Fragment Shader
//
// id: 5752 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirt.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
/*29*/	r3.z = sqrt(r0.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r0.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*42*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*46*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*47*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*49*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*50*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*51*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*52*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*53*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*55*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*58*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*61*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*64*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*65*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*66*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*67*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*70*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*71*/	r3.w = 1.000000;
/*72*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*73*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*74*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*75*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*77*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*78*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*79*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*80*/	r4.y = intBitsToFloat(int(r2.w));
/*81*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r4.z) != 0u) {
/*83*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*84*/	  r5.w = vsOut_T0.w;
/*85*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*86*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*87*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*88*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*89*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*90*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*91*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*92*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*93*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*94*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*95*/	  if(floatBitsToUint(r4.w) == 0u) {
/*96*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*97*/	    r7.xy = floor((r6.xyxx).xy);
/*98*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*99*/	    r4.z = -0.000400 / r4.z;
/*100*/	    r4.z = r4.z + r6.z;
/*101*/	    r8.z = -r8.y + 1.000000;
/*102*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*103*/	    r8.w = -r8.y;
/*104*/	    r10.x = cb1.data[0].z/**/;
/*105*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*106*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*107*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*108*/	    r10.w = -cb1.data[0].w/**/;
/*109*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*110*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*111*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*112*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*113*/	    r8.x = r9.x;
/*114*/	    r8.y = r11.x;
/*115*/	    r8.z = r10.x;
/*116*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*117*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*118*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*119*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*120*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*121*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*122*/	    r4.z = -r6.x + r6.y;
/*123*/	    r4.z = r4.w * r4.z + r6.x;
/*124*/	  } else {
/*125*/	    r4.z = 1.000000;
/*126*/	  }
/*127*/	} else {
/*128*/	  r4.z = 1.000000;
/*129*/	}
/*130*/	r4.w = cb1.data[34].w + -1.000000;
/*131*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*132*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*133*/	if(floatBitsToUint(r2.w) == 0u) {
/*134*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*135*/	  r2.w = floatBitsToInt(r2.w);
/*136*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*137*/	  if(floatBitsToUint(r2.w) != 0u) {
/*138*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*139*/	    r5.w = vsOut_T0.w;
/*140*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*141*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*142*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*143*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*144*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*145*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*146*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*147*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*148*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*149*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*150*/	    if(floatBitsToUint(r5.w) == 0u) {
/*151*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*152*/	      r6.xy = floor((r5.xyxx).xy);
/*153*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*154*/	      r2.w = -0.000400 / r2.w;
/*155*/	      r2.w = r2.w + r5.z;
/*156*/	      r7.z = -r7.y + 1.000000;
/*157*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*158*/	      r7.w = -r7.y;
/*159*/	      r9.x = cb1.data[0].z/**/;
/*160*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*161*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*162*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*163*/	      r9.w = -cb1.data[0].w/**/;
/*164*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*165*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*166*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*167*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*168*/	      r7.x = r8.x;
/*169*/	      r7.y = r10.x;
/*170*/	      r7.z = r9.x;
/*171*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*172*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*173*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*174*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*175*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*176*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*177*/	      r2.w = -r5.x + r5.z;
/*178*/	      r2.w = r5.y * r2.w + r5.x;
/*179*/	    } else {
/*180*/	      r2.w = 1.000000;
/*181*/	    }
/*182*/	  } else {
/*183*/	    r2.w = 1.000000;
/*184*/	  }
/*185*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*186*/	  r5.y = r5.x * cb1.data[34].x;
/*187*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*188*/	  r5.x = r1.w + -r5.x;
/*189*/	  r5.x = saturate(r5.x / r5.y);
/*190*/	  r2.w = -r4.z + r2.w;
/*191*/	  r4.z = r5.x * r2.w + r4.z;
/*192*/	}
/*193*/	if(floatBitsToUint(r4.w) != 0u) {
/*194*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*195*/	  r4.w = r2.w * cb1.data[34].y;
/*196*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*197*/	  r2.w = r1.w + -r2.w;
/*198*/	  r2.w = saturate(r2.w / r4.w);
/*199*/	  r4.y = -r4.z + 1.000000;
/*200*/	  r4.z = r2.w * r4.y + r4.z;
/*201*/	}
/*202*/	r4.z = saturate(r4.z);
/*203*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*204*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*205*/	r2.w = inversesqrt(r2.w);
/*206*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*207*/	r2.w = -r4.x + 1.000000;
/*208*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*209*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*210*/	r4.w = r4.w + r4.w;
/*211*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*212*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*213*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*214*/	r4.w = cos((r8.x));
/*215*/	r4.w = inversesqrt(r4.w);
/*216*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*217*/	r5.w = saturate(r0.w * 60.000000);
/*218*/	r5.w = -r0.w + r5.w;
/*219*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*220*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*221*/	r6.w = inversesqrt(r6.w);
/*222*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*223*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*224*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*225*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*226*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*227*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*228*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*229*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*230*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*231*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*232*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*233*/	r6.w = -r0.w + 1.000000;
/*234*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*235*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*236*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*237*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*238*/	  r6.w = max(r6.w, 0.000000);
/*239*/	  r6.w = log2(r6.w);
/*240*/	  r6.w = r6.w * 10.000000;
/*241*/	  r6.w = exp2(r6.w);
/*242*/	  r6.w = r4.w * r6.w;
/*243*/	  r6.w = r6.w * r5.w + r0.w;
/*244*/	  r7.y = r2.w * 8.000000;
/*245*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*246*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*247*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*248*/	}
/*249*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*250*/	r7.y = max(r6.w, 0.000000);
/*251*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*252*/	if(floatBitsToUint(r6.w) != 0u) {
/*253*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*254*/	  r6.x = max(r6.x, -1.000000);
/*255*/	  r6.x = min(r6.x, 1.000000);
/*256*/	  r6.y = -abs(r6.x) + 1.000000;
/*257*/	  r6.y = sqrt(r6.y);
/*258*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*259*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*260*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*261*/	  r6.w = r6.y * r6.z;
/*262*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*263*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*264*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*265*/	  r6.x = r6.z * r6.y + r6.x;
/*266*/	  r4.x = r4.x * r4.x;
/*267*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*268*/	  r4.x = r4.x * r4.y + r7.x;
/*269*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*270*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*271*/	  r4.y = -r4.x * r4.x + 1.000000;
/*272*/	  r4.y = max(r4.y, 0.001000);
/*273*/	  r4.y = log2(r4.y);
/*274*/	  r6.y = r4.y * 4.950617;
/*275*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*276*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*277*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*278*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*279*/	  r4.x = floatBitsToInt(r4.x);
/*280*/	  r6.y = r4.y * r4.y + -r6.y;
/*281*/	  r6.y = sqrt(r6.y);
/*282*/	  r4.y = -r4.y + r6.y;
/*283*/	  r4.y = max(r4.y, 0.000000);
/*284*/	  r4.y = sqrt(r4.y);
/*285*/	  r4.x = r4.y * r4.x;
/*286*/	  r4.x = r4.x * 1.414214;
/*287*/	  r4.x = 0.008727 / r4.x;
/*288*/	  r4.x = max(r4.x, 0.000100);
/*289*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*290*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*291*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*292*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*293*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*294*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*295*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*296*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*297*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*298*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*299*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*300*/	  r4.x = floatBitsToInt(r4.x);
/*301*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*302*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*303*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*304*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*305*/	  r4.x = r4.x * r6.x + 1.000000;
/*306*/	  r4.x = r4.x * 0.500000;
/*307*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*308*/	  r4.y = r4.y * r6.y + 1.000000;
/*309*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*310*/	  r4.y = min(r7.y, 1.000000);
/*311*/	  r2.w = r2.w * 1.570796;
/*312*/	  r2.w = sin(r2.w);
/*313*/	  r4.y = r4.y + -1.000000;
/*314*/	  r2.w = r2.w * r4.y + 1.000000;
/*315*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*316*/	  r4.y = max(r4.y, 0.000000);
/*317*/	  r4.y = log2(r4.y);
/*318*/	  r4.y = r4.y * 10.000000;
/*319*/	  r4.y = exp2(r4.y);
/*320*/	  r4.y = r4.w * r4.y;
/*321*/	  r4.y = r4.y * r5.w + r0.w;
/*322*/	  r2.w = r2.w * abs(r4.x);
/*323*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*324*/	} else {
/*325*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*326*/	}
/*327*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*328*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*329*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*330*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*331*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*332*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*333*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*334*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*335*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*336*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*337*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*338*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*339*/	r2.w = inversesqrt(r2.w);
/*340*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*341*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*342*/	r2.w = r2.w + r2.w;
/*343*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*344*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*345*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*346*/	r2.x = max(r2.x, 0.000000);
/*347*/	r2.x = log2(r2.x);
/*348*/	r2.x = r2.x * 10.000000;
/*349*/	r2.x = exp2(r2.x);
/*350*/	r2.x = r4.w * r2.x;
/*351*/	r0.w = r2.x * r5.w + r0.w;
/*352*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*353*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*354*/	color0.w = 2.000000;
/*355*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*356*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*357*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*358*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*359*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*360*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*361*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*362*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*363*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*364*/	if(r0.x != 0) discard;
/*365*/	color1.x = 1.000000;
/*366*/	return;
}
