//
//
// Shader Model 4
// Fragment Shader
//
// id: 183 - fxc/glsl_SM_4_0_environment_specular_light.hlsl_PS_ps40_standard_lighting_model.glsl
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
/*74*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*75*/	if(floatBitsToUint(r1.w) != 0u) {
/*76*/	  r1.w = -r4.z + cb2.data[2].z;
/*77*/	  r2.y = -cb2.data[2].y + cb2.data[2].z;
/*78*/	  r1.w = saturate(r1.w / r2.y);
/*79*/	  r2.y = uintBitsToFloat((r1.w != 1.000000) ? 0xffffffffu : 0x00000000u);
/*80*/	  if(floatBitsToUint(r2.y) != 0u) {
/*81*/	    r6.x = dot(r3.xyzw, cb0.data[1].xyzw);
/*82*/	    r6.y = dot(r3.xyzw, cb0.data[2].xyzw);
/*83*/	    r2.y = dot(r3.xyzw, cb0.data[3].xyzw);
/*84*/	    r2.zw = (r0.zzzw * cb0.data[27].xxxy).zw;
/*85*/	    r2.zw = (r2.zzzw * vec4(0.000000, 0.000000, 0.015625, 0.015625)).zw;
/*86*/	    r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, -r2.zwzz)) * 0xffffffffu)).xy;
/*87*/	    r2.zw = (fract(abs(r2.zzzw))).zw;
/*88*/	    r2.zw = (mix(-r2.zzzw, r2.zzzw, greaterThan(floatBitsToUint(r3.xxxy), uvec4(0)))).zw;
/*89*/	    r2.zw = (r2.zzzw * vec4(0.000000, 0.000000, 64.000000, 64.000000)).zw;
/*90*/	    r3.xy = (intBitsToFloat(ivec4(r2.zwzz))).xy;
/*91*/	    r3.zw = (vec4(0, 0, 0, 0)).zw;
/*92*/	    r3.xyzw = texelFetch(t_jitter, floatBitsToInt(r3.xyzw).st, floatBitsToInt(r3.xyzw).a).xyzw;
/*93*/	    r3.xyz = (r3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*94*/	    r3.xyz = (r0.yyyy * r3.xyzx).xyz;
/*95*/	    r3.xyz = (r3.xyzx * vec4(0.050000, 0.050000, 0.050000, 0.000000) + r5.xyzx).xyz;
/*96*/	    r2.z = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*97*/	    r2.z = inversesqrt(r2.z);
/*98*/	    r3.xyz = (r2.zzzz * r3.xyzx).xyz;
/*99*/	    r5.x = dot(vec3(r3.xyzx), vec3(cb0.data[1].xyzx));
/*100*/	    r5.y = dot(vec3(r3.xyzx), vec3(cb0.data[2].xyzx));
/*101*/	    r5.z = dot(vec3(r3.xyzx), vec3(cb0.data[3].xyzx));
/*102*/	    r6.z = -r4.z * cb2.data[2].x + r2.y;
/*103*/	    r6.w = 1.000000;
/*104*/	    r3.x = dot(r6.xyzw, cb0.data[5].xyzw);
/*105*/	    r3.y = dot(r6.xyzw, cb0.data[6].xyzw);
/*106*/	    r3.z = dot(r6.xyzw, cb0.data[8].xyzw);
/*107*/	    r2.y = r6.z * cb2.data[0].y;
/*108*/	    r2.z = r5.z * r2.y + r6.z;
/*109*/	    r2.z = uintBitsToFloat((r2.z < cb0.data[25].x) ? 0xffffffffu : 0x00000000u);
/*110*/	    r2.w = r5.z + -cb0.data[25].x;
/*111*/	    r2.w = r2.w / r5.z;
/*112*/	        r2.y = (floatBitsToUint(r2.z) > 0x00000000u) ? r2.w : r2.y;
/*113*/	    r2.z = r2.y * r5.z;
/*114*/	    r7.xyz = (r5.xyzx * r2.yyyy + r6.xyzx).xyz;
/*115*/	    r7.w = 1.000000;
/*116*/	    r8.x = dot(r7.xyzw, cb0.data[5].xyzw);
/*117*/	    r8.y = dot(r7.xyzw, cb0.data[6].xyzw);
/*118*/	    r8.z = dot(r7.xyzw, cb0.data[8].xyzw);
/*119*/	    r2.y = r4.z * 2.000000 + -1.000000;
/*120*/	    r2.y = r2.y + -cb0.data[7].z;
/*121*/	    r2.y = cb0.data[7].w / r2.y;
/*122*/	    r2.y = -r6.z + r2.y;
/*123*/	    r2.w = r5.z * r5.z;
/*124*/	    r2.w = r2.w * cb2.data[3].z;
/*125*/	    r3.w = cb2.data[0].z * cb2.data[5].x;
/*126*/	    r4.xyz = (-r3.xyzx + r8.xyzx).xyz;
/*127*/	    r4.w = -cb2.data[1].x + cb2.data[1].y;
/*128*/	    r5.xyzw = cb0.data[29].xyxy * cb2.data[1].zzww;
/*129*/	    r6.xy = (cb0.data[29].xyxx * cb2.data[1].wwww + -r5.xyxx).xy;
/*130*/	    r7.xyz = (r1.xyzx).xyz;
/*131*/	    r8.xy = (r0.zwzz).xy;
/*132*/	    r6.w = r6.z;
/*133*/	    r7.w = r2.y;
/*134*/	    r8.zw = (vec4(0, 0, 0, 1.000000)).zw;
/*135*/	    while(true) {
/*136*/	      r9.x = uintBitsToFloat((r3.w < r8.w) ? 0xffffffffu : 0x00000000u);
/*137*/	      if(r9.x != 0) break;
/*138*/	      r9.x = r8.w / r3.w;
/*139*/	      r9.x = r9.x * r9.x + -r8.z;
/*140*/	      r9.x = max(r2.w, r9.x);
/*141*/	      r8.z = r8.z + r9.x;
/*142*/	      r9.x = uintBitsToFloat((1.000000 < r8.z) ? 0xffffffffu : 0x00000000u);
/*143*/	      if(floatBitsToUint(r9.x) != 0u) {
/*144*/	        break;
/*145*/	    }
/*146*/	    r9.xyz = (r8.zzzz * r4.xyzx + r3.xyzx).xyz;
/*147*/	    r9.xy = (r9.xyxx / r9.zzzz).xy;
/*148*/	    r9.xy = (r9.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*149*/	    r9.zw = (uintBitsToFloat(uvec4(lessThan(r9.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*150*/	    r9.z = uintBitsToFloat(floatBitsToUint(r9.w) | floatBitsToUint(r9.z));
/*151*/	    r10.xy = (uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 0.000000, 0.000000), r9.xyxx)) * 0xffffffffu)).xy;
/*152*/	    r9.w = uintBitsToFloat(floatBitsToUint(r10.y) | floatBitsToUint(r10.x));
/*153*/	    r9.z = uintBitsToFloat(floatBitsToUint(r9.w) | floatBitsToUint(r9.z));
/*154*/	    if(floatBitsToUint(r9.z) != 0u) {
/*155*/	      break;
/*156*/	  }
/*157*/	  r9.z = r8.z * r2.z + r6.z;
/*158*/	  r10.xyzw = (textureLod(gbuffer_channel_4_sampler, r9.xyxx.st, r9.y)).xyzw;
/*159*/	  r9.w = r10.x * 2.000000 + -cb0.data[7].z;
/*160*/	  r9.w = r9.w + -1.000000;
/*161*/	  r9.w = cb0.data[7].w / r9.w;
/*162*/	  r9.w = -r9.w + r9.z;
/*163*/	  r10.x = uintBitsToFloat((0.000000 < r9.w) ? 0xffffffffu : 0x00000000u);
/*164*/	  if(floatBitsToUint(r10.x) != 0u) {
/*165*/	    r10.x = abs(r7.w) + r9.w;
/*166*/	    r10.x = r9.w / r10.x;
/*167*/	    r10.y = r6.w + -r9.z;
/*168*/	    r10.y = r10.x * r10.y + r9.z;
/*169*/	    r10.zw = (r8.xxxy + -r9.xxxy).zw;
/*170*/	    r10.xz = (r10.xxxx * r10.zzwz + r9.xxyx).xz;
/*171*/	    r11.xyzw = (textureLod(gbuffer_channel_4_sampler, r10.xzxx.st, r10.z)).xyzw;
/*172*/	    r10.w = r11.x * 2.000000 + -cb0.data[7].z;
/*173*/	    r10.w = r10.w + -1.000000;
/*174*/	    r10.w = cb0.data[7].w / r10.w;
/*175*/	    r11.x = r8.z * r4.w + cb2.data[1].x;
/*176*/	    r10.y = -r10.y + r10.w;
/*177*/	    r10.y = uintBitsToFloat((abs(r10.y) < r11.x) ? 0xffffffffu : 0x00000000u);
/*178*/	    if(floatBitsToUint(r10.y) != 0u) {
/*179*/	      r10.yw = (r10.xxxz * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*180*/	      r10.yw = (abs(r10.yyyw) * cb0.data[29].xxxy).yw;
/*181*/	      r10.yw = (max(r5.xxxy, r10.yyyw)).yw;
/*182*/	      r10.yw = (min(r5.zzzw, r10.yyyw)).yw;
/*183*/	      r10.yw = (-cb0.data[29].xxxy * cb2.data[1].zzzz + r10.yyyw).yw;
/*184*/	      r10.yw = (r10.yyyw / r6.xxxy).yw;
/*185*/	      r10.y = max(r10.w, r10.y);
/*186*/	      r10.y = max(r1.w, r10.y);
/*187*/	      r10.w = r8.z * r8.z;
/*188*/	      r10.y = max(r10.w, r10.y);
/*189*/	      r11.xyzw = (textureLod(s_light_accumulation_buffer, r10.xzxx.st, 0.000000)).xyzw;
/*190*/	      r10.xzw = (r7.xxyz + -r11.xxyz).xzw;
/*191*/	      r10.xyz = (r10.yyyy * r10.xzwx + r11.xyzx).xyz;
/*192*/	      r7.xyz = (r10.xyzx).xyz;
/*193*/	      break;
/*194*/	  }
/*195*/	}
/*196*/	r8.xy = (r9.xyxx).xy;
/*197*/	r6.w = r9.z;
/*198*/	r7.w = r9.w;
/*199*/	r8.w = r8.w + 1.000000;
/*200*/	}
/*201*/	color0.xyz = (r7.xyzx).xyz;
/*202*/	} else {
/*203*/	  color0.xyz = (r1.xyzx).xyz;
/*204*/	}
/*205*/	} else {
/*206*/	  color0.xyz = (r1.xyzx).xyz;
/*207*/	}
/*208*/	r1.x = uintBitsToFloat(floatBitsToUint(r2.x) & uint(4));
/*209*/	r2.xyzw = (texture(s_ssao, r0.zwzz.st)).xyzw;
/*210*/	if(floatBitsToUint(r1.x) == 0u) {
/*211*/	  color1.y = r2.x;
/*212*/	} else {
/*213*/	  color1.y = 1.000000;
/*214*/	}
/*215*/	r0.z = cb2.data[3].y + cb2.data[3].x;
/*216*/	r0.y = r0.z * r0.y;
/*217*/	r0.x = saturate(r0.y / r0.x);
/*218*/	r0.x = -r0.x + 1.000000;
/*219*/	color1.x = -r0.x * r0.x + 1.000000;
/*220*/	return;
}
