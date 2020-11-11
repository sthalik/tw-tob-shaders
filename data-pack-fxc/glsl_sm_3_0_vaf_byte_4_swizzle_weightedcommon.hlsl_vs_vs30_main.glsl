// Flat Varyings: 6 7 9 10

//
// Shader Model 4
// Vertex Shader
//
// id: 1592 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_weightedcommon.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_T4;
in vec4 vsIn_T5;
in vec4 vsIn_T6;
in vec4 vsIn_T7;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_P4;
in vec4 vsIn_P5;
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;

out vec4 vsOut_T0;
flat out vec4 vsOut_T9;
flat out vec4 vsOut_P1;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
flat out vec4 vsOut_T6;
flat out vec4 vsOut_T7;
out vec4 vsOut_T8;

uniform sampler2D t_animation_map;
uniform usampler2D t_pixel_selection_object_id_texture;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb1;
layout(std140) uniform variant_animation_size
{
  vec4 data[2];
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
  vec4 r9;

/*0*/	r0.xy = (vsIn_P1.xyxx * vec4(255.009995, 255.009995, 0.000000, 0.000000)).xy;
/*1*/	r0.xy = floor((r0.xyxx).xy);
/*2*/	r0.xy = (intBitsToFloat(ivec4(r0.xyxx))).xy;
/*3*/	r0.xy = intBitsToFloat((floatBitsToInt(r0.xyxx) * ivec4(ivec4(3, 3, 0, 0))).xy) /**/;
/*4*/	r0.xy = (floatBitsToInt(r0.xyxx)).xy;
/*5*/	r0.z = vsIn_T3.x + 0.500000;
/*6*/	r0.z = floor(r0.z);
/*7*/	r0.xy = (r0.xyxx + r0.zzzz).xy;
/*8*/	r0.z = cb2.data[0].z + 0.500000;
/*9*/	r0.z = floor(r0.z);
/*10*/	r0.xyz = (intBitsToFloat(ivec4(r0.xyzx))).xyz;
/*11*/	r1.xy = (uintBitsToFloat(floatBitsToUint(r0.zzzz) ^ floatBitsToUint(r0.xyxx))).xy;
/*12*/	r1.xy = (uintBitsToFloat(floatBitsToUint(r1.xyxx) & uvec4(vec4(0x80000000u, 0x80000000u, 0, 0)))).xy;
/*13*/	r1.zw = (intBitsToFloat(max(floatBitsToInt(r0.xxxy), 1 + ~floatBitsToInt(r0.xxxy))).zw) /**/;
/*14*/	r0.w = intBitsToFloat(max(floatBitsToInt(r0.z), 1 + ~floatBitsToInt(r0.z))) /**/;
/*15*/	r1.zw = (uintBitsToFloat(floatBitsToUint(r1.zzzw) / floatBitsToUint(r0.wwww))).zw;
/*16*/	r2.xy = (intBitsToFloat(1 - ~floatBitsToInt(r1.zwzz))).xy;
/*17*/	r1.xy = (mix(r1.zwzz, r2.xyxx, greaterThan(floatBitsToUint(r1.xyxx), uvec4(0)))).xy;
/*18*/	r0.xy = intBitsToFloat(((1 + ~floatBitsToInt(r1.xyxx)) * (floatBitsToInt(r0.zzzz)) + floatBitsToInt(r0.xyxx)).xy);
/*19*/	r2.xyzw = intBitsToFloat(floatBitsToInt(r0.xyyx) + ivec4(ivec4(1, 1, 2, 2)));
/*20*/	r3.xw = (r2.yyyz).xw;
/*21*/	r0.w = 0;
/*22*/	r1.zw = (r0.yyyw).zw;
/*23*/	r3.yz = (r1.yywy).yz;
/*24*/	r4.xyzw = texelFetch(t_animation_map, floatBitsToInt(r1.zyww).st, floatBitsToInt(r1.zyww).a).xyzw;
/*25*/	r0.z = r1.x;
/*26*/	r1.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.xyzz).st, floatBitsToInt(r3.xyzz).a).xyzw;
/*27*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.wyzz).st, floatBitsToInt(r3.wyzz).a).xyzw;
/*28*/	r5.xyz = (vsIn_P0.xyzx).xyz;
/*29*/	r5.w = 1.000000;
/*30*/	r6.y = dot(r5.xyzw, r1.xyzw);
/*31*/	r6.z = dot(r5.xyzw, r3.xyzw);
/*32*/	r6.x = dot(r5.xyzw, r4.xyzw);
/*33*/	r0.y = -vsIn_P1.z + 1.000000;
/*34*/	r6.xyz = (r6.xyzx * r0.yyyy).xyz;
/*35*/	r7.xyzw = texelFetch(t_animation_map, floatBitsToInt(r0.xzww).st, floatBitsToInt(r0.xzww).a).xyzw;
/*36*/	r2.yz = (r0.zzwz).yz;
/*37*/	r8.x = dot(r5.xyzw, r7.xyzw);
/*38*/	r9.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.xyzz).st, floatBitsToInt(r2.xyzz).a).xyzw;
/*39*/	r2.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.wyzz).st, floatBitsToInt(r2.wyzz).a).xyzw;
/*40*/	r8.y = dot(r5.xyzw, r9.xyzw);
/*41*/	r8.z = dot(r5.xyzw, r2.xyzw);
/*42*/	r5.xyz = (vsIn_P1.zzzz * r8.xyzx + r6.xyzx).xyz;
/*43*/	r5.w = 1.000000;
/*44*/	r6.x = dot(r5.xyzw, vsIn_T0.xyzw);
/*45*/	r6.y = dot(r5.xyzw, vsIn_T1.xyzw);
/*46*/	r6.z = dot(r5.xyzw, vsIn_T2.xyzw);
/*47*/	r6.w = 1.000000;
/*48*/	gl_Position.x = dot(r6.xyzw, cb0.data[9].xyzw);
/*49*/	gl_Position.y = dot(r6.xyzw, cb0.data[10].xyzw);
/*50*/	gl_Position.z = dot(r6.xyzw, cb0.data[11].xyzw);
/*51*/	gl_Position.w = dot(r6.xyzw, cb0.data[12].xyzw);
/*52*/	vsOut_T0.xyzw = r6.xyzw;
/*53*/	vsOut_T1.xyzw = vsIn_P3.xyxy;
/*54*/	r0.xzw = (vsIn_P2.xxyz * vec4(2.000000, 0.000000, 2.000000, 2.000000) + vec4(-1.000000, 0.000000, -1.000000, -1.000000)).xzw;
/*55*/	r5.y = dot(vec3(r0.xzwx), vec3(r1.xyzx));
/*56*/	r5.z = dot(vec3(r0.xzwx), vec3(r3.xyzx));
/*57*/	r5.x = dot(vec3(r0.xzwx), vec3(r4.xyzx));
/*58*/	r5.xyz = (r0.yyyy * r5.xyzx).xyz;
/*59*/	r6.y = dot(vec3(r0.xzwx), vec3(r9.xyzx));
/*60*/	r6.z = dot(vec3(r0.xzwx), vec3(r2.xyzx));
/*61*/	r6.x = dot(vec3(r0.xzwx), vec3(r7.xyzx));
/*62*/	r0.xzw = (vsIn_P1.zzzz * r6.xxyz + r5.xxyz).xzw;
/*63*/	vsOut_T2.x = dot(vec3(r0.xzwx), vec3(vsIn_T0.xyzx));
/*64*/	vsOut_T2.y = dot(vec3(r0.xzwx), vec3(vsIn_T1.xyzx));
/*65*/	vsOut_T2.z = dot(vec3(r0.xzwx), vec3(vsIn_T2.xyzx));
/*66*/	vsOut_T2.w = vsIn_P3.x;
/*67*/	r0.xzw = (vsIn_P5.xxyz * vec4(2.000000, 0.000000, 2.000000, 2.000000) + vec4(-1.000000, 0.000000, -1.000000, -1.000000)).xzw;
/*68*/	r5.y = dot(vec3(r0.xzwx), vec3(r1.xyzx));
/*69*/	r5.z = dot(vec3(r0.xzwx), vec3(r3.xyzx));
/*70*/	r5.x = dot(vec3(r0.xzwx), vec3(r4.xyzx));
/*71*/	r5.xyz = (r0.yyyy * r5.xyzx).xyz;
/*72*/	r6.y = dot(vec3(r0.xzwx), vec3(r9.xyzx));
/*73*/	r6.z = dot(vec3(r0.xzwx), vec3(r2.xyzx));
/*74*/	r6.x = dot(vec3(r0.xzwx), vec3(r7.xyzx));
/*75*/	r0.xzw = (vsIn_P1.zzzz * r6.xxyz + r5.xxyz).xzw;
/*76*/	vsOut_T3.x = dot(vec3(r0.xzwx), vec3(vsIn_T0.xyzx));
/*77*/	vsOut_T3.y = dot(vec3(r0.xzwx), vec3(vsIn_T1.xyzx));
/*78*/	vsOut_T3.z = dot(vec3(r0.xzwx), vec3(vsIn_T2.xyzx));
/*79*/	vsOut_T3.w = vsIn_P3.y;
/*80*/	vsOut_T4.xy = (vsIn_P3.xyxx).xy;
/*81*/	vsOut_T4.z = vsIn_T3.y;
/*82*/	r0.xzw = (vsIn_P4.xxyz * vec4(2.000000, 0.000000, 2.000000, 2.000000) + vec4(-1.000000, 0.000000, -1.000000, -1.000000)).xzw;
/*83*/	r1.y = dot(vec3(r0.xzwx), vec3(r1.xyzx));
/*84*/	r1.z = dot(vec3(r0.xzwx), vec3(r3.xyzx));
/*85*/	r1.x = dot(vec3(r0.xzwx), vec3(r4.xyzx));
/*86*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*87*/	r3.y = dot(vec3(r0.xzwx), vec3(r9.xyzx));
/*88*/	r3.z = dot(vec3(r0.xzwx), vec3(r2.xyzx));
/*89*/	r3.x = dot(vec3(r0.xzwx), vec3(r7.xyzx));
/*90*/	r0.xyz = (vsIn_P1.zzzz * r3.xyzx + r1.xyzx).xyz;
/*91*/	vsOut_T5.x = dot(vec3(r0.xyzx), vec3(vsIn_T0.xyzx));
/*92*/	vsOut_T5.y = dot(vec3(r0.xyzx), vec3(vsIn_T1.xyzx));
/*93*/	vsOut_T5.z = dot(vec3(r0.xyzx), vec3(vsIn_T2.xyzx));
/*94*/	vsOut_T5.w = 1.000000;
/*95*/	vsOut_T6.xy = (vsIn_T3.zwzz).xy;
/*96*/	vsOut_T6.zw = (vsIn_T4.xxxy).zw;
/*97*/	vsOut_T7.xy = (vsIn_T4.zwzz).xy;
/*98*/	vsOut_T7.zw = (vsIn_T7.xxxy).zw;
/*99*/	vsOut_T8.xy = (vec4(1.000000, 1.000000, 0, 0)).xy;
/*100*/	vsOut_T8.z = vsIn_T5.y;
/*101*/	r0.x = intBitsToFloat(gl_InstanceID + floatBitsToInt(cb1.data[4].w));
/*102*/	r0.yzw = (vec4(0, 0, 0, 0)).yzw;
/*103*/	r0.xyzw = uintBitsToFloat(texelFetch(t_pixel_selection_object_id_texture, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw);
/*104*/	vsOut_T9.z = r0.x;
/*105*/	vsOut_T9.xy = (vsIn_T5.zwzz).xy;
/*106*/	vsOut_P1.xyzw = vsIn_T6.xyzw;
/*107*/	return;
}
