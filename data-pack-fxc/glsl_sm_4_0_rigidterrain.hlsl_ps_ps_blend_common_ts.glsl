//
//
// Shader Model 4
// Fragment Shader
//
// id: 1488 - fxc/glsl_SM_4_0_rigidterrain.hlsl_PS_ps_blend_common_ts.glsl
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

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;

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

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
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

/*0*/	r0.xyzw = (texture(s_alpha_map, vsOut_T0.xyxx.st)).xyzw;
/*1*/	r0.x = r0.x * 1.100000 + -0.100000;
/*2*/	r0.y = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.y != 0) discard;
/*4*/	r1.xyzw = (texture(s_blend_map, vsOut_T0.xyxx.st)).xyzw;
/*5*/	r0.y = dot(r1.xyzw, r1.xyzw);
/*6*/	r0.y = inversesqrt(r0.y);
/*7*/	r1.xyzw = r0.yyyy * r1.xyzw;
/*8*/	r2.xyzw = r1.xyzw * r0.xxxx + vec4(-0.000010, -0.000010, -0.000010, -0.000010);
/*9*/	r1.xyzw = r0.xxxx * r1.xyzw;
/*10*/	r2.xyzw = saturate(r2.xyzw * vec4(340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000));
/*11*/	r3.xyzw = cb2.data[3].xyzw * vec4(0.250000, 0.250000, 0.250000, 0.250000);
/*12*/	r3.xyzw = uintBitsToFloat(uvec4(r3.xyzw));
/*13*/	r0.yz = (vsOut_T1.xxyx / cb3.data[floatBitsToUint(r3.x)+1u].xxxx).yz;
/*14*/	r4.xy = (r2.xxxx * r0.yzyy).xy;
/*15*/	r5.xyzw = (texture(s_index_map, vsOut_T0.xyxx.st)).xyzw;
/*16*/	r5.xyzw = r0.xxxx * r5.xyzw;
/*17*/	r5.xyzw = saturate(r5.xyzw / r0.xxxx);
/*18*/	r5.xyzw = r5.xyzw + vec4(-0.001000, -0.001000, -0.001000, -0.001000);
/*19*/	r5.xyzw = max(r5.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000));
/*20*/	r6.xyzw = r5.xyzw * vec4(3.000000, 3.000000, 3.000000, 3.000000) + cb2.data[3].xyzw;
/*21*/	r6.xyzw = trunc(r6.xyzw);
/*22*/	r4.z = r6.x;
/*23*/	r7.xyzw = (texture(s_diffuse_array, r4.xyzx.stp, -0.660000)).xyzw;
/*24*/	r8.xyzw = r6.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*25*/	r4.w = r8.x;
/*26*/	r9.xyzw = (texture(s_diffuse_array, r4.xywx.stp, -0.660000)).xyzw;
/*27*/	r0.yzw = (-r7.xxyz + r9.xxyz).yzw;
/*28*/	r9.xyzw = r5.xyzw * vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*29*/	r5.xyzw = r5.xxyy + vec4(-0.001000, -0.001000, -0.001000, -0.001000);
/*30*/	r5.xyzw = max(r5.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000));
/*31*/	r9.xyzw = fract(r9.xyzw);
/*32*/	r0.yzw = (r9.xxxx * r0.yyzw + r7.xxyz).yzw;
/*33*/	r3.xy = (vsOut_T1.xyxx / cb3.data[floatBitsToUint(r3.y)+1u].xxxx).xy;
/*34*/	r7.xy = (r2.yyyy * r3.xyxx).xy;
/*35*/	r7.z = r6.y;
/*36*/	r10.xyzw = (texture(s_diffuse_array, r7.xyzx.stp, -0.660000)).xyzw;
/*37*/	r7.w = r8.y;
/*38*/	r11.xyzw = (texture(s_diffuse_array, r7.xywx.stp, -0.660000)).xyzw;
/*39*/	r11.xyz = (-r10.xyzx + r11.xyzx).xyz;
/*40*/	r10.xyz = (r9.yyyy * r11.xyzx + r10.xyzx).xyz;
/*41*/	r10.xyz = (r1.yyyy * r10.xyzx).xyz;
/*42*/	r0.yzw = (r0.yyzw * r1.xxxx + r10.xxyz).yzw;
/*43*/	r2.xy = (vsOut_T1.xyxx / cb3.data[floatBitsToUint(r3.z)+1u].xxxx).xy;
/*44*/	r3.xy = (vsOut_T1.xyxx / cb3.data[floatBitsToUint(r3.w)+1u].xxxx).xy;
/*45*/	r3.xy = (r2.wwww * r3.xyxx).xy;
/*46*/	r2.xy = (r2.zzzz * r2.xyxx).xy;
/*47*/	r2.z = r6.z;
/*48*/	r10.xyzw = (texture(s_diffuse_array, r2.xyzx.stp, -0.660000)).xyzw;
/*49*/	r2.w = r8.z;
/*50*/	r11.xyzw = (texture(s_diffuse_array, r2.xywx.stp, -0.660000)).xyzw;
/*51*/	r11.xyz = (-r10.xyzx + r11.xyzx).xyz;
/*52*/	r10.xyz = (r9.zzzz * r11.xyzx + r10.xyzx).xyz;
/*53*/	r0.yzw = (r10.xxyz * r1.zzzz + r0.yyzw).yzw;
/*54*/	r3.z = r6.w;
/*55*/	r10.xyzw = (texture(s_diffuse_array, r3.xyzx.stp, -0.660000)).xyzw;
/*56*/	r3.w = r8.w;
/*57*/	r11.xyzw = (texture(s_diffuse_array, r3.xywx.stp, -0.660000)).xyzw;
/*58*/	r11.xyz = (-r10.xyzx + r11.xyzx).xyz;
/*59*/	r10.xyz = (r9.wwww * r11.xyzx + r10.xyzx).xyz;
/*60*/	color0.xyz = (r10.xyzx * r1.wwww + r0.yzwy).xyz;
/*61*/	color0.w = r0.x;
/*62*/	r4.z = r6.x;
/*63*/	r10.xyzw = (texture(s_normal_array, r4.xyzx.stp)).xyzw;
/*64*/	r0.yz = (r10.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*65*/	r10.xz = (r0.yyzy * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*66*/	r0.y = dot(vec2(r10.xzxx), vec2(r10.xzxx));
/*67*/	r0.y = -r0.y + 1.000000;
/*68*/	r0.y = max(r0.y, 0.000000);
/*69*/	r10.y = sqrt(r0.y);
/*70*/	r4.w = r8.x;
/*71*/	r4.xyzw = (texture(s_normal_array, r4.xywx.stp)).xyzw;
/*72*/	r0.yz = (r4.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*73*/	r4.xz = (r0.yyzy * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*74*/	r0.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*75*/	r0.y = -r0.y + 1.000000;
/*76*/	r0.y = max(r0.y, 0.000000);
/*77*/	r4.y = sqrt(r0.y);
/*78*/	r0.yzw = (-r10.xxyz + r4.xxyz).yzw;
/*79*/	r0.yzw = (r9.xxxx * r0.yyzw + r10.xxyz).yzw;
/*80*/	r7.z = r6.y;
/*81*/	r4.xyzw = (texture(s_normal_array, r7.xyzx.stp)).xyzw;
/*82*/	r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*83*/	r4.xz = (r4.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*84*/	r4.w = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*85*/	r4.w = -r4.w + 1.000000;
/*86*/	r4.w = max(r4.w, 0.000000);
/*87*/	r4.y = sqrt(r4.w);
/*88*/	r7.w = r8.y;
/*89*/	r7.xyzw = (texture(s_normal_array, r7.xywx.stp)).xyzw;
/*90*/	r6.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*91*/	r6.xz = (r6.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*92*/	r4.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*93*/	r4.w = -r4.w + 1.000000;
/*94*/	r4.w = max(r4.w, 0.000000);
/*95*/	r6.y = sqrt(r4.w);
/*96*/	r6.xyz = (-r4.xyzx + r6.xyzx).xyz;
/*97*/	r4.xyz = (r9.yyyy * r6.xyzx + r4.xyzx).xyz;
/*98*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*99*/	r0.yzw = (r0.yyzw * r1.xxxx + r4.xxyz).yzw;
/*100*/	r3.z = r6.w;
/*101*/	r4.xyzw = (texture(s_normal_array, r3.xyzx.stp)).xyzw;
/*102*/	r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*103*/	r4.xz = (r4.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*104*/	r6.xyzw = (texture(s_normal_array, r2.xyzx.stp)).xyzw;
/*105*/	r6.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*106*/	r6.xz = (r6.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*107*/	r2.w = r8.z;
/*108*/	r3.xyzw = (texture(s_normal_array, r3.xywx.stp)).xyzw;
/*109*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*110*/	r3.xz = (r3.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*111*/	r2.xyzw = (texture(s_normal_array, r2.xywx.stp)).xyzw;
/*112*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*113*/	r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*114*/	r2.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*115*/	r2.w = -r2.w + 1.000000;
/*116*/	r2.w = max(r2.w, 0.000000);
/*117*/	r2.y = sqrt(r2.w);
/*118*/	r2.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*119*/	r2.w = -r2.w + 1.000000;
/*120*/	r2.w = max(r2.w, 0.000000);
/*121*/	r6.y = sqrt(r2.w);
/*122*/	r2.xyz = (-r6.xyzx + r2.xyzx).xyz;
/*123*/	r2.xyz = (r9.zzzz * r2.xyzx + r6.xyzx).xyz;
/*124*/	r0.yzw = (r2.xxyz * r1.zzzz + r0.yyzw).yzw;
/*125*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*126*/	r1.z = -r1.z + 1.000000;
/*127*/	r1.z = max(r1.z, 0.000000);
/*128*/	r3.y = sqrt(r1.z);
/*129*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*130*/	r1.z = -r1.z + 1.000000;
/*131*/	r1.z = max(r1.z, 0.000000);
/*132*/	r4.y = sqrt(r1.z);
/*133*/	r2.xyz = (-r4.xyzx + r3.xyzx).xyz;
/*134*/	r2.xyz = (r9.wwww * r2.xyzx + r4.xyzx).xyz;
/*135*/	r0.yzw = (r2.xxyz * r1.wwww + r0.yyzw).yzw;
/*136*/	r2.xyz = (r0.yzwy * vec4(1.000000, 1.000000, -1.000000, 0.000000)).xyz;
/*137*/	r0.yzw = (-r0.yyzw * vec4(0.000000, 1.000000, 1.000000, -1.000000) + vec4(0.000000, 0.000000, 1.000000, 0.000000)).yzw;
/*138*/	r1.zw = (vsOut_T1.xxxy + -cb0.data[0].xxxz).zw;
/*139*/	r1.z = dot(vec2(r1.zwzz), vec2(r1.zwzz));
/*140*/	r1.z = sqrt(r1.z);
/*141*/	r1.z = saturate(r1.z / cb2.data[5].x);
/*142*/	r0.yzw = (r1.zzzz * r0.yyzw + r2.xxyz).yzw;
/*143*/	r2.xz = (cb2.data[4].zzzz).xz/**/;
/*144*/	r2.y = 1.000000;
/*145*/	r0.yzw = (r0.yyzw * r2.xxyz).yzw;
/*146*/	r0.z = dot(vec3(r0.yzwy), vec3(r0.yzwy));
/*147*/	r0.z = inversesqrt(r0.z);
/*148*/	r1.zw = (vsOut_T1.xxxy / cb1.data[3].xxxy).zw;
/*149*/	r1.zw = (r1.zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000)).zw;
/*150*/	r2.xyzw = (texture(s_lf_normal_map, r1.zwzz.st)).xyzw;
/*151*/	r1.zw = (r2.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*152*/	r1.zw = (r1.zzzw * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*153*/	r2.x = dot(vec2(r1.zwzz), vec2(r1.zwzz));
/*154*/	r2.x = -r2.x + 1.000000;
/*155*/	r2.x = max(r2.x, 0.000000);
/*156*/	r2.y = sqrt(r2.x);
/*157*/	r3.yz = (vec4(0, 1.000000, -1.000000, 0)).yz;
/*158*/	r3.x = cb2.data[4].x/**/;
/*159*/	r2.xz = (r1.zzwz * r3.yyxy).xz;
/*160*/	r2.xyz = (r2.xyzx * r3.xyzx).xyz;
/*161*/	r1.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*162*/	r1.z = inversesqrt(r1.z);
/*163*/	r2.xyz = (r1.zzzz * r2.xyzx).xyz;
/*164*/	r3.xyzw = (texture(s_normal_map, vsOut_T0.xyxx.st)).xyzw;
/*165*/	r1.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*166*/	r1.zw = (r1.zzzw * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*167*/	r2.w = dot(vec2(r1.zwzz), vec2(r1.zwzz));
/*168*/	r2.w = -r2.w + 1.000000;
/*169*/	r2.w = max(r2.w, 0.000000);
/*170*/	r3.y = sqrt(r2.w);
/*171*/	r4.xy = (vsOut_T0.wzww * vec4(-1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*172*/	r3.z = dot(vec2(r1.zwzz), vec2(r4.xyxx));
/*173*/	r3.x = dot(vec2(r1.zwzz), vec2(vsOut_T0.zwzz));
/*174*/	r4.xz = (cb2.data[4].yyyy).xz/**/;
/*175*/	r4.y = 1.000000;
/*176*/	r3.xyz = (r3.xyzx * r4.xyzx).xyz;
/*177*/	r1.z = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*178*/	r1.z = inversesqrt(r1.z);
/*179*/	r2.xz = (r3.xxzx * r1.zzzz + r2.xxzx).xz;
/*180*/	r1.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*181*/	r1.z = inversesqrt(r1.z);
/*182*/	r2.xyz = (r1.zzzz * r2.xyzx).xyz;
/*183*/	r2.xyz = (r0.xxxx * r2.xyzx).xyz;
/*184*/	color1.xz = (r0.yywy * r0.zzzz + r2.xxzx).xz;
/*185*/	color1.y = r2.y;
/*186*/	color1.w = 0;
/*187*/	r0.xyzw = r5.xyzw * vec4(3.000000, 3.000000, 3.000000, 3.000000) + cb2.data[3].xxyy;
/*188*/	r1.zw = (r5.yyyw * vec4(0.000000, 0.000000, 3.000000, 3.000000)).zw;
/*189*/	r1.zw = (fract(r1.zzzw)).zw;
/*190*/	r0.xyzw = trunc(r0.xyzw);
/*191*/	r0.xyzw = r0.xyzw + vec4(0.500000, 1.500000, 0.500000, 1.500000);
/*192*/	r0.xyzw = r0.zxwy / cb3.data[0].xxxx;
/*193*/	r2.xz = (r0.yywy).xz;
/*194*/	r2.yw = (vec4(0, 0.500000, 0, 0.500000)).yw;
/*195*/	r3.xyzw = (texture(s_light_params, r2.zwzz.st)).xyzw;
/*196*/	r2.xyzw = (texture(s_light_params, r2.xyxx.st)).xyzw;
/*197*/	r2.zw = (-r2.xxxy + r3.xxxy).zw;
/*198*/	r2.xy = (r1.zzzz * r2.zwzz + r2.xyxx).xy;
/*199*/	r0.yw = (vec4(0, 0.500000, 0, 0.500000)).yw;
/*200*/	r3.xyzw = (texture(s_light_params, r0.zwzz.st)).xyzw;
/*201*/	r0.xyzw = (texture(s_light_params, r0.xyxx.st)).xyzw;
/*202*/	r0.zw = (-r0.xxxy + r3.xxxy).zw;
/*203*/	r2.zw = (r1.wwww * r0.zzzw + r0.xxxy).zw;
/*204*/	color2.x = dot(vec2(r2.xzxx), vec2(r1.xyxx));
/*205*/	color2.y = dot(vec2(r2.ywyy), vec2(r1.xyxx));
/*206*/	color2.zw = (vec4(0, 0, 0, 0)).zw;
/*207*/	return;
}
