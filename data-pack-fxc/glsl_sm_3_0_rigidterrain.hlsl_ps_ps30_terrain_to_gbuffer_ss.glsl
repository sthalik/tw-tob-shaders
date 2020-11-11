//
//
// Shader Model 4
// Fragment Shader
//
// id: 51 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_terrain_to_gbuffer_ss.glsl
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
uniform sampler2D s_snow_normals;
uniform sampler2DArray s_diffuse_array;
uniform sampler2D s_terrain_gloss_map;
uniform sampler2D s_depth_map;
uniform sampler2D s_far_diffuse_map;
uniform sampler2D s_far_normal_map;
uniform sampler2D s_mask_map;
uniform sampler2D s_mid_distance_detail_map_colour;
uniform sampler2D s_mid_distance_detail_map_normal;
uniform sampler2D s_shroud;

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
/*4*/	r3.xyzw = (textureLod(s_terrain_gloss_map, r0.xyxx.st, 0.000000)).xyzw;
/*5*/	r0.xyzw = (textureLod(s_depth_map, r0.xyxx.st, 0.000000)).xyzw;
/*6*/	r0.y = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*7*/	r0.y = inversesqrt(r0.y);
/*8*/	r0.yzw = (r0.yyyy * vsOut_T1.xxyz).yzw;
/*9*/	r4.x = cb0.data[13].z/**/;
/*10*/	r4.y = cb0.data[14].z/**/;
/*11*/	r4.z = cb0.data[15].z/**/;
/*12*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*13*/	r2.w = inversesqrt(r2.w);
/*14*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*15*/	r2.w = dot(vec3(r0.yzwy), vec3(r4.xyzx));
/*16*/	r0.yzw = (r0.yyzw / r2.wwww).yzw;
/*17*/	r4.xyz = (r0.xxxx * r0.yzwy).xyz;
/*18*/	r0.xyz = (r0.yzwy * r0.xxxx + cb0.data[0].xyzx).xyz;
/*19*/	r2.w = r1.w + 0.001000;
/*20*/	r1.xyz = (r1.xyzx / r2.wwww).xyz;
/*21*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*22*/	r3.xyzw = r3.wxyz / r2.wwww;
/*23*/	r2.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*24*/	r3.yz = (r2.wwww * r3.yyzy).yz;
/*25*/	r5.xy = (cb3.data[3].xyxx * cb3.data[4].wwww).xy;
/*26*/	r5.xy = (r0.xzxx / r5.xyxx).xy;
/*27*/	r5.xy = (r5.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000) + cb4.data[7].xxxx).xy;
/*28*/	r5.z = -r5.y + 1.000000;
/*29*/	r6.xyzw = (texture(s_far_diffuse_map, r5.xzxx.st)).xyzw;
/*30*/	r7.xyzw = (texture(s_far_normal_map, r5.xzxx.st)).xyzw;
/*31*/	r7.xz = (r7.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*32*/	r2.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*33*/	r2.w = -r2.w + 1.000000;
/*34*/	r2.w = max(r2.w, 0.000000);
/*35*/	r7.y = sqrt(r2.w);
/*36*/	r1.w = uintBitsToFloat((r1.w < 9.000000) ? 0xffffffffu : 0x00000000u);
/*37*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*38*/	r2.w = sqrt(r2.w);
/*39*/	r4.x = -cb4.data[5].y + cb4.data[5].z;
/*40*/	r4.y = r2.w + -cb4.data[5].y;
/*41*/	r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*42*/	r4.x = saturate(r4.x * r4.y);
/*43*/	r4.y = r4.x * -2.000000 + 3.000000;
/*44*/	r4.x = r4.x * r4.x;
/*45*/	r4.z = r4.x * r4.y;
/*46*/	r6.xyz = (r6.xyzx * r6.xyzx + -r1.xyzx).xyz;
/*47*/	r6.xyz = (r4.zzzz * r6.xyzx + r1.xyzx).xyz;
/*48*/	r7.xyz = (-r2.xyzx + r7.xyzx).xyz;
/*49*/	r7.xyz = (r4.zzzz * r7.xyzx + r2.xyzx).xyz;
/*50*/	r4.x = -r4.y * r4.x + 1.000000;
/*51*/	r8.x = r3.x * r4.x;
/*52*/	r8.yz = (r4.zzzz * -r3.yyzy + r3.yyzy).yz;
/*53*/	r4.x = r6.w * r6.w + -r3.w;
/*54*/	r8.w = r4.z * r4.x + r3.w;
/*55*/	r3.xyzw = mix(r3.xyzw, r8.xyzw, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)));
/*56*/	r1.xyz = (mix(r1.xyzx, r6.xyzx, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xyz;
/*57*/	r2.xyz = (mix(r2.xyzx, r7.xyzx, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xyz;
/*58*/	r4.xyzw = (texture(s_mask_map, r5.xyxx.st)).xyzw;
/*59*/	r4.zw = (uintBitsToFloat(uvec4(notEqual(r4.yyyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*60*/	r4.xy = (r4.yxyy + vec4(-0.250000, -0.250000, 0.000000, 0.000000)).xy;
/*61*/	r4.xy = saturate(r4.xyxx * vec4(1.333334, 1.333334, 0.000000, 0.000000)).xy;
/*62*/	r5.xy = (uintBitsToFloat(uvec4(cb3.data[4].zyzz))).xy;
/*63*/	r4.xy = (r4.xyxx * vec4(3.000000, 3.000000, 0.000000, 0.000000)).xy;
/*64*/	r1.w = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r5.x)].x));
/*65*/	r6.xy = (r0.xzxx / cb5.data[floatBitsToUint(r1.w)+1u].xxxx).xy;
/*66*/	r1.w = cb6.data[floatBitsToUint(r5.x)].x * 4.000000 + r4.x;
/*67*/	r6.z = trunc(r1.w);
/*68*/	r7.xyzw = (texture(s_diffuse_array, r6.xyzx.stp, -0.660000)).xyzw;
/*69*/	r6.w = r6.z + 1.000000;
/*70*/	r6.xyzw = (texture(s_diffuse_array, r6.xywx.stp, -0.660000)).xyzw;
/*71*/	if(floatBitsToUint(r4.z) != 0u) {
/*72*/	  r1.w = fract(r4.x);
/*73*/	  r6.xyzw = -r7.xyzw + r6.xyzw;
/*74*/	  r6.xyzw = r1.wwww * r6.xyzw + r7.xyzw;
/*75*/	  r1.w = r3.w * r6.w;
/*76*/	  r5.xzw = (-r1.xxyz + r6.xxyz).xzw;
/*77*/	  r1.xyz = (r1.wwww * r5.xzwx + r1.xyzx).xyz;
/*78*/	}
/*79*/	r1.w = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r5.y)].x));
/*80*/	r6.xy = (r0.xzxx / cb5.data[floatBitsToUint(r1.w)+1u].xxxx).xy;
/*81*/	r1.w = cb6.data[floatBitsToUint(r5.y)].x * 4.000000 + r4.y;
/*82*/	r6.z = trunc(r1.w);
/*83*/	r5.xyzw = (texture(s_diffuse_array, r6.xyzx.stp, -0.660000)).xyzw;
/*84*/	r6.w = r6.z + 1.000000;
/*85*/	r6.xyzw = (texture(s_diffuse_array, r6.xywx.stp, -0.660000)).xyzw;
/*86*/	if(floatBitsToUint(r4.w) != 0u) {
/*87*/	  r1.w = fract(r4.y);
/*88*/	  r4.xyzw = -r5.xyzw + r6.xyzw;
/*89*/	  r4.xyzw = r1.wwww * r4.xyzw + r5.xyzw;
/*90*/	  r1.w = r3.w * r4.w;
/*91*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*92*/	  r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*93*/	}
/*94*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb4.data[0].y)).w;
/*95*/	r4.xy = (r0.xzxx * r1.wwww).xy;
/*96*/	r5.xyzw = (texture(s_mid_distance_detail_map_colour, r4.xyxx.st)).xyzw;
/*97*/	r4.xyzw = (texture(s_mid_distance_detail_map_normal, r4.xyxx.st)).xyzw;
/*98*/	r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*99*/	r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*100*/	r1.w = log2(r5.x);
/*101*/	r1.w = r1.w * 0.454545;
/*102*/	r1.w = exp2(r1.w);
/*103*/	r3.x = saturate(r3.x);
/*104*/	r2.w = saturate(r2.w / cb4.data[0].x);
/*105*/	r2.w = r2.w * r3.x;
/*106*/	r3.x = r2.w * cb4.data[0].w;
/*107*/	r5.xyz = (r1.xyzx * r1.wwww + -r1.xyzx).xyz;
/*108*/	r1.xyz = (r3.xxxx * r5.xyzx + r1.xyzx).xyz;
/*109*/	r4.xz = (r4.xxyx * cb4.data[2].xxxx).xz;
/*110*/	r1.w = -cb4.data[2].y + 1.000000;
/*111*/	r3.x = r2.y + -cb4.data[2].y;
/*112*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*113*/	r1.w = saturate(r1.w * r3.x);
/*114*/	r3.x = r1.w * -2.000000 + 3.000000;
/*115*/	r1.w = r1.w * r1.w;
/*116*/	r1.w = -r3.x * r1.w + 1.000000;
/*117*/	r1.w = r1.w * r2.w;
/*118*/	r4.y = 0;
/*119*/	r2.xyz = (r1.wwww * r4.xyzx + r2.xyzx).xyz;
/*120*/	r1.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*121*/	if(floatBitsToUint(r1.w) != 0u) {
/*122*/	  r4.xyzw = r0.xzxz + -cb1.data[1].xyxy;
/*123*/	  r5.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*124*/	  r4.xyzw = r4.xyzw / r5.xyzw;
/*125*/	  r5.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*126*/	  r4.xyzw = r4.xyzw * r5.xyzw + cb1.data[4].xyxy;
/*127*/	  r5.xyzw = (textureLod(s_shroud, r4.zwzz.st, r4.w)).xyzw;
/*128*/	  r4.xyzw = r4.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*129*/	  r4.xyzw = saturate(r4.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*130*/	  r6.xyzw = r4.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*131*/	  r4.xyzw = r4.xyzw * r4.xyzw;
/*132*/	  r4.xyzw = r4.xyzw * r6.xyzw;
/*133*/	  r1.w = r5.x * r4.x;
/*134*/	  r1.w = r1.w * r4.y;
/*135*/	  r1.w = r4.z * -r1.w + r1.w;
/*136*/	  r1.w = r4.w * -r1.w + r1.w;
/*137*/	} else {
/*138*/	  r1.w = 1.000000;
/*139*/	}
/*140*/	r3.xw = (r1.wwww + vec4(-0.100000, 0.000000, 0.000000, -0.500000)).xw;
/*141*/	r1.w = saturate(r3.x * 2.500000);
/*142*/	r2.w = r1.w * -2.000000 + 3.000000;
/*143*/	r1.w = r1.w * r1.w;
/*144*/	r1.w = r1.w * r2.w;
/*145*/	r2.w = saturate(r3.w + r3.w);
/*146*/	r3.x = r2.w * -2.000000 + 3.000000;
/*147*/	r2.w = r2.w * r2.w;
/*148*/	r2.w = r2.w * r3.x;
/*149*/	r1.w = r1.w * 0.200000;
/*150*/	r4.xyz = saturate(r1.wwww * r1.xyzx).xyz;
/*151*/	r1.xyz = (r1.xyzx + -r4.xyzx).xyz;
/*152*/	r1.xyz = (r2.wwww * r1.xyzx + r4.xyzx).xyz;
/*153*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*154*/	r1.w = inversesqrt(r1.w);
/*155*/	r2.xzw = (r1.wwww * r2.xxyz).xzw;
/*156*/	r0.w = 1.000000;
/*157*/	r3.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*158*/	r0.y = dot(r0.xyzw, cb0.data[12].xyzw);
/*159*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*160*/	r4.xy = (r3.zyzz + vec4(0.450000, 0.005000, 0.000000, 0.000000)).xy;
/*161*/	r3.yz = (mix(r3.zzyz, r4.xxyx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).yz;
/*162*/	if(floatBitsToUint(cb4.data[7].w) == 0u) {
/*163*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*164*/	  if(floatBitsToUint(r0.w) != 0u) {
/*165*/	    r4.xyzw = r0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*166*/	    r5.xyzw = (texture(s_snow_normals, r4.xyxx.st)).xyzw;
/*167*/	    r0.xz = (r5.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*168*/	    r5.xz = (r0.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*169*/	    r0.x = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*170*/	    r0.x = -r0.x + 1.000000;
/*171*/	    r0.x = max(r0.x, 0.000000);
/*172*/	    r5.y = sqrt(r0.x);
/*173*/	    r0.xzw = (r5.xxyz * vec4(0.100000, 0.000000, 0.100000, 0.100000) + r2.xxzw).xzw;
/*174*/	    r3.w = dot(vec3(r0.xzwx), vec3(r0.xzwx));
/*175*/	    r3.w = inversesqrt(r3.w);
/*176*/	    r0.xzw = (r0.xxzw * r3.wwww).xzw;
/*177*/	    r6.xz = (cb2.data[0].xxyx).xz/**/;
/*178*/	    r6.y = -1.000000;
/*179*/	    r3.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*180*/	    r3.w = inversesqrt(r3.w);
/*181*/	    r6.xyz = (r3.wwww * r6.xyzx).xyz;
/*182*/	    r0.x = saturate(dot(vec3(-r6.xyzx), vec3(r0.xzwx)));
/*183*/	    r0.z = cb2.data[1].x * cb2.data[1].x;
/*184*/	    r0.z = r0.z * 1.250000;
/*185*/	    r0.z = min(r0.z, 1.000000);
/*186*/	    r0.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*187*/	    r0.w = r0.w * 4.000000;
/*188*/	    r0.z = r0.z * 0.200000 + r0.w;
/*189*/	    r0.z = r0.z * -0.700000 + 1.000000;
/*190*/	    r0.x = -r0.z + r0.x;
/*191*/	    r0.x = saturate(r0.x * 200.000000);
/*192*/	    r0.z = r0.x * -2.000000 + 3.000000;
/*193*/	    r0.x = r0.x * r0.x;
/*194*/	    r0.x = r0.x * r0.z;
/*195*/	    r3.y = r0.x * -r3.y + r3.y;
/*196*/	    r0.z = -r3.z + 0.200000;
/*197*/	    r3.z = r0.x * r0.z + r3.z;
/*198*/	    r6.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*199*/	    r1.xyz = (r0.xxxx * r6.xyzx + r1.xyzx).xyz;
/*200*/	    r4.xyzw = (texture(s_snow_normals, r4.zwzz.st)).xyzw;
/*201*/	    r0.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*202*/	    r4.xz = (r0.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*203*/	    r0.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*204*/	    r0.z = -r0.z + 1.000000;
/*205*/	    r0.z = max(r0.z, 0.000000);
/*206*/	    r4.y = sqrt(r0.z);
/*207*/	    r5.xyz = (r5.xyzx + r5.xyzx).xyz;
/*208*/	    r0.z = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*209*/	    r0.z = sqrt(r0.z);
/*210*/	    r4.xyz = (r5.xyzx * r0.zzzz + r4.xyzx).xyz;
/*211*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*212*/	    r0.z = inversesqrt(r0.z);
/*213*/	    r0.x = r0.x * 0.300000;
/*214*/	    r0.w = -r2.y * r1.w + 1.000000;
/*215*/	    r0.x = min(r0.w, r0.x);
/*216*/	    r4.xyz = (r4.xyzx * r0.zzzz + -r2.xzwx).xyz;
/*217*/	    r0.xzw = (r0.xxxx * r4.xxyz + r2.xxzw).xzw;
/*218*/	    r1.w = dot(vec3(r0.xzwx), vec3(r0.xzwx));
/*219*/	    r1.w = inversesqrt(r1.w);
/*220*/	    r2.xzw = (r0.xxzw * r1.wwww).xzw;
/*221*/	  }
/*222*/	}
/*223*/	color0.w = saturate(r3.y);
/*224*/	color1.w = saturate(r3.z);
/*225*/	r1.xyz = saturate(r1.xyzx).xyz;
/*226*/	r0.x = dot(vec3(r2.xzwx), vec3(r2.xzwx));
/*227*/	r0.x = inversesqrt(r0.x);
/*228*/	r0.xzw = (r0.xxxx * r2.xxzw).xzw;
/*229*/	color3.x = r3.x / r0.y;
/*230*/	r0.y = max(abs(r0.w), abs(r0.z));
/*231*/	r0.y = max(r0.y, abs(r0.x));
/*232*/	r0.xyz = (r0.xzwx / r0.yyyy).xyz;
/*233*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*234*/	color1.xyz = (sqrt(r1.xyzx)).xyz;
/*235*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.003922);
/*236*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*237*/	color4 = uint(0);
/*238*/	return;
}
