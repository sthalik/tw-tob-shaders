//
//
// Shader Model 4
// Fragment Shader
//
// id: 1449 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_geom_vtex_debug.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D vtex_page_table_sampler;
uniform sampler2D vtex_diffuse_cache_sampler;
uniform sampler2D vtex_normal_cache_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform cbTerrainVirtualTexture
{
  vec4 data[3];
} cb1;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  color3 = vec4(0);
  const vec4 c[11] = vec4[11](
    vec4(1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(1.00000000000000, 0.50000000000000, 0.00000000000000, 0.00000000000000),
    vec4(1.00000000000000, 1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.50000000000000, 1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 0.50000000000000, 0.50000000000000, 0.00000000000000),
    vec4(0.00000000000000, 0.00000000000000, 1.00000000000000, 0.00000000000000),
    vec4(0.25000000000000, 0.00000000000000, 0.50000000000000, 0.00000000000000),
    vec4(0.50000000000000, 0.00000000000000, 1.00000000000000, 0.00000000000000),
    vec4(0.50000000000000, 0.50000000000000, 0.50000000000000, 0.00000000000000),
    vec4(1.00000000000000, 1.00000000000000, 1.00000000000000, 0.00000000000000)
  );
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;

/*0*/	r0.xy = (vsOut_T0.xzxx + -cb1.data[0].xyxx).xy;
/*1*/	r0.x = r0.x * cb1.data[1].w;
/*2*/	r0.z = -r0.y * cb1.data[1].w + 1.000000;
/*3*/	r0.yw = (r0.xxxz * cb1.data[1].yyyy).yw;
/*4*/	r1.xy = (dFdx(r0.ywyy)).xy;
/*5*/	r1.zw = (dFdy(r0.yyyw)).zw;
/*6*/	r1.x = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*7*/	r1.y = dot(vec2(r1.zwzz), vec2(r1.zwzz));
/*8*/	r1.x = max(r1.y, r1.x);
/*9*/	r1.x = log2(r1.x);
/*10*/	r1.x = r1.x * 0.500000;
/*11*/	r1.x = max(r1.x, 0.000000);
/*12*/	r1.y = r1.x + -1.000000;
/*13*/	r1.xzw = (fract(r1.xxxx)).xzw;
/*14*/	r1.y = floor(r1.y);
/*15*/	r2.x = r1.y + 1.000000;
/*16*/	r2.y = max(r1.y, 0.000000);
/*17*/	r2.z = exp2(r2.y);
/*18*/	r3.xy = (cb1.data[0].zwzz / r2.zzzz).xy;
/*19*/	r3.zw = (r0.xxxz * r3.xxxy).zw;
/*20*/	r3.zw = floor((r3.zzzw).zw);
/*21*/	r3.xy = (r3.zwzz / r3.xyxx).xy;
/*22*/	r3.xyzw = (textureLod(vtex_page_table_sampler, r3.xyxx.st, r2.y)).xyzw;
/*23*/	r3.xyz = (r3.xyzx * vec4(255.000000, 255.000000, 255.000000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*24*/	r3.xyz = floor((r3.xyzx).xyz);
/*25*/	r2.w = exp2(r3.z);
/*26*/	r3.w = r2.w * cb1.data[1].x;
/*27*/	r4.xy = (r0.xzxx / r3.wwww).xy;
/*28*/	r4.xy = (fract(r4.xyxx)).xy;
/*29*/	r4.xy = (r4.xyxx * cb1.data[2].zzzz).xy;
/*30*/	r3.xy = (r3.xyxx * cb1.data[2].yyyy + r4.xyxx).xy;
/*31*/	r4.xy = (r3.xyxx + cb1.data[2].wwww).xy;
/*32*/	r3.x = exp2(r2.x);
/*33*/	r3.xy = (cb1.data[0].zwzz / r3.xxxx).xy;
/*34*/	r5.xy = (r0.xzxx * r3.xyxx).xy;
/*35*/	r5.xy = floor((r5.xyxx).xy);
/*36*/	r3.xy = (r5.xyxx / r3.xyxx).xy;
/*37*/	r5.xyzw = (textureLod(vtex_page_table_sampler, r3.xyxx.st, r2.x)).xyzw;
/*38*/	r3.xyw = (r5.xyxz * vec4(255.000000, 255.000000, 0.000000, 255.000000) + vec4(0.500000, 0.500000, 0.000000, 0.500000)).xyw;
/*39*/	r3.xyw = floor((r3.xyxw).xyw);
/*40*/	r4.w = exp2(r3.w);
/*41*/	r4.w = r4.w * cb1.data[1].x;
/*42*/	r5.xy = (r0.xzxx / r4.wwww).xy;
/*43*/	r5.xy = (fract(r5.xyxx)).xy;
/*44*/	r5.xy = (r5.xyxx * cb1.data[2].zzzz).xy;
/*45*/	r3.xy = (r3.xyxx * cb1.data[2].yyyy + r5.xyxx).xy;
/*46*/	r5.xy = (r3.xyxx + cb1.data[2].wwww).xy;
/*47*/	r4.z = -r4.y + 1.000000;
/*48*/	r6.xyzw = (texture(vtex_diffuse_cache_sampler, r4.xzxx.st)).xyzw;
/*49*/	r7.xyzw = (texture(vtex_normal_cache_sampler, r4.xzxx.st)).xyzw;
/*50*/	r5.z = -r5.y + 1.000000;
/*51*/	r8.xyzw = (texture(vtex_diffuse_cache_sampler, r5.xzxx.st)).xyzw;
/*52*/	r5.xyzw = (texture(vtex_normal_cache_sampler, r5.xzxx.st)).xyzw;
/*53*/	r8.xyz = (-r6.xyzx + r8.xyzx).xyz;
/*54*/	r6.xyz = (r1.wwww * r8.xyzx + r6.xyzx).xyz;
/*55*/	r5.xyzw = -r7.xyzw + r5.xyzw;
/*56*/	r5.xyzw = r1.wwww * r5.xyzw + r7.xyzw;
/*57*/	r2.z = r2.z * cb1.data[1].x;
/*58*/	r3.xy = (r0.xzxx / r2.zzzz).xy;
/*59*/	r2.z = intBitsToFloat(int(abs(cb1.data[2].x)));
/*60*/	switch(floatBitsToInt(r2.z))
{
/*61*/	  case 1:
/*62*/	    r6.w = r1.w + -0.475000;
/*63*/	    r6.w = saturate(r6.w * 20.000000);
/*64*/	    r0.yw = (r0.yyyw * vec4(0.000000, 0.062500, 0.000000, 0.062500)).yw;
/*65*/	    r7.x = r2.y + 1.000000;
/*66*/	    r7.xy = (r0.ywyy / r7.xxxx).xy;
/*67*/	    r7.xy = (r7.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*68*/	    r7.xy = (fract(r7.xyxx)).xy;
/*69*/	    r7.xy = (r7.xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*70*/	    r7.xy = floor((r7.xyxx).xy);
/*71*/	    r7.z = r7.y + r7.x;
/*72*/	    r7.x = -r7.y + r7.x;
/*73*/	    r7.x = abs(r7.x) * r7.z;
/*74*/	    r1.y = r1.y + 2.000000;
/*75*/	    r0.yw = (r0.yyyw / r1.yyyy).yw;
/*76*/	    r0.yw = (r0.yyyw * vec4(0.000000, 0.500000, 0.000000, 0.500000)).yw;
/*77*/	    r0.yw = (fract(r0.yyyw)).yw;
/*78*/	    r0.yw = (r0.yyyw + vec4(0.000000, 0.500000, 0.000000, 0.500000)).yw;
/*79*/	    r0.yw = floor((r0.yyyw).yw);
/*80*/	    r1.y = r0.w + r0.y;
/*81*/	    r0.y = -r0.w + r0.y;
/*82*/	    r0.y = abs(r0.y) * r1.y;
/*83*/	    r0.w = -r6.w + 1.000000;
/*84*/	    r0.y = r6.w * r0.y;
/*85*/	    r1.xzw = (r7.xxxx * r0.wwww + r0.yyyy).xzw;
/*86*/	    r4.w = intBitsToFloat(int(-1));
/*87*/	    break;
/*88*/	  case 2:
/*89*/	    r0.yw = (r3.xxxy * vec4(0.000000, 0.500000, 0.000000, 0.500000)).yw;
/*90*/	    r0.yw = (fract(r0.yyyw)).yw;
/*91*/	    r0.yw = (r0.yyyw + vec4(0.000000, 0.500000, 0.000000, 0.500000)).yw;
/*92*/	    r0.yw = floor((r0.yyyw).yw);
/*93*/	    r1.y = r0.w + r0.y;
/*94*/	    r0.y = -r0.w + r0.y;
/*95*/	    r1.xzw = (abs(r0.yyyy) * r1.yyyy).xzw;
/*96*/	    r4.w = intBitsToFloat(int(-1));
/*97*/	    break;
/*98*/	  case 3:
/*99*/	    r0.yw = (intBitsToFloat(ivec4(r2.yyyx))).yw;
/*100*/	    r1.y = -r1.w + 1.000000;
/*101*/	    r7.xyz = (r1.wwww * c[uint(floatBitsToInt(r0.w))].xyzx).xyz;
/*102*/	    r1.xzw = (c[uint(floatBitsToInt(r0.y))].xxyz * r1.yyyy + r7.xxyz).xzw;
/*103*/	    r4.w = intBitsToFloat(int(-1));
/*104*/	    break;
/*105*/	  case 4:
/*106*/	    r4.w = intBitsToFloat(int(-1));
/*107*/	    break;
/*108*/	  case 5:
/*109*/	    r0.y = intBitsToFloat(int(r3.z));
/*110*/	    r1.xzw = (c[uint(floatBitsToInt(r0.y))].xxyz).xzw;
/*111*/	    r4.w = intBitsToFloat(int(-1));
/*112*/	    break;
/*113*/	  case 6:
/*114*/	    r0.yw = (intBitsToFloat(ivec4(r3.zzzw))).yw;
/*115*/	    r1.y = -r1.w + 1.000000;
/*116*/	    r7.xyz = (r1.wwww * c[uint(floatBitsToInt(r0.w))].xyzx).xyz;
/*117*/	    r1.xzw = (c[uint(floatBitsToInt(r0.y))].xxyz * r1.yyyy + r7.xxyz).xzw;
/*118*/	    r4.w = intBitsToFloat(int(-1));
/*119*/	    break;
/*120*/	  case 8:
/*121*/	    r1.xzw = (r5.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*122*/	    r4.w = intBitsToFloat(int(-1));
/*123*/	    break;
/*124*/	  case 9:
/*125*/	    r0.xy = (r0.xzxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*126*/	    r0.xy = (abs(r0.xyxx) * vec4(10.000000, 10.000000, 0.000000, 0.000000)).xy;
/*127*/	    r0.xy = floor((r0.xyxx).xy);
/*128*/	    r1.xz = (r0.xxyx * vec4(0.100000, 0.000000, 0.100000, 0.000000)).xz;
/*129*/	    r1.w = 0;
/*130*/	    r4.w = intBitsToFloat(int(-1));
/*131*/	    break;
/*132*/	  case 10:
/*133*/	    r0.xy = (r3.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*134*/	    r0.xy = (fract(r0.xyxx)).xy;
/*135*/	    r0.xy = (r0.xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*136*/	    r0.xy = floor((r0.xyxx).xy);
/*137*/	    r0.z = r0.y + r0.x;
/*138*/	    r0.x = -r0.y + r0.x;
/*139*/	    r0.x = abs(r0.x) * r0.z;
/*140*/	    r1.xzw = (r0.xxxx * r6.xxyz).xzw;
/*141*/	    r4.w = intBitsToFloat(int(-1));
/*142*/	    break;
/*143*/	  case 11:
/*144*/	    r0.x = -r4.y + 1.000000;
/*145*/	    r0.yz = (r3.xxyx * vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*146*/	    r0.yz = (fract(r0.yyzy)).yz;
/*147*/	    r0.yz = (r0.yyzy + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*148*/	    r0.yz = floor((r0.yyzy).yz);
/*149*/	    r0.w = r0.z + r0.y;
/*150*/	    r0.y = -r0.z + r0.y;
/*151*/	    r0.y = abs(r0.y) * r0.w;
/*152*/	    r1.x = r0.y * r4.x;
/*153*/	    r1.z = r0.y * r0.x;
/*154*/	    r1.w = 0;
/*155*/	    r4.w = intBitsToFloat(int(-1));
/*156*/	    break;
/*157*/	  case 12:
/*158*/	    r0.xy = (r4.xzxx * cb1.data[0].zwzz).xy;
/*159*/	    r0.xy = (r2.wwww * r0.xyxx).xy;
/*160*/	    r0.xy = (r0.xyxx * vec4(0.031250, 0.031250, 0.000000, 0.000000)).xy;
/*161*/	    r0.xy = (fract(r0.xyxx)).xy;
/*162*/	    r0.xy = (r0.xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*163*/	    r0.xy = floor((r0.xyxx).xy);
/*164*/	    r0.z = r0.y + r0.x;
/*165*/	    r0.x = -r0.y + r0.x;
/*166*/	    r1.xzw = (abs(r0.xxxx) * r0.zzzz).xzw;
/*167*/	    r4.w = intBitsToFloat(int(-1));
/*168*/	    break;
/*169*/	  default:
/*170*/	  r4.w = 0;
/*171*/	  break;
/*172*/	}
/*173*/	color0.xyz = (mix(r6.xyzx, r1.xzwx, greaterThan(floatBitsToUint(r4.wwww), uvec4(0)))).xyz;
/*174*/	r0.x = uintBitsToFloat((floatBitsToInt(r2.z) == int(7)) ? 0xffffffffu : 0x00000000u) /**/;
/*175*/	color1.xyz = (mix(r5.xyzx, vec4(0, 1.000000, 0, 0), greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*176*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*177*/	r0.w = 1.000000;
/*178*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*179*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*180*/	color3.x = r1.x / r0.x;
/*181*/	color0.w = 1.000000;
/*182*/	color1.w = r5.w;
/*183*/	color2.xyzw = vec4(0, 0, 0, 0);
/*184*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*185*/	return;
}
