//
//
// Shader Model 4
// Fragment Shader
//
// id: 1523 - fxc/glsl_SM_4_0_depth_of_field.hlsl_PS_pixel_dof_horizontal_blur.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D input_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r14;
  vec4 r15;
  vec4 r16;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.yw = (vec4(0, 0, 0, 0)).yw;
/*1*/	r1.xyzw = vec4(-12.000000, -14.000000, -11.000000, -13.000000) / cb0.data[27].xxxx;
/*2*/	r0.xz = (r1.yywy).xz;
/*3*/	r2.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*4*/	r0.xyzw = r2.xyxy * cb0.data[27].zwzw + r0.xyzw;
/*5*/	r3.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*6*/	r0.xyzw = (textureLod(input_sampler, r0.xyxx.st, r0.y)).xyzw;
/*7*/	r3.xyz = saturate(r3.xyzx).xyz;
/*8*/	r2.z = r3.w * 0.010160;
/*9*/	r3.xyz = (r3.xyzx * r2.zzzz).xyz;
/*10*/	r2.z = r0.w * 0.007713 + r2.z;
/*11*/	r0.xyz = saturate(r0.xyzx).xyz;
/*12*/	r0.w = r0.w * 0.007713;
/*13*/	r0.xyz = (r0.wwww * r0.xyzx + r3.xyzx).xyz;
/*14*/	r1.yw = (vec4(0, 0, 0, 0)).yw;
/*15*/	r1.xyzw = r2.xyxy * cb0.data[27].zwzw + r1.xyzw;
/*16*/	r3.xyzw = (textureLod(input_sampler, r1.xyxx.st, r1.y)).xyzw;
/*17*/	r1.xyzw = (textureLod(input_sampler, r1.zwzz.st, r1.w)).xyzw;
/*18*/	r3.xyz = saturate(r3.xyzx).xyz;
/*19*/	r0.w = r3.w * 0.013112;
/*20*/	r2.z = r3.w * 0.013112 + r2.z;
/*21*/	r2.z = r1.w * 0.016580 + r2.z;
/*22*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*23*/	r1.xyz = saturate(r1.xyzx).xyz;
/*24*/	r0.w = r1.w * 0.016580;
/*25*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*26*/	r1.yw = (vec4(0, 0, 0, 0)).yw;
/*27*/	r3.xyzw = vec4(-8.000000, -10.000000, -7.000000, -9.000000) / cb0.data[27].xxxx;
/*28*/	r1.xz = (r3.yywy).xz;
/*29*/	r1.xyzw = r2.xyxy * cb0.data[27].zwzw + r1.xyzw;
/*30*/	r4.xyzw = (textureLod(input_sampler, r1.xyxx.st, r1.y)).xyzw;
/*31*/	r1.xyzw = (textureLod(input_sampler, r1.zwzz.st, r1.w)).xyzw;
/*32*/	r4.xyz = saturate(r4.xyzx).xyz;
/*33*/	r0.w = r4.w * 0.020543;
/*34*/	r2.z = r4.w * 0.020543 + r2.z;
/*35*/	r2.z = r1.w * 0.024938 + r2.z;
/*36*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*37*/	r1.xyz = saturate(r1.xyzx).xyz;
/*38*/	r0.w = r1.w * 0.024938;
/*39*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*40*/	r3.yw = (vec4(0, 0, 0, 0)).yw;
/*41*/	r1.xyzw = r2.xyxy * cb0.data[27].zwzw + r3.xyzw;
/*42*/	r3.xyzw = (textureLod(input_sampler, r1.xyxx.st, r1.y)).xyzw;
/*43*/	r1.xyzw = (textureLod(input_sampler, r1.zwzz.st, r1.w)).xyzw;
/*44*/	r3.xyz = saturate(r3.xyzx).xyz;
/*45*/	r0.w = r3.w * 0.029661;
/*46*/	r2.z = r3.w * 0.029661 + r2.z;
/*47*/	r2.z = r1.w * 0.034567 + r2.z;
/*48*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*49*/	r1.xyz = saturate(r1.xyzx).xyz;
/*50*/	r0.w = r1.w * 0.034567;
/*51*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*52*/	r1.yw = (vec4(0, 0, 0, 0)).yw;
/*53*/	r3.xyzw = vec4(-4.000000, -6.000000, -3.000000, -5.000000) / cb0.data[27].xxxx;
/*54*/	r1.xz = (r3.yywy).xz;
/*55*/	r1.xyzw = r2.xyxy * cb0.data[27].zwzw + r1.xyzw;
/*56*/	r4.xyzw = (textureLod(input_sampler, r1.xyxx.st, r1.y)).xyzw;
/*57*/	r1.xyzw = (textureLod(input_sampler, r1.zwzz.st, r1.w)).xyzw;
/*58*/	r4.xyz = saturate(r4.xyzx).xyz;
/*59*/	r0.w = r4.w * 0.039471;
/*60*/	r2.z = r4.w * 0.039471 + r2.z;
/*61*/	r2.z = r1.w * 0.044159 + r2.z;
/*62*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*63*/	r1.xyz = saturate(r1.xyzx).xyz;
/*64*/	r0.w = r1.w * 0.044159;
/*65*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*66*/	r3.yw = (vec4(0, 0, 0, 0)).yw;
/*67*/	r1.xyzw = r2.xyxy * cb0.data[27].zwzw + r3.xyzw;
/*68*/	r3.xyzw = (textureLod(input_sampler, r1.xyxx.st, r1.y)).xyzw;
/*69*/	r1.xyzw = (textureLod(input_sampler, r1.zwzz.st, r1.w)).xyzw;
/*70*/	r3.xyz = saturate(r3.xyzx).xyz;
/*71*/	r0.w = r3.w * 0.048407;
/*72*/	r2.z = r3.w * 0.048407 + r2.z;
/*73*/	r2.z = r1.w * 0.051991 + r2.z;
/*74*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*75*/	r1.xyz = saturate(r1.xyzx).xyz;
/*76*/	r0.w = r1.w * 0.051991;
/*77*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*78*/	r1.yw = (vec4(0, 0, 0, 0)).yw;
/*79*/	r3.xyzw = vec4(3.000000, -2.000000, -1.000000, 2.000000) / cb0.data[27].xxxx;
/*80*/	r1.xz = (r3.yyzy).xz;
/*81*/	r1.xyzw = r2.xyxy * cb0.data[27].zwzw + r1.xyzw;
/*82*/	r4.xyzw = (textureLod(input_sampler, r1.xyxx.st, r1.y)).xyzw;
/*83*/	r1.xyzw = (textureLod(input_sampler, r1.zwzz.st, r1.w)).xyzw;
/*84*/	r4.xyz = saturate(r4.xyzx).xyz;
/*85*/	r0.w = r4.w * 0.054712;
/*86*/	r2.z = r4.w * 0.054712 + r2.z;
/*87*/	r2.z = r1.w * 0.056413 + r2.z;
/*88*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*89*/	r1.xyz = saturate(r1.xyzx).xyz;
/*90*/	r0.w = r1.w * 0.056413;
/*91*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*92*/	r1.xy = (r2.xyxx * cb0.data[27].zwzz).xy;
/*93*/	r1.xyzw = (textureLod(input_sampler, r1.xyxx.st, r1.y)).xyzw;
/*94*/	r0.w = r1.w * 0.056992;
/*95*/	r1.xyz = saturate(r1.xyzx).xyz;
/*96*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*97*/	r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb0.data[27].x)).x;
/*98*/	r4.yw = (vec4(0, 0, 0, 0)).yw;
/*99*/	r4.xy = (r2.xyxx * cb0.data[27].zwzz + r4.xyxx).xy;
/*100*/	r5.xyzw = (textureLod(input_sampler, r4.xyxx.st, r4.y)).xyzw;
/*101*/	r5.xyz = saturate(r5.xyzx).xyz;
/*102*/	r0.w = r5.w * 0.056413;
/*103*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*104*/	r4.z = r3.w;
/*105*/	r4.xy = (r2.xyxx * cb0.data[27].zwzz + r4.zwzz).xy;
/*106*/	r4.xyzw = (textureLod(input_sampler, r4.xyxx.st, r4.y)).xyzw;
/*107*/	r4.xyz = saturate(r4.xyzx).xyz;
/*108*/	r0.w = r4.w * 0.054712;
/*109*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*110*/	r3.yw = (vec4(0, 0, 0, 0)).yw;
/*111*/	r3.xy = (r2.xyxx * cb0.data[27].zwzz + r3.xyxx).xy;
/*112*/	r6.xyzw = (textureLod(input_sampler, r3.xyxx.st, r3.y)).xyzw;
/*113*/	r6.xyz = saturate(r6.xyzx).xyz;
/*114*/	r0.w = r6.w * 0.051991;
/*115*/	r0.xyz = (r0.wwww * r6.xyzx + r0.xyzx).xyz;
/*116*/	r7.xyzw = vec4(7.000000, 4.000000, 5.000000, 6.000000) / cb0.data[27].xxxx;
/*117*/	r3.z = r7.y;
/*118*/	r3.xy = (r2.xyxx * cb0.data[27].zwzz + r3.zwzz).xy;
/*119*/	r3.xyzw = (textureLod(input_sampler, r3.xyxx.st, r3.y)).xyzw;
/*120*/	r3.xyz = saturate(r3.xyzx).xyz;
/*121*/	r0.w = r3.w * 0.048407;
/*122*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*123*/	r8.xz = (r7.zzwz).xz;
/*124*/	r8.yw = (vec4(0, 0, 0, 0)).yw;
/*125*/	r8.xyzw = r2.xyxy * cb0.data[27].zwzw + r8.xyzw;
/*126*/	r9.xyzw = (textureLod(input_sampler, r8.xyxx.st, r8.y)).xyzw;
/*127*/	r8.xyzw = (textureLod(input_sampler, r8.zwzz.st, r8.w)).xyzw;
/*128*/	r9.xyz = saturate(r9.xyzx).xyz;
/*129*/	r0.w = r9.w * 0.044159;
/*130*/	r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*131*/	r8.xyz = saturate(r8.xyzx).xyz;
/*132*/	r0.w = r8.w * 0.039471;
/*133*/	r0.xyz = (r0.wwww * r8.xyzx + r0.xyzx).xyz;
/*134*/	r7.yw = (vec4(0, 0, 0, 0)).yw;
/*135*/	r3.xy = (r2.xyxx * cb0.data[27].zwzz + r7.xyxx).xy;
/*136*/	r10.xyzw = (textureLod(input_sampler, r3.xyxx.st, r3.y)).xyzw;
/*137*/	r10.xyz = saturate(r10.xyzx).xyz;
/*138*/	r0.w = r10.w * 0.034567;
/*139*/	r0.xyz = (r0.wwww * r10.xyzx + r0.xyzx).xyz;
/*140*/	r11.xyzw = vec4(11.000000, 8.000000, 9.000000, 10.000000) / cb0.data[27].xxxx;
/*141*/	r7.z = r11.y;
/*142*/	r3.xy = (r2.xyxx * cb0.data[27].zwzz + r7.zwzz).xy;
/*143*/	r7.xyzw = (textureLod(input_sampler, r3.xyxx.st, r3.y)).xyzw;
/*144*/	r7.xyz = saturate(r7.xyzx).xyz;
/*145*/	r0.w = r7.w * 0.029661;
/*146*/	r0.xyz = (r0.wwww * r7.xyzx + r0.xyzx).xyz;
/*147*/	r12.xz = (r11.zzwz).xz;
/*148*/	r12.yw = (vec4(0, 0, 0, 0)).yw;
/*149*/	r12.xyzw = r2.xyxy * cb0.data[27].zwzw + r12.xyzw;
/*150*/	r13.xyzw = (textureLod(input_sampler, r12.xyxx.st, r12.y)).xyzw;
/*151*/	r12.xyzw = (textureLod(input_sampler, r12.zwzz.st, r12.w)).xyzw;
/*152*/	r13.xyz = saturate(r13.xyzx).xyz;
/*153*/	r0.w = r13.w * 0.024938;
/*154*/	r0.xyz = (r0.wwww * r13.xyzx + r0.xyzx).xyz;
/*155*/	r12.xyz = saturate(r12.xyzx).xyz;
/*156*/	r0.w = r12.w * 0.020543;
/*157*/	r0.xyz = (r0.wwww * r12.xyzx + r0.xyzx).xyz;
/*158*/	r11.y = 0;
/*159*/	r3.xy = (r2.xyxx * cb0.data[27].zwzz + r11.xyxx).xy;
/*160*/	r11.xyzw = (textureLod(input_sampler, r3.xyxx.st, r3.y)).xyzw;
/*161*/	r11.xyz = saturate(r11.xyzx).xyz;
/*162*/	r0.w = r11.w * 0.016580;
/*163*/	r0.xyz = (r0.wwww * r11.xyzx + r0.xyzx).xyz;
/*164*/	r14.xyz = (vec4(12.000000, 13.000000, 14.000000, 0.000000) / cb0.data[27].xxxx).xyz;
/*165*/	r14.w = 0;
/*166*/	r15.xyzw = r2.xyxy * cb0.data[27].zwzw + r14.xwyw;
/*167*/	r2.xy = (r2.xyxx * cb0.data[27].zwzz + r14.zwzz).xy;
/*168*/	r14.xyzw = (textureLod(input_sampler, r2.xyxx.st, r2.y)).xyzw;
/*169*/	r16.xyzw = (textureLod(input_sampler, r15.xyxx.st, r15.y)).xyzw;
/*170*/	r15.xyzw = (textureLod(input_sampler, r15.zwzz.st, r15.w)).xyzw;
/*171*/	r16.xyz = saturate(r16.xyzx).xyz;
/*172*/	r0.w = r16.w * 0.013112;
/*173*/	r0.xyz = (r0.wwww * r16.xyzx + r0.xyzx).xyz;
/*174*/	r15.xyz = saturate(r15.xyzx).xyz;
/*175*/	r0.w = r15.w * 0.010160;
/*176*/	r0.xyz = (r0.wwww * r15.xyzx + r0.xyzx).xyz;
/*177*/	r14.xyz = saturate(r14.xyzx).xyz;
/*178*/	r0.w = r14.w * 0.007713;
/*179*/	r0.xyz = (r0.wwww * r14.xyzx + r0.xyzx).xyz;
/*180*/	r0.w = r1.w * 0.056992 + r2.z;
/*181*/	r0.w = r5.w * 0.056413 + r0.w;
/*182*/	r0.w = r4.w * 0.054712 + r0.w;
/*183*/	r0.w = r6.w * 0.051991 + r0.w;
/*184*/	r0.w = r3.w * 0.048407 + r0.w;
/*185*/	r0.w = r9.w * 0.044159 + r0.w;
/*186*/	r0.w = r8.w * 0.039471 + r0.w;
/*187*/	r0.w = r10.w * 0.034567 + r0.w;
/*188*/	r0.w = r7.w * 0.029661 + r0.w;
/*189*/	r0.w = r13.w * 0.024938 + r0.w;
/*190*/	r0.w = r12.w * 0.020543 + r0.w;
/*191*/	r0.w = r11.w * 0.016580 + r0.w;
/*192*/	r0.w = r16.w * 0.013112 + r0.w;
/*193*/	r0.w = r15.w * 0.010160 + r0.w;
/*194*/	r0.w = r14.w * 0.007713 + r0.w;
/*195*/	r0.w = r0.w + 0.000000;
/*196*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*197*/	r0.xyz = (-r1.xyzx + r0.xyzx).xyz;
/*198*/	color0.xyz = (r1.wwww * r0.xyzx + r1.xyzx).xyz;
/*199*/	color0.w = r1.w;
/*200*/	return;
}
