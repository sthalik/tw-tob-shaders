//
//
// Shader Model 4
// Fragment Shader
//
// id: 3897 - fxc/glsl_SM_3_0_RigidProjectedDecal.hlsl_PS_ps30_parallax_bugged.glsl
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
/*17*/	r2.x = vsOut_T0.w;
/*18*/	r2.y = vsOut_T1.w;
/*19*/	r2.z = vsOut_T2.w;
/*20*/	r2.xyz = (r1.xyzx + -r2.xyzx).xyz;
/*21*/	r3.x = vsOut_T0.x;
/*22*/	r3.y = vsOut_T1.x;
/*23*/	r3.z = vsOut_T2.x;
/*24*/	r4.x = dot(vec3(r2.xyzx), vec3(r3.xyzx));
/*25*/	r5.x = vsOut_T0.y;
/*26*/	r5.y = vsOut_T1.y;
/*27*/	r5.z = vsOut_T2.y;
/*28*/	r4.y = dot(vec3(r2.xyzx), vec3(r5.xyzx));
/*29*/	r6.x = vsOut_T0.z;
/*30*/	r6.y = vsOut_T1.z;
/*31*/	r6.z = vsOut_T2.z;
/*32*/	r4.z = dot(vec3(r2.xyzx), vec3(r6.xyzx));
/*33*/	r2.xyz = (r4.xyzx + -vsOut_T5.xyzx).xyz;
/*34*/	r4.x = sin(-vsOut_T5.w); r7.x = cos(-vsOut_T5.w);
/*35*/	r8.x = -r4.x;
/*36*/	r8.y = r7.x;
/*37*/	r7.x = dot(vec2(r2.zxzz), vec2(r8.xyxx));
/*38*/	r8.z = r4.x;
/*39*/	r7.z = dot(vec2(r2.zxzz), vec2(r8.yzyy));
/*40*/	r2.xzw = (vsOut_T3.xxyz * vsOut_T3.xxyz).xzw;
/*41*/	r2.xzw = (r2.xxzw * vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*42*/	r7.y = r2.y;
/*43*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xzwx, abs(r7.xyzx))) * 0xffffffffu)).xyz;
/*44*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) | floatBitsToUint(r4.x));
/*45*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) | floatBitsToUint(r0.w));
/*46*/	if(r0.w != 0) discard;
/*47*/	r2.xy = (r7.xzxx / r2.xwxx).xy;
/*48*/	r2.xy = (r2.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*49*/	r4.xyz = (r0.zxyz * r6.yzxy).xyz;
/*50*/	r4.xyz = (r0.yzxy * r6.zxyz + -r4.xyzx).xyz;
/*51*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r4.xyz = (r0.wwww * r4.xyzx).xyz;
/*54*/	r7.xyz = (r0.yzxy * r3.zxyz).xyz;
/*55*/	r7.xyz = (r3.yzxy * r0.zxyz + -r7.xyzx).xyz;
/*56*/	r0.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*57*/	r0.w = inversesqrt(r0.w);
/*58*/	r7.xyz = (r0.wwww * r7.xyzx).xyz;
/*59*/	r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*60*/	r0.w = inversesqrt(r0.w);
/*61*/	r5.xyz = (r0.wwww * r5.xyzx).xyz;
/*62*/	r0.w = saturate(dot(vec3(r0.xyzx), vec3(r5.xyzx)));
/*63*/	r0.w = r0.w + r0.w;
/*64*/	r0.w = min(r0.w, 1.000000);
/*65*/	r1.w = r0.w * -2.000000 + 3.000000;
/*66*/	r0.w = r0.w * r0.w;
/*67*/	r0.w = r0.w * r1.w;
/*68*/	r2.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.500000), vsOut_T4.xxxz)) * 0xffffffffu)).zw;
/*69*/	r8.xy = (r2.xyxx * vsOut_T3.xzxx).xy;
/*70*/	r8.xy = (r8.xyxx * cb3.data[1].zwzz).xy;
/*71*/	r8.xy = (r8.xyxx * vec4(0.158691, 0.158691, 0.000000, 0.000000)).xy;
/*72*/	r9.xyz = (r1.xyzx + -cb0.data[0].xyzx).xyz;
/*73*/	r1.y = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*74*/	r1.y = inversesqrt(r1.y);
/*75*/	r9.xyz = (r1.yyyy * r9.xyzx).xyz;
/*76*/	r1.yw = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vsOut_T3.zzzx).yw;
/*77*/	r3.x = dot(vec3(r9.xyzx), vec3(r3.xyzx));
/*78*/	r3.y = dot(vec3(r9.xyzx), vec3(r6.xyzx));
/*79*/	r6.x = r1.w * r3.x;
/*80*/	r1.y = r1.y * r3.y;
/*81*/	r6.y = -r1.y;
/*82*/	r3.xyzw = (texture(s_normal, r8.xyxx.st)).xyzw;
/*83*/	r1.y = r3.z + -0.500000;
/*84*/	r1.w = r1.y * 0.500000;
/*85*/	r3.xy = (r1.wwww * r6.xyxx).xy;
/*86*/	r3.xy = (-r3.xyxx * vsOut_T3.wwww + r8.xyxx).xy;
/*87*/	r3.xyzw = (texture(s_normal, r3.xyxx.st)).xyzw;
/*88*/	r1.y = r1.y * 0.500000 + r3.z;
/*89*/	r1.y = r1.y + -0.500000;
/*90*/	r1.w = r1.y * 0.500000;
/*91*/	r3.xy = (r1.wwww * r6.xyxx).xy;
/*92*/	r3.xy = (-r3.xyxx * vsOut_T3.wwww + r8.xyxx).xy;
/*93*/	r3.xyzw = (texture(s_normal, r3.xyxx.st)).xyzw;
/*94*/	r1.y = r1.y * 0.500000 + r3.z;
/*95*/	r1.y = r1.y + -0.500000;
/*96*/	r1.y = r1.y * 0.500000;
/*97*/	r1.yw = (r1.yyyy * r6.xxxy).yw;
/*98*/	r1.yw = (-r1.yyyw * vsOut_T3.wwww + r8.xxxy).yw;
/*99*/	r3.xyzw = (texture(s_diffuse_map_wrap, r1.ywyy.st)).xyzw;
/*100*/	r8.xyzw = (texture(s_normal_wrap, r1.ywyy.st)).xyzw;
/*101*/	r9.xyzw = (texture(s_normal, r2.xyxx.st)).xyzw;
/*102*/	r1.y = r9.z + -0.500000;
/*103*/	r1.w = r1.y * 0.500000;
/*104*/	r6.zw = (r1.wwww * r6.xxxy).zw;
/*105*/	r6.zw = (-r6.zzzw * vsOut_T3.wwww + r2.xxxy).zw;
/*106*/	r9.xyzw = (texture(s_normal, r6.zwzz.st)).xyzw;
/*107*/	r1.y = r1.y * 0.500000 + r9.z;
/*108*/	r1.y = r1.y + -0.500000;
/*109*/	r1.w = r1.y * 0.500000;
/*110*/	r6.zw = (r1.wwww * r6.xxxy).zw;
/*111*/	r6.zw = (-r6.zzzw * vsOut_T3.wwww + r2.xxxy).zw;
/*112*/	r9.xyzw = (texture(s_normal, r6.zwzz.st)).xyzw;
/*113*/	r1.y = r1.y * 0.500000 + r9.z;
/*114*/	r1.y = r1.y + -0.500000;
/*115*/	r1.y = r1.y * 0.500000;
/*116*/	r1.yw = (r1.yyyy * r6.xxxy).yw;
/*117*/	r1.yw = (-r1.yyyw * vsOut_T3.wwww + r2.xxxy).yw;
/*118*/	r6.xyzw = (texture(s_diffuse_map_clamp, r1.ywyy.st)).xyzw;
/*119*/	r9.xyzw = (texture(s_normal, r1.ywyy.st)).xyzw;
/*120*/	if(floatBitsToUint(r2.z) != 0u) {
/*121*/	  r1.yw = (r8.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*122*/	  r1.yw = (r1.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*123*/	  r2.x = dot(vec2(r1.ywyy), vec2(r1.ywyy));
/*124*/	  r2.x = -r2.x + 1.000000;
/*125*/	  r2.x = max(r2.x, 0.000000);
/*126*/	  r2.x = sqrt(r2.x);
/*127*/	  r8.xyz = (r7.xyzx * r1.wwww).xyz;
/*128*/	  r8.xyz = (r1.yyyy * r4.xyzx + r8.xyzx).xyz;
/*129*/	  r2.xyz = (r2.xxxx * r0.xyzx + r8.xyzx).xyz;
/*130*/	  r1.y = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*131*/	  r1.y = inversesqrt(r1.y);
/*132*/	  r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*133*/	  r6.xyzw = r3.xyzw;
/*134*/	} else {
/*135*/	  r1.yw = (r9.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*136*/	  r1.yw = (r1.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*137*/	  r3.x = dot(vec2(r1.ywyy), vec2(r1.ywyy));
/*138*/	  r3.x = -r3.x + 1.000000;
/*139*/	  r3.x = max(r3.x, 0.000000);
/*140*/	  r3.x = sqrt(r3.x);
/*141*/	  r3.yzw = (r7.xxyz * r1.wwww).yzw;
/*142*/	  r3.yzw = (r1.yyyy * r4.xxyz + r3.yyzw).yzw;
/*143*/	  r3.xyz = (r3.xxxx * r0.xyzx + r3.yzwy).xyz;
/*144*/	  r1.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*145*/	  r1.y = inversesqrt(r1.y);
/*146*/	  r2.xyz = (r1.yyyy * r3.xyzx).xyz;
/*147*/	}
/*148*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*149*/	if(floatBitsToUint(r1.y) != 0u) {
/*150*/	  r3.xyzw = r1.xzxz + -cb1.data[1].xyxy;
/*151*/	  r8.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*152*/	  r3.xyzw = r3.xyzw / r8.xyzw;
/*153*/	  r8.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*154*/	  r3.xyzw = r3.xyzw * r8.xyzw + cb1.data[4].xyxy;
/*155*/	  r8.xyzw = (textureLod(s_shroud, r3.zwzz.st, r3.w)).xyzw;
/*156*/	  r3.xyzw = r3.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*157*/	  r3.xyzw = saturate(r3.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*158*/	  r9.xyzw = r3.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*159*/	  r3.xyzw = r3.xyzw * r3.xyzw;
/*160*/	  r3.xyzw = r3.xyzw * r9.xyzw;
/*161*/	  r1.y = r8.x * r3.x;
/*162*/	  r1.y = r1.y * r3.y;
/*163*/	  r1.y = r3.z * -r1.y + r1.y;
/*164*/	  r1.y = r3.w * -r1.y + r1.y;
/*165*/	} else {
/*166*/	  r1.y = 1.000000;
/*167*/	}
/*168*/	r1.yw = (r1.yyyy + vec4(0.000000, -0.100000, 0.000000, -0.500000)).yw;
/*169*/	r1.y = saturate(r1.y * 2.500000);
/*170*/	r3.x = r1.y * -2.000000 + 3.000000;
/*171*/	r1.y = r1.y * r1.y;
/*172*/	r1.y = r1.y * r3.x;
/*173*/	r1.w = saturate(r1.w + r1.w);
/*174*/	r3.x = r1.w * -2.000000 + 3.000000;
/*175*/	r1.w = r1.w * r1.w;
/*176*/	r1.w = r1.w * r3.x;
/*177*/	r1.y = r1.y * 0.200000;
/*178*/	r3.xyz = saturate(r1.yyyy * r6.xyzx).xyz;
/*179*/	r6.xyz = (-r3.xyzx + r6.xyzx).xyz;
/*180*/	r3.xyz = (r1.wwww * r6.xyzx + r3.xyzx).xyz;
/*181*/	r1.y = uintBitsToFloat((floatBitsToInt(cb3.data[2].x) == int(0)) ? 0xffffffffu : 0x00000000u) /**/;
/*182*/	r1.y = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r1.y));
/*183*/	r8.xyzw = r1.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*184*/	r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*185*/	r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*186*/	if(floatBitsToUint(r1.y) != 0u) {
/*187*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*188*/	  if(floatBitsToUint(r1.x) != 0u) {
/*189*/	    r1.xy = (r9.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*190*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*191*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*192*/	    r1.w = -r1.w + 1.000000;
/*193*/	    r1.w = max(r1.w, 0.000000);
/*194*/	    r1.z = sqrt(r1.w);
/*195*/	    r6.xyz = (r1.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r2.xyzx).xyz;
/*196*/	    r1.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*197*/	    r1.w = inversesqrt(r1.w);
/*198*/	    r6.xyz = (r1.wwww * r6.xyzx).xyz;
/*199*/	    r9.xz = (cb2.data[0].xxyx).xz/**/;
/*200*/	    r9.y = -1.000000;
/*201*/	    r1.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*202*/	    r1.w = inversesqrt(r1.w);
/*203*/	    r9.xyz = (r1.wwww * r9.xyzx).xyz;
/*204*/	    r1.w = saturate(dot(vec3(-r9.xyzx), vec3(r6.xyzx)));
/*205*/	    r2.w = cb2.data[1].x * cb2.data[1].x;
/*206*/	    r2.w = r2.w * 1.250000;
/*207*/	    r2.w = min(r2.w, 1.000000);
/*208*/	    r3.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*209*/	    r3.w = r3.w * 4.000000;
/*210*/	    r2.w = r2.w * 0.200000 + r3.w;
/*211*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*212*/	    r1.w = r1.w + -r2.w;
/*213*/	    r1.w = saturate(r1.w * 200.000000);
/*214*/	    r2.w = r1.w * -2.000000 + 3.000000;
/*215*/	    r1.w = r1.w * r1.w;
/*216*/	    r9.xyz = (r1.wwww * r2.wwww).xyz;
/*217*/	    r6.xyz = (-r3.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*218*/	    r3.xyz = (r9.zzzz * r6.xyzx + r3.xyzx).xyz;
/*219*/	    r6.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*220*/	    r6.xy = (r6.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*221*/	    r1.w = dot(vec2(r6.xyxx), vec2(r6.xyxx));
/*222*/	    r1.w = -r1.w + 1.000000;
/*223*/	    r1.w = max(r1.w, 0.000000);
/*224*/	    r6.z = sqrt(r1.w);
/*225*/	    r1.xyz = (r1.xyzx + r1.xyzx).xyz;
/*226*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*227*/	    r1.w = sqrt(r1.w);
/*228*/	    r1.xyz = (r1.xyzx * r1.wwww + r6.xyzx).xyz;
/*229*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*230*/	    r1.w = inversesqrt(r1.w);
/*231*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*232*/	    r6.xyz = (r7.xyzx * r1.yyyy).xyz;
/*233*/	    r1.xyw = (r1.xxxx * r4.xyxz + r6.xyxz).xyw;
/*234*/	    r0.xyz = (r1.zzzz * r0.xyzx + r1.xywx).xyz;
/*235*/	    r1.x = r9.z * 0.700000;
/*236*/	    r1.y = -r2.y + 1.000000;
/*237*/	    r1.x = min(r1.y, r1.x);
/*238*/	    r0.xyz = (-r2.xyzx + r0.xyzx).xyz;
/*239*/	    r0.xyz = (r1.xxxx * r0.xyzx + r2.xyzx).xyz;
/*240*/	    r1.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*241*/	    r1.x = inversesqrt(r1.x);
/*242*/	    r2.xyz = (r0.xyzx * r1.xxxx).xyz;
/*243*/	  } else {
/*244*/	    r9.xyz = (vec4(0, 0, 0, 0)).xyz;
/*245*/	  }
/*246*/	} else {
/*247*/	  r9.xyz = (vec4(0, 0, 0, 0)).xyz;
/*248*/	}
/*249*/	r0.x = r0.w * r6.w;
/*250*/	r9.w = r0.x * vsOut_T4.y;
/*251*/	color1.xyz = (sqrt(r3.xyzx)).xyz;
/*252*/	r0.x = max(abs(r2.z), abs(r2.y));
/*253*/	r0.x = max(r0.x, abs(r2.x));
/*254*/	r0.xyz = (r2.xyzx / r0.xxxx).xyz;
/*255*/	color0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*256*/	r0.x = saturate(dot(vec3(r5.xyzx), vec3(r2.xyzx)));
/*257*/	r0.y = r0.x * -2.000000 + 3.000000;
/*258*/	r0.x = r0.x * r0.x;
/*259*/	r0.x = r0.x * r0.y;
/*260*/	r0.x = r0.x * r9.w;
/*261*/	color0.w = r0.x;
/*262*/	color1.w = r0.x;
/*263*/	color2.xyzw = r9.xyzw;
/*264*/	return;
}
