//
//
// Shader Model 4
// Fragment Shader
//
// id: 3888 - fxc/glsl_SM_3_0_RigidProjectedDecal.hlsl_PS_ps30_diffuse_bugged.glsl
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

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;

uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D s_gbuffer_normal;
uniform sampler2D s_diffuse_map_clamp;
uniform sampler2D s_diffuse_map_wrap;
uniform sampler2D s_normal_wrap;
uniform sampler2D s_normal;
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
/*21*/	r3.xyz = (r2.yyyy * vsOut_T1.xyzx).xyz;
/*22*/	r2.xyw = (r2.xxxx * vsOut_T0.xyxz + r3.xyxz).xyw;
/*23*/	r2.xyz = (r2.zzzz * vsOut_T2.xyzx + r2.xywx).xyz;
/*24*/	r3.xyz = (vsOut_T3.xyzx * vsOut_T3.xyzx).xyz;
/*25*/	r2.xyz = (r2.xyzx / r3.xyzx).xyz;
/*26*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.500000, 0.000000), abs(r2.xyzx))) * 0xffffffffu)).xyz;
/*27*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*28*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) | floatBitsToUint(r0.w));
/*29*/	if(r0.w != 0) discard;
/*30*/	r1.yw = (r2.xxxz + vec4(0.000000, 0.500000, 0.000000, 0.500000)).yw;
/*31*/	r2.y = vsOut_T2.z;
/*32*/	r2.z = vsOut_T0.z;
/*33*/	r2.x = vsOut_T1.z;
/*34*/	r3.xyz = (r0.zxyz * r2.xyzx).xyz;
/*35*/	r2.xyz = (r0.yzxy * r2.yzxy + -r3.xyzx).xyz;
/*36*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*37*/	r0.w = inversesqrt(r0.w);
/*38*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*39*/	r3.z = vsOut_T1.x;
/*40*/	r3.x = vsOut_T2.x;
/*41*/	r3.y = vsOut_T0.x;
/*42*/	r4.xyz = (r0.yzxy * r3.xyzx).xyz;
/*43*/	r3.xyz = (r3.zxyz * r0.zxyz + -r4.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*45*/	r0.w = inversesqrt(r0.w);
/*46*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*47*/	r4.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.500000, 0.000000, 0.000000), vsOut_T4.xzxx)) * 0xffffffffu)).xy;
/*48*/	r5.xyzw = (texture(s_diffuse_map_clamp, r1.ywyy.st)).xyzw;
/*49*/	r4.zw = (r1.yyyw * vsOut_T3.xxxz).zw;
/*50*/	r4.zw = (r4.zzzw * cb3.data[1].zzzw).zw;
/*51*/	r4.zw = (r4.zzzw * vec4(0.000000, 0.000000, 0.158691, 0.158691)).zw;
/*52*/	r6.xyzw = (texture(s_diffuse_map_wrap, r4.zwzz.st)).xyzw;
/*53*/	r7.xyzw = (texture(s_normal_wrap, r4.zwzz.st)).xyzw;
/*54*/	r8.xyzw = (texture(s_normal, r1.ywyy.st)).xyzw;
/*55*/	if(floatBitsToUint(r4.x) != 0u) {
/*56*/	  r0.w = r5.w * vsOut_T4.y;
/*57*/	  r1.yw = (r7.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*58*/	  r1.yw = (r1.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*59*/	  r2.w = dot(vec2(r1.ywyy), vec2(r1.ywyy));
/*60*/	  r2.w = -r2.w + 1.000000;
/*61*/	  r2.w = max(r2.w, 0.000000);
/*62*/	  r2.w = sqrt(r2.w);
/*63*/	  r4.xzw = (r3.xxyz * r1.wwww).xzw;
/*64*/	  r4.xzw = (r1.yyyy * r2.xxyz + r4.xxzw).xzw;
/*65*/	  r4.xzw = (r2.wwww * r0.xxyz + r4.xxzw).xzw;
/*66*/	  r1.y = dot(vec3(r4.xzwx), vec3(r4.xzwx));
/*67*/	  r1.y = inversesqrt(r1.y);
/*68*/	  r4.xzw = (r1.yyyy * r4.xxzw).xzw;
/*69*/	  r5.xyz = (r6.xyzx).xyz;
/*70*/	} else {
/*71*/	  r0.w = r5.w * vsOut_T4.y;
/*72*/	  r1.yw = (r8.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*73*/	  r1.yw = (r1.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*74*/	  r2.w = dot(vec2(r1.ywyy), vec2(r1.ywyy));
/*75*/	  r2.w = -r2.w + 1.000000;
/*76*/	  r2.w = max(r2.w, 0.000000);
/*77*/	  r2.w = sqrt(r2.w);
/*78*/	  r3.xyz = (r3.xyzx * r1.wwww).xyz;
/*79*/	  r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*80*/	  r2.xyz = (r2.wwww * r0.xyzx + r2.xyzx).xyz;
/*81*/	  r1.y = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*82*/	  r1.y = inversesqrt(r1.y);
/*83*/	  r4.xzw = (r1.yyyy * r2.xxyz).xzw;
/*84*/	}
/*85*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*86*/	if(floatBitsToUint(r1.y) != 0u) {
/*87*/	  r2.xyzw = r1.xzxz + -cb1.data[1].xyxy;
/*88*/	  r3.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*89*/	  r2.xyzw = r2.xyzw / r3.xyzw;
/*90*/	  r3.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*91*/	  r2.xyzw = r2.xyzw * r3.xyzw + cb1.data[4].xyxy;
/*92*/	  r3.xyzw = (textureLod(s_shroud, r2.zwzz.st, r2.w)).xyzw;
/*93*/	  r2.xyzw = r2.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*94*/	  r2.xyzw = saturate(r2.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*95*/	  r6.xyzw = r2.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*96*/	  r2.xyzw = r2.xyzw * r2.xyzw;
/*97*/	  r2.xyzw = r2.xyzw * r6.xyzw;
/*98*/	  r1.y = r3.x * r2.x;
/*99*/	  r1.y = r1.y * r2.y;
/*100*/	  r1.y = r2.z * -r1.y + r1.y;
/*101*/	  r1.y = r2.w * -r1.y + r1.y;
/*102*/	} else {
/*103*/	  r1.y = 1.000000;
/*104*/	}
/*105*/	r1.yw = (r1.yyyy + vec4(0.000000, -0.100000, 0.000000, -0.500000)).yw;
/*106*/	r1.y = saturate(r1.y * 2.500000);
/*107*/	r2.x = r1.y * -2.000000 + 3.000000;
/*108*/	r1.y = r1.y * r1.y;
/*109*/	r1.y = r1.y * r2.x;
/*110*/	r1.w = saturate(r1.w + r1.w);
/*111*/	r2.x = r1.w * -2.000000 + 3.000000;
/*112*/	r1.w = r1.w * r1.w;
/*113*/	r1.w = r1.w * r2.x;
/*114*/	r1.y = r1.y * 0.200000;
/*115*/	r2.xyz = saturate(r1.yyyy * r5.xyzx).xyz;
/*116*/	r3.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*117*/	r2.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*118*/	r1.y = uintBitsToFloat((floatBitsToInt(cb3.data[2].x) == int(0)) ? 0xffffffffu : 0x00000000u) /**/;
/*119*/	r1.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.y));
/*120*/	r3.xyzw = r1.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*121*/	r5.xyzw = (texture(s_snow_normals, r3.xyxx.st)).xyzw;
/*122*/	r3.xyzw = (texture(s_snow_normals, r3.zwzz.st)).xyzw;
/*123*/	if(floatBitsToUint(r1.y) != 0u) {
/*124*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*125*/	  if(floatBitsToUint(r1.x) != 0u) {
/*126*/	    r1.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*127*/	    r1.xz = (r1.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*128*/	    r1.w = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*129*/	    r1.w = -r1.w + 1.000000;
/*130*/	    r1.w = max(r1.w, 0.000000);
/*131*/	    r1.y = sqrt(r1.w);
/*132*/	    r5.xyz = (r1.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r4.xzwx).xyz;
/*133*/	    r1.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*134*/	    r1.w = inversesqrt(r1.w);
/*135*/	    r5.xyz = (r1.wwww * r5.xyzx).xyz;
/*136*/	    r6.xz = (cb2.data[0].xxyx).xz/**/;
/*137*/	    r6.y = -1.000000;
/*138*/	    r1.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*139*/	    r1.w = inversesqrt(r1.w);
/*140*/	    r6.xyz = (r1.wwww * r6.xyzx).xyz;
/*141*/	    r1.w = saturate(dot(vec3(-r6.xyzx), vec3(r5.xyzx)));
/*142*/	    r2.w = cb2.data[1].x * cb2.data[1].x;
/*143*/	    r2.w = r2.w * 1.250000;
/*144*/	    r2.w = min(r2.w, 1.000000);
/*145*/	    r3.x = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*146*/	    r3.x = r3.x * 4.000000;
/*147*/	    r2.w = r2.w * 0.200000 + r3.x;
/*148*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*149*/	    r1.w = r1.w + -r2.w;
/*150*/	    r1.w = saturate(r1.w * 200.000000);
/*151*/	    r2.w = r1.w * -2.000000 + 3.000000;
/*152*/	    r1.w = r1.w * r1.w;
/*153*/	    r5.xyz = (r1.wwww * r2.wwww).xyz;
/*154*/	    r6.xyz = (-r2.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*155*/	    r2.xyz = (r5.zzzz * r6.xyzx + r2.xyzx).xyz;
/*156*/	    r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*157*/	    r3.xz = (r3.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*158*/	    r1.w = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*159*/	    r1.w = -r1.w + 1.000000;
/*160*/	    r1.w = max(r1.w, 0.000000);
/*161*/	    r3.y = sqrt(r1.w);
/*162*/	    r1.xyz = (r1.xyzx + r1.xyzx).xyz;
/*163*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*164*/	    r1.w = sqrt(r1.w);
/*165*/	    r1.xyz = (r1.xyzx * r1.wwww + r3.xyzx).xyz;
/*166*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*167*/	    r1.w = inversesqrt(r1.w);
/*168*/	    r2.w = r5.z * 0.700000;
/*169*/	    r3.x = -r4.z + 1.000000;
/*170*/	    r2.w = min(r2.w, r3.x);
/*171*/	    r1.xyz = (r1.xyzx * r1.wwww + -r4.xzwx).xyz;
/*172*/	    r1.xyz = (r2.wwww * r1.xyzx + r4.xzwx).xyz;
/*173*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*174*/	    r1.w = inversesqrt(r1.w);
/*175*/	    r4.xzw = (r1.wwww * r1.xxyz).xzw;
/*176*/	  } else {
/*177*/	    r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*178*/	  }
/*179*/	} else {
/*180*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*181*/	}
/*182*/	color1.xyz = (sqrt(r2.xyzx)).xyz;
/*183*/	r1.x = max(abs(r4.w), abs(r4.z));
/*184*/	r1.x = max(r1.x, abs(r4.x));
/*185*/	r1.xyz = (r4.xzwx / r1.xxxx).xyz;
/*186*/	color0.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*187*/	r1.x = r0.w * vsOut_T4.y;
/*188*/	r2.x = vsOut_T0.y;
/*189*/	r2.y = vsOut_T1.y;
/*190*/	r2.z = vsOut_T2.y;
/*191*/	r1.y = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*192*/	r1.y = inversesqrt(r1.y);
/*193*/	r1.yzw = (r1.yyyy * r2.xxyz).yzw;
/*194*/	r0.x = saturate(dot(vec3(r1.yzwy), vec3(r0.xyzx)));
/*195*/	r0.y = r0.x * -2.000000 + 3.000000;
/*196*/	r0.x = r0.x * r0.x;
/*197*/	r0.x = r0.x * r0.y;
/*198*/	r5.w = r0.x * r1.x;
/*199*/	color0.w = r0.x * r0.w;
/*200*/	color1.w = r5.w;
/*201*/	color2.xyzw = r5.xyzw;
/*202*/	return;
}
