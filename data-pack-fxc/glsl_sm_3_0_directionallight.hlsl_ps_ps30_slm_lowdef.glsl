//
//
// Shader Model 4
// Fragment Shader
//
// id: 267 - fxc/glsl_SM_3_0_DirectionalLight.hlsl_PS_ps30_slm_lowdef.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_1_sampler;
uniform sampler2D gbuffer_channel_2_sampler;
uniform sampler2D gbuffer_channel_3_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D s_ssao;
uniform samplerCube s_environment;
uniform sampler2D s_overlay;
uniform sampler2D s_shroud;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb2;
layout(std140) uniform directional_light_PS
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
/*2*/	r0.xy = (r0.xyxx * cb0.data[29].zwzz).xy;
/*3*/	r1.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.zwzz.st, r0.w)).xyzw;
/*4*/	r2.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.zwzz.st, r0.w)).xyzw;
/*5*/	r3.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.zwzz.st, r0.w)).xyzw;
/*6*/	r4.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, r0.w)).yzxw;
/*7*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*8*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*9*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*10*/	r0.z = inversesqrt(r0.z);
/*11*/	r1.xyz = (r0.zzzz * r1.xyzx).xyz;
/*12*/	r0.z = r3.w * 255.000000 + 0.500000;
/*13*/	r0.z = floor(r0.z);
/*14*/	r0.z = uintBitsToFloat(uint(r0.z));
/*15*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*16*/	r4.w = 1.000000;
/*17*/	r5.x = dot(r4.xyzw, cb0.data[21].xyzw);
/*18*/	r5.y = dot(r4.xyzw, cb0.data[22].xyzw);
/*19*/	r5.z = dot(r4.xyzw, cb0.data[23].xyzw);
/*20*/	r0.x = dot(r4.xyzw, cb0.data[24].xyzw);
/*21*/	r4.xyz = (r5.xyzx / r0.xxxx).xyz;
/*22*/	r4.w = 1.000000;
/*23*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*24*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*25*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*26*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*27*/	r5.xy = (r0.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*28*/	r5.z = -r5.y + 1.000000;
/*29*/	r5.xyzw = (texture(s_ssao, r5.xzxx.st)).xyzw;
/*30*/	r0.xyw = (r4.xyxz + -cb0.data[0].xyxz).xyw;
/*31*/	r3.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*32*/	r3.w = inversesqrt(r3.w);
/*33*/	r0.xyw = (r0.xyxw * r3.wwww).xyw;
/*34*/	r3.w = -r1.w + 1.000000;
/*35*/	r4.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*36*/	r5.y = dot(vec3(r0.xywx), vec3(r1.xyzx));
/*37*/	r5.y = r5.y + r5.y;
/*38*/	r5.yzw = (r1.xxyz * -r5.yyyy + r0.xxyw).yzw;
/*39*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.wwww), uvec4(0)))).xyz;
/*40*/	r6.w = r3.w * 1.539380;
/*41*/	r6.w = cos((r6.w));
/*42*/	r6.w = inversesqrt(r6.w);
/*43*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*44*/	r7.x = saturate(r2.w * 60.000000);
/*45*/	r7.x = -r2.w + r7.x;
/*46*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*47*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*48*/	r8.x = inversesqrt(r8.x);
/*49*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*50*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*51*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*52*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*53*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*54*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*55*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*56*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*57*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*58*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*59*/	r7.yzw = (r2.xxyz * r7.yyzw).yzw;
/*60*/	r6.y = -r2.w + 1.000000;
/*61*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*62*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*63*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*64*/	  r6.y = dot(vec3(r5.yzwy), vec3(r0.xywx));
/*65*/	  r6.y = max(r6.y, 0.000000);
/*66*/	  r6.y = log2(r6.y);
/*67*/	  r6.y = r6.y * 10.000000;
/*68*/	  r6.y = exp2(r6.y);
/*69*/	  r6.y = r6.w * r6.y;
/*70*/	  r6.y = r6.y * r7.x + r2.w;
/*71*/	  r8.x = r3.w * 8.000000;
/*72*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*73*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*74*/	  r8.xyz = (r8.xyzx * r3.xyzx + r7.yzwy).xyz;
/*75*/	  r8.xyz = (r5.xxxx * r8.xyzx).xyz;
/*76*/	} else {
/*77*/	  r8.xyz = (r5.xxxx * r7.yzwy).xyz;
/*78*/	}
/*79*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*80*/	r1.y = max(r1.x, 0.000000);
/*81*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r1.x) != 0u) {
/*83*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*84*/	  r1.x = max(r1.x, -1.000000);
/*85*/	  r1.x = min(r1.x, 1.000000);
/*86*/	  r1.z = -abs(r1.x) + 1.000000;
/*87*/	  r1.z = sqrt(r1.z);
/*88*/	  r5.x = abs(r1.x) * -0.018729 + 0.074261;
/*89*/	  r5.x = r5.x * abs(r1.x) + -0.212114;
/*90*/	  r5.x = r5.x * abs(r1.x) + 1.570729;
/*91*/	  r5.y = r1.z * r5.x;
/*92*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*93*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*94*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.y));
/*95*/	  r1.x = r5.x * r1.z + r1.x;
/*96*/	  r1.z = r1.w * r1.w;
/*97*/	    r1.w = (floatBitsToUint(r4.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*98*/	  r1.z = r1.z * r1.w + r6.x;
/*99*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*100*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*101*/	  r1.w = -r1.z * r1.z + 1.000000;
/*102*/	  r1.w = max(r1.w, 0.001000);
/*103*/	  r1.w = log2(r1.w);
/*104*/	  r4.w = r1.w * 4.950617;
/*105*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*106*/	  r5.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*107*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*108*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.x) + floatBitsToInt(r1.z));
/*109*/	  r1.z = floatBitsToInt(r1.z);
/*110*/	  r4.w = r1.w * r1.w + -r4.w;
/*111*/	  r4.w = sqrt(r4.w);
/*112*/	  r1.w = -r1.w + r4.w;
/*113*/	  r1.w = max(r1.w, 0.000000);
/*114*/	  r1.w = sqrt(r1.w);
/*115*/	  r1.z = r1.w * r1.z;
/*116*/	  r1.z = r1.z * 1.414214;
/*117*/	  r1.z = 0.008727 / r1.z;
/*118*/	  r1.z = max(r1.z, 0.000100);
/*119*/	  r1.xw = (r1.xxxx + vec4(-0.008727, 0.000000, 0.000000, 0.008727)).xw;
/*120*/	  r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*121*/	  r1.xz = (r1.zzzz * r1.xxwx).xz;
/*122*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*123*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*124*/	  r9.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*125*/	  r5.zw = (r9.xxxz / r9.yyyw).zw;
/*126*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*127*/	  r1.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*128*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*129*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r1.z) + floatBitsToInt(r1.x));
/*130*/	  r1.x = floatBitsToInt(r1.x);
/*131*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*132*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*133*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*134*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*135*/	  r1.x = r1.x * r5.x + 1.000000;
/*136*/	  r1.x = r1.x * 0.500000;
/*137*/	  r1.z = 1 + ~floatBitsToInt(r1.w);
/*138*/	  r1.z = r1.z * r5.y + 1.000000;
/*139*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*140*/	  r1.z = min(r1.y, 1.000000);
/*141*/	  r1.w = r3.w * 1.570796;
/*142*/	  r1.w = sin(r1.w);
/*143*/	  r1.z = r1.z + -1.000000;
/*144*/	  r1.z = r1.w * r1.z + 1.000000;
/*145*/	  r0.x = dot(vec3(-cb1.data[0].yzwy), vec3(r0.xywx));
/*146*/	  r0.x = max(r0.x, 0.000000);
/*147*/	  r0.x = log2(r0.x);
/*148*/	  r0.x = r0.x * 10.000000;
/*149*/	  r0.x = exp2(r0.x);
/*150*/	  r0.x = r6.w * r0.x;
/*151*/	  r0.x = r0.x * r7.x + r2.w;
/*152*/	  r0.y = r1.z * abs(r1.x);
/*153*/	  r0.xyw = (r0.xxxx * r0.yyyy).xyw;
/*154*/	} else {
/*155*/	  r0.xyw = (vec4(0, 0, 0, 0)).xyw;
/*156*/	}
/*157*/	r1.xzw = saturate(r6.zzzz * r0.xxyw).xzw;
/*158*/	r1.xzw = (r3.xxyz * r1.xxzw).xzw;
/*159*/	r0.xyw = (max(r2.wwww, r0.xyxw)).xyw;
/*160*/	r0.xyw = (-r0.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*161*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*162*/	r2.xyz = (r2.xyzx * cb1.data[1].xyzx).xyz;
/*163*/	r0.xyw = (r0.xyxw * r2.xyxz).xyw;
/*164*/	r0.xyw = (r6.xxxx * r0.xyxw).xyw;
/*165*/	r0.xyw = (r1.xzxw * cb1.data[1].xyxz + r0.xyxw).xyw;
/*166*/	r1.xyz = (r0.xywx + r8.xyzx).xyz;
/*167*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.z) & uint(1));
/*168*/	if(floatBitsToUint(r0.x) != 0u) {
/*169*/	  r0.xyz = (r4.yyyy * vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*170*/	  r0.xyz = (r0.xyzx / vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*171*/	  r0.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*172*/	  r0.w = 1.000000;
/*173*/	  r2.x = dot(r0.xyzw, cb3.data[0].xyzw);
/*174*/	  r2.y = dot(r0.xyzw, cb3.data[1].xyzw);
/*175*/	  r0.x = dot(r0.xyzw, cb3.data[3].xyzw);
/*176*/	  r0.xy = (r2.xyxx / r0.xxxx).xy;
/*177*/	  r0.yz = (r0.xxyx * vec4(0.000000, 0.500000, -0.500000, 0.000000) + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*178*/	  r0.xw = (-r0.zzzz + vec4(1.000000, 0.000000, 0.000000, 1.000000)).xw;
/*179*/	  r0.xyzw = (textureLod(s_overlay, r0.ywyy.st, r0.x)).xyzw;
/*180*/	  r2.x = uintBitsToFloat((0.500000 < cb2.data[0].x) ? 0xffffffffu : 0x00000000u);
/*181*/	  if(floatBitsToUint(r2.x) != 0u) {
/*182*/	    r2.xyzw = r4.xzxz + -cb2.data[1].xyxy;
/*183*/	    r3.xyzw = -cb2.data[1].xyxy + cb2.data[1].zwzw;
/*184*/	    r2.xyzw = r2.xyzw / r3.xyzw;
/*185*/	    r3.xyzw = -cb2.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*186*/	    r2.xyzw = r2.xyzw * r3.xyzw + cb2.data[4].xyxy;
/*187*/	    r3.xyzw = (textureLod(s_shroud, r2.zwzz.st, r2.w)).xyzw;
/*188*/	    r2.xyzw = r2.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*189*/	    r2.xyzw = saturate(r2.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*190*/	    r5.xyzw = r2.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*191*/	    r2.xyzw = r2.xyzw * r2.xyzw;
/*192*/	    r2.xyzw = r2.xyzw * r5.xyzw;
/*193*/	    r2.x = r3.x * r2.x;
/*194*/	    r2.x = r2.x * r2.y;
/*195*/	    r2.x = r2.z * -r2.x + r2.x;
/*196*/	    r2.x = r2.w * -r2.x + r2.x;
/*197*/	  } else {
/*198*/	    r2.x = 1.000000;
/*199*/	  }
/*200*/	  r2.x = saturate(r2.x + -0.500000);
/*201*/	  r2.x = r2.x * 1.900000 + 0.050000;
/*202*/	  r2.y = uintBitsToFloat((r4.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*203*/	    r2.y = (floatBitsToUint(r2.y) > 0x00000000u) ? 0 : 1.000000;
/*204*/	  r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*205*/	  r0.xyz = (r0.xyzx * r2.xxxx + r3.xyzx).xyz;
/*206*/	  r0.xyz = (-r1.xyzx + r0.xyzx).xyz;
/*207*/	  r1.xyz = (r2.yyyy * r0.xyzx + r1.xyzx).xyz;
/*208*/	}
/*209*/	r0.x = uintBitsToFloat((2.000000 < r4.y) ? 0xffffffffu : 0x00000000u);
/*210*/	r0.y = saturate(-r4.y * cb3.data[4].x);
/*211*/	r1.w = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*212*/	color0.xyzw = saturate(r1.xyzw);
/*213*/	return;
}
