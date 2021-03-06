//
//
// Shader Model 4
// Fragment Shader
//
// id: 1866 - fxc/glsl_SM_3_0_weighted.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

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

/*0*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	r1.x = dot(r0.xyzw, cb1.data[9].xyzw);
/*3*/	r1.y = dot(r0.xyzw, cb1.data[10].xyzw);
/*4*/	r0.x = dot(r0.xyzw, cb1.data[12].xyzw);
/*5*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*6*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*7*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*8*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*9*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*10*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*11*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*12*/	if(r0.x != 0) discard;
/*13*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r1.xyz = (cb4.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*16*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*17*/	r1.xyz = (cb4.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyz = (cb4.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*21*/	r0.w = -vsOut_T4.z + 1.000000;
/*22*/	r1.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*23*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*24*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*25*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*26*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*27*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*28*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*29*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*30*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*31*/	r0.w = inversesqrt(r0.w);
/*32*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*33*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*34*/	r0.w = inversesqrt(r0.w);
/*35*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*36*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*37*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*38*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*39*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*40*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*41*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*42*/	r0.w = -r0.w + 1.000000;
/*43*/	r0.w = max(r0.w, 0.000000);
/*44*/	r0.w = sqrt(r0.w);
/*45*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r1.w = inversesqrt(r1.w);
/*47*/	r2.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*48*/	r1.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*49*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*52*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*53*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*54*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*55*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*56*/	r1.w = r0.w * r3.x + 0.300000;
/*57*/	r1.w = saturate(-r1.w + 1.000000);
/*58*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*59*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*60*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*61*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*62*/	r1.w = -r0.w * r3.x + 1.000000;
/*63*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*64*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*65*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*66*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*67*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*68*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*69*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*70*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*71*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*73*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*74*/	r0.w = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*75*/	r1.w = saturate(r0.w);
/*76*/	r0.w = r0.w + r0.w;
/*77*/	r6.xyz = (r2.xyzx * -r0.wwww + cb2.data[0].yzwy).xyz;
/*78*/	r0.w = r1.w * r1.w;
/*79*/	r7.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*80*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*81*/	r2.w = inversesqrt(r1.w);
/*82*/	r1.w = sqrt(r1.w);
/*83*/	r8.xyz = (r2.wwww * r7.xyzx).xyz;
/*84*/	r2.w = saturate(dot(vec3(r8.xyzx), vec3(-cb2.data[0].yzwy)));
/*85*/	r2.w = r2.w * r2.w;
/*86*/	r2.w = r2.w * r2.w;
/*87*/	r0.w = r0.w * r2.w;
/*88*/	r0.w = r4.z * r0.w;
/*89*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*90*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*91*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*92*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*93*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*94*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*95*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*96*/	r0.w = dot(vec3(r6.xyzx), vec3(-r8.xyzx));
/*97*/	r0.w = max(r0.w, 0.000000);
/*98*/	r0.w = log2(r0.w);
/*99*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*100*/	r2.w = r6.x * r6.x;
/*101*/	r3.w = vsOut_T7.x * -r6.y + r6.y;
/*102*/	r3.w = vsOut_T7.y * -r3.w + r3.w;
/*103*/	r2.w = r2.w * 127.000000 + 1.600000;
/*104*/	r0.w = r0.w * r2.w;
/*105*/	r0.w = exp2(r0.w);
/*106*/	r0.w = min(r0.w, 1.000000);
/*107*/	r0.w = r0.w * r3.w;
/*108*/	r4.yzw = (r0.wwww * cb2.data[1].xxyz).yzw;
/*109*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*110*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*111*/	r0.w = dot(vec3(-r8.xyzx), vec3(r2.xyzx));
/*112*/	r2.w = r0.w + r0.w;
/*113*/	r0.w = saturate(-r0.w + 1.000000);
/*114*/	r0.w = r0.w * r0.w;
/*115*/	r0.w = r4.x * r0.w;
/*116*/	r0.w = r0.w * 1.500000;
/*117*/	r0.w = r5.w * r0.w;
/*118*/	r4.xyz = (r2.xyzx * -r2.wwww + -r8.xyzx).xyz;
/*119*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*120*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*121*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*122*/	r2.w = inversesqrt(r2.w);
/*123*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*124*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*125*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*126*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*127*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*128*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*129*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*130*/	r4.xyw = (r4.xxxx * r8.xyxz + r6.xyxz).xyw;
/*131*/	r4.xyz = (r4.zzzz * r9.xyzx + r4.xywx).xyz;
/*132*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*133*/	r1.x = inversesqrt(r1.x);
/*134*/	r1.x = r1.x * r1.y;
/*135*/	r1.x = max(r1.x, 0.000000);
/*136*/	r0.w = r0.w * r1.x;
/*137*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*138*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*139*/	r0.w = inversesqrt(r0.w);
/*140*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*141*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*142*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*143*/	r6.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*144*/	r4.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*145*/	r8.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*146*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*147*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*148*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*149*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*150*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*151*/	r0.w = r5.z * r5.x;
/*152*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*153*/	r0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*154*/	r7.w = max(r7.y, 0.000000);
/*155*/	r2.xyzw = (texture(s_sky, r7.xwzx.stp)).xyzw;
/*156*/	r0.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*157*/	r0.w = sqrt(r0.w);
/*158*/	r1.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*159*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*160*/	r1.xyz = (r1.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*161*/	r2.xyz = (-r1.xyzx * r5.xxxx + r2.xyzx).xyz;
/*162*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*163*/	r2.w = saturate(cb3.data[1].x)/**/;
/*164*/	r2.w = -r2.w + 1.000000;
/*165*/	r2.w = r2.w * 1000.000000;
/*166*/	r1.w = r1.w / r2.w;
/*167*/	r2.w = saturate(cb3.data[0].w)/**/;
/*168*/	r2.w = -r2.w + 1.000000;
/*169*/	r2.w = r2.w * 8.000000 + -4.000000;
/*170*/	r1.w = r1.w + r2.w;
/*171*/	r1.w = r1.w * 1.442695;
/*172*/	r1.w = exp2(r1.w);
/*173*/	r1.w = cb3.data[1].y / r1.w;
/*174*/	r1.w = saturate(-r1.w + cb3.data[1].y);
/*175*/	r2.w = -vsOut_T0.y + cb3.data[1].w;
/*176*/	r2.w = r2.w + -cb3.data[1].z;
/*177*/	r3.x = -cb3.data[1].z + cb3.data[1].w;
/*178*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*179*/	r2.w = saturate(r2.w * r3.x);
/*180*/	r3.x = r2.w * -2.000000 + 3.000000;
/*181*/	r2.w = r2.w * r2.w;
/*182*/	r2.w = r2.w * r3.x;
/*183*/	r1.w = cb3.data[2].x * r2.w + r1.w;
/*184*/	r2.w = saturate(dot(vec2(r1.wwww), vec2(cb3.data[2].yyyy)));
/*185*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*186*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*187*/	r2.x = max(cb3.data[2].z, 0.001000);
/*188*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*189*/	r0.w = r0.w * r2.x;
/*190*/	r0.w = min(r0.w, 1.000000);
/*191*/	r2.x = r0.w * -2.000000 + 3.000000;
/*192*/	r0.w = r0.w * r0.w;
/*193*/	r0.w = r0.w * r2.x;
/*194*/	r0.w = saturate(r1.w * r0.w);
/*195*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*196*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*197*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*198*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*199*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*200*/	color0.w = 1.000000;
/*201*/	return;
}
