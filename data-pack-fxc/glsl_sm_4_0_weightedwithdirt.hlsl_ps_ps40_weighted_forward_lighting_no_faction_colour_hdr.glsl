//
//
// Shader Model 4
// Fragment Shader
//
// id: 1693 - fxc/glsl_SM_4_0_weightedwithdirt.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
uniform samplerCube s_environment;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
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
/*14*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
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
/*52*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*53*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*56*/	r1.w = -r4.x + 1.000000;
/*57*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*58*/	r3.w = dot(vec3(r3.xyzx), vec3(r2.xyzx));
/*59*/	r3.w = r3.w + r3.w;
/*60*/	r4.yzw = (r2.xxyz * -r3.wwww + r3.xxyz).yzw;
/*61*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*62*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*63*/	r3.w = cos((r6.x));
/*64*/	r3.w = inversesqrt(r3.w);
/*65*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*66*/	r5.w = saturate(r0.w * 60.000000);
/*67*/	r5.w = -r0.w + r5.w;
/*68*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*69*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*70*/	r7.x = inversesqrt(r7.x);
/*71*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*72*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*73*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*74*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*75*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*76*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*77*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*78*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*79*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*80*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*81*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*82*/	r5.y = -r0.w + 1.000000;
/*83*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*84*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*85*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*86*/	  r5.y = dot(vec3(r4.yzwy), vec3(r3.xyzx));
/*87*/	  r5.y = max(r5.y, 0.000000);
/*88*/	  r5.y = log2(r5.y);
/*89*/	  r5.y = r5.y * 10.000000;
/*90*/	  r5.y = exp2(r5.y);
/*91*/	  r5.y = r3.w * r5.y;
/*92*/	  r5.y = r5.y * r5.w + r0.w;
/*93*/	  r7.x = r1.w * 8.000000;
/*94*/	  r7.xyzw = (textureLod(s_environment, r4.yzwy.stp, r7.x)).xyzw;
/*95*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*96*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*97*/	}
/*98*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*99*/	r7.x = max(r5.y, 0.000000);
/*100*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*101*/	if(floatBitsToUint(r5.y) != 0u) {
/*102*/	  r4.y = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*103*/	  r4.y = max(r4.y, -1.000000);
/*104*/	  r4.y = min(r4.y, 1.000000);
/*105*/	  r4.z = -abs(r4.y) + 1.000000;
/*106*/	  r4.z = sqrt(r4.z);
/*107*/	  r4.w = abs(r4.y) * -0.018729 + 0.074261;
/*108*/	  r4.w = r4.w * abs(r4.y) + -0.212114;
/*109*/	  r4.w = r4.w * abs(r4.y) + 1.570729;
/*110*/	  r5.y = r4.z * r4.w;
/*111*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*112*/	  r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*113*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.y));
/*114*/	  r4.y = r4.w * r4.z + r4.y;
/*115*/	  r4.x = r4.x * r4.x;
/*116*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*117*/	  r2.w = r4.x * r2.w + r5.x;
/*118*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*119*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*120*/	  r4.x = -r2.w * r2.w + 1.000000;
/*121*/	  r4.x = max(r4.x, 0.001000);
/*122*/	  r4.x = log2(r4.x);
/*123*/	  r4.z = r4.x * 4.950617;
/*124*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*125*/	  r4.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*126*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*127*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.w) + floatBitsToInt(r2.w));
/*128*/	  r2.w = floatBitsToInt(r2.w);
/*129*/	  r4.z = r4.x * r4.x + -r4.z;
/*130*/	  r4.z = sqrt(r4.z);
/*131*/	  r4.x = -r4.x + r4.z;
/*132*/	  r4.x = max(r4.x, 0.000000);
/*133*/	  r4.x = sqrt(r4.x);
/*134*/	  r2.w = r2.w * r4.x;
/*135*/	  r2.w = r2.w * 1.414214;
/*136*/	  r2.w = 0.008727 / r2.w;
/*137*/	  r2.w = max(r2.w, 0.000100);
/*138*/	  r4.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*139*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*140*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*141*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*142*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*143*/	  r8.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*144*/	  r7.yz = (r8.xxzx / r8.yywy).yz;
/*145*/	  r4.zw = (-r4.zzzw * r7.yyyz).zw;
/*146*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*147*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*148*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r7.y) + floatBitsToInt(r2.w));
/*149*/	  r2.w = floatBitsToInt(r2.w);
/*150*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*151*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*152*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*153*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*154*/	  r2.w = r2.w * r4.x + 1.000000;
/*155*/	  r2.w = r2.w * 0.500000;
/*156*/	  r4.x = 1 + ~floatBitsToInt(r7.z);
/*157*/	  r4.x = r4.x * r4.y + 1.000000;
/*158*/	  r2.w = r4.x * 0.500000 + -r2.w;
/*159*/	  r4.x = min(r7.x, 1.000000);
/*160*/	  r1.w = r1.w * 1.570796;
/*161*/	  r1.w = sin(r1.w);
/*162*/	  r4.x = r4.x + -1.000000;
/*163*/	  r1.w = r1.w * r4.x + 1.000000;
/*164*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*165*/	  r3.x = max(r3.x, 0.000000);
/*166*/	  r3.x = log2(r3.x);
/*167*/	  r3.x = r3.x * 10.000000;
/*168*/	  r3.x = exp2(r3.x);
/*169*/	  r3.x = r3.w * r3.x;
/*170*/	  r3.x = r3.x * r5.w + r0.w;
/*171*/	  r1.w = r1.w * abs(r2.w);
/*172*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*173*/	} else {
/*174*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*175*/	}
/*176*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*177*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*178*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*179*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*180*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*181*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*182*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*183*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*184*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*185*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*186*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*187*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*188*/	r1.w = inversesqrt(r1.w);
/*189*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*190*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*191*/	r1.w = r1.w + r1.w;
/*192*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*193*/	r4.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*194*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*195*/	r1.w = max(r1.w, 0.000000);
/*196*/	r1.w = log2(r1.w);
/*197*/	r1.w = r1.w * 10.000000;
/*198*/	r1.w = exp2(r1.w);
/*199*/	r1.w = r3.w * r1.w;
/*200*/	r0.w = r1.w * r5.w + r0.w;
/*201*/	r2.xyz = (r4.xyzx * r0.wwww).xyz;
/*202*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*203*/	color0.w = 2.000000;
/*204*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*205*/	r0.w = 1.000000;
/*206*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*207*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*208*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*209*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*210*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*211*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*212*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*213*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*214*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*215*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*216*/	if(r0.x != 0) discard;
/*217*/	color1.x = 1.000000;
/*218*/	return;
}
