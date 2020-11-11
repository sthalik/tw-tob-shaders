//
//
// Shader Model 4
// Fragment Shader
//
// id: 52 - fxc/glsl_SM_4_0_particle_vfx_spawn.hlsl_PS_ps_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_EID0;
in vec4 vsOut_Pos0;
in vec4 vsOut_V0;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;

uniform sampler2DArray g_emitter_instances;
uniform sampler2DArray g_sam_terrain_surface;
uniform sampler3D g_sam_vector_field;

layout(std140) uniform cb_vfx_shared
{
  vec4 data[2];
} cb0;
layout(std140) uniform cb_vfx_game_simulation_data
{
  vec4 data[4];
} cb1;
layout(std140) uniform cb_vfx_emitter_constants_ps
{
  vec4 data[2560];
} cb2;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r14;
  vec4 r15;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (intBitsToFloat(ivec4(vsOut_EID0.xzxx))).xy;
/*1*/	r0.z = floatBitsToUint(r0.x);
/*2*/	r0.w = r0.z * cb0.data[0].x;
/*3*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*4*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? cb0.data[0].x : -cb0.data[0].x/**/;
/*5*/	r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).x;
/*6*/	r1.x = r0.z * r1.x;
/*7*/	r1.x = fract(r1.x);
/*8*/	r0.w = r0.w * r1.x;
/*9*/	r0.z = r0.z / cb0.data[0].x;
/*10*/	r1.xy = (uintBitsToFloat(uvec4(r0.wzww))).xy;
/*11*/	r1.zw = (intBitsToFloat(ivec4(ivec4(0, 0, 1, 0)))).zw;
/*12*/	r2.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r1.xyww).stp, floatBitsToInt(r1.xyww).a).xyzw;
/*13*/	r3.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r1.xyzw).stp, floatBitsToInt(r1.xyzw).a).xyzw;
/*14*/	r1.z = intBitsToFloat(int(3));
/*15*/	r4.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r1.xyzw).stp, floatBitsToInt(r1.xyzw).a).xyzw;
/*16*/	r0.z = intBitsToFloat(int(r4.x));
/*17*/	r1.z = intBitsToFloat(int(4));
/*18*/	r1.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r1.xyzw).stp, floatBitsToInt(r1.xyzw).a).xyzw;
/*19*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[floatBitsToUint(r0.z)].x))) * 0xffffffffu)).w;
/*20*/	r2.w = uintBitsToFloat(uint(cb2.data[floatBitsToUint(r0.z)+1536u].x));
/*21*/	r4.xzw = (cb1.data[3].xxyz * cb2.data[floatBitsToUint(r0.z)+512u].wwww + cb1.data[2].xxyz).xzw;
/*22*/	r5.xyz = (r4.xzwx * cb2.data[floatBitsToUint(r0.z)+512u].zzzz).xyz;
/*23*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*24*/	r5.w = sqrt(r3.w);
/*25*/	r5.w = uintBitsToFloat((r5.w >= 0.010000) ? 0xffffffffu : 0x00000000u);
/*26*/	r3.w = inversesqrt(r3.w);
/*27*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*28*/	r6.xy = (-cb2.data[floatBitsToUint(r0.z)+1024u].zxzz + cb2.data[floatBitsToUint(r0.z)+1024u].wyww).xy;
/*29*/	r3.w = -cb2.data[floatBitsToUint(r0.z)+512u].x + cb2.data[floatBitsToUint(r0.z)+512u].y;
/*30*/	r6.z = -cb2.data[floatBitsToUint(r0.z)+2048u].x + cb2.data[floatBitsToUint(r0.z)+2048u].y;
/*31*/	r7.xyz = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r2.wwww), ivec4(ivec4(1, 2, 3, 0)))) * 0xffffffffu) /**/).xyz;
/*32*/	r8.xyz = (vec4(0.500000, 0.500000, 0.500000, 0.000000) * cb2.data[floatBitsToUint(r0.z)+1536u].yzwy).xyz;
/*33*/	r9.zw = (cb1.data[1].xxxy).zw/**/;
/*34*/	r10.xyz = (vsOut_Pos0.xyzx).xyz;
/*35*/	r11.xyz = (vsOut_V0.xyzx).xyz;
/*36*/	r2.w = r0.x;
/*37*/	r6.w = vsOut_EID0.y;
/*38*/	r7.w = r0.y;
/*39*/	r8.w = vsOut_Pos0.w;
/*40*/	r10.w = vsOut_V0.w;
/*41*/	r11.w = 0;
/*42*/	while(true) {
/*43*/	  r12.x = uintBitsToFloat((floatBitsToInt(r11.w) >= floatBitsToInt(r7.w)) ? 0xffffffffu : 0x00000000u);
/*44*/	  if(floatBitsToUint(r12.x) != 0u) break;
/*45*/	  r12.x = floatBitsToInt(r11.w);
/*46*/	  r12.y = r12.x * 0.200000;
/*47*/	  r12.x = r12.x * 0.200000 + r8.w;
/*48*/	  r12.z = uintBitsToFloat((r12.x >= r8.w) ? 0xffffffffu : 0x00000000u);
/*49*/	  r12.w = r8.w + r10.w;
/*50*/	  r12.w = uintBitsToFloat((r12.w >= r12.x) ? 0xffffffffu : 0x00000000u);
/*51*/	  r12.z = uintBitsToFloat(floatBitsToUint(r12.w) & floatBitsToUint(r12.z));
/*52*/	  if(floatBitsToUint(r12.z) != 0u) {
/*53*/	    r13.xyz = (r11.xyzx / r4.yyyy).xyz;
/*54*/	    r13.xyz = (-r4.xzwx * cb2.data[floatBitsToUint(r0.z)+512u].zzzz + r13.xyzx).xyz;
/*55*/	    r14.xyz = (r13.xyzx * vec4(-2.000000, -2.000000, -2.000000, 0.000000)).xyz;
/*56*/	    r12.z = dot(vec3(r14.xyzx), vec3(r5.xyzx));
/*57*/	    r12.z = r12.z * 0.004975;
/*58*/	    r14.xyz = (r5.xyzx * r12.zzzz).xyz;
/*59*/	    r14.xyz = (uintBitsToFloat(floatBitsToUint(r5.wwww) & floatBitsToUint(r14.xyzx))).xyz;
/*60*/	    r12.zw = (r6.wwww * vec4(0.000000, 0.000000, 1213.000000, 2003.000000)).zw;
/*61*/	    r12.zw = (fract(r12.zzzw)).zw;
/*62*/	    r12.z = r12.z * r6.x + cb2.data[floatBitsToUint(r0.z)+1024u].z;
/*63*/	    r13.w = uintBitsToFloat((0.000000 < r12.z) ? 0xffffffffu : 0x00000000u);
/*64*/	    if(floatBitsToUint(r13.w) != 0u) {
/*65*/	      r13.w = r6.w * 3151.000000;
/*66*/	      r13.w = fract(r13.w);
/*67*/	      r13.w = r13.w * r6.y + cb2.data[floatBitsToUint(r0.z)+1024u].x;
/*68*/	      r13.w = r13.w * r4.y + r8.w;
/*69*/	      r12.x = r12.x + -r13.w;
/*70*/	      r13.w = r10.w + 0.000001;
/*71*/	      r12.x = saturate(r12.x / r13.w);
/*72*/	      r13.w = uintBitsToFloat((0.000000 < r12.x) ? 0xffffffffu : 0x00000000u);
/*73*/	      r14.w = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*74*/	      r15.x = sqrt(r14.w);
/*75*/	      r15.y = inversesqrt(r14.w);
/*76*/	      r13.xyz = (r13.xyzx * r15.yyyy).xyz;
/*77*/	      r12.z = r12.z * r14.w;
/*78*/	      r12.x = r12.x * r12.z;
/*79*/	      r12.x = r12.x * 0.200000;
/*80*/	      r12.x = max(r12.x, r12.x);
/*81*/	      r12.x = min(r15.x, r12.x);
/*82*/	      r13.xyz = (r13.xyzx * -r12.xxxx).xyz;
/*83*/	      r13.xyz = (r4.yyyy * r13.xyzx).xyz;
/*84*/	      r13.xyz = (uintBitsToFloat(floatBitsToUint(r13.xyzx) & floatBitsToUint(r13.wwww))).xyz;
/*85*/	    } else {
/*86*/	      r13.xyz = (vec4(0, 0, 0, 0)).xyz;
/*87*/	    }
/*88*/	    r12.x = r12.w * r3.w + cb2.data[floatBitsToUint(r0.z)+512u].x;
/*89*/	    r12.z = r10.w + 0.000001;
/*90*/	    r12.y = r12.y / r12.z;
/*91*/	    r15.xyz = (r10.xyzx * cb2.data[floatBitsToUint(r0.z)+2048u].zzzz).xyz;
/*92*/	    r15.xyz = (r4.yyyy * r15.xyzx).xyz;
/*93*/	    r15.xyzw = (textureLod(g_sam_vector_field, r15.xyzx.stp, 0.000000)).xyzw;
/*94*/	    r15.xyz = (r15.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*95*/	    r12.y = r12.y * r6.z + cb2.data[floatBitsToUint(r0.z)+2048u].x;
/*96*/	    r12.xy = (r4.yyyy * r12.xyxx).xy;
/*97*/	    r12.y = r12.y * 0.200000;
/*98*/	    r12.xzw = (r12.xxxx * vec4(0.000000, 0.000000, -0.019620, 0.000000) + r13.xxyz).xzw;
/*99*/	    r12.xzw = (r14.xxyz + r12.xxzw).xzw;
/*100*/	    r12.xyz = (r15.xyzx * r12.yyyy + r12.xzwx).xyz;
/*101*/	    r11.xyz = (r11.xyzx + r12.xyzx).xyz;
/*102*/	    r12.xyz = (r11.xyzx * vec4(0.200000, 0.200000, 0.200000, 0.000000) + r10.xyzx).xyz;
/*103*/	    if(floatBitsToUint(r7.x) != 0u) {
/*104*/	      r10.xyz = (r3.xyzx + r12.xyzx).xyz;
/*105*/	    } else {
/*106*/	      if(floatBitsToUint(r7.y) != 0u) {
/*107*/	        r13.xyzw = r3.yzzx + r12.yzzx;
/*108*/	        r13.xyzw = -r2.yzzx + r13.xyzw;
/*109*/	        r12.w = -r1.z * r13.x;
/*110*/	        r12.w = r13.w * r1.w + r12.w;
/*111*/	        r12.w = -r13.y * -r1.y + r12.w;
/*112*/	        r13.y = dot(vec2(r13.wxww), vec2(r1.zwzz));
/*113*/	        r13.y = r13.z * -r1.x + r13.y;
/*114*/	        r14.xy = (-r1.xyxx * r13.xxxx).xy;
/*115*/	        r13.x = r13.w * -r1.y + -r14.x;
/*116*/	        r13.x = r13.z * r1.w + r13.x;
/*117*/	        r13.w = r13.w * r1.x + -r14.y;
/*118*/	        r13.z = -r13.z * -r1.z + r13.w;
/*119*/	        r13.w = r1.x * r13.z;
/*120*/	        r13.w = r1.w * r12.w + r13.w;
/*121*/	        r14.xy = (r1.xwxx * r13.xxxx).xy;
/*122*/	        r13.x = r1.y * r13.x + r13.w;
/*123*/	        r15.x = -r1.z * r13.y + r13.x;
/*124*/	        r13.x = r1.w * r13.y + -r14.x;
/*125*/	        r13.x = r1.y * r13.z + r13.x;
/*126*/	        r15.y = r1.z * r12.w + r13.x;
/*127*/	        r13.x = r1.x * r13.y + r14.y;
/*128*/	        r12.w = -r1.y * r12.w + r13.x;
/*129*/	        r15.z = r1.z * r13.z + r12.w;
/*130*/	        r12.w = -r1.z * r11.y;
/*131*/	        r12.w = r11.x * r1.w + r12.w;
/*132*/	        r12.w = -r11.z * -r1.y + r12.w;
/*133*/	        r13.x = dot(vec2(r11.xyxx), vec2(r1.zwzz));
/*134*/	        r13.x = r11.z * -r1.x + r13.x;
/*135*/	        r13.yz = (-r1.xxyx * r11.yyyy).yz;
/*136*/	        r13.y = r11.x * -r1.y + -r13.y;
/*137*/	        r13.y = r11.z * r1.w + r13.y;
/*138*/	        r13.z = r11.x * r1.x + -r13.z;
/*139*/	        r13.z = -r11.z * -r1.z + r13.z;
/*140*/	        r13.w = r1.x * r13.z;
/*141*/	        r13.w = r1.w * r12.w + r13.w;
/*142*/	        r14.xy = (r1.xwxx * r13.yyyy).xy;
/*143*/	        r13.y = r1.y * r13.y + r13.w;
/*144*/	        r11.x = -r1.z * r13.x + r13.y;
/*145*/	        r13.y = r1.w * r13.x + -r14.x;
/*146*/	        r13.y = r1.y * r13.z + r13.y;
/*147*/	        r11.y = r1.z * r12.w + r13.y;
/*148*/	        r13.x = r1.x * r13.x + r14.y;
/*149*/	        r12.w = -r1.y * r12.w + r13.x;
/*150*/	        r11.z = r1.z * r13.z + r12.w;
/*151*/	        r10.xyz = (r2.xyzx + r15.xyzx).xyz;
/*152*/	      } else {
/*153*/	        r13.xyz = (-r2.xyzx + r12.xyzx).xyz;
/*154*/	        r13.xyz = (r13.xyzx / cb2.data[floatBitsToUint(r0.z)+1536u].yzwy).xyz;
/*155*/	        r13.xyz = (r13.xyzx + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*156*/	        r13.xyz = (fract(r13.xyzx)).xyz;
/*157*/	        r13.xyz = (r13.xyzx * cb2.data[floatBitsToUint(r0.z)+1536u].yzwy + -r8.xyzx).xyz;
/*158*/	        r13.xyz = (r2.xyzx + r13.xyzx).xyz;
/*159*/	        r10.xyz = (mix(r12.xyzx, r13.xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz;
/*160*/	      }
/*161*/	    }
/*162*/	    if(floatBitsToUint(r0.w) != 0u) {
/*163*/	      r9.xy = (r10.xzxx * cb1.data[0].zzzz).xy;
/*164*/	      r12.xyzw = (textureLod(g_sam_terrain_surface, r9.xyzx.stp, 0.000000)).xyzw;
/*165*/	      r13.xyzw = (textureLod(g_sam_terrain_surface, r9.xywx.stp, 0.000000)).xyzw;
/*166*/	      r9.x = -r12.x + r13.x;
/*167*/	      r9.x = cb1.data[1].z * r9.x + r12.x;
/*168*/	      r9.x = r9.x * cb1.data[0].y + cb1.data[0].x;
/*169*/	      r10.y = max(r10.y, r9.x);
/*170*/	    }
/*171*/	  } else {
/*172*/	    r11.xyz = (vec4(0, 0, 0, 0)).xyz;
/*173*/	    r2.w = intBitsToFloat(int(-1));
/*174*/	    r6.w = 0;
/*175*/	    r7.w = 0;
/*176*/	    r8.w = 0;
/*177*/	    r10.xyzw = vec4(0, 0, 0, 0);
/*178*/	    break;
/*179*/	}
/*180*/	r11.w = intBitsToFloat(floatBitsToInt(r11.w) + int(1));
/*181*/	}
/*182*/	color1.xyz = (r10.xyzx).xyz;
/*183*/	color2.xyz = (r11.xyzx).xyz;
/*184*/	color0.y = r6.w;
/*185*/	color1.w = r8.w;
/*186*/	color2.w = r10.w;
/*187*/	color0.x = floatBitsToInt(r2.w);
/*188*/	color0.z = floatBitsToInt(r7.w);
/*189*/	color0.w = 0;
/*190*/	return;
}
