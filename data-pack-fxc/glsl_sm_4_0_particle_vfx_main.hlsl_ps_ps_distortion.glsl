//
//
// Shader Model 4
// Fragment Shader
//
// id: 50 - fxc/glsl_SM_4_0_particle_vfx_main.hlsl_PS_ps_distortion.glsl
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
in vec4 gsOut_T5;
in vec4 gsOut_T6;

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2DArray g_sam_diffuse;
uniform sampler2DArray g_sam_normal;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform cb_vfx_emitter_constants_common
{
  vec4 data[512];
} cb1;
layout(std140) uniform cb_vfx_emitter_constants_ps
{
  vec4 data[3584];
} cb2;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.x = uintBitsToFloat(uint(gsOut_T0.x));
/*1*/	r0.y = uintBitsToFloat(uint(cb2.data[floatBitsToUint(r0.x)+2560u].x));
/*2*/	r1.xyz = (uintBitsToFloat(uvec4(vec4(0x00020000u, 0x00400000u, 0x00800000u, 0)) & floatBitsToUint(cb1.data[floatBitsToUint(r0.x)].xxxx))).xyz;
/*3*/	if(floatBitsToUint(r1.x) != 0u) {
/*4*/	  r2.xyz = (dFdx(gsOut_T1.xyxx)).xyz;
/*5*/	  r3.xyz = (dFdy(gsOut_T1.xyxx)).xyz;
/*6*/	  r4.z = floatBitsToUint(cb1.data[floatBitsToUint(r0.x)].y);
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
/*24*/	r0.z = uintBitsToFloat((cb2.data[floatBitsToUint(r0.x)+2560u].y == cb2.data[floatBitsToUint(r0.x)+2560u].z) ? 0xffffffffu : 0x00000000u);
/*25*/	r0.w = 1.000000 + -cb2.data[floatBitsToUint(r0.x)+2560u].w;
/*26*/	r1.x = max(r0.w, cb2.data[floatBitsToUint(r0.x)+2560u].y);
/*27*/	r4.xy = (gsOut_T5.xxxx * vec4(3276.000000, 4099.000000, 0.000000, 0.000000)).xy;
/*28*/	r4.xy = (fract(r4.xyxx)).xy;
/*29*/	r1.x = r1.x + -1.000000;
/*30*/	r1.x = r4.x * r1.x + 1.000000;
/*31*/	r0.w = r0.w * cb2.data[floatBitsToUint(r0.x)+2560u].z;
/*32*/	r0.w = max(r0.w, cb2.data[floatBitsToUint(r0.x)+2560u].y);
/*33*/	r0.w = r0.w + -cb2.data[floatBitsToUint(r0.x)+2560u].z;
/*34*/	r0.w = r4.y * r0.w + cb2.data[floatBitsToUint(r0.x)+2560u].z;
/*35*/	r0.z = (floatBitsToUint(r0.z) > 0x00000000u) ? r1.x : r0.w;
/*36*/	r0.z = r0.z + -cb2.data[floatBitsToUint(r0.x)+2560u].y;
/*37*/	r0.z = max(r0.z, 0.001000);
/*38*/	r0.w = gsOut_T2.w + -cb2.data[floatBitsToUint(r0.x)+2560u].y;
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
/*52*/	r3.xyzw = mix(r3.xywz, r4.xywz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)));
/*53*/	r3.xyw = (r2.xyxz + r3.xyxw).xyw;
/*54*/	r2.xyzw = uintBitsToFloat(uvec4(lessThan(r3.xywz, vec4(0.020000, 0.020000, 0.020000, 0.020000))) * 0xffffffffu);
/*55*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r2.zzwz) & floatBitsToUint(r2.xxyx))).yz;
/*56*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.y));
/*57*/	if(r0.y != 0) discard;
/*58*/	r0.y = uintBitsToFloat((0.100000 < r3.z) ? 0xffffffffu : 0x00000000u);
/*59*/	r2.z = floatBitsToUint(cb1.data[floatBitsToUint(r0.x)].z);
/*60*/	r2.xy = (gsOut_T1.xyxx).xy;
/*61*/	r2.xyzw = (texture(g_sam_normal, r2.xyzx.stp)).xyzw;
/*62*/	if(floatBitsToUint(r0.y) != 0u) {
/*63*/	  r0.yz = (uintBitsToFloat(uvec4(vec4(0, 0x00040000u, 0x00200000u, 0)) & floatBitsToUint(cb1.data[floatBitsToUint(r0.x)].xxxx))).yz;
/*64*/	  if(floatBitsToUint(r0.y) != 0u) {
/*65*/	    r0.yw = (r2.xxxy * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*66*/	  } else {
/*67*/	    r0.yw = (vec4(0, 0, 0, 0)).yw;
/*68*/	  }
/*69*/	  if(floatBitsToUint(r0.z) != 0u) {
/*70*/	    r0.z = uintBitsToFloat(uint(cb2.data[floatBitsToUint(r0.x)+1536u].x));
/*71*/	    if(floatBitsToUint(r0.z) != 0u) {
/*72*/	      r0.z = uintBitsToFloat(uint(cb2.data[floatBitsToUint(r0.x)+1536u].y));
/*73*/	      r0.z = floatBitsToUint(r0.z);
/*74*/	      r1.x = r3.z * gsOut_T3.w + -r3.z;
/*75*/	      r0.z = r0.z * r1.x + r3.z;
/*76*/	    } else {
/*77*/	      r0.z = r3.z;
/*78*/	    }
/*79*/	  } else {
/*80*/	    r0.z = r3.z;
/*81*/	  }
/*82*/	  r1.x = r3.z + -0.100000;
/*83*/	  r1.x = r1.x * 10.000000;
/*84*/	  r1.x = min(r1.x, 1.000000);
/*85*/	  r0.z = -r3.z + r0.z;
/*86*/	  r3.z = r1.x * r0.z + r3.z;
/*87*/	} else {
/*88*/	  r0.yw = (vec4(0, 0, 0, 0)).yw;
/*89*/	}
/*90*/	if(floatBitsToUint(r1.z) != 0u) {
/*91*/	  r1.xyz = (gsOut_T2.xyzx).xyz;
/*92*/	  r1.w = 1.000000;
/*93*/	  r0.z = dot(r1.xyzw, cb0.data[3].xyzw);
/*94*/	  r1.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*95*/	  r1.xy = (r1.xyxx * cb0.data[30].zwzz).xy;
/*96*/	  r2.xyzw = (textureLod(gbuffer_channel_4_sampler, r1.xyxx.st, 0.000000)).yzxw;
/*97*/	  r2.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*98*/	  r2.w = 1.000000;
/*99*/	  r1.x = dot(r2.xyzw, cb0.data[19].xyzw);
/*100*/	  r1.y = dot(r2.xyzw, cb0.data[20].xyzw);
/*101*/	  r1.x = r1.x / r1.y;
/*102*/	  r0.z = -r0.z + r1.x;
/*103*/	  r0.x = saturate(r0.z / cb2.data[floatBitsToUint(r0.x)+3072u].x);
/*104*/	  r3.z = r0.x * r3.z;
/*105*/	}
/*106*/	r0.xy = (r0.ywyy + vec4(0.001000, 0.001000, 0.000000, 0.000000)).xy;
/*107*/	r3.xy = (r0.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*108*/	r3.w = 1.000000;
/*109*/	color0.xyzw = r3.xywz;
/*110*/	return;
}
