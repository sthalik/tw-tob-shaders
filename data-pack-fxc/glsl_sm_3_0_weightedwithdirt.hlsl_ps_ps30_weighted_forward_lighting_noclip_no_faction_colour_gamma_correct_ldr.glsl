//
//
// Shader Model 4
// Fragment Shader
//
// id: 1687 - fxc/glsl_SM_3_0_weightedwithdirt.hlsl_PS_ps30_weighted_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;

void main()
{
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
/*11*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
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
/*49*/	r3.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*50*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*51*/	r2.w = inversesqrt(r1.w);
/*52*/	r4.yzw = (r2.wwww * r3.xxyz).yzw;
/*53*/	r2.w = -r4.x + 1.000000;
/*54*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*55*/	r5.y = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*56*/	r5.y = r5.y + r5.y;
/*57*/	r5.yzw = (r2.xxyz * -r5.yyyy + r4.yyzw).yzw;
/*58*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*59*/	r6.w = r2.w * 1.539380;
/*60*/	r6.w = cos((r6.w));
/*61*/	r6.w = inversesqrt(r6.w);
/*62*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*63*/	r7.x = saturate(r0.w * 60.000000);
/*64*/	r7.x = -r0.w + r7.x;
/*65*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*66*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*67*/	r8.x = inversesqrt(r8.x);
/*68*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*69*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*70*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*71*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*72*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*73*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*74*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*75*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*76*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*77*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*78*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*79*/	r6.y = -r0.w + 1.000000;
/*80*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*81*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*82*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*83*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.yzwy));
/*84*/	  r6.y = max(r6.y, 0.000000);
/*85*/	  r6.y = log2(r6.y);
/*86*/	  r6.y = r6.y * 10.000000;
/*87*/	  r6.y = exp2(r6.y);
/*88*/	  r6.y = r6.w * r6.y;
/*89*/	  r6.y = r6.y * r7.x + r0.w;
/*90*/	  r8.x = r2.w * 8.000000;
/*91*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*92*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*93*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*94*/	}
/*95*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*96*/	r2.y = max(r2.x, 0.000000);
/*97*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*98*/	if(floatBitsToUint(r2.x) != 0u) {
/*99*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*100*/	  r2.x = max(r2.x, -1.000000);
/*101*/	  r2.x = min(r2.x, 1.000000);
/*102*/	  r2.z = -abs(r2.x) + 1.000000;
/*103*/	  r2.z = sqrt(r2.z);
/*104*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*105*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*106*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*107*/	  r5.z = r2.z * r5.y;
/*108*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*109*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*110*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*111*/	  r2.x = r5.y * r2.z + r2.x;
/*112*/	  r2.z = r4.x * r4.x;
/*113*/	    r4.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*114*/	  r2.z = r2.z * r4.x + r6.x;
/*115*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*116*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*117*/	  r4.x = -r2.z * r2.z + 1.000000;
/*118*/	  r4.x = max(r4.x, 0.001000);
/*119*/	  r4.x = log2(r4.x);
/*120*/	  r5.x = r4.x * 4.950617;
/*121*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*122*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*123*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*124*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*125*/	  r2.z = floatBitsToInt(r2.z);
/*126*/	  r5.x = r4.x * r4.x + -r5.x;
/*127*/	  r5.x = sqrt(r5.x);
/*128*/	  r4.x = -r4.x + r5.x;
/*129*/	  r4.x = max(r4.x, 0.000000);
/*130*/	  r4.x = sqrt(r4.x);
/*131*/	  r2.z = r2.z * r4.x;
/*132*/	  r2.z = r2.z * 1.414214;
/*133*/	  r2.z = 0.008727 / r2.z;
/*134*/	  r2.z = max(r2.z, 0.000100);
/*135*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*136*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*137*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*138*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*139*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*140*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*141*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*142*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*143*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*144*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*145*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*146*/	  r2.x = floatBitsToInt(r2.x);
/*147*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*148*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*149*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*150*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*151*/	  r2.x = r2.x * r5.x + 1.000000;
/*152*/	  r2.x = r2.x * 0.500000;
/*153*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*154*/	  r2.z = r2.z * r5.y + 1.000000;
/*155*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*156*/	  r2.z = min(r2.y, 1.000000);
/*157*/	  r2.w = r2.w * 1.570796;
/*158*/	  r2.w = sin(r2.w);
/*159*/	  r2.z = r2.z + -1.000000;
/*160*/	  r2.z = r2.w * r2.z + 1.000000;
/*161*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r4.yzwy));
/*162*/	  r2.w = max(r2.w, 0.000000);
/*163*/	  r2.w = log2(r2.w);
/*164*/	  r2.w = r2.w * 10.000000;
/*165*/	  r2.w = exp2(r2.w);
/*166*/	  r2.w = r6.w * r2.w;
/*167*/	  r2.w = r2.w * r7.x + r0.w;
/*168*/	  r2.x = r2.z * abs(r2.x);
/*169*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*170*/	} else {
/*171*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*172*/	}
/*173*/	r4.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*174*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*175*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*176*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*177*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*178*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*179*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*180*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*181*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*182*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*183*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*184*/	r2.w = 1.000000;
/*185*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*186*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*187*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*188*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*189*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*190*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*191*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*192*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*193*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*194*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*195*/	if(r0.w != 0) discard;
/*196*/	r0.w = sqrt(r1.w);
/*197*/	r1.x = saturate(cb3.data[0].w)/**/;
/*198*/	r1.x = -r1.x + 1.000000;
/*199*/	r1.x = r1.x * 8.000000 + -4.000000;
/*200*/	r1.y = saturate(cb3.data[1].x)/**/;
/*201*/	r1.y = -r1.y + 1.000000;
/*202*/	r1.y = r1.y * 1000.000000;
/*203*/	r0.w = r0.w / r1.y;
/*204*/	r0.w = r0.w + r1.x;
/*205*/	r0.w = r0.w * 1.442695;
/*206*/	r0.w = exp2(r0.w);
/*207*/	r0.w = cb3.data[1].y / r0.w;
/*208*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*209*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*210*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*211*/	r1.x = r1.x + -cb3.data[1].z;
/*212*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*213*/	r1.x = saturate(r1.y * r1.x);
/*214*/	r1.y = r1.x * -2.000000 + 3.000000;
/*215*/	r1.x = r1.x * r1.x;
/*216*/	r1.x = r1.x * r1.y;
/*217*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*218*/	r1.y = sqrt(r1.y);
/*219*/	r1.z = max(cb3.data[2].z, 0.001000);
/*220*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*221*/	r1.y = r1.z * r1.y;
/*222*/	r1.y = min(r1.y, 1.000000);
/*223*/	r1.z = r1.y * -2.000000 + 3.000000;
/*224*/	r1.y = r1.y * r1.y;
/*225*/	r1.y = r1.y * r1.z;
/*226*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*227*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*228*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*229*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*230*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*231*/	r3.w = max(r3.y, 0.000000);
/*232*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*233*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*234*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*235*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*236*/	r0.w = saturate(r0.w * r1.y);
/*237*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*238*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*239*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*240*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*241*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*242*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*243*/	color0.w = 1.000000;
/*244*/	return;
}
