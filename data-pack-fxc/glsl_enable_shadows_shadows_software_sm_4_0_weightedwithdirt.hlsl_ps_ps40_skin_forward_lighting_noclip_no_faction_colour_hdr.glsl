//
//
// Shader Model 4
// Fragment Shader
//
// id: 6008 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirt.hlsl_PS_ps40_skin_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_skin_mask_map;
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r2.z = sqrt(r0.w);
/*8*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*11*/	r5.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*12*/	r1.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*13*/	r0.w = r4.w * r5.w;
/*14*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*15*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*16*/	r2.xy = (r1.zwzz * r4.wwww + r1.xyxx).xy;
/*17*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*18*/	r0.w = inversesqrt(r0.w);
/*19*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*20*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*21*/	r0.w = inversesqrt(r0.w);
/*22*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*23*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*26*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*27*/	r0.w = inversesqrt(r0.w);
/*28*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*29*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*30*/	r1.xyw = (r1.xxxx * r2.xyxz + r4.xyxz).xyw;
/*31*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*32*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*33*/	r0.w = inversesqrt(r0.w);
/*34*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*35*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*36*/	r1.w = vsOut_T7.x * -r3.y + r3.y;
/*37*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*38*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*39*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*40*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*41*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*42*/	r0.xyz = (vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*43*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*44*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*45*/	r5.w = 1.000000;
/*46*/	r2.w = dot(r5.xyzw, cb0.data[12].xyzw);
/*47*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*48*/	r7.x = uintBitsToFloat((r2.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*49*/	r7.y = uintBitsToFloat((r2.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*50*/	r7.z = uintBitsToFloat((r2.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*51*/	r7.w = uintBitsToFloat((r2.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*52*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*53*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*54*/	r3.z = intBitsToFloat(int(r3.y));
/*55*/	r3.w = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*56*/	if(floatBitsToUint(r3.w) != 0u) {
/*57*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*58*/	  r6.w = vsOut_T0.w;
/*59*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*60*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*61*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*62*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*63*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*64*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*65*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*66*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*67*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*68*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*69*/	  if(floatBitsToUint(r4.w) == 0u) {
/*70*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*71*/	    r8.xy = floor((r7.xyxx).xy);
/*72*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*73*/	    r3.w = -0.000400 / r3.w;
/*74*/	    r3.w = r3.w + r7.z;
/*75*/	    r9.z = -r9.y + 1.000000;
/*76*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*77*/	    r9.w = -r9.y;
/*78*/	    r11.x = cb1.data[0].z/**/;
/*79*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*80*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*81*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*82*/	    r11.w = -cb1.data[0].w/**/;
/*83*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*84*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*85*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*86*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*87*/	    r9.x = r10.x;
/*88*/	    r9.y = r12.x;
/*89*/	    r9.z = r11.x;
/*90*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*91*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*92*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*93*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*94*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*95*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*96*/	    r3.w = -r7.x + r7.z;
/*97*/	    r3.w = r7.y * r3.w + r7.x;
/*98*/	  } else {
/*99*/	    r3.w = 1.000000;
/*100*/	  }
/*101*/	} else {
/*102*/	  r3.w = 1.000000;
/*103*/	}
/*104*/	r4.w = cb1.data[34].w + -1.000000;
/*105*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*106*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*107*/	if(floatBitsToUint(r3.y) == 0u) {
/*108*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*109*/	  r3.y = floatBitsToInt(r3.y);
/*110*/	  r3.y = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*111*/	  if(floatBitsToUint(r3.y) != 0u) {
/*112*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*113*/	    r6.w = vsOut_T0.w;
/*114*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+6u].xyzw);
/*115*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+7u].xyzw);
/*116*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+8u].xyzw);
/*117*/	    r3.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+9u].xyzw);
/*118*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*119*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*120*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*121*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*122*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*123*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*124*/	    if(floatBitsToUint(r6.w) == 0u) {
/*125*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*126*/	      r7.xy = floor((r6.xyxx).xy);
/*127*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*128*/	      r3.y = -0.000400 / r3.y;
/*129*/	      r3.y = r3.y + r6.z;
/*130*/	      r8.z = -r8.y + 1.000000;
/*131*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*132*/	      r8.w = -r8.y;
/*133*/	      r10.x = cb1.data[0].z/**/;
/*134*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*135*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*136*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*137*/	      r10.w = -cb1.data[0].w/**/;
/*138*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*139*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*140*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*141*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*142*/	      r8.x = r9.x;
/*143*/	      r8.y = r11.x;
/*144*/	      r8.z = r10.x;
/*145*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.yyyy, r8.xyzw)) * 0xffffffffu);
/*146*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*147*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*148*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*149*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*150*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*151*/	      r3.y = -r6.x + r6.z;
/*152*/	      r3.y = r6.y * r3.y + r6.x;
/*153*/	    } else {
/*154*/	      r3.y = 1.000000;
/*155*/	    }
/*156*/	  } else {
/*157*/	    r3.y = 1.000000;
/*158*/	  }
/*159*/	  r6.x = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*160*/	  r6.y = r6.x * cb1.data[34].x;
/*161*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*162*/	  r6.x = r2.w + -r6.x;
/*163*/	  r6.x = saturate(r6.x / r6.y);
/*164*/	  r3.y = -r3.w + r3.y;
/*165*/	  r3.w = r6.x * r3.y + r3.w;
/*166*/	}
/*167*/	if(floatBitsToUint(r4.w) != 0u) {
/*168*/	  r3.y = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*169*/	  r4.w = r3.y * cb1.data[34].y;
/*170*/	  r3.y = -r3.y * cb1.data[34].y + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*171*/	  r3.y = r2.w + -r3.y;
/*172*/	  r3.y = saturate(r3.y / r4.w);
/*173*/	  r3.z = -r3.w + 1.000000;
/*174*/	  r3.w = r3.y * r3.z + r3.w;
/*175*/	}
/*176*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*177*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*178*/	r3.y = inversesqrt(r3.y);
/*179*/	r6.xyz = (r3.yyyy * r6.xyzx).xyz;
/*180*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*181*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)));
/*182*/	r3.y = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*183*/	r8.xyz = (r3.yyyy * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*184*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*185*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*186*/	r3.z = r3.y * r8.x + 0.300000;
/*187*/	r3.z = saturate(-r3.z + 1.000000);
/*188*/	r10.xyz = (r3.zzzz * r9.xyzx).xyz;
/*189*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*190*/	r4.w = -r3.y * r8.x + 1.000000;
/*191*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*192*/	r9.xyz = (-r9.xyzx * r3.zzzz + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*193*/	r10.xyz = (r3.yyyy * r8.xxxx + r10.xyzx).xyz;
/*194*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*195*/	r8.xyz = (-r3.yyyy + r8.xyzx).xyz;
/*196*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r3.yyyy).xyz;
/*197*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*198*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*199*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*200*/	r3.y = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*201*/	r3.zw = saturate(r3.yyyw).zw;
/*202*/	r3.z = r3.z * r3.z;
/*203*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*204*/	r4.w = r4.w * r4.w;
/*205*/	r4.w = r4.w * r4.w;
/*206*/	r3.z = r3.z * r4.w;
/*207*/	r3.z = r4.z * r3.z;
/*208*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*209*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*210*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*211*/	r4.yzw = (r3.zzzz * r4.yyzw).yzw;
/*212*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*213*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*214*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*215*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*216*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*217*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*218*/	r3.z = inversesqrt(r3.z);
/*219*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*220*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*221*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*222*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*223*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*224*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*225*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*226*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*227*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*228*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*229*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*230*/	r3.z = r7.z * r7.x;
/*231*/	r3.x = r3.x * r3.x;
/*232*/	r3.y = r3.y + r3.y;
/*233*/	r8.xyz = (r2.xyzx * -r3.yyyy + cb2.data[0].yzwy).xyz;
/*234*/	r3.y = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*235*/	r3.y = max(r3.y, 0.000000);
/*236*/	r3.x = r3.x * 127.000000 + 1.600000;
/*237*/	r3.y = log2(r3.y);
/*238*/	r3.x = r3.y * r3.x;
/*239*/	r3.x = exp2(r3.x);
/*240*/	r3.x = min(r3.x, 1.000000);
/*241*/	r1.w = r1.w * r3.x;
/*242*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*243*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*244*/	r1.w = dot(vec3(-r6.xyzx), vec3(r2.xyzx));
/*245*/	r3.x = r1.w + r1.w;
/*246*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r6.xyzx).xyz;
/*247*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*248*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*249*/	r3.x = inversesqrt(r3.x);
/*250*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*251*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*252*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*253*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*254*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*255*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*256*/	r6.xyz = (r6.xywx * r2.yyyy).xyz;
/*257*/	r6.xyz = (r2.xxxx * r8.xyzx + r6.xyzx).xyz;
/*258*/	r2.xyz = (r2.zzzz * r9.xyzx + r6.xyzx).xyz;
/*259*/	r1.w = saturate(-r1.w + 1.000000);
/*260*/	r1.w = r1.w * r1.w;
/*261*/	r1.w = r4.x * r1.w;
/*262*/	r1.w = r1.w * 1.500000;
/*263*/	r1.w = r7.w * r1.w;
/*264*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*265*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*266*/	r0.w = inversesqrt(r0.w);
/*267*/	r0.w = r0.w * r1.y;
/*268*/	r0.w = max(r0.w, 0.000000);
/*269*/	r0.w = r0.w * r1.w;
/*270*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*271*/	r0.xyz = (r0.xyzx * r3.zzzz + r1.xyzx).xyz;
/*272*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*273*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*274*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*275*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*276*/	r0.xy = (r0.xyxx / r2.wwww).xy;
/*277*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*278*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*279*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*280*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*281*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*282*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*283*/	if(r0.x != 0) discard;
/*284*/	color0.w = 1.000000;
/*285*/	color1.x = 1.000000;
/*286*/	return;
}
