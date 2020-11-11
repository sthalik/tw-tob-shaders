//
//
// Shader Model 4
// Fragment Shader
//
// id: 4629 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidriver.hlsl_PS_ps30_main_battle_river.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D sHardShadowBuffer;
uniform sampler2D s_normal;
uniform samplerCube s_environment;
uniform sampler2D s_terrain_refraction;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_sky;

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
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform wind_PS
{
  vec4 data[1];
} cb4;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;

/*0*/	r0.xy = (vsOut_T5.xyxx * vec4(5.900000, 177.000000, 0.000000, 0.000000)).xy;
/*1*/	r1.xyz = (cb0.data[26].xxxx * vec4(-0.008000, 0.024000, 0.120000, 0.000000)).xyz;
/*2*/	r0.zw = (cb4.data[0].yyyx * vec4(0.000000, 0.000000, -1.000000, 1.000000)).zw;
/*3*/	r2.xyzw = r1.xxyy * r0.zwzw + r0.xyxy;
/*4*/	r2.xyzw = r2.xyzw + vec4(0.400000, 0.400000, 0.400000, 0.400000);
/*5*/	r0.xy = (r1.zzzz * cb4.data[0].xyxx + r0.xyxx).xy;
/*6*/	r1.x = 0;
/*7*/	r1.y = cb0.data[26].x * 0.050000;
/*8*/	r2.xyzw = -r1.xyxy + r2.xyzw;
/*9*/	r0.xy = (r0.xyxx + -r1.xyxx).xy;
/*10*/	r1.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*11*/	r3.x = uintBitsToFloat((vsOut_T0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*12*/	r3.y = uintBitsToFloat((vsOut_T0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*13*/	r3.z = uintBitsToFloat((vsOut_T0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*14*/	r3.w = uintBitsToFloat((vsOut_T0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*15*/	r3.xyzw = uintBitsToFloat(floatBitsToUint(r3.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*16*/	r0.z = dot(r3.xyzw, r3.xyzw);
/*17*/	r0.w = intBitsToFloat(int(r0.z));
/*18*/	r3.x = uintBitsToFloat((r0.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*19*/	if(floatBitsToUint(r3.x) != 0u) {
/*20*/	  r3.x = intBitsToFloat(floatBitsToInt(r0.w) << int(2));
/*21*/	  r1.w = 1.000000;
/*22*/	  r4.x = dot(r1.xyzw, cb1.data[floatBitsToUint(r3.x)+2u].xyzw);
/*23*/	  r4.y = dot(r1.xyzw, cb1.data[floatBitsToUint(r3.x)+3u].xyzw);
/*24*/	  r4.z = dot(r1.xyzw, cb1.data[floatBitsToUint(r3.x)+4u].xyzw);
/*25*/	  r3.x = dot(r1.xyzw, cb1.data[floatBitsToUint(r3.x)+5u].xyzw);
/*26*/	  r3.yzw = (r4.xxyz / r3.xxxx).yzw;
/*27*/	  r4.xy = (uintBitsToFloat(uvec4(lessThan(r3.yzyy, cb1.data[floatBitsToUint(r0.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*28*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.y) | floatBitsToUint(r4.x));
/*29*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r0.w)+41u].zzwz, r3.yyzy)) * 0xffffffffu)).yz;
/*30*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.z) | floatBitsToUint(r4.y));
/*31*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.y) | floatBitsToUint(r4.x));
/*32*/	  if(floatBitsToUint(r4.x) == 0u) {
/*33*/	    r3.yz = (r3.yyzy * cb1.data[0].xxyx + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*34*/	    r4.xy = floor((r3.yzyy).xy);
/*35*/	    r5.xy = (r4.xyxx / cb1.data[0].xyxx).xy;
/*36*/	    r3.x = -0.000400 / r3.x;
/*37*/	    r3.x = r3.x + r3.w;
/*38*/	    r5.z = -r5.y + 1.000000;
/*39*/	    r6.xyzw = (textureLod(sHardShadowBuffer, r5.xzxx.st, 0.000000)).xyzw;
/*40*/	    r5.w = -r5.y;
/*41*/	    r7.x = cb1.data[0].z/**/;
/*42*/	    r7.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*43*/	    r4.zw = (r5.xxxw + r7.xxxy).zw;
/*44*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r4.zwzz.st, 0.000000)).xyzw;
/*45*/	    r7.w = -cb1.data[0].w/**/;
/*46*/	    r4.zw = (r5.xxxz + r7.zzzw).zw;
/*47*/	    r7.xyzw = (textureLod(sHardShadowBuffer, r4.zwzz.st, 0.000000)).xyzw;
/*48*/	    r4.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r5.xxxz).zw;
/*49*/	    r5.xyzw = (textureLod(sHardShadowBuffer, r4.zwzz.st, 0.000000)).yzwx;
/*50*/	    r5.x = r6.x;
/*51*/	    r5.y = r8.x;
/*52*/	    r5.z = r7.x;
/*53*/	    r5.xyzw = uintBitsToFloat(uvec4(lessThan(r3.xxxx, r5.xyzw)) * 0xffffffffu);
/*54*/	    r6.xyzw = uintBitsToFloat(floatBitsToUint(r5.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*55*/	    r3.xy = (r3.yzyy + -r4.xyxx).xy;
/*56*/	    r3.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r5.xxxz), uvec4(0)))).zw;
/*57*/	    r3.zw = (r3.zzzw + r6.yyyw).zw;
/*58*/	    r3.xz = (r3.xxxx * r3.zzwz + r6.xxzx).xz;
/*59*/	    r3.z = -r3.x + r3.z;
/*60*/	    r3.x = r3.y * r3.z + r3.x;
/*61*/	  } else {
/*62*/	    r3.x = 1.000000;
/*63*/	  }
/*64*/	} else {
/*65*/	  r3.x = 1.000000;
/*66*/	}
/*67*/	r3.y = cb1.data[34].w + -1.000000;
/*68*/	r0.z = uintBitsToFloat((r0.z == r3.y) ? 0xffffffffu : 0x00000000u);
/*69*/	r3.y = uintBitsToFloat((floatBitsToInt(r0.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*70*/	if(floatBitsToUint(r0.z) == 0u) {
/*71*/	  r0.z = intBitsToFloat(floatBitsToInt(r0.w) + int(1));
/*72*/	  r0.z = floatBitsToInt(r0.z);
/*73*/	  r0.z = uintBitsToFloat((r0.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*74*/	  if(floatBitsToUint(r0.z) != 0u) {
/*75*/	    r0.z = intBitsToFloat(floatBitsToInt(r0.w) << int(2));
/*76*/	    r1.w = 1.000000;
/*77*/	    r4.x = dot(r1.xyzw, cb1.data[floatBitsToUint(r0.z)+6u].xyzw);
/*78*/	    r4.y = dot(r1.xyzw, cb1.data[floatBitsToUint(r0.z)+7u].xyzw);
/*79*/	    r4.z = dot(r1.xyzw, cb1.data[floatBitsToUint(r0.z)+8u].xyzw);
/*80*/	    r0.z = dot(r1.xyzw, cb1.data[floatBitsToUint(r0.z)+9u].xyzw);
/*81*/	    r1.xyz = (r4.xyzx / r0.zzzz).xyz;
/*82*/	    r3.zw = (uintBitsToFloat(uvec4(lessThan(r1.xxxy, cb1.data[floatBitsToUint(r0.w)+42u].xxxy)) * 0xffffffffu)).zw;
/*83*/	    r1.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r3.z));
/*84*/	    r3.zw = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r0.w)+42u].zzzw, r1.xxxy)) * 0xffffffffu)).zw;
/*85*/	    r3.z = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r3.z));
/*86*/	    r1.w = uintBitsToFloat(floatBitsToUint(r1.w) | floatBitsToUint(r3.z));
/*87*/	    if(floatBitsToUint(r1.w) == 0u) {
/*88*/	      r1.xy = (r1.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*89*/	      r3.zw = floor((r1.xxxy).zw);
/*90*/	      r4.xy = (r3.zwzz / cb1.data[0].xyxx).xy;
/*91*/	      r0.z = -0.000400 / r0.z;
/*92*/	      r0.z = r0.z + r1.z;
/*93*/	      r4.z = -r4.y + 1.000000;
/*94*/	      r5.xyzw = (textureLod(sHardShadowBuffer, r4.xzxx.st, 0.000000)).xyzw;
/*95*/	      r4.w = -r4.y;
/*96*/	      r6.x = cb1.data[0].z/**/;
/*97*/	      r6.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*98*/	      r1.zw = (r4.xxxw + r6.xxxy).zw;
/*99*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r1.zwzz.st, 0.000000)).xyzw;
/*100*/	      r6.w = -cb1.data[0].w/**/;
/*101*/	      r1.zw = (r4.xxxz + r6.zzzw).zw;
/*102*/	      r6.xyzw = (textureLod(sHardShadowBuffer, r1.zwzz.st, 0.000000)).xyzw;
/*103*/	      r1.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r4.xxxz).zw;
/*104*/	      r4.xyzw = (textureLod(sHardShadowBuffer, r1.zwzz.st, 0.000000)).yzwx;
/*105*/	      r4.x = r5.x;
/*106*/	      r4.y = r7.x;
/*107*/	      r4.z = r6.x;
/*108*/	      r4.xyzw = uintBitsToFloat(uvec4(lessThan(r0.zzzz, r4.xyzw)) * 0xffffffffu);
/*109*/	      r5.xyzw = uintBitsToFloat(floatBitsToUint(r4.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*110*/	      r1.xy = (r1.xyxx + -r3.zwzz).xy;
/*111*/	      r1.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r4.xxxz), uvec4(0)))).zw;
/*112*/	      r1.zw = (r1.zzzw + r5.yyyw).zw;
/*113*/	      r1.xz = (r1.xxxx * r1.zzwz + r5.xxzx).xz;
/*114*/	      r0.z = -r1.x + r1.z;
/*115*/	      r0.z = r1.y * r0.z + r1.x;
/*116*/	    } else {
/*117*/	      r0.z = 1.000000;
/*118*/	    }
/*119*/	  } else {
/*120*/	    r0.z = 1.000000;
/*121*/	  }
/*122*/	  r1.x = -cb1.data[floatBitsToUint(r0.w)+36u].x + cb1.data[floatBitsToUint(r0.w)+37u].x;
/*123*/	  r1.y = r1.x * cb1.data[34].x;
/*124*/	  r1.x = -r1.x * cb1.data[34].x + cb1.data[floatBitsToUint(r0.w)+37u].x;
/*125*/	  r1.x = -r1.x + vsOut_T0.w;
/*126*/	  r1.x = saturate(r1.x / r1.y);
/*127*/	  r0.z = -r3.x + r0.z;
/*128*/	  r3.x = r1.x * r0.z + r3.x;
/*129*/	}
/*130*/	if(floatBitsToUint(r3.y) != 0u) {
/*131*/	  r0.z = -cb1.data[floatBitsToUint(r0.w)+36u].x + cb1.data[floatBitsToUint(r0.w)+37u].x;
/*132*/	  r1.x = r0.z * cb1.data[34].y;
/*133*/	  r0.z = -r0.z * cb1.data[34].y + cb1.data[floatBitsToUint(r0.w)+37u].x;
/*134*/	  r0.z = -r0.z + vsOut_T0.w;
/*135*/	  r0.z = saturate(r0.z / r1.x);
/*136*/	  r0.w = -r3.x + 1.000000;
/*137*/	  r3.x = r0.z * r0.w + r3.x;
/*138*/	}
/*139*/	r3.x = saturate(r3.x);
/*140*/	r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*141*/	r0.zw = (r0.zzzw * cb0.data[27].zzzw).zw;
/*142*/	r1.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*143*/	r0.xy = (r0.xyxx + r0.xyxx).xy;
/*144*/	r1.xyzw = (texture(s_normal, r1.xyxx.st)).xyzw;
/*145*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*146*/	r1.xz = (r1.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*147*/	r1.w = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*148*/	r1.w = -r1.w + 1.000000;
/*149*/	r1.w = max(r1.w, 0.000000);
/*150*/	r1.y = sqrt(r1.w);
/*151*/	r2.xyzw = (texture(s_normal, r2.zwzz.st)).xyzw;
/*152*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*153*/	r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*154*/	r1.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*155*/	r1.w = -r1.w + 1.000000;
/*156*/	r1.w = max(r1.w, 0.000000);
/*157*/	r2.y = sqrt(r1.w);
/*158*/	r4.xyzw = (texture(s_normal, r0.xyxx.st)).xyzw;
/*159*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*160*/	r4.xz = (r0.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*161*/	r0.x = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*162*/	r0.x = -r0.x + 1.000000;
/*163*/	r0.x = max(r0.x, 0.000000);
/*164*/	r4.y = sqrt(r0.x);
/*165*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*166*/	r1.xyz = (r4.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r1.xyzx).xyz;
/*167*/	r1.xyz = (r1.xyzx + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*168*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*169*/	r0.x = inversesqrt(r0.x);
/*170*/	r1.xyz = (r0.xxxx * r1.xyzx).xyz;
/*171*/	r2.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*172*/	r0.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*173*/	r0.x = inversesqrt(r0.x);
/*174*/	r3.yzw = (r0.xxxx * r2.xxyz).yzw;
/*175*/	r0.y = dot(vec3(-r3.yzwy), vec3(r1.xyzx));
/*176*/	r0.y = r0.y + r0.y;
/*177*/	r4.xyz = (r1.xyzx * -r0.yyyy + -r3.yzwy).xyz;
/*178*/	r0.y = saturate(r4.y + 1.000000);
/*179*/	r4.w = abs(r4.y);
/*180*/	r1.w = dot(vec3(r4.xwzx), vec3(-r3.yzwy));
/*181*/	r1.w = max(r1.w, 0.000100);
/*182*/	r2.w = r1.w * r1.w;
/*183*/	r2.w = r2.w * r2.w;
/*184*/	r1.w = r1.w * r2.w;
/*185*/	r1.w = r1.w * 0.250000 + 0.150000;
/*186*/	r0.y = r0.y * r1.w;
/*187*/	if(floatBitsToUint(cb2.data[11].y) == 0u) {
/*188*/	  r5.xyzw = (textureLod(s_environment, r4.xwzx.stp, 0.000000)).xyzw;
/*189*/	  r5.xyz = (r0.yyyy * r5.xyzx).xyz;
/*190*/	} else {
/*191*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*192*/	}
/*193*/	r1.w = max(-cb2.data[0].z, 0.000000);
/*194*/	r6.xyz = (cb2.data[0].yzwy * vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*195*/	r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(-r6.xyzx));
/*196*/	r2.w = max(r2.w, 0.000100);
/*197*/	r4.y = r2.w * r2.w;
/*198*/	r4.y = r4.y * r4.y;
/*199*/	r2.w = r2.w * r4.y;
/*200*/	r2.w = r2.w * 0.250000 + 0.150000;
/*201*/	r2.w = -r2.w + 1.000000;
/*202*/	r1.w = r1.w * r2.w;
/*203*/	r6.xyz = (r1.wwww * cb2.data[8].xyzx).xyz;
/*204*/	r6.xyz = (r6.xyzx * cb2.data[1].xyzx).xyz;
/*205*/	r6.xyz = (r6.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*206*/	r1.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*207*/	r2.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*208*/	r6.xyz = (r2.wwww * r6.xyzx).xyz;
/*209*/	r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, 0.000000)).yzxw;
/*210*/	r7.xy = (r0.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*211*/	r7.w = 1.000000;
/*212*/	r4.y = dot(r7.xyzw, cb0.data[19].xyzw);
/*213*/	r5.w = dot(r7.xyzw, cb0.data[20].xyzw);
/*214*/	r4.y = r4.y / r5.w;
/*215*/	r4.y = r4.y + -vsOut_T0.w;
/*216*/	r4.y = max(r4.y, 0.000000);
/*217*/	r5.w = dot(r7.xyzw, cb0.data[22].xyzw);
/*218*/	r6.w = dot(r7.xyzw, cb0.data[24].xyzw);
/*219*/	r5.w = r5.w / r6.w;
/*220*/	r5.w = -r5.w + vsOut_T0.y;
/*221*/	r5.w = max(r5.w, 0.000000);
/*222*/	r6.w = r5.w * 4.000000;
/*223*/	r6.w = min(r6.w, 1.000000);
/*224*/	r7.xyzw = (textureLod(s_terrain_refraction, r0.zwzz.st, r0.w)).xyzw;
/*225*/	r7.xy = (r1.xzxx * r7.wwww).xy;
/*226*/	r7.xy = (r6.wwww * r7.xyxx).xy;
/*227*/	r0.zw = (r7.xxxy * vec4(0.000000, 0.000000, 0.008333, 0.008333) + r0.zzzw).zw;
/*228*/	r7.xyzw = (textureLod(s_terrain_refraction, r0.zwzz.st, r0.w)).xyzw;
/*229*/	r8.xyzw = log2(cb2.data[10].xyzw);
/*230*/	r8.xyz = (r5.wwww * r8.xyzx).xyz;
/*231*/	r8.xyz = (exp2(r8.xyzx)).xyz;
/*232*/	r0.z = r4.y * r8.w;
/*233*/	r0.z = exp2(r0.z);
/*234*/	r0.z = min(r0.z, 1.000000);
/*235*/	r7.xyz = (r7.xyzx * r8.xyzx + -r6.xyzx).xyz;
/*236*/	r6.xyz = (r0.zzzz * r7.xyzx + r6.xyzx).xyz;
/*237*/	r0.y = -r0.y * r6.w + 1.000000;
/*238*/	r0.yzw = (r6.xxyz * r0.yyyy).yzw;
/*239*/	r0.yzw = (r5.xxyz * r6.wwww + r0.yyzw).yzw;
/*240*/	r4.y = dot(vec3(-cb2.data[0].ywzy), vec3(r4.xzwx));
/*241*/	r4.y = max(r4.y, -1.000000);
/*242*/	r4.y = min(r4.y, 1.000000);
/*243*/	r5.x = -abs(r4.y) + 1.000000;
/*244*/	r5.x = sqrt(r5.x);
/*245*/	r5.y = abs(r4.y) * -0.018729 + 0.074261;
/*246*/	r5.y = r5.y * abs(r4.y) + -0.212114;
/*247*/	r5.y = r5.y * abs(r4.y) + 1.570729;
/*248*/	r5.z = r5.x * r5.y;
/*249*/	r5.z = r5.z * -2.000000 + 3.141593;
/*250*/	r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*251*/	r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.z));
/*252*/	r4.y = r5.y * r5.x + r4.y;
/*253*/	r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r1.xyzx));
/*254*/	r1.y = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*255*/	if(floatBitsToUint(r1.y) != 0u) {
/*256*/	    r1.z = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.487991 : -0.000049;
/*257*/	  r1.z = r1.z + r2.w;
/*258*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*259*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*260*/	  r1.z = -r1.z * r1.z + 1.000000;
/*261*/	  r1.z = max(r1.z, 0.001000);
/*262*/	  r1.z = log2(r1.z);
/*263*/	  r5.x = r1.z * 4.950617;
/*264*/	  r1.z = r1.z * 0.346574 + 4.546885;
/*265*/	  r5.x = r1.z * r1.z + -r5.x;
/*266*/	  r5.x = sqrt(r5.x);
/*267*/	  r1.z = -r1.z + r5.x;
/*268*/	  r1.z = max(r1.z, 0.000000);
/*269*/	  r1.z = sqrt(r1.z);
/*270*/	  r1.z = r1.z * 1.414214;
/*271*/	  r1.z = 0.008727 / r1.z;
/*272*/	  r1.z = max(r1.z, 0.000100);
/*273*/	  r5.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*274*/	  r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*275*/	  r5.xy = (r1.zzzz * r5.xyxx).xy;
/*276*/	  r5.zw = (r5.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*277*/	  r5.zw = (r5.zzzw * r5.zzzw).zw;
/*278*/	  r7.xyzw = r5.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*279*/	  r6.xy = (r7.xzxx / r7.ywyy).xy;
/*280*/	  r5.zw = (-r5.zzzw * r6.xxxy).zw;
/*281*/	  r6.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*282*/	  r1.z = uintBitsToFloat((r5.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*283*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*284*/	  r1.z = floatBitsToInt(r1.z);
/*285*/	  r5.xy = (r5.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*286*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*287*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*288*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*289*/	  r1.z = r1.z * r5.x + 1.000000;
/*290*/	  r1.z = r1.z * 0.500000;
/*291*/	  r5.x = 1 + ~floatBitsToInt(r6.y);
/*292*/	  r5.x = r5.x * r5.y + 1.000000;
/*293*/	  r1.z = r5.x * 0.500000 + -r1.z;
/*294*/	  r5.x = saturate(r1.x);
/*295*/	  r5.x = r5.x + -1.000000;
/*296*/	  r5.x = r5.x * 0.453991 + 1.000000;
/*297*/	  r5.y = dot(vec3(-cb2.data[0].yzwy), vec3(-r3.yzwy));
/*298*/	  r5.y = max(r5.y, 0.000000);
/*299*/	  r5.y = log2(r5.y);
/*300*/	  r5.y = r5.y * 10.000000;
/*301*/	  r5.y = exp2(r5.y);
/*302*/	  r5.y = r5.y * 0.804248 + 0.150000;
/*303*/	  r1.z = abs(r1.z) * r5.x;
/*304*/	  r5.xyz = (r5.yyyy * r1.zzzz).xyz;
/*305*/	} else {
/*306*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*307*/	}
/*308*/	r5.xyz = (r5.xyzx * cb2.data[1].xyzx).xyz;
/*309*/	if(floatBitsToUint(r1.y) != 0u) {
/*310*/	    r1.y = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.159344 : -0.000016;
/*311*/	  r1.y = r1.y + r2.w;
/*312*/	  r1.y = r1.y * 0.500000 + 0.500000;
/*313*/	  r1.y = r1.y * 2.000000 + -1.000000;
/*314*/	  r1.y = -r1.y * r1.y + 1.000000;
/*315*/	  r1.y = max(r1.y, 0.001000);
/*316*/	  r1.y = log2(r1.y);
/*317*/	  r1.z = r1.y * 4.950617;
/*318*/	  r1.y = r1.y * 0.346574 + 4.546885;
/*319*/	  r1.z = r1.y * r1.y + -r1.z;
/*320*/	  r1.z = sqrt(r1.z);
/*321*/	  r1.y = -r1.y + r1.z;
/*322*/	  r1.y = max(r1.y, 0.000000);
/*323*/	  r1.y = sqrt(r1.y);
/*324*/	  r1.y = r1.y * 1.414214;
/*325*/	  r1.y = 0.008727 / r1.y;
/*326*/	  r1.y = max(r1.y, 0.000100);
/*327*/	  r1.zw = (r4.yyyy + vec4(0.000000, 0.000000, -0.008727, 0.008727)).zw;
/*328*/	  r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*329*/	  r1.yz = (r1.yyyy * r1.zzwz).yz;
/*330*/	  r6.xy = (r1.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*331*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*332*/	  r7.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*333*/	  r7.xy = (r7.xzxx / r7.ywyy).xy;
/*334*/	  r6.xy = (-r6.xyxx * r7.xyxx).xy;
/*335*/	  r1.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.yyyz)) * 0xffffffffu)).zw;
/*336*/	  r1.y = uintBitsToFloat((r1.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*337*/	  r1.y = intBitsToFloat(1 + ~floatBitsToInt(r1.z) + floatBitsToInt(r1.y));
/*338*/	  r1.y = floatBitsToInt(r1.y);
/*339*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*340*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*341*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*342*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*343*/	  r1.y = r1.y * r6.x + 1.000000;
/*344*/	  r1.y = r1.y * 0.500000;
/*345*/	  r1.z = 1 + ~floatBitsToInt(r1.w);
/*346*/	  r1.z = r1.z * r6.y + 1.000000;
/*347*/	  r1.y = r1.z * 0.500000 + -r1.y;
/*348*/	  r1.x = saturate(r1.x);
/*349*/	  r1.x = r1.x + -1.000000;
/*350*/	  r1.x = r1.x * 0.809017 + 1.000000;
/*351*/	  r1.z = dot(vec3(-cb2.data[0].yzwy), vec3(-r3.yzwy));
/*352*/	  r1.z = max(r1.z, 0.000000);
/*353*/	  r1.z = log2(r1.z);
/*354*/	  r1.z = r1.z * 10.000000;
/*355*/	  r1.z = exp2(r1.z);
/*356*/	  r1.z = r1.z * 0.660013 + 0.150000;
/*357*/	  r1.x = r1.x * abs(r1.y);
/*358*/	  r1.xyz = (r1.zzzz * r1.xxxx).xyz;
/*359*/	} else {
/*360*/	  r1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*361*/	}
/*362*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*363*/	r1.w = r3.x * r6.w;
/*364*/	r1.xyz = (r1.xyzx * vec4(0.150000, 0.150000, 0.150000, 0.000000)).xyz;
/*365*/	r1.xyz = (r5.xyzx * vec4(0.850000, 0.850000, 0.850000, 0.000000) + r1.xyzx).xyz;
/*366*/	r0.yzw = (r1.wwww * r1.xxyz + r0.yyzw).yzw;
/*367*/	r1.xyz = (r2.xyzx * r0.xxxx + r4.xwzx).xyz;
/*368*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*369*/	r0.x = inversesqrt(r0.x);
/*370*/	r1.xyz = (r0.xxxx * r1.xyzx).xyz;
/*371*/	r0.x = max(abs(r1.z), abs(r1.y));
/*372*/	r0.x = max(r0.x, abs(r1.x));
/*373*/	r1.xyz = (r1.xyzx / r0.xxxx).xyz;
/*374*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*375*/	color0.w = 0.120000;
/*376*/	r1.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*377*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*378*/	r0.x = sqrt(r0.x);
/*379*/	r2.x = saturate(cb3.data[0].w)/**/;
/*380*/	r2.x = -r2.x + 1.000000;
/*381*/	r2.x = r2.x * 8.000000 + -4.000000;
/*382*/	r2.y = saturate(cb3.data[1].x)/**/;
/*383*/	r2.y = -r2.y + 1.000000;
/*384*/	r2.y = r2.y * 1000.000000;
/*385*/	r0.x = r0.x / r2.y;
/*386*/	r0.x = r0.x + r2.x;
/*387*/	r0.x = r0.x * 1.442695;
/*388*/	r0.x = exp2(r0.x);
/*389*/	r0.x = cb3.data[1].y / r0.x;
/*390*/	r0.x = saturate(-r0.x + cb3.data[1].y);
/*391*/	r2.x = -vsOut_T0.y + cb3.data[1].w;
/*392*/	r2.y = -cb3.data[1].z + cb3.data[1].w;
/*393*/	r2.x = r2.x + -cb3.data[1].z;
/*394*/	r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.y)).y;
/*395*/	r2.x = saturate(r2.y * r2.x);
/*396*/	r2.y = r2.x * -2.000000 + 3.000000;
/*397*/	r2.x = r2.x * r2.x;
/*398*/	r2.x = r2.x * r2.y;
/*399*/	r2.y = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*400*/	r2.y = sqrt(r2.y);
/*401*/	r2.z = max(cb3.data[2].z, 0.001000);
/*402*/	r2.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).z;
/*403*/	r2.y = r2.z * r2.y;
/*404*/	r2.y = min(r2.y, 1.000000);
/*405*/	r2.z = r2.y * -2.000000 + 3.000000;
/*406*/	r2.y = r2.y * r2.y;
/*407*/	r2.y = r2.y * r2.z;
/*408*/	r0.x = cb3.data[2].x * r2.x + r0.x;
/*409*/	r3.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*410*/	r3.xyz = (r3.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*411*/	r3.xyz = (r3.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*412*/	r4.xyz = (r2.wwww * r3.xyzx).xyz;
/*413*/	r1.w = max(r1.y, 0.000000);
/*414*/	r1.xyzw = (texture(s_sky, r1.xwzx.stp)).xyzw;
/*415*/	r1.w = saturate(dot(vec2(r0.xxxx), vec2(cb3.data[2].yyyy)));
/*416*/	r1.xyz = (-r3.xyzx * r2.wwww + r1.xyzx).xyz;
/*417*/	r1.xyz = (r1.wwww * r1.xyzx + r4.xyzx).xyz;
/*418*/	r0.x = saturate(r0.x * r2.y);
/*419*/	r1.xyz = (-r0.yzwy + r1.xyzx).xyz;
/*420*/	color3.xyz = (r0.xxxx * r1.xyzx + r0.yzwy).xyz;
/*421*/	color1.xyzw = vec4(0, 0, 0, 0.150000);
/*422*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*423*/	color3.w = 1.000000;
/*424*/	return;
}
