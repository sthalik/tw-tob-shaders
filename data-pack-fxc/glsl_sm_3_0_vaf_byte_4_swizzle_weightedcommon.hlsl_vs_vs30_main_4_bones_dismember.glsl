// Flat Varyings: 6 7 9 10

//
// Shader Model 4
// Vertex Shader
//
// id: 2573 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_weightedcommon.hlsl_VS_vs30_main_4_bones_dismember.glsl
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
  vec4 r12;
  vec4 r13;
  vec4 r14;
  vec4 r15;
  vec4 r16;
  vec4 r17;
  vec4 r18;
  vec4 r19;
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
/*3*/	r1.x = cb2.data[0].z + 0.500000;
/*4*/	r1.x = floor(r1.x);
/*5*/	r1.x = intBitsToFloat(int(r1.x));
/*6*/	r1.y = vsIn_T3.x + 0.500000;
/*7*/	r1.y = floor(r1.y);
/*8*/	r2.xyzw = intBitsToFloat(floatBitsToInt(r0.xyzw) * ivec4(ivec4(3, 3, 3, 3))) /**/;
/*9*/	r2.xyzw = floatBitsToInt(r2.xyzw);
/*10*/	r2.xyzw = r1.yyyy + r2.xyzw;
/*11*/	r2.xyzw = intBitsToFloat(ivec4(r2.xyzw));
/*12*/	r3.xyzw = uintBitsToFloat(floatBitsToUint(r1.xxxx) ^ floatBitsToUint(r2.xyzw));
/*13*/	r4.xyzw = intBitsToFloat(max(floatBitsToInt(r2.xyzw), 1 + ~floatBitsToInt(r2.xyzw))) /**/;
/*14*/	r1.y = intBitsToFloat(max(floatBitsToInt(r1.x), 1 + ~floatBitsToInt(r1.x))) /**/;
/*15*/	r4.xyzw = uintBitsToFloat(floatBitsToUint(r4.xyzw) / floatBitsToUint(r1.yyyy));
/*16*/	r5.xyzw = intBitsToFloat(1 - ~floatBitsToInt(r4.xyzw));
/*17*/	r3.xyzw = uintBitsToFloat(floatBitsToUint(r3.xyzw) & uvec4(vec4(0x80000000u, 0x80000000u, 0x80000000u, 0x80000000u)));
/*18*/	r3.xyzw = mix(r4.xwyz, r5.xwyz, greaterThan(floatBitsToUint(r3.xwyz), uvec4(0)));
/*19*/	r2.xyzw = intBitsToFloat((1 + ~floatBitsToInt(r3.xzwy)) * (floatBitsToInt(r1.xxxx)) + floatBitsToInt(r2.xyzw));
/*20*/	r4.xyzw = intBitsToFloat(floatBitsToInt(r2.yxxy) + ivec4(ivec4(2, 1, 2, 1)));
/*21*/	r5.x = r2.x;
/*22*/	r5.y = r3.x;
/*23*/	r5.z = 0;
/*24*/	r6.xyzw = texelFetch(t_animation_map, floatBitsToInt(r5.xyzz).st, floatBitsToInt(r5.xyzz).a).xyzw;
/*25*/	r5.w = r4.y;
/*26*/	r7.xyzw = texelFetch(t_animation_map, floatBitsToInt(r5.wyzz).st, floatBitsToInt(r5.wyzz).a).xyzw;
/*27*/	r8.x = r4.z;
/*28*/	r8.yzw = (r5.yyzz).yzw;
/*29*/	r5.xyzw = texelFetch(t_animation_map, floatBitsToInt(r8.xyzw).st, floatBitsToInt(r8.xyzw).a).xyzw;
/*30*/	r8.x = r2.y;
/*31*/	r8.y = r3.z;
/*32*/	r8.z = 0;
/*33*/	r9.xyzw = texelFetch(t_animation_map, floatBitsToInt(r8.xyzz).st, floatBitsToInt(r8.xyzz).a).xyzw;
/*34*/	r8.w = r4.w;
/*35*/	r10.xyzw = texelFetch(t_animation_map, floatBitsToInt(r8.wyzz).st, floatBitsToInt(r8.wyzz).a).xyzw;
/*36*/	r4.yzw = (r8.yyzz).yzw;
/*37*/	r4.xyzw = texelFetch(t_animation_map, floatBitsToInt(r4.xyzw).st, floatBitsToInt(r4.xyzw).a).xyzw;
/*38*/	r8.xyzw = intBitsToFloat(floatBitsToInt(r2.wzzw) + ivec4(ivec4(2, 1, 2, 1)));
/*39*/	r11.x = r2.z;
/*40*/	r11.y = r3.w;
/*41*/	r11.z = 0;
/*42*/	r12.xyzw = texelFetch(t_animation_map, floatBitsToInt(r11.xyzz).st, floatBitsToInt(r11.xyzz).a).xyzw;
/*43*/	r11.w = r8.y;
/*44*/	r13.xyzw = texelFetch(t_animation_map, floatBitsToInt(r11.wyzz).st, floatBitsToInt(r11.wyzz).a).xyzw;
/*45*/	r14.x = r8.z;
/*46*/	r14.yzw = (r11.yyzz).yzw;
/*47*/	r11.xyzw = texelFetch(t_animation_map, floatBitsToInt(r14.xyzw).st, floatBitsToInt(r14.xyzw).a).xyzw;
/*48*/	r3.x = r2.w;
/*49*/	r3.z = 0;
/*50*/	r2.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.xyzz).st, floatBitsToInt(r3.xyzz).a).xyzw;
/*51*/	r3.w = r8.w;
/*52*/	r14.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.wyzz).st, floatBitsToInt(r3.wyzz).a).xyzw;
/*53*/	r8.yzw = (r3.yyzz).yzw;
/*54*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r8.xyzw).st, floatBitsToInt(r8.xyzw).a).xyzw;
/*55*/	r1.z = vsIn_P2.y + vsIn_P2.x;
/*56*/	r1.z = r1.z + vsIn_P2.z;
/*57*/	r8.w = -r1.z + 1.000000;
/*58*/	r1.z = uintBitsToFloat((0.100000 < vsIn_T5.x) ? 0xffffffffu : 0x00000000u);
/*59*/	if(floatBitsToUint(r1.z) != 0u) {
/*60*/	  r1.z = vsIn_T5.x * 3.000000 + vsIn_T3.x;
/*61*/	  r1.z = intBitsToFloat(int(r1.z));
/*62*/	  r15.xyzw = uintBitsToFloat(floatBitsToUint(r0.xyzw) ^ uvec4(ivec4(4, 4, 4, 4)));
/*63*/	  r16.xyzw = intBitsToFloat(max(floatBitsToInt(r0.xyzw), 1 + ~floatBitsToInt(r0.xyzw))) /**/;
/*64*/	  r17.xyzw = uintBitsToFloat(floatBitsToUint(r16.xyzw) >> uint(2));
/*65*/	  r18.xyzw = intBitsToFloat(1 - ~floatBitsToInt(r17.xyzw));
/*66*/	  r15.xyzw = uintBitsToFloat(floatBitsToUint(r15.xyzw) & uvec4(vec4(0x80000000u, 0x80000000u, 0x80000000u, 0x80000000u)));
/*67*/	  r15.xyzw = mix(r17.xyzw, r18.xyzw, greaterThan(floatBitsToUint(r15.xyzw), uvec4(0)));
/*68*/	  r15.xyzw = intBitsToFloat(floatBitsToInt(r1.zzzz) + floatBitsToInt(r15.xyzw));
/*69*/	  r17.xyzw = uintBitsToFloat(floatBitsToUint(r1.xxxx) ^ floatBitsToUint(r15.xyzw));
/*70*/	  r18.xyzw = intBitsToFloat(max(floatBitsToInt(r15.xyzw), 1 + ~floatBitsToInt(r15.xyzw))) /**/;
/*71*/	  r18.xyzw = uintBitsToFloat(floatBitsToUint(r18.xyzw) / floatBitsToUint(r1.yyyy));
/*72*/	  r19.xyzw = intBitsToFloat(1 - ~floatBitsToInt(r18.xyzw));
/*73*/	  r17.xyzw = uintBitsToFloat(floatBitsToUint(r17.xyzw) & uvec4(vec4(0x80000000u, 0x80000000u, 0x80000000u, 0x80000000u)));
/*74*/	  r17.xyzw = mix(r18.xwyz, r19.xwyz, greaterThan(floatBitsToUint(r17.xwyz), uvec4(0)));
/*75*/	  r1.xyzw = intBitsToFloat((1 + ~floatBitsToInt(r17.xzwy)) * (floatBitsToInt(r1.xxxx)) + floatBitsToInt(r15.xyzw));
/*76*/	  r15.x = r1.x;
/*77*/	  r15.y = r17.x;
/*78*/	  r15.zw = (vec4(0, 0, 0, 0)).zw;
/*79*/	  r15.xyzw = texelFetch(t_animation_map, floatBitsToInt(r15.xyzw).st, floatBitsToInt(r15.xyzw).a).xyzw;
/*80*/	  r0.xyzw = uintBitsToFloat(floatBitsToUint(r0.xyzw) & uvec4(vec4(0x80000000u, 0x80000000u, 0x80000000u, 0x80000000u)));
/*81*/	  r16.xyzw = uintBitsToFloat(floatBitsToUint(r16.xyzw) & uvec4(ivec4(3, 3, 3, 3)));
/*82*/	  r18.xyzw = intBitsToFloat(1 - ~floatBitsToInt(r16.xyzw));
/*83*/	  r0.xyzw = mix(r16.xyzw, r18.xyzw, greaterThan(floatBitsToUint(r0.xyzw), uvec4(0)));
/*84*/	  r15.x = dot(r15.xyzw, c[uint(floatBitsToInt(r0.x))].xyzw);
/*85*/	  r16.x = r1.y;
/*86*/	  r16.y = r17.z;
/*87*/	  r16.zw = (vec4(0, 0, 0, 0)).zw;
/*88*/	  r16.xyzw = texelFetch(t_animation_map, floatBitsToInt(r16.xyzw).st, floatBitsToInt(r16.xyzw).a).xyzw;
/*89*/	  r15.y = dot(r16.xyzw, c[uint(floatBitsToInt(r0.y))].xyzw);
/*90*/	  r16.x = r1.z;
/*91*/	  r16.y = r17.w;
/*92*/	  r16.zw = (vec4(0, 0, 0, 0)).zw;
/*93*/	  r16.xyzw = texelFetch(t_animation_map, floatBitsToInt(r16.xyzw).st, floatBitsToInt(r16.xyzw).a).xyzw;
/*94*/	  r15.z = dot(r16.xyzw, c[uint(floatBitsToInt(r0.z))].xyzw);
/*95*/	  r17.x = r1.w;
/*96*/	  r17.zw = (vec4(0, 0, 0, 0)).zw;
/*97*/	  r1.xyzw = texelFetch(t_animation_map, floatBitsToInt(r17.xyzw).st, floatBitsToInt(r17.xyzw).a).xyzw;
/*98*/	  r15.w = dot(r1.xyzw, c[uint(floatBitsToInt(r0.w))].xyzw);
/*99*/	  r0.xyzw = saturate(r15.xyzw);
/*100*/	  r8.xyz = (vsIn_P2.xyzx).xyz;
/*101*/	  r0.x = dot(r0.xyzw, r8.xyzw);
/*102*/	  r0.y = dot(r15.xyzw, r8.xyzw);
/*103*/	} else {
/*104*/	  r0.xy = (vec4(1.000000, 1.000000, 0, 0)).xy;
/*105*/	}
/*106*/	r1.xyz = (vsIn_P0.xyzx).xyz;
/*107*/	r1.w = 1.000000;
/*108*/	r8.x = dot(r1.xyzw, r6.xyzw);
/*109*/	r8.y = dot(r1.xyzw, r7.xyzw);
/*110*/	r8.z = dot(r1.xyzw, r5.xyzw);
/*111*/	r15.x = dot(r1.xyzw, r9.xyzw);
/*112*/	r15.y = dot(r1.xyzw, r10.xyzw);
/*113*/	r15.z = dot(r1.xyzw, r4.xyzw);
/*114*/	r15.xyz = (r15.xyzx * vsIn_P2.yyyy).xyz;
/*115*/	r8.xyz = (vsIn_P2.xxxx * r8.xyzx + r15.xyzx).xyz;
/*116*/	r15.x = dot(r1.xyzw, r12.xyzw);
/*117*/	r15.y = dot(r1.xyzw, r13.xyzw);
/*118*/	r15.z = dot(r1.xyzw, r11.xyzw);
/*119*/	r8.xyz = (vsIn_P2.zzzz * r15.xyzx + r8.xyzx).xyz;
/*120*/	r15.x = dot(r1.xyzw, r2.xyzw);
/*121*/	r15.y = dot(r1.xyzw, r14.xyzw);
/*122*/	r15.z = dot(r1.xyzw, r3.xyzw);
/*123*/	r1.xyz = (r8.wwww * r15.xyzx + r8.xyzx).xyz;
/*124*/	r8.xyz = (vsIn_P5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*125*/	r15.x = dot(vec3(r8.xyzx), vec3(r6.xyzx));
/*126*/	r15.y = dot(vec3(r8.xyzx), vec3(r7.xyzx));
/*127*/	r15.z = dot(vec3(r8.xyzx), vec3(r5.xyzx));
/*128*/	r16.x = dot(vec3(r8.xyzx), vec3(r9.xyzx));
/*129*/	r16.y = dot(vec3(r8.xyzx), vec3(r10.xyzx));
/*130*/	r16.z = dot(vec3(r8.xyzx), vec3(r4.xyzx));
/*131*/	r16.xyz = (r16.xyzx * vsIn_P2.yyyy).xyz;
/*132*/	r15.xyz = (vsIn_P2.xxxx * r15.xyzx + r16.xyzx).xyz;
/*133*/	r16.x = dot(vec3(r8.xyzx), vec3(r12.xyzx));
/*134*/	r16.y = dot(vec3(r8.xyzx), vec3(r13.xyzx));
/*135*/	r16.z = dot(vec3(r8.xyzx), vec3(r11.xyzx));
/*136*/	r15.xyz = (vsIn_P2.zzzz * r16.xyzx + r15.xyzx).xyz;
/*137*/	r16.x = dot(vec3(r8.xyzx), vec3(r2.xyzx));
/*138*/	r16.y = dot(vec3(r8.xyzx), vec3(r14.xyzx));
/*139*/	r16.z = dot(vec3(r8.xyzx), vec3(r3.xyzx));
/*140*/	r8.xyz = (r8.wwww * r16.xyzx + r15.xyzx).xyz;
/*141*/	r15.xyz = (vsIn_P3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*142*/	r16.x = dot(vec3(r15.xyzx), vec3(r6.xyzx));
/*143*/	r16.y = dot(vec3(r15.xyzx), vec3(r7.xyzx));
/*144*/	r16.z = dot(vec3(r15.xyzx), vec3(r5.xyzx));
/*145*/	r17.x = dot(vec3(r15.xyzx), vec3(r9.xyzx));
/*146*/	r17.y = dot(vec3(r15.xyzx), vec3(r10.xyzx));
/*147*/	r17.z = dot(vec3(r15.xyzx), vec3(r4.xyzx));
/*148*/	r17.xyz = (r17.xyzx * vsIn_P2.yyyy).xyz;
/*149*/	r16.xyz = (vsIn_P2.xxxx * r16.xyzx + r17.xyzx).xyz;
/*150*/	r17.x = dot(vec3(r15.xyzx), vec3(r12.xyzx));
/*151*/	r17.y = dot(vec3(r15.xyzx), vec3(r13.xyzx));
/*152*/	r17.z = dot(vec3(r15.xyzx), vec3(r11.xyzx));
/*153*/	r16.xyz = (vsIn_P2.zzzz * r17.xyzx + r16.xyzx).xyz;
/*154*/	r17.x = dot(vec3(r15.xyzx), vec3(r2.xyzx));
/*155*/	r17.y = dot(vec3(r15.xyzx), vec3(r14.xyzx));
/*156*/	r17.z = dot(vec3(r15.xyzx), vec3(r3.xyzx));
/*157*/	r15.xyz = (r8.wwww * r17.xyzx + r16.xyzx).xyz;
/*158*/	r16.xyz = (vsIn_P6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*159*/	r6.x = dot(vec3(r16.xyzx), vec3(r6.xyzx));
/*160*/	r6.y = dot(vec3(r16.xyzx), vec3(r7.xyzx));
/*161*/	r6.z = dot(vec3(r16.xyzx), vec3(r5.xyzx));
/*162*/	r5.x = dot(vec3(r16.xyzx), vec3(r9.xyzx));
/*163*/	r5.y = dot(vec3(r16.xyzx), vec3(r10.xyzx));
/*164*/	r5.z = dot(vec3(r16.xyzx), vec3(r4.xyzx));
/*165*/	r4.xyz = (r5.xyzx * vsIn_P2.yyyy).xyz;
/*166*/	r4.xyz = (vsIn_P2.xxxx * r6.xyzx + r4.xyzx).xyz;
/*167*/	r5.x = dot(vec3(r16.xyzx), vec3(r12.xyzx));
/*168*/	r5.y = dot(vec3(r16.xyzx), vec3(r13.xyzx));
/*169*/	r5.z = dot(vec3(r16.xyzx), vec3(r11.xyzx));
/*170*/	r4.xyz = (vsIn_P2.zzzz * r5.xyzx + r4.xyzx).xyz;
/*171*/	r2.x = dot(vec3(r16.xyzx), vec3(r2.xyzx));
/*172*/	r2.y = dot(vec3(r16.xyzx), vec3(r14.xyzx));
/*173*/	r2.z = dot(vec3(r16.xyzx), vec3(r3.xyzx));
/*174*/	r2.xyz = (r8.wwww * r2.xyzx + r4.xyzx).xyz;
/*175*/	r3.x = intBitsToFloat(gl_InstanceID + floatBitsToInt(cb1.data[4].w));
/*176*/	r3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*177*/	r3.xyzw = uintBitsToFloat(texelFetch(t_pixel_selection_object_id_texture, floatBitsToInt(r3.xyzw).st, floatBitsToInt(r3.xyzw).a).xyzw);
/*178*/	r1.w = 1.000000;
/*179*/	r4.x = dot(r1.xyzw, vsIn_T0.xyzw);
/*180*/	r4.y = dot(r1.xyzw, vsIn_T1.xyzw);
/*181*/	r4.z = dot(r1.xyzw, vsIn_T2.xyzw);
/*182*/	r4.w = 1.000000;
/*183*/	gl_Position.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*184*/	gl_Position.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*185*/	gl_Position.z = dot(r4.xyzw, cb0.data[11].xyzw);
/*186*/	gl_Position.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*187*/	vsOut_T2.x = dot(vec3(r15.xyzx), vec3(vsIn_T0.xyzx));
/*188*/	vsOut_T2.y = dot(vec3(r15.xyzx), vec3(vsIn_T1.xyzx));
/*189*/	vsOut_T2.z = dot(vec3(r15.xyzx), vec3(vsIn_T2.xyzx));
/*190*/	vsOut_T5.x = dot(vec3(r8.xyzx), vec3(vsIn_T0.xyzx));
/*191*/	vsOut_T5.y = dot(vec3(r8.xyzx), vec3(vsIn_T1.xyzx));
/*192*/	vsOut_T5.z = dot(vec3(r8.xyzx), vec3(vsIn_T2.xyzx));
/*193*/	vsOut_T3.x = dot(vec3(r2.xyzx), vec3(vsIn_T0.xyzx));
/*194*/	vsOut_T3.y = dot(vec3(r2.xyzx), vec3(vsIn_T1.xyzx));
/*195*/	vsOut_T3.z = dot(vec3(r2.xyzx), vec3(vsIn_T2.xyzx));
/*196*/	vsOut_T0.xyzw = r4.xyzw;
/*197*/	vsOut_T1.xyzw = vsIn_P4.xyxy;
/*198*/	vsOut_T2.w = vsIn_P4.x;
/*199*/	vsOut_T3.w = vsIn_P4.y;
/*200*/	vsOut_T5.w = 1.000000;
/*201*/	vsOut_T6.xy = (vsIn_T3.zwzz).xy;
/*202*/	vsOut_T6.zw = (vsIn_T4.xxxy).zw;
/*203*/	vsOut_T7.xy = (vsIn_T4.zwzz).xy;
/*204*/	vsOut_T7.zw = (vsIn_T7.xxxy).zw;
/*205*/	vsOut_P1.xyzw = vsIn_T6.xyzw;
/*206*/	vsOut_T4.xy = (vsIn_P4.xyxx).xy;
/*207*/	vsOut_T4.z = vsIn_T3.y;
/*208*/	r0.z = vsIn_T5.y;
/*209*/	vsOut_T8.xyz = (r0.xyzx).xyz;
/*210*/	vsOut_T9.xy = (vsIn_T5.zwzz).xy;
/*211*/	vsOut_T9.z = r3.x;
/*212*/	return;
}
