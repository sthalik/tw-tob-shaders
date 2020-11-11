//
//
// Shader Model 4
// Fragment Shader
//
// id: 1646 - fxc/glsl_SM_3_0_weightedwithdirt.hlsl_PS_ps30_alpha_overlay_no_faction_colour.glsl
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
/*2*/	r1.w = r0.w + -0.501961;
/*3*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r1.w = -r1.w + 1.000000;
/*10*/	r1.w = max(r1.w, 0.000000);
/*11*/	r3.z = sqrt(r1.w);
/*12*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*16*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*17*/	r1.w = r5.w * r6.w;
/*18*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*19*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*20*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*21*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*22*/	r2.x = inversesqrt(r2.x);
/*23*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*24*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*25*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*26*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*27*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*28*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*29*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*30*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*31*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*32*/	r1.w = vsOut_T7.y * -r4.y + r4.y;
/*33*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*34*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*35*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*36*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*37*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*38*/	r2.w = inversesqrt(r2.w);
/*39*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*40*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*41*/	r2.w = inversesqrt(r2.w);
/*42*/	r4.yzw = (r2.wwww * vsOut_T5.xxyz).yzw;
/*43*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*44*/	r2.w = inversesqrt(r2.w);
/*45*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*46*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*47*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*48*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*49*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*50*/	r2.w = inversesqrt(r2.w);
/*51*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*52*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*53*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*54*/	r4.y = inversesqrt(r2.w);
/*55*/	r4.yzw = (r3.xxyz * r4.yyyy).yzw;
/*56*/	r5.x = -r4.x + 1.000000;
/*57*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*58*/	r5.z = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*59*/	r5.z = r5.z + r5.z;
/*60*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.yzwy).xyz;
/*61*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*62*/	r5.z = r5.x * 1.539380;
/*63*/	r5.z = cos((r5.z));
/*64*/	r5.z = inversesqrt(r5.z);
/*65*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*66*/	r5.w = saturate(r1.w * 60.000000);
/*67*/	r5.w = -r1.w + r5.w;
/*68*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*69*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*70*/	r6.w = inversesqrt(r6.w);
/*71*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*72*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*73*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*74*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*75*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*76*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*77*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*78*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*79*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*80*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*81*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*82*/	r6.w = -r1.w + 1.000000;
/*83*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*84*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*85*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*86*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.yzwy));
/*87*/	  r6.w = max(r6.w, 0.000000);
/*88*/	  r6.w = log2(r6.w);
/*89*/	  r6.w = r6.w * 10.000000;
/*90*/	  r6.w = exp2(r6.w);
/*91*/	  r6.w = r5.z * r6.w;
/*92*/	  r6.w = r6.w * r5.w + r1.w;
/*93*/	  r7.y = r5.x * 8.000000;
/*94*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*95*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*96*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*97*/	}
/*98*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*99*/	r2.y = max(r2.x, 0.000000);
/*100*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*101*/	if(floatBitsToUint(r2.x) != 0u) {
/*102*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*103*/	  r2.x = max(r2.x, -1.000000);
/*104*/	  r2.x = min(r2.x, 1.000000);
/*105*/	  r2.z = -abs(r2.x) + 1.000000;
/*106*/	  r2.z = sqrt(r2.z);
/*107*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*108*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*109*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*110*/	  r6.y = r2.z * r6.x;
/*111*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*112*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*113*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*114*/	  r2.x = r6.x * r2.z + r2.x;
/*115*/	  r2.z = r4.x * r4.x;
/*116*/	    r4.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*117*/	  r2.z = r2.z * r4.x + r7.x;
/*118*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*119*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*120*/	  r4.x = -r2.z * r2.z + 1.000000;
/*121*/	  r4.x = max(r4.x, 0.001000);
/*122*/	  r4.x = log2(r4.x);
/*123*/	  r5.y = r4.x * 4.950617;
/*124*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*125*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*126*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*127*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*128*/	  r2.z = floatBitsToInt(r2.z);
/*129*/	  r5.y = r4.x * r4.x + -r5.y;
/*130*/	  r5.y = sqrt(r5.y);
/*131*/	  r4.x = -r4.x + r5.y;
/*132*/	  r4.x = max(r4.x, 0.000000);
/*133*/	  r4.x = sqrt(r4.x);
/*134*/	  r2.z = r2.z * r4.x;
/*135*/	  r2.z = r2.z * 1.414214;
/*136*/	  r2.z = 0.008727 / r2.z;
/*137*/	  r2.z = max(r2.z, 0.000100);
/*138*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*139*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*140*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*141*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*142*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*143*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*144*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*145*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*146*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*147*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*148*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*149*/	  r2.x = floatBitsToInt(r2.x);
/*150*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*151*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*152*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*153*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*154*/	  r2.x = r2.x * r6.x + 1.000000;
/*155*/	  r2.x = r2.x * 0.500000;
/*156*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*157*/	  r2.z = r2.z * r6.y + 1.000000;
/*158*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*159*/	  r2.z = min(r2.y, 1.000000);
/*160*/	  r4.x = r5.x * 1.570796;
/*161*/	  r4.x = sin(r4.x);
/*162*/	  r2.z = r2.z + -1.000000;
/*163*/	  r2.z = r4.x * r2.z + 1.000000;
/*164*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*165*/	  r4.x = max(r4.x, 0.000000);
/*166*/	  r4.x = log2(r4.x);
/*167*/	  r4.x = r4.x * 10.000000;
/*168*/	  r4.x = exp2(r4.x);
/*169*/	  r4.x = r5.z * r4.x;
/*170*/	  r4.x = r4.x * r5.w + r1.w;
/*171*/	  r2.x = r2.z * abs(r2.x);
/*172*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*173*/	} else {
/*174*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*175*/	}
/*176*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*177*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*178*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*179*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*180*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*181*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*182*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*183*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*184*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*185*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*186*/	r1.x = sqrt(r2.w);
/*187*/	r1.y = saturate(cb2.data[0].w)/**/;
/*188*/	r1.y = -r1.y + 1.000000;
/*189*/	r1.y = r1.y * 8.000000 + -4.000000;
/*190*/	r1.z = saturate(cb2.data[1].x)/**/;
/*191*/	r1.z = -r1.z + 1.000000;
/*192*/	r1.z = r1.z * 1000.000000;
/*193*/	r1.x = r1.x / r1.z;
/*194*/	r1.x = r1.x + r1.y;
/*195*/	r1.x = r1.x * 1.442695;
/*196*/	r1.x = exp2(r1.x);
/*197*/	r1.x = cb2.data[1].y / r1.x;
/*198*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*199*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*200*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*201*/	r1.y = r1.y + -cb2.data[1].z;
/*202*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*203*/	r1.y = saturate(r1.z * r1.y);
/*204*/	r1.z = r1.y * -2.000000 + 3.000000;
/*205*/	r1.y = r1.y * r1.y;
/*206*/	r1.y = r1.y * r1.z;
/*207*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*208*/	r1.z = sqrt(r1.z);
/*209*/	r1.w = max(cb2.data[2].z, 0.001000);
/*210*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*211*/	r1.z = r1.w * r1.z;
/*212*/	r1.z = min(r1.z, 1.000000);
/*213*/	r1.w = r1.z * -2.000000 + 3.000000;
/*214*/	r1.z = r1.z * r1.z;
/*215*/	r1.z = r1.z * r1.w;
/*216*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*217*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*218*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*219*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*220*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*221*/	r3.w = max(r3.y, 0.000000);
/*222*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*223*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*224*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*225*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*226*/	r1.x = saturate(r1.x * r1.z);
/*227*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*228*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*229*/	color0.w = r0.w * vsOut_T6.w;
/*230*/	return;
}
