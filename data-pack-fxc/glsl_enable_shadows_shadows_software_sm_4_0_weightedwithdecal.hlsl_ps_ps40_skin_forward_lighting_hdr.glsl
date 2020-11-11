//
//
// Shader Model 4
// Fragment Shader
//
// id: 6069 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecal.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;
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
  vec4 r12;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb4.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb4.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb4.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r1.z = sqrt(r0.w);
/*18*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*19*/	r2.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*20*/	r3.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*21*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*22*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*23*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*24*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*25*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*27*/	r3.z = vsOut_T6.z;
/*28*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*29*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*30*/	if(floatBitsToUint(r0.w) != 0u) {
/*31*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*32*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*33*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*34*/	  r0.w = -r0.w + 1.000000;
/*35*/	  r0.w = max(r0.w, 0.000000);
/*36*/	  r3.z = sqrt(r0.w);
/*37*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*38*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*39*/	  r0.w = r2.x * r6.w;
/*40*/	  r2.x = r0.w * -0.500000 + r2.x;
/*41*/	  r0.w = -r4.w * r5.w + 1.000000;
/*42*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*43*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*44*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*45*/	}
/*46*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*47*/	r0.w = inversesqrt(r0.w);
/*48*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*49*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*52*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*53*/	r0.w = inversesqrt(r0.w);
/*54*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*55*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*56*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*57*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*58*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*59*/	r0.w = inversesqrt(r0.w);
/*60*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*61*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*62*/	r1.w = -vsOut_T4.z + 1.000000;
/*63*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*64*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*65*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*66*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*67*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*68*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*69*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*70*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*71*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*72*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*73*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*74*/	r5.w = 1.000000;
/*75*/	r2.x = dot(r5.xyzw, cb0.data[12].xyzw);
/*76*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*77*/	r7.x = uintBitsToFloat((r2.x >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*78*/	r7.y = uintBitsToFloat((r2.x >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*79*/	r7.z = uintBitsToFloat((r2.x >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*80*/	r7.w = uintBitsToFloat((r2.x >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*81*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*82*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*83*/	r2.w = intBitsToFloat(int(r2.z));
/*84*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*85*/	if(floatBitsToUint(r3.w) != 0u) {
/*86*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*87*/	  r6.w = vsOut_T0.w;
/*88*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*89*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*90*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*91*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*92*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*93*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*94*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*95*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*96*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*97*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*98*/	  if(floatBitsToUint(r4.w) == 0u) {
/*99*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*100*/	    r8.xy = floor((r7.xyxx).xy);
/*101*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*102*/	    r3.w = -0.000400 / r3.w;
/*103*/	    r3.w = r3.w + r7.z;
/*104*/	    r9.z = -r9.y + 1.000000;
/*105*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*106*/	    r9.w = -r9.y;
/*107*/	    r11.x = cb1.data[0].z/**/;
/*108*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*109*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*110*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*111*/	    r11.w = -cb1.data[0].w/**/;
/*112*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*113*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*114*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*115*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*116*/	    r9.x = r10.x;
/*117*/	    r9.y = r12.x;
/*118*/	    r9.z = r11.x;
/*119*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*120*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*121*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*122*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*123*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*124*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*125*/	    r3.w = -r7.x + r7.z;
/*126*/	    r3.w = r7.y * r3.w + r7.x;
/*127*/	  } else {
/*128*/	    r3.w = 1.000000;
/*129*/	  }
/*130*/	} else {
/*131*/	  r3.w = 1.000000;
/*132*/	}
/*133*/	r4.w = cb1.data[34].w + -1.000000;
/*134*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*135*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*136*/	if(floatBitsToUint(r2.z) == 0u) {
/*137*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*138*/	  r2.z = floatBitsToInt(r2.z);
/*139*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*140*/	  if(floatBitsToUint(r2.z) != 0u) {
/*141*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*142*/	    r6.w = vsOut_T0.w;
/*143*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*144*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*145*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*146*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*147*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*148*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*149*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*150*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*151*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*152*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*153*/	    if(floatBitsToUint(r6.w) == 0u) {
/*154*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*155*/	      r7.xy = floor((r6.xyxx).xy);
/*156*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*157*/	      r2.z = -0.000400 / r2.z;
/*158*/	      r2.z = r2.z + r6.z;
/*159*/	      r8.z = -r8.y + 1.000000;
/*160*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*161*/	      r8.w = -r8.y;
/*162*/	      r10.x = cb1.data[0].z/**/;
/*163*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*164*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*165*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*166*/	      r10.w = -cb1.data[0].w/**/;
/*167*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*168*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*169*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*170*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*171*/	      r8.x = r9.x;
/*172*/	      r8.y = r11.x;
/*173*/	      r8.z = r10.x;
/*174*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*175*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*176*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*177*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*178*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*179*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*180*/	      r2.z = -r6.x + r6.z;
/*181*/	      r2.z = r6.y * r2.z + r6.x;
/*182*/	    } else {
/*183*/	      r2.z = 1.000000;
/*184*/	    }
/*185*/	  } else {
/*186*/	    r2.z = 1.000000;
/*187*/	  }
/*188*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*189*/	  r6.y = r6.x * cb1.data[34].x;
/*190*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*191*/	  r6.x = r2.x + -r6.x;
/*192*/	  r6.x = saturate(r6.x / r6.y);
/*193*/	  r2.z = -r3.w + r2.z;
/*194*/	  r3.w = r6.x * r2.z + r3.w;
/*195*/	}
/*196*/	if(floatBitsToUint(r4.w) != 0u) {
/*197*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*198*/	  r4.w = r2.z * cb1.data[34].y;
/*199*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*200*/	  r2.z = -r2.z + r2.x;
/*201*/	  r2.z = saturate(r2.z / r4.w);
/*202*/	  r2.w = -r3.w + 1.000000;
/*203*/	  r3.w = r2.z * r2.w + r3.w;
/*204*/	}
/*205*/	r3.w = saturate(r3.w);
/*206*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*207*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*208*/	r2.z = inversesqrt(r2.z);
/*209*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*210*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*211*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*212*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*213*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*214*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*215*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*216*/	r2.w = r2.z * r8.x + 0.300000;
/*217*/	r2.w = saturate(-r2.w + 1.000000);
/*218*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*219*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*220*/	r4.w = -r2.z * r8.x + 1.000000;
/*221*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*222*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*223*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*224*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*225*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*226*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*227*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*228*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*229*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*230*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*231*/	r2.w = saturate(r2.z);
/*232*/	r2.w = r2.w * r2.w;
/*233*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*234*/	r4.w = r4.w * r4.w;
/*235*/	r4.w = r4.w * r4.w;
/*236*/	r2.w = r2.w * r4.w;
/*237*/	r2.w = r4.z * r2.w;
/*238*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*239*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*240*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*241*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*242*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*243*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*244*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*245*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*246*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*247*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*248*/	r2.w = inversesqrt(r2.w);
/*249*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*250*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*251*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*252*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*253*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*254*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*255*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*256*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*257*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*258*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*259*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*260*/	r2.w = r7.z * r7.x;
/*261*/	r2.y = r2.y * r2.y;
/*262*/	r2.z = r2.z + r2.z;
/*263*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*264*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*265*/	r2.z = max(r2.z, 0.000000);
/*266*/	r2.y = r2.y * 127.000000 + 1.600000;
/*267*/	r2.z = log2(r2.z);
/*268*/	r2.y = r2.z * r2.y;
/*269*/	r2.y = exp2(r2.y);
/*270*/	r2.y = min(r2.y, 1.000000);
/*271*/	r1.w = r1.w * r2.y;
/*272*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*273*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*274*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*275*/	r2.y = r1.w + r1.w;
/*276*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*277*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*278*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*279*/	r2.y = inversesqrt(r2.y);
/*280*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*281*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*282*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*283*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*284*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*285*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*286*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*287*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*288*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*289*/	r1.w = saturate(-r1.w + 1.000000);
/*290*/	r1.w = r1.w * r1.w;
/*291*/	r1.w = r4.x * r1.w;
/*292*/	r1.w = r1.w * 1.500000;
/*293*/	r1.w = r7.w * r1.w;
/*294*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*295*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*296*/	r0.w = inversesqrt(r0.w);
/*297*/	r0.w = r0.w * r1.y;
/*298*/	r0.w = max(r0.w, 0.000000);
/*299*/	r0.w = r0.w * r1.w;
/*300*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*301*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*302*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*303*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*304*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*305*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*306*/	r0.xy = (r0.xyxx / r2.xxxx).xy;
/*307*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*308*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*309*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*310*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*311*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*312*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*313*/	if(r0.x != 0) discard;
/*314*/	color0.w = 1.000000;
/*315*/	color1.x = 1.000000;
/*316*/	return;
}
