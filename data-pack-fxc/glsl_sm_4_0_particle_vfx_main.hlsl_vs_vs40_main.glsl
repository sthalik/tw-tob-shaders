// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 47 - fxc/glsl_SM_4_0_particle_vfx_main.hlsl_VS_vs40_main.glsl
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
/*25*/	r0.x = uintBitsToFloat(uint(r0.x));
/*26*/	r0.x = floatBitsToUint(r0.x);
/*27*/	r0.x = -r0.x + cb1.data[0].y;
/*28*/	r0.x = r0.x + -1.000000;
/*29*/	r1.xy = (uintBitsToFloat(uvec4(r0.yxyy))).xy;
/*30*/	r1.zw = (intBitsToFloat(ivec4(ivec4(0, 0, 1, 0)))).zw;
/*31*/	r0.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r1.xyww).stp, floatBitsToInt(r1.xyww).a).xyzw;
/*32*/	r2.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r1.xyzw).stp, floatBitsToInt(r1.xyzw).a).xyzw;
/*33*/	r0.x = intBitsToFloat(int(r0.x));
/*34*/	r0.z = floatBitsToUint(r0.x);
/*35*/	r0.w = r0.z * cb1.data[0].x;
/*36*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*37*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? cb1.data[0].x : -cb1.data[0].x/**/;
/*38*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).x;
/*39*/	r3.x = r0.z * r3.x;
/*40*/	r3.x = fract(r3.x);
/*41*/	r0.w = r0.w * r3.x;
/*42*/	r0.z = r0.z / cb1.data[0].x;
/*43*/	r3.xy = (uintBitsToFloat(uvec4(r0.wzww))).xy;
/*44*/	r3.zw = (intBitsToFloat(ivec4(ivec4(0, 0, 2, 0)))).zw;
/*45*/	r4.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r3.xyzw).stp, floatBitsToInt(r3.xyzw).a).xyzw;
/*46*/	r3.z = intBitsToFloat(int(3));
/*47*/	r5.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r3.xyzw).stp, floatBitsToInt(r3.xyzw).a).xyzw;
/*48*/	r0.z = intBitsToFloat(int(r5.x));
/*49*/	r0.x = uintBitsToFloat((floatBitsToInt(r0.x) != int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*50*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[2].w) == floatBitsToInt(cb3.data[floatBitsToUint(r0.z)].w)) ? 0xffffffffu : 0x00000000u) /**/;
/*51*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*52*/	r0.w = uintBitsToFloat((0.010000 < r4.w) ? 0xffffffffu : 0x00000000u);
/*53*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*54*/	r5.xzw = (r2.xxyz + -cb0.data[0].xxyz).xzw;
/*55*/	r0.w = dot(vec3(r5.xzwx), vec3(r5.xzwx));
/*56*/	r0.w = sqrt(r0.w);
/*57*/	r6.xyzw = r5.yyyy * cb4.data[floatBitsToUint(r0.z)].xyzw;
/*58*/	r5.xzw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.wwww, r6.xxyz)) * 0xffffffffu)).xzw;
/*59*/	r7.xyz = (uintBitsToFloat(uvec4(greaterThanEqual(r0.wwww, r6.yzwy)) * 0xffffffffu)).xyz;
/*60*/	r5.xzw = (uintBitsToFloat(floatBitsToUint(r5.xxzw) & uvec4(vec4(0x3f800000u, 0, 0x3f800000u, 0x3f800000u)))).xzw;
/*61*/	r5.xzw = (mix(r5.xxzw, vec4(0, 0, 0, 0), greaterThan(floatBitsToUint(r7.xxyz), uvec4(0)))).xzw;
/*62*/	r3.z = -cb4.data[floatBitsToUint(r0.z)].x * r5.y + r0.w;
/*63*/	r6.xy = (cb4.data[floatBitsToUint(r0.z)].ywyy * r5.yyyy + -r6.xzxx).xy;
/*64*/	r6.xy = (r6.xyxx + vec4(0.000001, 0.000001, 0.000000, 0.000000)).xy;
/*65*/	r7.x = saturate(r3.z / r6.x);
/*66*/	r0.w = cb4.data[floatBitsToUint(r0.z)].w * r5.y + -r0.w;
/*67*/	r7.z = saturate(r0.w / r6.y);
/*68*/	r7.y = 1.000000;
/*69*/	r0.w = dot(vec3(r7.xyzx), vec3(r5.xzwx));
/*70*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*71*/	r0.w = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*72*/	if(floatBitsToUint(r0.w) != 0u) {
/*73*/	  r1.z = intBitsToFloat(int(2));
/*74*/	  r1.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r1.xyzw).stp, floatBitsToInt(r1.xyzw).a).xyzw;
/*75*/	  r3.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r3.xyww).stp, floatBitsToInt(r3.xyww).a).xyzw;
/*76*/	  r0.w = -r2.w + r3.w;
/*77*/	  r1.w = r1.w + 0.000001;
/*78*/	  r3.x = r0.w / r1.w;
/*79*/	  r5.xz = (r0.yyyy * vec4(8741.000000, 0.000000, 2521.000000, 0.000000)).xz;
/*80*/	  r3.y = r0.y * 0.125000 + 0.062500;
/*81*/	  r3.z = floatBitsToUint(r0.z);
/*82*/	  r6.xyzw = (textureLod(g_sam_emitter_constants, r3.xyzx.stp, 0.000000)).xyzw;
/*83*/	  r6.xy = (r5.yyyy * r6.xyxx).xy;
/*84*/	  r7.xyzw = uintBitsToFloat(uvec4(ivec4(1, 2, 8, 16)) & floatBitsToUint(cb3.data[floatBitsToUint(r0.z)].xxxx));
/*85*/	  r5.xz = (fract(r5.xxzx)).xz;
/*86*/	  r8.xy = (-cb4.data[floatBitsToUint(r0.z)+512u].xzxx + cb4.data[floatBitsToUint(r0.z)+512u].ywyy).xy;
/*87*/	  r5.xz = (r5.xxzx * r8.xxyx + cb4.data[floatBitsToUint(r0.z)+512u].xxzx).xz;
/*88*/	  r0.w = r5.x * 0.017453;
/*89*/	  r1.w = uintBitsToFloat((r5.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*90*/	    r0.w = (floatBitsToUint(r1.w) > 0x00000000u) ? -r0.w : r0.w;
/*91*/	  r1.w = r3.x * r5.z;
/*92*/	  r0.w = r1.w * 6.283185 + r0.w;
/*93*/	  r0.w = r0.w * 0.159155;
/*94*/	  r1.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*95*/	  r0.w = fract(abs(r0.w));
/*96*/	    r0.w = (floatBitsToUint(r1.w) > 0x00000000u) ? r0.w : -r0.w;
/*97*/	  r0.w = r0.w * 6.283185;
/*98*/	  r5.x = sin(r0.w);   r8.x = cos(r0.w);
/*99*/	  r8.xw = (r8.xxxx).xw;
/*100*/	  r8.yz = (r5.xxxx * vec4(0.000000, 1.000000, -1.000000, 0.000000)).yz;
/*101*/	  vsOut_T4.xyzw = mix(vec4(1.000000, 0, 0, 1.000000), r8.xyzw, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)));
/*102*/	  if(floatBitsToUint(r7.y) != 0u) {
/*103*/	    r3.w = r0.y * 0.125000 + 0.312500;
/*104*/	    r8.xyzw = (textureLod(g_sam_emitter_constants, r3.xwzx.stp, 0.000000)).xyzw;
/*105*/	    r8.w = 1.000000;
/*106*/	    r4.xyzw = r4.wxyz * r8.wxyz;
/*107*/	    vsOut_C0.xyz = (r4.yzwy).xyz;
/*108*/	  } else {
/*109*/	    vsOut_C0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*110*/	    r4.x = 0;
/*111*/	  }
/*112*/	  r0.w = intBitsToFloat(floatBitsToInt(cb4.data[floatBitsToUint(r0.z)+2048u].y) * floatBitsToInt(cb4.data[floatBitsToUint(r0.z)+2048u].x)) /**/;
/*113*/	  r0.w = floatBitsToUint(r0.w);
/*114*/	  r4.yz = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].xxyx)).yz;
/*115*/	  r5.xz = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / r4.yyzy).xz;
/*116*/	  r8.zw = (r5.xxxz * cb4.data[floatBitsToUint(r0.z)+1536u].xxxy).zw;
/*117*/	  if(floatBitsToUint(r7.z) != 0u) {
/*118*/	    r1.w = uintBitsToFloat(uint(cb4.data[floatBitsToUint(r0.z)+3072u].z));
/*119*/	    r2.w = r3.x * cb4.data[floatBitsToUint(r0.z)+3072u].x;
/*120*/	    r3.w = r3.x * cb4.data[floatBitsToUint(r0.z)+3072u].y + -r2.w;
/*121*/	    r2.w = r3.x * r3.w + r2.w;
/*122*/	        r2.w = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].y) > 0x00000000u) ? r2.w : r3.x;
/*123*/	    r1.w = floatBitsToUint(r1.w);
/*124*/	    r1.w = r4.y * r1.w;
/*125*/	    r3.w = r0.y * r4.z;
/*126*/	    r3.w = r3.w / r4.z;
/*127*/	    r4.w = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*128*/	    r3.w = fract(abs(r3.w));
/*129*/	        r3.w = (floatBitsToUint(r4.w) > 0x00000000u) ? r3.w : -r3.w;
/*130*/	    r3.w = r4.z * r3.w;
/*131*/	    r3.w = r4.y * r3.w;
/*132*/	        r1.w = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].w) > 0x00000000u) ? r3.w : r1.w;
/*133*/	    r3.w = uintBitsToFloat((int(0) != floatBitsToInt(cb4.data[floatBitsToUint(r0.z)+2048u].w)) ? 0xffffffffu : 0x00000000u) /**/;
/*134*/	    r4.z = uintBitsToFloat((int(0) != floatBitsToInt(cb4.data[floatBitsToUint(r0.z)+2560u].z)) ? 0xffffffffu : 0x00000000u) /**/;
/*135*/	    r3.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r4.z));
/*136*/	    if(floatBitsToUint(r3.w) != 0u) {
/*137*/	      r3.w = r0.y + r2.w;
/*138*/	      r4.z = r4.y * r3.w;
/*139*/	      r4.z = r4.z / r4.y;
/*140*/	      r4.w = uintBitsToFloat((r4.z >= -r4.z) ? 0xffffffffu : 0x00000000u);
/*141*/	      r4.z = fract(abs(r4.z));
/*142*/	            r4.z = (floatBitsToUint(r4.w) > 0x00000000u) ? r4.z : -r4.z;
/*143*/	      r4.z = r4.z * r4.y + r1.w;
/*144*/	      r3.w = r3.w * r4.y + 1.000000;
/*145*/	      r3.w = r3.w / r4.y;
/*146*/	      r4.w = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*147*/	      r3.w = fract(abs(r3.w));
/*148*/	            r3.w = (floatBitsToUint(r4.w) > 0x00000000u) ? r3.w : -r3.w;
/*149*/	      r3.w = r3.w * r4.y + r1.w;
/*150*/	      r7.x = intBitsToFloat(int(r3.w));
/*151*/	      r9.x = trunc(r4.z);
/*152*/	      r7.y = r4.z + -r9.x;
/*153*/	      r4.zw = (mix(vec4(0, 0, 0, 0), r7.xxxy, greaterThan(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].xxxx), uvec4(0)))).zw;
/*154*/	      r9.y = floatBitsToInt(r4.z);
/*155*/	      vsOut_T6.z = r4.w;
/*156*/	    } else {
/*157*/	      r3.w = r0.w * r2.w;
/*158*/	      r7.x = floor(r3.w);
/*159*/	      r3.w = r7.x + 1.000000;
/*160*/	      r3.w = r3.w / r0.w;
/*161*/	      r4.z = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*162*/	      r3.w = fract(abs(r3.w));
/*163*/	            r3.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r3.w : -r3.w;
/*164*/	      r3.w = r0.w * r3.w;
/*165*/	      r7.y = floor(r3.w);
/*166*/	      r3.w = r2.w * r0.w + -r7.x;
/*167*/	            r7.z = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].x) > 0x00000000u) ? r3.w : 0;
/*168*/	      if(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].w) != 0u) {
/*169*/	        r3.w = r0.y * r0.w + r7.x;
/*170*/	        r3.w = r3.w / r0.w;
/*171*/	        r4.z = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*172*/	        r3.w = fract(abs(r3.w));
/*173*/	                r3.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r3.w : -r3.w;
/*174*/	        r3.w = r0.w * r3.w;
/*175*/	        r9.x = floor(r3.w);
/*176*/	        r3.w = r9.x + 1.000000;
/*177*/	        r3.w = r3.w / r0.w;
/*178*/	        r4.z = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*179*/	        r3.w = fract(abs(r3.w));
/*180*/	                r3.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r3.w : -r3.w;
/*181*/	        r3.w = r0.w * r3.w;
/*182*/	        r3.w = floor(r3.w);
/*183*/	                r9.y = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].x) > 0x00000000u) ? r3.w : r7.y;
/*184*/	        vsOut_T6.z = r7.z;
/*185*/	      } else {
/*186*/	        r3.w = r4.y * r2.w;
/*187*/	        r3.w = r3.w / r4.y;
/*188*/	        r4.z = uintBitsToFloat((r3.w >= -r3.w) ? 0xffffffffu : 0x00000000u);
/*189*/	        r3.w = fract(abs(r3.w));
/*190*/	                r3.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r3.w : -r3.w;
/*191*/	        r3.w = r3.w * r4.y + r1.w;
/*192*/	        r2.w = r2.w * r4.y + 1.000000;
/*193*/	        r2.w = r2.w / r4.y;
/*194*/	        r4.z = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*195*/	        r2.w = fract(abs(r2.w));
/*196*/	                r2.w = (floatBitsToUint(r4.z) > 0x00000000u) ? r2.w : -r2.w;
/*197*/	        r1.w = r2.w * r4.y + r1.w;
/*198*/	        r4.z = intBitsToFloat(int(r1.w));
/*199*/	        r10.x = trunc(r3.w);
/*200*/	        r4.w = r3.w + -r10.x;
/*201*/	        r10.zw = (mix(vec4(0, 0, 0, 0), r4.zzzw, greaterThan(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].xxxx), uvec4(0)))).zw;
/*202*/	        r10.y = floatBitsToInt(r10.z);
/*203*/	        r9.xyz = (mix(r7.xyzx, r10.xywx, greaterThan(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].zzzz), uvec4(0)))).xyz;
/*204*/	        vsOut_T6.z = r9.z;
/*205*/	      }
/*206*/	    }
/*207*/	    r4.zw = (r9.xxxy / r4.yyyy).zw;
/*208*/	    r7.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.zwzz, -r4.zwzz)) * 0xffffffffu)).xy;
/*209*/	    r9.xy = (fract(abs(r4.zwzz))).xy;
/*210*/	    r7.xy = (mix(-r9.xyxx, r9.xyxx, greaterThan(floatBitsToUint(r7.xyxx), uvec4(0)))).xy;
/*211*/	    r9.xy = (r4.yyyy * r7.xyxx).xy;
/*212*/	    r9.zw = floor((r4.zzzw).zw);
/*213*/	    r9.xyzw = r5.xzxz * r9.xzyw;
/*214*/	    r4.zw = (r9.zzzw * cb4.data[floatBitsToUint(r0.z)+1536u].xxxy).zw;
/*215*/	    vsOut_T2.xy = (r9.xyxx * cb4.data[floatBitsToUint(r0.z)+1536u].xyxx + cb4.data[floatBitsToUint(r0.z)+1536u].zwzz).xy;
/*216*/	    r4.zw = (mix(vec4(0, 0, 0, 0), r4.zzzw, greaterThan(floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2560u].xxxx), uvec4(0)))).zw;
/*217*/	    vsOut_T6.xy = (r4.zwzz + cb4.data[floatBitsToUint(r0.z)+1536u].zwzz).xy;
/*218*/	    vsOut_T2.zw = (r8.zzzw).zw;
/*219*/	  } else {
/*220*/	    r1.w = uintBitsToFloat(uint(4) & floatBitsToUint(cb3.data[floatBitsToUint(r0.z)].x));
/*221*/	    r2.w = floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].z);
/*222*/	    r2.w = r0.y * r0.w + r2.w;
/*223*/	    r2.w = r2.w / r0.w;
/*224*/	    r3.w = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*225*/	    r2.w = fract(abs(r2.w));
/*226*/	        r2.w = (floatBitsToUint(r3.w) > 0x00000000u) ? r2.w : -r2.w;
/*227*/	    r0.w = r0.w * r2.w;
/*228*/	    r0.w = uintBitsToFloat(uint(r0.w));
/*229*/	        r0.w = (floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].w) > 0x00000000u) ? r0.w : cb4.data[floatBitsToUint(r0.z)+2048u].z/**/;
/*230*/	    r2.w = floatBitsToUint(r0.w);
/*231*/	    r2.w = r2.w / r4.y;
/*232*/	    r3.w = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*233*/	    r2.w = fract(r2.w);
/*234*/	        r2.w = (floatBitsToUint(r3.w) > 0x00000000u) ? r2.w : -r2.w;
/*235*/	    r7.x = r4.y * r2.w;
/*236*/	    r0.w = uintBitsToFloat(floatBitsToUint(r0.w) / floatBitsToUint(cb4.data[floatBitsToUint(r0.z)+2048u].x));
/*237*/	    r7.y = floatBitsToUint(r0.w);
/*238*/	    r4.yz = (r5.xxzx * r7.xxyx).yz;
/*239*/	    r8.xy = (r4.yzyy * cb4.data[floatBitsToUint(r0.z)+1536u].xyxx + cb4.data[floatBitsToUint(r0.z)+1536u].zwzz).xy;
/*240*/	    vsOut_T2.xyzw = mix(vec4(0, 0, 1.000000, 1.000000), r8.xyzw, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)));
/*241*/	    vsOut_T6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*242*/	  }
/*243*/	  if(floatBitsToUint(r7.w) != 0u) {
/*244*/	    r3.y = r0.y * 0.125000 + 0.812500;
/*245*/	    r7.xyzw = (textureLod(g_sam_emitter_constants, r3.xyzx.stp, 0.000000)).xyzw;
/*246*/	    r4.x = r4.x * r7.x;
/*247*/	  }
/*248*/	  gl_Position.xyz = (r2.xyzx).xyz;
/*249*/	  gl_Position.w = r3.x;
/*250*/	  r6.z = r5.y;
/*251*/	} else {
/*252*/	  gl_Position.xyzw = vec4(0, 0, 0, 0);
/*253*/	  r1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*254*/	  vsOut_T2.xyzw = vec4(0, 0, 0, 0);
/*255*/	  vsOut_T4.xyzw = vec4(0, 0, 0, 0);
/*256*/	  vsOut_T6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*257*/	  r6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*258*/	  vsOut_C0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*259*/	  r0.yz = (vec4(0, 0, 0, 0)).yz;
/*260*/	  r4.x = 0;
/*261*/	}
/*262*/	vsOut_C0.w = r0.x * r4.x;
/*263*/	vsOut_T0.x = floatBitsToUint(r0.z);
/*264*/	vsOut_T0.yzw = (vec4(0, 0, 0, 0)).yzw;
/*265*/	vsOut_T1.xyz = (r1.xyzx).xyz;
/*266*/	vsOut_T1.w = 0;
/*267*/	vsOut_T3.xyz = (r6.xyzx).xyz;
/*268*/	vsOut_T3.w = 0;
/*269*/	vsOut_T5.xyz = (r0.yyyy).xyz;
/*270*/	return;
}
