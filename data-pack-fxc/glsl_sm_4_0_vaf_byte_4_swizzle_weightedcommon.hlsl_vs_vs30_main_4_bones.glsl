// Flat Varyings: 6 7 9 10

//
// Shader Model 4
// Vertex Shader
//
// id: 2678 - fxc/glsl_SM_4_0_VAF_BYTE_4_SWIZZLE_weightedcommon.hlsl_VS_vs30_main_4_bones.glsl
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
in vec4 vsIn_T3;
in vec4 vsIn_T4;
in vec4 vsIn_T5;
in vec4 vsIn_T6;
in vec4 vsIn_T7;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_P4;
in vec4 vsIn_P5;
in vec4 vsIn_P6;
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;

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
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r14;
  vec4 r15;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = vsIn_P1.xyzw * vec4(255.009995, 255.009995, 255.009995, 255.009995);
/*1*/	r0.xyzw = floor(r0.xyzw);
/*2*/	r0.xyzw = intBitsToFloat(ivec4(r0.xyzw));
/*3*/	r0.xyzw = intBitsToFloat(floatBitsToInt(r0.xyzw) * ivec4(ivec4(3, 3, 3, 3))) /**/;
/*4*/	r0.xyzw = floatBitsToInt(r0.xyzw);
/*5*/	r1.x = vsIn_T3.x + 0.500000;
/*6*/	r1.x = floor(r1.x);
/*7*/	r0.xyzw = r0.xyzw + r1.xxxx;
/*8*/	r0.xyzw = intBitsToFloat(ivec4(r0.xyzw));
/*9*/	r1.x = cb2.data[0].z + 0.500000;
/*10*/	r1.x = floor(r1.x);
/*11*/	r1.x = intBitsToFloat(int(r1.x));
/*12*/	r2.xyzw = uintBitsToFloat(floatBitsToUint(r0.xyzw) ^ floatBitsToUint(r1.xxxx));
/*13*/	r2.xyzw = uintBitsToFloat(floatBitsToUint(r2.xyzw) & uvec4(vec4(0x80000000u, 0x80000000u, 0x80000000u, 0x80000000u)));
/*14*/	r3.xyzw = intBitsToFloat(max(floatBitsToInt(r0.xyzw), 1 + ~floatBitsToInt(r0.xyzw))) /**/;
/*15*/	r1.y = intBitsToFloat(max(floatBitsToInt(r1.x), 1 + ~floatBitsToInt(r1.x))) /**/;
/*16*/	r3.xyzw = uintBitsToFloat(floatBitsToUint(r3.xyzw) / floatBitsToUint(r1.yyyy));
/*17*/	r4.xyzw = intBitsToFloat(1 - ~floatBitsToInt(r3.xyzw));
/*18*/	r2.xyzw = mix(r3.xzyw, r4.xzyw, greaterThan(floatBitsToUint(r2.xzyw), uvec4(0)));
/*19*/	r3.y = r2.z;
/*20*/	r0.xyzw = intBitsToFloat((1 + ~floatBitsToInt(r2.wxzy)) * (floatBitsToInt(r1.xxxx)) + floatBitsToInt(r0.wxyz));
/*21*/	r3.x = r0.z;
/*22*/	r3.z = 0;
/*23*/	r1.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.xyzz).st, floatBitsToInt(r3.xyzz).a).xyzw;
/*24*/	r4.xyz = (vsIn_P0.xyzx).xyz;
/*25*/	r4.w = 1.000000;
/*26*/	r5.x = dot(r4.xyzw, r1.xyzw);
/*27*/	r6.yzw = (r3.yyzz).yzw;
/*28*/	r7.xyzw = intBitsToFloat(floatBitsToInt(r0.yyzz) + ivec4(ivec4(1, 2, 1, 2)));
/*29*/	r6.x = r7.w;
/*30*/	r6.xyzw = texelFetch(t_animation_map, floatBitsToInt(r6.xyzw).st, floatBitsToInt(r6.xyzw).a).xyzw;
/*31*/	r5.z = dot(r4.xyzw, r6.xyzw);
/*32*/	r3.w = r7.z;
/*33*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.wyzz).st, floatBitsToInt(r3.wyzz).a).xyzw;
/*34*/	r5.y = dot(r4.xyzw, r3.xyzw);
/*35*/	r5.xyz = (r5.xyzx * vsIn_P2.yyyy).xyz;
/*36*/	r8.y = r2.x;
/*37*/	r8.x = r0.y;
/*38*/	r8.z = 0;
/*39*/	r9.xyzw = texelFetch(t_animation_map, floatBitsToInt(r8.xyzz).st, floatBitsToInt(r8.xyzz).a).xyzw;
/*40*/	r10.x = dot(r4.xyzw, r9.xyzw);
/*41*/	r11.yzw = (r8.yyzz).yzw;
/*42*/	r11.x = r7.y;
/*43*/	r8.w = r7.x;
/*44*/	r7.xyzw = texelFetch(t_animation_map, floatBitsToInt(r8.wyzz).st, floatBitsToInt(r8.wyzz).a).xyzw;
/*45*/	r8.xyzw = texelFetch(t_animation_map, floatBitsToInt(r11.xyzw).st, floatBitsToInt(r11.xyzw).a).xyzw;
/*46*/	r10.z = dot(r4.xyzw, r8.xyzw);
/*47*/	r10.y = dot(r4.xyzw, r7.xyzw);
/*48*/	r5.xyz = (vsIn_P2.xxxx * r10.xyzx + r5.xyzx).xyz;
/*49*/	r0.y = r2.w;
/*50*/	r2.x = r0.w;
/*51*/	r2.z = 0;
/*52*/	r10.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.xyzz).st, floatBitsToInt(r2.xyzz).a).xyzw;
/*53*/	r11.x = dot(r4.xyzw, r10.xyzw);
/*54*/	r12.yzw = (r2.yyzz).yzw;
/*55*/	r13.xyzw = intBitsToFloat(floatBitsToInt(r0.xwwx) + ivec4(ivec4(2, 1, 2, 1)));
/*56*/	r12.x = r13.z;
/*57*/	r12.xyzw = texelFetch(t_animation_map, floatBitsToInt(r12.xyzw).st, floatBitsToInt(r12.xyzw).a).xyzw;
/*58*/	r11.z = dot(r4.xyzw, r12.xyzw);
/*59*/	r2.w = r13.y;
/*60*/	r2.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.wyzz).st, floatBitsToInt(r2.wyzz).a).xyzw;
/*61*/	r11.y = dot(r4.xyzw, r2.xyzw);
/*62*/	r5.xyz = (vsIn_P2.zzzz * r11.xyzx + r5.xyzx).xyz;
/*63*/	r1.w = vsIn_P2.y + vsIn_P2.x;
/*64*/	r1.w = r1.w + vsIn_P2.z;
/*65*/	r1.w = -r1.w + 1.000000;
/*66*/	r0.z = 0;
/*67*/	r11.xyzw = texelFetch(t_animation_map, floatBitsToInt(r0.xyzz).st, floatBitsToInt(r0.xyzz).a).xyzw;
/*68*/	r14.x = dot(r4.xyzw, r11.xyzw);
/*69*/	r0.w = r13.w;
/*70*/	r15.xyzw = texelFetch(t_animation_map, floatBitsToInt(r0.wyzz).st, floatBitsToInt(r0.wyzz).a).xyzw;
/*71*/	r13.yzw = (r0.yyzz).yzw;
/*72*/	r0.xyzw = texelFetch(t_animation_map, floatBitsToInt(r13.xyzw).st, floatBitsToInt(r13.xyzw).a).xyzw;
/*73*/	r14.z = dot(r4.xyzw, r0.xyzw);
/*74*/	r14.y = dot(r4.xyzw, r15.xyzw);
/*75*/	r4.xyz = (r1.wwww * r14.xyzx + r5.xyzx).xyz;
/*76*/	r4.w = 1.000000;
/*77*/	r5.x = dot(r4.xyzw, vsIn_T0.xyzw);
/*78*/	r5.y = dot(r4.xyzw, vsIn_T1.xyzw);
/*79*/	r5.z = dot(r4.xyzw, vsIn_T2.xyzw);
/*80*/	r5.w = 1.000000;
/*81*/	gl_Position.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*82*/	gl_Position.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*83*/	gl_Position.z = dot(r5.xyzw, cb0.data[11].xyzw);
/*84*/	gl_Position.w = dot(r5.xyzw, cb0.data[12].xyzw);
/*85*/	vsOut_T0.xyzw = r5.xyzw;
/*86*/	vsOut_T1.xyzw = vsIn_P4.xyxy;
/*87*/	r4.xyz = (vsIn_P3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*88*/	r5.z = dot(vec3(r4.xyzx), vec3(r6.xyzx));
/*89*/	r5.y = dot(vec3(r4.xyzx), vec3(r3.xyzx));
/*90*/	r5.x = dot(vec3(r4.xyzx), vec3(r1.xyzx));
/*91*/	r5.xyz = (r5.xyzx * vsIn_P2.yyyy).xyz;
/*92*/	r13.z = dot(vec3(r4.xyzx), vec3(r8.xyzx));
/*93*/	r13.y = dot(vec3(r4.xyzx), vec3(r7.xyzx));
/*94*/	r13.x = dot(vec3(r4.xyzx), vec3(r9.xyzx));
/*95*/	r5.xyz = (vsIn_P2.xxxx * r13.xyzx + r5.xyzx).xyz;
/*96*/	r13.z = dot(vec3(r4.xyzx), vec3(r12.xyzx));
/*97*/	r13.y = dot(vec3(r4.xyzx), vec3(r2.xyzx));
/*98*/	r13.x = dot(vec3(r4.xyzx), vec3(r10.xyzx));
/*99*/	r5.xyz = (vsIn_P2.zzzz * r13.xyzx + r5.xyzx).xyz;
/*100*/	r13.z = dot(vec3(r4.xyzx), vec3(r0.xyzx));
/*101*/	r13.y = dot(vec3(r4.xyzx), vec3(r15.xyzx));
/*102*/	r13.x = dot(vec3(r4.xyzx), vec3(r11.xyzx));
/*103*/	r4.xyz = (r1.wwww * r13.xyzx + r5.xyzx).xyz;
/*104*/	vsOut_T2.x = dot(vec3(r4.xyzx), vec3(vsIn_T0.xyzx));
/*105*/	vsOut_T2.y = dot(vec3(r4.xyzx), vec3(vsIn_T1.xyzx));
/*106*/	vsOut_T2.z = dot(vec3(r4.xyzx), vec3(vsIn_T2.xyzx));
/*107*/	vsOut_T2.w = vsIn_P4.x;
/*108*/	r4.xyz = (vsIn_P6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*109*/	r5.z = dot(vec3(r4.xyzx), vec3(r6.xyzx));
/*110*/	r5.y = dot(vec3(r4.xyzx), vec3(r3.xyzx));
/*111*/	r5.x = dot(vec3(r4.xyzx), vec3(r1.xyzx));
/*112*/	r5.xyz = (r5.xyzx * vsIn_P2.yyyy).xyz;
/*113*/	r13.z = dot(vec3(r4.xyzx), vec3(r8.xyzx));
/*114*/	r13.y = dot(vec3(r4.xyzx), vec3(r7.xyzx));
/*115*/	r13.x = dot(vec3(r4.xyzx), vec3(r9.xyzx));
/*116*/	r5.xyz = (vsIn_P2.xxxx * r13.xyzx + r5.xyzx).xyz;
/*117*/	r13.z = dot(vec3(r4.xyzx), vec3(r12.xyzx));
/*118*/	r13.y = dot(vec3(r4.xyzx), vec3(r2.xyzx));
/*119*/	r13.x = dot(vec3(r4.xyzx), vec3(r10.xyzx));
/*120*/	r5.xyz = (vsIn_P2.zzzz * r13.xyzx + r5.xyzx).xyz;
/*121*/	r13.z = dot(vec3(r4.xyzx), vec3(r0.xyzx));
/*122*/	r13.y = dot(vec3(r4.xyzx), vec3(r15.xyzx));
/*123*/	r13.x = dot(vec3(r4.xyzx), vec3(r11.xyzx));
/*124*/	r4.xyz = (r1.wwww * r13.xyzx + r5.xyzx).xyz;
/*125*/	vsOut_T3.x = dot(vec3(r4.xyzx), vec3(vsIn_T0.xyzx));
/*126*/	vsOut_T3.y = dot(vec3(r4.xyzx), vec3(vsIn_T1.xyzx));
/*127*/	vsOut_T3.z = dot(vec3(r4.xyzx), vec3(vsIn_T2.xyzx));
/*128*/	vsOut_T3.w = vsIn_P4.y;
/*129*/	vsOut_T4.xy = (vsIn_P4.xyxx).xy;
/*130*/	vsOut_T4.z = vsIn_T3.y;
/*131*/	r4.xyz = (vsIn_P5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*132*/	r5.z = dot(vec3(r4.xyzx), vec3(r6.xyzx));
/*133*/	r5.y = dot(vec3(r4.xyzx), vec3(r3.xyzx));
/*134*/	r5.x = dot(vec3(r4.xyzx), vec3(r1.xyzx));
/*135*/	r1.xyz = (r5.xyzx * vsIn_P2.yyyy).xyz;
/*136*/	r3.z = dot(vec3(r4.xyzx), vec3(r8.xyzx));
/*137*/	r3.y = dot(vec3(r4.xyzx), vec3(r7.xyzx));
/*138*/	r3.x = dot(vec3(r4.xyzx), vec3(r9.xyzx));
/*139*/	r1.xyz = (vsIn_P2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*140*/	r3.z = dot(vec3(r4.xyzx), vec3(r12.xyzx));
/*141*/	r3.y = dot(vec3(r4.xyzx), vec3(r2.xyzx));
/*142*/	r3.x = dot(vec3(r4.xyzx), vec3(r10.xyzx));
/*143*/	r1.xyz = (vsIn_P2.zzzz * r3.xyzx + r1.xyzx).xyz;
/*144*/	r0.z = dot(vec3(r4.xyzx), vec3(r0.xyzx));
/*145*/	r0.y = dot(vec3(r4.xyzx), vec3(r15.xyzx));
/*146*/	r0.x = dot(vec3(r4.xyzx), vec3(r11.xyzx));
/*147*/	r0.xyz = (r1.wwww * r0.xyzx + r1.xyzx).xyz;
/*148*/	vsOut_T5.x = dot(vec3(r0.xyzx), vec3(vsIn_T0.xyzx));
/*149*/	vsOut_T5.y = dot(vec3(r0.xyzx), vec3(vsIn_T1.xyzx));
/*150*/	vsOut_T5.z = dot(vec3(r0.xyzx), vec3(vsIn_T2.xyzx));
/*151*/	vsOut_T5.w = 1.000000;
/*152*/	vsOut_T6.xy = (vsIn_T3.zwzz).xy;
/*153*/	vsOut_T6.zw = (vsIn_T4.xxxy).zw;
/*154*/	vsOut_T7.xy = (vsIn_T4.zwzz).xy;
/*155*/	vsOut_T7.zw = (vsIn_T7.xxxy).zw;
/*156*/	vsOut_T8.xy = (vec4(1.000000, 1.000000, 0, 0)).xy;
/*157*/	vsOut_T8.z = vsIn_T5.y;
/*158*/	r0.x = intBitsToFloat(gl_InstanceID + floatBitsToInt(cb1.data[4].w));
/*159*/	r0.yzw = (vec4(0, 0, 0, 0)).yzw;
/*160*/	r0.xyzw = uintBitsToFloat(texelFetch(t_pixel_selection_object_id_texture, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw);
/*161*/	vsOut_T9.z = r0.x;
/*162*/	vsOut_T9.xy = (vsIn_T5.zwzz).xy;
/*163*/	vsOut_P1.xyzw = vsIn_T6.xyzw;
/*164*/	return;
}
