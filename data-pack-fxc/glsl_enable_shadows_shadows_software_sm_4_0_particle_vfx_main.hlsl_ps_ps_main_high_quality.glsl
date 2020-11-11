//
//
// Shader Model 4
// Fragment Shader
//
// id: 1541 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_particle_vfx_main.hlsl_PS_ps_main_high_quality.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 gsOut_C0;
flat in uvec4 gsOut_T0;
in vec4 gsOut_T1;
in vec4 gsOut_T2;
in vec4 gsOut_T3;
in vec4 gsOut_T4;
in vec4 gsOut_T5;
in vec4 gsOut_T6;

layout(location = 0) out vec4 color0;

uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_sky;
uniform sampler2DArray g_sam_diffuse;
uniform sampler2DArray g_sam_normal;

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
layout(std140) uniform cb_vfx
{
  vec4 data[4];
} cb4;
layout(std140) uniform cb_vfx_emitter_constants_common
{
  vec4 data[512];
} cb5;
layout(std140) uniform cb_vfx_emitter_constants_ps
{
  vec4 data[3584];
} cb6;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r14;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.x = uintBitsToFloat(uint(gsOut_T0.x));
/*1*/	r0.y = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r0.x)+2560u].x));
/*2*/	r1.xyzw = uintBitsToFloat(uvec4(vec4(0x00020000u, 0x00400000u, 0x00080000u, 0x00800000u)) & floatBitsToUint(cb5.data[floatBitsToUint(r0.x)].xxxx));
/*3*/	if(floatBitsToUint(r1.x) != 0u) {
/*4*/	  r2.xyz = (dFdx(gsOut_T1.xyxx)).xyz;
/*5*/	  r3.xyz = (dFdy(gsOut_T1.xyxx)).xyz;
/*6*/	  r4.z = floatBitsToUint(cb5.data[floatBitsToUint(r0.x)].y);
/*7*/	  r4.xy = (gsOut_T1.xyxx).xy;
/*8*/	  r5.xyzw = (textureGrad(g_sam_diffuse, r4.xyzx.stp, vec2(r2.xyzx), vec2(r3.xyzx))).xyzw;
/*9*/	  r4.xy = (gsOut_T6.xyxx).xy;
/*10*/	  r2.xyzw = (textureGrad(g_sam_diffuse, r4.xyzx.stp, vec2(r2.xyzx), vec2(r3.xyzx))).xyzw;
/*11*/	  r2.xyzw = -r5.xyzw + r2.xyzw;
/*12*/	  r2.xyzw = gsOut_T6.zzzz * r2.xyzw + r5.xyzw;
/*13*/	  r3.xyz = (min(r2.wwww, r2.xyzx)).xyz;
/*14*/	  r3.xyz = (r3.xyzx * gsOut_C0.xyzx).xyz;
/*15*/	  r3.xyz = (r3.xyzx * gsOut_C0.wwww).xyz;
/*16*/	  r3.w = r2.w * gsOut_C0.w;
/*17*/	  r2.xyz = saturate(-r2.wwww + r2.xyzx).xyz;
/*18*/	  r4.xyz = (gsOut_C0.wwww * gsOut_C0.xyzx).xyz;
/*19*/	  r2.xyz = (r2.xyzx * r4.xyzx).xyz;
/*20*/	} else {
/*21*/	  r3.xyzw = gsOut_C0.xyzw;
/*22*/	  r2.xyz = (vec4(0, 0, 0, 0)).xyz;
/*23*/	}
/*24*/	r0.z = uintBitsToFloat((cb6.data[floatBitsToUint(r0.x)+2560u].y == cb6.data[floatBitsToUint(r0.x)+2560u].z) ? 0xffffffffu : 0x00000000u);
/*25*/	r0.w = 1.000000 + -cb6.data[floatBitsToUint(r0.x)+2560u].w;
/*26*/	r1.x = max(r0.w, cb6.data[floatBitsToUint(r0.x)+2560u].y);
/*27*/	r4.xy = (gsOut_T5.xxxx * vec4(3276.000000, 4099.000000, 0.000000, 0.000000)).xy;
/*28*/	r4.xy = (fract(r4.xyxx)).xy;
/*29*/	r1.x = r1.x + -1.000000;
/*30*/	r1.x = r4.x * r1.x + 1.000000;
/*31*/	r0.w = r0.w * cb6.data[floatBitsToUint(r0.x)+2560u].z;
/*32*/	r0.w = max(r0.w, cb6.data[floatBitsToUint(r0.x)+2560u].y);
/*33*/	r0.w = r0.w + -cb6.data[floatBitsToUint(r0.x)+2560u].z;
/*34*/	r0.w = r4.y * r0.w + cb6.data[floatBitsToUint(r0.x)+2560u].z;
/*35*/	r0.z = (floatBitsToUint(r0.z) > 0x00000000u) ? r1.x : r0.w;
/*36*/	r0.z = r0.z + -cb6.data[floatBitsToUint(r0.x)+2560u].y;
/*37*/	r0.z = max(r0.z, 0.001000);
/*38*/	r0.w = gsOut_T2.w + -cb6.data[floatBitsToUint(r0.x)+2560u].y;
/*39*/	r0.z = saturate(r0.w / r0.z);
/*40*/	r0.w = saturate(-r0.z + r3.w);
/*41*/	r1.x = -r0.z + 1.001000;
/*42*/	r0.w = r0.w / r1.x;
/*43*/	r0.z = -r0.z + r0.w;
/*44*/	r0.z = uintBitsToFloat((r0.z >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*45*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.z) & uint(0x3f800000u));
/*46*/	r0.z = r0.w * r0.z;
/*47*/	r4.w = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.z : r0.w;
/*48*/	r0.y = uintBitsToFloat((r3.w != 0.000000) ? 0xffffffffu : 0x00000000u);
/*49*/	r0.z = r4.w / r3.w;
/*50*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.z : 1.000000;
/*51*/	r4.xyz = (r0.yyyy * r3.xyzx).xyz;
/*52*/	r3.xyzw = mix(r3.xyzw, r4.xyzw, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)));
/*53*/	r4.xyz = (r2.xyzx + r3.xyzx).xyz;
/*54*/	r4.w = r3.w;
/*55*/	r5.xyzw = uintBitsToFloat(uvec4(lessThan(r4.xyzw, vec4(0.020000, 0.020000, 0.020000, 0.020000))) * 0xffffffffu);
/*56*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r5.zzwz) & floatBitsToUint(r5.xxyx))).yz;
/*57*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.y));
/*58*/	if(r0.y != 0) discard;
/*59*/	r0.y = uintBitsToFloat((0.100000 < r4.w) ? 0xffffffffu : 0x00000000u);
/*60*/	r5.z = floatBitsToUint(cb5.data[floatBitsToUint(r0.x)].z);
/*61*/	r5.xy = (gsOut_T1.xyxx).xy;
/*62*/	r5.xyzw = (texture(g_sam_normal, r5.xyzx.stp)).xyzw;
/*63*/	if(floatBitsToUint(r0.y) != 0u) {
/*64*/	  r0.yzw = (uintBitsToFloat(uvec4(vec4(0, 0x00040000u, 0x00100000u, 0x00200000u)) & floatBitsToUint(cb5.data[floatBitsToUint(r0.x)].xxxx))).yzw;
/*65*/	  if(floatBitsToUint(r0.y) != 0u) {
/*66*/	    r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*67*/	  } else {
/*68*/	    r5.xyz = (vec4(0, 0, 1.000000, 0)).xyz;
/*69*/	  }
/*70*/	  if(floatBitsToUint(r0.z) != 0u) {
/*71*/	    r6.xyz = (-gsOut_T2.xyzx + cb0.data[0].xyzx).xyz;
/*72*/	    r0.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*73*/	    r0.y = inversesqrt(r0.y);
/*74*/	    r6.xyz = (r0.yyyy * r6.xyzx).xyz;
/*75*/	    r0.y = min(gsOut_T3.y, gsOut_T3.x);
/*76*/	    r0.y = r0.y * cb6.data[floatBitsToUint(r0.x)+1024u].y;
/*77*/	    r7.xyzw = r0.yyyy * vec4(0.166667, 0.333333, 0.500000, 0.666667);
/*78*/	    r8.xyz = (gsOut_T2.xyzx).xyz;
/*79*/	    r8.w = 1.000000;
/*80*/	    r0.z = dot(r8.xyzw, cb0.data[12].xyzw);
/*81*/	    r8.x = cb1.data[37].x/**/;
/*82*/	    r8.y = cb1.data[38].x/**/;
/*83*/	    r8.z = cb1.data[39].x/**/;
/*84*/	    r8.w = cb1.data[40].x/**/;
/*85*/	    r9.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r0.zzzz, r8.xyzw)) * 0xffffffffu);
/*86*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*87*/	    r1.x = dot(r9.xyzw, r9.xyzw);
/*88*/	    r1.y = intBitsToFloat(int(r1.x));
/*89*/	    r2.w = uintBitsToFloat((r1.x < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*90*/	    if(floatBitsToUint(r2.w) != 0u) {
/*91*/	      r9.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + gsOut_T2.xyzx).xyz;
/*92*/	      r2.w = intBitsToFloat(floatBitsToInt(r1.y) << int(2));
/*93*/	      r9.w = 1.000000;
/*94*/	      r10.x = dot(r9.xyzw, cb1.data[floatBitsToUint(r2.w)+2u].xyzw);
/*95*/	      r10.y = dot(r9.xyzw, cb1.data[floatBitsToUint(r2.w)+3u].xyzw);
/*96*/	      r10.z = dot(r9.xyzw, cb1.data[floatBitsToUint(r2.w)+4u].xyzw);
/*97*/	      r2.w = dot(r9.xyzw, cb1.data[floatBitsToUint(r2.w)+5u].xyzw);
/*98*/	      r9.xyz = (r10.xyzx / r2.wwww).xyz;
/*99*/	      r10.xy = (uintBitsToFloat(uvec4(lessThan(r9.xyxx, cb1.data[floatBitsToUint(r1.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*100*/	      r5.w = uintBitsToFloat(floatBitsToUint(r10.y) | floatBitsToUint(r10.x));
/*101*/	      r10.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r1.y)+41u].zwzz, r9.xyxx)) * 0xffffffffu)).xy;
/*102*/	      r6.w = uintBitsToFloat(floatBitsToUint(r10.y) | floatBitsToUint(r10.x));
/*103*/	      r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.w));
/*104*/	      if(floatBitsToUint(r5.w) == 0u) {
/*105*/	        r9.xy = (r9.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*106*/	        r10.xy = floor((r9.xyxx).xy);
/*107*/	        r11.xy = (r10.xyxx / cb1.data[0].xyxx).xy;
/*108*/	        r2.w = -0.000400 / r2.w;
/*109*/	        r2.w = r2.w + r9.z;
/*110*/	        r11.z = -r11.y + 1.000000;
/*111*/	        r12.xyzw = (textureLod(sHardShadowBuffer, r11.xzxx.st, 0.000000)).xyzw;
/*112*/	        r11.w = -r11.y;
/*113*/	        r13.x = cb1.data[0].z/**/;
/*114*/	        r13.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*115*/	        r9.zw = (r11.xxxw + r13.xxxy).zw;
/*116*/	        r14.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*117*/	        r13.w = -cb1.data[0].w/**/;
/*118*/	        r9.zw = (r11.xxxz + r13.zzzw).zw;
/*119*/	        r13.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*120*/	        r9.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r11.xxxz).zw;
/*121*/	        r11.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).yzwx;
/*122*/	        r11.x = r12.x;
/*123*/	        r11.y = r14.x;
/*124*/	        r11.z = r13.x;
/*125*/	        r11.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r11.xyzw)) * 0xffffffffu);
/*126*/	        r12.xyzw = uintBitsToFloat(floatBitsToUint(r11.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*127*/	        r9.xy = (r9.xyxx + -r10.xyxx).xy;
/*128*/	        r9.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r11.xxxz), uvec4(0)))).zw;
/*129*/	        r9.zw = (r9.zzzw + r12.yyyw).zw;
/*130*/	        r9.xz = (r9.xxxx * r9.zzwz + r12.xxzx).xz;
/*131*/	        r2.w = -r9.x + r9.z;
/*132*/	        r2.w = r9.y * r2.w + r9.x;
/*133*/	      } else {
/*134*/	        r2.w = 1.000000;
/*135*/	      }
/*136*/	    } else {
/*137*/	      r2.w = 1.000000;
/*138*/	    }
/*139*/	    r5.w = cb1.data[34].w + -1.000000;
/*140*/	    r1.x = uintBitsToFloat((r1.x == r5.w) ? 0xffffffffu : 0x00000000u);
/*141*/	    r1.x = uintBitsToFloat((floatBitsToInt(r1.x) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*142*/	    if(floatBitsToUint(r1.x) != 0u) {
/*143*/	      r1.x = -cb1.data[floatBitsToUint(r1.y)+36u].x + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*144*/	      r6.w = r1.x * cb1.data[34].y;
/*145*/	      r1.x = -r1.x * cb1.data[34].y + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*146*/	      r0.z = r0.z + -r1.x;
/*147*/	      r0.z = saturate(r0.z / r6.w);
/*148*/	      r1.x = -r2.w + 1.000000;
/*149*/	      r2.w = r0.z * r1.x + r2.w;
/*150*/	    }
/*151*/	    r2.w = saturate(r2.w);
/*152*/	    r9.xyz = (-r7.xxxx * r6.xyzx + gsOut_T2.xyzx).xyz;
/*153*/	    r9.xyz = (cb0.data[1].xyzx * vec4(0.014383, 0.014383, 0.014383, 0.000000) + r9.xyzx).xyz;
/*154*/	    r9.xyz = (cb0.data[2].xyzx * vec4(0.026327, 0.026327, 0.026327, 0.000000) + r9.xyzx).xyz;
/*155*/	    r9.w = 1.000000;
/*156*/	    r0.z = dot(r9.xyzw, cb0.data[12].xyzw);
/*157*/	    r10.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r0.zzzz, r8.xyzw)) * 0xffffffffu);
/*158*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r10.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*159*/	    r1.x = dot(r10.xyzw, r10.xyzw);
/*160*/	    r1.y = intBitsToFloat(int(r1.x));
/*161*/	    r6.w = uintBitsToFloat((r1.x < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*162*/	    if(floatBitsToUint(r6.w) != 0u) {
/*163*/	      r9.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r9.xyzx).xyz;
/*164*/	      r6.w = intBitsToFloat(floatBitsToInt(r1.y) << int(2));
/*165*/	      r9.w = 1.000000;
/*166*/	      r10.x = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+2u].xyzw);
/*167*/	      r10.y = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+3u].xyzw);
/*168*/	      r10.z = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+4u].xyzw);
/*169*/	      r6.w = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+5u].xyzw);
/*170*/	      r9.xyz = (r10.xyzx / r6.wwww).xyz;
/*171*/	      r10.xy = (uintBitsToFloat(uvec4(lessThan(r9.xyxx, cb1.data[floatBitsToUint(r1.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*172*/	      r7.x = uintBitsToFloat(floatBitsToUint(r10.y) | floatBitsToUint(r10.x));
/*173*/	      r10.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r1.y)+41u].zwzz, r9.xyxx)) * 0xffffffffu)).xy;
/*174*/	      r9.w = uintBitsToFloat(floatBitsToUint(r10.y) | floatBitsToUint(r10.x));
/*175*/	      r7.x = uintBitsToFloat(floatBitsToUint(r7.x) | floatBitsToUint(r9.w));
/*176*/	      if(floatBitsToUint(r7.x) == 0u) {
/*177*/	        r9.xy = (r9.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*178*/	        r10.xy = floor((r9.xyxx).xy);
/*179*/	        r11.xy = (r10.xyxx / cb1.data[0].xyxx).xy;
/*180*/	        r6.w = -0.000400 / r6.w;
/*181*/	        r6.w = r6.w + r9.z;
/*182*/	        r11.z = -r11.y + 1.000000;
/*183*/	        r12.xyzw = (textureLod(sHardShadowBuffer, r11.xzxx.st, 0.000000)).xyzw;
/*184*/	        r11.w = -r11.y;
/*185*/	        r13.x = cb1.data[0].z/**/;
/*186*/	        r13.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*187*/	        r9.zw = (r11.xxxw + r13.xxxy).zw;
/*188*/	        r14.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*189*/	        r13.w = -cb1.data[0].w/**/;
/*190*/	        r9.zw = (r11.xxxz + r13.zzzw).zw;
/*191*/	        r13.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*192*/	        r9.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r11.xxxz).zw;
/*193*/	        r11.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).yzwx;
/*194*/	        r11.x = r12.x;
/*195*/	        r11.y = r14.x;
/*196*/	        r11.z = r13.x;
/*197*/	        r11.xyzw = uintBitsToFloat(uvec4(lessThan(r6.wwww, r11.xyzw)) * 0xffffffffu);
/*198*/	        r12.xyzw = uintBitsToFloat(floatBitsToUint(r11.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*199*/	        r9.xy = (r9.xyxx + -r10.xyxx).xy;
/*200*/	        r9.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r11.xxxz), uvec4(0)))).zw;
/*201*/	        r9.zw = (r9.zzzw + r12.yyyw).zw;
/*202*/	        r9.xz = (r9.xxxx * r9.zzwz + r12.xxzx).xz;
/*203*/	        r6.w = -r9.x + r9.z;
/*204*/	        r6.w = r9.y * r6.w + r9.x;
/*205*/	      } else {
/*206*/	        r6.w = 1.000000;
/*207*/	      }
/*208*/	    } else {
/*209*/	      r6.w = 1.000000;
/*210*/	    }
/*211*/	    r1.x = uintBitsToFloat((r5.w == r1.x) ? 0xffffffffu : 0x00000000u);
/*212*/	    r1.x = uintBitsToFloat((floatBitsToInt(r1.x) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*213*/	    if(floatBitsToUint(r1.x) != 0u) {
/*214*/	      r1.x = -cb1.data[floatBitsToUint(r1.y)+36u].x + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*215*/	      r7.x = r1.x * cb1.data[34].y;
/*216*/	      r1.x = -r1.x * cb1.data[34].y + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*217*/	      r0.z = r0.z + -r1.x;
/*218*/	      r0.z = saturate(r0.z / r7.x);
/*219*/	      r1.x = -r6.w + 1.000000;
/*220*/	      r6.w = r0.z * r1.x + r6.w;
/*221*/	    }
/*222*/	    r6.w = saturate(r6.w);
/*223*/	    r0.z = r2.w + r6.w;
/*224*/	    r9.xyz = (-r7.yyyy * r6.xyzx + gsOut_T2.xyzx).xyz;
/*225*/	    r9.xyz = (cb0.data[1].xyzx * vec4(0.050488, 0.050488, 0.050488, 0.000000) + r9.xyzx).xyz;
/*226*/	    r9.xyz = (cb0.data[2].xyzx * vec4(0.032418, 0.032418, 0.032418, 0.000000) + r9.xyzx).xyz;
/*227*/	    r9.w = 1.000000;
/*228*/	    r1.x = dot(r9.xyzw, cb0.data[12].xyzw);
/*229*/	    r10.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxx, r8.xyzw)) * 0xffffffffu);
/*230*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r10.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*231*/	    r1.y = dot(r10.xyzw, r10.xyzw);
/*232*/	    r2.w = intBitsToFloat(int(r1.y));
/*233*/	    r6.w = uintBitsToFloat((r1.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*234*/	    if(floatBitsToUint(r6.w) != 0u) {
/*235*/	      r9.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r9.xyzx).xyz;
/*236*/	      r6.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*237*/	      r9.w = 1.000000;
/*238*/	      r10.x = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+2u].xyzw);
/*239*/	      r10.y = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+3u].xyzw);
/*240*/	      r10.z = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+4u].xyzw);
/*241*/	      r6.w = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+5u].xyzw);
/*242*/	      r9.xyz = (r10.xyzx / r6.wwww).xyz;
/*243*/	      r7.xy = (uintBitsToFloat(uvec4(lessThan(r9.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*244*/	      r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*245*/	      r10.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r9.xyxx)) * 0xffffffffu)).xy;
/*246*/	      r7.y = uintBitsToFloat(floatBitsToUint(r10.y) | floatBitsToUint(r10.x));
/*247*/	      r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*248*/	      if(floatBitsToUint(r7.x) == 0u) {
/*249*/	        r7.xy = (r9.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*250*/	        r9.xy = floor((r7.xyxx).xy);
/*251*/	        r10.xy = (r9.xyxx / cb1.data[0].xyxx).xy;
/*252*/	        r6.w = -0.000400 / r6.w;
/*253*/	        r6.w = r6.w + r9.z;
/*254*/	        r10.z = -r10.y + 1.000000;
/*255*/	        r11.xyzw = (textureLod(sHardShadowBuffer, r10.xzxx.st, 0.000000)).xyzw;
/*256*/	        r10.w = -r10.y;
/*257*/	        r12.x = cb1.data[0].z/**/;
/*258*/	        r12.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*259*/	        r9.zw = (r10.xxxw + r12.xxxy).zw;
/*260*/	        r13.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*261*/	        r12.w = -cb1.data[0].w/**/;
/*262*/	        r9.zw = (r10.xxxz + r12.zzzw).zw;
/*263*/	        r12.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*264*/	        r9.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r10.xxxz).zw;
/*265*/	        r10.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).yzwx;
/*266*/	        r10.x = r11.x;
/*267*/	        r10.y = r13.x;
/*268*/	        r10.z = r12.x;
/*269*/	        r10.xyzw = uintBitsToFloat(uvec4(lessThan(r6.wwww, r10.xyzw)) * 0xffffffffu);
/*270*/	        r11.xyzw = uintBitsToFloat(floatBitsToUint(r10.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*271*/	        r7.xy = (r7.xyxx + -r9.xyxx).xy;
/*272*/	        r9.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r10.xzxx), uvec4(0)))).xy;
/*273*/	        r9.xy = (r9.xyxx + r11.ywyy).xy;
/*274*/	        r9.xy = (r7.xxxx * r9.xyxx + r11.xzxx).xy;
/*275*/	        r6.w = -r9.x + r9.y;
/*276*/	        r6.w = r7.y * r6.w + r9.x;
/*277*/	      } else {
/*278*/	        r6.w = 1.000000;
/*279*/	      }
/*280*/	    } else {
/*281*/	      r6.w = 1.000000;
/*282*/	    }
/*283*/	    r1.y = uintBitsToFloat((r5.w == r1.y) ? 0xffffffffu : 0x00000000u);
/*284*/	    r1.y = uintBitsToFloat((floatBitsToInt(r1.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*285*/	    if(floatBitsToUint(r1.y) != 0u) {
/*286*/	      r1.y = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*287*/	      r7.x = r1.y * cb1.data[34].y;
/*288*/	      r1.y = -r1.y * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*289*/	      r1.x = -r1.y + r1.x;
/*290*/	      r1.x = saturate(r1.x / r7.x);
/*291*/	      r1.y = -r6.w + 1.000000;
/*292*/	      r6.w = r1.x * r1.y + r6.w;
/*293*/	    }
/*294*/	    r6.w = saturate(r6.w);
/*295*/	    r0.z = r0.z + r6.w;
/*296*/	    r7.xyz = (-r7.zzzz * r6.xyzx + gsOut_T2.xyzx).xyz;
/*297*/	    r7.xyz = (cb0.data[1].xyzx * vec4(0.089775, 0.089775, 0.089775, 0.000000) + r7.xyzx).xyz;
/*298*/	    r9.xyz = (cb0.data[2].xyzx * vec4(0.006366, 0.006366, 0.006366, 0.000000) + r7.xyzx).xyz;
/*299*/	    r9.w = 1.000000;
/*300*/	    r1.x = dot(r9.xyzw, cb0.data[12].xyzw);
/*301*/	    r10.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxx, r8.xyzw)) * 0xffffffffu);
/*302*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r10.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*303*/	    r1.y = dot(r10.xyzw, r10.xyzw);
/*304*/	    r2.w = intBitsToFloat(int(r1.y));
/*305*/	    r6.w = uintBitsToFloat((r1.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*306*/	    if(floatBitsToUint(r6.w) != 0u) {
/*307*/	      r9.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r9.xyzx).xyz;
/*308*/	      r6.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*309*/	      r9.w = 1.000000;
/*310*/	      r7.x = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+2u].xyzw);
/*311*/	      r7.y = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+3u].xyzw);
/*312*/	      r7.z = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+4u].xyzw);
/*313*/	      r6.w = dot(r9.xyzw, cb1.data[floatBitsToUint(r6.w)+5u].xyzw);
/*314*/	      r7.xyz = (r7.xyzx / r6.wwww).xyz;
/*315*/	      r9.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*316*/	      r9.x = uintBitsToFloat(floatBitsToUint(r9.y) | floatBitsToUint(r9.x));
/*317*/	      r9.yz = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zzwz, r7.xxyx)) * 0xffffffffu)).yz;
/*318*/	      r9.y = uintBitsToFloat(floatBitsToUint(r9.z) | floatBitsToUint(r9.y));
/*319*/	      r9.x = uintBitsToFloat(floatBitsToUint(r9.y) | floatBitsToUint(r9.x));
/*320*/	      if(floatBitsToUint(r9.x) == 0u) {
/*321*/	        r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*322*/	        r9.xy = floor((r7.xyxx).xy);
/*323*/	        r10.xy = (r9.xyxx / cb1.data[0].xyxx).xy;
/*324*/	        r6.w = -0.000400 / r6.w;
/*325*/	        r6.w = r6.w + r7.z;
/*326*/	        r10.z = -r10.y + 1.000000;
/*327*/	        r11.xyzw = (textureLod(sHardShadowBuffer, r10.xzxx.st, 0.000000)).xyzw;
/*328*/	        r10.w = -r10.y;
/*329*/	        r12.x = cb1.data[0].z/**/;
/*330*/	        r12.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*331*/	        r9.zw = (r10.xxxw + r12.xxxy).zw;
/*332*/	        r13.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*333*/	        r12.w = -cb1.data[0].w/**/;
/*334*/	        r9.zw = (r10.xxxz + r12.zzzw).zw;
/*335*/	        r12.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).xyzw;
/*336*/	        r9.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r10.xxxz).zw;
/*337*/	        r10.xyzw = (textureLod(sHardShadowBuffer, r9.zwzz.st, 0.000000)).yzwx;
/*338*/	        r10.x = r11.x;
/*339*/	        r10.y = r13.x;
/*340*/	        r10.z = r12.x;
/*341*/	        r10.xyzw = uintBitsToFloat(uvec4(lessThan(r6.wwww, r10.xyzw)) * 0xffffffffu);
/*342*/	        r11.xyzw = uintBitsToFloat(floatBitsToUint(r10.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*343*/	        r7.xy = (r7.xyxx + -r9.xyxx).xy;
/*344*/	        r9.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r10.xzxx), uvec4(0)))).xy;
/*345*/	        r9.xy = (r9.xyxx + r11.ywyy).xy;
/*346*/	        r7.xz = (r7.xxxx * r9.xxyx + r11.xxzx).xz;
/*347*/	        r6.w = -r7.x + r7.z;
/*348*/	        r6.w = r7.y * r6.w + r7.x;
/*349*/	      } else {
/*350*/	        r6.w = 1.000000;
/*351*/	      }
/*352*/	    } else {
/*353*/	      r6.w = 1.000000;
/*354*/	    }
/*355*/	    r1.y = uintBitsToFloat((r5.w == r1.y) ? 0xffffffffu : 0x00000000u);
/*356*/	    r1.y = uintBitsToFloat((floatBitsToInt(r1.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*357*/	    if(floatBitsToUint(r1.y) != 0u) {
/*358*/	      r1.y = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*359*/	      r7.x = r1.y * cb1.data[34].y;
/*360*/	      r1.y = -r1.y * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*361*/	      r1.x = -r1.y + r1.x;
/*362*/	      r1.x = saturate(r1.x / r7.x);
/*363*/	      r1.y = -r6.w + 1.000000;
/*364*/	      r6.w = r1.x * r1.y + r6.w;
/*365*/	    }
/*366*/	    r6.w = saturate(r6.w);
/*367*/	    r0.z = r0.z + r6.w;
/*368*/	    r7.xyz = (-r7.wwww * r6.xyzx + gsOut_T2.xyzx).xyz;
/*369*/	    r7.xyz = (cb0.data[1].xyzx * vec4(0.109116, 0.109116, 0.109116, 0.000000) + r7.xyzx).xyz;
/*370*/	    r7.xyz = (cb0.data[2].xyzx * vec4(-0.049938, -0.049938, -0.049938, 0.000000) + r7.xyzx).xyz;
/*371*/	    r7.w = 1.000000;
/*372*/	    r1.x = dot(r7.xyzw, cb0.data[12].xyzw);
/*373*/	    r9.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxx, r8.xyzw)) * 0xffffffffu);
/*374*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*375*/	    r1.y = dot(r9.xyzw, r9.xyzw);
/*376*/	    r2.w = intBitsToFloat(int(r1.y));
/*377*/	    r6.w = uintBitsToFloat((r1.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*378*/	    if(floatBitsToUint(r6.w) != 0u) {
/*379*/	      r7.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r7.xyzx).xyz;
/*380*/	      r6.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*381*/	      r7.w = 1.000000;
/*382*/	      r9.x = dot(r7.xyzw, cb1.data[floatBitsToUint(r6.w)+2u].xyzw);
/*383*/	      r9.y = dot(r7.xyzw, cb1.data[floatBitsToUint(r6.w)+3u].xyzw);
/*384*/	      r9.z = dot(r7.xyzw, cb1.data[floatBitsToUint(r6.w)+4u].xyzw);
/*385*/	      r6.w = dot(r7.xyzw, cb1.data[floatBitsToUint(r6.w)+5u].xyzw);
/*386*/	      r7.xyz = (r9.xyzx / r6.wwww).xyz;
/*387*/	      r9.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*388*/	      r7.w = uintBitsToFloat(floatBitsToUint(r9.y) | floatBitsToUint(r9.x));
/*389*/	      r9.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*390*/	      r9.x = uintBitsToFloat(floatBitsToUint(r9.y) | floatBitsToUint(r9.x));
/*391*/	      r7.w = uintBitsToFloat(floatBitsToUint(r7.w) | floatBitsToUint(r9.x));
/*392*/	      if(floatBitsToUint(r7.w) == 0u) {
/*393*/	        r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*394*/	        r9.xy = floor((r7.xyxx).xy);
/*395*/	        r10.xy = (r9.xyxx / cb1.data[0].xyxx).xy;
/*396*/	        r6.w = -0.000400 / r6.w;
/*397*/	        r6.w = r6.w + r7.z;
/*398*/	        r10.z = -r10.y + 1.000000;
/*399*/	        r11.xyzw = (textureLod(sHardShadowBuffer, r10.xzxx.st, 0.000000)).xyzw;
/*400*/	        r10.w = -r10.y;
/*401*/	        r12.x = cb1.data[0].z/**/;
/*402*/	        r12.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*403*/	        r7.zw = (r10.xxxw + r12.xxxy).zw;
/*404*/	        r13.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*405*/	        r12.w = -cb1.data[0].w/**/;
/*406*/	        r7.zw = (r10.xxxz + r12.zzzw).zw;
/*407*/	        r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*408*/	        r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r10.xxxz).zw;
/*409*/	        r10.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*410*/	        r10.x = r11.x;
/*411*/	        r10.y = r13.x;
/*412*/	        r10.z = r12.x;
/*413*/	        r10.xyzw = uintBitsToFloat(uvec4(lessThan(r6.wwww, r10.xyzw)) * 0xffffffffu);
/*414*/	        r11.xyzw = uintBitsToFloat(floatBitsToUint(r10.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*415*/	        r7.xy = (r7.xyxx + -r9.xyxx).xy;
/*416*/	        r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r10.xxxz), uvec4(0)))).zw;
/*417*/	        r7.zw = (r7.zzzw + r11.yyyw).zw;
/*418*/	        r7.xz = (r7.xxxx * r7.zzwz + r11.xxzx).xz;
/*419*/	        r6.w = -r7.x + r7.z;
/*420*/	        r6.w = r7.y * r6.w + r7.x;
/*421*/	      } else {
/*422*/	        r6.w = 1.000000;
/*423*/	      }
/*424*/	    } else {
/*425*/	      r6.w = 1.000000;
/*426*/	    }
/*427*/	    r1.y = uintBitsToFloat((r5.w == r1.y) ? 0xffffffffu : 0x00000000u);
/*428*/	    r1.y = uintBitsToFloat((floatBitsToInt(r1.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*429*/	    if(floatBitsToUint(r1.y) != 0u) {
/*430*/	      r1.y = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*431*/	      r7.x = r1.y * cb1.data[34].y;
/*432*/	      r1.y = -r1.y * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*433*/	      r1.x = -r1.y + r1.x;
/*434*/	      r1.x = saturate(r1.x / r7.x);
/*435*/	      r1.y = -r6.w + 1.000000;
/*436*/	      r6.w = r1.x * r1.y + r6.w;
/*437*/	    }
/*438*/	    r6.w = saturate(r6.w);
/*439*/	    r0.z = r0.z + r6.w;
/*440*/	    r0.y = r0.y * 0.833333;
/*441*/	    r6.xyz = (-r0.yyyy * r6.xyzx + gsOut_T2.xyzx).xyz;
/*442*/	    r6.xyz = (cb0.data[1].xyzx * vec4(0.089771, 0.089771, 0.089771, 0.000000) + r6.xyzx).xyz;
/*443*/	    r6.xyz = (cb0.data[2].xyzx * vec4(-0.120172, -0.120172, -0.120172, 0.000000) + r6.xyzx).xyz;
/*444*/	    r6.w = 1.000000;
/*445*/	    r0.y = dot(r6.xyzw, cb0.data[12].xyzw);
/*446*/	    r7.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r0.yyyy, r8.xyzw)) * 0xffffffffu);
/*447*/	    r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*448*/	    r1.x = dot(r7.xyzw, r7.xyzw);
/*449*/	    r1.y = intBitsToFloat(int(r1.x));
/*450*/	    r2.w = uintBitsToFloat((r1.x < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*451*/	    if(floatBitsToUint(r2.w) != 0u) {
/*452*/	      r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + r6.xyzx).xyz;
/*453*/	      r2.w = intBitsToFloat(floatBitsToInt(r1.y) << int(2));
/*454*/	      r6.w = 1.000000;
/*455*/	      r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.w)+2u].xyzw);
/*456*/	      r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.w)+3u].xyzw);
/*457*/	      r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.w)+4u].xyzw);
/*458*/	      r2.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.w)+5u].xyzw);
/*459*/	      r6.xyz = (r7.xyzx / r2.wwww).xyz;
/*460*/	      r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r1.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*461*/	      r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*462*/	      r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r1.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*463*/	      r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*464*/	      r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*465*/	      if(floatBitsToUint(r6.w) == 0u) {
/*466*/	        r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*467*/	        r7.xy = floor((r6.xyxx).xy);
/*468*/	        r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*469*/	        r2.w = -0.000400 / r2.w;
/*470*/	        r2.w = r2.w + r6.z;
/*471*/	        r8.z = -r8.y + 1.000000;
/*472*/	        r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*473*/	        r8.w = -r8.y;
/*474*/	        r10.x = cb1.data[0].z/**/;
/*475*/	        r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*476*/	        r6.zw = (r8.xxxw + r10.xxxy).zw;
/*477*/	        r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*478*/	        r10.w = -cb1.data[0].w/**/;
/*479*/	        r6.zw = (r8.xxxz + r10.zzzw).zw;
/*480*/	        r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*481*/	        r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*482*/	        r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*483*/	        r8.x = r9.x;
/*484*/	        r8.y = r11.x;
/*485*/	        r8.z = r10.x;
/*486*/	        r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r8.xyzw)) * 0xffffffffu);
/*487*/	        r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*488*/	        r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*489*/	        r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*490*/	        r6.zw = (r6.zzzw + r9.yyyw).zw;
/*491*/	        r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*492*/	        r2.w = -r6.x + r6.z;
/*493*/	        r2.w = r6.y * r2.w + r6.x;
/*494*/	      } else {
/*495*/	        r2.w = 1.000000;
/*496*/	      }
/*497*/	    } else {
/*498*/	      r2.w = 1.000000;
/*499*/	    }
/*500*/	    r1.x = uintBitsToFloat((r5.w == r1.x) ? 0xffffffffu : 0x00000000u);
/*501*/	    r1.x = uintBitsToFloat((floatBitsToInt(r1.x) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*502*/	    if(floatBitsToUint(r1.x) != 0u) {
/*503*/	      r1.x = -cb1.data[floatBitsToUint(r1.y)+36u].x + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*504*/	      r5.w = r1.x * cb1.data[34].y;
/*505*/	      r1.x = -r1.x * cb1.data[34].y + cb1.data[floatBitsToUint(r1.y)+37u].x;
/*506*/	      r0.y = r0.y + -r1.x;
/*507*/	      r0.y = saturate(r0.y / r5.w);
/*508*/	      r1.x = -r2.w + 1.000000;
/*509*/	      r2.w = r0.y * r1.x + r2.w;
/*510*/	    }
/*511*/	    r2.w = saturate(r2.w);
/*512*/	    r0.y = r0.z + r2.w;
/*513*/	    r0.y = r0.y * cb6.data[floatBitsToUint(r0.x)+1024u].x;
/*514*/	    r0.y = r0.y * 0.166667;
/*515*/	  } else {
/*516*/	    r0.y = 1.000000;
/*517*/	  }
/*518*/	  if(floatBitsToUint(r0.w) != 0u) {
/*519*/	    r0.z = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r0.x)+1536u].x));
/*520*/	    r0.w = uintBitsToFloat((r4.w < 0.200000) ? 0xffffffffu : 0x00000000u);
/*521*/	    r1.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*522*/	    r6.xyz = (mix(vec4(1.000000, 0.500000, 1.000000, 0), vec4(360.000000, 180.000000, 0.004000, 0), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*523*/	    r7.xyz = (cb2.data[1].xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r6.yyyy).xyz;
/*524*/	    r8.xyz = (r6.zzzz * r7.xyzx).xyz;
/*525*/	    r1.x = saturate(cb6.data[floatBitsToUint(r0.x)+1536u].z)/**/;
/*526*/	    r7.xyz = (-r7.xyzx * r6.zzzz + cb6.data[floatBitsToUint(r0.x)+1536u].zzzz).xyz;
/*527*/	    r7.xyz = (r1.xxxx * r7.xyzx + r8.xyzx).xyz;
/*528*/	    r8.xyz = (r2.xyzx * cb6.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*529*/	    r7.xyz = (r7.xyzx * r3.xyzx + r8.xyzx).xyz;
/*530*/	    r4.xyz = (mix(r3.xyzx, r7.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*531*/	    r6.yw = (-r5.yyyy * gsOut_T4.zzzw).yw;
/*532*/	    r6.yw = (r5.xxxx * gsOut_T4.xxxy + r6.yyyw).yw;
/*533*/	    r7.xyz = (r6.wwww * cb4.data[1].xyzx).xyz;
/*534*/	    r7.xyz = (-r6.yyyy * cb4.data[0].xyzx + -r7.xyzx).xyz;
/*535*/	    r7.xyz = (-r5.zzzz * cb4.data[2].xyzx + r7.xyzx).xyz;
/*536*/	    if(floatBitsToUint(r0.z) != 0u) {
/*537*/	      r0.z = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r0.x)+1536u].y));
/*538*/	      r0.w = dot(vec3(-cb2.data[0].yzwy), vec3(-cb2.data[0].yzwy));
/*539*/	      r0.w = inversesqrt(r0.w);
/*540*/	      r9.xyz = (r0.wwww * -cb2.data[0].yzwy).xyz;
/*541*/	      r0.w = dot(vec3(r9.xyzx), vec3(r7.xyzx));
/*542*/	      r0.w = max(r0.w, 0.000000);
/*543*/	      r0.w = r0.w + -1.000000;
/*544*/	      r0.w = r0.w * cb6.data[floatBitsToUint(r0.x)+2048u].y;
/*545*/	      r0.w = gsOut_T3.w * r0.w + 1.000000;
/*546*/	      r9.xyz = (r3.xyzx * cb6.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*547*/	      r10.xyz = (r0.wwww * r9.xyzx).xyz;
/*548*/	      r10.xyz = (r10.xyzx * cb2.data[1].xyzx).xyz;
/*549*/	      r10.xyz = (r6.zzzz * r10.xyzx).xyz;
/*550*/	      r11.xyz = (r6.xxxx * cb2.data[4].xyzx).xyz;
/*551*/	      r9.xyz = (r9.xyzx * r11.xyzx).xyz;
/*552*/	      r9.xyz = (r6.zzzz * r9.xyzx).xyz;
/*553*/	      r9.xyz = (r0.yyyy * r10.xyzx + r9.xyzx).xyz;
/*554*/	      r3.xyz = (r9.xyzx * gsOut_T3.zzzz).xyz;
/*555*/	      r0.z = floatBitsToUint(r0.z);
/*556*/	      r0.w = r4.w * gsOut_T3.w + -r3.w;
/*557*/	      r3.w = r0.z * r0.w + r4.w;
/*558*/	    } else {
/*559*/	      r9.xyz = (r7.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*560*/	      r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*561*/	      r0.z = inversesqrt(r0.z);
/*562*/	      r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*563*/	      r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*564*/	      r11.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*565*/	      r10.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*566*/	      r12.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*567*/	      r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*568*/	      r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*569*/	      r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*570*/	      r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*571*/	      r6.xyw = (r6.xxxx * r9.xyxz).xyw;
/*572*/	      r0.z = dot(vec3(-cb2.data[0].yzwy), vec3(-cb2.data[0].yzwy));
/*573*/	      r0.z = inversesqrt(r0.z);
/*574*/	      r9.xyz = (r0.zzzz * -cb2.data[0].yzwy).xyz;
/*575*/	      r0.z = dot(vec3(cb0.data[3].xyzx), vec3(cb0.data[3].xyzx));
/*576*/	      r0.z = inversesqrt(r0.z);
/*577*/	      r10.xyz = (r0.zzzz * cb0.data[3].xyzx).xyz;
/*578*/	      r0.z = dot(vec3(-r9.xyzx), vec3(r10.xyzx));
/*579*/	      r0.w = cb6.data[floatBitsToUint(r0.x)+2048u].w + cb6.data[floatBitsToUint(r0.x)+2048u].z;
/*580*/	      r1.y = dot(vec3(r9.xyzx), vec3(r7.xyzx));
/*581*/	      r1.y = r1.y * -0.500000 + 0.500000;
/*582*/	      r1.y = -r0.w * r1.y;
/*583*/	      r1.y = r1.y * cb6.data[floatBitsToUint(r0.x)+2048u].x;
/*584*/	      r1.y = r1.y * gsOut_T3.x;
/*585*/	      r1.y = r1.y * 1.442695;
/*586*/	      r1.y = exp2(r1.y);
/*587*/	      r2.w = 1.000000 + -cb6.data[floatBitsToUint(r0.x)+1536u].w;
/*588*/	      r2.w = r2.w * r2.w;
/*589*/	      r2.w = r2.w * 0.079577;
/*590*/	      r5.w = cb6.data[floatBitsToUint(r0.x)+1536u].w * cb6.data[floatBitsToUint(r0.x)+1536u].w + 1.000000;
/*591*/	      r7.x = dot(vec2(r0.zzzz), vec2(cb6.data[floatBitsToUint(r0.x)+1536u].wwww));
/*592*/	      r5.w = r5.w + -r7.x;
/*593*/	      r5.w = log2(r5.w);
/*594*/	      r5.w = r5.w * 1.500000;
/*595*/	      r5.w = exp2(r5.w);
/*596*/	      r2.w = r2.w / r5.w;
/*597*/	      r2.w = r2.w * cb6.data[floatBitsToUint(r0.x)+2048u].w;
/*598*/	      r0.z = r0.z * r0.z + 1.000000;
/*599*/	      r0.z = r0.z * 0.059683;
/*600*/	      r0.z = r0.z * cb6.data[floatBitsToUint(r0.x)+2048u].z + r2.w;
/*601*/	      r0.z = r0.z / r0.w;
/*602*/	      r0.w = -r1.y + 1.000000;
/*603*/	      r0.z = r0.z * r0.w + r1.y;
/*604*/	      r7.xyz = (r0.zzzz * cb2.data[1].xyzx).xyz;
/*605*/	      r0.yzw = (r7.xxyz * r0.yyyy + r6.xxyw).yzw;
/*606*/	      r6.xyw = (r6.zzzz * r0.yzyw).xyw;
/*607*/	      r0.yzw = (-r0.yyzw * r6.zzzz + cb6.data[floatBitsToUint(r0.x)+1536u].zzzz).yzw;
/*608*/	      r0.yzw = (r1.xxxx * r0.yyzw + r6.xxyw).yzw;
/*609*/	      r3.xyz = (r0.yzwy * r3.xyzx + r8.xyzx).xyz;
/*610*/	      r3.w = r4.w;
/*611*/	    }
/*612*/	  } else {
/*613*/	    r4.xyz = (r3.xyzx).xyz;
/*614*/	  }
/*615*/	  r0.y = r4.w + -0.100000;
/*616*/	  r0.y = r0.y * 10.000000;
/*617*/	  r0.y = min(r0.y, 1.000000);
/*618*/	  r6.xyzw = r3.xyzw + -r4.xyzw;
/*619*/	  r4.xyzw = r0.yyyy * r6.xyzw + r4.xyzw;
/*620*/	} else {
/*621*/	  r0.y = uintBitsToFloat(uint(0x00200000u) & floatBitsToUint(cb5.data[floatBitsToUint(r0.x)].x));
/*622*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*623*/	  r0.zw = (mix(vec4(0, 0, 0.500000, 1.000000), vec4(0, 0, 180.000000, 0.004000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*624*/	  r6.xyz = (cb2.data[1].xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r0.zzzz).xyz;
/*625*/	  r7.xyz = (r0.wwww * r6.xyzx).xyz;
/*626*/	  r0.z = saturate(cb6.data[floatBitsToUint(r0.x)+1536u].z)/**/;
/*627*/	  r6.xyz = (-r6.xyzx * r0.wwww + cb6.data[floatBitsToUint(r0.x)+1536u].zzzz).xyz;
/*628*/	  r6.xyz = (r0.zzzz * r6.xyzx + r7.xyzx).xyz;
/*629*/	  r2.xyz = (r2.xyzx * cb6.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*630*/	  r2.xyz = (r6.xyzx * r3.xyzx + r2.xyzx).xyz;
/*631*/	  r4.xyz = (mix(r3.xyzx, r2.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*632*/	  r5.xyz = (vec4(0, 0, 1.000000, 0)).xyz;
/*633*/	}
/*634*/	if(floatBitsToUint(r1.z) != 0u) {
/*635*/	  r0.y = max(0.000000, cb6.data[floatBitsToUint(r0.x)+512u].x);
/*636*/	  r0.z = -r0.y + 1.000000;
/*637*/	  r1.xyz = (gsOut_T2.xyzx + -cb0.data[0].xyzx).xyz;
/*638*/	  r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*639*/	  r0.w = inversesqrt(r0.w);
/*640*/	  r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*641*/	  r0.w = dot(vec3(-r1.xyzx), vec3(r5.xyzx));
/*642*/	  r0.w = r0.w + r0.w;
/*643*/	  r2.xyz = (r5.xyzx * -r0.wwww + -r1.xyzx).xyz;
/*644*/	  r0.w = 1.000000 + -cb6.data[floatBitsToUint(r0.x)+512u].y;
/*645*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*646*/	  r3.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*647*/	  if(floatBitsToUint(r3.x) != 0u) {
/*648*/	    r3.x = dot(vec3(-cb2.data[0].yzwy), vec3(r2.xyzx));
/*649*/	    r3.x = max(r3.x, -1.000000);
/*650*/	    r3.x = min(r3.x, 1.000000);
/*651*/	    r3.y = -abs(r3.x) + 1.000000;
/*652*/	    r3.y = sqrt(r3.y);
/*653*/	    r3.z = abs(r3.x) * -0.018729 + 0.074261;
/*654*/	    r3.z = r3.z * abs(r3.x) + -0.212114;
/*655*/	    r3.z = r3.z * abs(r3.x) + 1.570729;
/*656*/	    r3.w = r3.y * r3.z;
/*657*/	    r3.w = r3.w * -2.000000 + 3.141593;
/*658*/	    r3.x = uintBitsToFloat((r3.x < -r3.x) ? 0xffffffffu : 0x00000000u);
/*659*/	    r3.x = uintBitsToFloat(floatBitsToUint(r3.x) & floatBitsToUint(r3.w));
/*660*/	    r3.x = r3.z * r3.y + r3.x;
/*661*/	    r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*662*/	    r3.z = cb6.data[floatBitsToUint(r0.x)+512u].y * cb6.data[floatBitsToUint(r0.x)+512u].y;
/*663*/	    r3.yw = (mix(vec4(0, 1.000000, 0, -0.000100), vec4(0, 0.004000, 0, 0.995900), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).yw;
/*664*/	    r3.y = r3.z * r3.w + r3.y;
/*665*/	    r3.y = r3.y * 0.500000 + 0.500000;
/*666*/	    r3.y = r3.y * 2.000000 + -1.000000;
/*667*/	    r3.z = -r3.y * r3.y + 1.000000;
/*668*/	    r3.z = max(r3.z, 0.001000);
/*669*/	    r3.z = log2(r3.z);
/*670*/	    r3.w = r3.z * 4.950617;
/*671*/	    r3.z = r3.z * 0.346574 + 4.546885;
/*672*/	    r5.x = uintBitsToFloat((0.000000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*673*/	    r3.y = uintBitsToFloat((r3.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*674*/	    r3.y = intBitsToFloat(1 + ~floatBitsToInt(r5.x) + floatBitsToInt(r3.y));
/*675*/	    r3.y = floatBitsToInt(r3.y);
/*676*/	    r3.w = r3.z * r3.z + -r3.w;
/*677*/	    r3.w = sqrt(r3.w);
/*678*/	    r3.z = -r3.z + r3.w;
/*679*/	    r3.z = max(r3.z, 0.000000);
/*680*/	    r3.z = sqrt(r3.z);
/*681*/	    r3.y = r3.z * r3.y;
/*682*/	    r3.y = r3.y * 1.414214;
/*683*/	    r3.y = 0.008727 / r3.y;
/*684*/	    r3.y = max(r3.y, 0.000100);
/*685*/	    r3.xz = (r3.xxxx + vec4(-0.008727, 0.000000, 0.008727, 0.000000)).xz;
/*686*/	    r3.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.y)).y;
/*687*/	    r3.xy = (r3.yyyy * r3.xzxx).xy;
/*688*/	    r3.zw = (r3.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*689*/	    r3.zw = (r3.zzzw * r3.zzzw).zw;
/*690*/	    r5.xyzw = r3.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*691*/	    r5.xy = (r5.xzxx / r5.ywyy).xy;
/*692*/	    r3.zw = (-r3.zzzw * r5.xxxy).zw;
/*693*/	    r5.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*694*/	    r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*695*/	    r3.x = intBitsToFloat(1 + ~floatBitsToInt(r5.x) + floatBitsToInt(r3.x));
/*696*/	    r3.x = floatBitsToInt(r3.x);
/*697*/	    r3.yz = (r3.zzwz * vec4(0.000000, 1.442695, 1.442695, 0.000000)).yz;
/*698*/	    r3.yz = (exp2(r3.yyzy)).yz;
/*699*/	    r3.yz = (-r3.yyzy + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*700*/	    r3.yz = (sqrt(r3.yyzy)).yz;
/*701*/	    r3.x = r3.x * r3.y + 1.000000;
/*702*/	    r3.x = r3.x * 0.500000;
/*703*/	    r3.y = 1 + ~floatBitsToInt(r5.y);
/*704*/	    r3.y = r3.y * r3.z + 1.000000;
/*705*/	    r3.x = r3.y * 0.500000 + -r3.x;
/*706*/	    r2.w = saturate(r2.w);
/*707*/	    r3.yzw = (r0.wwwy * vec4(0.000000, 1.570796, 1.539380, 60.000000)).yzw;
/*708*/	    r3.y = sin(r3.y);
/*709*/	    r2.w = r2.w + -1.000000;
/*710*/	    r2.w = r3.y * r2.w + 1.000000;
/*711*/	    r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(-cb2.data[0].yzwy));
/*712*/	    r3.y = log2(r3.y);
/*713*/	    r3.y = r3.y * 10.000000;
/*714*/	    r3.y = exp2(r3.y);
/*715*/	        r3.z = cos((r3.z));
/*716*/	    r3.z = inversesqrt(r3.z);
/*717*/	    r3.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.z)).z;
/*718*/	    r3.w = min(r3.w, 1.000000);
/*719*/	    r3.y = r3.z * r3.y;
/*720*/	    r3.z = -r0.y + r3.w;
/*721*/	    r3.y = r3.y * r3.z + r0.y;
/*722*/	    r2.w = r2.w * abs(r3.x);
/*723*/	    r2.w = r3.y * r2.w;
/*724*/	  } else {
/*725*/	    r2.w = 0;
/*726*/	  }
/*727*/	  r3.xyz = (r2.wwww * cb6.data[floatBitsToUint(r0.x)].xyzx).xyz;
/*728*/	  r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*729*/	  r3.xyz = (r3.xyzx * cb6.data[floatBitsToUint(r0.x)+512u].zzzz).xyz;
/*730*/	  r3.xyz = (r4.wwww * r3.xyzx).xyz;
/*731*/	  r3.xyz = (r4.xyzx * r0.zzzz + r3.xyzx).xyz;
/*732*/	  r5.xyzw = (textureLod(s_environment, r2.xyzx.stp, r0.w)).xyzw;
/*733*/	  r0.z = dot(vec3(r2.xyzx), vec3(-r1.xyzx));
/*734*/	  r0.z = max(r0.z, 0.000000);
/*735*/	  r0.z = log2(r0.z);
/*736*/	  r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, 10.000000, 1.539380)).zw;
/*737*/	  r0.z = exp2(r0.z);
/*738*/	    r0.w = cos((r0.w));
/*739*/	  r0.w = inversesqrt(r0.w);
/*740*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*741*/	  r1.x = r0.y * 60.000000;
/*742*/	  r1.x = min(r1.x, 1.000000);
/*743*/	  r0.z = r0.w * r0.z;
/*744*/	  r0.w = -r0.y + r1.x;
/*745*/	  r0.z = r0.z * r0.w + r0.y;
/*746*/	  r0.y = max(r0.z, r0.y);
/*747*/	  r0.yzw = (r0.yyyy * r5.xxyz).yzw;
/*748*/	  r0.yzw = (r0.yyzw * cb6.data[floatBitsToUint(r0.x)].xxyz).yzw;
/*749*/	  r4.xyz = (r0.yzwy * r4.wwww + r3.xyzx).xyz;
/*750*/	}
/*751*/	if(floatBitsToUint(r1.w) != 0u) {
/*752*/	  r1.xyz = (gsOut_T2.xyzx).xyz;
/*753*/	  r1.w = 1.000000;
/*754*/	  r0.y = dot(r1.xyzw, cb0.data[3].xyzw);
/*755*/	  r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*756*/	  r0.zw = (r0.zzzw * cb0.data[30].zzzw).zw;
/*757*/	  r1.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, 0.000000)).yzxw;
/*758*/	  r1.xy = (r0.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*759*/	  r1.w = 1.000000;
/*760*/	  r0.z = dot(r1.xyzw, cb0.data[19].xyzw);
/*761*/	  r0.w = dot(r1.xyzw, cb0.data[20].xyzw);
/*762*/	  r0.z = r0.z / r0.w;
/*763*/	  r0.y = -r0.y + r0.z;
/*764*/	  r0.y = saturate(r0.y / cb6.data[floatBitsToUint(r0.x)+3072u].x);
/*765*/	  r4.xyzw = r0.yyyy * r4.xyzw;
/*766*/	}
/*767*/	r0.x = uintBitsToFloat(uint(0x01000000u) & floatBitsToUint(cb5.data[floatBitsToUint(r0.x)].x));
/*768*/	r1.xyz = (gsOut_T2.xyzx + -cb0.data[0].xyzx).xyz;
/*769*/	r1.w = max(r1.y, 0.000000);
/*770*/	r2.xyzw = (texture(s_sky, r1.xwzx.stp)).xyzw;
/*771*/	if(floatBitsToUint(r0.x) != 0u) {
/*772*/	  r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*773*/	  r0.x = sqrt(r0.x);
/*774*/	  r0.y = saturate(cb3.data[0].w)/**/;
/*775*/	  r0.y = -r0.y + 1.000000;
/*776*/	  r0.y = r0.y * 8.000000 + -4.000000;
/*777*/	  r0.z = saturate(cb3.data[1].x)/**/;
/*778*/	  r0.z = -r0.z + 1.000000;
/*779*/	  r0.z = r0.z * 1000.000000;
/*780*/	  r0.x = r0.x / r0.z;
/*781*/	  r0.x = r0.x + r0.y;
/*782*/	  r0.x = r0.x * 1.442695;
/*783*/	  r0.x = exp2(r0.x);
/*784*/	  r0.x = cb3.data[1].y / r0.x;
/*785*/	  r0.x = saturate(-r0.x + cb3.data[1].y);
/*786*/	  r0.y = -gsOut_T2.y + cb3.data[1].w;
/*787*/	  r0.z = -cb3.data[1].z + cb3.data[1].w;
/*788*/	  r0.y = r0.y + -cb3.data[1].z;
/*789*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*790*/	  r0.y = saturate(r0.z * r0.y);
/*791*/	  r0.z = r0.y * -2.000000 + 3.000000;
/*792*/	  r0.y = r0.y * r0.y;
/*793*/	  r0.y = r0.y * r0.z;
/*794*/	  r0.z = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*795*/	  r0.z = sqrt(r0.z);
/*796*/	  r0.w = max(cb3.data[2].z, 0.001000);
/*797*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*798*/	  r0.z = r0.w * r0.z;
/*799*/	  r0.z = min(r0.z, 1.000000);
/*800*/	  r0.w = r0.z * -2.000000 + 3.000000;
/*801*/	  r0.z = r0.z * r0.z;
/*802*/	  r0.z = r0.z * r0.w;
/*803*/	  r0.x = cb3.data[2].x * r0.y + r0.x;
/*804*/	  r1.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*805*/	  r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*806*/	  r1.xyz = (r1.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*807*/	  r0.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*808*/	    r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 0.004000 : 1.000000;
/*809*/	  r3.xyz = (r0.yyyy * r1.xyzx).xyz;
/*810*/	  r0.w = saturate(dot(vec2(r0.xxxx), vec2(cb3.data[2].yyyy)));
/*811*/	  r1.xyz = (-r1.xyzx * r0.yyyy + r2.xyzx).xyz;
/*812*/	  r1.xyz = (r0.wwww * r1.xyzx + r3.xyzx).xyz;
/*813*/	  r0.x = saturate(r0.x * r0.z);
/*814*/	  r0.yzw = (r1.xxyz * r4.wwww + -r4.xxyz).yzw;
/*815*/	  r4.xyz = (r0.xxxx * r0.yzwy + r4.xyzx).xyz;
/*816*/	}
/*817*/	color0.xyzw = r4.xyzw;
/*818*/	return;
}
