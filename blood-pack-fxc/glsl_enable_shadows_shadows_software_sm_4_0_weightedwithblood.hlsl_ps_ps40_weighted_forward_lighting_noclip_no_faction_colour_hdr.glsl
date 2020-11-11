//
//
// Shader Model 4
// Fragment Shader
//
// id: 6672 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithblood.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_blood_map;
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r0.w = sqrt(r0.w);
/*8*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*9*/	if(r1.z != 0) discard;
/*10*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*11*/	r1.zw = (r1.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*13*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*14*/	r1.z = saturate(-r1.z + r2.w);
/*15*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*16*/	if(floatBitsToUint(r1.z) != 0u) {
/*17*/	  r1.z = -r2.w + 1.000000;
/*18*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*19*/	  r1.z = -r1.z + 1.000000;
/*20*/	  r1.z = -r1.z * r1.z + 1.000000;
/*21*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*22*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*23*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*24*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*25*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*26*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*27*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*28*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*29*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*30*/	} else {
/*31*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*32*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*33*/	}
/*34*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*36*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*37*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*39*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*40*/	r1.z = vsOut_T7.y * -r3.y + r3.y;
/*41*/	r1.z = vsOut_T7.x * -r1.z + r1.z;
/*42*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*43*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*44*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*45*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*46*/	r1.w = inversesqrt(r1.w);
/*47*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*48*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*51*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*54*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*55*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*56*/	r1.xyw = (r0.wwww * r5.xyxz + r1.xyxw).xyw;
/*57*/	r0.w = dot(vec3(r1.xywx), vec3(r1.xywx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r1.xyw = (r0.wwww * r1.xyxw).xyw;
/*60*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*61*/	r4.w = 1.000000;
/*62*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*63*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*64*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*65*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*66*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*67*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*68*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*69*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*70*/	r3.y = intBitsToFloat(int(r2.w));
/*71*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*72*/	if(floatBitsToUint(r3.z) != 0u) {
/*73*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*74*/	  r5.w = vsOut_T0.w;
/*75*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*76*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*77*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*78*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*79*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*80*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*81*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*82*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*83*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*84*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*85*/	  if(floatBitsToUint(r3.w) == 0u) {
/*86*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*87*/	    r7.xy = floor((r6.xyxx).xy);
/*88*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*89*/	    r3.z = -0.000400 / r3.z;
/*90*/	    r3.z = r3.z + r6.z;
/*91*/	    r8.z = -r8.y + 1.000000;
/*92*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*93*/	    r8.w = -r8.y;
/*94*/	    r10.x = cb1.data[0].z/**/;
/*95*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*96*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*97*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*98*/	    r10.w = -cb1.data[0].w/**/;
/*99*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*100*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*101*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*102*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*103*/	    r8.x = r9.x;
/*104*/	    r8.y = r11.x;
/*105*/	    r8.z = r10.x;
/*106*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*107*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*108*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*109*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*110*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*111*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*112*/	    r3.z = -r6.x + r6.y;
/*113*/	    r3.z = r3.w * r3.z + r6.x;
/*114*/	  } else {
/*115*/	    r3.z = 1.000000;
/*116*/	  }
/*117*/	} else {
/*118*/	  r3.z = 1.000000;
/*119*/	}
/*120*/	r3.w = cb1.data[34].w + -1.000000;
/*121*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*122*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*123*/	if(floatBitsToUint(r2.w) == 0u) {
/*124*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*125*/	  r2.w = floatBitsToInt(r2.w);
/*126*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*127*/	  if(floatBitsToUint(r2.w) != 0u) {
/*128*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*129*/	    r5.w = vsOut_T0.w;
/*130*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*131*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*132*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*133*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*134*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*135*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*136*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*137*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*138*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*139*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*140*/	    if(floatBitsToUint(r5.w) == 0u) {
/*141*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*142*/	      r6.xy = floor((r5.xyxx).xy);
/*143*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*144*/	      r2.w = -0.000400 / r2.w;
/*145*/	      r2.w = r2.w + r5.z;
/*146*/	      r7.z = -r7.y + 1.000000;
/*147*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*148*/	      r7.w = -r7.y;
/*149*/	      r9.x = cb1.data[0].z/**/;
/*150*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*151*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*152*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*153*/	      r9.w = -cb1.data[0].w/**/;
/*154*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*155*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*156*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*157*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*158*/	      r7.x = r8.x;
/*159*/	      r7.y = r10.x;
/*160*/	      r7.z = r9.x;
/*161*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*162*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*163*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*164*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*165*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*166*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*167*/	      r2.w = -r5.x + r5.z;
/*168*/	      r2.w = r5.y * r2.w + r5.x;
/*169*/	    } else {
/*170*/	      r2.w = 1.000000;
/*171*/	    }
/*172*/	  } else {
/*173*/	    r2.w = 1.000000;
/*174*/	  }
/*175*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*176*/	  r5.y = r5.x * cb1.data[34].x;
/*177*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*178*/	  r5.x = r0.w + -r5.x;
/*179*/	  r5.x = saturate(r5.x / r5.y);
/*180*/	  r2.w = -r3.z + r2.w;
/*181*/	  r3.z = r5.x * r2.w + r3.z;
/*182*/	}
/*183*/	if(floatBitsToUint(r3.w) != 0u) {
/*184*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*185*/	  r3.w = r2.w * cb1.data[34].y;
/*186*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*187*/	  r2.w = r0.w + -r2.w;
/*188*/	  r2.w = saturate(r2.w / r3.w);
/*189*/	  r3.y = -r3.z + 1.000000;
/*190*/	  r3.z = r2.w * r3.y + r3.z;
/*191*/	}
/*192*/	r3.z = saturate(r3.z);
/*193*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*194*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*195*/	r2.w = inversesqrt(r2.w);
/*196*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*197*/	r2.w = -r3.x + 1.000000;
/*198*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*199*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xywx));
/*200*/	r3.w = r3.w + r3.w;
/*201*/	r6.xyz = (r1.xywx * -r3.wwww + r5.xyzx).xyz;
/*202*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*203*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*204*/	r3.w = cos((r8.x));
/*205*/	r3.w = inversesqrt(r3.w);
/*206*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*207*/	r5.w = saturate(r1.z * 60.000000);
/*208*/	r5.w = -r1.z + r5.w;
/*209*/	r8.xzw = (r1.xxyw * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*210*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*211*/	r6.w = inversesqrt(r6.w);
/*212*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*213*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*214*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*215*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*216*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*217*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*218*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*219*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*220*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*221*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*222*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*223*/	r6.w = -r1.z + 1.000000;
/*224*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*225*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*226*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*227*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*228*/	  r6.w = max(r6.w, 0.000000);
/*229*/	  r6.w = log2(r6.w);
/*230*/	  r6.w = r6.w * 10.000000;
/*231*/	  r6.w = exp2(r6.w);
/*232*/	  r6.w = r3.w * r6.w;
/*233*/	  r6.w = r6.w * r5.w + r1.z;
/*234*/	  r7.y = r2.w * 8.000000;
/*235*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*236*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*237*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*238*/	}
/*239*/	r6.w = dot(vec3(r1.xywx), vec3(-cb2.data[0].yzwy));
/*240*/	r7.y = max(r6.w, 0.000000);
/*241*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*242*/	if(floatBitsToUint(r6.w) != 0u) {
/*243*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*244*/	  r6.x = max(r6.x, -1.000000);
/*245*/	  r6.x = min(r6.x, 1.000000);
/*246*/	  r6.y = -abs(r6.x) + 1.000000;
/*247*/	  r6.y = sqrt(r6.y);
/*248*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*249*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*250*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*251*/	  r6.w = r6.y * r6.z;
/*252*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*253*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*254*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*255*/	  r6.x = r6.z * r6.y + r6.x;
/*256*/	  r3.x = r3.x * r3.x;
/*257*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*258*/	  r3.x = r3.x * r3.y + r7.x;
/*259*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*260*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*261*/	  r3.y = -r3.x * r3.x + 1.000000;
/*262*/	  r3.y = max(r3.y, 0.001000);
/*263*/	  r3.y = log2(r3.y);
/*264*/	  r6.y = r3.y * 4.950617;
/*265*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*266*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*267*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*268*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*269*/	  r3.x = floatBitsToInt(r3.x);
/*270*/	  r6.y = r3.y * r3.y + -r6.y;
/*271*/	  r6.y = sqrt(r6.y);
/*272*/	  r3.y = -r3.y + r6.y;
/*273*/	  r3.y = max(r3.y, 0.000000);
/*274*/	  r3.y = sqrt(r3.y);
/*275*/	  r3.x = r3.y * r3.x;
/*276*/	  r3.x = r3.x * 1.414214;
/*277*/	  r3.x = 0.008727 / r3.x;
/*278*/	  r3.x = max(r3.x, 0.000100);
/*279*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*280*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*281*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*282*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*283*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*284*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*285*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*286*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*287*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*288*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*289*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*290*/	  r3.x = floatBitsToInt(r3.x);
/*291*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*292*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*293*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*294*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*295*/	  r3.x = r3.x * r6.x + 1.000000;
/*296*/	  r3.x = r3.x * 0.500000;
/*297*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*298*/	  r3.y = r3.y * r6.y + 1.000000;
/*299*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*300*/	  r3.y = min(r7.y, 1.000000);
/*301*/	  r2.w = r2.w * 1.570796;
/*302*/	  r2.w = sin(r2.w);
/*303*/	  r3.y = r3.y + -1.000000;
/*304*/	  r2.w = r2.w * r3.y + 1.000000;
/*305*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*306*/	  r3.y = max(r3.y, 0.000000);
/*307*/	  r3.y = log2(r3.y);
/*308*/	  r3.y = r3.y * 10.000000;
/*309*/	  r3.y = exp2(r3.y);
/*310*/	  r3.y = r3.w * r3.y;
/*311*/	  r3.y = r3.y * r5.w + r1.z;
/*312*/	  r2.w = r2.w * abs(r3.x);
/*313*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*314*/	} else {
/*315*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*316*/	}
/*317*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*318*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*319*/	r5.xyz = (max(r1.zzzz, r5.xyzx)).xyz;
/*320*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*321*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*322*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*323*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*324*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*325*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*326*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*327*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*328*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*329*/	r2.w = inversesqrt(r2.w);
/*330*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*331*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xywx));
/*332*/	r2.w = r2.w + r2.w;
/*333*/	r1.xyw = (r1.xyxw * -r2.wwww + -r3.xyxz).xyw;
/*334*/	r6.xyzw = (textureLod(s_environment, r1.xywx.stp, r8.y)).xyzw;
/*335*/	r1.x = dot(vec3(r1.xywx), vec3(-r3.xyzx));
/*336*/	r1.x = max(r1.x, 0.000000);
/*337*/	r1.x = log2(r1.x);
/*338*/	r1.x = r1.x * 10.000000;
/*339*/	r1.x = exp2(r1.x);
/*340*/	r1.x = r3.w * r1.x;
/*341*/	r1.x = r1.x * r5.w + r1.z;
/*342*/	r1.xyz = (r6.xyzx * r1.xxxx).xyz;
/*343*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*344*/	color0.w = 2.000000;
/*345*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*346*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*347*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*348*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*349*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*350*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*351*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*352*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*353*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*354*/	if(r0.x != 0) discard;
/*355*/	color1.x = 1.000000;
/*356*/	return;
}
