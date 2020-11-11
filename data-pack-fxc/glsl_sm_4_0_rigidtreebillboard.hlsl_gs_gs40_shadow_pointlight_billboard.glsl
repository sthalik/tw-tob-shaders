//
//
// Shader Model 4
// Geometry Shader
//
// id: 1357 - fxc/glsl_SM_4_0_rigidtreebillboard.hlsl_GS_gs40_shadow_pointlight_billboard.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

layout(triangles) in;
layout(triangle_strip, max_vertices = 18) out;

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0[];
in vec4 vsOut_T1[];
in vec4 vsOut_T2[];

out vec4 gsOut_T0;
out vec4 gsOut_T1;

layout(std140) uniform pointlight_shadows_cb
{
  vec4 data[48];
} cb0;

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

/*0*/	r0.x = 0;
/*1*/	r1.xw = (vec4(0, 0, 0, 0)).xw;
/*2*/	r2.xz = (vec4(3.000000, 0, 0, 0)).xz;
/*3*/	r3.xz = (vec4(2.000000, 0, 1.000000, 0)).xz;
/*4*/	r4.w = 1.000000;
/*5*/	r0.w = 0;
/*6*/	while(true) {
/*7*/	  r5.x = uintBitsToFloat((floatBitsToInt(r0.w) >= int(6)) ? 0xffffffffu : 0x00000000u);
/*8*/	  if(r5.x != 0) break;
/*9*/	  r5.x = intBitsToFloat(floatBitsToInt(r0.w) << int(2));
/*10*/	  r5.y = dot(vec2(cb0.data[floatBitsToUint(r5.x)+26u].xzxx), vec2(cb0.data[floatBitsToUint(r5.x)+26u].xzxx));
/*11*/	  r5.y = inversesqrt(r5.y);
/*12*/	  r0.yz = (cb0.data[floatBitsToUint(r5.x)+26u].zzxz).yz/**/;
/*13*/	  r5.yzw = (r0.xxyz * r5.yyyy).yzw;
/*14*/	  r6.xyz = (-r5.yzwy * cb0.data[floatBitsToUint(r5.x)+25u].zxyz).xyz;
/*15*/	  r5.yzw = (cb0.data[floatBitsToUint(r5.x)+25u].yyzx * -r5.zzwy + -r6.xxyz).yzw;
/*16*/	  r0.y = dot(vec3(r5.yzwy), vec3(r5.yzwy));
/*17*/	  r0.y = inversesqrt(r0.y);
/*18*/	  r5.yzw = (r0.yyyy * r5.yyzw).yzw;
/*19*/	  r0.y = 0;
/*20*/	  while(true) {
/*21*/	    r0.z = uintBitsToFloat((floatBitsToInt(r0.y) >= int(3)) ? 0xffffffffu : 0x00000000u);
/*22*/	    if(r0.z != 0) break;
/*23*/	    r6.xyz = (r5.yzwy * gl_in[uint(floatBitsToInt(r0.y))].gl_Position.xxxx).xyz;
/*24*/	    r6.xyz = (r6.xyzx * vsOut_T2[uint(floatBitsToInt(r0.y))].wwww + vsOut_T1[uint(floatBitsToInt(r0.y))].xyzx).xyz;
/*25*/	    r7.xyz = (cb0.data[floatBitsToUint(r5.x)+25u].xyzx * gl_in[uint(floatBitsToInt(r0.y))].gl_Position.yyyy).xyz;
/*26*/	    r4.xyz = (r7.xyzx * vsOut_T2[uint(floatBitsToInt(r0.y))].wwww + r6.xyzx).xyz;
/*27*/	    r0.z = 1.000000 + -vsOut_T1[uint(floatBitsToInt(r0.y))].w;
/*28*/	    r6.x = dot(vec2(vsOut_T1[uint(floatBitsToInt(r0.y))].xzxx), vec2(vsOut_T1[uint(floatBitsToInt(r0.y))].xzxx));
/*29*/	    r6.x = inversesqrt(r6.x);
/*30*/	    r6.xy = (r6.xxxx * vsOut_T1[uint(floatBitsToInt(r0.y))].xzxx).xy;
/*31*/	    r6.z = dot(vec2(vsOut_T2[uint(floatBitsToInt(r0.y))].xzxx), vec2(vsOut_T2[uint(floatBitsToInt(r0.y))].xzxx));
/*32*/	    r6.z = inversesqrt(r6.z);
/*33*/	    r1.yz = (vsOut_T2[uint(floatBitsToInt(r0.y))].xxzx).yz;
/*34*/	    r7.xyzw = r1.xyzw * r6.zzzz;
/*35*/	    r2.w = dot(vec2(r6.xyxx), vec2(-r7.yzyy));
/*36*/	    r1.yz = (-r7.zzwz * cb0.data[floatBitsToUint(r5.x)+25u].yyxy).yz;
/*37*/	    r1.yz = (-r7.xxyx * cb0.data[floatBitsToUint(r5.x)+25u].zzyz + -r1.yyzy).yz;
/*38*/	    r3.w = dot(vec2(r6.xyxx), vec2(r1.yzyy));
/*39*/	    r1.y = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*40*/	    r1.z = uintBitsToFloat((0.000000 < r3.w) ? 0xffffffffu : 0x00000000u);
/*41*/	    r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r1.y));
/*42*/	    r6.x = uintBitsToFloat((r3.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*43*/	    r1.y = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r6.x));
/*44*/	    r3.y = abs(r2.w);
/*45*/	    r2.y = abs(r3.w);
/*46*/	    r2.yw = (mix(r2.zzzw, r2.xxxy, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).yw;
/*47*/	    r2.yw = (mix(r2.yyyw, r3.xxxy, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).yw;
/*48*/	    r1.yz = (mix(r2.yywy, r3.zzwz, greaterThan(floatBitsToUint(r1.zzzz), uvec4(0)))).yz;
/*49*/	    r2.y = dot(r4.xyzw, cb0.data[floatBitsToUint(r5.x)].xyzw);
/*50*/	    r2.w = dot(r4.xyzw, cb0.data[floatBitsToUint(r5.x)+1u].xyzw);
/*51*/	    r3.y = dot(r4.xyzw, cb0.data[floatBitsToUint(r5.x)+2u].xyzw);
/*52*/	    r3.w = dot(r4.xyzw, cb0.data[floatBitsToUint(r5.x)+3u].xyzw);
/*53*/	    gl_Layer = floatBitsToInt(r0.w);
/*54*/	    gl_Position.x = r2.y;
/*55*/	    gl_Position.y = r2.w;
/*56*/	    gl_Position.z = r3.y;
/*57*/	    gl_Position.w = r3.w;
/*58*/	    gsOut_T0.xy = (vsOut_T0[uint(floatBitsToInt(r0.y))].xyxx).xy;
/*59*/	    gsOut_T0.zw = (r1.yyyz).zw;
/*60*/	    gsOut_T1.x = r0.z;
/*61*/	    gsOut_T1.y = vsOut_T0[0].z;
/*62*/	    EmitVertex();
/*63*/	    r0.y = intBitsToFloat(floatBitsToInt(r0.y) + int(1));
/*64*/	  }
/*65*/	  EndPrimitive();
/*66*/	  r0.w = intBitsToFloat(floatBitsToInt(r0.w) + int(1));
/*67*/	}
/*68*/	return;
}
