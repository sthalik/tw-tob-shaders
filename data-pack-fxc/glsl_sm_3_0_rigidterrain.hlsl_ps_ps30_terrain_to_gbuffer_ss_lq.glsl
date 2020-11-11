//
//
// Shader Model 4
// Fragment Shader
//
// id: 1504 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_terrain_to_gbuffer_ss_lq.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_depth_map;
uniform sampler2D s_far_diffuse_map;
uniform sampler2D s_far_normal_map;
uniform sampler2D s_mask_map;
uniform sampler2D s_shroud;
uniform sampler2D s_snow_normals;
uniform sampler2DArray s_diffuse_array;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform vs_height_map_cb
{
  vec4 data[6];
} cb3;
layout(std140) uniform ps_height_map_cb
{
  vec4 data[9];
} cb4;
layout(std140) uniform ps_texture_array_cb
{
  vec4 data[405];
} cb5;
layout(std140) uniform ps_mapping_array
{
  vec4 data[2048];
} cb6;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  color3 = vec4(0);
  color4 = uint(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r0.xyzw = (textureLod(s_depth_map, r0.xyxx.st, 0.000000)).xyzw;
/*3*/	r0.y = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*4*/	r0.y = inversesqrt(r0.y);
/*5*/	r0.yzw = (r0.yyyy * vsOut_T1.xxyz).yzw;
/*6*/	r1.x = cb0.data[13].z/**/;
/*7*/	r1.y = cb0.data[14].z/**/;
/*8*/	r1.z = cb0.data[15].z/**/;
/*9*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*10*/	r1.w = inversesqrt(r1.w);
/*11*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*12*/	r1.x = dot(vec3(r0.yzwy), vec3(r1.xyzx));
/*13*/	r0.yzw = (r0.yyzw / r1.xxxx).yzw;
/*14*/	r0.xyz = (r0.yzwy * r0.xxxx + cb0.data[0].xyzx).xyz;
/*15*/	r1.xy = (cb3.data[3].xyxx * cb3.data[4].wwww).xy;
/*16*/	r1.xy = (r0.xzxx / r1.xyxx).xy;
/*17*/	r1.xy = (r1.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000) + cb4.data[7].xxxx).xy;
/*18*/	r1.z = -r1.y + 1.000000;
/*19*/	r2.xyzw = (texture(s_far_diffuse_map, r1.xzxx.st)).xyzw;
/*20*/	r3.xyzw = (texture(s_far_normal_map, r1.xzxx.st)).xyzw;
/*21*/	r4.xz = (r3.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*22*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*23*/	r1.z = -r1.z + 1.000000;
/*24*/	r1.z = max(r1.z, 0.000000);
/*25*/	r4.y = sqrt(r1.z);
/*26*/	r3.xzw = (r2.xxyz * r2.xxyz).xzw;
/*27*/	r1.xyzw = (texture(s_mask_map, r1.xyxx.st)).xyzw;
/*28*/	r1.zw = (uintBitsToFloat(uvec4(notEqual(r1.yyyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*29*/	r1.xy = (r1.yxyy + vec4(-0.250000, -0.250000, 0.000000, 0.000000)).xy;
/*30*/	r1.xy = saturate(r1.xyxx * vec4(1.333334, 1.333334, 0.000000, 0.000000)).xy;
/*31*/	r5.xy = (uintBitsToFloat(uvec4(cb3.data[4].zyzz))).xy;
/*32*/	r1.xy = (r1.xyxx * vec4(3.000000, 3.000000, 0.000000, 0.000000)).xy;
/*33*/	r2.w = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r5.x)].x));
/*34*/	r6.xy = (r0.xzxx / cb5.data[floatBitsToUint(r2.w)+1u].xxxx).xy;
/*35*/	r2.w = cb6.data[floatBitsToUint(r5.x)].x * 4.000000 + r1.x;
/*36*/	r6.z = trunc(r2.w);
/*37*/	r7.xyzw = (texture(s_diffuse_array, r6.xyzx.stp, -0.660000)).xyzw;
/*38*/	r6.w = r6.z + 1.000000;
/*39*/	r6.xyzw = (texture(s_diffuse_array, r6.xywx.stp, -0.660000)).xyzw;
/*40*/	if(floatBitsToUint(r1.z) != 0u) {
/*41*/	  r1.x = fract(r1.x);
/*42*/	  r6.xyzw = -r7.xyzw + r6.xyzw;
/*43*/	  r6.xyzw = r1.xxxx * r6.xyzw + r7.xyzw;
/*44*/	  r1.x = r3.y * r6.w;
/*45*/	  r2.xyz = (-r2.xyzx * r2.xyzx + r6.xyzx).xyz;
/*46*/	  r3.xzw = (r1.xxxx * r2.xxyz + r3.xxzw).xzw;
/*47*/	}
/*48*/	r1.x = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r5.y)].x));
/*49*/	r2.xy = (r0.xzxx / cb5.data[floatBitsToUint(r1.x)+1u].xxxx).xy;
/*50*/	r1.x = cb6.data[floatBitsToUint(r5.y)].x * 4.000000 + r1.y;
/*51*/	r2.z = trunc(r1.x);
/*52*/	r5.xyzw = (texture(s_diffuse_array, r2.xyzx.stp, -0.660000)).xyzw;
/*53*/	r2.w = r2.z + 1.000000;
/*54*/	r2.xyzw = (texture(s_diffuse_array, r2.xywx.stp, -0.660000)).xyzw;
/*55*/	if(floatBitsToUint(r1.w) != 0u) {
/*56*/	  r1.x = fract(r1.y);
/*57*/	  r2.xyzw = -r5.xyzw + r2.xyzw;
/*58*/	  r1.xyzw = r1.xxxx * r2.xyzw + r5.xyzw;
/*59*/	  r1.w = r3.y * r1.w;
/*60*/	  r1.xyz = (-r3.xzwx + r1.xyzx).xyz;
/*61*/	  r3.xzw = (r1.wwww * r1.xxyz + r3.xxzw).xzw;
/*62*/	}
/*63*/	r1.x = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*64*/	if(floatBitsToUint(r1.x) != 0u) {
/*65*/	  r1.xyzw = r0.xzxz + -cb1.data[1].xyxy;
/*66*/	  r2.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*67*/	  r1.xyzw = r1.xyzw / r2.xyzw;
/*68*/	  r2.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*69*/	  r1.xyzw = r1.xyzw * r2.xyzw + cb1.data[4].xyxy;
/*70*/	  r2.xyzw = (textureLod(s_shroud, r1.zwzz.st, r1.w)).xyzw;
/*71*/	  r1.xyzw = r1.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*72*/	  r1.xyzw = saturate(r1.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*73*/	  r5.xyzw = r1.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*74*/	  r1.xyzw = r1.xyzw * r1.xyzw;
/*75*/	  r1.xyzw = r1.xyzw * r5.xyzw;
/*76*/	  r1.x = r2.x * r1.x;
/*77*/	  r1.x = r1.x * r1.y;
/*78*/	  r1.x = r1.z * -r1.x + r1.x;
/*79*/	  r1.x = r1.w * -r1.x + r1.x;
/*80*/	} else {
/*81*/	  r1.x = 1.000000;
/*82*/	}
/*83*/	r1.xy = (r1.xxxx + vec4(-0.100000, -0.500000, 0.000000, 0.000000)).xy;
/*84*/	r1.x = saturate(r1.x * 2.500000);
/*85*/	r1.z = r1.x * -2.000000 + 3.000000;
/*86*/	r1.x = r1.x * r1.x;
/*87*/	r1.x = r1.x * r1.z;
/*88*/	r1.y = saturate(r1.y + r1.y);
/*89*/	r1.z = r1.y * -2.000000 + 3.000000;
/*90*/	r1.y = r1.y * r1.y;
/*91*/	r1.y = r1.y * r1.z;
/*92*/	r1.x = r1.x * 0.200000;
/*93*/	r1.xzw = saturate(r1.xxxx * r3.xxzw).xzw;
/*94*/	r2.xyz = (-r1.xzwx + r3.xzwx).xyz;
/*95*/	r1.xyz = (r1.yyyy * r2.xyzx + r1.xzwx).xyz;
/*96*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*97*/	r1.w = inversesqrt(r1.w);
/*98*/	r2.xyz = (r1.wwww * r4.xyzx).xyz;
/*99*/	r0.w = 1.000000;
/*100*/	r2.w = dot(r0.xyzw, cb0.data[11].xyzw);
/*101*/	r0.y = dot(r0.xyzw, cb0.data[12].xyzw);
/*102*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*103*/	r3.xy = (uintBitsToFloat(floatBitsToUint(r0.wwww) & uvec4(vec4(0x3ee66666u, 0x3ba3d70au, 0, 0)))).xy;
/*104*/	if(floatBitsToUint(cb4.data[7].w) == 0u) {
/*105*/	  r4.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*106*/	  if(floatBitsToUint(r4.x) != 0u) {
/*107*/	    r5.xyzw = r0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*108*/	    r6.xyzw = (texture(s_snow_normals, r5.xyxx.st)).xyzw;
/*109*/	    r0.xz = (r6.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*110*/	    r6.xz = (r0.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*111*/	    r0.x = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*112*/	    r0.x = -r0.x + 1.000000;
/*113*/	    r0.x = max(r0.x, 0.000000);
/*114*/	    r6.y = sqrt(r0.x);
/*115*/	    r4.xzw = (r6.xxyz * vec4(0.100000, 0.000000, 0.100000, 0.100000) + r2.xxyz).xzw;
/*116*/	    r0.x = dot(vec3(r4.xzwx), vec3(r4.xzwx));
/*117*/	    r0.x = inversesqrt(r0.x);
/*118*/	    r4.xzw = (r0.xxxx * r4.xxzw).xzw;
/*119*/	    r7.xz = (cb2.data[0].xxyx).xz/**/;
/*120*/	    r7.y = -1.000000;
/*121*/	    r0.x = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*122*/	    r0.x = inversesqrt(r0.x);
/*123*/	    r7.xyz = (r0.xxxx * r7.xyzx).xyz;
/*124*/	    r0.x = saturate(dot(vec3(-r7.xyzx), vec3(r4.xzwx)));
/*125*/	    r0.z = cb2.data[1].x * cb2.data[1].x;
/*126*/	    r0.z = r0.z * 1.250000;
/*127*/	    r0.z = min(r0.z, 1.000000);
/*128*/	    r4.x = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*129*/	    r4.x = r4.x * 4.000000;
/*130*/	    r0.z = r0.z * 0.200000 + r4.x;
/*131*/	    r0.z = r0.z * -0.700000 + 1.000000;
/*132*/	    r0.x = -r0.z + r0.x;
/*133*/	    r0.x = saturate(r0.x * 200.000000);
/*134*/	    r0.z = r0.x * -2.000000 + 3.000000;
/*135*/	    r0.x = r0.x * r0.x;
/*136*/	    r0.x = r0.x * r0.z;
/*137*/	    r4.xz = (r0.xxxx * vec4(-0.450000, 0.000000, 0.300000, 0.000000)).xz;
/*138*/	    r0.z = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r4.x));
/*139*/	    r3.x = r0.z + r3.x;
/*140*/	        r0.z = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.195000 : 0.200000;
/*141*/	    r3.y = r0.x * r0.z + r3.y;
/*142*/	    r7.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*143*/	    r1.xyz = (r0.xxxx * r7.xyzx + r1.xyzx).xyz;
/*144*/	    r5.xyzw = (texture(s_snow_normals, r5.zwzz.st)).xyzw;
/*145*/	    r0.xz = (r5.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*146*/	    r5.xz = (r0.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*147*/	    r0.x = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*148*/	    r0.x = -r0.x + 1.000000;
/*149*/	    r0.x = max(r0.x, 0.000000);
/*150*/	    r5.y = sqrt(r0.x);
/*151*/	    r0.xzw = (r6.xxyz + r6.xxyz).xzw;
/*152*/	    r4.x = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*153*/	    r4.x = sqrt(r4.x);
/*154*/	    r0.xzw = (r0.xxzw * r4.xxxx + r5.xxyz).xzw;
/*155*/	    r4.x = dot(vec3(r0.xzwx), vec3(r0.xzwx));
/*156*/	    r4.x = inversesqrt(r4.x);
/*157*/	    r1.w = -r4.y * r1.w + 1.000000;
/*158*/	    r1.w = min(r1.w, r4.z);
/*159*/	    r0.xzw = (r0.xxzw * r4.xxxx + -r2.xxyz).xzw;
/*160*/	    r0.xzw = (r1.wwww * r0.xxzw + r2.xxyz).xzw;
/*161*/	    r1.w = dot(vec3(r0.xzwx), vec3(r0.xzwx));
/*162*/	    r1.w = inversesqrt(r1.w);
/*163*/	    r2.xyz = (r0.xzwx * r1.wwww).xyz;
/*164*/	  }
/*165*/	}
/*166*/	color0.w = saturate(max(r3.x, 0.000000));
/*167*/	r1.xyz = saturate(r1.xyzx).xyz;
/*168*/	r0.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*169*/	r0.x = inversesqrt(r0.x);
/*170*/	r0.xzw = (r0.xxxx * r2.xxyz).xzw;
/*171*/	color3.x = r2.w / r0.y;
/*172*/	r0.y = max(abs(r0.w), abs(r0.z));
/*173*/	r0.y = max(r0.y, abs(r0.x));
/*174*/	r0.xyz = (r0.xzwx / r0.yyyy).xyz;
/*175*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*176*/	r3.xzw = (sqrt(r1.xxyz)).xzw;
/*177*/	color1.xyzw = r3.xzwy;
/*178*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.003922);
/*179*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*180*/	color4 = uint(0);
/*181*/	return;
}
