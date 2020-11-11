//
//
// Shader Model 4
// Fragment Shader
//
// id: 1937 - fxc/glsl_SM_3_0_weightedwithdirt.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*13*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*14*/	r0.x = inversesqrt(r0.x);
/*15*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*16*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*17*/	r0.w = inversesqrt(r0.w);
/*18*/	r1.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*19*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*21*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*23*/	r0.w = -r0.w + 1.000000;
/*24*/	r0.w = max(r0.w, 0.000000);
/*25*/	r3.z = sqrt(r0.w);
/*26*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*27*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*28*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*29*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*31*/	r0.w = r4.w * r5.w;
/*32*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*33*/	r1.w = inversesqrt(r1.w);
/*34*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*35*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*36*/	r0.xyz = (r2.xxxx * r0.xyzx + r1.xyzx).xyz;
/*37*/	r1.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*38*/	r1.x = inversesqrt(r1.x);
/*39*/	r1.xyz = (r1.xxxx * vsOut_T2.xyzx).xyz;
/*40*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*41*/	r1.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*42*/	r1.x = inversesqrt(r1.x);
/*43*/	r1.yzw = (r0.xxyz * r1.xxxx).yzw;
/*44*/	r0.xyz = (r0.xyzx * r1.xxxx + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*45*/	r1.x = dot(vec3(r1.yzwy), vec3(-cb2.data[0].yzwy));
/*46*/	r2.xyz = (r1.xxxx * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*47*/	r2.xyz = saturate(r2.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*48*/	r2.w = r1.x * r2.x + 0.300000;
/*49*/	r2.w = saturate(-r2.w + 1.000000);
/*50*/	r3.xyz = (r2.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*51*/	r4.xyz = (r2.wwww * r3.xyzx).xyz;
/*52*/	r3.xyz = (-r3.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*53*/	r4.xyz = (r1.xxxx * r2.xxxx + r4.xyzx).xyz;
/*54*/	r2.x = -r1.x * r2.x + 1.000000;
/*55*/	r2.yzw = (r2.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*56*/	r2.xyz = (r2.xxxx * r2.yzwy).xyz;
/*57*/	r2.xyz = (r2.xyzx * r3.xyzx + r4.xyzx).xyz;
/*58*/	r2.xyz = (-r1.xxxx + r2.xyzx).xyz;
/*59*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*60*/	r2.xyz = saturate(r3.yyyy * r2.xyzx + r1.xxxx).xyz;
/*61*/	r4.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*62*/	r5.xyz = (-r4.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*63*/	r4.xyz = (r0.wwww * r5.xyzx + r4.xyzx).xyz;
/*64*/	r5.xyz = (r4.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*65*/	r5.xyz = (-r4.xyzx + r5.xyzx).xyz;
/*66*/	r4.xyz = saturate(vsOut_T7.xxxx * r5.xyzx + r4.xyzx).xyz;
/*67*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*68*/	r5.xyz = (-r4.xyzx + r0.wwww).xyz;
/*69*/	r4.xyz = (vsOut_T7.yyyy * r5.xyzx + r4.xyzx).xyz;
/*70*/	r2.xyz = (r2.xyzx * r4.xyzx).xyz;
/*71*/	r2.xyz = (r2.xyzx * cb2.data[1].xyzx).xyz;
/*72*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*74*/	r2.xyz = (r2.xyzx * r5.xxxx).xyz;
/*75*/	r0.w = dot(vec3(r1.yzwy), vec3(cb2.data[0].yzwy));
/*76*/	r1.x = saturate(r0.w);
/*77*/	r0.w = r0.w + r0.w;
/*78*/	r6.xyz = (r1.yzwy * -r0.wwww + cb2.data[0].yzwy).xyz;
/*79*/	r0.w = r1.x * r1.x;
/*80*/	r7.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*81*/	r1.x = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*82*/	r2.w = inversesqrt(r1.x);
/*83*/	r1.x = sqrt(r1.x);
/*84*/	r8.xyz = (r2.wwww * r7.xyzx).xyz;
/*85*/	r2.w = saturate(dot(vec3(r8.xyzx), vec3(-cb2.data[0].yzwy)));
/*86*/	r2.w = r2.w * r2.w;
/*87*/	r2.w = r2.w * r2.w;
/*88*/	r0.w = r0.w * r2.w;
/*89*/	r0.w = r3.z * r0.w;
/*90*/	r3.yzw = (r3.yyyy * cb2.data[1].xxyz).yzw;
/*91*/	r3.yzw = (r3.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*92*/	r3.yzw = (r5.xxxx * r3.yyzw).yzw;
/*93*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*94*/	r3.yzw = (r3.yyzw * r4.xxyz).yzw;
/*95*/	r3.yzw = (r3.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*96*/	r2.xyz = (r2.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r3.yzwy).xyz;
/*97*/	r0.w = dot(vec3(r6.xyzx), vec3(-r8.xyzx));
/*98*/	r0.w = max(r0.w, 0.000000);
/*99*/	r0.w = log2(r0.w);
/*100*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*101*/	r2.w = r6.x * r6.x;
/*102*/	r3.y = vsOut_T7.x * -r6.y + r6.y;
/*103*/	r3.y = vsOut_T7.y * -r3.y + r3.y;
/*104*/	r2.w = r2.w * 127.000000 + 1.600000;
/*105*/	r0.w = r0.w * r2.w;
/*106*/	r0.w = exp2(r0.w);
/*107*/	r0.w = min(r0.w, 1.000000);
/*108*/	r0.w = r0.w * r3.y;
/*109*/	r3.yzw = (r0.wwww * cb2.data[1].xxyz).yzw;
/*110*/	r3.yzw = (r5.xxxx * r3.yyzw).yzw;
/*111*/	r2.xyz = (r3.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r2.xyzx).xyz;
/*112*/	r0.w = dot(vec3(-r8.xyzx), vec3(r1.yzwy));
/*113*/	r2.w = r0.w + r0.w;
/*114*/	r0.w = saturate(-r0.w + 1.000000);
/*115*/	r0.w = r0.w * r0.w;
/*116*/	r0.w = r3.x * r0.w;
/*117*/	r0.w = r0.w * 1.500000;
/*118*/	r0.w = r5.w * r0.w;
/*119*/	r3.xyz = (r1.yzwy * -r2.wwww + -r8.xyzx).xyz;
/*120*/	r1.yzw = (r1.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*121*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*122*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*123*/	r2.w = inversesqrt(r2.w);
/*124*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*125*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*126*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*127*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*128*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*129*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*130*/	r6.xyz = (r3.yyyy * r6.xywx).xyz;
/*131*/	r3.xyw = (r3.xxxx * r8.xyxz + r6.xyxz).xyw;
/*132*/	r3.xyz = (r3.zzzz * r9.xyzx + r3.xywx).xyz;
/*133*/	r0.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*134*/	r0.x = inversesqrt(r0.x);
/*135*/	r0.x = r0.x * r0.y;
/*136*/	r0.x = max(r0.x, 0.000000);
/*137*/	r0.x = r0.x * r0.w;
/*138*/	r0.xyz = (r3.xyzx * r0.xxxx).xyz;
/*139*/	r0.w = dot(vec3(r1.yzwy), vec3(r1.yzwy));
/*140*/	r0.w = inversesqrt(r0.w);
/*141*/	r1.yzw = (r0.wwww * r1.yyzw).yzw;
/*142*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r1.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*143*/	r1.yzw = (r1.yyzw * r1.yyzw).yzw;
/*144*/	r6.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*145*/	r3.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*146*/	r8.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*147*/	r3.xyz = (r1.zzzz * r3.xywx).xyz;
/*148*/	r3.xyz = (r1.yyyy * r6.xyzx + r3.xyzx).xyz;
/*149*/	r1.yzw = (r1.wwww * r8.xxyz + r3.xxyz).yzw;
/*150*/	r1.yzw = (r1.yyzw * r4.xxyz).yzw;
/*151*/	r1.yzw = (r5.yyyy * r1.yyzw).yzw;
/*152*/	r0.w = r5.z * r5.x;
/*153*/	r0.xyz = (r1.yzwy * r0.wwww + r0.xyzx).xyz;
/*154*/	r0.xyz = (r2.xyzx + r0.xyzx).xyz;
/*155*/	r7.w = max(r7.y, 0.000000);
/*156*/	r2.xyzw = (texture(s_sky, r7.xwzx.stp)).xyzw;
/*157*/	r0.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*158*/	r0.w = sqrt(r0.w);
/*159*/	r1.yzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).yzw;
/*160*/	r1.yzw = (r1.yyzw * vec4(0.000000, 1.500000, 1.500000, 1.500000)).yzw;
/*161*/	r1.yzw = (r1.yyzw * abs(cb2.data[0].zzzz)).yzw;
/*162*/	r2.xyz = (-r1.yzwy * r5.xxxx + r2.xyzx).xyz;
/*163*/	r1.yzw = (r5.xxxx * r1.yyzw).yzw;
/*164*/	r2.w = saturate(cb3.data[1].x)/**/;
/*165*/	r2.w = -r2.w + 1.000000;
/*166*/	r2.w = r2.w * 1000.000000;
/*167*/	r1.x = r1.x / r2.w;
/*168*/	r2.w = saturate(cb3.data[0].w)/**/;
/*169*/	r2.w = -r2.w + 1.000000;
/*170*/	r2.w = r2.w * 8.000000 + -4.000000;
/*171*/	r1.x = r1.x + r2.w;
/*172*/	r1.x = r1.x * 1.442695;
/*173*/	r1.x = exp2(r1.x);
/*174*/	r1.x = cb3.data[1].y / r1.x;
/*175*/	r1.x = saturate(-r1.x + cb3.data[1].y);
/*176*/	r2.w = -vsOut_T0.y + cb3.data[1].w;
/*177*/	r2.w = r2.w + -cb3.data[1].z;
/*178*/	r3.x = -cb3.data[1].z + cb3.data[1].w;
/*179*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*180*/	r2.w = saturate(r2.w * r3.x);
/*181*/	r3.x = r2.w * -2.000000 + 3.000000;
/*182*/	r2.w = r2.w * r2.w;
/*183*/	r2.w = r2.w * r3.x;
/*184*/	r1.x = cb3.data[2].x * r2.w + r1.x;
/*185*/	r2.w = saturate(dot(vec2(r1.xxxx), vec2(cb3.data[2].yyyy)));
/*186*/	r1.yzw = (r2.wwww * r2.xxyz + r1.yyzw).yzw;
/*187*/	r1.yzw = (-r0.xxyz + r1.yyzw).yzw;
/*188*/	r2.x = max(cb3.data[2].z, 0.001000);
/*189*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*190*/	r0.w = r0.w * r2.x;
/*191*/	r0.w = min(r0.w, 1.000000);
/*192*/	r2.x = r0.w * -2.000000 + 3.000000;
/*193*/	r0.w = r0.w * r0.w;
/*194*/	r0.w = r0.w * r2.x;
/*195*/	r0.w = saturate(r1.x * r0.w);
/*196*/	r0.xyz = saturate(r0.wwww * r1.yzwy + r0.xyzx).xyz;
/*197*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*198*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*199*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*200*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*201*/	color0.w = 1.000000;
/*202*/	return;
}
