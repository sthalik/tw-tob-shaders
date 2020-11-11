//
//
// Shader Model 4
// Fragment Shader
//
// id: 1483 - fxc/glsl_SM_4_0_rigidterrain.hlsl_PS_ps30_blend.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

flat in vec4 vsOut_T1;
flat in vec4 vsOut_T2;
flat in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;

uniform sampler2D s_depth_map;
uniform sampler2D s_alpha_map;
uniform sampler2D s_blend_map;
uniform sampler2D s_index_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_lf_normal_map;
uniform sampler2D s_light_params;
uniform sampler2DArray s_diffuse_array;
uniform sampler2DArray s_normal_array;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform vs_height_map_cb
{
  vec4 data[6];
} cb1;
layout(std140) uniform ps_height_map_cb
{
  vec4 data[9];
} cb2;
layout(std140) uniform ps_texture_array_cb
{
  vec4 data[405];
} cb3;
layout(std140) uniform ps_mapping_array
{
  vec4 data[2048];
} cb4;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  const vec4 c[4] = vec4[4](
    vec4(1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 1.00000000000000, -1.00000000000000, 0.00000000000000),
    vec4(-1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, -1.00000000000000, 1.00000000000000, 0.00000000000000)
  );
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

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw).zw;
/*2*/	r0.xy = (r0.xyxx * cb0.data[29].zwzz).xy;
/*3*/	r1.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.xyzw = (textureLod(s_depth_map, r0.zwzz.st, 0.000000)).xyzw;
/*5*/	r1.z = r0.x;
/*6*/	r1.w = 1.000000;
/*7*/	r0.x = dot(r1.xyzw, cb0.data[21].xyzw);
/*8*/	r0.y = dot(r1.xyzw, cb0.data[22].xyzw);
/*9*/	r0.z = dot(r1.xyzw, cb0.data[23].xyzw);
/*10*/	r0.w = dot(r1.xyzw, cb0.data[24].xyzw);
/*11*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*12*/	r1.xyzw = max(vsOut_T1.zzww, vsOut_T1.xxyy);
/*13*/	r2.xy = (uintBitsToFloat(uvec4(lessThan(r1.ywyy, r0.xzxx)) * 0xffffffffu)).xy;
/*14*/	r3.xyzw = min(vsOut_T1.zzww, vsOut_T1.xxyy);
/*15*/	r2.zw = (uintBitsToFloat(uvec4(lessThan(r0.xxxz, r3.yyyw)) * 0xffffffffu)).zw;
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.x) | floatBitsToUint(r2.z));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) | floatBitsToUint(r0.w));
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) | floatBitsToUint(r0.w));
/*19*/	if(r0.w != 0) discard;
/*20*/	r1.xyzw = r1.xyzw + -r3.xyzw;
/*21*/	r2.xyzw = r0.xxzz + -r3.yyww;
/*22*/	r1.xyzw = r2.xyzw / r1.xyzw;
/*23*/	r1.xyzw = r1.xyzw + vec4(-0.500000, -0.500000, -0.500000, -0.500000);
/*24*/	r0.w = vsOut_T2.x + 0.100000;
/*25*/	r0.w = floor(r0.w);
/*26*/	r0.w = intBitsToFloat(int(r0.w));
/*27*/	r1.xyzw = r1.xyzw * c[uint(floatBitsToInt(r0.w))].xyzx;
/*28*/	r1.xy = (r1.zwzz + r1.xyxx).xy;
/*29*/	r1.xy = (r1.xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*30*/	r2.xyzw = (texture(s_alpha_map, r1.xyxx.st)).xyzw;
/*31*/	r1.z = r2.x * 1.100000 + -0.100000;
/*32*/	r1.w = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*33*/	if(r1.w != 0) discard;
/*34*/	r2.xyzw = (texture(s_blend_map, r1.xyxx.st)).xyzw;
/*35*/	r1.w = dot(r2.xyzw, r2.xyzw);
/*36*/	r1.w = inversesqrt(r1.w);
/*37*/	r2.xyzw = r1.wwww * r2.xyzw;
/*38*/	r3.xyzw = r2.xyzw * r1.zzzz + vec4(-0.000010, -0.000010, -0.000010, -0.000010);
/*39*/	r2.xyzw = r1.zzzz * r2.xyzw;
/*40*/	r3.xyzw = saturate(r3.xyzw * vec4(340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000));
/*41*/	r1.w = cb3.data[401].y * cb3.data[402].x;
/*42*/	r1.w = r1.w * cb3.data[401].x + vsOut_T2.y;
/*43*/	r1.w = cb3.data[402].y * cb3.data[401].x + r1.w;
/*44*/	r4.xyzw = cb3.data[401].zzzz * r1.wwww + vsOut_T3.xyzw;
/*45*/	r4.xyzw = uintBitsToFloat(uvec4(r4.xyzw));
/*46*/	r1.w = uintBitsToFloat(uint(cb4.data[floatBitsToUint(r4.x)].x));
/*47*/	r5.xy = (r0.xzxx / cb3.data[floatBitsToUint(r1.w)+1u].xxxx).xy;
/*48*/	r6.x = cb3.data[floatBitsToUint(r1.w)+1u].z/**/;
/*49*/	r5.xy = (r3.xxxx * r5.xyxx).xy;
/*50*/	r7.xyzw = (texture(s_index_map, r1.xyxx.st)).xyzw;
/*51*/	r8.xyzw = (texture(s_normal_map, r1.xyxx.st)).xyzw;
/*52*/	r8.xyzw = r8.wwyy + vec4(0.001961, 0.001961, 0.001961, 0.001961);
/*53*/	r8.xyzw = r8.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(-1.000000, -1.000000, -1.000000, -1.000000);
/*54*/	r7.xyzw = r1.zzzz * r7.xyzw;
/*55*/	r7.xyzw = saturate(r7.xyzw / r1.zzzz);
/*56*/	r7.xyzw = r7.xyzw + vec4(-0.001000, -0.001000, -0.001000, -0.001000);
/*57*/	r7.xyzw = max(r7.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000));
/*58*/	r9.xyzw = r7.xyzw * vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*59*/	r1.x = cb4.data[floatBitsToUint(r4.x)].x * 4.000000 + r9.x;
/*60*/	r5.z = trunc(r1.x);
/*61*/	r5.w = r5.z + 1.000000;
/*62*/	r10.xyzw = (texture(s_diffuse_array, r5.xyzx.stp, -0.660000)).xyzw;
/*63*/	r11.xyzw = (texture(s_diffuse_array, r5.xywx.stp, -0.660000)).xyzw;
/*64*/	r1.xyw = (-r10.xyxz + r11.xyxz).xyw;
/*65*/	r11.xyzw = fract(r9.xyzw);
/*66*/	r1.xyw = (r11.xxxx * r1.xyxw + r10.xyxz).xyw;
/*67*/	r3.x = uintBitsToFloat(uint(cb4.data[floatBitsToUint(r4.y)].x));
/*68*/	r10.xy = (r0.xzxx / cb3.data[floatBitsToUint(r3.x)+1u].xxxx).xy;
/*69*/	r6.y = cb3.data[floatBitsToUint(r3.x)+1u].z/**/;
/*70*/	r10.xy = (r3.yyyy * r10.xyxx).xy;
/*71*/	r3.x = cb4.data[floatBitsToUint(r4.y)].x * 4.000000 + r9.y;
/*72*/	r10.z = trunc(r3.x);
/*73*/	r10.w = r10.z + 1.000000;
/*74*/	r12.xyzw = (texture(s_diffuse_array, r10.xyzx.stp, -0.660000)).xyzw;
/*75*/	r13.xyzw = (texture(s_diffuse_array, r10.xywx.stp, -0.660000)).xyzw;
/*76*/	r13.xyz = (-r12.xyzx + r13.xyzx).xyz;
/*77*/	r12.xyz = (r11.yyyy * r13.xyzx + r12.xyzx).xyz;
/*78*/	r12.xyz = (r2.yyyy * r12.xyzx).xyz;
/*79*/	r1.xyw = (r1.xyxw * r2.xxxx + r12.xyxz).xyw;
/*80*/	r3.x = uintBitsToFloat(uint(cb4.data[floatBitsToUint(r4.z)].x));
/*81*/	r9.xy = (r0.xzxx / cb3.data[floatBitsToUint(r3.x)+1u].xxxx).xy;
/*82*/	r6.z = cb3.data[floatBitsToUint(r3.x)+1u].z/**/;
/*83*/	r12.xy = (r3.zzzz * r9.xyxx).xy;
/*84*/	r3.x = cb4.data[floatBitsToUint(r4.z)].x * 4.000000 + r9.z;
/*85*/	r3.y = cb4.data[floatBitsToUint(r4.w)].x * 4.000000 + r9.w;
/*86*/	r9.z = trunc(r3.y);
/*87*/	r12.z = trunc(r3.x);
/*88*/	r12.w = r12.z + 1.000000;
/*89*/	r13.xyzw = (texture(s_diffuse_array, r12.xyzx.stp, -0.660000)).xyzw;
/*90*/	r14.xyzw = (texture(s_diffuse_array, r12.xywx.stp, -0.660000)).xyzw;
/*91*/	r3.xyz = (-r13.xyzx + r14.xyzx).xyz;
/*92*/	r3.xyz = (r11.zzzz * r3.xyzx + r13.xyzx).xyz;
/*93*/	r1.xyw = (r3.xyxz * r2.zzzz + r1.xyxw).xyw;
/*94*/	r3.x = uintBitsToFloat(uint(cb4.data[floatBitsToUint(r4.w)].x));
/*95*/	r3.yz = (r0.xxzx / cb3.data[floatBitsToUint(r3.x)+1u].xxxx).yz;
/*96*/	r6.w = cb3.data[floatBitsToUint(r3.x)+1u].z/**/;
/*97*/	color2.w = dot(r6.xyzw, r2.xyzw);
/*98*/	r9.xy = (r3.wwww * r3.yzyy).xy;
/*99*/	r9.w = r9.z + 1.000000;
/*100*/	r3.xyzw = (texture(s_diffuse_array, r9.xyzx.stp, -0.660000)).xyzw;
/*101*/	r6.xyzw = (texture(s_diffuse_array, r9.xywx.stp, -0.660000)).xyzw;
/*102*/	r6.xyz = (-r3.xyzx + r6.xyzx).xyz;
/*103*/	r3.xyz = (r11.wwww * r6.xyzx + r3.xyzx).xyz;
/*104*/	color0.xyz = (r3.xyzx * r2.wwww + r1.xywx).xyz;
/*105*/	color0.w = r1.z;
/*106*/	r3.x = 4.000000 * cb4.data[floatBitsToUint(r4.x)].x;
/*107*/	r3.y = 4.000000 * cb4.data[floatBitsToUint(r4.y)].x;
/*108*/	r3.z = 4.000000 * cb4.data[floatBitsToUint(r4.z)].x;
/*109*/	r3.w = 4.000000 * cb4.data[floatBitsToUint(r4.w)].x;
/*110*/	r3.xyzw = r7.xyzw * vec4(3.000000, 3.000000, 3.000000, 3.000000) + r3.xyzw;
/*111*/	r1.xy = (r7.xyxx + vec4(-0.001000, -0.001000, 0.000000, 0.000000)).xy;
/*112*/	r1.xy = (max(r1.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).xy;
/*113*/	r1.xy = (r1.xyxx * vec4(3.000000, 3.000000, 0.000000, 0.000000)).xy;
/*114*/	r3.xyzw = trunc(r3.xyzw);
/*115*/	r5.z = r3.x;
/*116*/	r6.xyzw = (texture(s_normal_array, r5.xyzx.stp)).xyzw;
/*117*/	r4.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*118*/	r6.xz = (r4.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*119*/	r1.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*120*/	r1.w = -r1.w + 1.000000;
/*121*/	r1.w = max(r1.w, 0.000000);
/*122*/	r6.y = sqrt(r1.w);
/*123*/	r7.xyzw = r3.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*124*/	r5.w = r7.x;
/*125*/	r5.xyzw = (texture(s_normal_array, r5.xywx.stp)).xyzw;
/*126*/	r4.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*127*/	r5.xz = (r4.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*128*/	r1.w = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*129*/	r1.w = -r1.w + 1.000000;
/*130*/	r1.w = max(r1.w, 0.000000);
/*131*/	r5.y = sqrt(r1.w);
/*132*/	r5.xyz = (-r6.xyzx + r5.xyzx).xyz;
/*133*/	r5.xyz = (r11.xxxx * r5.xyzx + r6.xyzx).xyz;
/*134*/	r10.z = r3.y;
/*135*/	r6.xyzw = (texture(s_normal_array, r10.xyzx.stp)).xyzw;
/*136*/	r3.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*137*/	r6.xz = (r3.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*138*/	r1.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*139*/	r1.w = -r1.w + 1.000000;
/*140*/	r1.w = max(r1.w, 0.000000);
/*141*/	r6.y = sqrt(r1.w);
/*142*/	r10.w = r7.y;
/*143*/	r10.xyzw = (texture(s_normal_array, r10.xywx.stp)).xyzw;
/*144*/	r3.xy = (r10.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*145*/	r10.xz = (r3.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*146*/	r1.w = dot(vec2(r10.xzxx), vec2(r10.xzxx));
/*147*/	r1.w = -r1.w + 1.000000;
/*148*/	r1.w = max(r1.w, 0.000000);
/*149*/	r10.y = sqrt(r1.w);
/*150*/	r10.xyz = (-r6.xyzx + r10.xyzx).xyz;
/*151*/	r6.xyz = (r11.yyyy * r10.xyzx + r6.xyzx).xyz;
/*152*/	r6.xyz = (r2.yyyy * r6.xyzx).xyz;
/*153*/	r5.xyz = (r5.xyzx * r2.xxxx + r6.xyzx).xyz;
/*154*/	r12.z = r3.z;
/*155*/	r9.z = r3.w;
/*156*/	r3.xyzw = (texture(s_normal_array, r9.xyzx.stp)).xyzw;
/*157*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*158*/	r3.xz = (r3.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*159*/	r6.xyzw = (texture(s_normal_array, r12.xyzx.stp)).xyzw;
/*160*/	r4.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*161*/	r6.xz = (r4.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*162*/	r12.w = r7.z;
/*163*/	r9.w = r7.w;
/*164*/	r7.xyzw = (texture(s_normal_array, r9.xywx.stp)).xyzw;
/*165*/	r4.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*166*/	r7.xz = (r4.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*167*/	r9.xyzw = (texture(s_normal_array, r12.xywx.stp)).xyzw;
/*168*/	r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*169*/	r9.xz = (r4.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*170*/	r1.w = dot(vec2(r9.xzxx), vec2(r9.xzxx));
/*171*/	r1.w = -r1.w + 1.000000;
/*172*/	r1.w = max(r1.w, 0.000000);
/*173*/	r9.y = sqrt(r1.w);
/*174*/	r1.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*175*/	r1.w = -r1.w + 1.000000;
/*176*/	r1.w = max(r1.w, 0.000000);
/*177*/	r6.y = sqrt(r1.w);
/*178*/	r9.xyz = (-r6.xyzx + r9.xyzx).xyz;
/*179*/	r6.xyz = (r11.zzzz * r9.xyzx + r6.xyzx).xyz;
/*180*/	r5.xyz = (r6.xyzx * r2.zzzz + r5.xyzx).xyz;
/*181*/	r1.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*182*/	r1.w = -r1.w + 1.000000;
/*183*/	r1.w = max(r1.w, 0.000000);
/*184*/	r7.y = sqrt(r1.w);
/*185*/	r1.w = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*186*/	r1.w = -r1.w + 1.000000;
/*187*/	r1.w = max(r1.w, 0.000000);
/*188*/	r3.y = sqrt(r1.w);
/*189*/	r6.xyz = (-r3.xyzx + r7.xyzx).xyz;
/*190*/	r3.xyz = (r11.wwww * r6.xyzx + r3.xyzx).xyz;
/*191*/	r3.xyz = (r3.xyzx * r2.wwww + r5.xyzx).xyz;
/*192*/	r5.xyz = (r3.xyzx * vec4(1.000000, 1.000000, -1.000000, 0.000000)).xyz;
/*193*/	r3.xyz = (-r3.xyzx * vec4(1.000000, 1.000000, -1.000000, 0.000000) + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*194*/	r6.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*195*/	r0.xy = (r0.xzxx / cb1.data[3].xyxx).xy;
/*196*/	r0.xy = (r0.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*197*/	r7.xyzw = (texture(s_lf_normal_map, r0.xyxx.st)).xyzw;
/*198*/	r0.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*199*/	r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*200*/	r0.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*201*/	r0.z = sqrt(r0.z);
/*202*/	r0.z = saturate(r0.z / cb2.data[5].x);
/*203*/	r3.xyz = (r0.zzzz * r3.xyzx + r5.xyzx).xyz;
/*204*/	r5.xz = (cb2.data[4].zzzz).xz/**/;
/*205*/	r5.y = 1.000000;
/*206*/	r3.xyz = (r3.xyzx * r5.xyzx).xyz;
/*207*/	r0.z = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*208*/	r0.z = inversesqrt(r0.z);
/*209*/	r5.xyzw = r8.xyzw * c[uint(floatBitsToInt(r0.w))].xzyx;
/*210*/	r0.w = dot(vec2(r8.ywyy), vec2(r8.ywyy));
/*211*/	r0.w = -r0.w + 1.000000;
/*212*/	r0.w = max(r0.w, 0.000000);
/*213*/	r6.y = sqrt(r0.w);
/*214*/	r6.xz = (r5.zzwz + r5.xxyx).xz;
/*215*/	r5.xz = (cb2.data[4].yyyy).xz/**/;
/*216*/	r5.y = 1.000000;
/*217*/	r5.xyz = (r5.xyzx * r6.xyzx).xyz;
/*218*/	r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*219*/	r0.w = inversesqrt(r0.w);
/*220*/	r1.w = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*221*/	r1.w = -r1.w + 1.000000;
/*222*/	r1.w = max(r1.w, 0.000000);
/*223*/	r6.y = sqrt(r1.w);
/*224*/	r7.yz = (vec4(0, 1.000000, -1.000000, 0)).yz;
/*225*/	r7.x = cb2.data[4].x/**/;
/*226*/	r6.xz = (r0.xxyx * r7.yyxy).xz;
/*227*/	r6.xyz = (r6.xyzx * r7.xyzx).xyz;
/*228*/	r0.x = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*229*/	r0.x = inversesqrt(r0.x);
/*230*/	r6.xyz = (r0.xxxx * r6.xyzx).xyz;
/*231*/	r6.xz = (r5.xxzx * r0.wwww + r6.xxzx).xz;
/*232*/	r0.x = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*233*/	r0.x = inversesqrt(r0.x);
/*234*/	r0.xyw = (r0.xxxx * r6.xyxz).xyw;
/*235*/	r0.xyw = (r1.zzzz * r0.xyxw).xyw;
/*236*/	color1.xz = (r3.xxzx * r0.zzzz + r0.xxwx).xz;
/*237*/	color1.y = r0.y;
/*238*/	color1.w = r1.z;
/*239*/	r0.xyzw = vsOut_T3.xyzw + -cb3.data[403].xxxx;
/*240*/	r0.xyzw = min(abs(r0.xyzw), vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*241*/	r0.xyzw = -r0.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*242*/	r0.xyzw = r2.xyzw * r0.xyzw;
/*243*/	r0.x = dot(r0.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*244*/	r3.xyzw = vsOut_T3.xyzw + -cb3.data[403].yyyy;
/*245*/	r3.xyzw = min(abs(r3.xyzw), vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*246*/	r3.xyzw = -r3.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*247*/	r3.xyzw = r2.xyzw * r3.xyzw;
/*248*/	r0.y = dot(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*249*/	r0.xy = (-r0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*250*/	r0.x = r0.y * r0.x;
/*251*/	r3.xyzw = vsOut_T3.xyzw + -cb3.data[403].zzzz;
/*252*/	r3.xyzw = min(abs(r3.xyzw), vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*253*/	r3.xyzw = -r3.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*254*/	r3.xyzw = r2.xyzw * r3.xyzw;
/*255*/	r0.y = dot(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*256*/	r0.y = -r0.y + 1.000000;
/*257*/	r0.x = r0.y * r0.x;
/*258*/	r3.xyzw = vsOut_T3.xyzw + -cb3.data[403].wwww;
/*259*/	r3.xyzw = min(abs(r3.xyzw), vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*260*/	r3.xyzw = -r3.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*261*/	r3.xyzw = r2.xyzw * r3.xyzw;
/*262*/	r0.y = dot(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*263*/	r0.y = -r0.y + 1.000000;
/*264*/	r0.x = r0.y * r0.x;
/*265*/	color2.z = r1.z * r0.x;
/*266*/	r0.x = cb4.data[floatBitsToUint(r4.x)].x * 4.000000 + r1.x;
/*267*/	r0.y = cb4.data[floatBitsToUint(r4.y)].x * 4.000000 + r1.y;
/*268*/	r0.zw = (fract(r1.xxxy)).zw;
/*269*/	r0.xy = trunc((r0.xyxx).xy);
/*270*/	r1.xy = (r0.yyyy + vec4(0.500000, 1.500000, 0.000000, 0.000000)).xy;
/*271*/	r1.xy = (r1.xyxx / cb3.data[0].xxxx).xy;
/*272*/	r0.xy = (r0.xxxx + vec4(0.500000, 1.500000, 0.000000, 0.000000)).xy;
/*273*/	r3.xy = (r0.xyxx / cb3.data[0].xxxx).xy;
/*274*/	r3.z = 0.500000;
/*275*/	r4.xyzw = (texture(s_light_params, r3.yzyy.st)).xyzw;
/*276*/	r3.xyzw = (texture(s_light_params, r3.xzxx.st)).xyzw;
/*277*/	r0.xy = (-r3.xyxx + r4.xyxx).xy;
/*278*/	r3.xy = (r0.zzzz * r0.xyxx + r3.xyxx).xy;
/*279*/	r1.z = 0.500000;
/*280*/	r4.xyzw = (texture(s_light_params, r1.yzyy.st)).xyzw;
/*281*/	r1.xyzw = (texture(s_light_params, r1.xzxx.st)).xyzw;
/*282*/	r0.xy = (-r1.xyxx + r4.xyxx).xy;
/*283*/	r3.zw = (r0.wwww * r0.xxxy + r1.xxxy).zw;
/*284*/	color2.x = dot(vec2(r3.xzxx), vec2(r2.xyxx));
/*285*/	color2.y = dot(vec2(r3.ywyy), vec2(r2.xyxx));
/*286*/	return;
}
