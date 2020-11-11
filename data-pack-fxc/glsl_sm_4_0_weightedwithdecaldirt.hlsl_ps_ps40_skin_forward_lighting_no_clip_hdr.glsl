//
//
// Shader Model 4
// Fragment Shader
//
// id: 2075 - fxc/glsl_SM_4_0_weightedwithdecaldirt.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*43*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*44*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*45*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*46*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*47*/	r0.w = r3.w * r4.w;
/*48*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*49*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*50*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*51*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*54*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*57*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*60*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*63*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*64*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*65*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*66*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*69*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*70*/	r1.w = -vsOut_T4.z + 1.000000;
/*71*/	r5.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*72*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*73*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*74*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*75*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*76*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*77*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*78*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*79*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*80*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*81*/	r2.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*82*/	r3.w = dot(vec3(r2.xzwx), vec3(r2.xzwx));
/*83*/	r3.w = inversesqrt(r3.w);
/*84*/	r2.xzw = (r2.xxzw * r3.wwww).xzw;
/*85*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*87*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*88*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*89*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*90*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*91*/	r4.w = r3.w * r6.x + 0.300000;
/*92*/	r4.w = saturate(-r4.w + 1.000000);
/*93*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*94*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*95*/	r7.w = -r3.w * r6.x + 1.000000;
/*96*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*97*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*98*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*99*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*100*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*101*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*102*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*103*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*104*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*105*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*106*/	r4.w = saturate(r3.w);
/*107*/	r4.w = r4.w * r4.w;
/*108*/	r6.w = saturate(dot(vec3(r2.xzwx), vec3(-cb1.data[0].yzwy)));
/*109*/	r6.w = r6.w * r6.w;
/*110*/	r6.w = r6.w * r6.w;
/*111*/	r4.w = r4.w * r6.w;
/*112*/	r4.z = r4.z * r4.w;
/*113*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*114*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*115*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*116*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*117*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*118*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*119*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*120*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*121*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*122*/	r6.w = inversesqrt(r6.w);
/*123*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*124*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*125*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*126*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*127*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*128*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*129*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*130*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*131*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*132*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*133*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*134*/	r5.y = r5.z * r5.x;
/*135*/	r2.y = r2.y * r2.y;
/*136*/	r3.w = r3.w + r3.w;
/*137*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*138*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.xzwx));
/*139*/	r3.w = max(r3.w, 0.000000);
/*140*/	r2.y = r2.y * 127.000000 + 1.600000;
/*141*/	r3.w = log2(r3.w);
/*142*/	r2.y = r2.y * r3.w;
/*143*/	r2.y = exp2(r2.y);
/*144*/	r2.y = min(r2.y, 1.000000);
/*145*/	r1.w = r1.w * r2.y;
/*146*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*147*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*148*/	r1.w = dot(vec3(-r2.xzwx), vec3(r3.xyzx));
/*149*/	r2.y = r1.w + r1.w;
/*150*/	r2.xyz = (r3.xyzx * -r2.yyyy + -r2.xzwx).xyz;
/*151*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*152*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*153*/	r2.w = inversesqrt(r2.w);
/*154*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*155*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*156*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*157*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*158*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*159*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*160*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*161*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*162*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*163*/	r1.w = saturate(-r1.w + 1.000000);
/*164*/	r1.w = r1.w * r1.w;
/*165*/	r1.w = r4.x * r1.w;
/*166*/	r1.w = r1.w * 1.500000;
/*167*/	r1.w = r5.w * r1.w;
/*168*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*169*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*170*/	r0.w = inversesqrt(r0.w);
/*171*/	r0.w = r0.w * r1.y;
/*172*/	r0.w = max(r0.w, 0.000000);
/*173*/	r0.w = r0.w * r1.w;
/*174*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*175*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*176*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*177*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*178*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*179*/	r0.w = 1.000000;
/*180*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*181*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*182*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*183*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*184*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*185*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*186*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*187*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*188*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*189*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*190*/	if(r0.x != 0) discard;
/*191*/	color0.w = 1.000000;
/*192*/	color1.x = 1.000000;
/*193*/	return;
}
