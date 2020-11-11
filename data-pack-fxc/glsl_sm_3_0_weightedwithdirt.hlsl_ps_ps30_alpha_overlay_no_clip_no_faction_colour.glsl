//
//
// Shader Model 4
// Fragment Shader
//
// id: 1648 - fxc/glsl_SM_3_0_weightedwithdirt.hlsl_PS_ps30_alpha_overlay_no_clip_no_faction_colour.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

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
/*5*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r1.w = -r1.w + 1.000000;
/*7*/	r1.w = max(r1.w, 0.000000);
/*8*/	r3.z = sqrt(r1.w);
/*9*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*13*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*14*/	r1.w = r5.w * r6.w;
/*15*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*16*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*17*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*18*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*19*/	r2.x = inversesqrt(r2.x);
/*20*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*21*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*22*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*23*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*24*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*25*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*26*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*27*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*28*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*29*/	r1.w = vsOut_T7.y * -r4.y + r4.y;
/*30*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*31*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*32*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*33*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*34*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*35*/	r2.w = inversesqrt(r2.w);
/*36*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*37*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*38*/	r2.w = inversesqrt(r2.w);
/*39*/	r4.yzw = (r2.wwww * vsOut_T5.xxyz).yzw;
/*40*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*41*/	r2.w = inversesqrt(r2.w);
/*42*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*43*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*44*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*45*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*46*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*47*/	r2.w = inversesqrt(r2.w);
/*48*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*49*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*50*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*51*/	r4.y = inversesqrt(r2.w);
/*52*/	r4.yzw = (r3.xxyz * r4.yyyy).yzw;
/*53*/	r5.x = -r4.x + 1.000000;
/*54*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*55*/	r5.z = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*56*/	r5.z = r5.z + r5.z;
/*57*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.yzwy).xyz;
/*58*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*59*/	r5.z = r5.x * 1.539380;
/*60*/	r5.z = cos((r5.z));
/*61*/	r5.z = inversesqrt(r5.z);
/*62*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*63*/	r5.w = saturate(r1.w * 60.000000);
/*64*/	r5.w = -r1.w + r5.w;
/*65*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*66*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*67*/	r6.w = inversesqrt(r6.w);
/*68*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*69*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*70*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*71*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*72*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*73*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*74*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*75*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*76*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*77*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*78*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*79*/	r6.w = -r1.w + 1.000000;
/*80*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*81*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*82*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*83*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.yzwy));
/*84*/	  r6.w = max(r6.w, 0.000000);
/*85*/	  r6.w = log2(r6.w);
/*86*/	  r6.w = r6.w * 10.000000;
/*87*/	  r6.w = exp2(r6.w);
/*88*/	  r6.w = r5.z * r6.w;
/*89*/	  r6.w = r6.w * r5.w + r1.w;
/*90*/	  r7.y = r5.x * 8.000000;
/*91*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*92*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*93*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*94*/	}
/*95*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*96*/	r2.y = max(r2.x, 0.000000);
/*97*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*98*/	if(floatBitsToUint(r2.x) != 0u) {
/*99*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*100*/	  r2.x = max(r2.x, -1.000000);
/*101*/	  r2.x = min(r2.x, 1.000000);
/*102*/	  r2.z = -abs(r2.x) + 1.000000;
/*103*/	  r2.z = sqrt(r2.z);
/*104*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*105*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*106*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*107*/	  r6.y = r2.z * r6.x;
/*108*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*109*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*110*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*111*/	  r2.x = r6.x * r2.z + r2.x;
/*112*/	  r2.z = r4.x * r4.x;
/*113*/	    r4.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*114*/	  r2.z = r2.z * r4.x + r7.x;
/*115*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*116*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*117*/	  r4.x = -r2.z * r2.z + 1.000000;
/*118*/	  r4.x = max(r4.x, 0.001000);
/*119*/	  r4.x = log2(r4.x);
/*120*/	  r5.y = r4.x * 4.950617;
/*121*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*122*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*123*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*124*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*125*/	  r2.z = floatBitsToInt(r2.z);
/*126*/	  r5.y = r4.x * r4.x + -r5.y;
/*127*/	  r5.y = sqrt(r5.y);
/*128*/	  r4.x = -r4.x + r5.y;
/*129*/	  r4.x = max(r4.x, 0.000000);
/*130*/	  r4.x = sqrt(r4.x);
/*131*/	  r2.z = r2.z * r4.x;
/*132*/	  r2.z = r2.z * 1.414214;
/*133*/	  r2.z = 0.008727 / r2.z;
/*134*/	  r2.z = max(r2.z, 0.000100);
/*135*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*136*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*137*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*138*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*139*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*140*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*141*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*142*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*143*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*144*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*145*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*146*/	  r2.x = floatBitsToInt(r2.x);
/*147*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*148*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*149*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*150*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*151*/	  r2.x = r2.x * r6.x + 1.000000;
/*152*/	  r2.x = r2.x * 0.500000;
/*153*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*154*/	  r2.z = r2.z * r6.y + 1.000000;
/*155*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*156*/	  r2.z = min(r2.y, 1.000000);
/*157*/	  r4.x = r5.x * 1.570796;
/*158*/	  r4.x = sin(r4.x);
/*159*/	  r2.z = r2.z + -1.000000;
/*160*/	  r2.z = r4.x * r2.z + 1.000000;
/*161*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*162*/	  r4.x = max(r4.x, 0.000000);
/*163*/	  r4.x = log2(r4.x);
/*164*/	  r4.x = r4.x * 10.000000;
/*165*/	  r4.x = exp2(r4.x);
/*166*/	  r4.x = r5.z * r4.x;
/*167*/	  r4.x = r4.x * r5.w + r1.w;
/*168*/	  r2.x = r2.z * abs(r2.x);
/*169*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*170*/	} else {
/*171*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*172*/	}
/*173*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*174*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*175*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*176*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*177*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*178*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*179*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*180*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*181*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*182*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*183*/	r1.x = sqrt(r2.w);
/*184*/	r1.y = saturate(cb2.data[0].w)/**/;
/*185*/	r1.y = -r1.y + 1.000000;
/*186*/	r1.y = r1.y * 8.000000 + -4.000000;
/*187*/	r1.z = saturate(cb2.data[1].x)/**/;
/*188*/	r1.z = -r1.z + 1.000000;
/*189*/	r1.z = r1.z * 1000.000000;
/*190*/	r1.x = r1.x / r1.z;
/*191*/	r1.x = r1.x + r1.y;
/*192*/	r1.x = r1.x * 1.442695;
/*193*/	r1.x = exp2(r1.x);
/*194*/	r1.x = cb2.data[1].y / r1.x;
/*195*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*196*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*197*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*198*/	r1.y = r1.y + -cb2.data[1].z;
/*199*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*200*/	r1.y = saturate(r1.z * r1.y);
/*201*/	r1.z = r1.y * -2.000000 + 3.000000;
/*202*/	r1.y = r1.y * r1.y;
/*203*/	r1.y = r1.y * r1.z;
/*204*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*205*/	r1.z = sqrt(r1.z);
/*206*/	r1.w = max(cb2.data[2].z, 0.001000);
/*207*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*208*/	r1.z = r1.w * r1.z;
/*209*/	r1.z = min(r1.z, 1.000000);
/*210*/	r1.w = r1.z * -2.000000 + 3.000000;
/*211*/	r1.z = r1.z * r1.z;
/*212*/	r1.z = r1.z * r1.w;
/*213*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*214*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*215*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*216*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*217*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*218*/	r3.w = max(r3.y, 0.000000);
/*219*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*220*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*221*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*222*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*223*/	r1.x = saturate(r1.x * r1.z);
/*224*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*225*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*226*/	color0.w = r0.w * vsOut_T6.w;
/*227*/	return;
}
