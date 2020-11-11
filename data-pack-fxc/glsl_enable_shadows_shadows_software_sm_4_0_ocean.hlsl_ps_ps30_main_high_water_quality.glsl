//
//
// Shader Model 4
// Fragment Shader
//
// id: 6796 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_ocean.hlsl_PS_ps30_main_high_water_quality.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T5;
in vec4 vsOut_T6;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D detail_normal_sampler;
uniform sampler2D sea_surface_sampler;
uniform sampler2D g_static_foam_sampler;
uniform sampler2D swell_surface_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_environment;
uniform sampler2D sHardShadowBuffer;
uniform sampler2D refraction_texture_sampler;
uniform sampler2D colour_overlay_texture_sampler;
uniform sampler2D ui_colour_overlay_texture_sampler;
uniform sampler2DArray g_foam_anim_sampler;

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
layout(std140) uniform OceanSharedConstants
{
  vec4 data[5];
} cb3;

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
  vec4 r16;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyz = (-vsOut_T1.xyzx + cb0.data[0].xyzx).xyz;
/*1*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*2*/	r0.w = inversesqrt(r0.w);
/*3*/	r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*4*/	r2.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*5*/	r2.zw = (r2.xxxy * cb0.data[27].zzzw).zw;
/*6*/	r3.xy = (r2.xyxx * cb0.data[29].zwzz).xy;
/*7*/	r3.zw = (vsOut_T2.xxxy / vsOut_T2.wwww).zw;
/*8*/	r4.yz = (r3.zzwz + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*9*/	r3.zw = (vsOut_T3.xxxy / vsOut_T3.wwww).zw;
/*10*/	r5.yz = (r3.zzwz + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*11*/	r6.xyzw = cb0.data[26].xxxx * cb3.data[2].zzww;
/*12*/	r6.xyzw = r6.xyzw * vec4(-0.001392, -0.009903, -0.006947, -0.007193);
/*13*/	r6.xyzw = vsOut_T5.xyxy * cb3.data[2].xxyy + r6.xyzw;
/*14*/	r7.xyzw = (texture(detail_normal_sampler, r6.xyxx.st)).xyzw;
/*15*/	r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*16*/	r7.xz = (r3.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*17*/	r1.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*18*/	r1.w = -r1.w + 1.000000;
/*19*/	r1.w = max(r1.w, 0.000000);
/*20*/	r7.y = sqrt(r1.w);
/*21*/	r7.xyz = (r7.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*22*/	r6.xyzw = (texture(detail_normal_sampler, r6.zwzz.st)).xyzw;
/*23*/	r3.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*24*/	r6.xz = (r3.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*25*/	r1.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*26*/	r1.w = -r1.w + 1.000000;
/*27*/	r1.w = max(r1.w, 0.000000);
/*28*/	r6.y = sqrt(r1.w);
/*29*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*30*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*31*/	r6.xyz = (r6.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*32*/	r1.w = dot(vec3(r7.xyzx), vec3(r6.xyzx));
/*33*/	r6.xyz = (r7.yyyy * r6.xyzx).xyz;
/*34*/	r6.xyz = (r7.xyzx * r1.wwww + -r6.xyzx).xyz;
/*35*/	r1.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*36*/	r1.w = inversesqrt(r1.w);
/*37*/	r6.xyz = (r1.wwww * r6.xyzx).xyz;
/*38*/	r7.xyzw = (texture(sea_surface_sampler, vsOut_T5.xyxx.st)).xyzw;
/*39*/	r3.zw = (r7.xxxy + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*40*/	r7.xyzw = (texture(swell_surface_sampler, vsOut_T5.zwzz.st)).xyzw;
/*41*/	r7.xy = (r7.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*42*/	r7.xy = (r7.xyxx * vec4(6.283185, 6.283185, 0.000000, 0.000000)).xy;
/*43*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 6.283185, 6.283185) + r7.xxxy).zw;
/*44*/	r7.xy = sin(vec2(r3.zwzz)); r8.xy = cos(vec2(r3.zwzz));
/*45*/	r8.y = r8.y * r8.x;
/*46*/	r8.xz = (r7.xxyx).xz;
/*47*/	r1.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r7.xyz = (r1.wwww * r8.xyzx).xyz;
/*50*/	r7.xyz = (r7.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*51*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*52*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*53*/	r6.xyz = (r6.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*54*/	r1.w = dot(vec3(r7.xyzx), vec3(r6.xyzx));
/*55*/	r6.xyz = (r7.yyyy * r6.xyzx).xyz;
/*56*/	r6.xyz = (r7.xyzx * r1.wwww + -r6.xyzx).xyz;
/*57*/	r1.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r6.xyz = (r1.wwww * r6.xyzx).xyz;
/*60*/	r7.xyz = (r6.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*61*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*64*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*65*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*66*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*67*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*68*/	r7.xyz = (r7.xyzx * r7.xyzx).xyz;
/*69*/	r8.xyz = (r8.xywx * r7.yyyy).xyz;
/*70*/	r7.xyw = (r7.xxxx * r9.xyxz + r8.xyxz).xyw;
/*71*/	r7.xyz = (r7.zzzz * r10.xyzx + r7.xywx).xyz;
/*72*/	r1.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r3.zw = (mix(vec4(0, 0, 1.000000, 1.000000), vec4(0, 0, 360.000000, 0.004000), greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).zw;
/*74*/	r7.xyz = (r3.zzzz * r7.xyzx).xyz;
/*75*/	r3.z = dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy));
/*76*/	r6.w = max(r3.z, 0.000000);
/*77*/	r7.w = dot(vec3(-r1.xyzx), vec3(r6.xyzx));
/*78*/	r7.w = r7.w + r7.w;
/*79*/	r8.xyz = (r6.xyzx * -r7.wwww + -r1.xyzx).xyz;
/*80*/	r8.w = abs(r8.y);
/*81*/	r6.y = dot(vec3(r8.xwzx), vec3(-r1.xyzx));
/*82*/	r6.y = max(r6.y, 0.000000);
/*83*/	r6.y = log2(r6.y);
/*84*/	r6.xyz = (r6.xyzx * vec4(0.020000, 10.000000, 0.020000, 0.000000)).xyz;
/*85*/	r6.y = exp2(r6.y);
/*86*/	r6.y = r6.y * 0.453839 + 0.020000;
/*87*/	r9.xyzw = (textureLod(gbuffer_channel_4_sampler, r2.zwzz.st, 0.000000)).yzxw;
/*88*/	r9.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*89*/	r9.w = 1.000000;
/*90*/	r10.x = dot(r9.xyzw, cb0.data[21].xyzw);
/*91*/	r10.y = dot(r9.xyzw, cb0.data[22].xyzw);
/*92*/	r10.z = dot(r9.xyzw, cb0.data[23].xyzw);
/*93*/	r3.x = dot(r9.xyzw, cb0.data[24].xyzw);
/*94*/	r9.xyz = (r10.xyzx / r3.xxxx).xyz;
/*95*/	r3.x = -r9.y + vsOut_T1.y;
/*96*/	r3.x = max(r3.x, 0.000000);
/*97*/	r9.xyz = (r9.xyzx + -vsOut_T1.xyzx).xyz;
/*98*/	r3.y = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*99*/	r3.y = sqrt(r3.y);
/*100*/	if(floatBitsToUint(cb2.data[11].y) == 0u) {
/*101*/	  r7.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*102*/	  r7.w = inversesqrt(r7.w);
/*103*/	  r9.xyz = (r7.wwww * r8.xwzx).xyz;
/*104*/	  r9.xyzw = (textureLod(s_environment, r9.xyzx.stp, 0.000000)).xyzw;
/*105*/	  r9.xyz = (r6.yyyy * r9.xyzx).xyz;
/*106*/	  r7.w = min(r3.y, 1.000000);
/*107*/	  r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*108*/	} else {
/*109*/	  r9.xyz = (vec4(0, 0, 0, 0)).xyz;
/*110*/	}
/*111*/	r7.w = max(-cb2.data[0].z, 0.000000);
/*112*/	r8.y = r3.y * 0.222222;
/*113*/	r8.y = min(r8.y, 1.000000);
/*114*/	r10.y = r8.y * vsOut_T1.y;
/*115*/	r10.xz = (vsOut_T1.xxzx).xz;
/*116*/	r10.w = 1.000000;
/*117*/	r8.y = dot(r10.xyzw, cb0.data[12].xyzw);
/*118*/	r10.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r10.xyzx).xyz;
/*119*/	r11.x = uintBitsToFloat((r8.y >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*120*/	r11.y = uintBitsToFloat((r8.y >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*121*/	r11.z = uintBitsToFloat((r8.y >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*122*/	r11.w = uintBitsToFloat((r8.y >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*123*/	r11.xyzw = uintBitsToFloat(floatBitsToUint(r11.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*124*/	r9.w = dot(r11.xyzw, r11.xyzw);
/*125*/	r11.x = intBitsToFloat(int(r9.w));
/*126*/	r11.y = uintBitsToFloat((r9.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*127*/	if(floatBitsToUint(r11.y) != 0u) {
/*128*/	  r11.y = intBitsToFloat(floatBitsToInt(r11.x) << int(2));
/*129*/	  r10.w = 1.000000;
/*130*/	  r12.x = dot(r10.xyzw, cb1.data[floatBitsToUint(r11.y)+2u].xyzw);
/*131*/	  r12.y = dot(r10.xyzw, cb1.data[floatBitsToUint(r11.y)+3u].xyzw);
/*132*/	  r12.z = dot(r10.xyzw, cb1.data[floatBitsToUint(r11.y)+4u].xyzw);
/*133*/	  r11.y = dot(r10.xyzw, cb1.data[floatBitsToUint(r11.y)+5u].xyzw);
/*134*/	  r12.xyz = (r12.xyzx / r11.yyyy).xyz;
/*135*/	  r11.zw = (uintBitsToFloat(uvec4(lessThan(r12.xxxy, cb1.data[floatBitsToUint(r11.x)+41u].xxxy)) * 0xffffffffu)).zw;
/*136*/	  r11.z = uintBitsToFloat(floatBitsToUint(r11.w) | floatBitsToUint(r11.z));
/*137*/	  r13.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r11.x)+41u].zwzz, r12.xyxx)) * 0xffffffffu)).xy;
/*138*/	  r11.w = uintBitsToFloat(floatBitsToUint(r13.y) | floatBitsToUint(r13.x));
/*139*/	  r11.z = uintBitsToFloat(floatBitsToUint(r11.w) | floatBitsToUint(r11.z));
/*140*/	  if(floatBitsToUint(r11.z) == 0u) {
/*141*/	    r11.zw = (r12.xxxy * cb1.data[0].xxxy + vec4(0.000000, 0.000000, 0.500000, 0.500000)).zw;
/*142*/	    r12.xy = floor((r11.zwzz).xy);
/*143*/	    r13.xy = (r12.xyxx / cb1.data[0].xyxx).xy;
/*144*/	    r11.y = -0.000400 / r11.y;
/*145*/	    r11.y = r11.y + r12.z;
/*146*/	    r13.z = -r13.y + 1.000000;
/*147*/	    r14.xyzw = (textureLod(sHardShadowBuffer, r13.xzxx.st, 0.000000)).xyzw;
/*148*/	    r13.w = -r13.y;
/*149*/	    r15.x = cb1.data[0].z/**/;
/*150*/	    r15.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*151*/	    r12.zw = (r13.xxxw + r15.xxxy).zw;
/*152*/	    r16.xyzw = (textureLod(sHardShadowBuffer, r12.zwzz.st, 0.000000)).xyzw;
/*153*/	    r15.w = -cb1.data[0].w/**/;
/*154*/	    r12.zw = (r13.xxxz + r15.zzzw).zw;
/*155*/	    r15.xyzw = (textureLod(sHardShadowBuffer, r12.zwzz.st, 0.000000)).xyzw;
/*156*/	    r12.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r13.xxxz).zw;
/*157*/	    r13.xyzw = (textureLod(sHardShadowBuffer, r12.zwzz.st, 0.000000)).yzwx;
/*158*/	    r13.x = r14.x;
/*159*/	    r13.y = r16.x;
/*160*/	    r13.z = r15.x;
/*161*/	    r13.xyzw = uintBitsToFloat(uvec4(lessThan(r11.yyyy, r13.xyzw)) * 0xffffffffu);
/*162*/	    r14.xyzw = uintBitsToFloat(floatBitsToUint(r13.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*163*/	    r11.yz = (r11.zzwz + -r12.xxyx).yz;
/*164*/	    r12.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r13.xzxx), uvec4(0)))).xy;
/*165*/	    r12.xy = (r12.xyxx + r14.ywyy).xy;
/*166*/	    r11.yw = (r11.yyyy * r12.xxxy + r14.xxxz).yw;
/*167*/	    r11.w = -r11.y + r11.w;
/*168*/	    r11.y = r11.z * r11.w + r11.y;
/*169*/	  } else {
/*170*/	    r11.y = 1.000000;
/*171*/	  }
/*172*/	} else {
/*173*/	  r11.y = 1.000000;
/*174*/	}
/*175*/	r11.z = cb1.data[34].w + -1.000000;
/*176*/	r9.w = uintBitsToFloat((r9.w == r11.z) ? 0xffffffffu : 0x00000000u);
/*177*/	r11.z = uintBitsToFloat((floatBitsToInt(r9.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*178*/	if(floatBitsToUint(r9.w) == 0u) {
/*179*/	  r9.w = intBitsToFloat(floatBitsToInt(r11.x) + int(1));
/*180*/	  r9.w = floatBitsToInt(r9.w);
/*181*/	  r9.w = uintBitsToFloat((r9.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*182*/	  if(floatBitsToUint(r9.w) != 0u) {
/*183*/	    r9.w = intBitsToFloat(floatBitsToInt(r11.x) << int(2));
/*184*/	    r10.w = 1.000000;
/*185*/	    r12.x = dot(r10.xyzw, cb1.data[floatBitsToUint(r9.w)+6u].xyzw);
/*186*/	    r12.y = dot(r10.xyzw, cb1.data[floatBitsToUint(r9.w)+7u].xyzw);
/*187*/	    r12.z = dot(r10.xyzw, cb1.data[floatBitsToUint(r9.w)+8u].xyzw);
/*188*/	    r9.w = dot(r10.xyzw, cb1.data[floatBitsToUint(r9.w)+9u].xyzw);
/*189*/	    r10.xyz = (r12.xyzx / r9.wwww).xyz;
/*190*/	    r12.xy = (uintBitsToFloat(uvec4(lessThan(r10.xyxx, cb1.data[floatBitsToUint(r11.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*191*/	    r10.w = uintBitsToFloat(floatBitsToUint(r12.y) | floatBitsToUint(r12.x));
/*192*/	    r12.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r11.x)+42u].zwzz, r10.xyxx)) * 0xffffffffu)).xy;
/*193*/	    r11.w = uintBitsToFloat(floatBitsToUint(r12.y) | floatBitsToUint(r12.x));
/*194*/	    r10.w = uintBitsToFloat(floatBitsToUint(r10.w) | floatBitsToUint(r11.w));
/*195*/	    if(floatBitsToUint(r10.w) == 0u) {
/*196*/	      r10.xy = (r10.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*197*/	      r12.xy = floor((r10.xyxx).xy);
/*198*/	      r13.xy = (r12.xyxx / cb1.data[0].xyxx).xy;
/*199*/	      r9.w = -0.000400 / r9.w;
/*200*/	      r9.w = r9.w + r10.z;
/*201*/	      r13.z = -r13.y + 1.000000;
/*202*/	      r14.xyzw = (textureLod(sHardShadowBuffer, r13.xzxx.st, 0.000000)).xyzw;
/*203*/	      r13.w = -r13.y;
/*204*/	      r15.x = cb1.data[0].z/**/;
/*205*/	      r15.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*206*/	      r10.zw = (r13.xxxw + r15.xxxy).zw;
/*207*/	      r16.xyzw = (textureLod(sHardShadowBuffer, r10.zwzz.st, 0.000000)).xyzw;
/*208*/	      r15.w = -cb1.data[0].w/**/;
/*209*/	      r10.zw = (r13.xxxz + r15.zzzw).zw;
/*210*/	      r15.xyzw = (textureLod(sHardShadowBuffer, r10.zwzz.st, 0.000000)).xyzw;
/*211*/	      r10.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r13.xxxz).zw;
/*212*/	      r13.xyzw = (textureLod(sHardShadowBuffer, r10.zwzz.st, 0.000000)).yzwx;
/*213*/	      r13.x = r14.x;
/*214*/	      r13.y = r16.x;
/*215*/	      r13.z = r15.x;
/*216*/	      r13.xyzw = uintBitsToFloat(uvec4(lessThan(r9.wwww, r13.xyzw)) * 0xffffffffu);
/*217*/	      r14.xyzw = uintBitsToFloat(floatBitsToUint(r13.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*218*/	      r10.xy = (r10.xyxx + -r12.xyxx).xy;
/*219*/	      r10.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r13.xxxz), uvec4(0)))).zw;
/*220*/	      r10.zw = (r10.zzzw + r14.yyyw).zw;
/*221*/	      r10.xz = (r10.xxxx * r10.zzwz + r14.xxzx).xz;
/*222*/	      r9.w = -r10.x + r10.z;
/*223*/	      r9.w = r10.y * r9.w + r10.x;
/*224*/	    } else {
/*225*/	      r9.w = 1.000000;
/*226*/	    }
/*227*/	  } else {
/*228*/	    r9.w = 1.000000;
/*229*/	  }
/*230*/	  r10.x = -cb1.data[floatBitsToUint(r11.x)+36u].x + cb1.data[floatBitsToUint(r11.x)+37u].x;
/*231*/	  r10.y = r10.x * cb1.data[34].x;
/*232*/	  r10.x = -r10.x * cb1.data[34].x + cb1.data[floatBitsToUint(r11.x)+37u].x;
/*233*/	  r10.x = r8.y + -r10.x;
/*234*/	  r10.x = saturate(r10.x / r10.y);
/*235*/	  r9.w = -r11.y + r9.w;
/*236*/	  r11.y = r10.x * r9.w + r11.y;
/*237*/	}
/*238*/	if(floatBitsToUint(r11.z) != 0u) {
/*239*/	  r9.w = -cb1.data[floatBitsToUint(r11.x)+36u].x + cb1.data[floatBitsToUint(r11.x)+37u].x;
/*240*/	  r10.x = r9.w * cb1.data[34].y;
/*241*/	  r9.w = -r9.w * cb1.data[34].y + cb1.data[floatBitsToUint(r11.x)+37u].x;
/*242*/	  r8.y = r8.y + -r9.w;
/*243*/	  r8.y = saturate(r8.y / r10.x);
/*244*/	  r9.w = -r11.y + 1.000000;
/*245*/	  r11.y = r8.y * r9.w + r11.y;
/*246*/	}
/*247*/	r11.y = saturate(r11.y);
/*248*/	r10.xy = (r11.yyyy * vec4(0.850000, 0.800000, 0.000000, 0.000000) + vec4(0.150000, 0.200000, 0.000000, 0.000000)).xy;
/*249*/	r11.xzw = (r7.wwww * cb2.data[8].xxyz).xzw;
/*250*/	r11.xzw = (r11.xxzw * cb2.data[1].xxyz).xzw;
/*251*/	r11.xzw = (r3.wwww * r11.xxzw).xzw;
/*252*/	r12.xyz = (r7.xyzx * cb2.data[8].xyzx).xyz;
/*253*/	r12.xyz = (r3.wwww * r12.xyzx).xyz;
/*254*/	r10.xzw = (r11.xxzw * r10.xxxx + r12.xxyz).xzw;
/*255*/	r11.xzw = (-cb2.data[10].xxyz * cb2.data[10].wwww + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*256*/	r11.xzw = (r3.yyyy * -r11.xxzw).xzw;
/*257*/	r11.xzw = (r11.xxzw * cb3.data[3].xxxx).xzw;
/*258*/	r11.xzw = (r11.xxzw * vec4(1.442695, 0.000000, 1.442695, 1.442695)).xzw;
/*259*/	r11.xzw = (exp2(r11.xxzw)).xzw;
/*260*/	r3.y = min(r3.x, 3.000000);
/*261*/	r6.xz = (r3.yyyy * r6.xxzx).xz;
/*262*/	r12.xy = (r2.xyxx * cb0.data[27].zwzz + r6.xzxx).xy;
/*263*/	r2.xy = (r2.xyxx * cb0.data[29].zwzz + r6.xzxx).xy;
/*264*/	r13.xyzw = (textureLod(gbuffer_channel_4_sampler, r12.xyxx.st, 0.000000)).yzxw;
/*265*/	r13.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*266*/	r13.w = 1.000000;
/*267*/	r14.x = dot(r13.xyzw, cb0.data[21].xyzw);
/*268*/	r14.y = dot(r13.xyzw, cb0.data[22].xyzw);
/*269*/	r14.z = dot(r13.xyzw, cb0.data[23].xyzw);
/*270*/	r2.x = dot(r13.xyzw, cb0.data[24].xyzw);
/*271*/	r13.xyz = (r14.xyzx / r2.xxxx).xyz;
/*272*/	r13.xyz = (r13.xyzx + -cb0.data[0].xyzx).xyz;
/*273*/	r2.x = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*274*/	r13.xyz = (vsOut_T1.xyzx + -cb0.data[0].xyzx).xyz;
/*275*/	r2.y = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*276*/	r2.xy = (sqrt(r2.xyxx)).xy;
/*277*/	r2.x = uintBitsToFloat((r2.y < r2.x) ? 0xffffffffu : 0x00000000u);
/*278*/	r12.xyzw = (texture(refraction_texture_sampler, r12.xyxx.st)).xyzw;
/*279*/	r13.xyzw = (texture(refraction_texture_sampler, r2.zwzz.st)).xyzw;
/*280*/	if(floatBitsToUint(r2.x) != 0u) {
/*281*/	  r13.xyz = (r12.xyzx).xyz;
/*282*/	}
/*283*/	r2.xyz = (r13.xyzx * r11.xzwx + -r10.xzwx).xyz;
/*284*/	r2.xyz = (r11.xzwx * r2.xyzx + r10.xzwx).xyz;
/*285*/	r2.w = -r6.y + 1.000000;
/*286*/	r2.xyz = (r2.wwww * r2.xyzx + r9.xyzx).xyz;
/*287*/	r2.w = dot(vec3(-cb2.data[0].ywzy), vec3(r8.xzwx));
/*288*/	r2.w = max(r2.w, -1.000000);
/*289*/	r2.w = min(r2.w, 1.000000);
/*290*/	r3.y = -abs(r2.w) + 1.000000;
/*291*/	r3.y = sqrt(r3.y);
/*292*/	r6.x = abs(r2.w) * -0.018729 + 0.074261;
/*293*/	r6.x = r6.x * abs(r2.w) + -0.212114;
/*294*/	r6.x = r6.x * abs(r2.w) + 1.570729;
/*295*/	r6.y = r3.y * r6.x;
/*296*/	r6.y = r6.y * -2.000000 + 3.141593;
/*297*/	r2.w = uintBitsToFloat((r2.w < -r2.w) ? 0xffffffffu : 0x00000000u);
/*298*/	r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r6.y));
/*299*/	r2.w = r6.x * r3.y + r2.w;
/*300*/	r3.y = uintBitsToFloat((0.000000 < r3.z) ? 0xffffffffu : 0x00000000u);
/*301*/	if(floatBitsToUint(r3.y) != 0u) {
/*302*/	    r3.z = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.014341 : -0.000001;
/*303*/	  r3.z = r3.z + r3.w;
/*304*/	  r3.z = r3.z * 0.500000 + 0.500000;
/*305*/	  r3.z = r3.z * 2.000000 + -1.000000;
/*306*/	  r3.z = -r3.z * r3.z + 1.000000;
/*307*/	  r3.z = max(r3.z, 0.001000);
/*308*/	  r3.z = log2(r3.z);
/*309*/	  r6.x = r3.z * 4.950617;
/*310*/	  r3.z = r3.z * 0.346574 + 4.546885;
/*311*/	  r6.x = r3.z * r3.z + -r6.x;
/*312*/	  r6.x = sqrt(r6.x);
/*313*/	  r3.z = -r3.z + r6.x;
/*314*/	  r3.z = max(r3.z, 0.000000);
/*315*/	  r3.z = sqrt(r3.z);
/*316*/	  r3.z = r3.z * 1.414214;
/*317*/	  r3.z = 0.008727 / r3.z;
/*318*/	  r3.z = max(r3.z, 0.000100);
/*319*/	  r6.xy = (r2.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*320*/	  r3.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.z)).z;
/*321*/	  r6.xy = (r3.zzzz * r6.xyxx).xy;
/*322*/	  r9.xy = (r6.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*323*/	  r9.xy = (r9.xyxx * r9.xyxx).xy;
/*324*/	  r12.xyzw = r9.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*325*/	  r9.zw = (r12.xxxz / r12.yyyw).zw;
/*326*/	  r9.xy = (r9.zwzz * -r9.xyxx).xy;
/*327*/	  r6.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r6.xxyx)) * 0xffffffffu)).yz;
/*328*/	  r3.z = uintBitsToFloat((r6.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*329*/	  r3.z = intBitsToFloat(1 + ~floatBitsToInt(r6.y) + floatBitsToInt(r3.z));
/*330*/	  r3.z = floatBitsToInt(r3.z);
/*331*/	  r6.xy = (r9.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*332*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*333*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*334*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*335*/	  r3.z = r3.z * r6.x + 1.000000;
/*336*/	  r3.z = r3.z * 0.500000;
/*337*/	  r6.x = 1 + ~floatBitsToInt(r6.z);
/*338*/	  r6.x = r6.x * r6.y + 1.000000;
/*339*/	  r3.z = r6.x * 0.500000 + -r3.z;
/*340*/	  r6.x = min(r6.w, 1.000000);
/*341*/	  r6.x = r6.x + -1.000000;
/*342*/	  r6.x = r6.x * 0.982287 + 1.000000;
/*343*/	  r6.y = dot(vec3(-cb2.data[0].yzwy), vec3(-r1.xyzx));
/*344*/	  r6.y = max(r6.y, 0.000000);
/*345*/	  r6.y = log2(r6.y);
/*346*/	  r6.y = r6.y * 10.000000;
/*347*/	  r6.y = exp2(r6.y);
/*348*/	  r6.y = r6.y * 0.453839 + 0.020000;
/*349*/	  r3.z = abs(r3.z) * r6.x;
/*350*/	  r6.xyz = (r6.yyyy * r3.zzzz).xyz;
/*351*/	} else {
/*352*/	  r6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*353*/	}
/*354*/	r6.xyz = (r6.xyzx * cb2.data[1].xyzx).xyz;
/*355*/	if(floatBitsToUint(r3.y) != 0u) {
/*356*/	    r1.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.248975 : -0.000025;
/*357*/	  r1.w = r1.w + r3.w;
/*358*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*359*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*360*/	  r1.w = -r1.w * r1.w + 1.000000;
/*361*/	  r1.w = max(r1.w, 0.001000);
/*362*/	  r1.w = log2(r1.w);
/*363*/	  r3.y = r1.w * 4.950617;
/*364*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*365*/	  r3.y = r1.w * r1.w + -r3.y;
/*366*/	  r3.y = sqrt(r3.y);
/*367*/	  r1.w = -r1.w + r3.y;
/*368*/	  r1.w = max(r1.w, 0.000000);
/*369*/	  r1.w = sqrt(r1.w);
/*370*/	  r1.w = r1.w * 1.414214;
/*371*/	  r1.w = 0.008727 / r1.w;
/*372*/	  r1.w = max(r1.w, 0.000100);
/*373*/	  r3.yz = (r2.wwww + vec4(0.000000, -0.008727, 0.008727, 0.000000)).yz;
/*374*/	  r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*375*/	  r3.yz = (r1.wwww * r3.yyzy).yz;
/*376*/	  r9.xy = (r3.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*377*/	  r9.xy = (r9.xyxx * r9.xyxx).xy;
/*378*/	  r12.xyzw = r9.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*379*/	  r9.zw = (r12.xxxz / r12.yyyw).zw;
/*380*/	  r9.xy = (r9.zwzz * -r9.xyxx).xy;
/*381*/	  r9.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.yyyz)) * 0xffffffffu)).zw;
/*382*/	  r1.w = uintBitsToFloat((r3.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*383*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r9.z) + floatBitsToInt(r1.w));
/*384*/	  r1.w = floatBitsToInt(r1.w);
/*385*/	  r3.yz = (r9.xxyx * vec4(0.000000, 1.442695, 1.442695, 0.000000)).yz;
/*386*/	  r3.yz = (exp2(r3.yyzy)).yz;
/*387*/	  r3.yz = (-r3.yyzy + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*388*/	  r3.yz = (sqrt(r3.yyzy)).yz;
/*389*/	  r1.w = r1.w * r3.y + 1.000000;
/*390*/	  r1.w = r1.w * 0.500000;
/*391*/	  r2.w = 1 + ~floatBitsToInt(r9.w);
/*392*/	  r2.w = r2.w * r3.z + 1.000000;
/*393*/	  r1.w = r2.w * 0.500000 + -r1.w;
/*394*/	  r2.w = min(r6.w, 1.000000);
/*395*/	  r2.w = r2.w + -1.000000;
/*396*/	  r2.w = r2.w * 0.707107 + 1.000000;
/*397*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(-r1.xyzx));
/*398*/	  r1.x = max(r1.x, 0.000000);
/*399*/	  r1.x = log2(r1.x);
/*400*/	  r1.x = r1.x * 10.000000;
/*401*/	  r1.x = exp2(r1.x);
/*402*/	  r1.x = r1.x * 0.830475 + 0.020000;
/*403*/	  r1.y = abs(r1.w) * r2.w;
/*404*/	  r1.xyz = (r1.xxxx * r1.yyyy).xyz;
/*405*/	} else {
/*406*/	  r1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*407*/	}
/*408*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*409*/	r1.xyz = (r1.xyzx * vec4(0.700000, 0.700000, 0.700000, 0.000000)).xyz;
/*410*/	r1.xyz = (r6.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r1.xyzx).xyz;
/*411*/	r1.xyz = (r11.yyyy * r1.xyzx + r2.xyzx).xyz;
/*412*/	r4.xw = (-r4.zzzz + vec4(0.100000, 0.000000, 0.000000, 1.000000)).xw;
/*413*/	r1.w = saturate(r4.x * 9.999998);
/*414*/	r2.x = r1.w * -2.000000 + 3.000000;
/*415*/	r1.w = r1.w * r1.w;
/*416*/	r4.xyzw = (texture(colour_overlay_texture_sampler, r4.ywyy.st)).xyzw;
/*417*/	r1.w = -r2.x * r1.w + 1.000000;
/*418*/	r4.w = r1.w * r4.w;
/*419*/	r1.w = min(vsOut_T6.w, 1000.000000);
/*420*/	r1.w = -r1.w * 0.001000 + 1.000000;
/*421*/	r2.xy = (vsOut_T5.xyxx).xy;
/*422*/	r2.z = cb3.data[4].x/**/;
/*423*/	r2.xyzw = (texture(g_foam_anim_sampler, r2.xyzx.stp)).xyzw;
/*424*/	r6.xy = (vsOut_T5.xyxx).xy;
/*425*/	r6.z = cb3.data[4].y/**/;
/*426*/	r9.xyzw = (texture(g_foam_anim_sampler, r6.xyzx.stp)).xyzw;
/*427*/	r2.x = -r2.y + r9.y;
/*428*/	r2.x = cb3.data[4].z * r2.x + r2.y;
/*429*/	r1.w = r1.w * r2.x;
/*430*/	r2.x = r1.w * r1.w;
/*431*/	r2.x = r2.x * r2.x;
/*432*/	r2.yz = (vsOut_T5.xxyx * vec4(0.000000, 15.000000, 15.000000, 0.000000)).yz;
/*433*/	r9.xyzw = (texture(g_static_foam_sampler, r2.yzyy.st)).xyzw;
/*434*/	r2.x = r2.x * r9.y;
/*435*/	r2.y = r1.w * r9.z;
/*436*/	r1.w = -r9.z * r1.w + 1.000000;
/*437*/	r1.w = r1.w * r2.x + r2.y;
/*438*/	r2.x = cb0.data[26].x * 0.050000;
/*439*/	r2.yz = (vsOut_T5.xxyx * vec4(0.000000, 7.500000, 7.500000, 0.000000) + -r2.xxxx).yz;
/*440*/	r9.xyzw = (texture(g_static_foam_sampler, r2.yzyy.st)).xyzw;
/*441*/	r2.xy = (vsOut_T5.xyxx * vec4(7.500000, 7.500000, 0.000000, 0.000000) + r2.xxxx).xy;
/*442*/	r2.xyzw = (texture(g_static_foam_sampler, r2.xyxx.st)).xyzw;
/*443*/	r2.x = r2.y * r9.z;
/*444*/	r2.x = sqrt(r2.x);
/*445*/	r2.y = saturate(r3.x + -0.600000);
/*446*/	r2.y = -r2.y + 1.000000;
/*447*/	r2.x = min(r2.x, 1.000000);
/*448*/	r2.x = r2.y * r2.x;
/*449*/	r2.y = -r1.w + 1.000000;
/*450*/	r1.w = r2.y * r2.x + r1.w;
/*451*/	r2.x = r3.x * 1.666667;
/*452*/	r2.x = min(r2.x, 1.000000);
/*453*/	r2.w = r1.w * r2.x;
/*454*/	r2.xyz = (vec4(0.400000, 0.500000, 0.600000, 0)).xyz;
/*455*/	r9.xyzw = -r2.xyzw + r4.xyzw;
/*456*/	r2.xyzw = r4.wwww * r9.xyzw + r2.xyzw;
/*457*/	r3.xyz = (r6.wwww * r2.xyzx).xyz;
/*458*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*459*/	r3.xyz = (r3.wwww * r3.xyzx).xyz;
/*460*/	r2.xyz = (r7.xyzx * r2.xyzx).xyz;
/*461*/	r2.xyz = (r3.wwww * r2.xyzx).xyz;
/*462*/	r2.xyz = (r3.xyzx * r10.yyyy + r2.xyzx).xyz;
/*463*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*464*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*465*/	r5.xw = (-r5.zzzz + vec4(0.100000, 0.000000, 0.000000, 1.000000)).xw;
/*466*/	r1.w = saturate(r5.x * 9.999998);
/*467*/	r2.x = r1.w * -2.000000 + 3.000000;
/*468*/	r1.w = r1.w * r1.w;
/*469*/	r4.xyzw = (texture(ui_colour_overlay_texture_sampler, r5.ywyy.st)).xyzw;
/*470*/	r1.w = -r2.x * r1.w + 1.000000;
/*471*/	r1.w = r1.w * r4.w;
/*472*/	r2.x = dot(vec3(cb2.data[1].xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*473*/	r2.x = r3.w * r2.x;
/*474*/	r2.x = r2.x * 0.250000;
/*475*/	r2.xyz = (r4.xyzx * r2.xxxx + -r1.xyzx).xyz;
/*476*/	color3.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*477*/	r0.xyz = (r0.xyzx * r0.wwww + r8.xwzx).xyz;
/*478*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*479*/	r0.w = inversesqrt(r0.w);
/*480*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*481*/	r0.w = max(abs(r0.z), abs(r0.y));
/*482*/	r0.w = max(r0.w, abs(r0.x));
/*483*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*484*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*485*/	color0.w = 0.120000;
/*486*/	color1.xyzw = vec4(0, 0, 0, 0.020000);
/*487*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*488*/	color3.w = 1.000000;
/*489*/	return;
}
