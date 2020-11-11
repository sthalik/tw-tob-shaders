//
//
// Shader Model 4
// Fragment Shader
//
// id: 158 - fxc/glsl_SM_3_0_sprite.hlsl_PS_DropShadow_ps_3.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T0;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform sprite_PS
{
  vec4 data[3];
} cb1;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

  vec4 x0[2];

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r1.x = saturate(r0.x);
/*2*/	r1.x = log2(r1.x);
/*3*/	r1.x = r1.x * cb0.data[0].z;
/*4*/	r1.w = exp2(r1.x);
/*5*/	r2.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.000000, 0.000000), cb1.data[0].zwzz)) * 0xffffffffu)).xy;
/*6*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xz;
/*7*/	r1.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*8*/	r3.xyzw = mix(r0.xyzw, r1.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*9*/	r4.xyzw = r3.xyzw * vsOut_C0.xyzw;
/*10*/	r0.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.080000, 0.020000, 0.000000, 0.000000), vsOut_T0.zwzz)) * 0xffffffffu)).xy;
/*11*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*12*/	if(floatBitsToUint(r0.x) != 0u) {
/*13*/	    r0.x = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.w : r0.w;
/*14*/	  r0.zw = (uintBitsToFloat(uvec4(notEqual(vsOut_T3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*15*/	  if(floatBitsToUint(r0.z) != 0u) {
/*16*/	    r1.x = vsOut_T3.x * -0.001000 + vsOut_T0.x;
/*17*/	    r1.y = vsOut_T0.y;
/*18*/	    r5.xyzw = (textureLod(s_diffuse_map, r1.xyxx.st, vsOut_T0.y)).xyzw;
/*19*/	    r5.x = saturate(r5.x);
/*20*/	    r0.z = log2(r5.x);
/*21*/	    r0.z = r0.z * cb0.data[0].z;
/*22*/	    r0.z = exp2(r0.z);
/*23*/	        r0.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r0.z : r5.w;
/*24*/	    r1.y = -r0.x + 1.000000;
/*25*/	    r0.z = r0.z * r1.y + r0.x;
/*26*/	    r2.yz = (vsOut_T0.yyyy + vec4(0.000000, -0.001000, 0.001000, 0.000000)).yz;
/*27*/	    r1.zw = (vsOut_T0.yyyy + vec4(0.000000, 0.000000, -0.001000, 0.001000)).zw;
/*28*/	    r5.xyzw = (textureLod(s_diffuse_map, r1.xzxx.st, r2.y)).xyzw;
/*29*/	    r5.x = saturate(r5.x);
/*30*/	    r1.y = log2(r5.x);
/*31*/	    r1.y = r1.y * cb0.data[0].z;
/*32*/	    r1.y = exp2(r1.y);
/*33*/	        r1.y = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.y : r5.w;
/*34*/	    r1.z = -r0.z + 1.000000;
/*35*/	    r0.z = r1.y * r1.z + r0.z;
/*36*/	    r1.xyzw = (textureLod(s_diffuse_map, r1.xwxx.st, r2.z)).xyzw;
/*37*/	    r1.x = saturate(r1.x);
/*38*/	    r1.x = log2(r1.x);
/*39*/	    r1.x = r1.x * cb0.data[0].z;
/*40*/	    r1.x = exp2(r1.x);
/*41*/	        r1.x = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.x : r1.w;
/*42*/	    r1.y = -r0.z + 1.000000;
/*43*/	    r0.x = r1.x * r1.y + r0.z;
/*44*/	  }
/*45*/	  if(floatBitsToUint(r0.w) != 0u) {
/*46*/	    r1.x = vsOut_T3.y * -0.001000 + vsOut_T0.y;
/*47*/	    r1.y = vsOut_T0.x;
/*48*/	    r5.xyzw = (textureLod(s_diffuse_map, r1.yxyy.st, r1.x)).xyzw;
/*49*/	    r5.x = saturate(r5.x);
/*50*/	    r0.z = log2(r5.x);
/*51*/	    r0.z = r0.z * cb0.data[0].z;
/*52*/	    r0.z = exp2(r0.z);
/*53*/	        r0.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r0.z : r5.w;
/*54*/	    r0.w = -r0.x + 1.000000;
/*55*/	    r0.z = r0.z * r0.w + r0.x;
/*56*/	    r1.zw = (vsOut_T0.xxxx + vec4(0.000000, 0.000000, -0.001000, 0.001000)).zw;
/*57*/	    r5.xyzw = (textureLod(s_diffuse_map, r1.zxzz.st, r1.x)).xyzw;
/*58*/	    r5.x = saturate(r5.x);
/*59*/	    r0.w = log2(r5.x);
/*60*/	    r0.w = r0.w * cb0.data[0].z;
/*61*/	    r0.w = exp2(r0.w);
/*62*/	        r0.w = (floatBitsToUint(r2.x) > 0x00000000u) ? r0.w : r5.w;
/*63*/	    r1.y = -r0.z + 1.000000;
/*64*/	    r0.z = r0.w * r1.y + r0.z;
/*65*/	    r1.xyzw = (textureLod(s_diffuse_map, r1.wxww.st, r1.x)).xyzw;
/*66*/	    r1.x = saturate(r1.x);
/*67*/	    r0.w = log2(r1.x);
/*68*/	    r0.w = r0.w * cb0.data[0].z;
/*69*/	    r0.w = exp2(r0.w);
/*70*/	        r0.w = (floatBitsToUint(r2.x) > 0x00000000u) ? r0.w : r1.w;
/*71*/	    r1.x = -r0.z + 1.000000;
/*72*/	    r0.x = r0.w * r1.x + r0.z;
/*73*/	  }
/*74*/	  x0[0].xyz = (vec4(0, 0, 0, 0)).xyz;
/*75*/	  x0[1].xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*76*/	  r0.z = vsOut_C0.w * vsOut_T3.z;
/*77*/	  r1.w = r0.x * r0.z;
/*78*/	  r0.z = uintBitsToFloat(uint(vsOut_T3.w));
/*79*/	  r1.xyz = (x0[floatBitsToInt(r0.z)].xyzx).xyz;
/*80*/	  r0.y = 0.500000;
/*81*/	  r0.xyzw = r0.xxxy * r1.xyzw;
/*82*/	  r1.xyzw = r3.xyzw * vsOut_C0.xyzw + -r0.xyzw;
/*83*/	  r4.xyzw = r4.wwww * r1.xyzw + r0.xyzw;
/*84*/	}
/*85*/	r0.x = r4.w + -0.003922;
/*86*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*87*/	if(r0.x != 0) discard;
/*88*/	r0.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*89*/	r0.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
/*90*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*91*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*92*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*93*/	if(r0.x != 0) discard;
/*94*/	r0.x = uintBitsToFloat((0.500000 < vsOut_T5.z) ? 0xffffffffu : 0x00000000u);
/*95*/	r0.y = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*96*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 1.000000 : -1.000000;
/*97*/	r0.z = r0.y * cb1.data[0].y;
/*98*/	r0.z = fract(r0.z);
/*99*/	r0.y = r0.z * r0.y;
/*100*/	r0.y = r0.y * 3.141593;
/*101*/	r0.y = sin(r0.y);
/*102*/	r1.xyz = (r4.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*103*/	r2.xyz = saturate(r4.xyzx * vec4(3.000000, 3.000000, 3.000000, 0.000000)).xyz;
/*104*/	r2.xyz = (-r4.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r2.xyzx).xyz;
/*105*/	r0.yzw = (r0.yyyy * r2.xxyz + r1.xxyz).yzw;
/*106*/	r0.xyz = saturate(mix(r4.xyzx, r0.yzwy, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*107*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*108*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*109*/	r4.xyz = (exp2(r0.xyzx)).xyz;
/*110*/	color0.xyzw = r4.xyzw;
/*111*/	return;
}
