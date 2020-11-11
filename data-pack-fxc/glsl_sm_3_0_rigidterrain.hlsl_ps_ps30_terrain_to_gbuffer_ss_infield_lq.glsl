//
//
// Shader Model 4
// Fragment Shader
//
// id: 1502 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_terrain_to_gbuffer_ss_infield_lq.glsl
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
uniform sampler2D s_terrain_gloss_map;
uniform sampler2D s_near_distance_detail_map_colour;
uniform sampler2D s_shroud;
uniform sampler2D s_snow_normals;
uniform sampler2DArray s_diffuse_array;
uniform sampler2D s_depth_map;
uniform sampler2D s_far_diffuse_map;
uniform sampler2D s_infield_diffuse_map;
uniform sampler2D s_far_normal_map;
uniform sampler2D s_infield_normal_map;
uniform sampler2D s_mask_map;
uniform sampler2D s_mid_distance_detail_map_colour;
uniform sampler2D s_mid_distance_detail_map_normal;

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
/*3*/	r2.xyzw = (textureLod(s_terrain_gloss_map, r0.xyxx.st, 0.000000)).xyzw;
/*4*/	r0.xyzw = (textureLod(s_depth_map, r0.xyxx.st, 0.000000)).xyzw;
/*5*/	r0.y = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*6*/	r0.y = inversesqrt(r0.y);
/*7*/	r0.yzw = (r0.yyyy * vsOut_T1.xxyz).yzw;
/*8*/	r1.x = cb0.data[13].z/**/;
/*9*/	r1.y = cb0.data[14].z/**/;
/*10*/	r1.z = cb0.data[15].z/**/;
/*11*/	r2.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*12*/	r2.x = inversesqrt(r2.x);
/*13*/	r1.xyz = (r1.xyzx * r2.xxxx).xyz;
/*14*/	r1.x = dot(vec3(r0.yzwy), vec3(r1.xyzx));
/*15*/	r0.yzw = (r0.yyzw / r1.xxxx).yzw;
/*16*/	r1.xyz = (r0.xxxx * r0.yzwy).xyz;
/*17*/	r0.xyz = (r0.yzwy * r0.xxxx + cb0.data[0].xyzx).xyz;
/*18*/	r1.w = r1.w + 0.001000;
/*19*/	r1.w = r2.z / r1.w;
/*20*/	r2.xy = (cb3.data[3].xyxx * cb3.data[4].wwww).xy;
/*21*/	r2.xy = (r0.xzxx / r2.xyxx).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000) + cb4.data[7].xxxx).xy;
/*23*/	r3.xy = (r0.xzxx / cb3.data[3].zwzz).xy;
/*24*/	r3.xy = (r3.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000) + cb4.data[7].xxxx).xy;
/*25*/	r2.z = -r2.y + 1.000000;
/*26*/	r4.xyzw = (texture(s_far_diffuse_map, r2.xzxx.st)).xyzw;
/*27*/	r3.z = -r3.y + 1.000000;
/*28*/	r5.xyzw = (texture(s_infield_diffuse_map, r3.xzxx.st)).xyzw;
/*29*/	r6.xyzw = (texture(s_far_normal_map, r2.xzxx.st)).xyzw;
/*30*/	r3.xyzw = (texture(s_infield_normal_map, r3.xzxx.st)).xyzw;
/*31*/	r3.xz = (r3.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*32*/	r2.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*33*/	r2.z = -r2.z + 1.000000;
/*34*/	r2.z = max(r2.z, 0.000000);
/*35*/	r3.y = sqrt(r2.z);
/*36*/	r6.xz = (r6.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*37*/	r2.z = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*38*/	r2.z = -r2.z + 1.000000;
/*39*/	r2.z = max(r2.z, 0.000000);
/*40*/	r6.y = sqrt(r2.z);
/*41*/	r5.xyz = (r5.xyzx * r5.xyzx).xyz;
/*42*/	r2.zw = (cb3.data[3].zzzw * vec4(0.000000, 0.000000, 0.500000, 0.500000) + -cb4.data[7].zzzz).zw;
/*43*/	r7.xy = (cb3.data[3].zwzz * vec4(0.500000, 0.500000, 0.000000, 0.000000) + -r2.zwzz).xy;
/*44*/	r2.zw = (abs(r0.xxxz) + -r2.zzzw).zw;
/*45*/	r7.xy = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / r7.xyxx).xy;
/*46*/	r2.zw = saturate(r2.zzzw * r7.xxxy).zw;
/*47*/	r7.xy = (r2.zwzz * vec4(-2.000000, -2.000000, 0.000000, 0.000000) + vec4(3.000000, 3.000000, 0.000000, 0.000000)).xy;
/*48*/	r2.zw = (r2.zzzw * r2.zzzw).zw;
/*49*/	r2.zw = (r2.zzzw * r7.xxxy).zw;
/*50*/	r2.z = max(r2.w, r2.z);
/*51*/	r4.xyz = (r4.xyzx * r4.xyzx + -r5.xyzx).xyz;
/*52*/	r4.xyz = (r2.zzzz * r4.xyzx + r5.xyzx).xyz;
/*53*/	r5.xyz = (-r3.xyzx + r6.xyzx).xyz;
/*54*/	r3.xyz = (r2.zzzz * r5.xyzx + r3.xyzx).xyz;
/*55*/	r2.xyzw = (texture(s_mask_map, r2.xyxx.st)).xyzw;
/*56*/	r2.zw = (uintBitsToFloat(uvec4(notEqual(r2.yyyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*57*/	r2.xy = (r2.yxyy + vec4(-0.250000, -0.250000, 0.000000, 0.000000)).xy;
/*58*/	r2.xy = saturate(r2.xyxx * vec4(1.333334, 1.333334, 0.000000, 0.000000)).xy;
/*59*/	r5.xy = (uintBitsToFloat(uvec4(cb3.data[4].zyzz))).xy;
/*60*/	r2.xy = (r2.xyxx * vec4(3.000000, 3.000000, 0.000000, 0.000000)).xy;
/*61*/	r3.w = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r5.x)].x));
/*62*/	r6.xy = (r0.xzxx / cb5.data[floatBitsToUint(r3.w)+1u].xxxx).xy;
/*63*/	r3.w = cb6.data[floatBitsToUint(r5.x)].x * 4.000000 + r2.x;
/*64*/	r6.z = trunc(r3.w);
/*65*/	r7.xyzw = (texture(s_diffuse_array, r6.xyzx.stp, -0.660000)).xyzw;
/*66*/	r6.w = r6.z + 1.000000;
/*67*/	r6.xyzw = (texture(s_diffuse_array, r6.xywx.stp, -0.660000)).xyzw;
/*68*/	if(floatBitsToUint(r2.z) != 0u) {
/*69*/	  r2.x = fract(r2.x);
/*70*/	  r6.xyzw = -r7.xyzw + r6.xyzw;
/*71*/	  r6.xyzw = r2.xxxx * r6.xyzw + r7.xyzw;
/*72*/	  r2.x = r1.w * r6.w;
/*73*/	  r5.xzw = (-r4.xxyz + r6.xxyz).xzw;
/*74*/	  r4.xyz = (r2.xxxx * r5.xzwx + r4.xyzx).xyz;
/*75*/	}
/*76*/	r2.x = uintBitsToFloat(uint(cb6.data[floatBitsToUint(r5.y)].x));
/*77*/	r6.xy = (r0.xzxx / cb5.data[floatBitsToUint(r2.x)+1u].xxxx).xy;
/*78*/	r2.x = cb6.data[floatBitsToUint(r5.y)].x * 4.000000 + r2.y;
/*79*/	r6.z = trunc(r2.x);
/*80*/	r5.xyzw = (texture(s_diffuse_array, r6.xyzx.stp, -0.660000)).xyzw;
/*81*/	r6.w = r6.z + 1.000000;
/*82*/	r6.xyzw = (texture(s_diffuse_array, r6.xywx.stp, -0.660000)).xyzw;
/*83*/	if(floatBitsToUint(r2.w) != 0u) {
/*84*/	  r2.x = fract(r2.y);
/*85*/	  r6.xyzw = -r5.xyzw + r6.xyzw;
/*86*/	  r2.xyzw = r2.xxxx * r6.xyzw + r5.xyzw;
/*87*/	  r1.w = r1.w * r2.w;
/*88*/	  r2.xyz = (-r4.xyzx + r2.xyzx).xyz;
/*89*/	  r4.xyz = (r1.wwww * r2.xyzx + r4.xyzx).xyz;
/*90*/	}
/*91*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*92*/	r1.x = sqrt(r1.x);
/*93*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb4.data[0].y)).y;
/*94*/	r1.yz = (r0.xxzx * r1.yyyy).yz;
/*95*/	r2.xyzw = (texture(s_mid_distance_detail_map_colour, r1.yzyy.st)).xyzw;
/*96*/	r5.xyzw = (texture(s_mid_distance_detail_map_normal, r1.yzyy.st)).xyzw;
/*97*/	r1.yz = (r5.wwyw + vec4(0.000000, 0.001961, 0.001961, 0.000000)).yz;
/*98*/	r1.yz = (r1.yyzy * vec4(0.000000, 2.000000, 2.000000, 0.000000) + vec4(0.000000, -1.000000, -1.000000, 0.000000)).yz;
/*99*/	r1.w = log2(r2.x);
/*100*/	r1.w = r1.w * 0.454545;
/*101*/	r1.w = exp2(r1.w);
/*102*/	r2.x = saturate(r1.x / cb4.data[0].x);
/*103*/	r2.y = r2.x * cb4.data[0].w;
/*104*/	r5.xyz = (r4.xyzx * r1.wwww + -r4.xyzx).xyz;
/*105*/	r2.yzw = (r2.yyyy * r5.xxyz + r4.xxyz).yzw;
/*106*/	r4.xz = (r1.yyzy * cb4.data[2].xxxx).xz;
/*107*/	r1.y = -cb4.data[2].y + 1.000000;
/*108*/	r1.z = r3.y + -cb4.data[2].y;
/*109*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*110*/	r1.y = saturate(r1.y * r1.z);
/*111*/	r1.z = r1.y * -2.000000 + 3.000000;
/*112*/	r1.y = r1.y * r1.y;
/*113*/	r1.y = -r1.z * r1.y + 1.000000;
/*114*/	r1.y = r1.y * r2.x;
/*115*/	r4.y = 0;
/*116*/	r1.yzw = (r1.yyyy * r4.xxyz + r3.xxyz).yzw;
/*117*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb4.data[1].y)).x;
/*118*/	r3.xy = (r0.xzxx * r2.xxxx).xy;
/*119*/	r3.xyzw = (texture(s_near_distance_detail_map_colour, r3.xyxx.st)).xyzw;
/*120*/	r1.x = saturate(r1.x / cb4.data[1].x);
/*121*/	r1.x = -r1.x + 1.000000;
/*122*/	r1.x = r1.x * cb4.data[1].z;
/*123*/	r3.xyz = (r2.yzwy * r3.xxxx + -r2.yzwy).xyz;
/*124*/	r2.xyz = (r1.xxxx * r3.xyzx + r2.yzwy).xyz;
/*125*/	r1.x = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*126*/	if(floatBitsToUint(r1.x) != 0u) {
/*127*/	  r3.xyzw = r0.xzxz + -cb1.data[1].xyxy;
/*128*/	  r4.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*129*/	  r3.xyzw = r3.xyzw / r4.xyzw;
/*130*/	  r4.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*131*/	  r3.xyzw = r3.xyzw * r4.xyzw + cb1.data[4].xyxy;
/*132*/	  r4.xyzw = (textureLod(s_shroud, r3.zwzz.st, r3.w)).xyzw;
/*133*/	  r3.xyzw = r3.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*134*/	  r3.xyzw = saturate(r3.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*135*/	  r5.xyzw = r3.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*136*/	  r3.xyzw = r3.xyzw * r3.xyzw;
/*137*/	  r3.xyzw = r3.xyzw * r5.xyzw;
/*138*/	  r1.x = r4.x * r3.x;
/*139*/	  r1.x = r1.x * r3.y;
/*140*/	  r1.x = r3.z * -r1.x + r1.x;
/*141*/	  r1.x = r3.w * -r1.x + r1.x;
/*142*/	} else {
/*143*/	  r1.x = 1.000000;
/*144*/	}
/*145*/	r3.xy = (r1.xxxx + vec4(-0.100000, -0.500000, 0.000000, 0.000000)).xy;
/*146*/	r1.x = saturate(r3.x * 2.500000);
/*147*/	r2.w = r1.x * -2.000000 + 3.000000;
/*148*/	r1.x = r1.x * r1.x;
/*149*/	r1.x = r1.x * r2.w;
/*150*/	r2.w = saturate(r3.y + r3.y);
/*151*/	r3.x = r2.w * -2.000000 + 3.000000;
/*152*/	r2.w = r2.w * r2.w;
/*153*/	r2.w = r2.w * r3.x;
/*154*/	r1.x = r1.x * 0.200000;
/*155*/	r3.xyz = saturate(r1.xxxx * r2.xyzx).xyz;
/*156*/	r2.xyz = (r2.xyzx + -r3.xyzx).xyz;
/*157*/	r2.xyz = (r2.wwww * r2.xyzx + r3.xyzx).xyz;
/*158*/	r1.x = dot(vec3(r1.yzwy), vec3(r1.yzwy));
/*159*/	r1.x = inversesqrt(r1.x);
/*160*/	r3.xyz = (r1.xxxx * r1.yzwy).xyz;
/*161*/	r0.w = 1.000000;
/*162*/	r1.y = dot(r0.xyzw, cb0.data[11].xyzw);
/*163*/	r0.y = dot(r0.xyzw, cb0.data[12].xyzw);
/*164*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*165*/	r4.xy = (uintBitsToFloat(floatBitsToUint(r0.wwww) & uvec4(vec4(0x3ee66666u, 0x3ba3d70au, 0, 0)))).xy;
/*166*/	if(floatBitsToUint(cb4.data[7].w) == 0u) {
/*167*/	  r1.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*168*/	  if(floatBitsToUint(r1.w) != 0u) {
/*169*/	    r5.xyzw = r0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*170*/	    r6.xyzw = (texture(s_snow_normals, r5.xyxx.st)).xyzw;
/*171*/	    r0.xz = (r6.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*172*/	    r6.xz = (r0.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*173*/	    r0.x = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*174*/	    r0.x = -r0.x + 1.000000;
/*175*/	    r0.x = max(r0.x, 0.000000);
/*176*/	    r6.y = sqrt(r0.x);
/*177*/	    r7.xyz = (r6.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*178*/	    r0.x = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*179*/	    r0.x = inversesqrt(r0.x);
/*180*/	    r7.xyz = (r0.xxxx * r7.xyzx).xyz;
/*181*/	    r8.xz = (cb2.data[0].xxyx).xz/**/;
/*182*/	    r8.y = -1.000000;
/*183*/	    r0.x = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*184*/	    r0.x = inversesqrt(r0.x);
/*185*/	    r8.xyz = (r0.xxxx * r8.xyzx).xyz;
/*186*/	    r0.x = saturate(dot(vec3(-r8.xyzx), vec3(r7.xyzx)));
/*187*/	    r0.z = cb2.data[1].x * cb2.data[1].x;
/*188*/	    r0.z = r0.z * 1.250000;
/*189*/	    r0.z = min(r0.z, 1.000000);
/*190*/	    r1.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*191*/	    r1.w = r1.w * 4.000000;
/*192*/	    r0.z = r0.z * 0.200000 + r1.w;
/*193*/	    r0.z = r0.z * -0.700000 + 1.000000;
/*194*/	    r0.x = -r0.z + r0.x;
/*195*/	    r0.x = saturate(r0.x * 200.000000);
/*196*/	    r0.z = r0.x * -2.000000 + 3.000000;
/*197*/	    r0.x = r0.x * r0.x;
/*198*/	    r0.x = r0.x * r0.z;
/*199*/	    r5.xy = (r0.xxxx * vec4(-0.450000, 0.300000, 0.000000, 0.000000)).xy;
/*200*/	    r0.z = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r5.x));
/*201*/	    r4.x = r0.z + r4.x;
/*202*/	        r0.z = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.195000 : 0.200000;
/*203*/	    r4.y = r0.x * r0.z + r4.y;
/*204*/	    r7.xyz = (-r2.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*205*/	    r2.xyz = (r0.xxxx * r7.xyzx + r2.xyzx).xyz;
/*206*/	    r7.xyzw = (texture(s_snow_normals, r5.zwzz.st)).xyzw;
/*207*/	    r0.xz = (r7.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*208*/	    r7.xz = (r0.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*209*/	    r0.x = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*210*/	    r0.x = -r0.x + 1.000000;
/*211*/	    r0.x = max(r0.x, 0.000000);
/*212*/	    r7.y = sqrt(r0.x);
/*213*/	    r0.xzw = (r6.xxyz + r6.xxyz).xzw;
/*214*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*215*/	    r1.w = sqrt(r1.w);
/*216*/	    r0.xzw = (r0.xxzw * r1.wwww + r7.xxyz).xzw;
/*217*/	    r1.w = dot(vec3(r0.xzwx), vec3(r0.xzwx));
/*218*/	    r1.w = inversesqrt(r1.w);
/*219*/	    r1.x = -r1.z * r1.x + 1.000000;
/*220*/	    r1.x = min(r1.x, r5.y);
/*221*/	    r0.xzw = (r0.xxzw * r1.wwww + -r3.xxyz).xzw;
/*222*/	    r0.xzw = (r1.xxxx * r0.xxzw + r3.xxyz).xzw;
/*223*/	    r1.x = dot(vec3(r0.xzwx), vec3(r0.xzwx));
/*224*/	    r1.x = inversesqrt(r1.x);
/*225*/	    r3.xyz = (r0.xzwx * r1.xxxx).xyz;
/*226*/	  }
/*227*/	}
/*228*/	color0.w = saturate(max(r4.x, 0.000000));
/*229*/	r2.xyz = saturate(r2.xyzx).xyz;
/*230*/	r0.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*231*/	r0.x = inversesqrt(r0.x);
/*232*/	r0.xzw = (r0.xxxx * r3.xxyz).xzw;
/*233*/	color3.x = r1.y / r0.y;
/*234*/	r0.y = max(abs(r0.w), abs(r0.z));
/*235*/	r0.y = max(r0.y, abs(r0.x));
/*236*/	r0.xyz = (r0.xzwx / r0.yyyy).xyz;
/*237*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*238*/	r4.xzw = (sqrt(r2.xxyz)).xzw;
/*239*/	color1.xyzw = r4.xzwy;
/*240*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.003922);
/*241*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*242*/	color4 = uint(0);
/*243*/	return;
}
