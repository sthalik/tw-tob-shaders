//
//
// Shader Model 4
// Fragment Shader
//
// id: 2149 - fxc/glsl_SM_3_0_weightedwithblood.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_blood_map;
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r0.w = sqrt(r0.w);
/*8*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*9*/	if(r1.z != 0) discard;
/*10*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*11*/	r1.zw = (r1.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*13*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*14*/	r1.z = saturate(-r1.z + r2.w);
/*15*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*16*/	if(floatBitsToUint(r1.z) != 0u) {
/*17*/	  r1.z = -r2.w + 1.000000;
/*18*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*19*/	  r1.z = -r1.z + 1.000000;
/*20*/	  r1.z = -r1.z * r1.z + 1.000000;
/*21*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*22*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*23*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*24*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*25*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*26*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*27*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*28*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*29*/	} else {
/*30*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	}
/*32*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*33*/	r1.z = inversesqrt(r1.z);
/*34*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*35*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*36*/	r1.z = inversesqrt(r1.z);
/*37*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*38*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*39*/	r1.z = inversesqrt(r1.z);
/*40*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*41*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*42*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*43*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*45*/	r0.w = inversesqrt(r0.w);
/*46*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*47*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*48*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*49*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*50*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*51*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*52*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*54*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*55*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*56*/	r5.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*57*/	r2.y = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*58*/	r2.z = inversesqrt(r2.y);
/*59*/	r6.xyz = (r2.zzzz * r5.xyzx).xyz;
/*60*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*61*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*62*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*63*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*64*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*65*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*66*/	r2.w = r2.z * r8.x + 0.300000;
/*67*/	r2.w = saturate(-r2.w + 1.000000);
/*68*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*69*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*70*/	r3.w = -r2.z * r8.x + 1.000000;
/*71*/	r8.yzw = (r3.wwww * r8.yyzw).yzw;
/*72*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*73*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*74*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*75*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*76*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*77*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*78*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*79*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*80*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*81*/	r2.w = saturate(r2.z);
/*82*/	r2.w = r2.w * r2.w;
/*83*/	r3.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*84*/	r3.w = r3.w * r3.w;
/*85*/	r3.w = r3.w * r3.w;
/*86*/	r2.w = r2.w * r3.w;
/*87*/	r2.w = r4.z * r2.w;
/*88*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*89*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*90*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*91*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*92*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*93*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*94*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*95*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*96*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*97*/	r2.w = inversesqrt(r2.w);
/*98*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*99*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*100*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*101*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*102*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*103*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*104*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*105*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*106*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*107*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*108*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*109*/	r2.w = r7.z * r7.x;
/*110*/	r2.x = r2.x * r2.x;
/*111*/	r2.z = r2.z + r2.z;
/*112*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*113*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*114*/	r2.z = max(r2.z, 0.000000);
/*115*/	r2.x = r2.x * 127.000000 + 1.600000;
/*116*/	r2.z = log2(r2.z);
/*117*/	r2.x = r2.z * r2.x;
/*118*/	r2.x = exp2(r2.x);
/*119*/	r2.x = min(r2.x, 1.000000);
/*120*/	r1.w = r1.w * r2.x;
/*121*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*122*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*123*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*124*/	r2.x = r1.w + r1.w;
/*125*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r6.xyzx).xyz;
/*126*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*127*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*128*/	r2.x = inversesqrt(r2.x);
/*129*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*130*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*131*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*132*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*133*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*134*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*135*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*136*/	r3.xyw = (r3.xxxx * r9.xyxz + r6.xyxz).xyw;
/*137*/	r3.xyz = (r3.zzzz * r10.xyzx + r3.xywx).xyz;
/*138*/	r1.w = saturate(-r1.w + 1.000000);
/*139*/	r1.w = r1.w * r1.w;
/*140*/	r1.w = r4.x * r1.w;
/*141*/	r1.w = r1.w * 1.500000;
/*142*/	r1.w = r7.w * r1.w;
/*143*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*144*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*145*/	r0.w = inversesqrt(r0.w);
/*146*/	r0.w = r0.w * r1.y;
/*147*/	r0.w = max(r0.w, 0.000000);
/*148*/	r0.w = r0.w * r1.w;
/*149*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*150*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*151*/	r1.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*152*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*153*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*154*/	r1.w = 1.000000;
/*155*/	r3.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*156*/	r3.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*157*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*158*/	r1.xy = (r3.xyxx / r0.wwww).xy;
/*159*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*160*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*161*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*162*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*163*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*164*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*165*/	if(r0.w != 0) discard;
/*166*/	r0.w = sqrt(r2.y);
/*167*/	r1.x = saturate(cb3.data[0].w)/**/;
/*168*/	r1.x = -r1.x + 1.000000;
/*169*/	r1.x = r1.x * 8.000000 + -4.000000;
/*170*/	r1.y = saturate(cb3.data[1].x)/**/;
/*171*/	r1.y = -r1.y + 1.000000;
/*172*/	r1.y = r1.y * 1000.000000;
/*173*/	r0.w = r0.w / r1.y;
/*174*/	r0.w = r0.w + r1.x;
/*175*/	r0.w = r0.w * 1.442695;
/*176*/	r0.w = exp2(r0.w);
/*177*/	r0.w = cb3.data[1].y / r0.w;
/*178*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*179*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*180*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*181*/	r1.x = r1.x + -cb3.data[1].z;
/*182*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*183*/	r1.x = saturate(r1.y * r1.x);
/*184*/	r1.y = r1.x * -2.000000 + 3.000000;
/*185*/	r1.x = r1.x * r1.x;
/*186*/	r1.x = r1.x * r1.y;
/*187*/	r1.y = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*188*/	r1.y = sqrt(r1.y);
/*189*/	r1.z = max(cb3.data[2].z, 0.001000);
/*190*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*191*/	r1.y = r1.z * r1.y;
/*192*/	r1.y = min(r1.y, 1.000000);
/*193*/	r1.z = r1.y * -2.000000 + 3.000000;
/*194*/	r1.y = r1.y * r1.y;
/*195*/	r1.y = r1.y * r1.z;
/*196*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*197*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*198*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*199*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*200*/	r2.xyz = (r7.xxxx * r1.xzwx).xyz;
/*201*/	r5.w = max(r5.y, 0.000000);
/*202*/	r3.xyzw = (texture(s_sky, r5.xwzx.stp)).xyzw;
/*203*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*204*/	r1.xzw = (-r1.xxzw * r7.xxxx + r3.xxyz).xzw;
/*205*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*206*/	r0.w = saturate(r0.w * r1.y);
/*207*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*208*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*209*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*210*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*211*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*212*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*213*/	color0.w = 1.000000;
/*214*/	return;
}
