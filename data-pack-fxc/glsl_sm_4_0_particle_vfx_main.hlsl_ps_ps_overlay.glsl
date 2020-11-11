//
//
// Shader Model 4
// Fragment Shader
//
// id: 1547 - fxc/glsl_SM_4_0_particle_vfx_main.hlsl_PS_ps_overlay.glsl
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
layout(location = 1) out vec4 color1;

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
  color1 = vec4(0);
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
/*64*/	  r0.yz = (uintBitsToFloat(uvec4(vec4(0, 0x00040000u, 0x00200000u, 0)) & floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].xxxx))).yz;
/*65*/	  if(floatBitsToUint(r0.y) != 0u) {
/*66*/	    r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*67*/	  } else {
/*68*/	    r5.xyz = (vec4(0, 0, 1.000000, 0)).xyz;
/*69*/	  }
/*70*/	  if(floatBitsToUint(r0.z) != 0u) {
/*71*/	    r0.y = uintBitsToFloat(uint(cb5.data[floatBitsToUint(r0.x)+1536u].x));
/*72*/	    r0.z = uintBitsToFloat((r4.w < 0.200000) ? 0xffffffffu : 0x00000000u);
/*73*/	    r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*74*/	    r6.xyz = (mix(vec4(1.000000, 0.500000, 1.000000, 0), vec4(360.000000, 180.000000, 0.004000, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*75*/	    r7.xyz = (cb1.data[1].xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r6.yyyy).xyz;
/*76*/	    r8.xyz = (r6.zzzz * r7.xyzx).xyz;
/*77*/	    r0.w = saturate(cb5.data[floatBitsToUint(r0.x)+1536u].z)/**/;
/*78*/	    r7.xyz = (-r7.xyzx * r6.zzzz + cb5.data[floatBitsToUint(r0.x)+1536u].zzzz).xyz;
/*79*/	    r7.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*80*/	    r8.xyz = (r2.xyzx * cb5.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*81*/	    r7.xyz = (r7.xyzx * r3.xyzx + r8.xyzx).xyz;
/*82*/	    r4.xyz = (mix(r3.xyzx, r7.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*83*/	    r1.xy = (-r5.yyyy * gsOut_T4.zwzz).xy;
/*84*/	    r1.xy = (r5.xxxx * gsOut_T4.xyxx + r1.xyxx).xy;
/*85*/	    r7.xyz = (r1.yyyy * cb3.data[1].xyzx).xyz;
/*86*/	    r7.xyz = (-r1.xxxx * cb3.data[0].xyzx + -r7.xyzx).xyz;
/*87*/	    r7.xyz = (-r5.zzzz * cb3.data[2].xyzx + r7.xyzx).xyz;
/*88*/	    if(floatBitsToUint(r0.y) != 0u) {
/*89*/	      r0.y = uintBitsToFloat(uint(cb5.data[floatBitsToUint(r0.x)+1536u].y));
/*90*/	      r0.z = dot(vec3(-cb1.data[0].yzwy), vec3(-cb1.data[0].yzwy));
/*91*/	      r0.z = inversesqrt(r0.z);
/*92*/	      r9.xyz = (r0.zzzz * -cb1.data[0].yzwy).xyz;
/*93*/	      r0.z = dot(vec3(r9.xyzx), vec3(r7.xyzx));
/*94*/	      r0.z = max(r0.z, 0.000000);
/*95*/	      r0.z = r0.z + -1.000000;
/*96*/	      r0.z = r0.z * cb5.data[floatBitsToUint(r0.x)+2048u].y;
/*97*/	      r0.z = gsOut_T3.w * r0.z + 1.000000;
/*98*/	      r9.xyz = (r3.xyzx * cb5.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*99*/	      r10.xyz = (r0.zzzz * r9.xyzx).xyz;
/*100*/	      r10.xyz = (r10.xyzx * cb1.data[1].xyzx).xyz;
/*101*/	      r11.xyz = (r6.xxxx * cb1.data[4].xyzx).xyz;
/*102*/	      r9.xyz = (r9.xyzx * r11.xyzx).xyz;
/*103*/	      r9.xyz = (r6.zzzz * r9.xyzx).xyz;
/*104*/	      r9.xyz = (r10.xyzx * r6.zzzz + r9.xyzx).xyz;
/*105*/	      r3.xyz = (r9.xyzx * gsOut_T3.zzzz).xyz;
/*106*/	      r0.y = floatBitsToUint(r0.y);
/*107*/	      r0.z = r4.w * gsOut_T3.w + -r3.w;
/*108*/	      r3.w = r0.y * r0.z + r4.w;
/*109*/	    } else {
/*110*/	      r9.xyz = (r7.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*111*/	      r0.y = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*112*/	      r0.y = inversesqrt(r0.y);
/*113*/	      r9.xyz = (r0.yyyy * r9.xyzx).xyz;
/*114*/	      r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*115*/	      r11.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*116*/	      r10.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*117*/	      r12.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*118*/	      r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*119*/	      r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*120*/	      r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*121*/	      r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*122*/	      r6.xyw = (r6.xxxx * r9.xyxz).xyw;
/*123*/	      r0.y = dot(vec3(-cb1.data[0].yzwy), vec3(-cb1.data[0].yzwy));
/*124*/	      r0.y = inversesqrt(r0.y);
/*125*/	      r9.xyz = (r0.yyyy * -cb1.data[0].yzwy).xyz;
/*126*/	      r0.y = dot(vec3(cb0.data[3].xyzx), vec3(cb0.data[3].xyzx));
/*127*/	      r0.y = inversesqrt(r0.y);
/*128*/	      r10.xyz = (r0.yyyy * cb0.data[3].xyzx).xyz;
/*129*/	      r0.y = dot(vec3(-r9.xyzx), vec3(r10.xyzx));
/*130*/	      r0.z = cb5.data[floatBitsToUint(r0.x)+2048u].w + cb5.data[floatBitsToUint(r0.x)+2048u].z;
/*131*/	      r1.x = dot(vec3(r9.xyzx), vec3(r7.xyzx));
/*132*/	      r1.x = r1.x * -0.500000 + 0.500000;
/*133*/	      r1.x = -r0.z * r1.x;
/*134*/	      r1.x = r1.x * cb5.data[floatBitsToUint(r0.x)+2048u].x;
/*135*/	      r1.x = r1.x * gsOut_T3.x;
/*136*/	      r1.x = r1.x * 1.442695;
/*137*/	      r1.x = exp2(r1.x);
/*138*/	      r1.y = 1.000000 + -cb5.data[floatBitsToUint(r0.x)+1536u].w;
/*139*/	      r1.y = r1.y * r1.y;
/*140*/	      r1.y = r1.y * 0.079577;
/*141*/	      r2.w = cb5.data[floatBitsToUint(r0.x)+1536u].w * cb5.data[floatBitsToUint(r0.x)+1536u].w + 1.000000;
/*142*/	      r5.w = dot(vec2(r0.yyyy), vec2(cb5.data[floatBitsToUint(r0.x)+1536u].wwww));
/*143*/	      r2.w = r2.w + -r5.w;
/*144*/	      r2.w = log2(r2.w);
/*145*/	      r2.w = r2.w * 1.500000;
/*146*/	      r2.w = exp2(r2.w);
/*147*/	      r1.y = r1.y / r2.w;
/*148*/	      r1.y = r1.y * cb5.data[floatBitsToUint(r0.x)+2048u].w;
/*149*/	      r0.y = r0.y * r0.y + 1.000000;
/*150*/	      r0.y = r0.y * 0.059683;
/*151*/	      r0.y = r0.y * cb5.data[floatBitsToUint(r0.x)+2048u].z + r1.y;
/*152*/	      r0.y = r0.y / r0.z;
/*153*/	      r0.z = -r1.x + 1.000000;
/*154*/	      r0.y = r0.y * r0.z + r1.x;
/*155*/	      r6.xyw = (r0.yyyy * cb1.data[1].xyxz + r6.xyxw).xyw;
/*156*/	      r7.xyz = (r6.zzzz * r6.xywx).xyz;
/*157*/	      r6.xyz = (-r6.xywx * r6.zzzz + cb5.data[floatBitsToUint(r0.x)+1536u].zzzz).xyz;
/*158*/	      r0.yzw = (r0.wwww * r6.xxyz + r7.xxyz).yzw;
/*159*/	      r3.xyz = (r0.yzwy * r3.xyzx + r8.xyzx).xyz;
/*160*/	      r3.w = r4.w;
/*161*/	    }
/*162*/	  } else {
/*163*/	    r4.xyz = (r3.xyzx).xyz;
/*164*/	  }
/*165*/	  r0.y = r4.w + -0.100000;
/*166*/	  r0.y = r0.y * 10.000000;
/*167*/	  r0.y = min(r0.y, 1.000000);
/*168*/	  r6.xyzw = r3.xyzw + -r4.xyzw;
/*169*/	  r4.xyzw = r0.yyyy * r6.xyzw + r4.xyzw;
/*170*/	} else {
/*171*/	  r0.y = uintBitsToFloat(uint(0x00200000u) & floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].x));
/*172*/	  r0.z = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*173*/	  r0.zw = (mix(vec4(0, 0, 0.500000, 1.000000), vec4(0, 0, 180.000000, 0.004000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*174*/	  r6.xyz = (cb1.data[1].xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r0.zzzz).xyz;
/*175*/	  r7.xyz = (r0.wwww * r6.xyzx).xyz;
/*176*/	  r0.z = saturate(cb5.data[floatBitsToUint(r0.x)+1536u].z)/**/;
/*177*/	  r6.xyz = (-r6.xyzx * r0.wwww + cb5.data[floatBitsToUint(r0.x)+1536u].zzzz).xyz;
/*178*/	  r6.xyz = (r0.zzzz * r6.xyzx + r7.xyzx).xyz;
/*179*/	  r2.xyz = (r2.xyzx * cb5.data[floatBitsToUint(r0.x)+2048u].yyyy).xyz;
/*180*/	  r2.xyz = (r6.xyzx * r3.xyzx + r2.xyzx).xyz;
/*181*/	  r4.xyz = (mix(r3.xyzx, r2.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*182*/	  r5.xyz = (vec4(0, 0, 1.000000, 0)).xyz;
/*183*/	}
/*184*/	if(floatBitsToUint(r1.z) != 0u) {
/*185*/	  r0.y = max(0.000000, cb5.data[floatBitsToUint(r0.x)+512u].x);
/*186*/	  r0.z = -r0.y + 1.000000;
/*187*/	  r1.xyz = (gsOut_T2.xyzx + -cb0.data[0].xyzx).xyz;
/*188*/	  r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*189*/	  r0.w = inversesqrt(r0.w);
/*190*/	  r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*191*/	  r0.w = dot(vec3(-r1.xyzx), vec3(r5.xyzx));
/*192*/	  r0.w = r0.w + r0.w;
/*193*/	  r2.xyz = (r5.xyzx * -r0.wwww + -r1.xyzx).xyz;
/*194*/	  r0.w = 1.000000 + -cb5.data[floatBitsToUint(r0.x)+512u].y;
/*195*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r5.xyzx));
/*196*/	  r3.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*197*/	  if(floatBitsToUint(r3.x) != 0u) {
/*198*/	    r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r2.xyzx));
/*199*/	    r3.x = max(r3.x, -1.000000);
/*200*/	    r3.x = min(r3.x, 1.000000);
/*201*/	    r3.y = -abs(r3.x) + 1.000000;
/*202*/	    r3.y = sqrt(r3.y);
/*203*/	    r3.z = abs(r3.x) * -0.018729 + 0.074261;
/*204*/	    r3.z = r3.z * abs(r3.x) + -0.212114;
/*205*/	    r3.z = r3.z * abs(r3.x) + 1.570729;
/*206*/	    r3.w = r3.y * r3.z;
/*207*/	    r3.w = r3.w * -2.000000 + 3.141593;
/*208*/	    r3.x = uintBitsToFloat((r3.x < -r3.x) ? 0xffffffffu : 0x00000000u);
/*209*/	    r3.x = uintBitsToFloat(floatBitsToUint(r3.x) & floatBitsToUint(r3.w));
/*210*/	    r3.x = r3.z * r3.y + r3.x;
/*211*/	    r3.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*212*/	    r3.z = cb5.data[floatBitsToUint(r0.x)+512u].y * cb5.data[floatBitsToUint(r0.x)+512u].y;
/*213*/	    r3.yw = (mix(vec4(0, 1.000000, 0, -0.000100), vec4(0, 0.004000, 0, 0.995900), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).yw;
/*214*/	    r3.y = r3.z * r3.w + r3.y;
/*215*/	    r3.y = r3.y * 0.500000 + 0.500000;
/*216*/	    r3.y = r3.y * 2.000000 + -1.000000;
/*217*/	    r3.z = -r3.y * r3.y + 1.000000;
/*218*/	    r3.z = max(r3.z, 0.001000);
/*219*/	    r3.z = log2(r3.z);
/*220*/	    r3.w = r3.z * 4.950617;
/*221*/	    r3.z = r3.z * 0.346574 + 4.546885;
/*222*/	    r5.w = uintBitsToFloat((0.000000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*223*/	    r3.y = uintBitsToFloat((r3.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*224*/	    r3.y = intBitsToFloat(1 + ~floatBitsToInt(r5.w) + floatBitsToInt(r3.y));
/*225*/	    r3.y = floatBitsToInt(r3.y);
/*226*/	    r3.w = r3.z * r3.z + -r3.w;
/*227*/	    r3.w = sqrt(r3.w);
/*228*/	    r3.z = -r3.z + r3.w;
/*229*/	    r3.z = max(r3.z, 0.000000);
/*230*/	    r3.z = sqrt(r3.z);
/*231*/	    r3.y = r3.z * r3.y;
/*232*/	    r3.y = r3.y * 1.414214;
/*233*/	    r3.y = 0.008727 / r3.y;
/*234*/	    r3.y = max(r3.y, 0.000100);
/*235*/	    r3.xz = (r3.xxxx + vec4(-0.008727, 0.000000, 0.008727, 0.000000)).xz;
/*236*/	    r3.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.y)).y;
/*237*/	    r3.xy = (r3.yyyy * r3.xzxx).xy;
/*238*/	    r3.zw = (r3.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*239*/	    r3.zw = (r3.zzzw * r3.zzzw).zw;
/*240*/	    r6.xyzw = r3.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*241*/	    r6.xy = (r6.xzxx / r6.ywyy).xy;
/*242*/	    r3.zw = (-r3.zzzw * r6.xxxy).zw;
/*243*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*244*/	    r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*245*/	    r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r3.x));
/*246*/	    r3.x = floatBitsToInt(r3.x);
/*247*/	    r3.yz = (r3.zzwz * vec4(0.000000, 1.442695, 1.442695, 0.000000)).yz;
/*248*/	    r3.yz = (exp2(r3.yyzy)).yz;
/*249*/	    r3.yz = (-r3.yyzy + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*250*/	    r3.yz = (sqrt(r3.yyzy)).yz;
/*251*/	    r3.x = r3.x * r3.y + 1.000000;
/*252*/	    r3.x = r3.x * 0.500000;
/*253*/	    r3.y = 1 + ~floatBitsToInt(r6.y);
/*254*/	    r3.y = r3.y * r3.z + 1.000000;
/*255*/	    r3.x = r3.y * 0.500000 + -r3.x;
/*256*/	    r2.w = saturate(r2.w);
/*257*/	    r3.yzw = (r0.wwwy * vec4(0.000000, 1.570796, 1.539380, 60.000000)).yzw;
/*258*/	    r3.y = sin(r3.y);
/*259*/	    r2.w = r2.w + -1.000000;
/*260*/	    r2.w = r3.y * r2.w + 1.000000;
/*261*/	    r3.y = dot(vec3(-cb1.data[0].yzwy), vec3(-cb1.data[0].yzwy));
/*262*/	    r3.y = log2(r3.y);
/*263*/	    r3.y = r3.y * 10.000000;
/*264*/	    r3.y = exp2(r3.y);
/*265*/	        r3.z = cos((r3.z));
/*266*/	    r3.z = inversesqrt(r3.z);
/*267*/	    r3.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.z)).z;
/*268*/	    r3.w = min(r3.w, 1.000000);
/*269*/	    r3.y = r3.z * r3.y;
/*270*/	    r3.z = -r0.y + r3.w;
/*271*/	    r3.y = r3.y * r3.z + r0.y;
/*272*/	    r2.w = r2.w * abs(r3.x);
/*273*/	    r2.w = r3.y * r2.w;
/*274*/	  } else {
/*275*/	    r2.w = 0;
/*276*/	  }
/*277*/	  r3.xyz = (r2.wwww * cb5.data[floatBitsToUint(r0.x)].xyzx).xyz;
/*278*/	  r3.xyz = (r3.xyzx * cb1.data[1].xyzx).xyz;
/*279*/	  r3.xyz = (r3.xyzx * cb5.data[floatBitsToUint(r0.x)+512u].zzzz).xyz;
/*280*/	  r3.xyz = (r4.wwww * r3.xyzx).xyz;
/*281*/	  r3.xyz = (r4.xyzx * r0.zzzz + r3.xyzx).xyz;
/*282*/	  r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r0.w)).xyzw;
/*283*/	  r0.z = dot(vec3(r2.xyzx), vec3(-r1.xyzx));
/*284*/	  r0.z = max(r0.z, 0.000000);
/*285*/	  r0.z = log2(r0.z);
/*286*/	  r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, 10.000000, 1.539380)).zw;
/*287*/	  r0.z = exp2(r0.z);
/*288*/	    r0.w = cos((r0.w));
/*289*/	  r0.w = inversesqrt(r0.w);
/*290*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*291*/	  r1.x = r0.y * 60.000000;
/*292*/	  r1.x = min(r1.x, 1.000000);
/*293*/	  r0.z = r0.w * r0.z;
/*294*/	  r0.w = -r0.y + r1.x;
/*295*/	  r0.z = r0.z * r0.w + r0.y;
/*296*/	  r0.y = max(r0.z, r0.y);
/*297*/	  r0.yzw = (r0.yyyy * r6.xxyz).yzw;
/*298*/	  r0.yzw = (r0.yyzw * cb5.data[floatBitsToUint(r0.x)].xxyz).yzw;
/*299*/	  r4.xyz = (r0.yzwy * r4.wwww + r3.xyzx).xyz;
/*300*/	}
/*301*/	if(floatBitsToUint(r1.w) != 0u) {
/*302*/	  r1.xyz = (gsOut_T2.xyzx).xyz;
/*303*/	  r1.w = 1.000000;
/*304*/	  r0.y = dot(r1.xyzw, cb0.data[3].xyzw);
/*305*/	  r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*306*/	  r0.zw = (r0.zzzw * cb0.data[30].zzzw).zw;
/*307*/	  r1.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, 0.000000)).yzxw;
/*308*/	  r1.xy = (r0.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*309*/	  r1.w = 1.000000;
/*310*/	  r0.z = dot(r1.xyzw, cb0.data[19].xyzw);
/*311*/	  r0.w = dot(r1.xyzw, cb0.data[20].xyzw);
/*312*/	  r0.z = r0.z / r0.w;
/*313*/	  r0.y = -r0.y + r0.z;
/*314*/	  r0.y = saturate(r0.y / cb5.data[floatBitsToUint(r0.x)+3072u].x);
/*315*/	  r4.xyzw = r0.yyyy * r4.xyzw;
/*316*/	}
/*317*/	r0.x = uintBitsToFloat(uint(0x01000000u) & floatBitsToUint(cb4.data[floatBitsToUint(r0.x)].x));
/*318*/	r1.xyz = (gsOut_T2.xyzx + -cb0.data[0].xyzx).xyz;
/*319*/	r1.w = max(r1.y, 0.000000);
/*320*/	r2.xyzw = (texture(s_sky, r1.xwzx.stp)).xyzw;
/*321*/	if(floatBitsToUint(r0.x) != 0u) {
/*322*/	  r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*323*/	  r0.x = sqrt(r0.x);
/*324*/	  r0.y = saturate(cb2.data[0].w)/**/;
/*325*/	  r0.y = -r0.y + 1.000000;
/*326*/	  r0.y = r0.y * 8.000000 + -4.000000;
/*327*/	  r0.z = saturate(cb2.data[1].x)/**/;
/*328*/	  r0.z = -r0.z + 1.000000;
/*329*/	  r0.z = r0.z * 1000.000000;
/*330*/	  r0.x = r0.x / r0.z;
/*331*/	  r0.x = r0.x + r0.y;
/*332*/	  r0.x = r0.x * 1.442695;
/*333*/	  r0.x = exp2(r0.x);
/*334*/	  r0.x = cb2.data[1].y / r0.x;
/*335*/	  r0.x = saturate(-r0.x + cb2.data[1].y);
/*336*/	  r0.y = -gsOut_T2.y + cb2.data[1].w;
/*337*/	  r0.z = -cb2.data[1].z + cb2.data[1].w;
/*338*/	  r0.y = r0.y + -cb2.data[1].z;
/*339*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*340*/	  r0.y = saturate(r0.z * r0.y);
/*341*/	  r0.z = r0.y * -2.000000 + 3.000000;
/*342*/	  r0.y = r0.y * r0.y;
/*343*/	  r0.y = r0.y * r0.z;
/*344*/	  r0.z = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*345*/	  r0.z = sqrt(r0.z);
/*346*/	  r0.w = max(cb2.data[2].z, 0.001000);
/*347*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*348*/	  r0.z = r0.w * r0.z;
/*349*/	  r0.z = min(r0.z, 1.000000);
/*350*/	  r0.w = r0.z * -2.000000 + 3.000000;
/*351*/	  r0.z = r0.z * r0.z;
/*352*/	  r0.z = r0.z * r0.w;
/*353*/	  r0.x = cb2.data[2].x * r0.y + r0.x;
/*354*/	  r1.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*355*/	  r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*356*/	  r1.xyz = (r1.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*357*/	  r0.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*358*/	    r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 0.004000 : 1.000000;
/*359*/	  r3.xyz = (r0.yyyy * r1.xyzx).xyz;
/*360*/	  r0.w = saturate(dot(vec2(r0.xxxx), vec2(cb2.data[2].yyyy)));
/*361*/	  r1.xyz = (-r1.xyzx * r0.yyyy + r2.xyzx).xyz;
/*362*/	  r1.xyz = (r0.wwww * r1.xyzx + r3.xyzx).xyz;
/*363*/	  r0.x = saturate(r0.x * r0.z);
/*364*/	  r0.yzw = (r1.xxyz * r4.wwww + -r4.xxyz).yzw;
/*365*/	  r4.xyz = (r0.xxxx * r0.yzwy + r4.xyzx).xyz;
/*366*/	}
/*367*/	r0.xy = (-r5.yyyy * gsOut_T4.zwzz).xy;
/*368*/	r5.xy = (r5.xxxx * gsOut_T4.xyxx + r0.xyxx).xy;
/*369*/	r0.xyz = (r5.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*370*/	color1.xyz = (r4.wwww * r0.xyzx).xyz;
/*371*/	color0.xyzw = r4.xyzw;
/*372*/	color1.w = r4.w;
/*373*/	return;
}
