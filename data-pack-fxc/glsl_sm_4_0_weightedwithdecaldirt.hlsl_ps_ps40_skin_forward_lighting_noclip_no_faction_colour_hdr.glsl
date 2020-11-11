//
//
// Shader Model 4
// Fragment Shader
//
// id: 2079 - fxc/glsl_SM_4_0_weightedwithdecaldirt.hlsl_PS_ps40_skin_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r1.z = sqrt(r0.w);
/*8*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*9*/	r2.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*10*/	r3.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*11*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*12*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*13*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*17*/	r3.z = vsOut_T6.z;
/*18*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*19*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*20*/	if(floatBitsToUint(r0.w) != 0u) {
/*21*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*22*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*24*/	  r0.w = -r0.w + 1.000000;
/*25*/	  r0.w = max(r0.w, 0.000000);
/*26*/	  r3.z = sqrt(r0.w);
/*27*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*29*/	  r0.w = r2.x * r6.w;
/*30*/	  r2.x = r0.w * -0.500000 + r2.x;
/*31*/	  r0.w = -r4.w * r5.w + 1.000000;
/*32*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*33*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*34*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*35*/	}
/*36*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*37*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*38*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*39*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*40*/	r0.w = r3.w * r4.w;
/*41*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*42*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*43*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*44*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*45*/	r0.w = inversesqrt(r0.w);
/*46*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*47*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*48*/	r0.w = inversesqrt(r0.w);
/*49*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*50*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*53*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*54*/	r0.w = inversesqrt(r0.w);
/*55*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*56*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*57*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*58*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*59*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*60*/	r0.w = inversesqrt(r0.w);
/*61*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*62*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*63*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*64*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*65*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*66*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*67*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*68*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*69*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*70*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*71*/	r2.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*72*/	r3.w = dot(vec3(r2.xzwx), vec3(r2.xzwx));
/*73*/	r3.w = inversesqrt(r3.w);
/*74*/	r2.xzw = (r2.xxzw * r3.wwww).xzw;
/*75*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*77*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*78*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*79*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*80*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*81*/	r4.w = r3.w * r6.x + 0.300000;
/*82*/	r4.w = saturate(-r4.w + 1.000000);
/*83*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*84*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*85*/	r7.w = -r3.w * r6.x + 1.000000;
/*86*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*87*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*88*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*89*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*90*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*91*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*92*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*93*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*94*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*95*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*96*/	r4.w = saturate(r3.w);
/*97*/	r4.w = r4.w * r4.w;
/*98*/	r6.w = saturate(dot(vec3(r2.xzwx), vec3(-cb1.data[0].yzwy)));
/*99*/	r6.w = r6.w * r6.w;
/*100*/	r6.w = r6.w * r6.w;
/*101*/	r4.w = r4.w * r6.w;
/*102*/	r4.z = r4.z * r4.w;
/*103*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*104*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*105*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*106*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*107*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*108*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*109*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*110*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*111*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*112*/	r6.w = inversesqrt(r6.w);
/*113*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*114*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*115*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*116*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*117*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*118*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*119*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*120*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*121*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*122*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*123*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*124*/	r5.y = r5.z * r5.x;
/*125*/	r2.y = r2.y * r2.y;
/*126*/	r3.w = r3.w + r3.w;
/*127*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*128*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.xzwx));
/*129*/	r3.w = max(r3.w, 0.000000);
/*130*/	r2.y = r2.y * 127.000000 + 1.600000;
/*131*/	r3.w = log2(r3.w);
/*132*/	r2.y = r2.y * r3.w;
/*133*/	r2.y = exp2(r2.y);
/*134*/	r2.y = min(r2.y, 1.000000);
/*135*/	r1.w = r1.w * r2.y;
/*136*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*137*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*138*/	r1.w = dot(vec3(-r2.xzwx), vec3(r3.xyzx));
/*139*/	r2.y = r1.w + r1.w;
/*140*/	r2.xyz = (r3.xyzx * -r2.yyyy + -r2.xzwx).xyz;
/*141*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*142*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*143*/	r2.w = inversesqrt(r2.w);
/*144*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*145*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*146*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*147*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*148*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*149*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*150*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*151*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*152*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*153*/	r1.w = saturate(-r1.w + 1.000000);
/*154*/	r1.w = r1.w * r1.w;
/*155*/	r1.w = r4.x * r1.w;
/*156*/	r1.w = r1.w * 1.500000;
/*157*/	r1.w = r5.w * r1.w;
/*158*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*159*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*160*/	r0.w = inversesqrt(r0.w);
/*161*/	r0.w = r0.w * r1.y;
/*162*/	r0.w = max(r0.w, 0.000000);
/*163*/	r0.w = r0.w * r1.w;
/*164*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*165*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*166*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*167*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*168*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*169*/	r0.w = 1.000000;
/*170*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*171*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*172*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*173*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*174*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*175*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*176*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*177*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*178*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*179*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*180*/	if(r0.x != 0) discard;
/*181*/	color0.w = 1.000000;
/*182*/	color1.x = 1.000000;
/*183*/	return;
}
