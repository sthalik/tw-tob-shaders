//
//
// Shader Model 4
// Fragment Shader
//
// id: 2010 - fxc/glsl_SM_4_0_weightedwithdecal.hlsl_PS_ps40_skin_forward_lighting_no_faction_colour_HDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
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
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r1.z = sqrt(r0.w);
/*11*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*12*/	r2.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*13*/	r3.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*14*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*15*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*20*/	r3.z = vsOut_T6.z;
/*21*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*22*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*23*/	if(floatBitsToUint(r0.w) != 0u) {
/*24*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	  r0.w = -r0.w + 1.000000;
/*28*/	  r0.w = max(r0.w, 0.000000);
/*29*/	  r3.z = sqrt(r0.w);
/*30*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*31*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*32*/	  r0.w = r2.x * r6.w;
/*33*/	  r2.x = r0.w * -0.500000 + r2.x;
/*34*/	  r0.w = -r4.w * r5.w + 1.000000;
/*35*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*36*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*37*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*38*/	}
/*39*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*40*/	r0.w = inversesqrt(r0.w);
/*41*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*42*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*43*/	r0.w = inversesqrt(r0.w);
/*44*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*45*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r0.w = inversesqrt(r0.w);
/*47*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*48*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*49*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*50*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*51*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*54*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*55*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*56*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*57*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*58*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*59*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*61*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*62*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*63*/	r2.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*64*/	r3.w = dot(vec3(r2.xzwx), vec3(r2.xzwx));
/*65*/	r3.w = inversesqrt(r3.w);
/*66*/	r2.xzw = (r2.xxzw * r3.wwww).xzw;
/*67*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*68*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*69*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*70*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*71*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*72*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*73*/	r4.w = r3.w * r6.x + 0.300000;
/*74*/	r4.w = saturate(-r4.w + 1.000000);
/*75*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*76*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*77*/	r7.w = -r3.w * r6.x + 1.000000;
/*78*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*79*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*80*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*81*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*82*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*83*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*84*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*85*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*86*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*87*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*88*/	r4.w = saturate(r3.w);
/*89*/	r4.w = r4.w * r4.w;
/*90*/	r6.w = saturate(dot(vec3(r2.xzwx), vec3(-cb1.data[0].yzwy)));
/*91*/	r6.w = r6.w * r6.w;
/*92*/	r6.w = r6.w * r6.w;
/*93*/	r4.w = r4.w * r6.w;
/*94*/	r4.z = r4.z * r4.w;
/*95*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*96*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*97*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*98*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*99*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*100*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*101*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*102*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*103*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*104*/	r6.w = inversesqrt(r6.w);
/*105*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*106*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*107*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*108*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*109*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*110*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*111*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*112*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*113*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*114*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*115*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*116*/	r5.y = r5.z * r5.x;
/*117*/	r2.y = r2.y * r2.y;
/*118*/	r3.w = r3.w + r3.w;
/*119*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*120*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.xzwx));
/*121*/	r3.w = max(r3.w, 0.000000);
/*122*/	r2.y = r2.y * 127.000000 + 1.600000;
/*123*/	r3.w = log2(r3.w);
/*124*/	r2.y = r2.y * r3.w;
/*125*/	r2.y = exp2(r2.y);
/*126*/	r2.y = min(r2.y, 1.000000);
/*127*/	r1.w = r1.w * r2.y;
/*128*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*129*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*130*/	r1.w = dot(vec3(-r2.xzwx), vec3(r3.xyzx));
/*131*/	r2.y = r1.w + r1.w;
/*132*/	r2.xyz = (r3.xyzx * -r2.yyyy + -r2.xzwx).xyz;
/*133*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*134*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*135*/	r2.w = inversesqrt(r2.w);
/*136*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*137*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*138*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*139*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*140*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*141*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*142*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*143*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*144*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*145*/	r1.w = saturate(-r1.w + 1.000000);
/*146*/	r1.w = r1.w * r1.w;
/*147*/	r1.w = r4.x * r1.w;
/*148*/	r1.w = r1.w * 1.500000;
/*149*/	r1.w = r5.w * r1.w;
/*150*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*151*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*152*/	r0.w = inversesqrt(r0.w);
/*153*/	r0.w = r0.w * r1.y;
/*154*/	r0.w = max(r0.w, 0.000000);
/*155*/	r0.w = r0.w * r1.w;
/*156*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*157*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*158*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*159*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*160*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*161*/	r0.w = 1.000000;
/*162*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*163*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*164*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*165*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*166*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*167*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*168*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*169*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*170*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*171*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*172*/	if(r0.x != 0) discard;
/*173*/	color0.w = 1.000000;
/*174*/	color1.x = 1.000000;
/*175*/	return;
}
