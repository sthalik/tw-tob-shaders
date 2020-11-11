//
//
// Shader Model 4
// Geometry Shader
//
// id: 497 - fxc/glsl_SM_4_0_rigidcommon.hlsl_GS_gs40_shadow_pointlight.glsl
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

out vec4 gsOut_T0;

layout(std140) uniform pointlight_shadows_cb
{
  vec4 data[48];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = 0;
/*1*/	while(true) {
/*2*/	  r0.y = uintBitsToFloat((floatBitsToInt(r0.x) >= int(6)) ? 0xffffffffu : 0x00000000u);
/*3*/	  if(r0.y != 0) break;
/*4*/	  r0.y = intBitsToFloat(floatBitsToInt(r0.x) << int(2));
/*5*/	  r0.z = 0;
/*6*/	  while(true) {
/*7*/	    r0.w = uintBitsToFloat((floatBitsToInt(r0.z) >= int(3)) ? 0xffffffffu : 0x00000000u);
/*8*/	    if(r0.w != 0) break;
/*9*/	    r0.w = dot(gl_in[uint(floatBitsToInt(r0.z))].gl_Position.xyzw, cb0.data[floatBitsToUint(r0.y)].xyzw);
/*10*/	    r1.x = dot(gl_in[uint(floatBitsToInt(r0.z))].gl_Position.xyzw, cb0.data[floatBitsToUint(r0.y)+1u].xyzw);
/*11*/	    r1.y = dot(gl_in[uint(floatBitsToInt(r0.z))].gl_Position.xyzw, cb0.data[floatBitsToUint(r0.y)+2u].xyzw);
/*12*/	    r1.z = dot(gl_in[uint(floatBitsToInt(r0.z))].gl_Position.xyzw, cb0.data[floatBitsToUint(r0.y)+3u].xyzw);
/*13*/	    gl_Layer = floatBitsToInt(r0.x);
/*14*/	    gl_Position.x = r0.w;
/*15*/	    gl_Position.y = r1.x;
/*16*/	    gl_Position.z = r1.y;
/*17*/	    gl_Position.w = r1.z;
/*18*/	    gsOut_T0.xy = (vsOut_T0[uint(floatBitsToInt(r0.z))].xyxx).xy;
/*19*/	    EmitVertex();
/*20*/	    r0.z = intBitsToFloat(floatBitsToInt(r0.z) + int(1));
/*21*/	  }
/*22*/	  EndPrimitive();
/*23*/	  r0.x = intBitsToFloat(floatBitsToInt(r0.x) + int(1));
/*24*/	}
/*25*/	return;
}
