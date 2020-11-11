//
//
// Shader Model 4
// Fragment Shader
//
// id: 6658 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_waterplane.hlsl_PS_ps30_campaign_ultra_water_quality.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T3;
in vec4 vsOut_T4;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D s_lf_colour;
uniform sampler2D detail_normal_sampler;
uniform sampler2D sea_surface_sampler;
uniform sampler2D swell_surface_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_environment;
uniform sampler2D sHardShadowBuffer;
uniform sampler2D refraction_texture_sampler;
uniform sampler2D s_shroud;
uniform sampler2D s_overlay;

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
layout(std140) uniform OceanSharedConstants
{
  vec4 data[5];
} cb4;
layout(std140) uniform campaign_CB
{
  vec4 data[3];
} cb5;
layout(std140) uniform campaign_ocean_cb
{
  vec4 data[2];
} cb6;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r14;
  vec4 r15;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = vsOut_T3.xzxz * cb6.data[0].xxyy;
/*1*/	r1.xy = (vsOut_T3.xzxx / cb5.data[1].xyxx).xy;
/*2*/	r1.z = -r1.y + 1.000000;
/*3*/	r1.xyzw = (texture(s_lf_colour, r1.xzxx.st)).xyzw;
/*4*/	r2.xyz = (-vsOut_T3.xyzx + cb0.data[0].xyzx).xyz;
/*5*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*6*/	r1.w = inversesqrt(r1.w);
/*7*/	r3.xyz = (r1.wwww * r2.xyzx).xyz;
/*8*/	r4.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*9*/	r4.zw = (r4.xxxy * cb0.data[27].zzzw).zw;
/*10*/	r5.xy = (r4.xyxx * cb0.data[29].zwzz).xy;
/*11*/	r6.xyzw = cb0.data[26].xxxx * cb4.data[2].zzww;
/*12*/	r6.xyzw = r6.xyzw * vec4(0.003420, -0.009397, -0.006947, -0.007193);
/*13*/	r6.xyzw = r0.xyxy * cb4.data[2].xxyy + r6.xyzw;
/*14*/	r7.xyzw = (texture(detail_normal_sampler, r6.xyxx.st)).xyzw;
/*15*/	r5.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*16*/	r7.xz = (r5.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*17*/	r2.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*18*/	r2.w = -r2.w + 1.000000;
/*19*/	r2.w = max(r2.w, 0.000000);
/*20*/	r7.y = sqrt(r2.w);
/*21*/	r7.xyz = (r7.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*22*/	r6.xyzw = (texture(detail_normal_sampler, r6.zwzz.st)).xyzw;
/*23*/	r5.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*24*/	r6.xz = (r5.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*25*/	r2.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*26*/	r2.w = -r2.w + 1.000000;
/*27*/	r2.w = max(r2.w, 0.000000);
/*28*/	r6.y = sqrt(r2.w);
/*29*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*30*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*31*/	r6.xyz = (r6.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*32*/	r2.w = dot(vec3(r7.xyzx), vec3(r6.xyzx));
/*33*/	r6.xyz = (r7.yyyy * r6.xyzx).xyz;
/*34*/	r6.xyz = (r7.xyzx * r2.wwww + -r6.xyzx).xyz;
/*35*/	r2.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*36*/	r2.w = inversesqrt(r2.w);
/*37*/	r6.xyz = (r2.wwww * r6.xyzx).xyz;
/*38*/	r7.xyzw = (texture(sea_surface_sampler, r0.xyxx.st)).xyzw;
/*39*/	r0.xy = (r7.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*40*/	r7.xyzw = (texture(swell_surface_sampler, r0.zwzz.st)).xyzw;
/*41*/	r0.zw = (r7.xxxy + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*42*/	r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, 6.283185, 6.283185)).zw;
/*43*/	r0.xy = (r0.xyxx * vec4(6.283185, 6.283185, 0.000000, 0.000000) + r0.zwzz).xy;
/*44*/	r0.xy = sin(vec2(r0.xyxx)); r7.xy = cos(vec2(r0.xyxx));
/*45*/	r7.y = r7.y * r7.x;
/*46*/	r7.xz = (r0.xxyx).xz;
/*47*/	r0.x = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*48*/	r0.x = inversesqrt(r0.x);
/*49*/	r0.xyz = (r0.xxxx * r7.xyzx).xyz;
/*50*/	r0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*51*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*52*/	r0.xyz = (r0.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*53*/	r6.xyz = (r6.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*54*/	r0.w = dot(vec3(r0.xyzx), vec3(r6.xyzx));
/*55*/	r6.xyz = (r0.yyyy * r6.xyzx).xyz;
/*56*/	r0.xyz = (r0.xyzx * r0.wwww + -r6.xyzx).xyz;
/*57*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*60*/	r6.xyz = (r0.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*61*/	r0.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r6.xyz = (r0.wwww * r6.xyzx).xyz;
/*64*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*65*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*66*/	r7.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*67*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*68*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*69*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*70*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*71*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*72*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r5.zw = (mix(vec4(0, 0, 1.000000, 1.000000), vec4(0, 0, 360.000000, 0.004000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*74*/	r6.xyz = (r5.zzzz * r6.xyzx).xyz;
/*75*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*76*/	r2.w = r2.w + r2.w;
/*77*/	r7.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*78*/	r7.w = abs(r7.y);
/*79*/	r2.w = dot(vec3(r7.xwzx), vec3(-r3.xyzx));
/*80*/	r2.w = max(r2.w, 0.000000);
/*81*/	r2.w = log2(r2.w);
/*82*/	r2.w = r2.w * 10.000000;
/*83*/	r2.w = exp2(r2.w);
/*84*/	r2.w = r2.w * 0.453839 + 0.020000;
/*85*/	r8.xyzw = (textureLod(gbuffer_channel_4_sampler, r4.zwzz.st, 0.000000)).yzxw;
/*86*/	r8.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*87*/	r8.w = 1.000000;
/*88*/	r5.x = dot(r8.xyzw, cb0.data[21].xyzw);
/*89*/	r5.y = dot(r8.xyzw, cb0.data[22].xyzw);
/*90*/	r5.z = dot(r8.xyzw, cb0.data[23].xyzw);
/*91*/	r3.w = dot(r8.xyzw, cb0.data[24].xyzw);
/*92*/	r5.xyz = (r5.xyzx / r3.wwww).xyz;
/*93*/	r3.w = -r5.y + vsOut_T3.y;
/*94*/	r3.w = max(r3.w, 0.000000);
/*95*/	r5.xyz = (r5.xyzx + -vsOut_T3.xyzx).xyz;
/*96*/	r5.x = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*97*/	r5.x = sqrt(r5.x);
/*98*/	if(floatBitsToUint(cb2.data[11].y) == 0u) {
/*99*/	  r5.y = dot(vec3(r7.xzwx), vec3(r7.xzwx));
/*100*/	  r5.y = inversesqrt(r5.y);
/*101*/	  r8.xyz = (r5.yyyy * r7.xwzx).xyz;
/*102*/	  r8.xyzw = (textureLod(s_environment, r8.xyzx.stp, 0.000000)).xyzw;
/*103*/	  r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*104*/	  r5.y = min(r5.x, 1.000000);
/*105*/	  r8.xyz = (r5.yyyy * r8.xyzx).xyz;
/*106*/	} else {
/*107*/	  r8.xyz = (vec4(0, 0, 0, 0)).xyz;
/*108*/	}
/*109*/	r5.y = max(-cb2.data[0].z, 0.000000);
/*110*/	r5.z = r5.x * 0.222222;
/*111*/	r5.z = min(r5.z, 1.000000);
/*112*/	r9.y = r5.z * vsOut_T3.y;
/*113*/	r9.xz = (vsOut_T3.xxzx).xz;
/*114*/	r9.w = 1.000000;
/*115*/	r5.z = dot(r9.xyzw, cb0.data[12].xyzw);
/*116*/	r9.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r9.xyzx).xyz;
/*117*/	r10.x = uintBitsToFloat((r5.z >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*118*/	r10.y = uintBitsToFloat((r5.z >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*119*/	r10.z = uintBitsToFloat((r5.z >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*120*/	r10.w = uintBitsToFloat((r5.z >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*121*/	r10.xyzw = uintBitsToFloat(floatBitsToUint(r10.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*122*/	r6.w = dot(r10.xyzw, r10.xyzw);
/*123*/	r7.y = intBitsToFloat(int(r6.w));
/*124*/	r8.w = uintBitsToFloat((r6.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*125*/	if(floatBitsToUint(r8.w) != 0u) {
/*126*/	  r8.w = intBitsToFloat(floatBitsToInt(r7.y) << int(2));
/*127*/	  r9.w = 1.000000;
/*128*/	  r10.x = dot(r9.xyzw, cb1.data[floatBitsToUint(r8.w)+2u].xyzw);
/*129*/	  r10.y = dot(r9.xyzw, cb1.data[floatBitsToUint(r8.w)+3u].xyzw);
/*130*/	  r10.z = dot(r9.xyzw, cb1.data[floatBitsToUint(r8.w)+4u].xyzw);
/*131*/	  r8.w = dot(r9.xyzw, cb1.data[floatBitsToUint(r8.w)+5u].xyzw);
/*132*/	  r10.xyz = (r10.xyzx / r8.wwww).xyz;
/*133*/	  r11.xy = (uintBitsToFloat(uvec4(lessThan(r10.xyxx, cb1.data[floatBitsToUint(r7.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*134*/	  r10.w = uintBitsToFloat(floatBitsToUint(r11.y) | floatBitsToUint(r11.x));
/*135*/	  r11.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r7.y)+41u].zwzz, r10.xyxx)) * 0xffffffffu)).xy;
/*136*/	  r11.x = uintBitsToFloat(floatBitsToUint(r11.y) | floatBitsToUint(r11.x));
/*137*/	  r10.w = uintBitsToFloat(floatBitsToUint(r10.w) | floatBitsToUint(r11.x));
/*138*/	  if(floatBitsToUint(r10.w) == 0u) {
/*139*/	    r10.xy = (r10.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*140*/	    r11.xy = floor((r10.xyxx).xy);
/*141*/	    r12.xy = (r11.xyxx / cb1.data[0].xyxx).xy;
/*142*/	    r8.w = -0.000400 / r8.w;
/*143*/	    r8.w = r8.w + r10.z;
/*144*/	    r12.z = -r12.y + 1.000000;
/*145*/	    r13.xyzw = (textureLod(sHardShadowBuffer, r12.xzxx.st, 0.000000)).xyzw;
/*146*/	    r12.w = -r12.y;
/*147*/	    r14.x = cb1.data[0].z/**/;
/*148*/	    r14.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*149*/	    r10.zw = (r12.xxxw + r14.xxxy).zw;
/*150*/	    r15.xyzw = (textureLod(sHardShadowBuffer, r10.zwzz.st, 0.000000)).xyzw;
/*151*/	    r14.w = -cb1.data[0].w/**/;
/*152*/	    r10.zw = (r12.xxxz + r14.zzzw).zw;
/*153*/	    r14.xyzw = (textureLod(sHardShadowBuffer, r10.zwzz.st, 0.000000)).xyzw;
/*154*/	    r10.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r12.xxxz).zw;
/*155*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r10.zwzz.st, 0.000000)).yzwx;
/*156*/	    r12.x = r13.x;
/*157*/	    r12.y = r15.x;
/*158*/	    r12.z = r14.x;
/*159*/	    r12.xyzw = uintBitsToFloat(uvec4(lessThan(r8.wwww, r12.xyzw)) * 0xffffffffu);
/*160*/	    r13.xyzw = uintBitsToFloat(floatBitsToUint(r12.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*161*/	    r10.xy = (r10.xyxx + -r11.xyxx).xy;
/*162*/	    r10.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r12.xxxz), uvec4(0)))).zw;
/*163*/	    r10.zw = (r10.zzzw + r13.yyyw).zw;
/*164*/	    r10.xz = (r10.xxxx * r10.zzwz + r13.xxzx).xz;
/*165*/	    r8.w = -r10.x + r10.z;
/*166*/	    r8.w = r10.y * r8.w + r10.x;
/*167*/	  } else {
/*168*/	    r8.w = 1.000000;
/*169*/	  }
/*170*/	} else {
/*171*/	  r8.w = 1.000000;
/*172*/	}
/*173*/	r10.x = cb1.data[34].w + -1.000000;
/*174*/	r6.w = uintBitsToFloat((r6.w == r10.x) ? 0xffffffffu : 0x00000000u);
/*175*/	r10.x = uintBitsToFloat((floatBitsToInt(r6.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*176*/	if(floatBitsToUint(r6.w) == 0u) {
/*177*/	  r6.w = intBitsToFloat(floatBitsToInt(r7.y) + int(1));
/*178*/	  r6.w = floatBitsToInt(r6.w);
/*179*/	  r6.w = uintBitsToFloat((r6.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*180*/	  if(floatBitsToUint(r6.w) != 0u) {
/*181*/	    r6.w = intBitsToFloat(floatBitsToInt(r7.y) << int(2));
/*182*/	    r9.w = 1.000000;
/*183*/	    r11.x = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+6u].xyzw);
/*184*/	    r11.y = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+7u].xyzw);
/*185*/	    r11.z = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+8u].xyzw);
/*186*/	    r6.w = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+9u].xyzw);
/*187*/	    r9.xyz = (r11.xyzx / r6.wwww).xyz;
/*188*/	    r10.yz = (uintBitsToFloat(uvec4(lessThan(r9.xxyx, cb1.data[floatBitsToUint(r7.y)+42u].xxyx)) * 0xffffffffu)).yz;
/*189*/	    r9.w = uintBitsToFloat(floatBitsToUint(r10.z) | floatBitsToUint(r10.y));
/*190*/	    r10.yz = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r7.y)+42u].zzwz, r9.xxyx)) * 0xffffffffu)).yz;
/*191*/	    r10.y = uintBitsToFloat(floatBitsToUint(r10.z) | floatBitsToUint(r10.y));
/*192*/	    r9.w = uintBitsToFloat(floatBitsToUint(r9.w) | floatBitsToUint(r10.y));
/*193*/	    if(floatBitsToUint(r9.w) == 0u) {
/*194*/	      r9.xy = (r9.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*195*/	      r10.yz = floor((r9.xxyx).yz);
/*196*/	      r11.xy = (r10.yzyy / cb1.data[0].xyxx).xy;
/*197*/	      r6.w = -0.000400 / r6.w;
/*198*/	      r6.w = r6.w + r9.z;
/*199*/	      r11.z = -r11.y + 1.000000;
/*200*/	      r12.xyzw = (textureLod(sHardShadowBuffer, r11.xzxx.st, 0.000000)).xyzw;
/*201*/	      r11.w = -r11.y;
/*202*/	      r13.x = cb1.data[0].z/**/;
/*203*/	      r13.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*204*/	      r9.zw = (r11.xxxw + r13.xxxy).zw;
/*205*/	      r14.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*206*/	      r13.w = -cb1.data[0].w/**/;
/*207*/	      r9.zw = (r11.xxxz + r13.zzzw).zw;
/*208*/	      r13.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*209*/	      r9.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r11.xxxz).zw;
/*210*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).yzwx;
/*211*/	      r11.x = r12.x;
/*212*/	      r11.y = r14.x;
/*213*/	      r11.z = r13.x;
/*214*/	      r11.xyzw = uintBitsToFloat(uvec4(lessThan(r6.wwww, r11.xyzw)) * 0xffffffffu);
/*215*/	      r12.xyzw = uintBitsToFloat(floatBitsToUint(r11.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*216*/	      r9.xy = (r9.xyxx + -r10.yzyy).xy;
/*217*/	      r9.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r11.xxxz), uvec4(0)))).zw;
/*218*/	      r9.zw = (r9.zzzw + r12.yyyw).zw;
/*219*/	      r9.xz = (r9.xxxx * r9.zzwz + r12.xxzx).xz;
/*220*/	      r6.w = -r9.x + r9.z;
/*221*/	      r6.w = r9.y * r6.w + r9.x;
/*222*/	    } else {
/*223*/	      r6.w = 1.000000;
/*224*/	    }
/*225*/	  } else {
/*226*/	    r6.w = 1.000000;
/*227*/	  }
/*228*/	  r9.x = -cb1.data[floatBitsToUint(r7.y)+36u].x + cb1.data[floatBitsToUint(r7.y)+37u].x;
/*229*/	  r9.y = r9.x * cb1.data[34].x;
/*230*/	  r9.x = -r9.x * cb1.data[34].x + cb1.data[floatBitsToUint(r7.y)+37u].x;
/*231*/	  r9.x = r5.z + -r9.x;
/*232*/	  r9.x = saturate(r9.x / r9.y);
/*233*/	  r6.w = -r8.w + r6.w;
/*234*/	  r8.w = r9.x * r6.w + r8.w;
/*235*/	}
/*236*/	if(floatBitsToUint(r10.x) != 0u) {
/*237*/	  r6.w = -cb1.data[floatBitsToUint(r7.y)+36u].x + cb1.data[floatBitsToUint(r7.y)+37u].x;
/*238*/	  r9.x = r6.w * cb1.data[34].y;
/*239*/	  r6.w = -r6.w * cb1.data[34].y + cb1.data[floatBitsToUint(r7.y)+37u].x;
/*240*/	  r5.z = r5.z + -r6.w;
/*241*/	  r5.z = saturate(r5.z / r9.x);
/*242*/	  r6.w = -r8.w + 1.000000;
/*243*/	  r8.w = r5.z * r6.w + r8.w;
/*244*/	}
/*245*/	r8.w = saturate(r8.w);
/*246*/	r5.z = r8.w * 0.850000 + 0.150000;
/*247*/	r9.xyz = (r1.xyzx * r5.yyyy).xyz;
/*248*/	r9.xyz = (r9.xyzx * cb2.data[1].xyzx).xyz;
/*249*/	r9.xyz = (r5.wwww * r9.xyzx).xyz;
/*250*/	r1.xyz = (r1.xyzx * r6.xyzx).xyz;
/*251*/	r1.xyz = (r5.wwww * r1.xyzx).xyz;
/*252*/	r1.xyz = (r9.xyzx * r5.zzzz + r1.xyzx).xyz;
/*253*/	r6.xyz = (-cb2.data[10].xyzx * cb2.data[10].wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*254*/	r5.xyz = (r5.xxxx * -r6.xyzx).xyz;
/*255*/	r5.xyz = (r5.xyzx * cb4.data[3].xxxx).xyz;
/*256*/	r5.xyz = (r5.xyzx * vec4(1.442695, 1.442695, 1.442695, 0.000000)).xyz;
/*257*/	r5.xyz = (exp2(r5.xyzx)).xyz;
/*258*/	r6.xy = (r0.xzxx * vec4(0.020000, 0.020000, 0.000000, 0.000000)).xy;
/*259*/	r3.w = min(r3.w, 3.000000);
/*260*/	r6.xy = (r3.wwww * r6.xyxx).xy;
/*261*/	r6.zw = (r4.xxxy * cb0.data[27].zzzw + r6.xxxy).zw;
/*262*/	r4.xy = (r4.xyxx * cb0.data[29].zwzz + r6.xyxx).xy;
/*263*/	r9.xyzw = (textureLod(gbuffer_channel_4_sampler, r6.zwzz.st, 0.000000)).yzxw;
/*264*/	r9.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*265*/	r9.w = 1.000000;
/*266*/	r10.x = dot(r9.xyzw, cb0.data[21].xyzw);
/*267*/	r10.y = dot(r9.xyzw, cb0.data[22].xyzw);
/*268*/	r10.z = dot(r9.xyzw, cb0.data[23].xyzw);
/*269*/	r3.w = dot(r9.xyzw, cb0.data[24].xyzw);
/*270*/	r9.xyz = (r10.xyzx / r3.wwww).xyz;
/*271*/	r9.xyz = (r9.xyzx + -cb0.data[0].xyzx).xyz;
/*272*/	r3.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*273*/	r3.w = sqrt(r3.w);
/*274*/	r9.xyz = (vsOut_T3.xyzx + -cb0.data[0].xyzx).xyz;
/*275*/	r4.x = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*276*/	r4.x = sqrt(r4.x);
/*277*/	r3.w = uintBitsToFloat((r4.x < r3.w) ? 0xffffffffu : 0x00000000u);
/*278*/	r6.xyzw = (texture(refraction_texture_sampler, r6.zwzz.st)).xyzw;
/*279*/	r4.xyzw = (texture(refraction_texture_sampler, r4.zwzz.st)).xyzw;
/*280*/	if(floatBitsToUint(r3.w) != 0u) {
/*281*/	  r4.xyz = (r6.xyzx).xyz;
/*282*/	}
/*283*/	r4.xyz = (r4.xyzx * r5.xyzx + -r1.xyzx).xyz;
/*284*/	r1.xyz = (r5.xyzx * r4.xyzx + r1.xyzx).xyz;
/*285*/	r2.w = -r2.w + 1.000000;
/*286*/	r1.xyz = (r2.wwww * r1.xyzx + r8.xyzx).xyz;
/*287*/	r2.w = dot(vec3(-cb2.data[0].ywzy), vec3(r7.xzwx));
/*288*/	r2.w = max(r2.w, -1.000000);
/*289*/	r2.w = min(r2.w, 1.000000);
/*290*/	r3.w = -abs(r2.w) + 1.000000;
/*291*/	r3.w = sqrt(r3.w);
/*292*/	r4.x = abs(r2.w) * -0.018729 + 0.074261;
/*293*/	r4.x = r4.x * abs(r2.w) + -0.212114;
/*294*/	r4.x = r4.x * abs(r2.w) + 1.570729;
/*295*/	r4.y = r3.w * r4.x;
/*296*/	r4.y = r4.y * -2.000000 + 3.141593;
/*297*/	r2.w = uintBitsToFloat((r2.w < -r2.w) ? 0xffffffffu : 0x00000000u);
/*298*/	r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r4.y));
/*299*/	r2.w = r4.x * r3.w + r2.w;
/*300*/	r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r0.xyzx));
/*301*/	r0.y = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*302*/	if(floatBitsToUint(r0.y) != 0u) {
/*303*/	    r0.z = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.014341 : -0.000001;
/*304*/	  r0.z = r0.z + r5.w;
/*305*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*306*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*307*/	  r0.z = -r0.z * r0.z + 1.000000;
/*308*/	  r0.z = max(r0.z, 0.001000);
/*309*/	  r0.z = log2(r0.z);
/*310*/	  r3.w = r0.z * 4.950617;
/*311*/	  r0.z = r0.z * 0.346574 + 4.546885;
/*312*/	  r3.w = r0.z * r0.z + -r3.w;
/*313*/	  r3.w = sqrt(r3.w);
/*314*/	  r0.z = -r0.z + r3.w;
/*315*/	  r0.z = max(r0.z, 0.000000);
/*316*/	  r0.z = sqrt(r0.z);
/*317*/	  r0.z = r0.z * 1.414214;
/*318*/	  r0.z = 0.008727 / r0.z;
/*319*/	  r0.z = max(r0.z, 0.000100);
/*320*/	  r4.xy = (r2.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*321*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*322*/	  r4.xy = (r0.zzzz * r4.xyxx).xy;
/*323*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*324*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*325*/	  r6.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*326*/	  r5.xy = (r6.xzxx / r6.ywyy).xy;
/*327*/	  r4.zw = (-r4.zzzw * r5.xxxy).zw;
/*328*/	  r5.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*329*/	  r0.z = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*330*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.x) + floatBitsToInt(r0.z));
/*331*/	  r0.z = floatBitsToInt(r0.z);
/*332*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*333*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*334*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*335*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*336*/	  r0.z = r0.z * r4.x + 1.000000;
/*337*/	  r0.z = r0.z * 0.500000;
/*338*/	  r3.w = 1 + ~floatBitsToInt(r5.y);
/*339*/	  r3.w = r3.w * r4.y + 1.000000;
/*340*/	  r0.z = r3.w * 0.500000 + -r0.z;
/*341*/	  r3.w = saturate(r0.x);
/*342*/	  r3.w = r3.w + -1.000000;
/*343*/	  r3.w = r3.w * 0.982287 + 1.000000;
/*344*/	  r4.x = dot(vec3(-cb2.data[0].yzwy), vec3(-r3.xyzx));
/*345*/	  r4.x = max(r4.x, 0.000000);
/*346*/	  r4.x = log2(r4.x);
/*347*/	  r4.x = r4.x * 10.000000;
/*348*/	  r4.x = exp2(r4.x);
/*349*/	  r4.x = r4.x * 0.453839 + 0.020000;
/*350*/	  r0.z = abs(r0.z) * r3.w;
/*351*/	  r4.xyz = (r4.xxxx * r0.zzzz).xyz;
/*352*/	} else {
/*353*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*354*/	}
/*355*/	r4.xyz = (r4.xyzx * cb2.data[1].xyzx).xyz;
/*356*/	if(floatBitsToUint(r0.y) != 0u) {
/*357*/	    r0.y = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.248975 : -0.000025;
/*358*/	  r0.y = r0.y + r5.w;
/*359*/	  r0.y = r0.y * 0.500000 + 0.500000;
/*360*/	  r0.y = r0.y * 2.000000 + -1.000000;
/*361*/	  r0.y = -r0.y * r0.y + 1.000000;
/*362*/	  r0.y = max(r0.y, 0.001000);
/*363*/	  r0.y = log2(r0.y);
/*364*/	  r0.z = r0.y * 4.950617;
/*365*/	  r0.y = r0.y * 0.346574 + 4.546885;
/*366*/	  r0.z = r0.y * r0.y + -r0.z;
/*367*/	  r0.z = sqrt(r0.z);
/*368*/	  r0.y = -r0.y + r0.z;
/*369*/	  r0.y = max(r0.y, 0.000000);
/*370*/	  r0.y = sqrt(r0.y);
/*371*/	  r0.y = r0.y * 1.414214;
/*372*/	  r0.y = 0.008727 / r0.y;
/*373*/	  r0.y = max(r0.y, 0.000100);
/*374*/	  r0.zw = (r2.wwww + vec4(0.000000, 0.000000, -0.008727, 0.008727)).zw;
/*375*/	  r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*376*/	  r0.yz = (r0.yyyy * r0.zzwz).yz;
/*377*/	  r5.xy = (r0.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*378*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*379*/	  r6.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*380*/	  r5.zw = (r6.xxxz / r6.yyyw).zw;
/*381*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*382*/	  r0.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.yyyz)) * 0xffffffffu)).zw;
/*383*/	  r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*384*/	  r0.y = intBitsToFloat(1 + ~floatBitsToInt(r0.z) + floatBitsToInt(r0.y));
/*385*/	  r0.y = floatBitsToInt(r0.y);
/*386*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*387*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*388*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*389*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*390*/	  r0.y = r0.y * r5.x + 1.000000;
/*391*/	  r0.y = r0.y * 0.500000;
/*392*/	  r0.z = 1 + ~floatBitsToInt(r0.w);
/*393*/	  r0.z = r0.z * r5.y + 1.000000;
/*394*/	  r0.y = r0.z * 0.500000 + -r0.y;
/*395*/	  r0.x = saturate(r0.x);
/*396*/	  r0.x = r0.x + -1.000000;
/*397*/	  r0.x = r0.x * 0.707107 + 1.000000;
/*398*/	  r0.z = dot(vec3(-cb2.data[0].yzwy), vec3(-r3.xyzx));
/*399*/	  r0.z = max(r0.z, 0.000000);
/*400*/	  r0.z = log2(r0.z);
/*401*/	  r0.z = r0.z * 10.000000;
/*402*/	  r0.z = exp2(r0.z);
/*403*/	  r0.z = r0.z * 0.830475 + 0.020000;
/*404*/	  r0.x = r0.x * abs(r0.y);
/*405*/	  r0.xyz = (r0.zzzz * r0.xxxx).xyz;
/*406*/	} else {
/*407*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*408*/	}
/*409*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*410*/	r0.xyz = (r0.xyzx * vec4(0.700000, 0.700000, 0.700000, 0.000000)).xyz;
/*411*/	r0.xyz = (r4.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r0.xyzx).xyz;
/*412*/	r0.xyz = (r8.wwww * r0.xyzx + r1.xyzx).xyz;
/*413*/	r1.xyz = (r2.xyzx * r1.wwww + r7.xwzx).xyz;
/*414*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*415*/	r0.w = inversesqrt(r0.w);
/*416*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*417*/	r0.w = max(abs(r1.z), abs(r1.y));
/*418*/	r0.w = max(r0.w, abs(r1.x));
/*419*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*420*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*421*/	color0.w = 0.120000;
/*422*/	r0.w = uintBitsToFloat((0.500000 < cb3.data[0].x) ? 0xffffffffu : 0x00000000u);
/*423*/	if(floatBitsToUint(r0.w) != 0u) {
/*424*/	  r1.xyzw = vsOut_T3.xzxz + -cb3.data[1].xyxy;
/*425*/	  r2.xyzw = -cb3.data[1].xyxy + cb3.data[1].zwzw;
/*426*/	  r1.xyzw = r1.xyzw / r2.xyzw;
/*427*/	  r2.xyzw = -cb3.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*428*/	  r1.xyzw = r1.xyzw * r2.xyzw + cb3.data[4].xyxy;
/*429*/	  r2.xyzw = (textureLod(s_shroud, r1.zwzz.st, r1.w)).xyzw;
/*430*/	  r1.xyzw = r1.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*431*/	  r1.xyzw = saturate(r1.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*432*/	  r3.xyzw = r1.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*433*/	  r1.xyzw = r1.xyzw * r1.xyzw;
/*434*/	  r1.xyzw = r1.xyzw * r3.xyzw;
/*435*/	  r0.w = r2.x * r1.x;
/*436*/	  r0.w = r0.w * r1.y;
/*437*/	  r0.w = r1.z * -r0.w + r0.w;
/*438*/	  r0.w = r1.w * -r0.w + r0.w;
/*439*/	} else {
/*440*/	  r0.w = 1.000000;
/*441*/	}
/*442*/	r1.xy = (r0.wwww + vec4(-0.500000, -0.100000, 0.000000, 0.000000)).xy;
/*443*/	r0.w = saturate(r1.x + r1.x);
/*444*/	r1.x = r0.w * -2.000000 + 3.000000;
/*445*/	r0.w = r0.w * r0.w;
/*446*/	r0.w = r0.w * r1.x;
/*447*/	r1.x = saturate(r1.y * 2.500000);
/*448*/	r1.y = r1.x * -2.000000 + 3.000000;
/*449*/	r1.x = r1.x * r1.x;
/*450*/	r1.x = r1.x * r1.y;
/*451*/	r1.x = r1.x * 0.200000;
/*452*/	r1.xyz = saturate(r0.xyzx * r1.xxxx).xyz;
/*453*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*454*/	r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*455*/	r1.xy = (vsOut_T4.xyxx / vsOut_T4.wwww).xy;
/*456*/	r1.yz = (r1.xxyx * vec4(0.000000, 0.500000, -0.500000, 0.000000) + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*457*/	r1.xw = (-r1.zzzz + vec4(1.000000, 0.000000, 0.000000, 1.000000)).xw;
/*458*/	r1.xyzw = (textureLod(s_overlay, r1.ywyy.st, r1.x)).xyzw;
/*459*/	color3.xyz = (r0.xyzx * r1.wwww + r1.xyzx).xyz;
/*460*/	color1.xyzw = vec4(0, 0, 0, 0.020000);
/*461*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*462*/	color3.w = 1.000000;
/*463*/	return;
}
