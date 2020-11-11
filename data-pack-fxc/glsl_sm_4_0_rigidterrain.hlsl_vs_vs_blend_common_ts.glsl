// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1489 - fxc/glsl_SM_4_0_rigidterrain.hlsl_VS_vs_blend_common_ts.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_P1;
in vec4 vsIn_P2;

out vec4 vsOut_T0;
out vec4 vsOut_T1;

layout(std140) uniform ts_blend_cb
{
  vec4 data[4];
} cb0;

void main()
{
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
  const vec4 c[8] = vec4[8](
    vec4(1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, -1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(-1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, -1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(-1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000)
  );
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = vsIn_P2.x + 0.100000;
/*1*/	r0.x = floor(r0.x);
/*2*/	r0.x = intBitsToFloat(int(r0.x));
/*3*/	r0.x = intBitsToFloat(floatBitsToInt(r0.x) << int(1));
/*4*/	r0.yz = (vsIn_P0.xxzx + vec4(0.000000, -0.500000, -0.500000, 0.000000)).yz;
/*5*/	r1.x = dot(vec2(r0.yzyy), vec2(c[uint(floatBitsToInt(r0.x))].xyxx));
/*6*/	r1.y = dot(vec2(r0.yzyy), vec2(c[uint(floatBitsToInt(r0.x))+1u].xyxx));
/*7*/	r0.yz = (r1.xxyx + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*8*/	r1.xy = (vsIn_P1.zwzz * r0.yzyy + vsIn_P1.xyxx).xy;
/*9*/	r1.z = -r1.y;
/*10*/	r0.yz = (r1.xxzx + -cb0.data[0].zzwz).yz;
/*11*/	vsOut_T1.xy = (r1.xzxx).xy;
/*12*/	r1.x = r0.y * cb0.data[0].x;
/*13*/	r1.z = -r0.z * cb0.data[0].y + 1.000000;
/*14*/	gl_Position.xy = (r1.xzxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*15*/	gl_Position.zw = (vec4(0, 0, 0, 1.000000)).zw;
/*16*/	vsOut_T0.z = c[uint(floatBitsToInt(r0.x))].x;
/*17*/	vsOut_T0.w = c[uint(floatBitsToInt(r0.x))+1u].x;
/*18*/	vsOut_T0.xy = (vsIn_P0.xzxx * vec4(1.000000, -1.000000, 0.000000, 0.000000) + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xy;
/*19*/	return;
}
