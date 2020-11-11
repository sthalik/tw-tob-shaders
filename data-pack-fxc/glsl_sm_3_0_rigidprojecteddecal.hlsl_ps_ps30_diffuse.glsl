//
//
// Shader Model 4
// Fragment Shader
//
// id: 3884 - fxc/glsl_SM_3_0_RigidProjectedDecal.hlsl_PS_ps30_diffuse.glsl
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
/*20*/	r2.xyz = (r2.xyzx * vsOut_T3.xxxx).xyz;
/*21*/	r0.w = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*22*/	r0.w = inversesqrt(r0.w);
/*23*/	r3.xyz = (r0.wwww * vsOut_T1.xyzx).xyz;
/*24*/	r3.xyz = (r3.xyzx * vsOut_T3.yyyy).xyz;
/*25*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*26*/	r0.w = inversesqrt(r0.w);
/*27*/	r4.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*28*/	r4.xyz = (r4.xyzx * vsOut_T3.zzzz).xyz;
/*29*/	r5.x = vsOut_T0.w;
/*30*/	r5.y = vsOut_T1.w;
/*31*/	r5.z = vsOut_T2.w;
/*32*/	r5.xyz = (r1.xyzx + -r5.xyzx).xyz;
/*33*/	r3.xyz = (r3.xyzx * r5.yyyy).xyz;
/*34*/	r2.xyz = (r5.xxxx * r2.xyzx + r3.xyzx).xyz;
/*35*/	r2.xyz = (r5.zzzz * r4.xyzx + r2.xyzx).xyz;
/*36*/	r3.xyz = (vsOut_T3.xyzx * vsOut_T3.xyzx).xyz;
/*37*/	r2.xyz = (r2.xyzx / r3.xyzx).xyz;
/*38*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.500000, 0.000000), abs(r2.xyzx))) * 0xffffffffu)).xyz;
/*39*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*40*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) | floatBitsToUint(r0.w));
/*41*/	if(r0.w != 0) discard;
/*42*/	r2.xy = (r2.xzxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*43*/	r3.y = vsOut_T2.z;
/*44*/	r3.z = vsOut_T0.z;
/*45*/	r3.x = vsOut_T1.z;
/*46*/	r4.xyz = (r0.zxyz * r3.xyzx).xyz;
/*47*/	r3.xyz = (r0.yzxy * r3.yzxy + -r4.xyzx).xyz;
/*48*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*49*/	r0.w = inversesqrt(r0.w);
/*50*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*51*/	r4.z = vsOut_T1.x;
/*52*/	r4.x = vsOut_T2.x;
/*53*/	r4.y = vsOut_T0.x;
/*54*/	r5.xyz = (r0.yzxy * r4.xyzx).xyz;
/*55*/	r4.xyz = (r4.zxyz * r0.zxyz + -r5.xyzx).xyz;
/*56*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*57*/	r0.w = inversesqrt(r0.w);
/*58*/	r4.xyz = (r0.wwww * r4.xyzx).xyz;
/*59*/	r1.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.500000), vsOut_T4.xxxz)) * 0xffffffffu)).yw;
/*60*/	r2.z = -r2.y + 1.000000;
/*61*/	r5.xyzw = (texture(s_diffuse_map_clamp, r2.xzxx.st)).xyzw;
/*62*/	r2.yw = (r2.xxxz * vsOut_T3.xxxz).yw;
/*63*/	r2.yw = (r2.yyyw * cb3.data[1].zzzw).yw;
/*64*/	r2.yw = (r2.yyyw * vec4(0.000000, 0.158691, 0.000000, 0.158691)).yw;
/*65*/	r6.xyzw = (texture(s_diffuse_map_wrap, r2.ywyy.st)).xyzw;
/*66*/	r7.xyzw = (texture(s_normal_wrap, r2.ywyy.st)).xyzw;
/*67*/	r2.xyzw = (texture(s_normal, r2.xzxx.st)).xyzw;
/*68*/	if(floatBitsToUint(r1.y) != 0u) {
/*69*/	  r0.w = r5.w * vsOut_T4.y;
/*70*/	  r2.xz = (r7.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*71*/	  r2.xz = (r2.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*72*/	  r1.y = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*73*/	  r1.y = -r1.y + 1.000000;
/*74*/	  r1.y = max(r1.y, 0.000000);
/*75*/	  r1.y = sqrt(r1.y);
/*76*/	  r7.xyz = (r4.xyzx * r2.zzzz).xyz;
/*77*/	  r7.xyz = (r2.xxxx * r3.xyzx + r7.xyzx).xyz;
/*78*/	  r7.xyz = (r1.yyyy * r0.xyzx + r7.xyzx).xyz;
/*79*/	  r1.y = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*80*/	  r1.y = inversesqrt(r1.y);
/*81*/	  r7.xyz = (r1.yyyy * r7.xyzx).xyz;
/*82*/	  r5.xyz = (r6.xyzx).xyz;
/*83*/	} else {
/*84*/	  r0.w = r5.w * vsOut_T4.y;
/*85*/	  r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*86*/	  r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*87*/	  r1.y = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*88*/	  r1.y = -r1.y + 1.000000;
/*89*/	  r1.y = max(r1.y, 0.000000);
/*90*/	  r1.y = sqrt(r1.y);
/*91*/	  r2.yzw = (r4.xxyz * r2.yyyy).yzw;
/*92*/	  r2.xyz = (r2.xxxx * r3.xyzx + r2.yzwy).xyz;
/*93*/	  r2.xyz = (r1.yyyy * r0.xyzx + r2.xyzx).xyz;
/*94*/	  r1.y = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*95*/	  r1.y = inversesqrt(r1.y);
/*96*/	  r7.xyz = (r1.yyyy * r2.xyzx).xyz;
/*97*/	}
/*98*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*99*/	if(floatBitsToUint(r1.y) != 0u) {
/*100*/	  r2.xyzw = r1.xzxz + -cb1.data[1].xyxy;
/*101*/	  r3.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*102*/	  r2.xyzw = r2.xyzw / r3.xyzw;
/*103*/	  r3.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*104*/	  r2.xyzw = r2.xyzw * r3.xyzw + cb1.data[4].xyxy;
/*105*/	  r3.xyzw = (textureLod(s_shroud, r2.zwzz.st, r2.w)).xyzw;
/*106*/	  r2.xyzw = r2.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*107*/	  r2.xyzw = saturate(r2.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*108*/	  r4.xyzw = r2.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*109*/	  r2.xyzw = r2.xyzw * r2.xyzw;
/*110*/	  r2.xyzw = r2.xyzw * r4.xyzw;
/*111*/	  r1.y = r3.x * r2.x;
/*112*/	  r1.y = r1.y * r2.y;
/*113*/	  r1.y = r2.z * -r1.y + r1.y;
/*114*/	  r1.y = r2.w * -r1.y + r1.y;
/*115*/	} else {
/*116*/	  r1.y = 1.000000;
/*117*/	}
/*118*/	r2.xy = (r1.yyyy + vec4(-0.100000, -0.500000, 0.000000, 0.000000)).xy;
/*119*/	r1.y = saturate(r2.x * 2.500000);
/*120*/	r2.x = r1.y * -2.000000 + 3.000000;
/*121*/	r1.y = r1.y * r1.y;
/*122*/	r1.y = r1.y * r2.x;
/*123*/	r2.x = saturate(r2.y + r2.y);
/*124*/	r2.y = r2.x * -2.000000 + 3.000000;
/*125*/	r2.x = r2.x * r2.x;
/*126*/	r2.x = r2.x * r2.y;
/*127*/	r1.y = r1.y * 0.200000;
/*128*/	r2.yzw = saturate(r1.yyyy * r5.xxyz).yzw;
/*129*/	r3.xyz = (-r2.yzwy + r5.xyzx).xyz;
/*130*/	r2.xyz = (r2.xxxx * r3.xyzx + r2.yzwy).xyz;
/*131*/	r1.y = uintBitsToFloat((floatBitsToInt(cb3.data[2].x) == int(0)) ? 0xffffffffu : 0x00000000u) /**/;
/*132*/	r1.y = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r1.y));
/*133*/	r3.xyzw = r1.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*134*/	r4.xyzw = (texture(s_snow_normals, r3.xyxx.st)).xyzw;
/*135*/	r3.xyzw = (texture(s_snow_normals, r3.zwzz.st)).xyzw;
/*136*/	if(floatBitsToUint(r1.y) != 0u) {
/*137*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*138*/	  if(floatBitsToUint(r1.x) != 0u) {
/*139*/	    r1.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*140*/	    r1.xz = (r1.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*141*/	    r1.w = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*142*/	    r1.w = -r1.w + 1.000000;
/*143*/	    r1.w = max(r1.w, 0.000000);
/*144*/	    r1.y = sqrt(r1.w);
/*145*/	    r4.xyz = (r1.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r7.xyzx).xyz;
/*146*/	    r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*147*/	    r1.w = inversesqrt(r1.w);
/*148*/	    r4.xyz = (r1.wwww * r4.xyzx).xyz;
/*149*/	    r5.xz = (cb2.data[0].xxyx).xz/**/;
/*150*/	    r5.y = -1.000000;
/*151*/	    r1.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*152*/	    r1.w = inversesqrt(r1.w);
/*153*/	    r5.xyz = (r1.wwww * r5.xyzx).xyz;
/*154*/	    r1.w = saturate(dot(vec3(-r5.xyzx), vec3(r4.xyzx)));
/*155*/	    r2.w = cb2.data[1].x * cb2.data[1].x;
/*156*/	    r2.w = r2.w * 1.250000;
/*157*/	    r2.w = min(r2.w, 1.000000);
/*158*/	    r3.x = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*159*/	    r3.x = r3.x * 4.000000;
/*160*/	    r2.w = r2.w * 0.200000 + r3.x;
/*161*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*162*/	    r1.w = r1.w + -r2.w;
/*163*/	    r1.w = saturate(r1.w * 200.000000);
/*164*/	    r2.w = r1.w * -2.000000 + 3.000000;
/*165*/	    r1.w = r1.w * r1.w;
/*166*/	    r4.xyz = (r1.wwww * r2.wwww).xyz;
/*167*/	    r5.xyz = (-r2.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*168*/	    r2.xyz = (r4.zzzz * r5.xyzx + r2.xyzx).xyz;
/*169*/	    r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*170*/	    r3.xz = (r3.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*171*/	    r1.w = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*172*/	    r1.w = -r1.w + 1.000000;
/*173*/	    r1.w = max(r1.w, 0.000000);
/*174*/	    r3.y = sqrt(r1.w);
/*175*/	    r1.xyz = (r1.xyzx + r1.xyzx).xyz;
/*176*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*177*/	    r1.w = sqrt(r1.w);
/*178*/	    r1.xyz = (r1.xyzx * r1.wwww + r3.xyzx).xyz;
/*179*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*180*/	    r1.w = inversesqrt(r1.w);
/*181*/	    r2.w = r4.z * 0.700000;
/*182*/	    r3.x = -r7.y + 1.000000;
/*183*/	    r2.w = min(r2.w, r3.x);
/*184*/	    r1.xyz = (r1.xyzx * r1.wwww + -r7.xyzx).xyz;
/*185*/	    r1.xyz = (r2.wwww * r1.xyzx + r7.xyzx).xyz;
/*186*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*187*/	    r1.w = inversesqrt(r1.w);
/*188*/	    r7.xyz = (r1.wwww * r1.xyzx).xyz;
/*189*/	  } else {
/*190*/	    r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*191*/	  }
/*192*/	} else {
/*193*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*194*/	}
/*195*/	color1.xyz = (sqrt(r2.xyzx)).xyz;
/*196*/	r1.x = max(abs(r7.z), abs(r7.y));
/*197*/	r1.x = max(r1.x, abs(r7.x));
/*198*/	r1.xyz = (r7.xyzx / r1.xxxx).xyz;
/*199*/	color0.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*200*/	r1.x = r0.w * vsOut_T4.y;
/*201*/	r2.x = vsOut_T0.y;
/*202*/	r2.y = vsOut_T1.y;
/*203*/	r2.z = vsOut_T2.y;
/*204*/	r1.y = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*205*/	r1.y = inversesqrt(r1.y);
/*206*/	r1.yzw = (r1.yyyy * r2.xxyz).yzw;
/*207*/	r0.x = saturate(dot(vec3(r1.yzwy), vec3(r0.xyzx)));
/*208*/	r0.y = r0.x * -2.000000 + 3.000000;
/*209*/	r0.x = r0.x * r0.x;
/*210*/	r0.x = r0.x * r0.y;
/*211*/	r4.w = r0.x * r1.x;
/*212*/	color0.w = r0.x * r0.w;
/*213*/	color1.w = r4.w;
/*214*/	color2.xyzw = r4.xyzw;
/*215*/	return;
}
