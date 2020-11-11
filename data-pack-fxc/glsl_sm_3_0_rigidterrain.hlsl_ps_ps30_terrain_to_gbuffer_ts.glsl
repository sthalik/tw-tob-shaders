//
//
// Shader Model 4
// Fragment Shader
//
// id: 1500 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_terrain_to_gbuffer_ts.glsl
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

uniform sampler2D s_albedo_map;
uniform sampler2D s_terrain_normal_map;
uniform sampler2D s_terrain_gloss_map;
uniform sampler2D s_depth_map;
uniform sampler2D s_mask_map;
uniform sampler2D s_mid_distance_detail_map_colour;
uniform sampler2D s_mid_distance_detail_map_normal;
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
  vec4 r8;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r1.xyzw = (textureLod(s_albedo_map, r0.xyxx.st, 0.000000)).xyzw;
/*3*/	r2.xyzw = (textureLod(s_terrain_normal_map, r0.xyxx.st, 0.000000)).xyzw;
/*4*/	r3.xyzw = (textureLod(s_terrain_gloss_map, r0.xyxx.st, 0.000000)).wxyz;
/*5*/	r0.xyzw = (textureLod(s_depth_map, r0.xyxx.st, 0.000000)).xyzw;
/*6*/	r0.y = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*7*/	r0.y = inversesqrt(r0.y);
/*8*/	r0.yzw = (r0.yyyy * vsOut_T1.xxyz).yzw;
/*9*/	r4.x = cb0.data[13].z/**/;
/*10*/	r4.y = cb0.data[14].z/**/;
/*11*/	r4.z = cb0.data[15].z/**/;
/*12*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*13*/	r1.w = inversesqrt(r1.w);
/*14*/	r4.xyz = (r1.wwww * r4.xyzx).xyz;
/*15*/	r1.w = dot(vec3(r0.yzwy), vec3(r4.xyzx));
/*16*/	r0.yzw = (r0.yyzw / r1.wwww).yzw;
/*17*/	r4.xyz = (r0.xxxx * r0.yzwy).xyz;
/*18*/	r0.xyz = (r0.yzwy * r0.xxxx + cb0.data[0].xyzx).xyz;
/*19*/	r1.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*20*/	r5.xy = (r1.wwww * r3.zyzz).xy;
/*21*/	r5.zw = (cb3.data[3].xxxy * cb3.data[4].wwww).zw;
/*22*/	r5.zw = (r0.xxxz / r5.zzzw).zw;
/*23*/	r5.zw = (r5.zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + cb4.data[7].xxxx).zw;
/*24*/	r6.xyzw = (texture(s_mask_map, r5.zwzz.st)).xyzw;
/*25*/	r5.zw = (uintBitsToFloat(uvec4(notEqual(r6.yyyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*26*/	r6.xy = (r6.yxyy + vec4(-0.250000, -0.250000, 0.000000, 0.000000)).xy;
/*27*/	r6.xy = saturate(r6.xyxx * vec4(1.333334, 1.333334, 0.000000, 0.000000)).xy;
/*28*/	r6.zw = (uintBitsToFloat(uvec4(cb3.data[4].zzzy))).zw;
/*29*/	r6.xy = (r6.xyxx * vec4(3.000000, 3.000000, 0.000000, 0.000000)).xy;
/*30*/	r2.w = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r6.z)].x));
/*31*/	r7.xy = (r0.xzxx / cb5.data[floatBitsToUint(r2.w)+1u].xxxx).xy;
/*32*/	r2.w = cb6.data[floatBitsToUint(r6.z)].x * 4.000000 + r6.x;
/*33*/	r7.z = trunc(r2.w);
/*34*/	r8.xyzw = (texture(s_diffuse_array, r7.xyzx.stp, -0.660000)).xyzw;
/*35*/	r7.w = r7.z + 1.000000;
/*36*/	r7.xyzw = (texture(s_diffuse_array, r7.xywx.stp, -0.660000)).xyzw;
/*37*/	if(floatBitsToUint(r5.z) != 0u) {
/*38*/	  r2.w = fract(r6.x);
/*39*/	  r7.xyzw = -r8.xyzw + r7.xyzw;
/*40*/	  r7.xyzw = r2.wwww * r7.xyzw + r8.xyzw;
/*41*/	  r2.w = r3.w * r7.w;
/*42*/	  r7.xyz = (-r1.xyzx + r7.xyzx).xyz;
/*43*/	  r1.xyz = (r2.wwww * r7.xyzx + r1.xyzx).xyz;
/*44*/	}
/*45*/	r2.w = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r6.w)].x));
/*46*/	r7.xy = (r0.xzxx / cb5.data[floatBitsToUint(r2.w)+1u].xxxx).xy;
/*47*/	r2.w = cb6.data[floatBitsToUint(r6.w)].x * 4.000000 + r6.y;
/*48*/	r7.z = trunc(r2.w);
/*49*/	r8.xyzw = (texture(s_diffuse_array, r7.xyzx.stp, -0.660000)).xyzw;
/*50*/	r7.w = r7.z + 1.000000;
/*51*/	r7.xyzw = (texture(s_diffuse_array, r7.xywx.stp, -0.660000)).xyzw;
/*52*/	if(floatBitsToUint(r5.w) != 0u) {
/*53*/	  r2.w = fract(r6.y);
/*54*/	  r6.xyzw = -r8.xyzw + r7.xyzw;
/*55*/	  r6.xyzw = r2.wwww * r6.xyzw + r8.xyzw;
/*56*/	  r2.w = r3.w * r6.w;
/*57*/	  r6.xyz = (-r1.xyzx + r6.xyzx).xyz;
/*58*/	  r1.xyz = (r2.wwww * r6.xyzx + r1.xyzx).xyz;
/*59*/	}
/*60*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*61*/	r2.w = sqrt(r2.w);
/*62*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb4.data[0].y)).w;
/*63*/	r4.xy = (r0.xzxx * r3.wwww).xy;
/*64*/	r6.xyzw = (texture(s_mid_distance_detail_map_colour, r4.xyxx.st)).xyzw;
/*65*/	r4.xyzw = (texture(s_mid_distance_detail_map_normal, r4.xyxx.st)).xyzw;
/*66*/	r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*67*/	r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*68*/	r3.w = log2(r6.x);
/*69*/	r3.w = r3.w * 0.454545;
/*70*/	r3.w = exp2(r3.w);
/*71*/	r3.x = saturate(r3.x);
/*72*/	r2.w = saturate(r2.w / cb4.data[0].x);
/*73*/	r2.w = r2.w * r3.x;
/*74*/	r3.x = r2.w * cb4.data[0].w;
/*75*/	r6.xyz = (r1.xyzx * r3.wwww + -r1.xyzx).xyz;
/*76*/	r1.xyz = (r3.xxxx * r6.xyzx + r1.xyzx).xyz;
/*77*/	r4.xz = (r4.xxyx * cb4.data[2].xxxx).xz;
/*78*/	r3.x = -cb4.data[2].y + 1.000000;
/*79*/	r3.w = r2.y + -cb4.data[2].y;
/*80*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*81*/	r3.x = saturate(r3.x * r3.w);
/*82*/	r3.w = r3.x * -2.000000 + 3.000000;
/*83*/	r3.x = r3.x * r3.x;
/*84*/	r3.x = -r3.w * r3.x + 1.000000;
/*85*/	r2.w = r2.w * r3.x;
/*86*/	r4.y = 0;
/*87*/	r2.xyz = (r2.wwww * r4.xyzx + r2.xyzx).xyz;
/*88*/	r2.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*89*/	if(floatBitsToUint(r2.w) != 0u) {
/*90*/	  r4.xyzw = r0.xzxz + -cb1.data[1].xyxy;
/*91*/	  r6.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*92*/	  r4.xyzw = r4.xyzw / r6.xyzw;
/*93*/	  r6.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*94*/	  r4.xyzw = r4.xyzw * r6.xyzw + cb1.data[4].xyxy;
/*95*/	  r6.xyzw = (textureLod(s_shroud, r4.zwzz.st, r4.w)).xyzw;
/*96*/	  r4.xyzw = r4.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*97*/	  r4.xyzw = saturate(r4.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*98*/	  r7.xyzw = r4.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*99*/	  r4.xyzw = r4.xyzw * r4.xyzw;
/*100*/	  r4.xyzw = r4.xyzw * r7.xyzw;
/*101*/	  r2.w = r6.x * r4.x;
/*102*/	  r2.w = r2.w * r4.y;
/*103*/	  r2.w = r4.z * -r2.w + r2.w;
/*104*/	  r2.w = r4.w * -r2.w + r2.w;
/*105*/	} else {
/*106*/	  r2.w = 1.000000;
/*107*/	}
/*108*/	r3.xw = (r2.wwww + vec4(-0.100000, 0.000000, 0.000000, -0.500000)).xw;
/*109*/	r2.w = saturate(r3.x * 2.500000);
/*110*/	r3.x = r2.w * -2.000000 + 3.000000;
/*111*/	r2.w = r2.w * r2.w;
/*112*/	r2.w = r2.w * r3.x;
/*113*/	r3.x = saturate(r3.w + r3.w);
/*114*/	r3.w = r3.x * -2.000000 + 3.000000;
/*115*/	r3.x = r3.x * r3.x;
/*116*/	r3.x = r3.x * r3.w;
/*117*/	r2.w = r2.w * 0.200000;
/*118*/	r4.xyz = saturate(r1.xyzx * r2.wwww).xyz;
/*119*/	r1.xyz = (r1.xyzx + -r4.xyzx).xyz;
/*120*/	r1.xyz = (r3.xxxx * r1.xyzx + r4.xyzx).xyz;
/*121*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*122*/	r2.w = inversesqrt(r2.w);
/*123*/	r4.xyz = (r2.wwww * r2.xyzx).xyz;
/*124*/	r0.w = 1.000000;
/*125*/	r2.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*126*/	r0.y = dot(r0.xyzw, cb0.data[12].xyzw);
/*127*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*128*/	r3.xy = (r3.zyzz * r1.wwww + vec4(0.450000, 0.005000, 0.000000, 0.000000)).xy;
/*129*/	r3.xy = (mix(r5.xyxx, r3.xyxx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*130*/	if(floatBitsToUint(cb4.data[7].w) == 0u) {
/*131*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*132*/	  if(floatBitsToUint(r0.w) != 0u) {
/*133*/	    r5.xyzw = r0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*134*/	    r6.xyzw = (texture(s_snow_normals, r5.xyxx.st)).xyzw;
/*135*/	    r0.xz = (r6.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*136*/	    r6.xz = (r0.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*137*/	    r0.x = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*138*/	    r0.x = -r0.x + 1.000000;
/*139*/	    r0.x = max(r0.x, 0.000000);
/*140*/	    r6.y = sqrt(r0.x);
/*141*/	    r0.xzw = (r6.xxyz * vec4(0.100000, 0.000000, 0.100000, 0.100000) + r4.xxyz).xzw;
/*142*/	    r1.w = dot(vec3(r0.xzwx), vec3(r0.xzwx));
/*143*/	    r1.w = inversesqrt(r1.w);
/*144*/	    r0.xzw = (r0.xxzw * r1.wwww).xzw;
/*145*/	    r7.xz = (cb2.data[0].xxyx).xz/**/;
/*146*/	    r7.y = -1.000000;
/*147*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*148*/	    r1.w = inversesqrt(r1.w);
/*149*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*150*/	    r0.x = saturate(dot(vec3(-r7.xyzx), vec3(r0.xzwx)));
/*151*/	    r0.z = cb2.data[1].x * cb2.data[1].x;
/*152*/	    r0.z = r0.z * 1.250000;
/*153*/	    r0.z = min(r0.z, 1.000000);
/*154*/	    r0.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*155*/	    r0.w = r0.w * 4.000000;
/*156*/	    r0.z = r0.z * 0.200000 + r0.w;
/*157*/	    r0.z = r0.z * -0.700000 + 1.000000;
/*158*/	    r0.x = -r0.z + r0.x;
/*159*/	    r0.x = saturate(r0.x * 200.000000);
/*160*/	    r0.z = r0.x * -2.000000 + 3.000000;
/*161*/	    r0.x = r0.x * r0.x;
/*162*/	    r0.x = r0.x * r0.z;
/*163*/	    r3.x = r0.x * -r3.x + r3.x;
/*164*/	    r0.z = -r3.y + 0.200000;
/*165*/	    r3.y = r0.x * r0.z + r3.y;
/*166*/	    r7.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*167*/	    r1.xyz = (r0.xxxx * r7.xyzx + r1.xyzx).xyz;
/*168*/	    r5.xyzw = (texture(s_snow_normals, r5.zwzz.st)).xyzw;
/*169*/	    r0.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*170*/	    r5.xz = (r0.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*171*/	    r0.z = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*172*/	    r0.z = -r0.z + 1.000000;
/*173*/	    r0.z = max(r0.z, 0.000000);
/*174*/	    r5.y = sqrt(r0.z);
/*175*/	    r6.xyz = (r6.xyzx + r6.xyzx).xyz;
/*176*/	    r0.z = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*177*/	    r0.z = sqrt(r0.z);
/*178*/	    r5.xyz = (r6.xyzx * r0.zzzz + r5.xyzx).xyz;
/*179*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*180*/	    r0.z = inversesqrt(r0.z);
/*181*/	    r0.x = r0.x * 0.300000;
/*182*/	    r0.w = -r2.y * r2.w + 1.000000;
/*183*/	    r0.x = min(r0.w, r0.x);
/*184*/	    r2.yzw = (r5.xxyz * r0.zzzz + -r4.xxyz).yzw;
/*185*/	    r0.xzw = (r0.xxxx * r2.yyzw + r4.xxyz).xzw;
/*186*/	    r1.w = dot(vec3(r0.xzwx), vec3(r0.xzwx));
/*187*/	    r1.w = inversesqrt(r1.w);
/*188*/	    r4.xyz = (r0.xzwx * r1.wwww).xyz;
/*189*/	  }
/*190*/	}
/*191*/	color0.w = saturate(r3.x);
/*192*/	color1.w = saturate(r3.y);
/*193*/	r1.xyz = saturate(r1.xyzx).xyz;
/*194*/	r0.x = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*195*/	r0.x = inversesqrt(r0.x);
/*196*/	r0.xzw = (r0.xxxx * r4.xxyz).xzw;
/*197*/	color3.x = r2.x / r0.y;
/*198*/	r0.y = max(abs(r0.w), abs(r0.z));
/*199*/	r0.y = max(r0.y, abs(r0.x));
/*200*/	r0.xyz = (r0.xzwx / r0.yyyy).xyz;
/*201*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*202*/	color1.xyz = (sqrt(r1.xyzx)).xyz;
/*203*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.003922);
/*204*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*205*/	color4 = uint(0);
/*206*/	return;
}
