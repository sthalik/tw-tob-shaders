//
//
// Shader Model 4
// Fragment Shader
//
// id: 5756 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirt.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shadowmap_PS
{
  vec4 data[45];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;

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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r0.w = -r0.w + 1.000000;
/*10*/	r0.w = max(r0.w, 0.000000);
/*11*/	r3.z = sqrt(r0.w);
/*12*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*16*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*17*/	r0.w = r5.w * r6.w;
/*18*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*19*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*20*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*21*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*22*/	r1.w = inversesqrt(r1.w);
/*23*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*24*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*25*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*26*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*27*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*28*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*29*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*30*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*31*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*32*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*33*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*34*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*35*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*36*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*37*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*38*/	r1.w = inversesqrt(r1.w);
/*39*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*40*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*41*/	r1.w = inversesqrt(r1.w);
/*42*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*43*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*44*/	r1.w = inversesqrt(r1.w);
/*45*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*46*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*47*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*48*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*49*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*50*/	r1.w = inversesqrt(r1.w);
/*51*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*52*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*53*/	r3.w = 1.000000;
/*54*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*55*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*56*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*57*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*58*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*59*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*60*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*61*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*62*/	r4.y = intBitsToFloat(int(r2.w));
/*63*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*64*/	if(floatBitsToUint(r4.z) != 0u) {
/*65*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*66*/	  r5.w = vsOut_T0.w;
/*67*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*68*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*69*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*70*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*71*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*72*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*73*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*74*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*75*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*76*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*77*/	  if(floatBitsToUint(r4.w) == 0u) {
/*78*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*79*/	    r7.xy = floor((r6.xyxx).xy);
/*80*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*81*/	    r4.z = -0.000400 / r4.z;
/*82*/	    r4.z = r4.z + r6.z;
/*83*/	    r8.z = -r8.y + 1.000000;
/*84*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*85*/	    r8.w = -r8.y;
/*86*/	    r10.x = cb1.data[0].z/**/;
/*87*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*88*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*89*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*90*/	    r10.w = -cb1.data[0].w/**/;
/*91*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*92*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*93*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*94*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*95*/	    r8.x = r9.x;
/*96*/	    r8.y = r11.x;
/*97*/	    r8.z = r10.x;
/*98*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*99*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*100*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*101*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*102*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*103*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*104*/	    r4.z = -r6.x + r6.y;
/*105*/	    r4.z = r4.w * r4.z + r6.x;
/*106*/	  } else {
/*107*/	    r4.z = 1.000000;
/*108*/	  }
/*109*/	} else {
/*110*/	  r4.z = 1.000000;
/*111*/	}
/*112*/	r4.w = cb1.data[34].w + -1.000000;
/*113*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*114*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*115*/	if(floatBitsToUint(r2.w) == 0u) {
/*116*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*117*/	  r2.w = floatBitsToInt(r2.w);
/*118*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*119*/	  if(floatBitsToUint(r2.w) != 0u) {
/*120*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*121*/	    r5.w = vsOut_T0.w;
/*122*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*123*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*124*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*125*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*126*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*127*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*128*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*129*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*130*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*131*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*132*/	    if(floatBitsToUint(r5.w) == 0u) {
/*133*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*134*/	      r6.xy = floor((r5.xyxx).xy);
/*135*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*136*/	      r2.w = -0.000400 / r2.w;
/*137*/	      r2.w = r2.w + r5.z;
/*138*/	      r7.z = -r7.y + 1.000000;
/*139*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*140*/	      r7.w = -r7.y;
/*141*/	      r9.x = cb1.data[0].z/**/;
/*142*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*143*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*144*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*145*/	      r9.w = -cb1.data[0].w/**/;
/*146*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*147*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*148*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*149*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*150*/	      r7.x = r8.x;
/*151*/	      r7.y = r10.x;
/*152*/	      r7.z = r9.x;
/*153*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*154*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*155*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*156*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*157*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*158*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*159*/	      r2.w = -r5.x + r5.z;
/*160*/	      r2.w = r5.y * r2.w + r5.x;
/*161*/	    } else {
/*162*/	      r2.w = 1.000000;
/*163*/	    }
/*164*/	  } else {
/*165*/	    r2.w = 1.000000;
/*166*/	  }
/*167*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*168*/	  r5.y = r5.x * cb1.data[34].x;
/*169*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*170*/	  r5.x = r1.w + -r5.x;
/*171*/	  r5.x = saturate(r5.x / r5.y);
/*172*/	  r2.w = -r4.z + r2.w;
/*173*/	  r4.z = r5.x * r2.w + r4.z;
/*174*/	}
/*175*/	if(floatBitsToUint(r4.w) != 0u) {
/*176*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*177*/	  r4.w = r2.w * cb1.data[34].y;
/*178*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*179*/	  r2.w = r1.w + -r2.w;
/*180*/	  r2.w = saturate(r2.w / r4.w);
/*181*/	  r4.y = -r4.z + 1.000000;
/*182*/	  r4.z = r2.w * r4.y + r4.z;
/*183*/	}
/*184*/	r4.z = saturate(r4.z);
/*185*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*186*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*187*/	r2.w = inversesqrt(r2.w);
/*188*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*189*/	r2.w = -r4.x + 1.000000;
/*190*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*191*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*192*/	r4.w = r4.w + r4.w;
/*193*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*194*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*195*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*196*/	r4.w = cos((r8.x));
/*197*/	r4.w = inversesqrt(r4.w);
/*198*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*199*/	r5.w = saturate(r0.w * 60.000000);
/*200*/	r5.w = -r0.w + r5.w;
/*201*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*202*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*203*/	r6.w = inversesqrt(r6.w);
/*204*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*205*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*206*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*207*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*208*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*209*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*210*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*211*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*212*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*213*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*214*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*215*/	r6.w = -r0.w + 1.000000;
/*216*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*217*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*218*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*219*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*220*/	  r6.w = max(r6.w, 0.000000);
/*221*/	  r6.w = log2(r6.w);
/*222*/	  r6.w = r6.w * 10.000000;
/*223*/	  r6.w = exp2(r6.w);
/*224*/	  r6.w = r4.w * r6.w;
/*225*/	  r6.w = r6.w * r5.w + r0.w;
/*226*/	  r7.y = r2.w * 8.000000;
/*227*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*228*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*229*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*230*/	}
/*231*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*232*/	r7.y = max(r6.w, 0.000000);
/*233*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*234*/	if(floatBitsToUint(r6.w) != 0u) {
/*235*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*236*/	  r6.x = max(r6.x, -1.000000);
/*237*/	  r6.x = min(r6.x, 1.000000);
/*238*/	  r6.y = -abs(r6.x) + 1.000000;
/*239*/	  r6.y = sqrt(r6.y);
/*240*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*241*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*242*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*243*/	  r6.w = r6.y * r6.z;
/*244*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*245*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*246*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*247*/	  r6.x = r6.z * r6.y + r6.x;
/*248*/	  r4.x = r4.x * r4.x;
/*249*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*250*/	  r4.x = r4.x * r4.y + r7.x;
/*251*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*252*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*253*/	  r4.y = -r4.x * r4.x + 1.000000;
/*254*/	  r4.y = max(r4.y, 0.001000);
/*255*/	  r4.y = log2(r4.y);
/*256*/	  r6.y = r4.y * 4.950617;
/*257*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*258*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*259*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*260*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*261*/	  r4.x = floatBitsToInt(r4.x);
/*262*/	  r6.y = r4.y * r4.y + -r6.y;
/*263*/	  r6.y = sqrt(r6.y);
/*264*/	  r4.y = -r4.y + r6.y;
/*265*/	  r4.y = max(r4.y, 0.000000);
/*266*/	  r4.y = sqrt(r4.y);
/*267*/	  r4.x = r4.y * r4.x;
/*268*/	  r4.x = r4.x * 1.414214;
/*269*/	  r4.x = 0.008727 / r4.x;
/*270*/	  r4.x = max(r4.x, 0.000100);
/*271*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*272*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*273*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*274*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*275*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*276*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*277*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*278*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*279*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*280*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*281*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*282*/	  r4.x = floatBitsToInt(r4.x);
/*283*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*284*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*285*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*286*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*287*/	  r4.x = r4.x * r6.x + 1.000000;
/*288*/	  r4.x = r4.x * 0.500000;
/*289*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*290*/	  r4.y = r4.y * r6.y + 1.000000;
/*291*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*292*/	  r4.y = min(r7.y, 1.000000);
/*293*/	  r2.w = r2.w * 1.570796;
/*294*/	  r2.w = sin(r2.w);
/*295*/	  r4.y = r4.y + -1.000000;
/*296*/	  r2.w = r2.w * r4.y + 1.000000;
/*297*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*298*/	  r4.y = max(r4.y, 0.000000);
/*299*/	  r4.y = log2(r4.y);
/*300*/	  r4.y = r4.y * 10.000000;
/*301*/	  r4.y = exp2(r4.y);
/*302*/	  r4.y = r4.w * r4.y;
/*303*/	  r4.y = r4.y * r5.w + r0.w;
/*304*/	  r2.w = r2.w * abs(r4.x);
/*305*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*306*/	} else {
/*307*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*308*/	}
/*309*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*310*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*311*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*312*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*313*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*314*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*315*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*316*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*317*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*318*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*319*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*320*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*321*/	r2.w = inversesqrt(r2.w);
/*322*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*323*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*324*/	r2.w = r2.w + r2.w;
/*325*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*326*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*327*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*328*/	r2.x = max(r2.x, 0.000000);
/*329*/	r2.x = log2(r2.x);
/*330*/	r2.x = r2.x * 10.000000;
/*331*/	r2.x = exp2(r2.x);
/*332*/	r2.x = r4.w * r2.x;
/*333*/	r0.w = r2.x * r5.w + r0.w;
/*334*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*335*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*336*/	color0.w = 2.000000;
/*337*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*338*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*339*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*340*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*341*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*342*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*343*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*344*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*345*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*346*/	if(r0.x != 0) discard;
/*347*/	color1.x = 1.000000;
/*348*/	return;
}
