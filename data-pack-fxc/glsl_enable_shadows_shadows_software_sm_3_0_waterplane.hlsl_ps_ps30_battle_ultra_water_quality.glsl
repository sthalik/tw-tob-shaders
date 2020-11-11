//
//
// Shader Model 4
// Fragment Shader
//
// id: 6638 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_waterplane.hlsl_PS_ps30_battle_ultra_water_quality.glsl
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
in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D sHardShadowBuffer;
uniform sampler2D s_normal;
uniform samplerCube s_environment;
uniform sampler2D s_terrain_refraction;
uniform sampler2D gbuffer_channel_4_sampler;

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

/*0*/	r0.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T3.xyzx).xyz;
/*1*/	r1.x = uintBitsToFloat((vsOut_T3.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*2*/	r1.y = uintBitsToFloat((vsOut_T3.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*3*/	r1.z = uintBitsToFloat((vsOut_T3.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*4*/	r1.w = uintBitsToFloat((vsOut_T3.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*5*/	r1.xyzw = uintBitsToFloat(floatBitsToUint(r1.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*6*/	r1.x = dot(r1.xyzw, r1.xyzw);
/*7*/	r1.y = intBitsToFloat(int(r1.x));
/*8*/	r1.z = uintBitsToFloat((r1.x < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*9*/	if(floatBitsToUint(r1.z) != 0u) {
/*10*/	  r1.z = intBitsToFloat(floatBitsToInt(r1.y) << int(2));
/*11*/	  r0.w = 1.000000;
/*12*/	  r2.x = dot(r0.xyzw, cb1.data[floatBitsToUint(r1.z)+2u].xyzw);
/*13*/	  r2.y = dot(r0.xyzw, cb1.data[floatBitsToUint(r1.z)+3u].xyzw);
/*14*/	  r2.z = dot(r0.xyzw, cb1.data[floatBitsToUint(r1.z)+4u].xyzw);
/*15*/	  r1.z = dot(r0.xyzw, cb1.data[floatBitsToUint(r1.z)+5u].xyzw);
/*16*/	  r2.xyz = (r2.xyzx / r1.zzzz).xyz;
/*17*/	  r3.xy = (uintBitsToFloat(uvec4(lessThan(r2.xyxx, cb1.data[floatBitsToUint(r1.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*18*/	  r1.w = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*19*/	  r3.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r1.y)+41u].zwzz, r2.xyxx)) * 0xffffffffu)).xy;
/*20*/	  r2.w = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*21*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) | floatBitsToUint(r2.w));
/*22*/	  if(floatBitsToUint(r1.w) == 0u) {
/*23*/	    r2.xy = (r2.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*24*/	    r3.xy = floor((r2.xyxx).xy);
/*25*/	    r4.xy = (r3.xyxx / cb1.data[0].xyxx).xy;
/*26*/	    r1.z = -0.000400 / r1.z;
/*27*/	    r1.z = r1.z + r2.z;
/*28*/	    r4.z = -r4.y + 1.000000;
/*29*/	    r5.xyzw = (textureLod(sHardShadowBuffer, r4.xzxx.st, 0.000000)).xyzw;
/*30*/	    r4.w = -r4.y;
/*31*/	    r6.x = cb1.data[0].z/**/;
/*32*/	    r6.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*33*/	    r2.zw = (r4.xxxw + r6.xxxy).zw;
/*34*/	    r7.xyzw = (textureLod(sHardShadowBuffer, r2.zwzz.st, 0.000000)).xyzw;
/*35*/	    r6.w = -cb1.data[0].w/**/;
/*36*/	    r2.zw = (r4.xxxz + r6.zzzw).zw;
/*37*/	    r6.xyzw = (textureLod(sHardShadowBuffer, r2.zwzz.st, 0.000000)).xyzw;
/*38*/	    r2.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r4.xxxz).zw;
/*39*/	    r4.xyzw = (textureLod(sHardShadowBuffer, r2.zwzz.st, 0.000000)).yzwx;
/*40*/	    r4.x = r5.x;
/*41*/	    r4.y = r7.x;
/*42*/	    r4.z = r6.x;
/*43*/	    r4.xyzw = uintBitsToFloat(uvec4(lessThan(r1.zzzz, r4.xyzw)) * 0xffffffffu);
/*44*/	    r5.xyzw = uintBitsToFloat(floatBitsToUint(r4.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*45*/	    r1.zw = (r2.xxxy + -r3.xxxy).zw;
/*46*/	    r2.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r4.xzxx), uvec4(0)))).xy;
/*47*/	    r2.xy = (r2.xyxx + r5.ywyy).xy;
/*48*/	    r2.xy = (r1.zzzz * r2.xyxx + r5.xzxx).xy;
/*49*/	    r1.z = -r2.x + r2.y;
/*50*/	    r1.z = r1.w * r1.z + r2.x;
/*51*/	  } else {
/*52*/	    r1.z = 1.000000;
/*53*/	  }
/*54*/	} else {
/*55*/	  r1.z = 1.000000;
/*56*/	}
/*57*/	r1.w = cb1.data[34].w + -1.000000;
/*58*/	r1.x = uintBitsToFloat((r1.w == r1.x) ? 0xffffffffu : 0x00000000u);
/*59*/	r1.w = uintBitsToFloat((floatBitsToInt(r1.x) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*60*/	if(floatBitsToUint(r1.x) == 0u) {
/*61*/	  r1.x = intBitsToFloat(floatBitsToInt(r1.y) + int(1));
/*62*/	  r1.x = floatBitsToInt(r1.x);
/*63*/	  r1.x = uintBitsToFloat((r1.x < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*64*/	  if(floatBitsToUint(r1.x) != 0u) {
/*65*/	    r1.x = intBitsToFloat(floatBitsToInt(r1.y) << int(2));
/*66*/	    r0.w = 1.000000;
/*67*/	    r2.x = dot(r0.xyzw, cb1.data[floatBitsToUint(r1.x)+6u].xyzw);
/*68*/	    r2.y = dot(r0.xyzw, cb1.data[floatBitsToUint(r1.x)+7u].xyzw);
/*69*/	    r2.z = dot(r0.xyzw, cb1.data[floatBitsToUint(r1.x)+8u].xyzw);
/*70*/	    r0.x = dot(r0.xyzw, cb1.data[floatBitsToUint(r1.x)+9u].xyzw);
/*71*/	    r0.yzw = (r2.xxyz / r0.xxxx).yzw;
/*72*/	    r2.xy = (uintBitsToFloat(uvec4(lessThan(r0.yzyy, cb1.data[floatBitsToUint(r1.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*73*/	    r1.x = uintBitsToFloat(floatBitsToUint(r2.y) | floatBitsToUint(r2.x));
/*74*/	    r2.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r1.y)+42u].zwzz, r0.yzyy)) * 0xffffffffu)).xy;
/*75*/	    r2.x = uintBitsToFloat(floatBitsToUint(r2.y) | floatBitsToUint(r2.x));
/*76*/	    r1.x = uintBitsToFloat(floatBitsToUint(r1.x) | floatBitsToUint(r2.x));
/*77*/	    if(floatBitsToUint(r1.x) == 0u) {
/*78*/	      r0.yz = (r0.yyzy * cb1.data[0].xxyx + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*79*/	      r2.xy = floor((r0.yzyy).xy);
/*80*/	      r3.xy = (r2.xyxx / cb1.data[0].xyxx).xy;
/*81*/	      r0.x = -0.000400 / r0.x;
/*82*/	      r0.x = r0.x + r0.w;
/*83*/	      r3.z = -r3.y + 1.000000;
/*84*/	      r4.xyzw = (textureLod(sHardShadowBuffer, r3.xzxx.st, 0.000000)).xyzw;
/*85*/	      r3.w = -r3.y;
/*86*/	      r5.x = cb1.data[0].z/**/;
/*87*/	      r5.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*88*/	      r2.zw = (r3.xxxw + r5.xxxy).zw;
/*89*/	      r6.xyzw = (textureLod(sHardShadowBuffer, r2.zwzz.st, 0.000000)).xyzw;
/*90*/	      r5.w = -cb1.data[0].w/**/;
/*91*/	      r2.zw = (r3.xxxz + r5.zzzw).zw;
/*92*/	      r5.xyzw = (textureLod(sHardShadowBuffer, r2.zwzz.st, 0.000000)).xyzw;
/*93*/	      r2.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r3.xxxz).zw;
/*94*/	      r3.xyzw = (textureLod(sHardShadowBuffer, r2.zwzz.st, 0.000000)).yzwx;
/*95*/	      r3.x = r4.x;
/*96*/	      r3.y = r6.x;
/*97*/	      r3.z = r5.x;
/*98*/	      r3.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xxxx, r3.xyzw)) * 0xffffffffu);
/*99*/	      r4.xyzw = uintBitsToFloat(floatBitsToUint(r3.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*100*/	      r0.xy = (r0.yzyy + -r2.xyxx).xy;
/*101*/	      r0.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r3.xxxz), uvec4(0)))).zw;
/*102*/	      r0.zw = (r0.zzzw + r4.yyyw).zw;
/*103*/	      r0.xz = (r0.xxxx * r0.zzwz + r4.xxzx).xz;
/*104*/	      r0.z = -r0.x + r0.z;
/*105*/	      r0.x = r0.y * r0.z + r0.x;
/*106*/	    } else {
/*107*/	      r0.x = 1.000000;
/*108*/	    }
/*109*/	  } else {
/*110*/	    r0.x = 1.000000;
/*111*/	  }
/*112*/	  r0.y = -cb1.data[floatBitsToUint(r1.y)+36u].x + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*113*/	  r0.z = r0.y * cb1.data[34].x;
/*114*/	  r0.y = -r0.y * cb1.data[34].x + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*115*/	  r0.y = -r0.y + vsOut_T3.w;
/*116*/	  r0.y = saturate(r0.y / r0.z);
/*117*/	  r0.x = -r1.z + r0.x;
/*118*/	  r1.z = r0.y * r0.x + r1.z;
/*119*/	}
/*120*/	if(floatBitsToUint(r1.w) != 0u) {
/*121*/	  r0.x = -cb1.data[floatBitsToUint(r1.y)+36u].x + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*122*/	  r0.y = r0.x * cb1.data[34].y;
/*123*/	  r0.x = -r0.x * cb1.data[34].y + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*124*/	  r0.x = -r0.x + vsOut_T3.w;
/*125*/	  r0.x = saturate(r0.x / r0.y);
/*126*/	  r0.y = -r1.z + 1.000000;
/*127*/	  r1.z = r0.x * r0.y + r1.z;
/*128*/	}
/*129*/	r1.z = saturate(r1.z);
/*130*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*131*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*132*/	r0.zw = (vsOut_T0.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*133*/	r1.xy = (vsOut_T1.zwzz + vsOut_T1.zwzz).xy;
/*134*/	r2.xyzw = (texture(s_normal, r0.zwzz.st)).xyzw;
/*135*/	r0.zw = (r2.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*136*/	r2.xz = (r0.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*137*/	r0.z = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*138*/	r0.z = -r0.z + 1.000000;
/*139*/	r0.z = max(r0.z, 0.000000);
/*140*/	r2.y = sqrt(r0.z);
/*141*/	r3.xyzw = (texture(s_normal, vsOut_T1.xyxx.st)).xyzw;
/*142*/	r0.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*143*/	r3.xz = (r0.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*144*/	r0.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*145*/	r0.z = -r0.z + 1.000000;
/*146*/	r0.z = max(r0.z, 0.000000);
/*147*/	r3.y = sqrt(r0.z);
/*148*/	r4.xyzw = (texture(s_normal, r1.xyxx.st)).xyzw;
/*149*/	r0.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*150*/	r4.xz = (r0.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*151*/	r0.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*152*/	r0.z = -r0.z + 1.000000;
/*153*/	r0.z = max(r0.z, 0.000000);
/*154*/	r4.y = sqrt(r0.z);
/*155*/	r1.xyw = (r2.xyxz + r3.xyxz).xyw;
/*156*/	r1.xyw = (r4.xyxz * vec4(0.300000, 0.300000, 0.000000, 0.300000) + r1.xyxw).xyw;
/*157*/	r1.xyw = (r1.xyxw + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyw;
/*158*/	r0.z = dot(vec3(r1.xywx), vec3(r1.xywx));
/*159*/	r0.z = inversesqrt(r0.z);
/*160*/	r1.xyw = (r0.zzzz * r1.xyxw).xyw;
/*161*/	r2.xyz = (-vsOut_T3.xyzx + cb0.data[0].xyzx).xyz;
/*162*/	r0.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*163*/	r0.z = inversesqrt(r0.z);
/*164*/	r3.xyz = (r0.zzzz * r2.xyzx).xyz;
/*165*/	r0.w = dot(vec3(-r3.xyzx), vec3(r1.xywx));
/*166*/	r0.w = r0.w + r0.w;
/*167*/	r4.xyz = (r1.xywx * -r0.wwww + -r3.xyzx).xyz;
/*168*/	r0.w = saturate(r4.y + 1.000000);
/*169*/	r4.w = abs(r4.y);
/*170*/	r2.w = dot(vec3(r4.xwzx), vec3(-r3.xyzx));
/*171*/	r2.w = max(r2.w, 0.000100);
/*172*/	r3.w = r2.w * r2.w;
/*173*/	r3.w = r3.w * r3.w;
/*174*/	r2.w = r2.w * r3.w;
/*175*/	r2.w = r2.w * 0.250000 + 0.150000;
/*176*/	r0.w = r0.w * r2.w;
/*177*/	if(floatBitsToUint(cb2.data[11].y) == 0u) {
/*178*/	  r5.xyzw = (textureLod(s_environment, r4.xwzx.stp, 0.000000)).xyzw;
/*179*/	  r5.xyz = (r0.wwww * r5.xyzx).xyz;
/*180*/	} else {
/*181*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*182*/	}
/*183*/	r2.w = max(-cb2.data[0].z, 0.000000);
/*184*/	r6.xyz = (cb2.data[0].yzwy * vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*185*/	r3.w = dot(vec3(-cb2.data[0].yzwy), vec3(-r6.xyzx));
/*186*/	r3.w = max(r3.w, 0.000100);
/*187*/	r4.y = r3.w * r3.w;
/*188*/	r4.y = r4.y * r4.y;
/*189*/	r3.w = r3.w * r4.y;
/*190*/	r3.w = r3.w * 0.250000 + 0.150000;
/*191*/	r3.w = -r3.w + 1.000000;
/*192*/	r2.w = r2.w * r3.w;
/*193*/	r6.xyz = (r2.wwww * cb2.data[8].xyzx).xyz;
/*194*/	r6.xyz = (r6.xyzx * cb2.data[1].xyzx).xyz;
/*195*/	r6.xyz = (r6.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*196*/	r2.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*197*/	r3.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*198*/	r6.xyz = (r3.wwww * r6.xyzx).xyz;
/*199*/	r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, 0.000000)).yzxw;
/*200*/	r7.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*201*/	r7.w = 1.000000;
/*202*/	r4.y = dot(r7.xyzw, cb0.data[19].xyzw);
/*203*/	r5.w = dot(r7.xyzw, cb0.data[20].xyzw);
/*204*/	r4.y = r4.y / r5.w;
/*205*/	r4.y = r4.y + -vsOut_T3.w;
/*206*/	r4.y = max(r4.y, 0.000000);
/*207*/	r5.w = dot(r7.xyzw, cb0.data[22].xyzw);
/*208*/	r6.w = dot(r7.xyzw, cb0.data[24].xyzw);
/*209*/	r5.w = r5.w / r6.w;
/*210*/	r5.w = -r5.w + vsOut_T3.y;
/*211*/	r5.w = max(r5.w, 0.000000);
/*212*/	r6.w = r5.w * 4.000000;
/*213*/	r6.w = min(r6.w, 1.000000);
/*214*/	r7.xyzw = (textureLod(s_terrain_refraction, r0.xyxx.st, r0.y)).xyzw;
/*215*/	r7.xy = (r1.xwxx * r7.wwww).xy;
/*216*/	r7.xy = (r6.wwww * r7.xyxx).xy;
/*217*/	r0.xy = (r7.xyxx * vec4(0.008333, 0.008333, 0.000000, 0.000000) + r0.xyxx).xy;
/*218*/	r7.xyzw = (textureLod(s_terrain_refraction, r0.xyxx.st, r0.y)).xyzw;
/*219*/	r8.xyzw = log2(cb2.data[10].xyzw);
/*220*/	r8.xyz = (r5.wwww * r8.xyzx).xyz;
/*221*/	r8.xyz = (exp2(r8.xyzx)).xyz;
/*222*/	r0.x = r4.y * r8.w;
/*223*/	r0.x = exp2(r0.x);
/*224*/	r0.x = min(r0.x, 1.000000);
/*225*/	r7.xyz = (r7.xyzx * r8.xyzx + -r6.xyzx).xyz;
/*226*/	r6.xyz = (r0.xxxx * r7.xyzx + r6.xyzx).xyz;
/*227*/	r0.x = -r0.w * r6.w + 1.000000;
/*228*/	r0.xyw = (r6.xyxz * r0.xxxx).xyw;
/*229*/	r0.xyw = (r5.xyxz * r6.wwww + r0.xyxw).xyw;
/*230*/	r4.y = dot(vec3(-cb2.data[0].ywzy), vec3(r4.xzwx));
/*231*/	r4.y = max(r4.y, -1.000000);
/*232*/	r4.y = min(r4.y, 1.000000);
/*233*/	r5.x = -abs(r4.y) + 1.000000;
/*234*/	r5.x = sqrt(r5.x);
/*235*/	r5.y = abs(r4.y) * -0.018729 + 0.074261;
/*236*/	r5.y = r5.y * abs(r4.y) + -0.212114;
/*237*/	r5.y = r5.y * abs(r4.y) + 1.570729;
/*238*/	r5.z = r5.x * r5.y;
/*239*/	r5.z = r5.z * -2.000000 + 3.141593;
/*240*/	r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*241*/	r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.z));
/*242*/	r4.y = r5.y * r5.x + r4.y;
/*243*/	r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r1.xywx));
/*244*/	r1.y = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*245*/	if(floatBitsToUint(r1.y) != 0u) {
/*246*/	    r1.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.487991 : -0.000049;
/*247*/	  r1.w = r1.w + r3.w;
/*248*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*249*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*250*/	  r1.w = -r1.w * r1.w + 1.000000;
/*251*/	  r1.w = max(r1.w, 0.001000);
/*252*/	  r1.w = log2(r1.w);
/*253*/	  r5.x = r1.w * 4.950617;
/*254*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*255*/	  r5.x = r1.w * r1.w + -r5.x;
/*256*/	  r5.x = sqrt(r5.x);
/*257*/	  r1.w = -r1.w + r5.x;
/*258*/	  r1.w = max(r1.w, 0.000000);
/*259*/	  r1.w = sqrt(r1.w);
/*260*/	  r1.w = r1.w * 1.414214;
/*261*/	  r1.w = 0.008727 / r1.w;
/*262*/	  r1.w = max(r1.w, 0.000100);
/*263*/	  r5.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*264*/	  r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*265*/	  r5.xy = (r1.wwww * r5.xyxx).xy;
/*266*/	  r5.zw = (r5.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*267*/	  r5.zw = (r5.zzzw * r5.zzzw).zw;
/*268*/	  r7.xyzw = r5.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*269*/	  r6.xy = (r7.xzxx / r7.ywyy).xy;
/*270*/	  r5.zw = (-r5.zzzw * r6.xxxy).zw;
/*271*/	  r6.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*272*/	  r1.w = uintBitsToFloat((r5.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*273*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.w));
/*274*/	  r1.w = floatBitsToInt(r1.w);
/*275*/	  r5.xy = (r5.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*276*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*277*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*278*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*279*/	  r1.w = r1.w * r5.x + 1.000000;
/*280*/	  r1.w = r1.w * 0.500000;
/*281*/	  r5.x = 1 + ~floatBitsToInt(r6.y);
/*282*/	  r5.x = r5.x * r5.y + 1.000000;
/*283*/	  r1.w = r5.x * 0.500000 + -r1.w;
/*284*/	  r5.x = saturate(r1.x);
/*285*/	  r5.x = r5.x + -1.000000;
/*286*/	  r5.x = r5.x * 0.453991 + 1.000000;
/*287*/	  r5.y = dot(vec3(-cb2.data[0].yzwy), vec3(-r3.xyzx));
/*288*/	  r5.y = max(r5.y, 0.000000);
/*289*/	  r5.y = log2(r5.y);
/*290*/	  r5.y = r5.y * 10.000000;
/*291*/	  r5.y = exp2(r5.y);
/*292*/	  r5.y = r5.y * 0.804248 + 0.150000;
/*293*/	  r1.w = abs(r1.w) * r5.x;
/*294*/	  r5.xyz = (r5.yyyy * r1.wwww).xyz;
/*295*/	} else {
/*296*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*297*/	}
/*298*/	r5.xyz = (r5.xyzx * cb2.data[1].xyzx).xyz;
/*299*/	if(floatBitsToUint(r1.y) != 0u) {
/*300*/	    r1.y = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.159344 : -0.000016;
/*301*/	  r1.y = r1.y + r3.w;
/*302*/	  r1.y = r1.y * 0.500000 + 0.500000;
/*303*/	  r1.y = r1.y * 2.000000 + -1.000000;
/*304*/	  r1.y = -r1.y * r1.y + 1.000000;
/*305*/	  r1.y = max(r1.y, 0.001000);
/*306*/	  r1.y = log2(r1.y);
/*307*/	  r1.w = r1.y * 4.950617;
/*308*/	  r1.y = r1.y * 0.346574 + 4.546885;
/*309*/	  r1.w = r1.y * r1.y + -r1.w;
/*310*/	  r1.w = sqrt(r1.w);
/*311*/	  r1.y = -r1.y + r1.w;
/*312*/	  r1.y = max(r1.y, 0.000000);
/*313*/	  r1.y = sqrt(r1.y);
/*314*/	  r1.y = r1.y * 1.414214;
/*315*/	  r1.y = 0.008727 / r1.y;
/*316*/	  r1.y = max(r1.y, 0.000100);
/*317*/	  r6.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*318*/	  r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*319*/	  r1.yw = (r1.yyyy * r6.xxxy).yw;
/*320*/	  r6.xy = (r1.ywyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*321*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*322*/	  r7.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*323*/	  r7.xy = (r7.xzxx / r7.ywyy).xy;
/*324*/	  r6.xy = (-r6.xyxx * r7.xyxx).xy;
/*325*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.ywyy)) * 0xffffffffu)).xy;
/*326*/	  r1.y = uintBitsToFloat((r1.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*327*/	  r1.y = intBitsToFloat(1 + ~floatBitsToInt(r7.x) + floatBitsToInt(r1.y));
/*328*/	  r1.y = floatBitsToInt(r1.y);
/*329*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*330*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*331*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*332*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*333*/	  r1.y = r1.y * r6.x + 1.000000;
/*334*/	  r1.y = r1.y * 0.500000;
/*335*/	  r1.w = 1 + ~floatBitsToInt(r7.y);
/*336*/	  r1.w = r1.w * r6.y + 1.000000;
/*337*/	  r1.y = r1.w * 0.500000 + -r1.y;
/*338*/	  r1.x = saturate(r1.x);
/*339*/	  r1.x = r1.x + -1.000000;
/*340*/	  r1.x = r1.x * 0.809017 + 1.000000;
/*341*/	  r1.w = dot(vec3(-cb2.data[0].yzwy), vec3(-r3.xyzx));
/*342*/	  r1.w = max(r1.w, 0.000000);
/*343*/	  r1.w = log2(r1.w);
/*344*/	  r1.w = r1.w * 10.000000;
/*345*/	  r1.w = exp2(r1.w);
/*346*/	  r1.w = r1.w * 0.660013 + 0.150000;
/*347*/	  r1.x = r1.x * abs(r1.y);
/*348*/	  r1.xyw = (r1.wwww * r1.xxxx).xyw;
/*349*/	} else {
/*350*/	  r1.xyw = (vec4(0, 0, 0, 0)).xyw;
/*351*/	}
/*352*/	r1.xyw = (r1.xyxw * cb2.data[1].xyxz).xyw;
/*353*/	r1.z = r1.z * r6.w;
/*354*/	r1.xyw = (r1.xyxw * vec4(0.150000, 0.150000, 0.000000, 0.150000)).xyw;
/*355*/	r1.xyw = (r5.xyxz * vec4(0.850000, 0.850000, 0.000000, 0.850000) + r1.xyxw).xyw;
/*356*/	color3.xyz = (r1.zzzz * r1.xywx + r0.xywx).xyz;
/*357*/	r0.xyz = (r2.xyzx * r0.zzzz + r4.xwzx).xyz;
/*358*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*359*/	r0.w = inversesqrt(r0.w);
/*360*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*361*/	r0.w = max(abs(r0.z), abs(r0.y));
/*362*/	r0.w = max(r0.w, abs(r0.x));
/*363*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*364*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*365*/	color0.w = 0.120000;
/*366*/	color1.xyzw = vec4(0, 0, 0, 0.150000);
/*367*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*368*/	color3.w = 1.000000;
/*369*/	return;
}
