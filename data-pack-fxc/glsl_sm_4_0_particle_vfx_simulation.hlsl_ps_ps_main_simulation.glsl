//
//
// Shader Model 4
// Fragment Shader
//
// id: 4 - fxc/glsl_SM_4_0_particle_vfx_simulation.hlsl_PS_ps_main_simulation.glsl
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
layout(location = 2) out vec4 color2;

uniform sampler2DArray g_emitter_instances;
uniform sampler2DArray g_particle_instances;
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
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (gl_FragCoord.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*1*/	r0.xy = (uintBitsToFloat(uvec4(r0.xyxx))).xy;
/*2*/	r0.zw = (intBitsToFloat(ivec4(ivec4(0, 0, 1, 0)))).zw;
/*3*/	r1.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r0.xyww).stp, floatBitsToInt(r0.xyww).a).xyzw;
/*4*/	r2.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r0.xyzw).stp, floatBitsToInt(r0.xyzw).a).xyzw;
/*5*/	r0.z = intBitsToFloat(int(2));
/*6*/	r0.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r0.xyzw).stp, floatBitsToInt(r0.xyzw).a).xyzw;
/*7*/	r3.yz = (intBitsToFloat(ivec4(r1.zzxz))).yz;
/*8*/	r1.x = uintBitsToFloat((floatBitsToInt(r3.z) != int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*9*/	if(floatBitsToUint(r1.x) != 0u) {
/*10*/	  r1.x = floatBitsToUint(r3.z);
/*11*/	  r1.z = r1.x * cb0.data[0].x;
/*12*/	  r1.z = uintBitsToFloat((r1.z >= -r1.z) ? 0xffffffffu : 0x00000000u);
/*13*/	    r1.z = (floatBitsToUint(r1.z) > 0x00000000u) ? cb0.data[0].x : -cb0.data[0].x/**/;
/*14*/	  r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).w;
/*15*/	  r1.w = r1.w * r1.x;
/*16*/	  r1.w = fract(r1.w);
/*17*/	  r1.z = r1.w * r1.z;
/*18*/	  r1.x = r1.x / cb0.data[0].x;
/*19*/	  r4.xy = (uintBitsToFloat(uvec4(r1.zxzz))).xy;
/*20*/	  r4.w = 0;
/*21*/	  r5.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r4.xyww).stp, floatBitsToInt(r4.xyww).a).xyzw;
/*22*/	  r1.x = uintBitsToFloat((r5.w >= r2.w) ? 0xffffffffu : 0x00000000u);
/*23*/	  r1.z = r0.w + r2.w;
/*24*/	  r1.z = uintBitsToFloat((r1.z >= r5.w) ? 0xffffffffu : 0x00000000u);
/*25*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r1.x));
/*26*/	  if(floatBitsToUint(r1.x) != 0u) {
/*27*/	    r4.z = intBitsToFloat(int(1));
/*28*/	    r6.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r4.xyzw).stp, floatBitsToInt(r4.xyzw).a).xyzw;
/*29*/	    r4.z = intBitsToFloat(int(3));
/*30*/	    r7.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r4.xyzw).stp, floatBitsToInt(r4.xyzw).a).xyzw;
/*31*/	    r1.x = intBitsToFloat(int(r7.x));
/*32*/	    r4.z = intBitsToFloat(int(5));
/*33*/	    r8.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r4.xyzw).stp, floatBitsToInt(r4.xyzw).a).xyzw;
/*34*/	    r1.z = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[floatBitsToUint(r1.x)].x))) * 0xffffffffu)).z;
/*35*/	    r1.w = uintBitsToFloat(uint(cb2.data[floatBitsToUint(r1.x)+1536u].x));
/*36*/	    r7.xzw = (cb1.data[3].xxyz * cb2.data[floatBitsToUint(r1.x)+512u].wwww + cb1.data[2].xxyz).xzw;
/*37*/	    r9.xyz = (r7.xzwx * cb2.data[floatBitsToUint(r1.x)+512u].zzzz).xyz;
/*38*/	    r9.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*39*/	    r10.x = sqrt(r9.w);
/*40*/	    r10.x = uintBitsToFloat((r10.x >= 0.010000) ? 0xffffffffu : 0x00000000u);
/*41*/	    r10.yzw = (r0.xxyz / r7.yyyy).yzw;
/*42*/	    r7.xzw = (-r7.xxzw * cb2.data[floatBitsToUint(r1.x)+512u].zzzz + r10.yyzw).xzw;
/*43*/	    r9.w = inversesqrt(r9.w);
/*44*/	    r9.xyz = (r9.wwww * r9.xyzx).xyz;
/*45*/	    r10.yzw = (r7.xxzw * vec4(0.000000, -2.000000, -2.000000, -2.000000)).yzw;
/*46*/	    r9.w = dot(vec3(r10.yzwy), vec3(r9.xyzx));
/*47*/	    r9.w = r9.w * 0.004975;
/*48*/	    r9.xyz = (r9.xyzx * r9.wwww).xyz;
/*49*/	    r9.w = saturate(r6.w * 30.000000);
/*50*/	    r9.xyz = (r9.wwww * r9.xyzx).xyz;
/*51*/	    r9.xyz = (uintBitsToFloat(floatBitsToUint(r9.xyzx) & floatBitsToUint(r10.xxxx))).xyz;
/*52*/	    r10.xy = (r1.yyyy * vec4(1213.000000, 2003.000000, 0.000000, 0.000000)).xy;
/*53*/	    r10.xy = (fract(r10.xyxx)).xy;
/*54*/	    r9.w = -cb2.data[floatBitsToUint(r1.x)+1024u].z + cb2.data[floatBitsToUint(r1.x)+1024u].w;
/*55*/	    r9.w = r10.x * r9.w + cb2.data[floatBitsToUint(r1.x)+1024u].z;
/*56*/	    r10.x = uintBitsToFloat((0.000000 < r9.w) ? 0xffffffffu : 0x00000000u);
/*57*/	    if(floatBitsToUint(r10.x) != 0u) {
/*58*/	      r10.x = r1.y * 3151.000000;
/*59*/	      r10.x = fract(r10.x);
/*60*/	      r10.z = -cb2.data[floatBitsToUint(r1.x)+1024u].x + cb2.data[floatBitsToUint(r1.x)+1024u].y;
/*61*/	      r10.x = r10.x * r10.z + cb2.data[floatBitsToUint(r1.x)+1024u].x;
/*62*/	      r10.x = r10.x * r7.y + r2.w;
/*63*/	      r10.x = r5.w + -r10.x;
/*64*/	      r10.z = r0.w + 0.000001;
/*65*/	      r10.x = saturate(r10.x / r10.z);
/*66*/	      r10.z = uintBitsToFloat((0.000000 < r10.x) ? 0xffffffffu : 0x00000000u);
/*67*/	      r10.w = dot(vec3(r7.xzwx), vec3(r7.xzwx));
/*68*/	      r11.x = sqrt(r10.w);
/*69*/	      r11.y = inversesqrt(r10.w);
/*70*/	      r7.xzw = (r7.xxzw * r11.yyyy).xzw;
/*71*/	      r9.w = r9.w * r10.w;
/*72*/	      r9.w = r10.x * r9.w;
/*73*/	      r9.w = r6.w * r9.w;
/*74*/	      r9.w = max(r9.w, r9.w);
/*75*/	      r9.w = min(r11.x, r9.w);
/*76*/	      r7.xzw = (r7.xxzw * -r9.wwww).xzw;
/*77*/	      r7.xzw = (r7.yyyy * r7.xxzw).xzw;
/*78*/	      r7.xzw = (uintBitsToFloat(floatBitsToUint(r7.xxzw) & floatBitsToUint(r10.zzzz))).xzw;
/*79*/	    } else {
/*80*/	      r7.xzw = (vec4(0, 0, 0, 0)).xzw;
/*81*/	    }
/*82*/	    r9.w = -cb2.data[floatBitsToUint(r1.x)+512u].x + cb2.data[floatBitsToUint(r1.x)+512u].y;
/*83*/	    r9.w = r10.y * r9.w + cb2.data[floatBitsToUint(r1.x)+512u].x;
/*84*/	    r9.w = r7.y * r9.w;
/*85*/	    r9.w = r6.w * r9.w;
/*86*/	    r5.w = -r2.w + r5.w;
/*87*/	    r10.x = r0.w + 0.000001;
/*88*/	    r5.w = r5.w / r10.x;
/*89*/	    r10.xyz = (r2.xyzx * cb2.data[floatBitsToUint(r1.x)+2048u].zzzz).xyz;
/*90*/	    r10.xyz = (r7.yyyy * r10.xyzx).xyz;
/*91*/	    r10.xyzw = (textureLod(g_sam_vector_field, r10.xyzx.stp, 0.000000)).xyzw;
/*92*/	    r10.xyz = (r10.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*93*/	    r10.w = -cb2.data[floatBitsToUint(r1.x)+2048u].x + cb2.data[floatBitsToUint(r1.x)+2048u].y;
/*94*/	    r5.w = r5.w * r10.w + cb2.data[floatBitsToUint(r1.x)+2048u].x;
/*95*/	    r5.w = r6.w * r5.w;
/*96*/	    r5.w = r7.y * r5.w;
/*97*/	    r7.xyz = (r9.wwww * vec4(0.000000, -0.098100, 0.000000, 0.000000) + r7.xzwx).xyz;
/*98*/	    r7.xyz = (r9.xyzx + r7.xyzx).xyz;
/*99*/	    r7.xyz = (r10.xyzx * r5.wwww + r7.xyzx).xyz;
/*100*/	    r0.xyz = (r0.xyzx + r7.xyzx).xyz;
/*101*/	    r7.xyz = (r0.xyzx * r6.wwww + r2.xyzx).xyz;
/*102*/	    r5.w = uintBitsToFloat((floatBitsToInt(r1.w) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*103*/	    if(floatBitsToUint(r5.w) != 0u) {
/*104*/	      r2.xyz = (r6.xzyx + r7.xzyx).xyz;
/*105*/	    } else {
/*106*/	      r5.w = uintBitsToFloat((floatBitsToInt(r1.w) == int(2)) ? 0xffffffffu : 0x00000000u) /**/;
/*107*/	      if(floatBitsToUint(r5.w) != 0u) {
/*108*/	        r4.z = intBitsToFloat(int(4));
/*109*/	        r4.xyzw = texelFetch(g_emitter_instances, floatBitsToInt(r4.xyzw).stp, floatBitsToInt(r4.xyzw).a).xyzw;
/*110*/	        r6.xyzw = r6.yzzx + r7.yzzx;
/*111*/	        r6.xyzw = -r5.yzzx + r6.xyzw;
/*112*/	        r5.w = -r4.z * r6.x;
/*113*/	        r5.w = r6.w * r4.w + r5.w;
/*114*/	        r5.w = -r6.y * -r4.y + r5.w;
/*115*/	        r6.y = dot(vec2(r6.wxww), vec2(r4.zwzz));
/*116*/	        r6.y = r6.z * -r4.x + r6.y;
/*117*/	        r9.xy = (-r4.xyxx * r6.xxxx).xy;
/*118*/	        r6.x = r6.w * -r4.y + -r9.x;
/*119*/	        r6.x = r6.z * r4.w + r6.x;
/*120*/	        r6.w = r6.w * r4.x + -r9.y;
/*121*/	        r6.z = -r6.z * -r4.z + r6.w;
/*122*/	        r6.w = r4.x * r6.z;
/*123*/	        r6.w = r4.w * r5.w + r6.w;
/*124*/	        r9.xy = (r4.xwxx * r6.xxxx).xy;
/*125*/	        r6.x = r4.y * r6.x + r6.w;
/*126*/	        r10.x = -r4.z * r6.y + r6.x;
/*127*/	        r6.x = r4.w * r6.y + -r9.x;
/*128*/	        r6.x = r4.y * r6.z + r6.x;
/*129*/	        r10.y = r4.z * r5.w + r6.x;
/*130*/	        r6.x = r4.x * r6.y + r9.y;
/*131*/	        r5.w = -r4.y * r5.w + r6.x;
/*132*/	        r10.z = r4.z * r6.z + r5.w;
/*133*/	        r5.w = r0.y * -r4.z;
/*134*/	        r5.w = r0.x * r4.w + r5.w;
/*135*/	        r5.w = -r0.z * -r4.y + r5.w;
/*136*/	        r6.x = dot(vec2(r0.xyxx), vec2(r4.zwzz));
/*137*/	        r6.x = r0.z * -r4.x + r6.x;
/*138*/	        r6.yz = (r0.yyyy * -r4.xxyx).yz;
/*139*/	        r6.y = r0.x * -r4.y + -r6.y;
/*140*/	        r6.y = r0.z * r4.w + r6.y;
/*141*/	        r6.z = r0.x * r4.x + -r6.z;
/*142*/	        r6.z = -r0.z * -r4.z + r6.z;
/*143*/	        r6.w = r4.x * r6.z;
/*144*/	        r6.w = r4.w * r5.w + r6.w;
/*145*/	        r9.xy = (r4.xwxx * r6.yyyy).xy;
/*146*/	        r6.y = r4.y * r6.y + r6.w;
/*147*/	        r0.x = -r4.z * r6.x + r6.y;
/*148*/	        r4.w = r4.w * r6.x + -r9.x;
/*149*/	        r4.w = r4.y * r6.z + r4.w;
/*150*/	        r0.y = r4.z * r5.w + r4.w;
/*151*/	        r4.x = r4.x * r6.x + r9.y;
/*152*/	        r4.x = -r4.y * r5.w + r4.x;
/*153*/	        r0.z = r4.z * r6.z + r4.x;
/*154*/	        r2.xyz = (r5.xzyx + r10.xzyx).xyz;
/*155*/	      } else {
/*156*/	        r1.w = uintBitsToFloat((floatBitsToInt(r1.w) == int(3)) ? 0xffffffffu : 0x00000000u) /**/;
/*157*/	        r4.xyz = (-r5.xyzx + r7.xyzx).xyz;
/*158*/	        r4.xyz = (r4.xyzx / cb2.data[floatBitsToUint(r1.x)+1536u].yzwy).xyz;
/*159*/	        r4.xyz = (r4.xyzx + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*160*/	        r4.xyz = (fract(r4.xyzx)).xyz;
/*161*/	        r6.xyz = (vec4(0.500000, 0.500000, 0.500000, 0.000000) * cb2.data[floatBitsToUint(r1.x)+1536u].yzwy).xyz;
/*162*/	        r4.xyz = (r4.xyzx * cb2.data[floatBitsToUint(r1.x)+1536u].yzwy + -r6.xyzx).xyz;
/*163*/	        r4.xyz = (r5.xyzx + r4.xyzx).xyz;
/*164*/	        r2.xyz = (mix(r7.xzyx, r4.xzyx, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xyz;
/*165*/	      }
/*166*/	    }
/*167*/	    if(floatBitsToUint(r1.z) != 0u) {
/*168*/	      r4.xy = (r2.xyxx * cb1.data[0].zzzz).xy;
/*169*/	      r4.zw = (cb1.data[1].xxxy).zw/**/;
/*170*/	      r6.xyzw = (textureLod(g_sam_terrain_surface, r4.xyzx.stp, 0.000000)).xyzw;
/*171*/	      r4.xyzw = (textureLod(g_sam_terrain_surface, r4.xywx.stp, 0.000000)).xyzw;
/*172*/	      r1.x = -r6.x + r4.x;
/*173*/	      r1.x = cb1.data[1].z * r1.x + r6.x;
/*174*/	      r1.x = r1.x * cb1.data[0].y + cb1.data[0].x;
/*175*/	      r2.z = max(r2.z, r1.x);
/*176*/	    }
/*177*/	    r1.xzw = (-r5.xxyz + r2.xxzy).xzw;
/*178*/	    r1.x = dot(vec3(r8.xyzx), vec3(r1.xzwx));
/*179*/	    r1.x = uintBitsToFloat((r8.w < r1.x) ? 0xffffffffu : 0x00000000u);
/*180*/	    color1.xyzw = mix(r2.xzyw, vec4(0, 0, 0, 0), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)));
/*181*/	    color2.xyzw = mix(r0.xyzw, vec4(0, 0, 0, 0), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)));
/*182*/	    r3.w = r1.y;
/*183*/	    r3.xyz = (mix(intBitsToFloat(floatBitsToInt(r3.zywz)), intBitsToFloat(ivec4(ivec4(-1, 0, 0, 0))), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*184*/	    color0.y = r3.z;
/*185*/	  } else {
/*186*/	    color1.xyzw = vec4(0, 0, 0, 0);
/*187*/	    color2.xyzw = vec4(0, 0, 0, 0);
/*188*/	    r3.xy = (intBitsToFloat(ivec4(ivec4(-1, 0, 0, 0)))).xy;
/*189*/	    color0.y = 0;
/*190*/	  }
/*191*/	} else {
/*192*/	  color1.xyzw = r2.xyzw;
/*193*/	  color2.xyzw = r0.xyzw;
/*194*/	  r3.x = intBitsToFloat(int(-1));
/*195*/	  color0.y = r1.y;
/*196*/	}
/*197*/	color0.xz = (floatBitsToInt(r3.xxyx)).xz;
/*198*/	color0.w = 0;
/*199*/	return;
}
