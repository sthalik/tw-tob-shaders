//
//
// Shader Model 4
// Fragment Shader
//
// id: 4139 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_environment_specular_light.hlsl_PS_ps40_standard_lighting_model_full_res.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D gbuffer_channel_1_sampler;
uniform sampler2D gbuffer_channel_2_sampler;
uniform sampler2D gbuffer_channel_3_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_environment;
uniform sampler2D s_terrain;
uniform sampler2D s_light_accumulation_buffer;
uniform sampler2D s_ssao;
uniform usampler2D t_depth_stencil_int;
uniform sampler2D t_jitter;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform parameters
{
  vec4 data[6];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (gl_FragCoord.xyxx / cb2.data[5].xxxx).xy;
/*1*/	r0.xy = (intBitsToFloat(ivec4(r0.xyxx))).xy;
/*2*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*3*/	r0.xyzw = uintBitsToFloat(texelFetch(t_depth_stencil_int, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw);
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & uint(15));
/*5*/	r0.x = uintBitsToFloat((floatBitsToInt(r0.x) != int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*6*/	r0.x = floatBitsToInt(r0.x);
/*7*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r0.x != 0) discard;
/*9*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*10*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw).zw;
/*11*/	r0.xy = (r0.xyxx * cb0.data[29].zwzz).xy;
/*12*/	r0.xyzw = r0.xyzw / cb2.data[5].xxxx;
/*13*/	r1.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.zwzz.st, r0.w)).xyzw;
/*14*/	r2.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.zwzz.st, r0.w)).xyzw;
/*15*/	r3.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.zwzz.st, r0.w)).xyzw;
/*16*/	r4.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, r0.w)).yzxw;
/*17*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*18*/	r2.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*19*/	r2.x = inversesqrt(r2.x);
/*20*/	r1.xyz = (r1.xyzx * r2.xxxx).xyz;
/*21*/	r2.x = r3.w * 255.000000 + 0.500000;
/*22*/	r2.x = floor(r2.x);
/*23*/	r2.x = uintBitsToFloat(uint(r2.x));
/*24*/	r2.yz = (uintBitsToFloat(floatBitsToUint(cb2.data[0].xxxx) & uvec4(ivec4(0, 4, 16, 0)))).yz;
/*25*/	r2.yz = (mix(vec4(0, 0, 0, 0), vec4(0, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.yyzy), uvec4(0)))).yz;
/*26*/	r3.x = -r2.w + 1.000000;
/*27*/	r2.y = r2.y * r3.x + r2.w;
/*28*/	r2.w = -r1.w + 1.000000;
/*29*/	r1.w = r2.z * r2.w + r1.w;
/*30*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*31*/	r4.w = 1.000000;
/*32*/	r3.x = dot(r4.xyzw, cb0.data[21].xyzw);
/*33*/	r3.y = dot(r4.xyzw, cb0.data[22].xyzw);
/*34*/	r3.z = dot(r4.xyzw, cb0.data[23].xyzw);
/*35*/	r0.x = dot(r4.xyzw, cb0.data[24].xyzw);
/*36*/	r3.xyz = (r3.xyzx / r0.xxxx).xyz;
/*37*/	r3.w = 1.000000;
/*38*/	r0.x = dot(r3.xyzw, cb0.data[11].xyzw);
/*39*/	r4.xyw = (-r3.xyxz + cb0.data[0].xyxz).xyw;
/*40*/	r0.y = dot(vec3(r4.xywx), vec3(r4.xywx));
/*41*/	r0.y = inversesqrt(r0.y);
/*42*/	r4.xyw = (r0.yyyy * r4.xyxw).xyw;
/*43*/	r0.y = dot(vec3(-r4.xywx), vec3(r1.xyzx));
/*44*/	r0.y = r0.y + r0.y;
/*45*/	r5.xyz = (r1.xyzx * -r0.yyyy + -r4.xywx).xyz;
/*46*/	r0.y = -r1.w + 1.000000;
/*47*/	r5.w = max(r5.y, 0.000000);
/*48*/	r1.xyzw = (textureLod(s_environment, r5.xwzx.stp, 0.000000)).xyzw;
/*49*/	r2.zw = (r3.xxxz / cb2.data[4].wwwz).zw;
/*50*/	r2.zw = (r2.zzzw + cb2.data[4].xxxy).zw;
/*51*/	r6.xyzw = (texture(s_terrain, r2.zwzz.st)).xyzw;
/*52*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*53*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*54*/	r1.w = saturate(-cb1.data[0].z)/**/;
/*55*/	r6.xyz = (r1.wwww * r6.xyzx).xyz;
/*56*/	r1.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*57*/	r1.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*58*/	r2.z = saturate(-r5.y);
/*59*/	r6.xyz = (r6.xyzx * r1.wwww + -r1.xyzx).xyz;
/*60*/	r1.xyz = (r2.zzzz * r6.xyzx + r1.xyzx).xyz;
/*61*/	r1.w = dot(vec3(r5.xyzx), vec3(-r4.xywx));
/*62*/	r1.w = max(r1.w, 0.000000);
/*63*/	r1.w = log2(r1.w);
/*64*/	r1.w = r1.w * 10.000000;
/*65*/	r1.w = exp2(r1.w);
/*66*/	r2.z = r0.y * 1.539380;
/*67*/	r2.z = cos((r2.z));
/*68*/	r2.z = inversesqrt(r2.z);
/*69*/	r2.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).z;
/*70*/	r2.w = saturate(r2.y * 60.000000);
/*71*/	r1.w = r1.w * r2.z;
/*72*/	r2.z = -r2.y + r2.w;
/*73*/	r1.w = r1.w * r2.z + r2.y;
/*74*/	r2.y = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*75*/	if(floatBitsToUint(r2.y) != 0u) {
/*76*/	  r2.y = -r4.z + cb2.data[2].z;
/*77*/	  r2.z = -cb2.data[2].y + cb2.data[2].z;
/*78*/	  r2.y = saturate(r2.y / r2.z);
/*79*/	  r2.z = uintBitsToFloat((r2.y != 1.000000) ? 0xffffffffu : 0x00000000u);
/*80*/	  if(floatBitsToUint(r2.z) != 0u) {
/*81*/	    r6.x = dot(r3.xyzw, cb0.data[1].xyzw);
/*82*/	    r6.y = dot(r3.xyzw, cb0.data[2].xyzw);
/*83*/	    r2.z = dot(r3.xyzw, cb0.data[3].xyzw);
/*84*/	    r3.xy = (r0.zwzz * cb0.data[27].xyxx).xy;
/*85*/	    r3.xy = (r3.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*86*/	    r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, -r3.xxxy)) * 0xffffffffu)).zw;
/*87*/	    r3.xy = (fract(abs(r3.xyxx))).xy;
/*88*/	    r3.xy = (mix(-r3.xyxx, r3.xyxx, greaterThan(floatBitsToUint(r3.zwzz), uvec4(0)))).xy;
/*89*/	    r3.xy = (r3.xyxx * vec4(64.000000, 64.000000, 0.000000, 0.000000)).xy;
/*90*/	    r3.xy = (intBitsToFloat(ivec4(r3.xyxx))).xy;
/*91*/	    r3.zw = (vec4(0, 0, 0, 0)).zw;
/*92*/	    r3.xyzw = texelFetch(t_jitter, floatBitsToInt(r3.xyzw).st, floatBitsToInt(r3.xyzw).a).xyzw;
/*93*/	    r3.xyz = (r3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*94*/	    r3.xyz = (r0.yyyy * r3.xyzx).xyz;
/*95*/	    r3.xyz = (r3.xyzx * vec4(0.050000, 0.050000, 0.050000, 0.000000) + r5.xyzx).xyz;
/*96*/	    r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*97*/	    r2.w = inversesqrt(r2.w);
/*98*/	    r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*99*/	    r5.x = dot(vec3(r3.xyzx), vec3(cb0.data[1].xyzx));
/*100*/	    r5.y = dot(vec3(r3.xyzx), vec3(cb0.data[2].xyzx));
/*101*/	    r5.z = dot(vec3(r3.xyzx), vec3(cb0.data[3].xyzx));
/*102*/	    r6.z = -r4.z * cb2.data[2].x + r2.z;
/*103*/	    r6.w = 1.000000;
/*104*/	    r3.x = dot(r6.xyzw, cb0.data[5].xyzw);
/*105*/	    r3.y = dot(r6.xyzw, cb0.data[6].xyzw);
/*106*/	    r3.z = dot(r6.xyzw, cb0.data[8].xyzw);
/*107*/	    r2.z = r6.z * cb2.data[0].y;
/*108*/	    r2.w = r5.z * r2.z + r6.z;
/*109*/	    r2.w = uintBitsToFloat((r2.w < cb0.data[25].x) ? 0xffffffffu : 0x00000000u);
/*110*/	    r3.w = r5.z + -cb0.data[25].x;
/*111*/	    r3.w = r3.w / r5.z;
/*112*/	        r2.z = (floatBitsToUint(r2.w) > 0x00000000u) ? r3.w : r2.z;
/*113*/	    r2.w = r2.z * r5.z;
/*114*/	    r7.xyz = (r5.xyzx * r2.zzzz + r6.xyzx).xyz;
/*115*/	    r7.w = 1.000000;
/*116*/	    r8.x = dot(r7.xyzw, cb0.data[5].xyzw);
/*117*/	    r8.y = dot(r7.xyzw, cb0.data[6].xyzw);
/*118*/	    r8.z = dot(r7.xyzw, cb0.data[8].xyzw);
/*119*/	    r2.z = r4.z * 2.000000 + -1.000000;
/*120*/	    r2.z = r2.z + -cb0.data[7].z;
/*121*/	    r2.z = cb0.data[7].w / r2.z;
/*122*/	    r2.z = -r6.z + r2.z;
/*123*/	    r3.w = r5.z * r5.z;
/*124*/	    r3.w = r3.w * cb2.data[3].z;
/*125*/	    r4.x = cb2.data[0].z * cb2.data[5].x;
/*126*/	    r4.yzw = (-r3.xxyz + r8.xxyz).yzw;
/*127*/	    r5.x = -cb2.data[1].x + cb2.data[1].y;
/*128*/	    r7.xyzw = cb0.data[29].xyxy * cb2.data[1].zzww;
/*129*/	    r5.yz = (cb0.data[29].xxyx * cb2.data[1].wwww + -r7.xxyx).yz;
/*130*/	    r6.xyw = (r1.xyxz).xyw;
/*131*/	    r8.xy = (r0.zwzz).xy;
/*132*/	    r5.w = r6.z;
/*133*/	    r8.z = r2.z;
/*134*/	    r8.w = 0;
/*135*/	    r9.x = 1.000000;
/*136*/	    while(true) {
/*137*/	      r9.y = uintBitsToFloat((r4.x < r9.x) ? 0xffffffffu : 0x00000000u);
/*138*/	      if(r9.y != 0) break;
/*139*/	      r9.y = r9.x / r4.x;
/*140*/	      r9.y = r9.y * r9.y + -r8.w;
/*141*/	      r9.y = max(r3.w, r9.y);
/*142*/	      r8.w = r8.w + r9.y;
/*143*/	      r9.y = uintBitsToFloat((1.000000 < r8.w) ? 0xffffffffu : 0x00000000u);
/*144*/	      if(floatBitsToUint(r9.y) != 0u) {
/*145*/	        break;
/*146*/	    }
/*147*/	    r9.yzw = (r8.wwww * r4.yyzw + r3.xxyz).yzw;
/*148*/	    r9.yz = (r9.yyzy / r9.wwww).yz;
/*149*/	    r9.yz = (r9.yyzy * vec4(0.000000, 0.500000, 0.500000, 0.000000) + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*150*/	    r10.xy = (uintBitsToFloat(uvec4(lessThan(r9.yzyy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*151*/	    r9.w = uintBitsToFloat(floatBitsToUint(r10.y) | floatBitsToUint(r10.x));
/*152*/	    r10.xy = (uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 0.000000, 0.000000), r9.yzyy)) * 0xffffffffu)).xy;
/*153*/	    r10.x = uintBitsToFloat(floatBitsToUint(r10.y) | floatBitsToUint(r10.x));
/*154*/	    r9.w = uintBitsToFloat(floatBitsToUint(r9.w) | floatBitsToUint(r10.x));
/*155*/	    if(floatBitsToUint(r9.w) != 0u) {
/*156*/	      break;
/*157*/	  }
/*158*/	  r9.w = r8.w * r2.w + r6.z;
/*159*/	  r10.xyzw = (textureLod(gbuffer_channel_4_sampler, r9.yzyy.st, r9.z)).xyzw;
/*160*/	  r10.x = r10.x * 2.000000 + -cb0.data[7].z;
/*161*/	  r10.x = r10.x + -1.000000;
/*162*/	  r10.x = cb0.data[7].w / r10.x;
/*163*/	  r10.x = r9.w + -r10.x;
/*164*/	  r10.y = uintBitsToFloat((0.000000 < r10.x) ? 0xffffffffu : 0x00000000u);
/*165*/	  if(floatBitsToUint(r10.y) != 0u) {
/*166*/	    r10.y = abs(r8.z) + r10.x;
/*167*/	    r10.y = r10.x / r10.y;
/*168*/	    r10.z = r5.w + -r9.w;
/*169*/	    r10.z = r10.y * r10.z + r9.w;
/*170*/	    r11.xy = (r8.xyxx + -r9.yzyy).xy;
/*171*/	    r10.yw = (r10.yyyy * r11.xxxy + r9.yyyz).yw;
/*172*/	    r11.xyzw = (textureLod(gbuffer_channel_4_sampler, r10.ywyy.st, r10.w)).xyzw;
/*173*/	    r11.x = r11.x * 2.000000 + -cb0.data[7].z;
/*174*/	    r11.x = r11.x + -1.000000;
/*175*/	    r11.x = cb0.data[7].w / r11.x;
/*176*/	    r11.y = r8.w * r5.x + cb2.data[1].x;
/*177*/	    r10.z = -r10.z + r11.x;
/*178*/	    r10.z = uintBitsToFloat((abs(r10.z) < r11.y) ? 0xffffffffu : 0x00000000u);
/*179*/	    if(floatBitsToUint(r10.z) != 0u) {
/*180*/	      r11.xy = (r10.ywyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*181*/	      r11.xy = (abs(r11.xyxx) * cb0.data[29].xyxx).xy;
/*182*/	      r11.xy = (max(r7.xyxx, r11.xyxx)).xy;
/*183*/	      r11.xy = (min(r7.zwzz, r11.xyxx)).xy;
/*184*/	      r11.xy = (-cb0.data[29].xyxx * cb2.data[1].zzzz + r11.xyxx).xy;
/*185*/	      r11.xy = (r11.xyxx / r5.yzyy).xy;
/*186*/	      r10.z = max(r11.y, r11.x);
/*187*/	      r10.z = max(r2.y, r10.z);
/*188*/	      r11.x = r8.w * r8.w;
/*189*/	      r10.z = max(r10.z, r11.x);
/*190*/	      r11.xyzw = (textureLod(s_light_accumulation_buffer, r10.ywyy.st, 0.000000)).xyzw;
/*191*/	      r12.xyz = (r6.xywx + -r11.xyzx).xyz;
/*192*/	      r10.yzw = (r10.zzzz * r12.xxyz + r11.xxyz).yzw;
/*193*/	      r6.xyw = (r10.yzyw).xyw;
/*194*/	      break;
/*195*/	  }
/*196*/	}
/*197*/	r8.xy = (r9.yzyy).xy;
/*198*/	r5.w = r9.w;
/*199*/	r8.z = r10.x;
/*200*/	r9.x = r9.x + 1.000000;
/*201*/	}
/*202*/	color0.xyz = (r6.xywx).xyz;
/*203*/	} else {
/*204*/	  color0.xyz = (r1.xyzx).xyz;
/*205*/	}
/*206*/	} else {
/*207*/	  color0.xyz = (r1.xyzx).xyz;
/*208*/	}
/*209*/	r1.x = uintBitsToFloat(floatBitsToUint(r2.x) & uint(4));
/*210*/	r2.xyzw = (texture(s_ssao, r0.zwzz.st)).xyzw;
/*211*/	if(floatBitsToUint(r1.x) != 0u) {
/*212*/	  r2.x = 1.000000;
/*213*/	}
/*214*/	color1.y = r1.w * r2.x;
/*215*/	r0.z = cb2.data[3].y + cb2.data[3].x;
/*216*/	r0.y = r0.z * r0.y;
/*217*/	r0.x = saturate(r0.y / r0.x);
/*218*/	r0.x = -r0.x + 1.000000;
/*219*/	color1.x = -r0.x * r0.x + 1.000000;
/*220*/	return;
}
