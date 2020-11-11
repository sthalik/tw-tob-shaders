//
//
// Shader Model 4
// Fragment Shader
//
// id: 3894 - fxc/glsl_SM_3_0_RigidProjectedDecal.hlsl_PS_ps30_parallax.glsl
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

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;

uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D s_gbuffer_normal;
uniform sampler2D s_normal;
uniform sampler2D s_diffuse_map_wrap;
uniform sampler2D s_normal_wrap;
uniform sampler2D s_diffuse_map_clamp;
uniform sampler2D s_shroud;
uniform sampler2D s_snow_normals;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform projected_decal_PS
{
  vec4 data[5];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw).zw;
/*2*/	r1.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, r0.w)).yzxw;
/*3*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz + -cb3.data[0].xyxx).xy;
/*4*/	r0.xy = (r0.xyxx / cb3.data[0].zwzz).xy;
/*5*/	r1.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*6*/	r1.w = 1.000000;
/*7*/	r2.x = dot(r1.xyzw, cb0.data[21].xyzw);
/*8*/	r2.y = dot(r1.xyzw, cb0.data[22].xyzw);
/*9*/	r2.z = dot(r1.xyzw, cb0.data[23].xyzw);
/*10*/	r0.x = dot(r1.xyzw, cb0.data[24].xyzw);
/*11*/	r1.xyz = (r2.xyzx / r0.xxxx).xyz;
/*12*/	r0.xyzw = (textureLod(s_gbuffer_normal, r0.zwzz.st, r0.w)).xyzw;
/*13*/	r0.xyz = (r0.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*14*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*15*/	r0.w = inversesqrt(r0.w);
/*16*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*17*/	r0.w = dot(vec3(vsOut_T0.xyzx), vec3(vsOut_T0.xyzx));
/*18*/	r0.w = inversesqrt(r0.w);
/*19*/	r2.xyz = (r0.wwww * vsOut_T0.xyzx).xyz;
/*20*/	r0.w = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*21*/	r0.w = inversesqrt(r0.w);
/*22*/	r3.xyz = (r0.wwww * vsOut_T1.xyzx).xyz;
/*23*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	r4.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*26*/	r5.x = vsOut_T0.w;
/*27*/	r5.y = vsOut_T1.w;
/*28*/	r5.z = vsOut_T2.w;
/*29*/	r5.xyz = (r1.xyzx + -r5.xyzx).xyz;
/*30*/	r6.x = r2.x;
/*31*/	r6.y = r3.x;
/*32*/	r6.z = r4.x;
/*33*/	r6.x = dot(vec3(r5.xyzx), vec3(r6.xyzx));
/*34*/	r7.x = r2.y;
/*35*/	r7.y = r3.y;
/*36*/	r7.z = r4.y;
/*37*/	r6.y = dot(vec3(r5.xyzx), vec3(r7.xyzx));
/*38*/	r4.x = r2.z;
/*39*/	r4.y = r3.z;
/*40*/	r6.z = dot(vec3(r5.xyzx), vec3(r4.xyzx));
/*41*/	r2.xyz = (r6.xyzx + -vsOut_T5.xyzx).xyz;
/*42*/	r3.x = sin(-vsOut_T5.w); r4.x = cos(-vsOut_T5.w);
/*43*/	r5.x = -r3.x;
/*44*/	r5.y = r4.x;
/*45*/	r4.x = dot(vec2(r2.zxzz), vec2(r5.xyxx));
/*46*/	r5.z = r3.x;
/*47*/	r4.z = dot(vec2(r2.zxzz), vec2(r5.yzyy));
/*48*/	r2.xzw = (vsOut_T3.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*49*/	r4.y = r2.y;
/*50*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xzwx, abs(r4.xyzx))) * 0xffffffffu)).xyz;
/*51*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*52*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) | floatBitsToUint(r0.w));
/*53*/	if(r0.w != 0) discard;
/*54*/	r2.xy = (r4.xzxx / r2.xwxx).xy;
/*55*/	r2.xy = (r2.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*56*/	r3.z = vsOut_T2.z;
/*57*/	r3.x = vsOut_T0.z;
/*58*/	r3.y = vsOut_T1.z;
/*59*/	r4.xyz = (r0.zxyz * r3.yzxy).xyz;
/*60*/	r4.xyz = (r0.yzxy * r3.zxyz + -r4.xyzx).xyz;
/*61*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r4.xyz = (r0.wwww * r4.xyzx).xyz;
/*64*/	r5.y = vsOut_T1.x;
/*65*/	r5.z = vsOut_T2.x;
/*66*/	r5.x = vsOut_T0.x;
/*67*/	r6.xyz = (r0.yzxy * r5.zxyz).xyz;
/*68*/	r6.xyz = (r5.yzxy * r0.zxyz + -r6.xyzx).xyz;
/*69*/	r0.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*70*/	r0.w = inversesqrt(r0.w);
/*71*/	r6.xyz = (r0.wwww * r6.xyzx).xyz;
/*72*/	r7.x = vsOut_T0.y;
/*73*/	r7.y = vsOut_T1.y;
/*74*/	r7.z = vsOut_T2.y;
/*75*/	r0.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*76*/	r0.w = inversesqrt(r0.w);
/*77*/	r7.xyz = (r0.wwww * r7.xyzx).xyz;
/*78*/	r0.w = saturate(dot(vec3(r0.xyzx), vec3(r7.xyzx)));
/*79*/	r0.w = r0.w + r0.w;
/*80*/	r0.w = min(r0.w, 1.000000);
/*81*/	r1.w = r0.w * -2.000000 + 3.000000;
/*82*/	r0.w = r0.w * r0.w;
/*83*/	r0.w = r0.w * r1.w;
/*84*/	r8.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.500000, 0.000000, 0.000000), vsOut_T4.xzxx)) * 0xffffffffu)).xy;
/*85*/	r2.z = -r2.y + 1.000000;
/*86*/	r2.yw = (r2.xxxz * vsOut_T3.xxxz).yw;
/*87*/	r2.yw = (r2.yyyw * cb3.data[1].zzzw).yw;
/*88*/	r2.yw = (r2.yyyw * vec4(0.000000, 0.158691, 0.000000, 0.158691)).yw;
/*89*/	r9.xyz = (r1.xyzx + -cb0.data[0].xyzx).xyz;
/*90*/	r1.y = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*91*/	r1.y = inversesqrt(r1.y);
/*92*/	r9.xyz = (r1.yyyy * r9.xyzx).xyz;
/*93*/	r1.yw = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vsOut_T3.zzzx).yw;
/*94*/	r3.w = dot(vec3(r9.xyzx), vec3(r5.xyzx));
/*95*/	r3.x = dot(vec3(r9.xyzx), vec3(r3.xyzx));
/*96*/	r5.x = r1.w * r3.w;
/*97*/	r1.y = r1.y * r3.x;
/*98*/	r5.y = -r1.y;
/*99*/	r3.xyzw = (texture(s_normal, r2.ywyy.st)).xyzw;
/*100*/	r1.y = r3.z + -0.500000;
/*101*/	r1.w = r1.y * 0.500000;
/*102*/	r3.xy = (r1.wwww * r5.xyxx).xy;
/*103*/	r3.xy = (-r3.xyxx * vsOut_T3.wwww + r2.ywyy).xy;
/*104*/	r3.xyzw = (texture(s_normal, r3.xyxx.st)).xyzw;
/*105*/	r1.y = r1.y * 0.500000 + r3.z;
/*106*/	r1.y = r1.y + -0.500000;
/*107*/	r1.w = r1.y * 0.500000;
/*108*/	r3.xy = (r1.wwww * r5.xyxx).xy;
/*109*/	r3.xy = (-r3.xyxx * vsOut_T3.wwww + r2.ywyy).xy;
/*110*/	r3.xyzw = (texture(s_normal, r3.xyxx.st)).xyzw;
/*111*/	r1.y = r1.y * 0.500000 + r3.z;
/*112*/	r1.y = r1.y + -0.500000;
/*113*/	r1.y = r1.y * 0.500000;
/*114*/	r1.yw = (r1.yyyy * r5.xxxy).yw;
/*115*/	r1.yw = (-r1.yyyw * vsOut_T3.wwww + r2.yyyw).yw;
/*116*/	r3.xyzw = (texture(s_diffuse_map_wrap, r1.ywyy.st)).xyzw;
/*117*/	r9.xyzw = (texture(s_normal_wrap, r1.ywyy.st)).xyzw;
/*118*/	r10.xyzw = (texture(s_normal, r2.xzxx.st)).xyzw;
/*119*/	r1.y = r10.z + -0.500000;
/*120*/	r1.w = r1.y * 0.500000;
/*121*/	r2.yw = (r1.wwww * r5.xxxy).yw;
/*122*/	r2.yw = (-r2.yyyw * vsOut_T3.wwww + r2.xxxz).yw;
/*123*/	r10.xyzw = (texture(s_normal, r2.ywyy.st)).xyzw;
/*124*/	r1.y = r1.y * 0.500000 + r10.z;
/*125*/	r1.y = r1.y + -0.500000;
/*126*/	r1.w = r1.y * 0.500000;
/*127*/	r2.yw = (r1.wwww * r5.xxxy).yw;
/*128*/	r2.yw = (-r2.yyyw * vsOut_T3.wwww + r2.xxxz).yw;
/*129*/	r10.xyzw = (texture(s_normal, r2.ywyy.st)).xyzw;
/*130*/	r1.y = r1.y * 0.500000 + r10.z;
/*131*/	r1.y = r1.y + -0.500000;
/*132*/	r1.y = r1.y * 0.500000;
/*133*/	r1.yw = (r1.yyyy * r5.xxxy).yw;
/*134*/	r1.yw = (-r1.yyyw * vsOut_T3.wwww + r2.xxxz).yw;
/*135*/	r2.xyzw = (texture(s_diffuse_map_clamp, r1.ywyy.st)).xyzw;
/*136*/	r5.xyzw = (texture(s_normal, r1.ywyy.st)).xyzw;
/*137*/	if(floatBitsToUint(r8.x) != 0u) {
/*138*/	  r1.yw = (r9.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*139*/	  r1.yw = (r1.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*140*/	  r4.w = dot(vec2(r1.ywyy), vec2(r1.ywyy));
/*141*/	  r4.w = -r4.w + 1.000000;
/*142*/	  r4.w = max(r4.w, 0.000000);
/*143*/	  r4.w = sqrt(r4.w);
/*144*/	  r8.xzw = (r6.xxyz * r1.wwww).xzw;
/*145*/	  r8.xzw = (r1.yyyy * r4.xxyz + r8.xxzw).xzw;
/*146*/	  r8.xzw = (r4.wwww * r0.xxyz + r8.xxzw).xzw;
/*147*/	  r1.y = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*148*/	  r1.y = inversesqrt(r1.y);
/*149*/	  r8.xzw = (r1.yyyy * r8.xxzw).xzw;
/*150*/	  r2.xyzw = r3.xyzw;
/*151*/	} else {
/*152*/	  r1.yw = (r5.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*153*/	  r1.yw = (r1.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*154*/	  r3.x = dot(vec2(r1.ywyy), vec2(r1.ywyy));
/*155*/	  r3.x = -r3.x + 1.000000;
/*156*/	  r3.x = max(r3.x, 0.000000);
/*157*/	  r3.x = sqrt(r3.x);
/*158*/	  r3.yzw = (r6.xxyz * r1.wwww).yzw;
/*159*/	  r3.yzw = (-r1.yyyy * r4.xxyz + r3.yyzw).yzw;
/*160*/	  r3.xyz = (r3.xxxx * r0.xyzx + r3.yzwy).xyz;
/*161*/	  r1.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*162*/	  r1.y = inversesqrt(r1.y);
/*163*/	  r8.xzw = (r1.yyyy * r3.xxyz).xzw;
/*164*/	}
/*165*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*166*/	if(floatBitsToUint(r1.y) != 0u) {
/*167*/	  r3.xyzw = r1.xzxz + -cb1.data[1].xyxy;
/*168*/	  r5.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*169*/	  r3.xyzw = r3.xyzw / r5.xyzw;
/*170*/	  r5.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*171*/	  r3.xyzw = r3.xyzw * r5.xyzw + cb1.data[4].xyxy;
/*172*/	  r5.xyzw = (textureLod(s_shroud, r3.zwzz.st, r3.w)).xyzw;
/*173*/	  r3.xyzw = r3.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*174*/	  r3.xyzw = saturate(r3.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*175*/	  r9.xyzw = r3.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*176*/	  r3.xyzw = r3.xyzw * r3.xyzw;
/*177*/	  r3.xyzw = r3.xyzw * r9.xyzw;
/*178*/	  r1.y = r5.x * r3.x;
/*179*/	  r1.y = r1.y * r3.y;
/*180*/	  r1.y = r3.z * -r1.y + r1.y;
/*181*/	  r1.y = r3.w * -r1.y + r1.y;
/*182*/	} else {
/*183*/	  r1.y = 1.000000;
/*184*/	}
/*185*/	r1.yw = (r1.yyyy + vec4(0.000000, -0.100000, 0.000000, -0.500000)).yw;
/*186*/	r1.y = saturate(r1.y * 2.500000);
/*187*/	r3.x = r1.y * -2.000000 + 3.000000;
/*188*/	r1.y = r1.y * r1.y;
/*189*/	r1.y = r1.y * r3.x;
/*190*/	r1.w = saturate(r1.w + r1.w);
/*191*/	r3.x = r1.w * -2.000000 + 3.000000;
/*192*/	r1.w = r1.w * r1.w;
/*193*/	r1.w = r1.w * r3.x;
/*194*/	r1.y = r1.y * 0.200000;
/*195*/	r3.xyz = saturate(r1.yyyy * r2.xyzx).xyz;
/*196*/	r2.xyz = (r2.xyzx + -r3.xyzx).xyz;
/*197*/	r2.xyz = (r1.wwww * r2.xyzx + r3.xyzx).xyz;
/*198*/	r1.y = uintBitsToFloat((floatBitsToInt(cb3.data[2].x) == int(0)) ? 0xffffffffu : 0x00000000u) /**/;
/*199*/	r1.y = uintBitsToFloat(floatBitsToUint(r8.y) & floatBitsToUint(r1.y));
/*200*/	r3.xyzw = r1.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*201*/	r5.xyzw = (texture(s_snow_normals, r3.xyxx.st)).xyzw;
/*202*/	r3.xyzw = (texture(s_snow_normals, r3.zwzz.st)).xyzw;
/*203*/	if(floatBitsToUint(r1.y) != 0u) {
/*204*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*205*/	  if(floatBitsToUint(r1.x) != 0u) {
/*206*/	    r1.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*207*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*208*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*209*/	    r1.w = -r1.w + 1.000000;
/*210*/	    r1.w = max(r1.w, 0.000000);
/*211*/	    r1.z = sqrt(r1.w);
/*212*/	    r5.xyz = (r1.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r8.xzwx).xyz;
/*213*/	    r1.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*214*/	    r1.w = inversesqrt(r1.w);
/*215*/	    r5.xyz = (r1.wwww * r5.xyzx).xyz;
/*216*/	    r9.xz = (cb2.data[0].xxyx).xz/**/;
/*217*/	    r9.y = -1.000000;
/*218*/	    r1.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*219*/	    r1.w = inversesqrt(r1.w);
/*220*/	    r9.xyz = (r1.wwww * r9.xyzx).xyz;
/*221*/	    r1.w = saturate(dot(vec3(-r9.xyzx), vec3(r5.xyzx)));
/*222*/	    r3.x = cb2.data[1].x * cb2.data[1].x;
/*223*/	    r3.x = r3.x * 1.250000;
/*224*/	    r3.x = min(r3.x, 1.000000);
/*225*/	    r3.z = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*226*/	    r3.z = r3.z * 4.000000;
/*227*/	    r3.x = r3.x * 0.200000 + r3.z;
/*228*/	    r3.x = r3.x * -0.700000 + 1.000000;
/*229*/	    r1.w = r1.w + -r3.x;
/*230*/	    r1.w = saturate(r1.w * 200.000000);
/*231*/	    r3.x = r1.w * -2.000000 + 3.000000;
/*232*/	    r1.w = r1.w * r1.w;
/*233*/	    r5.xyz = (r1.wwww * r3.xxxx).xyz;
/*234*/	    r9.xyz = (-r2.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*235*/	    r2.xyz = (r5.zzzz * r9.xyzx + r2.xyzx).xyz;
/*236*/	    r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*237*/	    r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*238*/	    r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*239*/	    r1.w = -r1.w + 1.000000;
/*240*/	    r1.w = max(r1.w, 0.000000);
/*241*/	    r3.z = sqrt(r1.w);
/*242*/	    r1.xyz = (r1.xyzx + r1.xyzx).xyz;
/*243*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*244*/	    r1.w = sqrt(r1.w);
/*245*/	    r1.xyz = (r1.xyzx * r1.wwww + r3.xyzx).xyz;
/*246*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*247*/	    r1.w = inversesqrt(r1.w);
/*248*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*249*/	    r3.xyz = (r6.xyzx * r1.yyyy).xyz;
/*250*/	    r1.xyw = (r1.xxxx * r4.xyxz + r3.xyxz).xyw;
/*251*/	    r0.xyz = (r1.zzzz * r0.xyzx + r1.xywx).xyz;
/*252*/	    r1.x = r5.z * 0.700000;
/*253*/	    r1.y = -r8.z + 1.000000;
/*254*/	    r1.x = min(r1.y, r1.x);
/*255*/	    r0.xyz = (-r8.xzwx + r0.xyzx).xyz;
/*256*/	    r0.xyz = (r1.xxxx * r0.xyzx + r8.xzwx).xyz;
/*257*/	    r1.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*258*/	    r1.x = inversesqrt(r1.x);
/*259*/	    r8.xzw = (r0.xxyz * r1.xxxx).xzw;
/*260*/	  } else {
/*261*/	    r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*262*/	  }
/*263*/	} else {
/*264*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*265*/	}
/*266*/	r0.x = r0.w * r2.w;
/*267*/	r5.w = r0.x * vsOut_T4.y;
/*268*/	color1.xyz = (sqrt(r2.xyzx)).xyz;
/*269*/	r0.x = max(abs(r8.w), abs(r8.z));
/*270*/	r0.x = max(r0.x, abs(r8.x));
/*271*/	r0.xyz = (r8.xzwx / r0.xxxx).xyz;
/*272*/	color0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*273*/	r0.x = saturate(dot(vec3(r7.xyzx), vec3(r8.xzwx)));
/*274*/	r0.y = r0.x * -2.000000 + 3.000000;
/*275*/	r0.x = r0.x * r0.x;
/*276*/	r0.x = r0.x * r0.y;
/*277*/	r0.x = r0.x * r5.w;
/*278*/	color0.w = r0.x;
/*279*/	color1.w = r0.x;
/*280*/	color2.xyzw = r5.xyzw;
/*281*/	return;
}
