//
//
// Shader Model 4
// Fragment Shader
//
// id: 5758 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirt.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r3.z = sqrt(r0.w);
/*9*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*13*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*14*/	r0.w = r5.w * r6.w;
/*15*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*16*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*17*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*18*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*19*/	r1.w = inversesqrt(r1.w);
/*20*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*21*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*22*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*23*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*24*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*25*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*26*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*27*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*28*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*29*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*30*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*31*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*32*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*33*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*34*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*35*/	r1.w = inversesqrt(r1.w);
/*36*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*37*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*38*/	r1.w = inversesqrt(r1.w);
/*39*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*40*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*41*/	r1.w = inversesqrt(r1.w);
/*42*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*43*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*44*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*45*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*46*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*47*/	r1.w = inversesqrt(r1.w);
/*48*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*49*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*50*/	r3.w = 1.000000;
/*51*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*52*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*53*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*54*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*55*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*56*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*57*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*58*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*59*/	r4.y = intBitsToFloat(int(r2.w));
/*60*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*61*/	if(floatBitsToUint(r4.z) != 0u) {
/*62*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*63*/	  r5.w = vsOut_T0.w;
/*64*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*65*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*66*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*67*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*68*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*69*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*70*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*71*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*72*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*73*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*74*/	  if(floatBitsToUint(r4.w) == 0u) {
/*75*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*76*/	    r7.xy = floor((r6.xyxx).xy);
/*77*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*78*/	    r4.z = -0.000400 / r4.z;
/*79*/	    r4.z = r4.z + r6.z;
/*80*/	    r8.z = -r8.y + 1.000000;
/*81*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*82*/	    r8.w = -r8.y;
/*83*/	    r10.x = cb1.data[0].z/**/;
/*84*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*85*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*86*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*87*/	    r10.w = -cb1.data[0].w/**/;
/*88*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*89*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*90*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*91*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*92*/	    r8.x = r9.x;
/*93*/	    r8.y = r11.x;
/*94*/	    r8.z = r10.x;
/*95*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*96*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*97*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*98*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*99*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*100*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*101*/	    r4.z = -r6.x + r6.y;
/*102*/	    r4.z = r4.w * r4.z + r6.x;
/*103*/	  } else {
/*104*/	    r4.z = 1.000000;
/*105*/	  }
/*106*/	} else {
/*107*/	  r4.z = 1.000000;
/*108*/	}
/*109*/	r4.w = cb1.data[34].w + -1.000000;
/*110*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*111*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*112*/	if(floatBitsToUint(r2.w) == 0u) {
/*113*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*114*/	  r2.w = floatBitsToInt(r2.w);
/*115*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*116*/	  if(floatBitsToUint(r2.w) != 0u) {
/*117*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*118*/	    r5.w = vsOut_T0.w;
/*119*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*120*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*121*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*122*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*123*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*124*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*125*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*126*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*127*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*128*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*129*/	    if(floatBitsToUint(r5.w) == 0u) {
/*130*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*131*/	      r6.xy = floor((r5.xyxx).xy);
/*132*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*133*/	      r2.w = -0.000400 / r2.w;
/*134*/	      r2.w = r2.w + r5.z;
/*135*/	      r7.z = -r7.y + 1.000000;
/*136*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*137*/	      r7.w = -r7.y;
/*138*/	      r9.x = cb1.data[0].z/**/;
/*139*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*140*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*141*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*142*/	      r9.w = -cb1.data[0].w/**/;
/*143*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*144*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*145*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*146*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*147*/	      r7.x = r8.x;
/*148*/	      r7.y = r10.x;
/*149*/	      r7.z = r9.x;
/*150*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*151*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*152*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*153*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*154*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*155*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*156*/	      r2.w = -r5.x + r5.z;
/*157*/	      r2.w = r5.y * r2.w + r5.x;
/*158*/	    } else {
/*159*/	      r2.w = 1.000000;
/*160*/	    }
/*161*/	  } else {
/*162*/	    r2.w = 1.000000;
/*163*/	  }
/*164*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*165*/	  r5.y = r5.x * cb1.data[34].x;
/*166*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*167*/	  r5.x = r1.w + -r5.x;
/*168*/	  r5.x = saturate(r5.x / r5.y);
/*169*/	  r2.w = -r4.z + r2.w;
/*170*/	  r4.z = r5.x * r2.w + r4.z;
/*171*/	}
/*172*/	if(floatBitsToUint(r4.w) != 0u) {
/*173*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*174*/	  r4.w = r2.w * cb1.data[34].y;
/*175*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*176*/	  r2.w = r1.w + -r2.w;
/*177*/	  r2.w = saturate(r2.w / r4.w);
/*178*/	  r4.y = -r4.z + 1.000000;
/*179*/	  r4.z = r2.w * r4.y + r4.z;
/*180*/	}
/*181*/	r4.z = saturate(r4.z);
/*182*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*183*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*184*/	r2.w = inversesqrt(r2.w);
/*185*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*186*/	r2.w = -r4.x + 1.000000;
/*187*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*188*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*189*/	r4.w = r4.w + r4.w;
/*190*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*191*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*192*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*193*/	r4.w = cos((r8.x));
/*194*/	r4.w = inversesqrt(r4.w);
/*195*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*196*/	r5.w = saturate(r0.w * 60.000000);
/*197*/	r5.w = -r0.w + r5.w;
/*198*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*199*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*200*/	r6.w = inversesqrt(r6.w);
/*201*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*202*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*203*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*204*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*205*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*206*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*207*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*208*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*209*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*210*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*211*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*212*/	r6.w = -r0.w + 1.000000;
/*213*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*214*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*215*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*216*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*217*/	  r6.w = max(r6.w, 0.000000);
/*218*/	  r6.w = log2(r6.w);
/*219*/	  r6.w = r6.w * 10.000000;
/*220*/	  r6.w = exp2(r6.w);
/*221*/	  r6.w = r4.w * r6.w;
/*222*/	  r6.w = r6.w * r5.w + r0.w;
/*223*/	  r7.y = r2.w * 8.000000;
/*224*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*225*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*226*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*227*/	}
/*228*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*229*/	r7.y = max(r6.w, 0.000000);
/*230*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*231*/	if(floatBitsToUint(r6.w) != 0u) {
/*232*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*233*/	  r6.x = max(r6.x, -1.000000);
/*234*/	  r6.x = min(r6.x, 1.000000);
/*235*/	  r6.y = -abs(r6.x) + 1.000000;
/*236*/	  r6.y = sqrt(r6.y);
/*237*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*238*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*239*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*240*/	  r6.w = r6.y * r6.z;
/*241*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*242*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*243*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*244*/	  r6.x = r6.z * r6.y + r6.x;
/*245*/	  r4.x = r4.x * r4.x;
/*246*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*247*/	  r4.x = r4.x * r4.y + r7.x;
/*248*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*249*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*250*/	  r4.y = -r4.x * r4.x + 1.000000;
/*251*/	  r4.y = max(r4.y, 0.001000);
/*252*/	  r4.y = log2(r4.y);
/*253*/	  r6.y = r4.y * 4.950617;
/*254*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*255*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*256*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*257*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*258*/	  r4.x = floatBitsToInt(r4.x);
/*259*/	  r6.y = r4.y * r4.y + -r6.y;
/*260*/	  r6.y = sqrt(r6.y);
/*261*/	  r4.y = -r4.y + r6.y;
/*262*/	  r4.y = max(r4.y, 0.000000);
/*263*/	  r4.y = sqrt(r4.y);
/*264*/	  r4.x = r4.y * r4.x;
/*265*/	  r4.x = r4.x * 1.414214;
/*266*/	  r4.x = 0.008727 / r4.x;
/*267*/	  r4.x = max(r4.x, 0.000100);
/*268*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*269*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*270*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*271*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*272*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*273*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*274*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*275*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*276*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*277*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*278*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*279*/	  r4.x = floatBitsToInt(r4.x);
/*280*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*281*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*282*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*283*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*284*/	  r4.x = r4.x * r6.x + 1.000000;
/*285*/	  r4.x = r4.x * 0.500000;
/*286*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*287*/	  r4.y = r4.y * r6.y + 1.000000;
/*288*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*289*/	  r4.y = min(r7.y, 1.000000);
/*290*/	  r2.w = r2.w * 1.570796;
/*291*/	  r2.w = sin(r2.w);
/*292*/	  r4.y = r4.y + -1.000000;
/*293*/	  r2.w = r2.w * r4.y + 1.000000;
/*294*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*295*/	  r4.y = max(r4.y, 0.000000);
/*296*/	  r4.y = log2(r4.y);
/*297*/	  r4.y = r4.y * 10.000000;
/*298*/	  r4.y = exp2(r4.y);
/*299*/	  r4.y = r4.w * r4.y;
/*300*/	  r4.y = r4.y * r5.w + r0.w;
/*301*/	  r2.w = r2.w * abs(r4.x);
/*302*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*303*/	} else {
/*304*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*305*/	}
/*306*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*307*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*308*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*309*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*310*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*311*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*312*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*313*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*314*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*315*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*316*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*317*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*318*/	r2.w = inversesqrt(r2.w);
/*319*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*320*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*321*/	r2.w = r2.w + r2.w;
/*322*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*323*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*324*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*325*/	r2.x = max(r2.x, 0.000000);
/*326*/	r2.x = log2(r2.x);
/*327*/	r2.x = r2.x * 10.000000;
/*328*/	r2.x = exp2(r2.x);
/*329*/	r2.x = r4.w * r2.x;
/*330*/	r0.w = r2.x * r5.w + r0.w;
/*331*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*332*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*333*/	color0.w = 2.000000;
/*334*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*335*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*336*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*337*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*338*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*339*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*340*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*341*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*342*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*343*/	if(r0.x != 0) discard;
/*344*/	color1.x = 1.000000;
/*345*/	return;
}
