// Flat Varyings: 6 7 9 10

//
// Shader Model 4
// Vertex Shader
//
// id: 2102 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_weightedcommon.hlsl_VS_vs30_main_dismember.glsl
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
  const vec4 c[4] = vec4[4](
    vec4(1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 0.00000000000000, 1.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 0.00000000000000, 0.00000000000000, 1.00000000000000)
  );
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
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
/*2*/	r0.z = cb2.data[0].z + 0.500000;
/*3*/	r0.z = floor(r0.z);
/*4*/	r0.xyz = (intBitsToFloat(ivec4(r0.xyzx))).xyz;
/*5*/	r0.w = vsIn_T3.x + 0.500000;
/*6*/	r0.w = floor(r0.w);
/*7*/	r1.xy = intBitsToFloat((floatBitsToInt(r0.xyxx) * ivec4(ivec4(3, 3, 0, 0))).xy) /**/;
/*8*/	r1.xy = (floatBitsToInt(r1.xyxx)).xy;
/*9*/	r1.xy = (r0.wwww + r1.xyxx).xy;
/*10*/	r1.xy = (intBitsToFloat(ivec4(r1.xyxx))).xy;
/*11*/	r1.zw = (uintBitsToFloat(floatBitsToUint(r0.zzzz) ^ floatBitsToUint(r1.xxxy))).zw;
/*12*/	r2.xy = (intBitsToFloat(max(floatBitsToInt(r1.xyxx), 1 + ~floatBitsToInt(r1.xyxx))).xy) /**/;
/*13*/	r0.w = intBitsToFloat(max(floatBitsToInt(r0.z), 1 + ~floatBitsToInt(r0.z))) /**/;
/*14*/	r2.xy = (uintBitsToFloat(floatBitsToUint(r2.xyxx) / floatBitsToUint(r0.wwww))).xy;
/*15*/	r2.zw = (intBitsToFloat(1 - ~floatBitsToInt(r2.xxxy))).zw;
/*16*/	r1.zw = (uintBitsToFloat(floatBitsToUint(r1.zzzw) & uvec4(vec4(0, 0, 0x80000000u, 0x80000000u)))).zw;
/*17*/	r2.xy = (mix(r2.xyxx, r2.zwzz, greaterThan(floatBitsToUint(r1.zwzz), uvec4(0)))).xy;
/*18*/	r1.xy = intBitsToFloat(((1 + ~floatBitsToInt(r2.xyxx)) * (floatBitsToInt(r0.zzzz)) + floatBitsToInt(r1.xyxx)).xy);
/*19*/	r3.xyzw = intBitsToFloat(floatBitsToInt(r1.xxyy) + ivec4(ivec4(1, 2, 1, 2)));
/*20*/	r1.z = r2.x;
/*21*/	r1.w = 0;
/*22*/	r4.xyzw = texelFetch(t_animation_map, floatBitsToInt(r1.xzww).st, floatBitsToInt(r1.xzww).a).xyzw;
/*23*/	r5.xw = (r3.xxxy).xw;
/*24*/	r5.yz = (r1.zzwz).yz;
/*25*/	r6.xyzw = texelFetch(t_animation_map, floatBitsToInt(r5.xyzz).st, floatBitsToInt(r5.xyzz).a).xyzw;
/*26*/	r5.xyzw = texelFetch(t_animation_map, floatBitsToInt(r5.wyzz).st, floatBitsToInt(r5.wyzz).a).xyzw;
/*27*/	r2.zw = (r1.wwwy).zw;
/*28*/	r1.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.wyzz).st, floatBitsToInt(r2.wyzz).a).xyzw;
/*29*/	r2.xw = (r3.zzzw).xw;
/*30*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.xyzz).st, floatBitsToInt(r2.xyzz).a).xyzw;
/*31*/	r2.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.wyzz).st, floatBitsToInt(r2.wyzz).a).xyzw;
/*32*/	r7.x = uintBitsToFloat((0.100000 < vsIn_T5.x) ? 0xffffffffu : 0x00000000u);
/*33*/	if(floatBitsToUint(r7.x) != 0u) {
/*34*/	  r7.x = vsIn_T5.x * 3.000000 + vsIn_T3.x;
/*35*/	  r7.x = intBitsToFloat(int(r7.x));
/*36*/	  r7.yz = (uintBitsToFloat(floatBitsToUint(r0.xxyx) ^ uvec4(ivec4(0, 4, 4, 0)))).yz;
/*37*/	  r8.xy = (intBitsToFloat(max(floatBitsToInt(r0.xyxx), 1 + ~floatBitsToInt(r0.xyxx))).xy) /**/;
/*38*/	  r8.zw = (uintBitsToFloat(floatBitsToUint(r8.xxxy) >> uint(2))).zw;
/*39*/	  r9.xy = (intBitsToFloat(1 - ~floatBitsToInt(r8.zwzz))).xy;
/*40*/	  r7.yz = (uintBitsToFloat(floatBitsToUint(r7.yyzy) & uvec4(vec4(0, 0x80000000u, 0x80000000u, 0)))).yz;
/*41*/	  r7.yz = (mix(r8.zzwz, r9.xxyx, greaterThan(floatBitsToUint(r7.yyzy), uvec4(0)))).yz;
/*42*/	  r7.xy = intBitsToFloat((floatBitsToInt(r7.yzyy) + floatBitsToInt(r7.xxxx)).xy);
/*43*/	  r7.zw = (uintBitsToFloat(floatBitsToUint(r0.zzzz) ^ floatBitsToUint(r7.xxxy))).zw;
/*44*/	  r8.zw = (intBitsToFloat(max(floatBitsToInt(r7.xxxy), 1 + ~floatBitsToInt(r7.xxxy))).zw) /**/;
/*45*/	  r8.zw = (uintBitsToFloat(floatBitsToUint(r8.zzzw) / floatBitsToUint(r0.wwww))).zw;
/*46*/	  r9.xy = (intBitsToFloat(1 - ~floatBitsToInt(r8.zwzz))).xy;
/*47*/	  r7.zw = (uintBitsToFloat(floatBitsToUint(r7.zzzw) & uvec4(vec4(0, 0, 0x80000000u, 0x80000000u)))).zw;
/*48*/	  r9.xy = (mix(r8.zwzz, r9.xyxx, greaterThan(floatBitsToUint(r7.zwzz), uvec4(0)))).xy;
/*49*/	  r7.xy = intBitsToFloat(((1 + ~floatBitsToInt(r9.xyxx)) * (floatBitsToInt(r0.zzzz)) + floatBitsToInt(r7.xyxx)).xy);
/*50*/	  r7.z = r9.x;
/*51*/	  r7.w = 0;
/*52*/	  r10.xyzw = texelFetch(t_animation_map, floatBitsToInt(r7.xzww).st, floatBitsToInt(r7.xzww).a).xyzw;
/*53*/	  r0.xy = (uintBitsToFloat(floatBitsToUint(r0.xyxx) & uvec4(vec4(0x80000000u, 0x80000000u, 0, 0)))).xy;
/*54*/	  r0.zw = (uintBitsToFloat(floatBitsToUint(r8.xxxy) & uvec4(ivec4(0, 0, 3, 3)))).zw;
/*55*/	  r7.xz = (intBitsToFloat(1 - ~floatBitsToInt(r0.zzwz))).xz;
/*56*/	  r0.xy = (mix(r0.zwzz, r7.xzxx, greaterThan(floatBitsToUint(r0.xyxx), uvec4(0)))).xy;
/*57*/	  r0.x = dot(r10.xyzw, c[uint(floatBitsToInt(r0.x))].xyzw);
/*58*/	  r9.zw = (r7.yyyw).zw;
/*59*/	  r7.xyzw = texelFetch(t_animation_map, floatBitsToInt(r9.zyww).st, floatBitsToInt(r9.zyww).a).xyzw;
/*60*/	  r0.y = dot(r7.xyzw, c[uint(floatBitsToInt(r0.y))].xyzw);
/*61*/	  r0.zw = saturate(r0.yyyx).zw;
/*62*/	  r0.w = -r0.z + r0.w;
/*63*/	  r7.x = vsIn_P1.z * r0.w + r0.z;
/*64*/	  r0.x = -r0.y + r0.x;
/*65*/	  r7.y = vsIn_P1.z * r0.x + r0.y;
/*66*/	} else {
/*67*/	  r7.xy = (vec4(1.000000, 1.000000, 0, 0)).xy;
/*68*/	}
/*69*/	r0.x = -vsIn_P1.z + 1.000000;
/*70*/	r8.xyz = (vsIn_P0.xyzx).xyz;
/*71*/	r8.w = 1.000000;
/*72*/	r9.x = dot(r8.xyzw, r4.xyzw);
/*73*/	r9.y = dot(r8.xyzw, r6.xyzw);
/*74*/	r9.z = dot(r8.xyzw, r5.xyzw);
/*75*/	r10.x = dot(r8.xyzw, r1.xyzw);
/*76*/	r10.y = dot(r8.xyzw, r3.xyzw);
/*77*/	r10.z = dot(r8.xyzw, r2.xyzw);
/*78*/	r0.yzw = (r0.xxxx * r10.xxyz).yzw;
/*79*/	r8.xyz = (vsIn_P1.zzzz * r9.xyzx + r0.yzwy).xyz;
/*80*/	r0.yzw = (vsIn_P4.xxyz * vec4(0.000000, 2.000000, 2.000000, 2.000000) + vec4(0.000000, -1.000000, -1.000000, -1.000000)).yzw;
/*81*/	r9.x = dot(vec3(r0.yzwy), vec3(r4.xyzx));
/*82*/	r9.y = dot(vec3(r0.yzwy), vec3(r6.xyzx));
/*83*/	r9.z = dot(vec3(r0.yzwy), vec3(r5.xyzx));
/*84*/	r10.x = dot(vec3(r0.yzwy), vec3(r1.xyzx));
/*85*/	r10.y = dot(vec3(r0.yzwy), vec3(r3.xyzx));
/*86*/	r10.z = dot(vec3(r0.yzwy), vec3(r2.xyzx));
/*87*/	r0.yzw = (r0.xxxx * r10.xxyz).yzw;
/*88*/	r0.yzw = (vsIn_P1.zzzz * r9.xxyz + r0.yyzw).yzw;
/*89*/	r9.xyz = (vsIn_P2.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*90*/	r10.x = dot(vec3(r9.xyzx), vec3(r4.xyzx));
/*91*/	r10.y = dot(vec3(r9.xyzx), vec3(r6.xyzx));
/*92*/	r10.z = dot(vec3(r9.xyzx), vec3(r5.xyzx));
/*93*/	r11.x = dot(vec3(r9.xyzx), vec3(r1.xyzx));
/*94*/	r11.y = dot(vec3(r9.xyzx), vec3(r3.xyzx));
/*95*/	r11.z = dot(vec3(r9.xyzx), vec3(r2.xyzx));
/*96*/	r9.xyz = (r0.xxxx * r11.xyzx).xyz;
/*97*/	r9.xyz = (vsIn_P1.zzzz * r10.xyzx + r9.xyzx).xyz;
/*98*/	r10.xyz = (vsIn_P5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*99*/	r4.x = dot(vec3(r10.xyzx), vec3(r4.xyzx));
/*100*/	r4.y = dot(vec3(r10.xyzx), vec3(r6.xyzx));
/*101*/	r4.z = dot(vec3(r10.xyzx), vec3(r5.xyzx));
/*102*/	r1.x = dot(vec3(r10.xyzx), vec3(r1.xyzx));
/*103*/	r1.y = dot(vec3(r10.xyzx), vec3(r3.xyzx));
/*104*/	r1.z = dot(vec3(r10.xyzx), vec3(r2.xyzx));
/*105*/	r1.xyz = (r0.xxxx * r1.xyzx).xyz;
/*106*/	r1.xyz = (vsIn_P1.zzzz * r4.xyzx + r1.xyzx).xyz;
/*107*/	r2.x = intBitsToFloat(gl_InstanceID + floatBitsToInt(cb1.data[4].w));
/*108*/	r2.yzw = (vec4(0, 0, 0, 0)).yzw;
/*109*/	r2.xyzw = uintBitsToFloat(texelFetch(t_pixel_selection_object_id_texture, floatBitsToInt(r2.xyzw).st, floatBitsToInt(r2.xyzw).a).xyzw);
/*110*/	r8.w = 1.000000;
/*111*/	r3.x = dot(r8.xyzw, vsIn_T0.xyzw);
/*112*/	r3.y = dot(r8.xyzw, vsIn_T1.xyzw);
/*113*/	r3.z = dot(r8.xyzw, vsIn_T2.xyzw);
/*114*/	r3.w = 1.000000;
/*115*/	gl_Position.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*116*/	gl_Position.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*117*/	gl_Position.z = dot(r3.xyzw, cb0.data[11].xyzw);
/*118*/	gl_Position.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*119*/	vsOut_T2.x = dot(vec3(r9.xyzx), vec3(vsIn_T0.xyzx));
/*120*/	vsOut_T2.y = dot(vec3(r9.xyzx), vec3(vsIn_T1.xyzx));
/*121*/	vsOut_T2.z = dot(vec3(r9.xyzx), vec3(vsIn_T2.xyzx));
/*122*/	vsOut_T5.x = dot(vec3(r0.yzwy), vec3(vsIn_T0.xyzx));
/*123*/	vsOut_T5.y = dot(vec3(r0.yzwy), vec3(vsIn_T1.xyzx));
/*124*/	vsOut_T5.z = dot(vec3(r0.yzwy), vec3(vsIn_T2.xyzx));
/*125*/	vsOut_T3.x = dot(vec3(r1.xyzx), vec3(vsIn_T0.xyzx));
/*126*/	vsOut_T3.y = dot(vec3(r1.xyzx), vec3(vsIn_T1.xyzx));
/*127*/	vsOut_T3.z = dot(vec3(r1.xyzx), vec3(vsIn_T2.xyzx));
/*128*/	vsOut_T0.xyzw = r3.xyzw;
/*129*/	vsOut_T1.xyzw = vsIn_P3.xyxy;
/*130*/	vsOut_T2.w = vsIn_P3.x;
/*131*/	vsOut_T3.w = vsIn_P3.y;
/*132*/	vsOut_T5.w = 1.000000;
/*133*/	vsOut_T6.xy = (vsIn_T3.zwzz).xy;
/*134*/	vsOut_T6.zw = (vsIn_T4.xxxy).zw;
/*135*/	vsOut_T7.xy = (vsIn_T4.zwzz).xy;
/*136*/	vsOut_T7.zw = (vsIn_T7.xxxy).zw;
/*137*/	vsOut_P1.xyzw = vsIn_T6.xyzw;
/*138*/	vsOut_T4.xy = (vsIn_P3.xyxx).xy;
/*139*/	vsOut_T4.z = vsIn_T3.y;
/*140*/	r7.z = vsIn_T5.y;
/*141*/	vsOut_T8.xyz = (r7.xyzx).xyz;
/*142*/	vsOut_T9.xy = (vsIn_T5.zwzz).xy;
/*143*/	vsOut_T9.z = r2.x;
/*144*/	return;
}
