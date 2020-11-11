// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1533 - fxc/glsl_SM_4_0_particle_vfx_main.hlsl_VS_vs40_main_cpu_simulation.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


out vec4 vsOut_C0;
out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;

uniform sampler2DArray g_emitter_instances;
uniform sampler2DArray g_particle_instances;
uniform sampler2D g_tex_sorted_data;
uniform sampler2DArray g_sam_emitter_constants;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform cb_vfx_shared
{
  vec4 data[2];
} cb1;
layout(std140) uniform cb_vfx
{
  vec4 data[4];
} cb2;
layout(std140) uniform cb_vfx_emitter_constants_common
{
  vec4 data[512];
} cb3;
layout(std140) uniform cb_vfx_emitter_constants_vs
{
  vec4 data[3584];
} cb4;

void main()
{
  vsOut_C0 = vec4(0);
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
  vsOut_T2 = vec4(0);
  vsOut_T3 = vec4(0);
  vsOut_T4 = vec4(0);
  vsOut_T5 = vec4(0);
  vsOut_T6 = vec4(0);
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

/*0*/	r0.x = uint(gl_VertexID);
/*1*/	r0.x = -r0.x + cb1.data[0].w;
/*2*/	r0.x = uintBitsToFloat(uint(r0.x));
/*3*/	r0.x = floatBitsToUint(r0.x);
/*4*/	r0.y = r0.x * cb1.data[0].z;
/*5*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*6*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? cb1.data[0].z : -cb1.data[0].z/**/;
/*7*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).z;
/*8*/	r0.z = r0.z * r0.x;
/*9*/	r0.z = fract(r0.z);
/*10*/	r0.y = r0.z * r0.y;
/*11*/	r0.x = r0.x / cb1.data[0].z;
/*12*/	r1.xy = (uintBitsToFloat(uvec4(r0.yxyy))).xy;
/*13*/	r1.zw = (vec4(0, 0, 0, 0)).zw;
/*14*/	r0.xyzw = texelFetch(g_tex_sorted_data, floatBitsToInt(r1.xyzw).st, floatBitsToInt(r1.xyzw).a).xyzw;
/*15*/	r0.x = uintBitsToFloat(uint(r0.y));
/*16*/	r0.x = floatBitsToUint(r0.x);
/*17*/	r0.y = r0.x * cb1.data[0].y;
/*18*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*19*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? cb1.data[0].y : -cb1.data[0].y/**/;
/*20*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).z;
/*21*/	r0.z = r0.z * r0.x;
/*22*/	r0.z = fract(r0.z);
/*23*/	r0.y = r0.z * r0.y;
/*24*/	r0.x = r0.x / cb1.data[0].y;
/*25*/	r1.xy = (uintBitsToFloat(uvec4(r0.yxyy))).xy;
/*26*/	r1.zw = (intBitsToFloat(ivec4(ivec4(0, 0, 1, 0)))).zw;
/*27*/	r0.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r1.xyww).stp, floatBitsToInt(r1.xyww).a).xyzw;
/*28*/	r2.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r1.xyzw).stp, floatBitsToInt(r1.xyzw).a).xyzw;
/*29*/	r0.x = intBitsToFloat(int(r0.x));
/*30*/	r0.z = floatBitsToUint(r0.x);
/*31*/	r0.w = r0.z * cb1.data[0].x;
/*32*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*33*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? cb1.data[0].x : -cb1.data[0].x/**/;
/*34*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).x;
/*35*/	r3.x = r0.z * r3.x;
/*36*/	r3.x = fract(r3.x);
/*37*/	r0.w = r0.w * r3.x;
/*38*/	r0.z = r0.z / cb1.data[0].x;
/*39*/	r3.xy = (uintBitsToFloat(uvec4(r0.wzww))).xy;
/*40*/	r3.zw = (intBitsToFloat(ivec4(ivec4(0, 0, 2, 0)))).zw;
/*41*/	r4.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r3.xyzw).stp, floatBitsToInt(r3.xyzw).a).xyzw;
/*42*/	r3.z = intBitsToFloat(int(3));
/*43*/	r5.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r3.xyzw).stp, floatBitsToInt(r3.xyzw).a).xyzw;
/*44*/	r0.z = intBitsToFloat(int(r5.x));
/*45*/	r0.x = uintBitsToFloat((floatBitsToInt(r0.x) != int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*46*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[2].w) == floatBitsToInt(cb3.data[floatBitsToUint(r0.z)].w)) ? 0xffffffffu : 0x00000000u) /**/;
/*47*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*48*/	r0.w = uintBitsToFloat((0.010000 < r4.w) ? 0xffffffffu : 0x00000000u);
/*49*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*50*/	r5.xzw = (r2.xxyz + -cb0.data[0].xxyz).xzw;
/*51*/	r0.w = dot(vec3(r5.xzwx), vec3(r5.xzwx));
/*52*/	r0.w = sqrt(r0.w);
/*53*/	r6.xyzw = r5.yyyy * cb4.data[floatBitsToUint(r0.z)].xyzw;
/*54*/	r5.xzw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.wwww, r6.xxyz)) * 0xffffffffu)).xzw;
/*55*/	r7.xyz = (uintBitsToFloat(uvec4(greaterThanEqual(r0.wwww, r6.yzwy)) * 0xffffffffu)).xyz;
/*56*/	r5.xzw = (uintBitsToFloat(floatBitsToUint(r5.xxzw) & uvec4(vec4(0x3f800000u, 0, 0x3f800000u, 0x3f800000u)))).xzw;
/*57*/	r5.xzw = (mix(r5.xxzw, vec4(0, 0, 0, 0), greaterThan(floatBitsToUint(r7.xxyz), uvec4(0)))).xzw;
/*58*/	r3.z = -cb4.data[floatBitsToUint(r0.z)].x * r5.y + r0.w;
/*59*/	r6.xy = (cb4.data[floatBitsToUint(r0.z)].ywyy * r5.yyyy + -r6.xzxx).xy;
/*60*/	r6.xy = (r6.xyxx + vec4(0.000001, 0.000001, 0.000000, 0.000000)).xy;
/*61*/	r7.x = saturate(r3.z / r6.x);
/*62*/	r0.w = cb4.data[floatBitsToUint(r0.z)].w * r5.y + -r0.w;
/*63*/	r7.z = saturate(r0.w / r6.y);
/*64*/	r7.y = 1.000000;
/*65*/	r0.w = dot(vec3(r7.xyzx), vec3(r5.xzwx));
/*66*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*67*/	r0.w = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*68*/	if(floatBitsToUint(r0.w) != 0u) {
/*69*/	  r1.z = intBitsToFloat(int(2));
/*70*/	  r1.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r1.xyzw).stp, floatBitsToInt(r1.xyzw).a).xyzw;
/*71*/	  r3.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r3.xyww).stp, floatBitsToInt(r3.xyww).a).xyzw;
/*72*/	  r0.w = -r2.w + r3.w;
/*73*/	  r1.w = r1.w + 0.000001;
/*74*/	  r3.x = r0.w / r1.w;
/*75*/	  r5.xz = (r0.yyyy * vec4(8741.000000, 0.000000, 2521.000000, 0.000000)).xz;
/*76*/	  r3.y = r0.y * 0.125000 + 0.062500;
/*77*/	  r3.z = floatBitsToUint(r0.z);
/*78*/	  r6.xyzw = (textureLod(g_sam_emitter_constants, r3.xyzx.stp, 0.000000)).xyzw;
/*79*/	  r6.xy = (r5.yyyy * r6.xyxx).xy;
/*80*/	  r7.xyzw = uintBitsToFloat(uvec4(ivec4(1, 2, 8, 16)) & floatBitsToUint(cb3.data[floatBitsToUint(r0.z)].xxxx));
/*81*/	  r5.xz = (fract(r5.xxzx)).xz;
/*82*/	  r8.xy = (-cb4.data[floatBitsToUint(r0.z)+512u].xzxx + cb4.data[floatBitsToUint(r0.z)+512u].ywyy).xy;
/*83*/	  r5.xz = (r5.xxzx * r8.xxyx + cb4.data[floatBitsToUint(r0.z)+512u].xxzx).xz;
/*84*/	  r0.w = r5.x * 0.017453;
/*85*/	  r1.w = uintBitsToFloat((r5.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*86*/	    r0.w = (floatBitsToUint(r1.w) > 0x00000000u) ? -r0.w : r0.w;
/*87*/	  r1.w = r3.x * r5.z;
/*88*/	  r0.w = r1.w * 6.283185 + r0.w;
/*89*/	  r0.w = r0.w * 0.159155;
/*90*/	  r1.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*91*/	  r0.w = fract(abs(r0.w));
/*92*/	    r0.w = (floatBitsToUint(r1.w) > 0x00000000u) ? r0.w : -r0.w;
/*93*/	  r0.w = r0.w * 6.283185;
/*94*/	  r5.x = sin(r0.w);   r8.x = cos(r0.w);
/*95*/	  r8.xw = (r8.xxxx).xw;
/*96*/	  r8.yz = (r5.xxxx * vec4(0.000000, 1.000000, -1.000000, 0.000000)).yz;
/*97*/	  vsOut_T4.xyzw = mix(vec4(1.000000, 0, 0, 1.000000), r8.xyzw, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)));
/*98*/	  if(floatBitsToUint(r7.y) != 0u) {
/*99*/	    r3.w = r0.y * 0.125000 + 0.312500;
/*100*/	    r8.xyzw = (textureLod(g_sam_emitter_constants, r3.xwzx.stp, 0.000000)).xyzw;
/*101*/	    r8.w = 1.000000;
/*102*/	    r4.xyzw = r4.wxyz * r8.wxyz;
/*103*/	    vsOut_C0.xyz = (r4.yzwy).xyz;
/*104*/	  } else {
/*105*/	    vsOut_C0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*106*/	    r4.x = 0;
/*107*/	  }
/*108*/	  r0.w = intBitsToFloat(floatBitsToInt(cb4.data[floatBitsToUint(r0.z)+2048u].y) * floatBitsToInt(cb4.data[floatBitsToUint(r0.z)+2048u].x)) /**/;
/*109*/	  r0.w = floatBitsToUint(r0.w);
/*110*/	  r4.yz = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].xxyx)).yz;
/*111*/	  r5.xz = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / r4.yyzy).xz;
/*112*/	  r8.zw = (r5.xxxz * cb4.data[floatBitsToUint(r0.z)+1536u].xxxy).zw;
/*113*/	  if(floatBitsToUint(r7.z) != 0u) {
/*114*/	    r1.w = uintBitsToFloat(uint(cb4.data[floatBitsToUint(r0.z)+3072u].z));
/*115*/	    r2.w = r3.x * cb4.data[floatBitsToUint(r0.z)+3072u].x;
/*116*/	    r3.w = r3.x * cb4.data[floatBitsToUint(r0.z)+3072u].y + -r2.w;
/*117*/	    r2.w = r3.x * r3.w + r2.w;
/*118*/	        r2.w = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].y) > 0x00000000u) ? r2.w : r3.x;
/*119*/	    r1.w = floatBitsToUint(r1.w);
/*120*/	    r1.w = r4.y * r1.w;
/*121*/	    r3.w = r0.y * r4.z;
/*122*/	    r3.w = r3.w / r4.z;
/*123*/	    r4.w = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*124*/	    r3.w = fract(abs(r3.w));
/*125*/	        r3.w = (floatBitsToUint(r4.w) > 0x00000000u) ? r3.w : -r3.w;
/*126*/	    r3.w = r4.z * r3.w;
/*127*/	    r3.w = r4.y * r3.w;
/*128*/	        r1.w = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].w) > 0x00000000u) ? r3.w : r1.w;
/*129*/	    r3.w = uintBitsToFloat((int(0) != floatBitsToInt(cb4.data[floatBitsToUint(r0.z)+2048u].w)) ? 0xffffffffu : 0x00000000u) /**/;
/*130*/	    r4.z = uintBitsToFloat((int(0) != floatBitsToInt(cb4.data[floatBitsToUint(r0.z)+2560u].z)) ? 0xffffffffu : 0x00000000u) /**/;
/*131*/	    r3.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r4.z));
/*132*/	    if(floatBitsToUint(r3.w) != 0u) {
/*133*/	      r3.w = r0.y + r2.w;
/*134*/	      r4.z = r4.y * r3.w;
/*135*/	      r4.z = r4.z / r4.y;
/*136*/	      r4.w = uintBitsToFloat((r4.z >= -r4.z) ? 0xffffffffu : 0x00000000u);
/*137*/	      r4.z = fract(abs(r4.z));
/*138*/	            r4.z = (floatBitsToUint(r4.w) > 0x00000000u) ? r4.z : -r4.z;
/*139*/	      r4.z = r4.z * r4.y + r1.w;
/*140*/	      r3.w = r3.w * r4.y + 1.000000;
/*141*/	      r3.w = r3.w / r4.y;
/*142*/	      r4.w = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*143*/	      r3.w = fract(abs(r3.w));
/*144*/	            r3.w = (floatBitsToUint(r4.w) > 0x00000000u) ? r3.w : -r3.w;
/*145*/	      r3.w = r3.w * r4.y + r1.w;
/*146*/	      r7.x = intBitsToFloat(int(r3.w));
/*147*/	      r9.x = trunc(r4.z);
/*148*/	      r7.y = r4.z + -r9.x;
/*149*/	      r4.zw = (mix(vec4(0, 0, 0, 0), r7.xxxy, greaterThan(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].xxxx), uvec4(0)))).zw;
/*150*/	      r9.y = floatBitsToInt(r4.z);
/*151*/	      vsOut_T6.z = r4.w;
/*152*/	    } else {
/*153*/	      r3.w = r0.w * r2.w;
/*154*/	      r7.x = floor(r3.w);
/*155*/	      r3.w = r7.x + 1.000000;
/*156*/	      r3.w = r3.w / r0.w;
/*157*/	      r4.z = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*158*/	      r3.w = fract(abs(r3.w));
/*159*/	            r3.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r3.w : -r3.w;
/*160*/	      r3.w = r0.w * r3.w;
/*161*/	      r7.y = floor(r3.w);
/*162*/	      r3.w = r2.w * r0.w + -r7.x;
/*163*/	            r7.z = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].x) > 0x00000000u) ? r3.w : 0;
/*164*/	      if(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].w) != 0u) {
/*165*/	        r3.w = r0.y * r0.w + r7.x;
/*166*/	        r3.w = r3.w / r0.w;
/*167*/	        r4.z = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*168*/	        r3.w = fract(abs(r3.w));
/*169*/	                r3.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r3.w : -r3.w;
/*170*/	        r3.w = r0.w * r3.w;
/*171*/	        r9.x = floor(r3.w);
/*172*/	        r3.w = r9.x + 1.000000;
/*173*/	        r3.w = r3.w / r0.w;
/*174*/	        r4.z = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*175*/	        r3.w = fract(abs(r3.w));
/*176*/	                r3.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r3.w : -r3.w;
/*177*/	        r3.w = r0.w * r3.w;
/*178*/	        r3.w = floor(r3.w);
/*179*/	                r9.y = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].x) > 0x00000000u) ? r3.w : r7.y;
/*180*/	        vsOut_T6.z = r7.z;
/*181*/	      } else {
/*182*/	        r3.w = r4.y * r2.w;
/*183*/	        r3.w = r3.w / r4.y;
/*184*/	        r4.z = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*185*/	        r3.w = fract(abs(r3.w));
/*186*/	                r3.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r3.w : -r3.w;
/*187*/	        r3.w = r3.w * r4.y + r1.w;
/*188*/	        r2.w = r2.w * r4.y + 1.000000;
/*189*/	        r2.w = r2.w / r4.y;
/*190*/	        r4.z = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*191*/	        r2.w = fract(abs(r2.w));
/*192*/	                r2.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r2.w : -r2.w;
/*193*/	        r1.w = r2.w * r4.y + r1.w;
/*194*/	        r4.z = intBitsToFloat(int(r1.w));
/*195*/	        r10.x = trunc(r3.w);
/*196*/	        r4.w = r3.w + -r10.x;
/*197*/	        r10.zw = (mix(vec4(0, 0, 0, 0), r4.zzzw, greaterThan(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].xxxx), uvec4(0)))).zw;
/*198*/	        r10.y = floatBitsToInt(r10.z);
/*199*/	        r9.xyz = (mix(r7.xyzx, r10.xywx, greaterThan(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].zzzz), uvec4(0)))).xyz;
/*200*/	        vsOut_T6.z = r9.z;
/*201*/	      }
/*202*/	    }
/*203*/	    r4.zw = (r9.xxxy / r4.yyyy).zw;
/*204*/	    r7.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.zwzz, -r4.zwzz)) * 0xffffffffu)).xy;
/*205*/	    r9.xy = (fract(abs(r4.zwzz))).xy;
/*206*/	    r7.xy = (mix(-r9.xyxx, r9.xyxx, greaterThan(floatBitsToUint(r7.xyxx), uvec4(0)))).xy;
/*207*/	    r9.xy = (r4.yyyy * r7.xyxx).xy;
/*208*/	    r9.zw = floor((r4.zzzw).zw);
/*209*/	    r9.xyzw = r5.xzxz * r9.xzyw;
/*210*/	    r4.zw = (r9.zzzw * cb4.data[floatBitsToUint(r0.z)+1536u].xxxy).zw;
/*211*/	    vsOut_T2.xy = (r9.xyxx * cb4.data[floatBitsToUint(r0.z)+1536u].xyxx + cb4.data[floatBitsToUint(r0.z)+1536u].zwzz).xy;
/*212*/	    r4.zw = (mix(vec4(0, 0, 0, 0), r4.zzzw, greaterThan(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].xxxx), uvec4(0)))).zw;
/*213*/	    vsOut_T6.xy = (r4.zwzz + cb4.data[floatBitsToUint(r0.z)+1536u].zwzz).xy;
/*214*/	    vsOut_T2.zw = (r8.zzzw).zw;
/*215*/	  } else {
/*216*/	    r1.w = uintBitsToFloat(uint(4) & floatBitsToUint(cb3.data[floatBitsToUint(r0.z)].x));
/*217*/	    r2.w = floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].z);
/*218*/	    r2.w = r0.y * r0.w + r2.w;
/*219*/	    r2.w = r2.w / r0.w;
/*220*/	    r3.w = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*221*/	    r2.w = fract(abs(r2.w));
/*222*/	        r2.w = (floatBitsToUint(r3.w) > 0x00000000u) ? r2.w : -r2.w;
/*223*/	    r0.w = r0.w * r2.w;
/*224*/	    r0.w = uintBitsToFloat(uint(r0.w));
/*225*/	        r0.w = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].w) > 0x00000000u) ? r0.w : cb4.data[floatBitsToUint(r0.z)+2048u].z/**/;
/*226*/	    r2.w = floatBitsToUint(r0.w);
/*227*/	    r2.w = r2.w / r4.y;
/*228*/	    r3.w = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*229*/	    r2.w = fract(r2.w);
/*230*/	        r2.w = (floatBitsToUint(r3.w) > 0x00000000u) ? r2.w : -r2.w;
/*231*/	    r7.x = r4.y * r2.w;
/*232*/	    r0.w = uintBitsToFloat(floatBitsToUint(r0.w) / floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].x));
/*233*/	    r7.y = floatBitsToUint(r0.w);
/*234*/	    r4.yz = (r5.xxzx * r7.xxyx).yz;
/*235*/	    r8.xy = (r4.yzyy * cb4.data[floatBitsToUint(r0.z)+1536u].xyxx + cb4.data[floatBitsToUint(r0.z)+1536u].zwzz).xy;
/*236*/	    vsOut_T2.xyzw = mix(vec4(0, 0, 1.000000, 1.000000), r8.xyzw, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)));
/*237*/	    vsOut_T6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*238*/	  }
/*239*/	  if(floatBitsToUint(r7.w) != 0u) {
/*240*/	    r3.y = r0.y * 0.125000 + 0.812500;
/*241*/	    r7.xyzw = (textureLod(g_sam_emitter_constants, r3.xyzx.stp, 0.000000)).xyzw;
/*242*/	    r4.x = r4.x * r7.x;
/*243*/	  }
/*244*/	  gl_Position.xyz = (r2.xyzx).xyz;
/*245*/	  gl_Position.w = r3.x;
/*246*/	  r6.z = r5.y;
/*247*/	} else {
/*248*/	  gl_Position.xyzw = vec4(0, 0, 0, 0);
/*249*/	  r1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*250*/	  vsOut_T2.xyzw = vec4(0, 0, 0, 0);
/*251*/	  vsOut_T4.xyzw = vec4(0, 0, 0, 0);
/*252*/	  vsOut_T6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*253*/	  r6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*254*/	  vsOut_C0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*255*/	  r0.yz = (vec4(0, 0, 0, 0)).yz;
/*256*/	  r4.x = 0;
/*257*/	}
/*258*/	vsOut_C0.w = r0.x * r4.x;
/*259*/	vsOut_T0.x = floatBitsToUint(r0.z);
/*260*/	vsOut_T0.yzw = (vec4(0, 0, 0, 0)).yzw;
/*261*/	vsOut_T1.xyz = (r1.xyzx).xyz;
/*262*/	vsOut_T1.w = 0;
/*263*/	vsOut_T3.xyz = (r6.xyzx).xyz;
/*264*/	vsOut_T3.w = 0;
/*265*/	vsOut_T5.xyz = (r0.yyyy).xyz;
/*266*/	return;
}
