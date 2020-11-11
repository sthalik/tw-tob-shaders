//
//
// Shader Model 4
// Fragment Shader
//
// id: 1538 - fxc/glsl_SM_4_0_particle_vfx_main.hlsl_PS_ps_main_high_quality.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 gsOut_C0;
flat in uvec4 gsOut_T0;
in vec4 gsOut_T1;
in vec4 gsOut_T2;
in vec4 gsOut_T3;
in vec4 gsOut_T4;
in vec4 gsOut_T5;
in vec4 gsOut_T6;

layout(location = 0) out vec4 color0;

uniform samplerCube s_environment;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_sky;
uniform sampler2DArray g_sam_diffuse;
uniform sampler2DArray g_sam_normal;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;
layout(std140) uniform cb_vfx
{
  vec4 data[4];
} cb3;
layout(std140) uniform cb_vfx_emitter_constants_common
{
  vec4 data[512];
} cb4;
layout(std140) uniform cb_vfx_emitter_constants_ps
{
  vec4 data[3584];
} cb5;

void main()
{
  color0 = vec4(0);
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

/*0*/	r0.x = uintBitsToFloat(uint(gsOut_T0.x));
/*1*/	r0.y = uintBitsToFloat(uint(cb5.data[floatBitsToUint(r0.x)+2560u].x));
/*2*/	r1.xyzw = uintBitsToFloat(uvec4(vec4(0x00020000u, 0x00400000u, 0x00080000u, 0x00800000u)) & floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].xxxx));
/*3*/	if(floatBitsToUint(r1.x) != 0u) {
/*4*/	  r2.xyz = (dFdx(gsOut_T1.xyxx)).xyz;
/*5*/	  r3.xyz = (dFdy(gsOut_T1.xyxx)).xyz;
/*6*/	  r4.z = floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].y);
/*7*/	  r4.xy = (gsOut_T1.xyxx).xy;
/*8*/	  r5.xyzw = (textureGrad(g_sam_diffuse, r4.xyzx.stp, vec2(r2.xyzx), vec2(r3.xyzx))).xyzw;
/*9*/	  r4.xy = (gsOut_T6.xyxx).xy;
/*10*/	  r2.xyzw = (textureGrad(g_sam_diffuse, r4.xyzx.stp, vec2(r2.xyzx), vec2(r3.xyzx))).xyzw;
/*11*/	  r2.xyzw = -r5.xyzw + r2.xyzw;
/*12*/	  r2.xyzw = gsOut_T6.zzzz * r2.xyzw + r5.xyzw;
/*13*/	  r3.xyz = (min(r2.wwww, r2.xyzx)).xyz;
/*14*/	  r3.xyz = (r3.xyzx * gsOut_C0.xyzx).xyz;
/*15*/	  r3.xyz = (r3.xyzx * gsOut_C0.wwww).xyz;
/*16*/	  r3.w = r2.w * gsOut_C0.w;
/*17*/	  r2.xyz = saturate(-r2.wwww + r2.xyzx).xyz;
/*18*/	  r4.xyz = (gsOut_C0.wwww * gsOut_C0.xyzx).xyz;
/*19*/	  r2.xyz = (r2.xyzx * r4.xyzx).xyz;
/*20*/	} else {
/*21*/	  r3.xyzw = gsOut_C0.xyzw;
/*22*/	  r2.xyz = (vec4(0, 0, 0, 0)).xyz;
/*23*/	}
/*24*/	r0.z = uintBitsToFloat((cb5.data[floatBitsToUint(r0.x)+2560u].y == cb5.data[floatBitsToUint(r0.x)+2560u].z) ? 0xffffffffu : 0x00000000u);
/*25*/	r0.w = 1.000000 + -cb5.data[floatBitsToUint(r0.x)+2560u].w;
/*26*/	r1.x = max(r0.w, cb5.data[floatBitsToUint(r0.x)+2560u].y);
/*27*/	r4.xy = (gsOut_T5.xxxx * vec4(3276.000000, 4099.000000, 0.000000, 0.000000)).xy;
/*28*/	r4.xy = (fract(r4.xyxx)).xy;
/*29*/	r1.x = r1.x + -1.000000;
/*30*/	r1.x = r4.x * r1.x + 1.000000;
/*31*/	r0.w = r0.w * cb5.data[floatBitsToUint(r0.x)+2560u].z;
/*32*/	r0.w = max(r0.w, cb5.data[floatBitsToUint(r0.x)+2560u].y);
/*33*/	r0.w = r0.w + -cb5.data[floatBitsToUint(r0.x)+2560u].z;
/*34*/	r0.w = r4.y * r0.w + cb5.data[floatBitsToUint(r0.x)+2560u].z;
/*35*/	r0.z = (floatBitsToUint(r0.z) > 0x00000000u) ? r1.x : r0.w;
/*36*/	r0.z = r0.z + -cb5.data[floatBitsToUint(r0.x)+2560u].y;
/*37*/	r0.z = max(r0.z, 0.001000);
/*38*/	r0.w = gsOut_T2.w + -cb5.data[floatBitsToUint(r0.x)+2560u].y;
/*39*/	r0.z = saturate(r0.w / r0.z);
/*40*/	r0.w = saturate(-r0.z + r3.w);
/*41*/	r1.x = -r0.z + 1.001000;
/*42*/	r0.w = r0.w / r1.x;
/*43*/	r0.z = -r0.z + r0.w;
/*44*/	r0.z = uintBitsToFloat((r0.z >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*45*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.z) & uint(0x3f800000u));
/*46*/	r0.z = r0.w * r0.z;
/*47*/	r4.w = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.z : r0.w;
/*48*/	r0.y = uintBitsToFloat((r3.w != 0.000000) ? 0xffffffffu : 0x00000000u);
/*49*/	r0.z = r4.w / r3.w;
/*50*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.z : 1.000000;
/*51*/	r4.xyz = (r0.yyyy * r3.xyzx).xyz;
/*52*/	r3.xyzw = mix(r3.xyzw, r4.xyzw, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)));
/*53*/	r4.xyz = (r2.xyzx + r3.xyzx).xyz;
/*54*/	r4.w = r3.w;
/*55*/	r5.xyzw = uintBitsToFloat(uvec4(lessThan(r4.xyzw, vec4(0.020000, 0.020000, 0.020000, 0.020000))) * 0xffffffffu);
/*56*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r5.zzwz) & floatBitsToUint(r5.xxyx))).yz;
/*57*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.y));
/*58*/	if(r0.y != 0) discard;
/*59*/	r0.y = uintBitsToFloat((0.100000 < r4.w) ? 0xffffffffu : 0x00000000u);
/*60*/	r5.z = floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].z);
/*61*/	r5.xy = (gsOut_T1.xyxx).xy;
/*62*/	r5.xyzw = (texture(g_sam_normal, r5.xyzx.stp)).xyzw;
/*63*/	if(floatBitsToUint(r0.y) != 0u) {
/*64*/	  r0.yzw = (uintBitsToFloat(uvec4(vec4(0, 0x00040000u, 0x00100000u, 0x00200000u)) & floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].xxxx))).yzw;
/*65*/	  if(floatBitsToUint(r0.y) != 0u) {
/*66*/	    r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*67*/	  } else {
/*68*/	    r5.xyz = (vec4(0, 0, 1.000000, 0)).xyz;
/*69*/	  }
/*70*/	  if(floatBitsToUint(r0.z) != 0u) {
/*71*/	    r0.y = 1.000000 * cb5.data[floatBitsToUint(r0.x)+1024u].x;
/*72*/	  } else {
/*73*/	    r0.y = 1.000000;
/*74*/	  }
/*75*/	  if(floatBitsToUint(r0.w) != 0u) {
/*76*/	    r0.z = uintBitsToFloat(uint(cb5.data[floatBitsToUint(r0.x)+1536u].x));
/*77*/	    r0.w = uintBitsToFloat((r4.w < 0.200000) ? 0xffffffffu : 0x00000000u);
/*78*/	    r1.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*79*/	    r6.xyz = (mix(vec4(1.000000, 0.500000, 1.000000, 0), vec4(360.000000, 180.000000, 0.004000, 0), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*80*/	    r7.xyz = (cb1.data[1].xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r6.yyyy).xyz;
/*81*/	    r8.xyz = (r6.zzzz * r7.xyzx).xyz;
/*82*/	    r1.x = saturate(cb5.data[floatBitsToUint(r0.x)+1536u].z)/**/;
/*83*/	    r7.xyz = (-r7.xyzx * r6.zzzz + cb5.data[floatBitsToUint(r0.x)+1536u].zzzz).xyz;
/*84*/	    r7.xyz = (r1.xxxx * r7.xyzx + r8.xyzx).xyz;
/*85*/	    r8.xyz = (r2.xyzx * cb5.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*86*/	    r7.xyz = (r7.xyzx * r3.xyzx + r8.xyzx).xyz;
/*87*/	    r4.xyz = (mix(r3.xyzx, r7.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*88*/	    r6.yw = (-r5.yyyy * gsOut_T4.zzzw).yw;
/*89*/	    r6.yw = (r5.xxxx * gsOut_T4.xxxy + r6.yyyw).yw;
/*90*/	    r7.xyz = (r6.wwww * cb3.data[1].xyzx).xyz;
/*91*/	    r7.xyz = (-r6.yyyy * cb3.data[0].xyzx + -r7.xyzx).xyz;
/*92*/	    r7.xyz = (-r5.zzzz * cb3.data[2].xyzx + r7.xyzx).xyz;
/*93*/	    if(floatBitsToUint(r0.z) != 0u) {
/*94*/	      r0.z = uintBitsToFloat(uint(cb5.data[floatBitsToUint(r0.x)+1536u].y));
/*95*/	      r0.w = dot(vec3(-cb1.data[0].yzwy), vec3(-cb1.data[0].yzwy));
/*96*/	      r0.w = inversesqrt(r0.w);
/*97*/	      r9.xyz = (r0.wwww * -cb1.data[0].yzwy).xyz;
/*98*/	      r0.w = dot(vec3(r9.xyzx), vec3(r7.xyzx));
/*99*/	      r0.w = max(r0.w, 0.000000);
/*100*/	      r0.w = r0.w + -1.000000;
/*101*/	      r0.w = r0.w * cb5.data[floatBitsToUint(r0.x)+2048u].y;
/*102*/	      r0.w = gsOut_T3.w * r0.w + 1.000000;
/*103*/	      r9.xyz = (r3.xyzx * cb5.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*104*/	      r10.xyz = (r0.wwww * r9.xyzx).xyz;
/*105*/	      r10.xyz = (r10.xyzx * cb1.data[1].xyzx).xyz;
/*106*/	      r10.xyz = (r6.zzzz * r10.xyzx).xyz;
/*107*/	      r11.xyz = (r6.xxxx * cb1.data[4].xyzx).xyz;
/*108*/	      r9.xyz = (r9.xyzx * r11.xyzx).xyz;
/*109*/	      r9.xyz = (r6.zzzz * r9.xyzx).xyz;
/*110*/	      r9.xyz = (r0.yyyy * r10.xyzx + r9.xyzx).xyz;
/*111*/	      r3.xyz = (r9.xyzx * gsOut_T3.zzzz).xyz;
/*112*/	      r0.z = floatBitsToUint(r0.z);
/*113*/	      r0.w = r4.w * gsOut_T3.w + -r3.w;
/*114*/	      r3.w = r0.z * r0.w + r4.w;
/*115*/	    } else {
/*116*/	      r9.xyz = (r7.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*117*/	      r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*118*/	      r0.z = inversesqrt(r0.z);
/*119*/	      r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*120*/	      r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*121*/	      r11.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*122*/	      r10.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*123*/	      r12.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*124*/	      r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*125*/	      r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*126*/	      r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*127*/	      r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*128*/	      r6.xyw = (r6.xxxx * r9.xyxz).xyw;
/*129*/	      r0.z = dot(vec3(-cb1.data[0].yzwy), vec3(-cb1.data[0].yzwy));
/*130*/	      r0.z = inversesqrt(r0.z);
/*131*/	      r9.xyz = (r0.zzzz * -cb1.data[0].yzwy).xyz;
/*132*/	      r0.z = dot(vec3(cb0.data[3].xyzx), vec3(cb0.data[3].xyzx));
/*133*/	      r0.z = inversesqrt(r0.z);
/*134*/	      r10.xyz = (r0.zzzz * cb0.data[3].xyzx).xyz;
/*135*/	      r0.z = dot(vec3(-r9.xyzx), vec3(r10.xyzx));
/*136*/	      r0.w = cb5.data[floatBitsToUint(r0.x)+2048u].w + cb5.data[floatBitsToUint(r0.x)+2048u].z;
/*137*/	      r1.y = dot(vec3(r9.xyzx), vec3(r7.xyzx));
/*138*/	      r1.y = r1.y * -0.500000 + 0.500000;
/*139*/	      r1.y = -r0.w * r1.y;
/*140*/	      r1.y = r1.y * cb5.data[floatBitsToUint(r0.x)+2048u].x;
/*141*/	      r1.y = r1.y * gsOut_T3.x;
/*142*/	      r1.y = r1.y * 1.442695;
/*143*/	      r1.y = exp2(r1.y);
/*144*/	      r2.w = 1.000000 + -cb5.data[floatBitsToUint(r0.x)+1536u].w;
/*145*/	      r2.w = r2.w * r2.w;
/*146*/	      r2.w = r2.w * 0.079577;
/*147*/	      r5.w = cb5.data[floatBitsToUint(r0.x)+1536u].w * cb5.data[floatBitsToUint(r0.x)+1536u].w + 1.000000;
/*148*/	      r7.x = dot(vec2(r0.zzzz), vec2(cb5.data[floatBitsToUint(r0.x)+1536u].wwww));
/*149*/	      r5.w = r5.w + -r7.x;
/*150*/	      r5.w = log2(r5.w);
/*151*/	      r5.w = r5.w * 1.500000;
/*152*/	      r5.w = exp2(r5.w);
/*153*/	      r2.w = r2.w / r5.w;
/*154*/	      r2.w = r2.w * cb5.data[floatBitsToUint(r0.x)+2048u].w;
/*155*/	      r0.z = r0.z * r0.z + 1.000000;
/*156*/	      r0.z = r0.z * 0.059683;
/*157*/	      r0.z = r0.z * cb5.data[floatBitsToUint(r0.x)+2048u].z + r2.w;
/*158*/	      r0.z = r0.z / r0.w;
/*159*/	      r0.w = -r1.y + 1.000000;
/*160*/	      r0.z = r0.z * r0.w + r1.y;
/*161*/	      r7.xyz = (r0.zzzz * cb1.data[1].xyzx).xyz;
/*162*/	      r0.yzw = (r7.xxyz * r0.yyyy + r6.xxyw).yzw;
/*163*/	      r6.xyw = (r6.zzzz * r0.yzyw).xyw;
/*164*/	      r0.yzw = (-r0.yyzw * r6.zzzz + cb5.data[floatBitsToUint(r0.x)+1536u].zzzz).yzw;
/*165*/	      r0.yzw = (r1.xxxx * r0.yyzw + r6.xxyw).yzw;
/*166*/	      r3.xyz = (r0.yzwy * r3.xyzx + r8.xyzx).xyz;
/*167*/	      r3.w = r4.w;
/*168*/	    }
/*169*/	  } else {
/*170*/	    r4.xyz = (r3.xyzx).xyz;
/*171*/	  }
/*172*/	  r0.y = r4.w + -0.100000;
/*173*/	  r0.y = r0.y * 10.000000;
/*174*/	  r0.y = min(r0.y, 1.000000);
/*175*/	  r6.xyzw = r3.xyzw + -r4.xyzw;
/*176*/	  r4.xyzw = r0.yyyy * r6.xyzw + r4.xyzw;
/*177*/	} else {
/*178*/	  r0.y = uintBitsToFloat(uint(0x00200000u) & floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].x));
/*179*/	  r0.z = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*180*/	  r0.zw = (mix(vec4(0, 0, 0.500000, 1.000000), vec4(0, 0, 180.000000, 0.004000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*181*/	  r6.xyz = (cb1.data[1].xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r0.zzzz).xyz;
/*182*/	  r7.xyz = (r0.wwww * r6.xyzx).xyz;
/*183*/	  r0.z = saturate(cb5.data[floatBitsToUint(r0.x)+1536u].z)/**/;
/*184*/	  r6.xyz = (-r6.xyzx * r0.wwww + cb5.data[floatBitsToUint(r0.x)+1536u].zzzz).xyz;
/*185*/	  r6.xyz = (r0.zzzz * r6.xyzx + r7.xyzx).xyz;
/*186*/	  r2.xyz = (r2.xyzx * cb5.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*187*/	  r2.xyz = (r6.xyzx * r3.xyzx + r2.xyzx).xyz;
/*188*/	  r4.xyz = (mix(r3.xyzx, r2.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*189*/	  r5.xyz = (vec4(0, 0, 1.000000, 0)).xyz;
/*190*/	}
/*191*/	if(floatBitsToUint(r1.z) != 0u) {
/*192*/	  r0.y = max(0.000000, cb5.data[floatBitsToUint(r0.x)+512u].x);
/*193*/	  r0.z = -r0.y + 1.000000;
/*194*/	  r1.xyz = (gsOut_T2.xyzx + -cb0.data[0].xyzx).xyz;
/*195*/	  r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*196*/	  r0.w = inversesqrt(r0.w);
/*197*/	  r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*198*/	  r0.w = dot(vec3(-r1.xyzx), vec3(r5.xyzx));
/*199*/	  r0.w = r0.w + r0.w;
/*200*/	  r2.xyz = (r5.xyzx * -r0.wwww + -r1.xyzx).xyz;
/*201*/	  r0.w = 1.000000 + -cb5.data[floatBitsToUint(r0.x)+512u].y;
/*202*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r5.xyzx));
/*203*/	  r3.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*204*/	  if(floatBitsToUint(r3.x) != 0u) {
/*205*/	    r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r2.xyzx));
/*206*/	    r3.x = max(r3.x, -1.000000);
/*207*/	    r3.x = min(r3.x, 1.000000);
/*208*/	    r3.y = -abs(r3.x) + 1.000000;
/*209*/	    r3.y = sqrt(r3.y);
/*210*/	    r3.z = abs(r3.x) * -0.018729 + 0.074261;
/*211*/	    r3.z = r3.z * abs(r3.x) + -0.212114;
/*212*/	    r3.z = r3.z * abs(r3.x) + 1.570729;
/*213*/	    r3.w = r3.y * r3.z;
/*214*/	    r3.w = r3.w * -2.000000 + 3.141593;
/*215*/	    r3.x = uintBitsToFloat((r3.x < -r3.x) ? 0xffffffffu : 0x00000000u);
/*216*/	    r3.x = uintBitsToFloat(floatBitsToUint(r3.x) & floatBitsToUint(r3.w));
/*217*/	    r3.x = r3.z * r3.y + r3.x;
/*218*/	    r3.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*219*/	    r3.z = cb5.data[floatBitsToUint(r0.x)+512u].y * cb5.data[floatBitsToUint(r0.x)+512u].y;
/*220*/	    r3.yw = (mix(vec4(0, 1.000000, 0, -0.000100), vec4(0, 0.004000, 0, 0.995900), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).yw;
/*221*/	    r3.y = r3.z * r3.w + r3.y;
/*222*/	    r3.y = r3.y * 0.500000 + 0.500000;
/*223*/	    r3.y = r3.y * 2.000000 + -1.000000;
/*224*/	    r3.z = -r3.y * r3.y + 1.000000;
/*225*/	    r3.z = max(r3.z, 0.001000);
/*226*/	    r3.z = log2(r3.z);
/*227*/	    r3.w = r3.z * 4.950617;
/*228*/	    r3.z = r3.z * 0.346574 + 4.546885;
/*229*/	    r5.x = uintBitsToFloat((0.000000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*230*/	    r3.y = uintBitsToFloat((r3.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*231*/	    r3.y = intBitsToFloat(1 + ~floatBitsToInt(r5.x) + floatBitsToInt(r3.y));
/*232*/	    r3.y = floatBitsToInt(r3.y);
/*233*/	    r3.w = r3.z * r3.z + -r3.w;
/*234*/	    r3.w = sqrt(r3.w);
/*235*/	    r3.z = -r3.z + r3.w;
/*236*/	    r3.z = max(r3.z, 0.000000);
/*237*/	    r3.z = sqrt(r3.z);
/*238*/	    r3.y = r3.z * r3.y;
/*239*/	    r3.y = r3.y * 1.414214;
/*240*/	    r3.y = 0.008727 / r3.y;
/*241*/	    r3.y = max(r3.y, 0.000100);
/*242*/	    r3.xz = (r3.xxxx + vec4(-0.008727, 0.000000, 0.008727, 0.000000)).xz;
/*243*/	    r3.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.y)).y;
/*244*/	    r3.xy = (r3.yyyy * r3.xzxx).xy;
/*245*/	    r3.zw = (r3.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*246*/	    r3.zw = (r3.zzzw * r3.zzzw).zw;
/*247*/	    r5.xyzw = r3.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*248*/	    r5.xy = (r5.xzxx / r5.ywyy).xy;
/*249*/	    r3.zw = (-r3.zzzw * r5.xxxy).zw;
/*250*/	    r5.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*251*/	    r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*252*/	    r3.x = intBitsToFloat(1 + ~floatBitsToInt(r5.x) + floatBitsToInt(r3.x));
/*253*/	    r3.x = floatBitsToInt(r3.x);
/*254*/	    r3.yz = (r3.zzwz * vec4(0.000000, 1.442695, 1.442695, 0.000000)).yz;
/*255*/	    r3.yz = (exp2(r3.yyzy)).yz;
/*256*/	    r3.yz = (-r3.yyzy + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*257*/	    r3.yz = (sqrt(r3.yyzy)).yz;
/*258*/	    r3.x = r3.x * r3.y + 1.000000;
/*259*/	    r3.x = r3.x * 0.500000;
/*260*/	    r3.y = 1 + ~floatBitsToInt(r5.y);
/*261*/	    r3.y = r3.y * r3.z + 1.000000;
/*262*/	    r3.x = r3.y * 0.500000 + -r3.x;
/*263*/	    r2.w = saturate(r2.w);
/*264*/	    r3.yzw = (r0.wwwy * vec4(0.000000, 1.570796, 1.539380, 60.000000)).yzw;
/*265*/	    r3.y = sin(r3.y);
/*266*/	    r2.w = r2.w + -1.000000;
/*267*/	    r2.w = r3.y * r2.w + 1.000000;
/*268*/	    r3.y = dot(vec3(-cb1.data[0].yzwy), vec3(-cb1.data[0].yzwy));
/*269*/	    r3.y = log2(r3.y);
/*270*/	    r3.y = r3.y * 10.000000;
/*271*/	    r3.y = exp2(r3.y);
/*272*/	        r3.z = cos((r3.z));
/*273*/	    r3.z = inversesqrt(r3.z);
/*274*/	    r3.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.z)).z;
/*275*/	    r3.w = min(r3.w, 1.000000);
/*276*/	    r3.y = r3.z * r3.y;
/*277*/	    r3.z = -r0.y + r3.w;
/*278*/	    r3.y = r3.y * r3.z + r0.y;
/*279*/	    r2.w = r2.w * abs(r3.x);
/*280*/	    r2.w = r3.y * r2.w;
/*281*/	  } else {
/*282*/	    r2.w = 0;
/*283*/	  }
/*284*/	  r3.xyz = (r2.wwww * cb5.data[floatBitsToUint(r0.x)].xyzx).xyz;
/*285*/	  r3.xyz = (r3.xyzx * cb1.data[1].xyzx).xyz;
/*286*/	  r3.xyz = (r3.xyzx * cb5.data[floatBitsToUint(r0.x)+512u].zzzz).xyz;
/*287*/	  r3.xyz = (r4.wwww * r3.xyzx).xyz;
/*288*/	  r3.xyz = (r4.xyzx * r0.zzzz + r3.xyzx).xyz;
/*289*/	  r5.xyzw = (textureLod(s_environment, r2.xyzx.stp, r0.w)).xyzw;
/*290*/	  r0.z = dot(vec3(r2.xyzx), vec3(-r1.xyzx));
/*291*/	  r0.z = max(r0.z, 0.000000);
/*292*/	  r0.z = log2(r0.z);
/*293*/	  r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, 10.000000, 1.539380)).zw;
/*294*/	  r0.z = exp2(r0.z);
/*295*/	    r0.w = cos((r0.w));
/*296*/	  r0.w = inversesqrt(r0.w);
/*297*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*298*/	  r1.x = r0.y * 60.000000;
/*299*/	  r1.x = min(r1.x, 1.000000);
/*300*/	  r0.z = r0.w * r0.z;
/*301*/	  r0.w = -r0.y + r1.x;
/*302*/	  r0.z = r0.z * r0.w + r0.y;
/*303*/	  r0.y = max(r0.z, r0.y);
/*304*/	  r0.yzw = (r0.yyyy * r5.xxyz).yzw;
/*305*/	  r0.yzw = (r0.yyzw * cb5.data[floatBitsToUint(r0.x)].xxyz).yzw;
/*306*/	  r4.xyz = (r0.yzwy * r4.wwww + r3.xyzx).xyz;
/*307*/	}
/*308*/	if(floatBitsToUint(r1.w) != 0u) {
/*309*/	  r1.xyz = (gsOut_T2.xyzx).xyz;
/*310*/	  r1.w = 1.000000;
/*311*/	  r0.y = dot(r1.xyzw, cb0.data[3].xyzw);
/*312*/	  r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*313*/	  r0.zw = (r0.zzzw * cb0.data[30].zzzw).zw;
/*314*/	  r1.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, 0.000000)).yzxw;
/*315*/	  r1.xy = (r0.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*316*/	  r1.w = 1.000000;
/*317*/	  r0.z = dot(r1.xyzw, cb0.data[19].xyzw);
/*318*/	  r0.w = dot(r1.xyzw, cb0.data[20].xyzw);
/*319*/	  r0.z = r0.z / r0.w;
/*320*/	  r0.y = -r0.y + r0.z;
/*321*/	  r0.y = saturate(r0.y / cb5.data[floatBitsToUint(r0.x)+3072u].x);
/*322*/	  r4.xyzw = r0.yyyy * r4.xyzw;
/*323*/	}
/*324*/	r0.x = uintBitsToFloat(uint(0x01000000u) & floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].x));
/*325*/	r1.xyz = (gsOut_T2.xyzx + -cb0.data[0].xyzx).xyz;
/*326*/	r1.w = max(r1.y, 0.000000);
/*327*/	r2.xyzw = (texture(s_sky, r1.xwzx.stp)).xyzw;
/*328*/	if(floatBitsToUint(r0.x) != 0u) {
/*329*/	  r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*330*/	  r0.x = sqrt(r0.x);
/*331*/	  r0.y = saturate(cb2.data[0].w)/**/;
/*332*/	  r0.y = -r0.y + 1.000000;
/*333*/	  r0.y = r0.y * 8.000000 + -4.000000;
/*334*/	  r0.z = saturate(cb2.data[1].x)/**/;
/*335*/	  r0.z = -r0.z + 1.000000;
/*336*/	  r0.z = r0.z * 1000.000000;
/*337*/	  r0.x = r0.x / r0.z;
/*338*/	  r0.x = r0.x + r0.y;
/*339*/	  r0.x = r0.x * 1.442695;
/*340*/	  r0.x = exp2(r0.x);
/*341*/	  r0.x = cb2.data[1].y / r0.x;
/*342*/	  r0.x = saturate(-r0.x + cb2.data[1].y);
/*343*/	  r0.y = -gsOut_T2.y + cb2.data[1].w;
/*344*/	  r0.z = -cb2.data[1].z + cb2.data[1].w;
/*345*/	  r0.y = r0.y + -cb2.data[1].z;
/*346*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*347*/	  r0.y = saturate(r0.z * r0.y);
/*348*/	  r0.z = r0.y * -2.000000 + 3.000000;
/*349*/	  r0.y = r0.y * r0.y;
/*350*/	  r0.y = r0.y * r0.z;
/*351*/	  r0.z = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*352*/	  r0.z = sqrt(r0.z);
/*353*/	  r0.w = max(cb2.data[2].z, 0.001000);
/*354*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*355*/	  r0.z = r0.w * r0.z;
/*356*/	  r0.z = min(r0.z, 1.000000);
/*357*/	  r0.w = r0.z * -2.000000 + 3.000000;
/*358*/	  r0.z = r0.z * r0.z;
/*359*/	  r0.z = r0.z * r0.w;
/*360*/	  r0.x = cb2.data[2].x * r0.y + r0.x;
/*361*/	  r1.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*362*/	  r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*363*/	  r1.xyz = (r1.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*364*/	  r0.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*365*/	    r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 0.004000 : 1.000000;
/*366*/	  r3.xyz = (r0.yyyy * r1.xyzx).xyz;
/*367*/	  r0.w = saturate(dot(vec2(r0.xxxx), vec2(cb2.data[2].yyyy)));
/*368*/	  r1.xyz = (-r1.xyzx * r0.yyyy + r2.xyzx).xyz;
/*369*/	  r1.xyz = (r0.wwww * r1.xyzx + r3.xyzx).xyz;
/*370*/	  r0.x = saturate(r0.x * r0.z);
/*371*/	  r0.yzw = (r1.xxyz * r4.wwww + -r4.xxyz).yzw;
/*372*/	  r4.xyz = (r0.xxxx * r0.yzwy + r4.xyzx).xyz;
/*373*/	}
/*374*/	color0.xyzw = r4.xyzw;
/*375*/	return;
}
