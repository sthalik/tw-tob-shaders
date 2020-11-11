//
//
// Shader Model 4
// Fragment Shader
//
// id: 278 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_DirectionalLight.hlsl_PS_ps30_slm_highdef.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_1_sampler;
uniform sampler2D gbuffer_channel_2_sampler;
uniform sampler2D gbuffer_channel_3_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D sHardShadowBuffer;
uniform sampler2D s_ssao;
uniform samplerCube s_environment;
uniform sampler2D s_overlay;
uniform sampler2D s_shroud;

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
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb3;
layout(std140) uniform directional_light_PS
{
  vec4 data[5];
} cb4;

void main()
{
  color0 = vec4(0);
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

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw).zw;
/*2*/	r0.xy = (r0.xyxx * cb0.data[29].zwzz).xy;
/*3*/	r1.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.zwzz.st, r0.w)).xyzw;
/*4*/	r2.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.zwzz.st, r0.w)).xyzw;
/*5*/	r3.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.zwzz.st, r0.w)).xyzw;
/*6*/	r4.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, r0.w)).yzxw;
/*7*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*8*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*9*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*10*/	r0.z = inversesqrt(r0.z);
/*11*/	r1.xyz = (r0.zzzz * r1.xyzx).xyz;
/*12*/	r0.z = r3.w * 255.000000 + 0.500000;
/*13*/	r0.z = floor(r0.z);
/*14*/	r0.z = uintBitsToFloat(uint(r0.z));
/*15*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*16*/	r4.w = 1.000000;
/*17*/	r5.x = dot(r4.xyzw, cb0.data[21].xyzw);
/*18*/	r5.y = dot(r4.xyzw, cb0.data[22].xyzw);
/*19*/	r5.z = dot(r4.xyzw, cb0.data[23].xyzw);
/*20*/	r0.x = dot(r4.xyzw, cb0.data[24].xyzw);
/*21*/	r4.xyz = (r5.xyzx / r0.xxxx).xyz;
/*22*/	r4.w = 1.000000;
/*23*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*24*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*25*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*26*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r4.xyzx).xyz;
/*27*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*28*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*29*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*30*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*31*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*32*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*33*/	r4.w = intBitsToFloat(int(r3.w));
/*34*/	r6.x = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*35*/	if(floatBitsToUint(r6.x) != 0u) {
/*36*/	  r6.x = intBitsToFloat(floatBitsToInt(r4.w) << int(2));
/*37*/	  r5.w = 1.000000;
/*38*/	  r7.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r6.x)+2u].xyzw);
/*39*/	  r7.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r6.x)+3u].xyzw);
/*40*/	  r7.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r6.x)+4u].xyzw);
/*41*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r6.x)+5u].xyzw);
/*42*/	  r6.yzw = (r7.xxyz / r6.xxxx).yzw;
/*43*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.yzyy, cb1.data[floatBitsToUint(r4.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*44*/	  r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*45*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.w)+41u].zzwz, r6.yyzy)) * 0xffffffffu)).yz;
/*46*/	  r7.y = uintBitsToFloat(floatBitsToUint(r7.z) | floatBitsToUint(r7.y));
/*47*/	  r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*48*/	  if(floatBitsToUint(r7.x) == 0u) {
/*49*/	    r6.yz = (r6.yyzy * cb1.data[0].xxyx + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*50*/	    r7.xy = floor((r6.yzyy).xy);
/*51*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*52*/	    r6.x = -0.000400 / r6.x;
/*53*/	    r6.x = r6.x + r6.w;
/*54*/	    r8.z = -r8.y + 1.000000;
/*55*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*56*/	    r8.w = -r8.y;
/*57*/	    r10.x = cb1.data[0].z/**/;
/*58*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*59*/	    r7.zw = (r8.xxxw + r10.xxxy).zw;
/*60*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*61*/	    r10.w = -cb1.data[0].w/**/;
/*62*/	    r7.zw = (r8.xxxz + r10.zzzw).zw;
/*63*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*64*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*65*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*66*/	    r8.x = r9.x;
/*67*/	    r8.y = r11.x;
/*68*/	    r8.z = r10.x;
/*69*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r6.xxxx, r8.xyzw)) * 0xffffffffu);
/*70*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*71*/	    r6.xy = (r6.yzyy + -r7.xyxx).xy;
/*72*/	    r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*73*/	    r6.zw = (r6.zzzw + r9.yyyw).zw;
/*74*/	    r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*75*/	    r6.z = -r6.x + r6.z;
/*76*/	    r6.x = r6.y * r6.z + r6.x;
/*77*/	  } else {
/*78*/	    r6.x = 1.000000;
/*79*/	  }
/*80*/	} else {
/*81*/	  r6.x = 1.000000;
/*82*/	}
/*83*/	r6.y = cb1.data[34].w + -1.000000;
/*84*/	r3.w = uintBitsToFloat((r3.w == r6.y) ? 0xffffffffu : 0x00000000u);
/*85*/	r6.y = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*86*/	if(floatBitsToUint(r3.w) == 0u) {
/*87*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.w) + int(1));
/*88*/	  r3.w = floatBitsToInt(r3.w);
/*89*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*90*/	  if(floatBitsToUint(r3.w) != 0u) {
/*91*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.w) << int(2));
/*92*/	    r5.w = 1.000000;
/*93*/	    r7.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*94*/	    r7.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*95*/	    r7.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*96*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*97*/	    r5.xyz = (r7.xyzx / r3.wwww).xyz;
/*98*/	    r6.zw = (uintBitsToFloat(uvec4(lessThan(r5.xxxy, cb1.data[floatBitsToUint(r4.w)+42u].xxxy)) * 0xffffffffu)).zw;
/*99*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r6.z));
/*100*/	    r6.zw = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.w)+42u].zzzw, r5.xxxy)) * 0xffffffffu)).zw;
/*101*/	    r6.z = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r6.z));
/*102*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.z));
/*103*/	    if(floatBitsToUint(r5.w) == 0u) {
/*104*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*105*/	      r6.zw = floor((r5.xxxy).zw);
/*106*/	      r7.xy = (r6.zwzz / cb1.data[0].xyxx).xy;
/*107*/	      r3.w = -0.000400 / r3.w;
/*108*/	      r3.w = r3.w + r5.z;
/*109*/	      r7.z = -r7.y + 1.000000;
/*110*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*111*/	      r7.w = -r7.y;
/*112*/	      r9.x = cb1.data[0].z/**/;
/*113*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*114*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*115*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*116*/	      r9.w = -cb1.data[0].w/**/;
/*117*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*118*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*119*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*120*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*121*/	      r7.x = r8.x;
/*122*/	      r7.y = r10.x;
/*123*/	      r7.z = r9.x;
/*124*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*125*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*126*/	      r5.xy = (r5.xyxx + -r6.zwzz).xy;
/*127*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*128*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*129*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*130*/	      r3.w = -r5.x + r5.z;
/*131*/	      r3.w = r5.y * r3.w + r5.x;
/*132*/	    } else {
/*133*/	      r3.w = 1.000000;
/*134*/	    }
/*135*/	  } else {
/*136*/	    r3.w = 1.000000;
/*137*/	  }
/*138*/	  r5.x = -cb1.data[floatBitsToUint(r4.w)+36u].x + cb1.data[floatBitsToUint(r4.w)+37u].x;
/*139*/	  r5.y = r5.x * cb1.data[34].x;
/*140*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.w)+37u].x;
/*141*/	  r5.x = r0.w + -r5.x;
/*142*/	  r5.x = saturate(r5.x / r5.y);
/*143*/	  r3.w = -r6.x + r3.w;
/*144*/	  r6.x = r5.x * r3.w + r6.x;
/*145*/	}
/*146*/	if(floatBitsToUint(r6.y) != 0u) {
/*147*/	  r3.w = -cb1.data[floatBitsToUint(r4.w)+36u].x + cb1.data[floatBitsToUint(r4.w)+37u].x;
/*148*/	  r5.x = r3.w * cb1.data[34].y;
/*149*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.w)+37u].x;
/*150*/	  r3.w = r0.w + -r3.w;
/*151*/	  r3.w = saturate(r3.w / r5.x);
/*152*/	  r4.w = -r6.x + 1.000000;
/*153*/	  r6.x = r3.w * r4.w + r6.x;
/*154*/	}
/*155*/	r6.x = saturate(r6.x);
/*156*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*157*/	r5.xy = (r0.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*158*/	r5.z = -r5.y + 1.000000;
/*159*/	r5.xyzw = (texture(s_ssao, r5.xzxx.st)).xyzw;
/*160*/	r0.xyw = (r4.xyxz + -cb0.data[0].xyxz).xyw;
/*161*/	r3.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*162*/	r3.w = inversesqrt(r3.w);
/*163*/	r0.xyw = (r0.xyxw * r3.wwww).xyw;
/*164*/	r3.w = -r1.w + 1.000000;
/*165*/	r4.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*166*/	r5.y = dot(vec3(r0.xywx), vec3(r1.xyzx));
/*167*/	r5.y = r5.y + r5.y;
/*168*/	r5.yzw = (r1.xxyz * -r5.yyyy + r0.xxyw).yzw;
/*169*/	r6.yzw = (mix(vec4(0, 1.000000, 1.000000, 273.000000), vec4(0, 0.004000, 360.000000, 1.000000), greaterThan(floatBitsToUint(r4.wwww), uvec4(0)))).yzw;
/*170*/	r7.x = r3.w * 1.539380;
/*171*/	r7.x = cos((r7.x));
/*172*/	r7.x = inversesqrt(r7.x);
/*173*/	r7.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r7.x)).x;
/*174*/	r7.y = saturate(r2.w * 60.000000);
/*175*/	r7.y = -r2.w + r7.y;
/*176*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*177*/	r7.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*178*/	r7.z = inversesqrt(r7.z);
/*179*/	r8.xyz = (r7.zzzz * r8.xyzx).xyz;
/*180*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*181*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*182*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*183*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*184*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*185*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*186*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*187*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*188*/	r8.xyz = (r6.zzzz * r8.xyzx).xyz;
/*189*/	r8.xyz = (r2.xyzx * r8.xyzx).xyz;
/*190*/	r6.z = -r2.w + 1.000000;
/*191*/	r8.xyz = (r6.zzzz * r8.xyzx).xyz;
/*192*/	r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*193*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*194*/	  r6.z = dot(vec3(r5.yzwy), vec3(r0.xywx));
/*195*/	  r6.z = max(r6.z, 0.000000);
/*196*/	  r6.z = log2(r6.z);
/*197*/	  r6.z = r6.z * 10.000000;
/*198*/	  r6.z = exp2(r6.z);
/*199*/	  r6.z = r7.x * r6.z;
/*200*/	  r6.z = r6.z * r7.y + r2.w;
/*201*/	  r7.z = r3.w * 8.000000;
/*202*/	  r9.xyzw = (textureLod(s_environment, r5.yzwy.stp, r7.z)).xyzw;
/*203*/	  r9.xyz = (r6.zzzz * r9.xyzx).xyz;
/*204*/	  r9.xyz = (r9.xyzx * r3.xyzx + r8.xyzx).xyz;
/*205*/	  r9.xyz = (r5.xxxx * r9.xyzx).xyz;
/*206*/	} else {
/*207*/	  r9.xyz = (r5.xxxx * r8.xyzx).xyz;
/*208*/	}
/*209*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*210*/	r1.y = max(r1.x, 0.000000);
/*211*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*212*/	if(floatBitsToUint(r1.x) != 0u) {
/*213*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*214*/	  r1.x = max(r1.x, -1.000000);
/*215*/	  r1.x = min(r1.x, 1.000000);
/*216*/	  r1.z = -abs(r1.x) + 1.000000;
/*217*/	  r1.z = sqrt(r1.z);
/*218*/	  r5.x = abs(r1.x) * -0.018729 + 0.074261;
/*219*/	  r5.x = r5.x * abs(r1.x) + -0.212114;
/*220*/	  r5.x = r5.x * abs(r1.x) + 1.570729;
/*221*/	  r5.y = r1.z * r5.x;
/*222*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*223*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*224*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.y));
/*225*/	  r1.x = r5.x * r1.z + r1.x;
/*226*/	  r1.z = r1.w * r1.w;
/*227*/	    r1.w = (floatBitsToUint(r4.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*228*/	  r1.z = r1.z * r1.w + r6.y;
/*229*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*230*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*231*/	  r1.w = -r1.z * r1.z + 1.000000;
/*232*/	  r1.w = max(r1.w, 0.001000);
/*233*/	  r1.w = log2(r1.w);
/*234*/	  r4.w = r1.w * 4.950617;
/*235*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*236*/	  r5.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*237*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*238*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.x) + floatBitsToInt(r1.z));
/*239*/	  r1.z = floatBitsToInt(r1.z);
/*240*/	  r4.w = r1.w * r1.w + -r4.w;
/*241*/	  r4.w = sqrt(r4.w);
/*242*/	  r1.w = -r1.w + r4.w;
/*243*/	  r1.w = max(r1.w, 0.000000);
/*244*/	  r1.w = sqrt(r1.w);
/*245*/	  r1.z = r1.w * r1.z;
/*246*/	  r1.z = r1.z * 1.414214;
/*247*/	  r1.z = 0.008727 / r1.z;
/*248*/	  r1.z = max(r1.z, 0.000100);
/*249*/	  r1.xw = (r1.xxxx + vec4(-0.008727, 0.000000, 0.000000, 0.008727)).xw;
/*250*/	  r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*251*/	  r1.xz = (r1.zzzz * r1.xxwx).xz;
/*252*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*253*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*254*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*255*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*256*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*257*/	  r1.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*258*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*259*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r1.z) + floatBitsToInt(r1.x));
/*260*/	  r1.x = floatBitsToInt(r1.x);
/*261*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*262*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*263*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*264*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*265*/	  r1.x = r1.x * r5.x + 1.000000;
/*266*/	  r1.x = r1.x * 0.500000;
/*267*/	  r1.z = 1 + ~floatBitsToInt(r1.w);
/*268*/	  r1.z = r1.z * r5.y + 1.000000;
/*269*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*270*/	  r1.z = min(r1.y, 1.000000);
/*271*/	  r1.w = r3.w * 1.570796;
/*272*/	  r1.w = sin(r1.w);
/*273*/	  r1.z = r1.z + -1.000000;
/*274*/	  r1.z = r1.w * r1.z + 1.000000;
/*275*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r0.xywx));
/*276*/	  r0.x = max(r0.x, 0.000000);
/*277*/	  r0.x = log2(r0.x);
/*278*/	  r0.x = r0.x * 10.000000;
/*279*/	  r0.x = exp2(r0.x);
/*280*/	  r0.x = r7.x * r0.x;
/*281*/	  r0.x = r0.x * r7.y + r2.w;
/*282*/	  r0.y = r1.z * abs(r1.x);
/*283*/	  r0.xyw = (r0.xxxx * r0.yyyy).xyw;
/*284*/	} else {
/*285*/	  r0.xyw = (vec4(0, 0, 0, 0)).xyw;
/*286*/	}
/*287*/	r1.xzw = saturate(r6.wwww * r0.xxyw).xzw;
/*288*/	r1.xzw = (r3.xxyz * r1.xxzw).xzw;
/*289*/	r0.xyw = (max(r2.wwww, r0.xyxw)).xyw;
/*290*/	r0.xyw = (-r0.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*291*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*292*/	r2.xyz = (r2.xyzx * cb2.data[1].xyzx).xyz;
/*293*/	r0.xyw = (r0.xyxw * r2.xyxz).xyw;
/*294*/	r0.xyw = (r6.yyyy * r0.xyxw).xyw;
/*295*/	r0.xyw = (r1.xzxw * cb2.data[1].xyxz + r0.xyxw).xyw;
/*296*/	r0.xyw = (r6.xxxx * r0.xyxw + r9.xyxz).xyw;
/*297*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.z) & uint(1));
/*298*/	if(floatBitsToUint(r0.z) != 0u) {
/*299*/	  r1.xyz = (r4.yyyy * vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*300*/	  r1.xyz = (r1.xyzx / vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*301*/	  r1.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*302*/	  r1.w = 1.000000;
/*303*/	  r2.x = dot(r1.xyzw, cb4.data[0].xyzw);
/*304*/	  r2.y = dot(r1.xyzw, cb4.data[1].xyzw);
/*305*/	  r0.z = dot(r1.xyzw, cb4.data[3].xyzw);
/*306*/	  r1.xy = (r2.xyxx / r0.zzzz).xy;
/*307*/	  r1.yz = (r1.xxyx * vec4(0.000000, 0.500000, -0.500000, 0.000000) + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*308*/	  r1.xw = (-r1.zzzz + vec4(1.000000, 0.000000, 0.000000, 1.000000)).xw;
/*309*/	  r1.xyzw = (textureLod(s_overlay, r1.ywyy.st, r1.x)).xyzw;
/*310*/	  r0.z = uintBitsToFloat((0.500000 < cb3.data[0].x) ? 0xffffffffu : 0x00000000u);
/*311*/	  if(floatBitsToUint(r0.z) != 0u) {
/*312*/	    r2.xyzw = r4.xzxz + -cb3.data[1].xyxy;
/*313*/	    r3.xyzw = -cb3.data[1].xyxy + cb3.data[1].zwzw;
/*314*/	    r2.xyzw = r2.xyzw / r3.xyzw;
/*315*/	    r3.xyzw = -cb3.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*316*/	    r2.xyzw = r2.xyzw * r3.xyzw + cb3.data[4].xyxy;
/*317*/	    r3.xyzw = (textureLod(s_shroud, r2.zwzz.st, r2.w)).xyzw;
/*318*/	    r2.xyzw = r2.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*319*/	    r2.xyzw = saturate(r2.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*320*/	    r5.xyzw = r2.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*321*/	    r2.xyzw = r2.xyzw * r2.xyzw;
/*322*/	    r2.xyzw = r2.xyzw * r5.xyzw;
/*323*/	    r0.z = r3.x * r2.x;
/*324*/	    r0.z = r0.z * r2.y;
/*325*/	    r0.z = r2.z * -r0.z + r0.z;
/*326*/	    r0.z = r2.w * -r0.z + r0.z;
/*327*/	  } else {
/*328*/	    r0.z = 1.000000;
/*329*/	  }
/*330*/	  r0.z = saturate(r0.z + -0.500000);
/*331*/	  r0.z = r0.z * 1.900000 + 0.050000;
/*332*/	  r2.xyz = (r0.xywx * r1.wwww).xyz;
/*333*/	  r1.xyz = (r1.xyzx * r0.zzzz + r2.xyzx).xyz;
/*334*/	  r0.z = uintBitsToFloat((0.001000 < r4.y) ? 0xffffffffu : 0x00000000u);
/*335*/	  r0.z = uintBitsToFloat(floatBitsToUint(r0.z) & uint(0x3f800000u));
/*336*/	  r1.xyz = (-r0.xywx + r1.xyzx).xyz;
/*337*/	  color0.xyz = (r0.zzzz * r1.xyzx + r0.xywx).xyz;
/*338*/	} else {
/*339*/	  color0.xyz = (r0.xywx).xyz;
/*340*/	}
/*341*/	r0.x = uintBitsToFloat((2.000000 < r4.y) ? 0xffffffffu : 0x00000000u);
/*342*/	r0.y = saturate(-r4.y * cb4.data[4].x);
/*343*/	color0.w = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*344*/	return;
}
