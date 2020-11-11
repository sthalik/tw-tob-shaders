//
//
// Shader Model 4
// Fragment Shader
//
// id: 2008 - fxc/glsl_SM_4_0_weightedwithdecal.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_skin_mask_map;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (cb3.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb3.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb3.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*9*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*11*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r1.z = sqrt(r0.w);
/*15*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*16*/	r2.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*17*/	r3.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*18*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*19*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*20*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*21*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*22*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*23*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*24*/	r3.z = vsOut_T6.z;
/*25*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*26*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*27*/	if(floatBitsToUint(r0.w) != 0u) {
/*28*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*29*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*31*/	  r0.w = -r0.w + 1.000000;
/*32*/	  r0.w = max(r0.w, 0.000000);
/*33*/	  r3.z = sqrt(r0.w);
/*34*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*35*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*36*/	  r0.w = r2.x * r6.w;
/*37*/	  r2.x = r0.w * -0.500000 + r2.x;
/*38*/	  r0.w = -r4.w * r5.w + 1.000000;
/*39*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*40*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*41*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*42*/	}
/*43*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*44*/	r0.w = inversesqrt(r0.w);
/*45*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*46*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*47*/	r0.w = inversesqrt(r0.w);
/*48*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*49*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*52*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*53*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*54*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*55*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*56*/	r0.w = inversesqrt(r0.w);
/*57*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*58*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*59*/	r1.w = -vsOut_T4.z + 1.000000;
/*60*/	r5.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*61*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*62*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*63*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*64*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*66*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*67*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*68*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*69*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*70*/	r2.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*71*/	r3.w = dot(vec3(r2.xzwx), vec3(r2.xzwx));
/*72*/	r3.w = inversesqrt(r3.w);
/*73*/	r2.xzw = (r2.xxzw * r3.wwww).xzw;
/*74*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*75*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*76*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*77*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*78*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*79*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*80*/	r4.w = r3.w * r6.x + 0.300000;
/*81*/	r4.w = saturate(-r4.w + 1.000000);
/*82*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*83*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*84*/	r7.w = -r3.w * r6.x + 1.000000;
/*85*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*86*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*87*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*88*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*89*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*90*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*91*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*92*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*93*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*94*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*95*/	r4.w = saturate(r3.w);
/*96*/	r4.w = r4.w * r4.w;
/*97*/	r6.w = saturate(dot(vec3(r2.xzwx), vec3(-cb1.data[0].yzwy)));
/*98*/	r6.w = r6.w * r6.w;
/*99*/	r6.w = r6.w * r6.w;
/*100*/	r4.w = r4.w * r6.w;
/*101*/	r4.z = r4.z * r4.w;
/*102*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*103*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*104*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*105*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*106*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*107*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*108*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*109*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*110*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*111*/	r6.w = inversesqrt(r6.w);
/*112*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*113*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*114*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*115*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*116*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*117*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*118*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*119*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*120*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*121*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*122*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*123*/	r5.y = r5.z * r5.x;
/*124*/	r2.y = r2.y * r2.y;
/*125*/	r3.w = r3.w + r3.w;
/*126*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*127*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.xzwx));
/*128*/	r3.w = max(r3.w, 0.000000);
/*129*/	r2.y = r2.y * 127.000000 + 1.600000;
/*130*/	r3.w = log2(r3.w);
/*131*/	r2.y = r2.y * r3.w;
/*132*/	r2.y = exp2(r2.y);
/*133*/	r2.y = min(r2.y, 1.000000);
/*134*/	r1.w = r1.w * r2.y;
/*135*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*136*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*137*/	r1.w = dot(vec3(-r2.xzwx), vec3(r3.xyzx));
/*138*/	r2.y = r1.w + r1.w;
/*139*/	r2.xyz = (r3.xyzx * -r2.yyyy + -r2.xzwx).xyz;
/*140*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*141*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*142*/	r2.w = inversesqrt(r2.w);
/*143*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*144*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*145*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*146*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*147*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*148*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*149*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*150*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*151*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*152*/	r1.w = saturate(-r1.w + 1.000000);
/*153*/	r1.w = r1.w * r1.w;
/*154*/	r1.w = r4.x * r1.w;
/*155*/	r1.w = r1.w * 1.500000;
/*156*/	r1.w = r5.w * r1.w;
/*157*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*158*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*159*/	r0.w = inversesqrt(r0.w);
/*160*/	r0.w = r0.w * r1.y;
/*161*/	r0.w = max(r0.w, 0.000000);
/*162*/	r0.w = r0.w * r1.w;
/*163*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*164*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*165*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*166*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*167*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*168*/	r0.w = 1.000000;
/*169*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*170*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*171*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*172*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*173*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*174*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*175*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*176*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*177*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*178*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*179*/	if(r0.x != 0) discard;
/*180*/	color0.w = 1.000000;
/*181*/	color1.x = 1.000000;
/*182*/	return;
}
