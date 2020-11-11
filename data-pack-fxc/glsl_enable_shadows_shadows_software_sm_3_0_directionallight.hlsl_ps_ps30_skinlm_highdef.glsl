//
//
// Shader Model 4
// Fragment Shader
//
// id: 282 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_DirectionalLight.hlsl_PS_ps30_skinlm_highdef.glsl
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
layout(std140) uniform directional_light_PS
{
  vec4 data[5];
} cb3;

void main()
{
  color0 = vec4(0);
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

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw).zw;
/*2*/	r0.xy = (r0.xyxx * cb0.data[29].zwzz).xy;
/*3*/	r1.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.zwzz.st, r0.w)).xyzw;
/*4*/	r2.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.zwzz.st, r0.w)).xyzw;
/*5*/	r3.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.zwzz.st, r0.w)).xyzw;
/*6*/	r4.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, r0.w)).yzxw;
/*7*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*8*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*9*/	r0.z = inversesqrt(r0.z);
/*10*/	r5.xyz = (r0.zzzz * r1.xyzx).xyz;
/*11*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*12*/	r4.w = 1.000000;
/*13*/	r6.x = dot(r4.xyzw, cb0.data[21].xyzw);
/*14*/	r6.y = dot(r4.xyzw, cb0.data[22].xyzw);
/*15*/	r6.z = dot(r4.xyzw, cb0.data[23].xyzw);
/*16*/	r0.x = dot(r4.xyzw, cb0.data[24].xyzw);
/*17*/	r4.xyz = (r6.xyzx / r0.xxxx).xyz;
/*18*/	r4.w = 1.000000;
/*19*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*20*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*21*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*22*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r4.xyzx).xyz;
/*23*/	r7.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*24*/	r7.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*25*/	r7.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*26*/	r7.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*27*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*28*/	r3.w = dot(r7.xyzw, r7.xyzw);
/*29*/	r4.w = intBitsToFloat(int(r3.w));
/*30*/	r5.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*31*/	if(floatBitsToUint(r5.w) != 0u) {
/*32*/	  r5.w = intBitsToFloat(floatBitsToInt(r4.w) << int(2));
/*33*/	  r6.w = 1.000000;
/*34*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r5.w)+2u].xyzw);
/*35*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r5.w)+3u].xyzw);
/*36*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r5.w)+4u].xyzw);
/*37*/	  r5.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r5.w)+5u].xyzw);
/*38*/	  r7.xyz = (r7.xyzx / r5.wwww).xyz;
/*39*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r4.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*40*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*41*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*42*/	  r8.x = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*43*/	  r7.w = uintBitsToFloat(floatBitsToUint(r7.w) | floatBitsToUint(r8.x));
/*44*/	  if(floatBitsToUint(r7.w) == 0u) {
/*45*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*46*/	    r8.xy = floor((r7.xyxx).xy);
/*47*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*48*/	    r5.w = -0.000400 / r5.w;
/*49*/	    r5.w = r5.w + r7.z;
/*50*/	    r9.z = -r9.y + 1.000000;
/*51*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*52*/	    r9.w = -r9.y;
/*53*/	    r11.x = cb1.data[0].z/**/;
/*54*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*55*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*56*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*57*/	    r11.w = -cb1.data[0].w/**/;
/*58*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*59*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*60*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*61*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*62*/	    r9.x = r10.x;
/*63*/	    r9.y = r12.x;
/*64*/	    r9.z = r11.x;
/*65*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r5.wwww, r9.xyzw)) * 0xffffffffu);
/*66*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*67*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*68*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*69*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*70*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*71*/	    r5.w = -r7.x + r7.z;
/*72*/	    r5.w = r7.y * r5.w + r7.x;
/*73*/	  } else {
/*74*/	    r5.w = 1.000000;
/*75*/	  }
/*76*/	} else {
/*77*/	  r5.w = 1.000000;
/*78*/	}
/*79*/	r7.x = cb1.data[34].w + -1.000000;
/*80*/	r3.w = uintBitsToFloat((r3.w == r7.x) ? 0xffffffffu : 0x00000000u);
/*81*/	r7.x = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*82*/	if(floatBitsToUint(r3.w) == 0u) {
/*83*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.w) + int(1));
/*84*/	  r3.w = floatBitsToInt(r3.w);
/*85*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*86*/	  if(floatBitsToUint(r3.w) != 0u) {
/*87*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.w) << int(2));
/*88*/	    r6.w = 1.000000;
/*89*/	    r8.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*90*/	    r8.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*91*/	    r8.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*92*/	    r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*93*/	    r6.xyz = (r8.xyzx / r3.wwww).xyz;
/*94*/	    r7.yz = (uintBitsToFloat(uvec4(lessThan(r6.xxyx, cb1.data[floatBitsToUint(r4.w)+42u].xxyx)) * 0xffffffffu)).yz;
/*95*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.z) | floatBitsToUint(r7.y));
/*96*/	    r7.yz = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.w)+42u].zzwz, r6.xxyx)) * 0xffffffffu)).yz;
/*97*/	    r7.y = uintBitsToFloat(floatBitsToUint(r7.z) | floatBitsToUint(r7.y));
/*98*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.y));
/*99*/	    if(floatBitsToUint(r6.w) == 0u) {
/*100*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*101*/	      r7.yz = floor((r6.xxyx).yz);
/*102*/	      r8.xy = (r7.yzyy / cb1.data[0].xyxx).xy;
/*103*/	      r3.w = -0.000400 / r3.w;
/*104*/	      r3.w = r3.w + r6.z;
/*105*/	      r8.z = -r8.y + 1.000000;
/*106*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*107*/	      r8.w = -r8.y;
/*108*/	      r10.x = cb1.data[0].z/**/;
/*109*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*110*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*111*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*112*/	      r10.w = -cb1.data[0].w/**/;
/*113*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*114*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*115*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*116*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*117*/	      r8.x = r9.x;
/*118*/	      r8.y = r11.x;
/*119*/	      r8.z = r10.x;
/*120*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r8.xyzw)) * 0xffffffffu);
/*121*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*122*/	      r6.xy = (r6.xyxx + -r7.yzyy).xy;
/*123*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*124*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*125*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*126*/	      r3.w = -r6.x + r6.z;
/*127*/	      r3.w = r6.y * r3.w + r6.x;
/*128*/	    } else {
/*129*/	      r3.w = 1.000000;
/*130*/	    }
/*131*/	  } else {
/*132*/	    r3.w = 1.000000;
/*133*/	  }
/*134*/	  r6.x = -cb1.data[floatBitsToUint(r4.w)+36u].x + cb1.data[floatBitsToUint(r4.w)+37u].x;
/*135*/	  r6.y = r6.x * cb1.data[34].x;
/*136*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.w)+37u].x;
/*137*/	  r6.x = r0.w + -r6.x;
/*138*/	  r6.x = saturate(r6.x / r6.y);
/*139*/	  r3.w = -r5.w + r3.w;
/*140*/	  r5.w = r6.x * r3.w + r5.w;
/*141*/	}
/*142*/	if(floatBitsToUint(r7.x) != 0u) {
/*143*/	  r3.w = -cb1.data[floatBitsToUint(r4.w)+36u].x + cb1.data[floatBitsToUint(r4.w)+37u].x;
/*144*/	  r6.x = r3.w * cb1.data[34].y;
/*145*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.w)+37u].x;
/*146*/	  r3.w = r0.w + -r3.w;
/*147*/	  r3.w = saturate(r3.w / r6.x);
/*148*/	  r4.w = -r5.w + 1.000000;
/*149*/	  r5.w = r3.w * r4.w + r5.w;
/*150*/	}
/*151*/	r5.w = saturate(r5.w);
/*152*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*153*/	r6.xy = (r0.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*154*/	r6.z = -r6.y + 1.000000;
/*155*/	r6.xyzw = (texture(s_ssao, r6.xzxx.st)).xyzw;
/*156*/	r0.xyw = (r4.xyxz + -cb0.data[0].xyxz).xyw;
/*157*/	r3.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*158*/	r3.w = inversesqrt(r3.w);
/*159*/	r0.xyw = (r0.xyxw * r3.wwww).xyw;
/*160*/	r3.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*161*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*162*/	r3.w = dot(vec3(r5.xyzx), vec3(-cb2.data[0].yzwy));
/*163*/	r4.xzw = (r3.wwww * vec4(0.800000, 0.000000, 0.900000, 0.300000) + vec4(0.300000, 0.000000, 0.500000, 0.300000)).xzw;
/*164*/	r4.xzw = saturate(r4.xxzw * vec4(0.694444, 0.000000, 0.694444, 0.444444)).xzw;
/*165*/	r6.yzw = (r4.zzzz * vec4(0.000000, 0.612066, 0.456263, 0.050000)).yzw;
/*166*/	r4.z = r3.w * r4.x + 0.300000;
/*167*/	r4.z = saturate(-r4.z + 1.000000);
/*168*/	r8.xyz = (r4.zzzz * r6.yzwy).xyz;
/*169*/	r9.xyz = (r4.wwww * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*170*/	r4.w = -r3.w * r4.x + 1.000000;
/*171*/	r9.xyz = (r4.wwww * r9.xyzx).xyz;
/*172*/	r6.yzw = (-r6.yyzw * r4.zzzz + vec4(0.000000, 1.000000, 1.000000, 1.000000)).yzw;
/*173*/	r4.xzw = (r3.wwww * r4.xxxx + r8.xxyz).xzw;
/*174*/	r4.xzw = (r9.xxyz * r6.yyzw + r4.xxzw).xzw;
/*175*/	r4.xzw = (-r3.wwww + r4.xxzw).xzw;
/*176*/	r4.xzw = saturate(r3.yyyy * r4.xxzw + r3.wwww).xzw;
/*177*/	r4.xzw = (r2.xxyz * r4.xxzw).xzw;
/*178*/	r4.xzw = (r4.xxzw * cb2.data[1].xxyz).xzw;
/*179*/	r4.xzw = (r7.xxxx * r4.xxzw).xzw;
/*180*/	r3.w = dot(vec3(r5.xyzx), vec3(cb2.data[0].yzwy));
/*181*/	r6.y = saturate(r3.w);
/*182*/	r6.z = saturate(dot(vec3(r0.xywx), vec3(-cb2.data[0].yzwy)));
/*183*/	r6.yz = (r6.yyzy * r6.yyzy).yz;
/*184*/	r6.z = r6.z * r6.z;
/*185*/	r6.y = r6.z * r6.y;
/*186*/	r3.z = r3.z * r6.y;
/*187*/	r6.yzw = (r3.yyyy * cb2.data[1].xxyz).yzw;
/*188*/	r6.yzw = (r6.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*189*/	r6.yzw = (r7.xxxx * r6.yyzw).yzw;
/*190*/	r6.yzw = (r3.zzzz * r6.yyzw).yzw;
/*191*/	r6.yzw = (r5.wwww * r6.yyzw).yzw;
/*192*/	r6.yzw = (r2.xxyz * r6.yyzw).yzw;
/*193*/	r6.yzw = (r6.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*194*/	r4.xzw = (r4.xxzw * vec4(0.900000, 0.000000, 0.900000, 0.900000) + r6.yyzw).xzw;
/*195*/	r6.yzw = (r5.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*196*/	r3.y = dot(vec3(r6.yzwy), vec3(r6.yzwy));
/*197*/	r3.y = inversesqrt(r3.y);
/*198*/	r6.yzw = (r3.yyyy * r6.yyzw).yzw;
/*199*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r6.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*200*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*201*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*202*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*203*/	r6.yzw = (r6.yyzw * r6.yyzw).yzw;
/*204*/	r8.xyz = (r8.xywx * r6.zzzz).xyz;
/*205*/	r8.xyz = (r6.yyyy * r9.xyzx + r8.xyzx).xyz;
/*206*/	r6.yzw = (r6.wwww * r10.xxyz + r8.xxyz).yzw;
/*207*/	r2.xyz = (r2.xyzx * r6.yzwy).xyz;
/*208*/	r2.xyz = (r7.yyyy * r2.xyzx).xyz;
/*209*/	r3.y = r7.z * r7.x;
/*210*/	r1.w = r1.w * r1.w;
/*211*/	r3.z = r3.w + r3.w;
/*212*/	r6.yzw = (r5.xxyz * -r3.zzzz + cb2.data[0].yyzw).yzw;
/*213*/	r3.z = dot(vec3(r6.yzwy), vec3(-r0.xywx));
/*214*/	r3.z = max(r3.z, 0.000000);
/*215*/	r1.w = r1.w * 127.000000 + 1.600000;
/*216*/	r3.z = log2(r3.z);
/*217*/	r1.w = r1.w * r3.z;
/*218*/	r1.w = exp2(r1.w);
/*219*/	r1.w = min(r1.w, 1.000000);
/*220*/	r1.w = r1.w * r2.w;
/*221*/	r6.yzw = (r1.wwww * cb2.data[1].xxyz).yzw;
/*222*/	r6.yzw = (r7.xxxx * r6.yyzw).yzw;
/*223*/	r1.w = dot(vec3(-r0.xywx), vec3(r5.xyzx));
/*224*/	r2.w = r1.w + r1.w;
/*225*/	r0.xyw = (r5.xyxz * -r2.wwww + -r0.xyxw).xyw;
/*226*/	r0.xyw = (r0.xyxw * vec4(1.000000, 4.000000, 0.000000, 1.000000)).xyw;
/*227*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*228*/	r2.w = inversesqrt(r2.w);
/*229*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*230*/	r5.xyz = (uintBitsToFloat(uvec4(lessThan(r0.xywx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*231*/	r7.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz/**/;
/*232*/	r8.xyz = (mix(cb2.data[4].xyzx, cb2.data[5].xyzx, greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz/**/;
/*233*/	r5.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r5.zzzz), uvec4(0)))).xyz/**/;
/*234*/	r0.xyw = (r0.xyxw * r0.xyxw).xyw;
/*235*/	r8.xyz = (r8.xyzx * r0.yyyy).xyz;
/*236*/	r7.xyz = (r0.xxxx * r7.xyzx + r8.xyzx).xyz;
/*237*/	r0.xyw = (r0.wwww * r5.xyxz + r7.xyxz).xyw;
/*238*/	r1.w = saturate(-r1.w + 1.000000);
/*239*/	r1.w = r1.w * r1.w;
/*240*/	r1.w = r3.x * r1.w;
/*241*/	r1.w = r1.w * 1.500000;
/*242*/	r1.w = r7.w * r1.w;
/*243*/	r1.xyz = (r1.xyzx * r0.zzzz + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*244*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*245*/	r0.z = inversesqrt(r0.z);
/*246*/	r0.z = r0.z * r1.y;
/*247*/	r0.z = max(r0.z, 0.000000);
/*248*/	r0.z = r0.z * r1.w;
/*249*/	r0.xyz = (r0.xywx * r0.zzzz).xyz;
/*250*/	r0.xyz = (r2.xyzx * r3.yyyy + r0.xyzx).xyz;
/*251*/	r1.xyz = (r6.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.xzwx).xyz;
/*252*/	r1.xyz = (r1.xyzx * r5.wwww).xyz;
/*253*/	color0.xyz = (r6.xxxx * r0.xyzx + r1.xyzx).xyz;
/*254*/	r0.x = uintBitsToFloat((2.000000 < r4.y) ? 0xffffffffu : 0x00000000u);
/*255*/	r0.y = saturate(-r4.y * cb3.data[4].x);
/*256*/	color0.w = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*257*/	return;
}
