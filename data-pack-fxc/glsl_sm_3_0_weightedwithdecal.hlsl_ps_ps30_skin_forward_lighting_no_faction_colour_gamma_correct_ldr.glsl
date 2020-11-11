//
//
// Shader Model 4
// Fragment Shader
//
// id: 2002 - fxc/glsl_SM_3_0_weightedwithdecal.hlsl_PS_ps30_skin_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;

void main()
{
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
/*12*/	r2.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*13*/	r3.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*14*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*15*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*16*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*20*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*21*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*22*/	if(floatBitsToUint(r0.w) != 0u) {
/*23*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*24*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*26*/	  r0.w = -r0.w + 1.000000;
/*27*/	  r0.w = max(r0.w, 0.000000);
/*28*/	  r4.z = sqrt(r0.w);
/*29*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*31*/	  r0.w = r2.x * r6.w;
/*32*/	  r2.x = r0.w * -0.500000 + r2.x;
/*33*/	  r0.w = -r3.w * r5.w + 1.000000;
/*34*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*35*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*36*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*37*/	}
/*38*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*39*/	r0.w = inversesqrt(r0.w);
/*40*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*41*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*42*/	r0.w = inversesqrt(r0.w);
/*43*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*44*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*45*/	r0.w = inversesqrt(r0.w);
/*46*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*47*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*48*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*49*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*50*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*53*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*54*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*55*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*56*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*57*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*58*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*60*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*61*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*62*/	r5.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*63*/	r2.x = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*64*/	r2.z = inversesqrt(r2.x);
/*65*/	r6.xyz = (r2.zzzz * r5.xyzx).xyz;
/*66*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*67*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*68*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*69*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*70*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*71*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*72*/	r2.w = r2.z * r8.x + 0.300000;
/*73*/	r2.w = saturate(-r2.w + 1.000000);
/*74*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*75*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*76*/	r3.w = -r2.z * r8.x + 1.000000;
/*77*/	r8.yzw = (r3.wwww * r8.yyzw).yzw;
/*78*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*79*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*80*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*81*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*82*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*83*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*84*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*85*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*86*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*87*/	r2.w = saturate(r2.z);
/*88*/	r2.w = r2.w * r2.w;
/*89*/	r3.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*90*/	r3.w = r3.w * r3.w;
/*91*/	r3.w = r3.w * r3.w;
/*92*/	r2.w = r2.w * r3.w;
/*93*/	r2.w = r4.z * r2.w;
/*94*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*95*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*96*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*97*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*98*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*99*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*100*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*101*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*102*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*103*/	r2.w = inversesqrt(r2.w);
/*104*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*105*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*106*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*107*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*108*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*109*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*110*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*111*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*112*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*113*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*114*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*115*/	r2.w = r7.z * r7.x;
/*116*/	r2.y = r2.y * r2.y;
/*117*/	r2.z = r2.z + r2.z;
/*118*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*119*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*120*/	r2.z = max(r2.z, 0.000000);
/*121*/	r2.y = r2.y * 127.000000 + 1.600000;
/*122*/	r2.z = log2(r2.z);
/*123*/	r2.y = r2.z * r2.y;
/*124*/	r2.y = exp2(r2.y);
/*125*/	r2.y = min(r2.y, 1.000000);
/*126*/	r1.w = r1.w * r2.y;
/*127*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*128*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*129*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*130*/	r2.y = r1.w + r1.w;
/*131*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*132*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*133*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*134*/	r2.y = inversesqrt(r2.y);
/*135*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*136*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*137*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*138*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*139*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*140*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*141*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*142*/	r3.xyw = (r3.xxxx * r9.xyxz + r6.xyxz).xyw;
/*143*/	r3.xyz = (r3.zzzz * r10.xyzx + r3.xywx).xyz;
/*144*/	r1.w = saturate(-r1.w + 1.000000);
/*145*/	r1.w = r1.w * r1.w;
/*146*/	r1.w = r4.x * r1.w;
/*147*/	r1.w = r1.w * 1.500000;
/*148*/	r1.w = r7.w * r1.w;
/*149*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*150*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*151*/	r0.w = inversesqrt(r0.w);
/*152*/	r0.w = r0.w * r1.y;
/*153*/	r0.w = max(r0.w, 0.000000);
/*154*/	r0.w = r0.w * r1.w;
/*155*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*156*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*157*/	r1.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*158*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*159*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*160*/	r1.w = 1.000000;
/*161*/	r3.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*162*/	r3.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*163*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*164*/	r1.xy = (r3.xyxx / r0.wwww).xy;
/*165*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*166*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*167*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*168*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*169*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*170*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*171*/	if(r0.w != 0) discard;
/*172*/	r0.w = sqrt(r2.x);
/*173*/	r1.x = saturate(cb3.data[0].w)/**/;
/*174*/	r1.x = -r1.x + 1.000000;
/*175*/	r1.x = r1.x * 8.000000 + -4.000000;
/*176*/	r1.y = saturate(cb3.data[1].x)/**/;
/*177*/	r1.y = -r1.y + 1.000000;
/*178*/	r1.y = r1.y * 1000.000000;
/*179*/	r0.w = r0.w / r1.y;
/*180*/	r0.w = r0.w + r1.x;
/*181*/	r0.w = r0.w * 1.442695;
/*182*/	r0.w = exp2(r0.w);
/*183*/	r0.w = cb3.data[1].y / r0.w;
/*184*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*185*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*186*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*187*/	r1.x = r1.x + -cb3.data[1].z;
/*188*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*189*/	r1.x = saturate(r1.y * r1.x);
/*190*/	r1.y = r1.x * -2.000000 + 3.000000;
/*191*/	r1.x = r1.x * r1.x;
/*192*/	r1.x = r1.x * r1.y;
/*193*/	r1.y = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*194*/	r1.y = sqrt(r1.y);
/*195*/	r1.z = max(cb3.data[2].z, 0.001000);
/*196*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*197*/	r1.y = r1.z * r1.y;
/*198*/	r1.y = min(r1.y, 1.000000);
/*199*/	r1.z = r1.y * -2.000000 + 3.000000;
/*200*/	r1.y = r1.y * r1.y;
/*201*/	r1.y = r1.y * r1.z;
/*202*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*203*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*204*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*205*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*206*/	r2.xyz = (r7.xxxx * r1.xzwx).xyz;
/*207*/	r5.w = max(r5.y, 0.000000);
/*208*/	r3.xyzw = (texture(s_sky, r5.xwzx.stp)).xyzw;
/*209*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*210*/	r1.xzw = (-r1.xxzw * r7.xxxx + r3.xxyz).xzw;
/*211*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*212*/	r0.w = saturate(r0.w * r1.y);
/*213*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*214*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*215*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*216*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*217*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*218*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*219*/	color0.w = 1.000000;
/*220*/	return;
}
