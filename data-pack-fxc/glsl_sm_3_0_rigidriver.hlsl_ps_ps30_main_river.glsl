//
//
// Shader Model 4
// Fragment Shader
//
// id: 631 - fxc/glsl_SM_3_0_rigidriver.hlsl_PS_ps30_main_river.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T5;
in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_normal;
uniform sampler2D s_lf_colour;
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
layout(std140) uniform river_CB
{
  vec4 data[2];
} cb3;

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

/*0*/	r0.xw = (vsOut_T5.yyyx * vec4(10.000000, 0.000000, 0.000000, 0.500000)).xw;
/*1*/	r1.x = cb0.data[26].x * 0.500000;
/*2*/	r1.y = uintBitsToFloat((0.000000 < vsOut_T7.y) ? 0xffffffffu : 0x00000000u);
/*3*/	r1.z = uintBitsToFloat((vsOut_T7.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	r1.y = intBitsToFloat(1 + ~floatBitsToInt(r1.y) + floatBitsToInt(r1.z));
/*5*/	r1.y = floatBitsToInt(r1.y);
/*6*/	r0.y = -r1.x * r1.y + r0.x;
/*7*/	r0.z = vsOut_T5.x;
/*8*/	r0.xz = (r0.zzyz * vec4(0.375000, 0.000000, 0.750000, 0.000000)).xz;
/*9*/	r0.yw = (cb0.data[26].xxxx * vec4(0.000000, 0.100000, 0.000000, 0.100000) + r0.wwwy).yw;
/*10*/	r1.xyzw = (texture(s_normal, r0.xzxx.st)).xyzw;
/*11*/	r0.xz = (r1.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*12*/	r1.xz = (r0.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*13*/	r0.x = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*14*/	r0.x = -r0.x + 1.000000;
/*15*/	r0.x = max(r0.x, 0.000000);
/*16*/	r1.y = sqrt(r0.x);
/*17*/	r0.xyzw = (texture(s_normal, r0.ywyy.st)).xyzw;
/*18*/	r0.xy = (r0.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*19*/	r0.xz = (r0.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*20*/	r0.w = dot(vec2(r0.xzxx), vec2(r0.xzxx));
/*21*/	r0.w = -r0.w + 1.000000;
/*22*/	r0.w = max(r0.w, 0.000000);
/*23*/	r0.y = sqrt(r0.w);
/*24*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*25*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*26*/	r0.w = inversesqrt(r0.w);
/*27*/	r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*28*/	r0.xz = (cb3.data[0].xxyx * vec4(1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*29*/	r0.xz = (vsOut_T0.xxzx / r0.xxzx).xz;
/*30*/	r2.xyzw = (texture(s_lf_colour, r0.xzxx.st)).xyzw;
/*31*/	r0.x = r0.y * r0.w + -0.999000;
/*32*/	r0.x = saturate(r0.x * 1000.012878);
/*33*/	r0.y = r0.x * -2.000000 + 3.000000;
/*34*/	r0.x = r0.x * r0.x;
/*35*/	r0.x = -r0.y * r0.x + 1.000000;
/*36*/	r0.xyz = (r0.xxxx * r2.xyzx).xyz;
/*37*/	r0.xyz = (r0.xyzx * vec4(0.000000, 0.500000, 0.400000, 0.000000) + r2.xyzx).xyz;
/*38*/	r2.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*39*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*40*/	r0.w = inversesqrt(r0.w);
/*41*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*42*/	r0.w = dot(vec3(-r2.xyzx), vec3(r1.xyzx));
/*43*/	r0.w = r0.w + r0.w;
/*44*/	r3.xyz = (r1.xyzx * -r0.wwww + -r2.xyzx).xyz;
/*45*/	r0.w = dot(vec3(r3.xyzx), vec3(-r2.xyzx));
/*46*/	r1.w = max(r0.w, 0.000100);
/*47*/	r2.w = r1.w * r1.w;
/*48*/	r2.w = r2.w * r2.w;
/*49*/	r1.w = r1.w * r2.w;
/*50*/	r1.w = r1.w * 0.380000 + 0.020000;
/*51*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*52*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*53*/	r3.w = -r1.w + 1.000000;
/*54*/	r5.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*55*/	r4.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*56*/	r4.w = inversesqrt(r4.w);
/*57*/	r5.xyz = (r4.wwww * r5.xyzx).xyz;
/*58*/	r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xzxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*59*/	r6.xzw = (mix(cb1.data[2].xxyz, cb1.data[3].xxyz, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xzw/**/;
/*60*/	r7.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyz/**/;
/*61*/	r5.xyz = (r5.xyzx * r5.xyzx).xyz;
/*62*/	r8.xyz = (r5.yyyy * cb1.data[4].xyzx).xyz;
/*63*/	r5.xyw = (r5.xxxx * r6.xzxw + r8.xyxz).xyw;
/*64*/	r5.xyz = (r5.zzzz * r7.xyzx + r5.xywx).xyz;
/*65*/	r5.xyz = (r4.yyyy * r5.xyzx).xyz;
/*66*/	r5.xyz = (r0.xyzx * r5.xyzx).xyz;
/*67*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*68*/	r5.xyz = (r4.xxxx * r5.xyzx).xyz;
/*69*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*70*/	  r0.w = max(r0.w, 0.000000);
/*71*/	  r0.w = log2(r0.w);
/*72*/	  r0.w = r0.w * 10.000000;
/*73*/	  r0.w = exp2(r0.w);
/*74*/	  r0.w = r3.w * r0.w;
/*75*/	  r0.w = r0.w * 0.776485 + r1.w;
/*76*/	  r6.xyzw = (textureLod(s_environment, r3.xyzx.stp, 4.800000)).xyzw;
/*77*/	  r5.xyz = (r6.xyzx * r0.wwww + r5.xyzx).xyz;
/*78*/	}
/*79*/	r0.w = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*80*/	r1.x = max(r0.w, 0.000000);
/*81*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r0.w) != 0u) {
/*83*/	  r0.w = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*84*/	  r0.w = max(r0.w, -1.000000);
/*85*/	  r0.w = min(r0.w, 1.000000);
/*86*/	  r1.y = -abs(r0.w) + 1.000000;
/*87*/	  r1.y = sqrt(r1.y);
/*88*/	  r1.z = abs(r0.w) * -0.018729 + 0.074261;
/*89*/	  r1.z = r1.z * abs(r0.w) + -0.212114;
/*90*/	  r1.z = r1.z * abs(r0.w) + 1.570729;
/*91*/	  r3.x = r1.y * r1.z;
/*92*/	  r3.x = r3.x * -2.000000 + 3.141593;
/*93*/	  r0.w = uintBitsToFloat((r0.w < -r0.w) ? 0xffffffffu : 0x00000000u);
/*94*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r3.x));
/*95*/	  r0.w = r1.z * r1.y + r0.w;
/*96*/	    r1.y = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.159344 : -0.000016;
/*97*/	  r1.y = r1.y + r4.x;
/*98*/	  r1.y = r1.y * 0.500000 + 0.500000;
/*99*/	  r1.y = r1.y * 2.000000 + -1.000000;
/*100*/	  r1.y = -r1.y * r1.y + 1.000000;
/*101*/	  r1.y = max(r1.y, 0.001000);
/*102*/	  r1.y = log2(r1.y);
/*103*/	  r1.z = r1.y * 4.950617;
/*104*/	  r1.y = r1.y * 0.346574 + 4.546885;
/*105*/	  r1.z = r1.y * r1.y + -r1.z;
/*106*/	  r1.z = sqrt(r1.z);
/*107*/	  r1.y = -r1.y + r1.z;
/*108*/	  r1.y = max(r1.y, 0.000000);
/*109*/	  r1.y = sqrt(r1.y);
/*110*/	  r1.y = r1.y * 1.414214;
/*111*/	  r1.y = 0.008727 / r1.y;
/*112*/	  r1.y = max(r1.y, 0.000100);
/*113*/	  r3.xy = (r0.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*114*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).w;
/*115*/	  r1.yz = (r0.wwww * r3.xxyx).yz;
/*116*/	  r3.xy = (r1.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*117*/	  r3.xy = (r3.xyxx * r3.xyxx).xy;
/*118*/	  r6.xyzw = r3.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*119*/	  r4.yw = (r6.xxxz / r6.yyyw).yw;
/*120*/	  r3.xy = (-r3.xyxx * r4.ywyy).xy;
/*121*/	  r4.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.yyyz)) * 0xffffffffu)).yw;
/*122*/	  r0.w = uintBitsToFloat((r1.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*123*/	  r0.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r0.w));
/*124*/	  r0.w = floatBitsToInt(r0.w);
/*125*/	  r1.yz = (r3.xxyx * vec4(0.000000, 1.442695, 1.442695, 0.000000)).yz;
/*126*/	  r1.yz = (exp2(r1.yyzy)).yz;
/*127*/	  r1.yz = (-r1.yyzy + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*128*/	  r1.yz = (sqrt(r1.yyzy)).yz;
/*129*/	  r0.w = r0.w * r1.y + 1.000000;
/*130*/	  r0.w = r0.w * 0.500000;
/*131*/	  r1.y = 1 + ~floatBitsToInt(r4.w);
/*132*/	  r1.y = r1.y * r1.z + 1.000000;
/*133*/	  r0.w = r1.y * 0.500000 + -r0.w;
/*134*/	  r1.y = min(r1.x, 1.000000);
/*135*/	  r1.y = r1.y + -1.000000;
/*136*/	  r1.y = r1.y * 0.809017 + 1.000000;
/*137*/	  r1.z = dot(vec3(-cb1.data[0].yzwy), vec3(-r2.xyzx));
/*138*/	  r1.z = max(r1.z, 0.000000);
/*139*/	  r1.z = log2(r1.z);
/*140*/	  r1.z = r1.z * 10.000000;
/*141*/	  r1.z = exp2(r1.z);
/*142*/	  r1.z = r3.w * r1.z;
/*143*/	  r1.z = r1.z * 0.776485 + r1.w;
/*144*/	  r0.w = abs(r0.w) * r1.y;
/*145*/	  r2.xyz = (r1.zzzz * r0.wwww).xyz;
/*146*/	} else {
/*147*/	  r2.xyz = (vec4(0, 0, 0, 0)).xyz;
/*148*/	}
/*149*/	r3.xyz = saturate(r4.zzzz * r2.xyzx).xyz;
/*150*/	r1.yzw = (max(r1.wwww, r2.xxyz)).yzw;
/*151*/	r1.yzw = (-r1.yyzw + vec4(0.000000, 1.000000, 1.000000, 1.000000)).yzw;
/*152*/	r0.xyz = (r0.xyzx * r1.xxxx).xyz;
/*153*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*154*/	r0.xyz = (r1.yzwy * r0.xyzx).xyz;
/*155*/	r0.xyz = (r4.xxxx * r0.xyzx).xyz;
/*156*/	r0.xyz = (r3.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*157*/	r0.xyz = (r0.xyzx + r5.xyzx).xyz;
/*158*/	r1.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*159*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*160*/	r0.w = sqrt(r0.w);
/*161*/	r2.x = saturate(cb2.data[0].w)/**/;
/*162*/	r2.x = -r2.x + 1.000000;
/*163*/	r2.x = r2.x * 8.000000 + -4.000000;
/*164*/	r2.y = saturate(cb2.data[1].x)/**/;
/*165*/	r2.y = -r2.y + 1.000000;
/*166*/	r2.y = r2.y * 1000.000000;
/*167*/	r0.w = r0.w / r2.y;
/*168*/	r0.w = r0.w + r2.x;
/*169*/	r0.w = r0.w * 1.442695;
/*170*/	r0.w = exp2(r0.w);
/*171*/	r0.w = cb2.data[1].y / r0.w;
/*172*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*173*/	r2.x = -vsOut_T0.y + cb2.data[1].w;
/*174*/	r2.y = -cb2.data[1].z + cb2.data[1].w;
/*175*/	r2.x = r2.x + -cb2.data[1].z;
/*176*/	r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.y)).y;
/*177*/	r2.x = saturate(r2.y * r2.x);
/*178*/	r2.y = r2.x * -2.000000 + 3.000000;
/*179*/	r2.x = r2.x * r2.x;
/*180*/	r2.x = r2.x * r2.y;
/*181*/	r2.y = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*182*/	r2.y = sqrt(r2.y);
/*183*/	r2.z = max(cb2.data[2].z, 0.001000);
/*184*/	r2.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).z;
/*185*/	r2.y = r2.z * r2.y;
/*186*/	r2.y = min(r2.y, 1.000000);
/*187*/	r2.z = r2.y * -2.000000 + 3.000000;
/*188*/	r2.y = r2.y * r2.y;
/*189*/	r2.y = r2.y * r2.z;
/*190*/	r0.w = cb2.data[2].x * r2.x + r0.w;
/*191*/	r2.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*192*/	r2.xzw = (r2.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*193*/	r2.xzw = (r2.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*194*/	r3.xyz = (r4.xxxx * r2.xzwx).xyz;
/*195*/	r1.w = max(r1.y, 0.000000);
/*196*/	r1.xyzw = (texture(s_sky, r1.xwzx.stp)).xyzw;
/*197*/	r1.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*198*/	r1.xyz = (-r2.xzwx * r4.xxxx + r1.xyzx).xyz;
/*199*/	r1.xyz = (r1.wwww * r1.xyzx + r3.xyzx).xyz;
/*200*/	r0.w = saturate(r0.w * r2.y);
/*201*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*202*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*203*/	r0.x = vsOut_T5.z + -0.500000;
/*204*/	r0.x = -abs(r0.x) * 2.000000 + 1.000000;
/*205*/	r0.x = saturate(r0.x + r0.x);
/*206*/	color0.w = r0.x * vsOut_T7.x;
/*207*/	return;
}
