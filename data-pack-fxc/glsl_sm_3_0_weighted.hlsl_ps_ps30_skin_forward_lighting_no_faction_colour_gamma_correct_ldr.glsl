//
//
// Shader Model 4
// Fragment Shader
//
// id: 1868 - fxc/glsl_SM_3_0_weighted.hlsl_PS_ps30_skin_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_skin_mask_map;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;

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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*5*/	r1.w = 1.000000;
/*6*/	r2.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*7*/	r2.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*8*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*9*/	r1.xy = (r2.xyxx / r0.wwww).xy;
/*10*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*11*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*12*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*13*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*15*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*16*/	if(r0.w != 0) discard;
/*17*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*18*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*19*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*20*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*21*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*22*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*23*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*26*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*27*/	r0.w = inversesqrt(r0.w);
/*28*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*29*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*30*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*33*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*34*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*35*/	r0.w = -r0.w + 1.000000;
/*36*/	r0.w = max(r0.w, 0.000000);
/*37*/	r0.w = sqrt(r0.w);
/*38*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*39*/	r1.w = inversesqrt(r1.w);
/*40*/	r2.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*41*/	r1.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*42*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*43*/	r0.w = inversesqrt(r0.w);
/*44*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*45*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*46*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*47*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*48*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*49*/	r1.w = r0.w * r3.x + 0.300000;
/*50*/	r1.w = saturate(-r1.w + 1.000000);
/*51*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*52*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*53*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*54*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*55*/	r1.w = -r0.w * r3.x + 1.000000;
/*56*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*57*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*58*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*59*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*60*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*62*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*63*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*64*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*65*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*66*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*67*/	r0.w = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*68*/	r1.w = saturate(r0.w);
/*69*/	r0.w = r0.w + r0.w;
/*70*/	r6.xyz = (r2.xyzx * -r0.wwww + cb2.data[0].yzwy).xyz;
/*71*/	r0.w = r1.w * r1.w;
/*72*/	r7.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*73*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*74*/	r2.w = inversesqrt(r1.w);
/*75*/	r1.w = sqrt(r1.w);
/*76*/	r8.xyz = (r2.wwww * r7.xyzx).xyz;
/*77*/	r2.w = saturate(dot(vec3(r8.xyzx), vec3(-cb2.data[0].yzwy)));
/*78*/	r2.w = r2.w * r2.w;
/*79*/	r2.w = r2.w * r2.w;
/*80*/	r0.w = r0.w * r2.w;
/*81*/	r0.w = r4.z * r0.w;
/*82*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*83*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*84*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*85*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*86*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*87*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*88*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*89*/	r0.w = dot(vec3(r6.xyzx), vec3(-r8.xyzx));
/*90*/	r0.w = max(r0.w, 0.000000);
/*91*/	r0.w = log2(r0.w);
/*92*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*93*/	r2.w = r6.x * r6.x;
/*94*/	r3.w = vsOut_T7.x * -r6.y + r6.y;
/*95*/	r3.w = vsOut_T7.y * -r3.w + r3.w;
/*96*/	r2.w = r2.w * 127.000000 + 1.600000;
/*97*/	r0.w = r0.w * r2.w;
/*98*/	r0.w = exp2(r0.w);
/*99*/	r0.w = min(r0.w, 1.000000);
/*100*/	r0.w = r0.w * r3.w;
/*101*/	r4.yzw = (r0.wwww * cb2.data[1].xxyz).yzw;
/*102*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*103*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*104*/	r0.w = dot(vec3(-r8.xyzx), vec3(r2.xyzx));
/*105*/	r2.w = r0.w + r0.w;
/*106*/	r0.w = saturate(-r0.w + 1.000000);
/*107*/	r0.w = r0.w * r0.w;
/*108*/	r0.w = r4.x * r0.w;
/*109*/	r0.w = r0.w * 1.500000;
/*110*/	r0.w = r5.w * r0.w;
/*111*/	r4.xyz = (r2.xyzx * -r2.wwww + -r8.xyzx).xyz;
/*112*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*113*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*114*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*115*/	r2.w = inversesqrt(r2.w);
/*116*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*117*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*118*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*119*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*120*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*121*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*122*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*123*/	r4.xyw = (r4.xxxx * r8.xyxz + r6.xyxz).xyw;
/*124*/	r4.xyz = (r4.zzzz * r9.xyzx + r4.xywx).xyz;
/*125*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*126*/	r1.x = inversesqrt(r1.x);
/*127*/	r1.x = r1.x * r1.y;
/*128*/	r1.x = max(r1.x, 0.000000);
/*129*/	r0.w = r0.w * r1.x;
/*130*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*131*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*132*/	r0.w = inversesqrt(r0.w);
/*133*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*134*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*135*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*136*/	r6.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*137*/	r4.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*138*/	r8.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*139*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*140*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*141*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*142*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*143*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*144*/	r0.w = r5.z * r5.x;
/*145*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*146*/	r0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*147*/	r7.w = max(r7.y, 0.000000);
/*148*/	r2.xyzw = (texture(s_sky, r7.xwzx.stp)).xyzw;
/*149*/	r0.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*150*/	r0.w = sqrt(r0.w);
/*151*/	r1.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*152*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*153*/	r1.xyz = (r1.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*154*/	r2.xyz = (-r1.xyzx * r5.xxxx + r2.xyzx).xyz;
/*155*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*156*/	r2.w = saturate(cb3.data[1].x)/**/;
/*157*/	r2.w = -r2.w + 1.000000;
/*158*/	r2.w = r2.w * 1000.000000;
/*159*/	r1.w = r1.w / r2.w;
/*160*/	r2.w = saturate(cb3.data[0].w)/**/;
/*161*/	r2.w = -r2.w + 1.000000;
/*162*/	r2.w = r2.w * 8.000000 + -4.000000;
/*163*/	r1.w = r1.w + r2.w;
/*164*/	r1.w = r1.w * 1.442695;
/*165*/	r1.w = exp2(r1.w);
/*166*/	r1.w = cb3.data[1].y / r1.w;
/*167*/	r1.w = saturate(-r1.w + cb3.data[1].y);
/*168*/	r2.w = -vsOut_T0.y + cb3.data[1].w;
/*169*/	r2.w = r2.w + -cb3.data[1].z;
/*170*/	r3.x = -cb3.data[1].z + cb3.data[1].w;
/*171*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*172*/	r2.w = saturate(r2.w * r3.x);
/*173*/	r3.x = r2.w * -2.000000 + 3.000000;
/*174*/	r2.w = r2.w * r2.w;
/*175*/	r2.w = r2.w * r3.x;
/*176*/	r1.w = cb3.data[2].x * r2.w + r1.w;
/*177*/	r2.w = saturate(dot(vec2(r1.wwww), vec2(cb3.data[2].yyyy)));
/*178*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*179*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*180*/	r2.x = max(cb3.data[2].z, 0.001000);
/*181*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*182*/	r0.w = r0.w * r2.x;
/*183*/	r0.w = min(r0.w, 1.000000);
/*184*/	r2.x = r0.w * -2.000000 + 3.000000;
/*185*/	r0.w = r0.w * r0.w;
/*186*/	r0.w = r0.w * r2.x;
/*187*/	r0.w = saturate(r1.w * r0.w);
/*188*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*189*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*190*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*191*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*192*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*193*/	color0.w = 1.000000;
/*194*/	return;
}
