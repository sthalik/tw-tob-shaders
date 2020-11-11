//
//
// Shader Model 4
// Fragment Shader
//
// id: 1494 - fxc/glsl_SM_4_0_rigidterrain.hlsl_PS_ps30_far_blend.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_T1;
flat in vec4 vsOut_T2;
flat in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;

uniform sampler2D s_alpha_map;
uniform sampler2D s_blend_map;
uniform sampler2D s_index_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_lf_normal_map;
uniform sampler2DArray s_diffuse_array;
uniform sampler2DArray s_normal_array;

layout(std140) uniform vs_height_map_cb
{
  vec4 data[6];
} cb0;
layout(std140) uniform ps_height_map_cb
{
  vec4 data[9];
} cb1;
layout(std140) uniform ps_texture_array_cb
{
  vec4 data[405];
} cb2;
layout(std140) uniform ps_mapping_array
{
  vec4 data[2048];
} cb3;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  const vec4 c[4] = vec4[4](
    vec4(1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 1.00000000000000, -1.00000000000000, 0.00000000000000),
    vec4(-1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, -1.00000000000000, 1.00000000000000, 0.00000000000000)
  );
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = vsOut_T0.xxyy + -vsOut_T1.xxyy;
/*1*/	r1.xyzw = -vsOut_T1.xxyy + vsOut_T1.zzww;
/*2*/	r0.xyzw = r0.xyzw / r1.xyzw;
/*3*/	r0.xyzw = r0.xyzw + vec4(-0.500000, -0.500000, -0.500000, -0.500000);
/*4*/	r1.x = vsOut_T2.x + 0.100000;
/*5*/	r1.x = floor(r1.x);
/*6*/	r1.x = intBitsToFloat(int(r1.x));
/*7*/	r0.xyzw = r0.xyzw * c[uint(floatBitsToInt(r1.x))].xyzx;
/*8*/	r0.xy = (r0.zwzz + r0.xyxx).xy;
/*9*/	r0.xy = (r0.xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*10*/	r2.xyzw = (texture(s_alpha_map, r0.xyxx.st)).xyzw;
/*11*/	r0.z = r2.x * 1.100000 + -0.100000;
/*12*/	r0.w = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*13*/	if(r0.w != 0) discard;
/*14*/	r2.xyzw = (texture(s_index_map, r0.xyxx.st)).xyzw;
/*15*/	r2.xyzw = r0.zzzz * r2.xyzw;
/*16*/	r2.xyzw = saturate(r2.xyzw / r0.zzzz);
/*17*/	r2.xyzw = r2.xyzw + vec4(-0.001000, -0.001000, -0.001000, -0.001000);
/*18*/	r2.xyzw = max(r2.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000));
/*19*/	r3.xyzw = r2.xyzw * vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*20*/	r0.w = cb2.data[401].y * cb2.data[402].x;
/*21*/	r0.w = r0.w * cb2.data[401].x + vsOut_T2.y;
/*22*/	r0.w = cb2.data[402].y * cb2.data[401].x + r0.w;
/*23*/	r4.xyzw = cb2.data[401].zzzz * r0.wwww + vsOut_T3.xyzw;
/*24*/	r4.xyzw = uintBitsToFloat(uvec4(r4.xyzw));
/*25*/	r0.w = cb3.data[floatBitsToUint(r4.x)].x * 4.000000 + r3.x;
/*26*/	r5.z = trunc(r0.w);
/*27*/	r5.w = r5.z + 1.000000;
/*28*/	r6.xyzw = (texture(s_blend_map, r0.xyxx.st)).xyzw;
/*29*/	r7.xyzw = (texture(s_normal_map, r0.xyxx.st)).xyzw;
/*30*/	r7.xyzw = r7.wwyy + vec4(0.001961, 0.001961, 0.001961, 0.001961);
/*31*/	r7.xyzw = r7.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(-1.000000, -1.000000, -1.000000, -1.000000);
/*32*/	r0.x = dot(r6.xyzw, r6.xyzw);
/*33*/	r0.x = inversesqrt(r0.x);
/*34*/	r6.xyzw = r0.xxxx * r6.xyzw;
/*35*/	r8.xyzw = r6.xyzw * r0.zzzz + vec4(-0.000010, -0.000010, -0.000010, -0.000010);
/*36*/	r6.xyzw = r0.zzzz * r6.xyzw;
/*37*/	r8.xyzw = saturate(r8.xyzw * vec4(340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000, 340282346638528860000000000000000000000.000000));
/*38*/	r0.x = uintBitsToFloat(uint(cb3.data[floatBitsToUint(r4.x)].x));
/*39*/	r0.xy = (vsOut_T0.xyxx / cb2.data[floatBitsToUint(r0.x)+1u].xxxx).xy;
/*40*/	r5.xy = (r8.xxxx * r0.xyxx).xy;
/*41*/	r9.xyzw = (texture(s_diffuse_array, r5.xywx.stp, -0.660000)).xyzw;
/*42*/	r10.xyzw = (texture(s_diffuse_array, r5.xyzx.stp, -0.660000)).xyzw;
/*43*/	r0.xyw = (r9.xyxz + -r10.xyxz).xyw;
/*44*/	r9.xyzw = fract(r3.xyzw);
/*45*/	r0.xyw = (r9.xxxx * r0.xyxw + r10.xyxz).xyw;
/*46*/	r1.y = uintBitsToFloat(uint(cb3.data[floatBitsToUint(r4.y)].x));
/*47*/	r1.yz = (vsOut_T0.xxyx / cb2.data[floatBitsToUint(r1.y)+1u].xxxx).yz;
/*48*/	r10.xy = (r8.yyyy * r1.yzyy).xy;
/*49*/	r1.y = cb3.data[floatBitsToUint(r4.y)].x * 4.000000 + r3.y;
/*50*/	r10.z = trunc(r1.y);
/*51*/	r10.w = r10.z + 1.000000;
/*52*/	r11.xyzw = (texture(s_diffuse_array, r10.xyzx.stp, -0.660000)).xyzw;
/*53*/	r12.xyzw = (texture(s_diffuse_array, r10.xywx.stp, -0.660000)).xyzw;
/*54*/	r1.yzw = (-r11.xxyz + r12.xxyz).yzw;
/*55*/	r1.yzw = (r9.yyyy * r1.yyzw + r11.xxyz).yzw;
/*56*/	r1.yzw = (r6.yyyy * r1.yyzw).yzw;
/*57*/	r0.xyw = (r0.xyxw * r6.xxxx + r1.yzyw).xyw;
/*58*/	r1.y = uintBitsToFloat(uint(cb3.data[floatBitsToUint(r4.z)].x));
/*59*/	r1.yz = (vsOut_T0.xxyx / cb2.data[floatBitsToUint(r1.y)+1u].xxxx).yz;
/*60*/	r11.xy = (r8.zzzz * r1.yzyy).xy;
/*61*/	r1.y = cb3.data[floatBitsToUint(r4.z)].x * 4.000000 + r3.z;
/*62*/	r1.z = cb3.data[floatBitsToUint(r4.w)].x * 4.000000 + r3.w;
/*63*/	r3.z = trunc(r1.z);
/*64*/	r11.z = trunc(r1.y);
/*65*/	r11.w = r11.z + 1.000000;
/*66*/	r12.xyzw = (texture(s_diffuse_array, r11.xyzx.stp, -0.660000)).xyzw;
/*67*/	r13.xyzw = (texture(s_diffuse_array, r11.xywx.stp, -0.660000)).xyzw;
/*68*/	r1.yzw = (-r12.xxyz + r13.xxyz).yzw;
/*69*/	r1.yzw = (r9.zzzz * r1.yyzw + r12.xxyz).yzw;
/*70*/	r0.xyw = (r1.yzyw * r6.zzzz + r0.xyxw).xyw;
/*71*/	r1.y = uintBitsToFloat(uint(cb3.data[floatBitsToUint(r4.w)].x));
/*72*/	r1.yz = (vsOut_T0.xxyx / cb2.data[floatBitsToUint(r1.y)+1u].xxxx).yz;
/*73*/	r3.xy = (r8.wwww * r1.yzyy).xy;
/*74*/	r3.w = r3.z + 1.000000;
/*75*/	r8.xyzw = (texture(s_diffuse_array, r3.xyzx.stp, -0.660000)).xyzw;
/*76*/	r12.xyzw = (texture(s_diffuse_array, r3.xywx.stp, -0.660000)).xyzw;
/*77*/	r1.yzw = (-r8.xxyz + r12.xxyz).yzw;
/*78*/	r1.yzw = (r9.wwww * r1.yyzw + r8.xxyz).yzw;
/*79*/	color0.xyz = (r1.yzwy * r6.wwww + r0.xywx).xyz;
/*80*/	color0.w = r0.z;
/*81*/	r8.x = 4.000000 * cb3.data[floatBitsToUint(r4.x)].x;
/*82*/	r8.y = 4.000000 * cb3.data[floatBitsToUint(r4.y)].x;
/*83*/	r8.z = 4.000000 * cb3.data[floatBitsToUint(r4.z)].x;
/*84*/	r8.w = 4.000000 * cb3.data[floatBitsToUint(r4.w)].x;
/*85*/	r2.xyzw = r2.xyzw * vec4(3.000000, 3.000000, 3.000000, 3.000000) + r8.xyzw;
/*86*/	r2.xyzw = trunc(r2.xyzw);
/*87*/	r5.z = r2.x;
/*88*/	r4.xyzw = (texture(s_normal_array, r5.xyzx.stp)).xyzw;
/*89*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*90*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*91*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*92*/	r0.x = -r0.x + 1.000000;
/*93*/	r0.x = max(r0.x, 0.000000);
/*94*/	r4.z = sqrt(r0.x);
/*95*/	r8.xyzw = r2.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*96*/	r5.w = r8.x;
/*97*/	r5.xyzw = (texture(s_normal_array, r5.xywx.stp)).xyzw;
/*98*/	r0.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*99*/	r5.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*100*/	r0.x = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*101*/	r0.x = -r0.x + 1.000000;
/*102*/	r0.x = max(r0.x, 0.000000);
/*103*/	r5.z = sqrt(r0.x);
/*104*/	r0.xyw = (-r4.xyxz + r5.xyxz).xyw;
/*105*/	r0.xyw = (r9.xxxx * r0.xyxw + r4.xyxz).xyw;
/*106*/	r10.z = r2.y;
/*107*/	r4.xyzw = (texture(s_normal_array, r10.xyzx.stp)).xyzw;
/*108*/	r1.yz = (r4.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*109*/	r4.xy = (r1.yzyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*110*/	r1.y = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*111*/	r1.y = -r1.y + 1.000000;
/*112*/	r1.y = max(r1.y, 0.000000);
/*113*/	r4.z = sqrt(r1.y);
/*114*/	r10.w = r8.y;
/*115*/	r5.xyzw = (texture(s_normal_array, r10.xywx.stp)).xyzw;
/*116*/	r1.yz = (r5.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*117*/	r5.xy = (r1.yzyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*118*/	r1.y = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*119*/	r1.y = -r1.y + 1.000000;
/*120*/	r1.y = max(r1.y, 0.000000);
/*121*/	r5.z = sqrt(r1.y);
/*122*/	r1.yzw = (-r4.xxyz + r5.xxyz).yzw;
/*123*/	r1.yzw = (r9.yyyy * r1.yyzw + r4.xxyz).yzw;
/*124*/	r1.yzw = (r6.yyyy * r1.yyzw).yzw;
/*125*/	r0.xyw = (r0.xyxw * r6.xxxx + r1.yzyw).xyw;
/*126*/	r11.z = r2.z;
/*127*/	r3.z = r2.w;
/*128*/	r2.xyzw = (texture(s_normal_array, r3.xyzx.stp)).xyzw;
/*129*/	r1.yz = (r2.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*130*/	r2.xy = (r1.yzyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*131*/	r4.xyzw = (texture(s_normal_array, r11.xyzx.stp)).xyzw;
/*132*/	r1.yz = (r4.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*133*/	r4.xy = (r1.yzyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*134*/	r11.w = r8.z;
/*135*/	r3.w = r8.w;
/*136*/	r3.xyzw = (texture(s_normal_array, r3.xywx.stp)).xyzw;
/*137*/	r1.yz = (r3.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*138*/	r3.xy = (r1.yzyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*139*/	r5.xyzw = (texture(s_normal_array, r11.xywx.stp)).xyzw;
/*140*/	r1.yz = (r5.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*141*/	r5.xy = (r1.yzyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*142*/	r1.y = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*143*/	r1.y = -r1.y + 1.000000;
/*144*/	r1.y = max(r1.y, 0.000000);
/*145*/	r5.z = sqrt(r1.y);
/*146*/	r1.y = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*147*/	r1.y = -r1.y + 1.000000;
/*148*/	r1.y = max(r1.y, 0.000000);
/*149*/	r4.z = sqrt(r1.y);
/*150*/	r1.yzw = (-r4.xxyz + r5.xxyz).yzw;
/*151*/	r1.yzw = (r9.zzzz * r1.yyzw + r4.xxyz).yzw;
/*152*/	r0.xyw = (r1.yzyw * r6.zzzz + r0.xyxw).xyw;
/*153*/	r1.y = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*154*/	r1.y = -r1.y + 1.000000;
/*155*/	r1.y = max(r1.y, 0.000000);
/*156*/	r3.z = sqrt(r1.y);
/*157*/	r1.y = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*158*/	r1.y = -r1.y + 1.000000;
/*159*/	r1.y = max(r1.y, 0.000000);
/*160*/	r2.z = sqrt(r1.y);
/*161*/	r1.yzw = (-r2.xxyz + r3.xxyz).yzw;
/*162*/	r1.yzw = (r9.wwww * r1.yyzw + r2.xxyz).yzw;
/*163*/	r0.xyw = (r1.ywyz * r6.wwww + r0.xwxy).xyw;
/*164*/	r2.yz = (vec4(0, 1.000000, -1.000000, 0)).yz;
/*165*/	r2.x = cb1.data[4].z/**/;
/*166*/	r0.xw = (r0.xxxw * r2.yyyx).xw;
/*167*/	r0.xyw = (r0.xyxw * r2.xyxz).xyw;
/*168*/	r0.y = dot(vec3(r0.xywx), vec3(r0.xywx));
/*169*/	r0.y = inversesqrt(r0.y);
/*170*/	r1.xyzw = r7.xyzw * c[uint(floatBitsToInt(r1.x))].xzyx;
/*171*/	r2.x = dot(vec2(r7.ywyy), vec2(r7.ywyy));
/*172*/	r2.x = -r2.x + 1.000000;
/*173*/	r2.x = max(r2.x, 0.000000);
/*174*/	r2.y = sqrt(r2.x);
/*175*/	r2.xz = (r1.zzwz + r1.xxyx).xz;
/*176*/	r1.xz = (cb1.data[4].yyyy).xz/**/;
/*177*/	r1.y = 1.000000;
/*178*/	r1.xyz = (r1.xyzx * r2.xyzx).xyz;
/*179*/	r1.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*180*/	r1.y = inversesqrt(r1.y);
/*181*/	r2.xy = (vsOut_T0.xyxx / cb0.data[3].xyxx).xy;
/*182*/	r2.xy = (r2.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*183*/	r2.xyzw = (texture(s_lf_normal_map, r2.xyxx.st)).xyzw;
/*184*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*185*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*186*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*187*/	r1.w = -r1.w + 1.000000;
/*188*/	r1.w = max(r1.w, 0.000000);
/*189*/	r3.y = sqrt(r1.w);
/*190*/	r4.yz = (vec4(0, 1.000000, -1.000000, 0)).yz;
/*191*/	r4.x = cb1.data[4].x/**/;
/*192*/	r3.xz = (r2.xxyx * r4.yyxy).xz;
/*193*/	r2.xyz = (r3.xyzx * r4.xyzx).xyz;
/*194*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*195*/	r1.w = inversesqrt(r1.w);
/*196*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*197*/	r2.xz = (r1.xxzx * r1.yyyy + r2.xxzx).xz;
/*198*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*199*/	r1.x = inversesqrt(r1.x);
/*200*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*201*/	r1.xyz = (r0.zzzz * r1.xyzx).xyz;
/*202*/	color1.xz = (r0.xxwx * r0.yyyy + r1.xxzx).xz;
/*203*/	color1.y = r1.y;
/*204*/	color1.w = r0.z;
/*205*/	color2.w = r0.z;
/*206*/	r1.xyzw = vsOut_T3.xyzw + -cb2.data[403].xxxx;
/*207*/	r1.xyzw = min(abs(r1.xyzw), vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*208*/	r1.xyzw = -r1.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*209*/	r1.xyzw = r6.xyzw * r1.xyzw;
/*210*/	r0.x = dot(r1.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*211*/	r1.xyzw = vsOut_T3.xyzw + -cb2.data[403].yyyy;
/*212*/	r1.xyzw = min(abs(r1.xyzw), vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*213*/	r1.xyzw = -r1.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*214*/	r1.xyzw = r6.xyzw * r1.xyzw;
/*215*/	r0.y = dot(r1.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*216*/	r0.xy = (-r0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*217*/	r0.x = r0.y * r0.x;
/*218*/	r1.xyzw = vsOut_T3.xyzw + -cb2.data[403].zzzz;
/*219*/	r1.xyzw = min(abs(r1.xyzw), vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*220*/	r1.xyzw = -r1.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*221*/	r1.xyzw = r6.xyzw * r1.xyzw;
/*222*/	r0.y = dot(r1.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*223*/	r0.y = -r0.y + 1.000000;
/*224*/	r0.x = r0.y * r0.x;
/*225*/	r1.xyzw = vsOut_T3.xyzw + -cb2.data[403].wwww;
/*226*/	r1.xyzw = min(abs(r1.xyzw), vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*227*/	r1.xyzw = -r1.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*228*/	r1.xyzw = r6.xyzw * r1.xyzw;
/*229*/	r0.y = dot(r1.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*230*/	r0.y = -r0.y + 1.000000;
/*231*/	r0.x = r0.y * r0.x;
/*232*/	color2.z = r0.z * r0.x;
/*233*/	color2.xy = (vec4(0, 0, 0, 0)).xy;
/*234*/	return;
}
