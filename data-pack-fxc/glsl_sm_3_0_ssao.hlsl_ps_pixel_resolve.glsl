//
//
// Shader Model 4
// Fragment Shader
//
// id: 1430 - fxc/glsl_SM_3_0_ssao.hlsl_PS_pixel_resolve.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D jitter_texture_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform ssao_resolve_PS
{
  vec4 data[4];
} cb1;

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
  vec4 r17;
  vec4 r18;
  vec4 r19;
  vec4 r2;
  vec4 r20;
  vec4 r21;
  vec4 r22;
  vec4 r23;
  vec4 r24;
  vec4 r25;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.x = cb1.data[2].x * 0.500000;
/*1*/	r0.x = sin(r0.x); r1.x = cos(r0.x);
/*2*/	r0.x = r0.x / r1.x;
/*3*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.x)).y;
/*4*/	r0.z = cb1.data[1].w / cb1.data[1].z;
/*5*/	r0.x = r0.z * r0.y;
/*6*/	r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*7*/	r1.xy = (r0.zwzz * cb0.data[27].zwzz).xy;
/*8*/	r2.xyzw = (textureLod(gbuffer_channel_4_sampler, r1.xyxx.st, 0.000000)).yzxw;
/*9*/	r2.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*10*/	r2.w = 1.000000;
/*11*/	r1.z = dot(r2.xyzw, cb0.data[19].xyzw);
/*12*/	r1.w = dot(r2.xyzw, cb0.data[20].xyzw);
/*13*/	r3.z = r1.z / r1.w;
/*14*/	r1.z = cb1.data[0].z * 0.500000;
/*15*/	r1.zw = (r0.xxxy * r1.zzzz).zw;
/*16*/	r1.zw = (r1.zzzw / r3.zzzz).zw;
/*17*/	r2.zw = (r1.zzzw * cb1.data[1].zzzw).zw;
/*18*/	r2.z = min(r2.w, r2.z);
/*19*/	r2.z = min(r2.z, 5.000000);
/*20*/	r2.w = uintBitsToFloat((r2.z >= 1.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	if(floatBitsToUint(r2.w) != 0u) {
/*22*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb1.data[0].z)).w;
/*23*/	  r3.w = cb1.data[0].z * cb1.data[0].z;
/*24*/	  r4.x = cb1.data[0].w * 0.017453;
/*25*/	  r5.x = sin(r4.x);   r6.x = cos(r4.x);
/*26*/	  r4.y = r5.x / r6.x;
/*27*/	  r4.x = sin(-r4.x);
/*28*/	  r4.x = r4.x + 1.000000;
/*29*/	  r4.x = cb1.data[1].y / r4.x;
/*30*/	  r0.xy = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / r0.xyxx).xy;
/*31*/	  r5.xy = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / cb1.data[1].zwzz).xy;
/*32*/	  r2.xy = (r0.xyxx * r2.xyxx).xy;
/*33*/	  r3.xy = (r3.zzzz * r2.xyxx).xy;
/*34*/	  r2.x = r2.z + 1.000000;
/*35*/	  r1.zw = (r1.zzzw / r2.xxxx).zw;
/*36*/	  r5.z = 0;
/*37*/	  r6.xyzw = r0.zwzw * cb0.data[27].zwzw + r5.xzzy;
/*38*/	  r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r6.xyxx.st, 0.000000)).yzxw;
/*39*/	  r7.xy = (r6.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*40*/	  r7.w = 1.000000;
/*41*/	  r2.x = dot(r7.xyzw, cb0.data[19].xyzw);
/*42*/	  r2.y = dot(r7.xyzw, cb0.data[20].xyzw);
/*43*/	  r8.z = r2.x / r2.y;
/*44*/	  r2.xy = (r0.xyxx * r7.xyxx).xy;
/*45*/	  r8.xy = (r8.zzzz * r2.xyxx).xy;
/*46*/	  r5.w = -r5.x;
/*47*/	  r2.xy = (r0.zwzz * cb0.data[27].zwzz + r5.wzww).xy;
/*48*/	  r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r2.xyxx.st, 0.000000)).yzxw;
/*49*/	  r7.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*50*/	  r7.w = 1.000000;
/*51*/	  r2.x = dot(r7.xyzw, cb0.data[19].xyzw);
/*52*/	  r2.y = dot(r7.xyzw, cb0.data[20].xyzw);
/*53*/	  r9.z = r2.x / r2.y;
/*54*/	  r2.xy = (r0.xyxx * r7.xyxx).xy;
/*55*/	  r9.xy = (r9.zzzz * r2.xyxx).xy;
/*56*/	  r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r6.zwzz.st, 0.000000)).yzxw;
/*57*/	  r7.xy = (r6.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*58*/	  r7.w = 1.000000;
/*59*/	  r2.x = dot(r7.xyzw, cb0.data[19].xyzw);
/*60*/	  r2.y = dot(r7.xyzw, cb0.data[20].xyzw);
/*61*/	  r6.z = r2.x / r2.y;
/*62*/	  r2.xy = (r0.xyxx * r7.xyxx).xy;
/*63*/	  r6.xy = (r6.zzzz * r2.xyxx).xy;
/*64*/	  r2.xy = (r5.zyzz * vec4(1.000000, -1.000000, 0.000000, 0.000000) + r1.xyxx).xy;
/*65*/	  r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r2.xyxx.st, 0.000000)).yzxw;
/*66*/	  r7.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*67*/	  r7.w = 1.000000;
/*68*/	  r2.x = dot(r7.xyzw, cb0.data[19].xyzw);
/*69*/	  r2.y = dot(r7.xyzw, cb0.data[20].xyzw);
/*70*/	  r10.z = r2.x / r2.y;
/*71*/	  r2.xy = (r0.xyxx * r7.xyxx).xy;
/*72*/	  r10.xy = (r10.zzzz * r2.xyxx).xy;
/*73*/	  r7.xyz = (-r3.xyzx + r8.xyzx).xyz;
/*74*/	  r8.xyz = (r3.xyzx + -r9.xyzx).xyz;
/*75*/	  r2.x = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*76*/	  r2.y = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*77*/	  r2.x = uintBitsToFloat((r2.x < r2.y) ? 0xffffffffu : 0x00000000u);
/*78*/	  r7.xyz = (mix(r8.xyzx, r7.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*79*/	  r6.xyz = (-r3.xyzx + r6.xyzx).xyz;
/*80*/	  r8.xyz = (r3.xyzx + -r10.xyzx).xyz;
/*81*/	  r2.x = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*82*/	  r2.y = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*83*/	  r2.x = uintBitsToFloat((r2.x < r2.y) ? 0xffffffffu : 0x00000000u);
/*84*/	  r6.xyz = (mix(r8.xyzx, r6.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*85*/	  r2.x = r5.x * cb1.data[1].w;
/*86*/	  r6.xyz = (r2.xxxx * r6.xyzx).xyz;
/*87*/	  r2.xy = (r5.xyxx * cb1.data[2].wwww).xy;
/*88*/	  r1.xy = (r1.xyxx / r2.xyxx).xy;
/*89*/	  r8.xyzw = (textureLod(jitter_texture_sampler, r1.xyxx.st, 0.000000)).xyzw;
/*90*/	  r8.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*91*/	  r1.xy = (r1.zwzz * r8.xyxx).xy;
/*92*/	  r9.yz = (r8.xxxx * vec4(0.000000, -0.000000, -0.000000, 0.000000) + -r8.yyyy).yz;
/*93*/	  r9.w = r8.y * -0.000000 + r8.x;
/*94*/	  r9.x = -r8.y * -0.000000 + -r8.x;
/*95*/	  r10.xyzw = r1.zwzw * r9.ywxz;
/*96*/	  r2.x = r8.x * 0.000000 + r8.y;
/*97*/	  r2.y = r8.y * 0.000000 + -r8.x;
/*98*/	  r4.zw = (r1.zzzw * r2.xxxy).zw;
/*99*/	  r5.zw = (r0.zzzw * cb0.data[27].zzzw + r1.xxxy).zw;
/*100*/	  r1.xy = (r8.zzzz * r1.xyxx + r5.zwzz).xy;
/*101*/	  r11.xyzw = r0.zwzw * cb0.data[27].zwzw + r10.xyzw;
/*102*/	  r10.xyzw = r8.zzzz * r10.xyzw + r11.xyzw;
/*103*/	  r5.zw = (r0.zzzw * cb0.data[27].zzzw + r4.zzzw).zw;
/*104*/	  r4.zw = (r8.zzzz * r4.zzzw + r5.zzzw).zw;
/*105*/	  r5.zw = (-r0.zzzw * cb0.data[27].zzzw + r1.xxxy).zw;
/*106*/	  r5.zw = (r5.zzzw * cb1.data[1].zzzw + vec4(0.000000, 0.000000, 0.500000, 0.500000)).zw;
/*107*/	  r5.zw = floor((r5.zzzw).zw);
/*108*/	  r5.zw = (r5.xxxy * r5.zzzw).zw;
/*109*/	  r11.xyz = (r6.xyzx * r5.wwww).xyz;
/*110*/	  r11.xyz = (r5.zzzz * r7.xyzx + r11.xyzx).xyz;
/*111*/	  r12.xyzw = -r0.zwzw * cb0.data[27].zwzw + r10.xyzw;
/*112*/	  r12.xyzw = r12.xyzw * cb1.data[1].zwzw + vec4(0.500000, 0.500000, 0.500000, 0.500000);
/*113*/	  r12.xyzw = floor(r12.xyzw);
/*114*/	  r12.xyzw = r5.xyxy * r12.xyzw;
/*115*/	  r13.xyz = (r6.xyzx * r12.yyyy).xyz;
/*116*/	  r13.xyz = (r12.xxxx * r7.xyzx + r13.xyzx).xyz;
/*117*/	  r12.xyw = (r6.xyxz * r12.wwww).xyw;
/*118*/	  r12.xyz = (r12.zzzz * r7.xyzx + r12.xywx).xyz;
/*119*/	  r5.zw = (-r0.zzzw * cb0.data[27].zzzw + r4.zzzw).zw;
/*120*/	  r5.zw = (r5.zzzw * cb1.data[1].zzzw + vec4(0.000000, 0.000000, 0.500000, 0.500000)).zw;
/*121*/	  r5.zw = floor((r5.zzzw).zw);
/*122*/	  r5.zw = (r5.xxxy * r5.zzzw).zw;
/*123*/	  r14.xyz = (r6.xyzx * r5.wwww).xyz;
/*124*/	  r14.xyz = (r5.zzzz * r7.xyzx + r14.xyzx).xyz;
/*125*/	  r5.z = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*126*/	  r5.z = sqrt(r5.z);
/*127*/	  r5.z = -r11.z / r5.z;
/*128*/	  r5.w = dot(vec2(r13.xyxx), vec2(r13.xyxx));
/*129*/	  r5.w = sqrt(r5.w);
/*130*/	  r5.w = -r13.z / r5.w;
/*131*/	  r5.zw = (r4.yyyy + r5.zzzw).zw;
/*132*/	  r6.w = dot(vec2(r12.xyxx), vec2(r12.xyxx));
/*133*/	  r6.w = sqrt(r6.w);
/*134*/	  r6.w = -r12.z / r6.w;
/*135*/	  r6.w = r4.y + r6.w;
/*136*/	  r7.w = dot(vec2(r14.xyxx), vec2(r14.xyxx));
/*137*/	  r7.w = sqrt(r7.w);
/*138*/	  r7.w = -r14.z / r7.w;
/*139*/	  r7.w = r4.y + r7.w;
/*140*/	  r11.w = 1.000000;
/*141*/	  r12.w = 1.000000;
/*142*/	  r13.w = 1.000000;
/*143*/	  r14.w = 1.000000;
/*144*/	  r15.xy = (r5.zwzz).xy;
/*145*/	  r15.z = r6.w;
/*146*/	  r15.w = r7.w;
/*147*/	  r16.xyzw = vec4(0, 0, 0, 0);
/*148*/	  r8.zw = (r1.xxxy).zw;
/*149*/	  r17.xyzw = r10.xyzw;
/*150*/	  r18.xy = (r4.zwzz).xy;
/*151*/	  r18.zw = (vec4(0, 0, 0, 0)).zw;
/*152*/	  while(true) {
/*153*/	    r19.x = uintBitsToFloat((r18.w >= r2.z) ? 0xffffffffu : 0x00000000u);
/*154*/	    if(r19.x != 0) break;
/*155*/	    r19.xy = (r8.zwzz * cb1.data[1].zwzz).xy;
/*156*/	    r19.xy = (fract(r19.xyxx)).xy;
/*157*/	    r19.xy = (r19.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*158*/	    r19.xy = (-r19.xyxx * r5.xyxx + r8.zwzz).xy;
/*159*/	    r19.zw = (r17.xxxy * cb1.data[1].zzzw).zw;
/*160*/	    r19.zw = (fract(r19.zzzw)).zw;
/*161*/	    r19.zw = (r19.zzzw + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*162*/	    r19.zw = (-r19.zzzw * r5.xxxy + r17.xxxy).zw;
/*163*/	    r20.xy = (r17.zwzz * cb1.data[1].zwzz).xy;
/*164*/	    r20.xy = (fract(r20.xyxx)).xy;
/*165*/	    r20.xy = (r20.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*166*/	    r20.xy = (-r20.xyxx * r5.xyxx + r17.zwzz).xy;
/*167*/	    r20.zw = (r18.xxxy * cb1.data[1].zzzw).zw;
/*168*/	    r20.zw = (fract(r20.zzzw)).zw;
/*169*/	    r20.zw = (r20.zzzw + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*170*/	    r20.zw = (-r20.zzzw * r5.xxxy + r18.xxxy).zw;
/*171*/	    r21.xyzw = (textureLod(gbuffer_channel_4_sampler, r19.xyxx.st, 0.000000)).xyzw;
/*172*/	    r11.xy = (r19.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*173*/	    r11.z = r21.x;
/*174*/	    r21.x = dot(r11.xyzw, cb0.data[19].xyzw);
/*175*/	    r11.z = dot(r11.xyzw, cb0.data[20].xyzw);
/*176*/	    r21.z = r21.x / r11.z;
/*177*/	    r11.xy = (r0.xyxx * r11.xyxx).xy;
/*178*/	    r21.xy = (r21.zzzz * r11.xyxx).xy;
/*179*/	    r22.xyzw = (textureLod(gbuffer_channel_4_sampler, r19.zwzz.st, 0.000000)).xyzw;
/*180*/	    r12.xy = (r19.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*181*/	    r12.z = r22.x;
/*182*/	    r11.z = dot(r12.xyzw, cb0.data[19].xyzw);
/*183*/	    r12.z = dot(r12.xyzw, cb0.data[20].xyzw);
/*184*/	    r22.z = r11.z / r12.z;
/*185*/	    r12.xy = (r0.xyxx * r12.xyxx).xy;
/*186*/	    r22.xy = (r22.zzzz * r12.xyxx).xy;
/*187*/	    r23.xyzw = (textureLod(gbuffer_channel_4_sampler, r20.xyxx.st, 0.000000)).xyzw;
/*188*/	    r13.xy = (r20.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*189*/	    r13.z = r23.x;
/*190*/	    r11.z = dot(r13.xyzw, cb0.data[19].xyzw);
/*191*/	    r12.z = dot(r13.xyzw, cb0.data[20].xyzw);
/*192*/	    r23.z = r11.z / r12.z;
/*193*/	    r13.xy = (r0.xyxx * r13.xyxx).xy;
/*194*/	    r23.xy = (r23.zzzz * r13.xyxx).xy;
/*195*/	    r24.xyzw = (textureLod(gbuffer_channel_4_sampler, r20.zwzz.st, 0.000000)).xyzw;
/*196*/	    r14.xy = (r20.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*197*/	    r14.z = r24.x;
/*198*/	    r11.z = dot(r14.xyzw, cb0.data[19].xyzw);
/*199*/	    r12.z = dot(r14.xyzw, cb0.data[20].xyzw);
/*200*/	    r24.z = r11.z / r12.z;
/*201*/	    r14.xy = (r0.xyxx * r14.xyxx).xy;
/*202*/	    r24.xy = (r24.zzzz * r14.xyxx).xy;
/*203*/	    r8.zw = (r8.xxxy * r1.zzzw + r8.zzzw).zw;
/*204*/	    r17.xy = (r9.ywyy * r1.zwzz + r17.xyxx).xy;
/*205*/	    r17.zw = (r9.xxxz * r1.zzzw + r17.zzzw).zw;
/*206*/	    r18.xy = (r2.xyxx * r1.zwzz + r18.xyxx).xy;
/*207*/	    r11.z = r3.z + -r21.z;
/*208*/	    r11.xy = (r11.xyxx * r21.zzzz + -r3.xyxx).xy;
/*209*/	    r11.x = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*210*/	    r11.x = sqrt(r11.x);
/*211*/	    r25.x = r11.z / r11.x;
/*212*/	    r11.x = r3.z + -r22.z;
/*213*/	    r11.yz = (r12.xxyx * r22.zzzz + -r3.xxyx).yz;
/*214*/	    r11.y = dot(vec2(r11.yzyy), vec2(r11.yzyy));
/*215*/	    r11.y = sqrt(r11.y);
/*216*/	    r25.y = r11.x / r11.y;
/*217*/	    r11.x = r3.z + -r23.z;
/*218*/	    r11.yz = (r13.xxyx * r23.zzzz + -r3.xxyx).yz;
/*219*/	    r11.y = dot(vec2(r11.yzyy), vec2(r11.yzyy));
/*220*/	    r11.y = sqrt(r11.y);
/*221*/	    r25.z = r11.x / r11.y;
/*222*/	    r11.x = r3.z + -r24.z;
/*223*/	    r11.yz = (r14.xxyx * r24.zzzz + -r3.xxyx).yz;
/*224*/	    r11.y = dot(vec2(r11.yzyy), vec2(r11.yzyy));
/*225*/	    r11.y = sqrt(r11.y);
/*226*/	    r25.w = r11.x / r11.y;
/*227*/	    r11.xyz = (-r3.xyzx + r21.xyzx).xyz;
/*228*/	    r21.x = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*229*/	    r11.xyz = (-r3.xyzx + r22.xyzx).xyz;
/*230*/	    r21.y = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*231*/	    r11.xyz = (-r3.xyzx + r23.xyzx).xyz;
/*232*/	    r21.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*233*/	    r11.xyz = (-r3.xyzx + r24.xyzx).xyz;
/*234*/	    r21.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*235*/	    r22.xyzw = r25.xyzw * r25.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*236*/	    r22.xyzw = sqrt(r22.xyzw);
/*237*/	    r22.xyzw = r25.xyzw / r22.xyzw;
/*238*/	    r23.xyzw = sqrt(r21.xyzw);
/*239*/	    r23.xyzw = r2.wwww * r23.xyzw;
/*240*/	    r23.xyzw = r23.xyzw * r23.xyzw;
/*241*/	    r23.xyzw = -r23.xyzw * cb1.data[1].xxxx + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*242*/	    r11.xy = (-r0.zwzz * cb0.data[27].zwzz + r19.xyxx).xy;
/*243*/	    r12.xyz = (r6.xyzx * r11.yyyy).xyz;
/*244*/	    r11.xyz = (r11.xxxx * r7.xyzx + r12.xyzx).xyz;
/*245*/	    r12.xy = (-r0.zwzz * cb0.data[27].zwzz + r19.zwzz).xy;
/*246*/	    r13.xyz = (r6.xyzx * r12.yyyy).xyz;
/*247*/	    r12.xyz = (r12.xxxx * r7.xyzx + r13.xyzx).xyz;
/*248*/	    r13.xy = (-r0.zwzz * cb0.data[27].zwzz + r20.xyxx).xy;
/*249*/	    r14.xyz = (r6.xyzx * r13.yyyy).xyz;
/*250*/	    r13.xyz = (r13.xxxx * r7.xyzx + r14.xyzx).xyz;
/*251*/	    r14.xy = (-r0.zwzz * cb0.data[27].zwzz + r20.zwzz).xy;
/*252*/	    r19.xyz = (r6.xyzx * r14.yyyy).xyz;
/*253*/	    r14.xyz = (r14.xxxx * r7.xyzx + r19.xyzx).xyz;
/*254*/	    r11.x = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*255*/	    r11.x = sqrt(r11.x);
/*256*/	    r11.x = -r11.z / r11.x;
/*257*/	    r11.y = dot(vec2(r12.xyxx), vec2(r12.xyxx));
/*258*/	    r11.y = sqrt(r11.y);
/*259*/	    r11.y = -r12.z / r11.y;
/*260*/	    r11.z = dot(vec2(r13.xyxx), vec2(r13.xyxx));
/*261*/	    r11.z = sqrt(r11.z);
/*262*/	    r11.z = -r13.z / r11.z;
/*263*/	    r11.xyz = (r4.yyyy + r11.xyzx).xyz;
/*264*/	    r12.x = dot(vec2(r14.xyxx), vec2(r14.xyxx));
/*265*/	    r12.x = sqrt(r12.x);
/*266*/	    r12.x = -r14.z / r12.x;
/*267*/	    r12.x = r4.y + r12.x;
/*268*/	    r12.y = r11.x * r11.x + 1.000000;
/*269*/	    r12.y = sqrt(r12.y);
/*270*/	    r19.x = r11.x / r12.y;
/*271*/	    r11.x = r11.y * r11.y + 1.000000;
/*272*/	    r11.x = sqrt(r11.x);
/*273*/	    r19.y = r11.y / r11.x;
/*274*/	    r11.x = r11.z * r11.z + 1.000000;
/*275*/	    r11.x = sqrt(r11.x);
/*276*/	    r19.z = r11.z / r11.x;
/*277*/	    r11.x = r12.x * r12.x + 1.000000;
/*278*/	    r11.x = sqrt(r11.x);
/*279*/	    r19.w = r12.x / r11.x;
/*280*/	    r19.xyzw = -r19.xyzw + r22.xyzw;
/*281*/	    r20.xyzw = uintBitsToFloat(uvec4(lessThan(r21.xyzw, r3.wwww)) * 0xffffffffu);
/*282*/	    r20.xyzw = uintBitsToFloat(floatBitsToUint(r20.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*283*/	    r21.xyzw = uintBitsToFloat(uvec4(lessThan(r15.xyzw, r25.xyzw)) * 0xffffffffu);
/*284*/	    r21.xyzw = uintBitsToFloat(floatBitsToUint(r21.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*285*/	    r20.xyzw = r20.xyzw * r21.xyzw;
/*286*/	    r21.xyzw = -r16.xyzw + r19.xyzw;
/*287*/	    r21.xyzw = r21.xyzw * r23.xyzw;
/*288*/	    r11.x = dot(r20.xyzw, r21.xyzw);
/*289*/	    r18.z = r11.x + r18.z;
/*290*/	    r20.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r20.xyzw)) * 0xffffffffu);
/*291*/	    r16.xyzw = mix(r16.xyzw, r19.xyzw, greaterThan(floatBitsToUint(r20.xyzw), uvec4(0)));
/*292*/	    r15.xyzw = mix(r15.xyzw, r25.xyzw, greaterThan(floatBitsToUint(r20.xyzw), uvec4(0)));
/*293*/	    r18.w = r18.w + 1.000000;
/*294*/	  }
/*295*/	  r0.x = r4.x * r18.z;
/*296*/	  r0.x = saturate(-r0.x * 0.250000 + 1.000000);
/*297*/	  r0.x = log2(r0.x);
/*298*/	  r0.x = r0.x * cb1.data[2].y;
/*299*/	  r0.x = exp2(r0.x);
/*300*/	  r0.y = -cb1.data[2].z + 1.000000;
/*301*/	  color0.xyzw = r0.xxxx * r0.yyyy + cb1.data[2].zzzz;
/*302*/	} else {
/*303*/	  color0.xyzw = vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*304*/	}
/*305*/	return;
}
