// Compiled shader for Android

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/UI" {
Properties {
[PerRendererData]  _MainTex ("Sprite Texture", 2D) = "white" { }
 _Color ("Tint", Color) = (1.000000,1.000000,1.000000,1.000000)
 _StencilComp ("Stencil Comparison", Float) = 8.000000
 _Stencil ("Stencil ID", Float) = 0.000000
 _StencilOp ("Stencil Operation", Float) = 0.000000
 _StencilWriteMask ("Stencil Write Mask", Float) = 255.000000
 _StencilReadMask ("Stencil Read Mask", Float) = 255.000000
 _ColorMask ("Color Mask", Float) = 15.000000
[Toggle(UNITY_UI_ALPHACLIP)]  _UseUIAlphaClip ("Use Alpha Clip", Float) = 0.000000
}
SubShader { 
 Tags { "QUEUE"="Overlay" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "CanUseSpriteAtlas"="true" "PreviewType"="Plane" }
 Pass {
  Name "Default"
  Tags { "QUEUE"="Overlay" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "CanUseSpriteAtlas"="true" "PreviewType"="Plane" }
  ZTest Always
  ZWrite Off
  Cull Off
  Stencil {
   Ref [_Stencil]
   ReadMask [_StencilReadMask]
   WriteMask [_StencilWriteMask]
   Comp [_StencilComp]
   Pass [_StencilOp]
  }
  Blend One OneMinusSrcAlpha
  ColorMask [_ColorMask]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: <none>
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _TextureSampleAdd at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
  ScalarInt _UIVertexColorAlwaysGammaSpace at 264
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	int _UIVertexColorAlwaysGammaSpace;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
highp vec4 vs_TEXCOORD1;
highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xyz = in_COLOR0.xyz * vec3(0.265884995, 0.265884995, 0.265884995) + vec3(0.736584008, 0.736584008, 0.736584008);
    u_xlat16_2.xyz = in_COLOR0.xyz * u_xlat16_2.xyz + vec3(-0.00980184041, -0.00980184041, -0.00980184041);
    u_xlat16_2.xyz = in_COLOR0.xyz * u_xlat16_2.xyz + vec3(0.00319697009, 0.00319697009, 0.00319697009);
    u_xlat16_3.xyz = in_COLOR0.xyz * vec3(0.0849710032, 0.0849710032, 0.0849710032) + vec3(-0.000163029006, -0.000163029006, -0.000163029006);
    u_xlatb0.xyz = lessThan(in_COLOR0.xyzx, vec4(0.0725490004, 0.0725490004, 0.0725490004, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = (int(_UIVertexColorAlwaysGammaSpace) != 0) ? u_xlat16_2.xyz : in_COLOR0.xyz;
    u_xlat1.w = in_COLOR0.w;
    u_xlat1 = u_xlat1 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump  vec4 vs_COLOR0;
in highp  vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: STEREO_MULTIVIEW_ON
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _TextureSampleAdd at 0
  Vector4 _Color at 80
  Vector4 _ClipRect at 96
  Vector4 _MainTex_ST at 112
  Float _UIMaskSoftnessX at 128
  Float _UIMaskSoftnessY at 132
  ScalarInt _UIVertexColorAlwaysGammaSpace at 136
}
Constant Buffer "UnityStereoGlobals" (1088 bytes) on slot 0 {
  Matrix4x4 unity_StereoMatrixP[2] at 0
  Matrix4x4 unity_StereoMatrixVP[2] at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es
#extension GL_OVR_multiview2 : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	int _UIVertexColorAlwaysGammaSpace;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4                hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4                hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 Xhlslcc_UnusedXunity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXunity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
layout(num_views = 2) in;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
highp vec4 vs_TEXCOORD1;
highp vec4 vs_TEXCOORD2;
flat out highp uint vs_BLENDINDICES0;
vec4 u_xlat0;
bvec3 u_xlatb0;
int u_xlati1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(int(gl_ViewID_OVR) << (2 & int(0x1F)));
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    gl_Position = u_xlat0;
    u_xlat16_3.xyz = in_COLOR0.xyz * vec3(0.265884995, 0.265884995, 0.265884995) + vec3(0.736584008, 0.736584008, 0.736584008);
    u_xlat16_3.xyz = in_COLOR0.xyz * u_xlat16_3.xyz + vec3(-0.00980184041, -0.00980184041, -0.00980184041);
    u_xlat16_3.xyz = in_COLOR0.xyz * u_xlat16_3.xyz + vec3(0.00319697009, 0.00319697009, 0.00319697009);
    u_xlat16_4.xyz = in_COLOR0.xyz * vec3(0.0849710032, 0.0849710032, 0.0849710032) + vec3(-0.000163029006, -0.000163029006, -0.000163029006);
    u_xlatb0.xyz = lessThan(in_COLOR0.xyzx, vec4(0.0725490004, 0.0725490004, 0.0725490004, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_4.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_4.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_4.z : u_xlat16_3.z;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat2.xyz = (int(_UIVertexColorAlwaysGammaSpace) != 0) ? u_xlat16_3.xyz : in_COLOR0.xyz;
    u_xlat2.w = in_COLOR0.w;
    u_xlat2 = u_xlat2 * _Color;
    vs_COLOR0 = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4unity_StereoMatrixP[(u_xlati1 + 1)].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_StereoMatrixP[u_xlati1].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    vs_BLENDINDICES0 = gl_ViewID_OVR;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump  vec4 vs_COLOR0;
in highp  vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _TextureSampleAdd at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
  ScalarInt _UIVertexColorAlwaysGammaSpace at 264
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	int _UIVertexColorAlwaysGammaSpace;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
highp vec4 vs_TEXCOORD1;
highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xyz = in_COLOR0.xyz * vec3(0.265884995, 0.265884995, 0.265884995) + vec3(0.736584008, 0.736584008, 0.736584008);
    u_xlat16_2.xyz = in_COLOR0.xyz * u_xlat16_2.xyz + vec3(-0.00980184041, -0.00980184041, -0.00980184041);
    u_xlat16_2.xyz = in_COLOR0.xyz * u_xlat16_2.xyz + vec3(0.00319697009, 0.00319697009, 0.00319697009);
    u_xlat16_3.xyz = in_COLOR0.xyz * vec3(0.0849710032, 0.0849710032, 0.0849710032) + vec3(-0.000163029006, -0.000163029006, -0.000163029006);
    u_xlatb0.xyz = lessThan(in_COLOR0.xyzx, vec4(0.0725490004, 0.0725490004, 0.0725490004, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = (int(_UIVertexColorAlwaysGammaSpace) != 0) ? u_xlat16_2.xyz : in_COLOR0.xyz;
    u_xlat1.w = in_COLOR0.w;
    u_xlat1 = u_xlat1 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump  vec4 vs_COLOR0;
in highp  vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
bool u_xlatb3;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.w + -0.00100000005;
    u_xlatb3 = u_xlat16_2<0.0;
    if(u_xlatb3){discard;}
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: STEREO_MULTIVIEW_ON UNITY_UI_ALPHACLIP
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _TextureSampleAdd at 0
  Vector4 _Color at 80
  Vector4 _ClipRect at 96
  Vector4 _MainTex_ST at 112
  Float _UIMaskSoftnessX at 128
  Float _UIMaskSoftnessY at 132
  ScalarInt _UIVertexColorAlwaysGammaSpace at 136
}
Constant Buffer "UnityStereoGlobals" (1088 bytes) on slot 0 {
  Matrix4x4 unity_StereoMatrixP[2] at 0
  Matrix4x4 unity_StereoMatrixVP[2] at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es
#extension GL_OVR_multiview2 : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	int _UIVertexColorAlwaysGammaSpace;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4                hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4                hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 Xhlslcc_UnusedXunity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXunity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
layout(num_views = 2) in;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
highp vec4 vs_TEXCOORD1;
highp vec4 vs_TEXCOORD2;
flat out highp uint vs_BLENDINDICES0;
vec4 u_xlat0;
bvec3 u_xlatb0;
int u_xlati1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(int(gl_ViewID_OVR) << (2 & int(0x1F)));
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    gl_Position = u_xlat0;
    u_xlat16_3.xyz = in_COLOR0.xyz * vec3(0.265884995, 0.265884995, 0.265884995) + vec3(0.736584008, 0.736584008, 0.736584008);
    u_xlat16_3.xyz = in_COLOR0.xyz * u_xlat16_3.xyz + vec3(-0.00980184041, -0.00980184041, -0.00980184041);
    u_xlat16_3.xyz = in_COLOR0.xyz * u_xlat16_3.xyz + vec3(0.00319697009, 0.00319697009, 0.00319697009);
    u_xlat16_4.xyz = in_COLOR0.xyz * vec3(0.0849710032, 0.0849710032, 0.0849710032) + vec3(-0.000163029006, -0.000163029006, -0.000163029006);
    u_xlatb0.xyz = lessThan(in_COLOR0.xyzx, vec4(0.0725490004, 0.0725490004, 0.0725490004, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_4.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_4.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_4.z : u_xlat16_3.z;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat2.xyz = (int(_UIVertexColorAlwaysGammaSpace) != 0) ? u_xlat16_3.xyz : in_COLOR0.xyz;
    u_xlat2.w = in_COLOR0.w;
    u_xlat2 = u_xlat2 * _Color;
    vs_COLOR0 = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4unity_StereoMatrixP[(u_xlati1 + 1)].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_StereoMatrixP[u_xlati1].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    vs_BLENDINDICES0 = gl_ViewID_OVR;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump  vec4 vs_COLOR0;
in highp  vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
bool u_xlatb3;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.w + -0.00100000005;
    u_xlatb3 = u_xlat16_2<0.0;
    if(u_xlatb3){discard;}
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_CLIP_RECT
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) on slot 0 {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
  ScalarInt _UIVertexColorAlwaysGammaSpace at 264
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	int _UIVertexColorAlwaysGammaSpace;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xyz = in_COLOR0.xyz * vec3(0.265884995, 0.265884995, 0.265884995) + vec3(0.736584008, 0.736584008, 0.736584008);
    u_xlat16_2.xyz = in_COLOR0.xyz * u_xlat16_2.xyz + vec3(-0.00980184041, -0.00980184041, -0.00980184041);
    u_xlat16_2.xyz = in_COLOR0.xyz * u_xlat16_2.xyz + vec3(0.00319697009, 0.00319697009, 0.00319697009);
    u_xlat16_3.xyz = in_COLOR0.xyz * vec3(0.0849710032, 0.0849710032, 0.0849710032) + vec3(-0.000163029006, -0.000163029006, -0.000163029006);
    u_xlatb0.xyz = lessThan(in_COLOR0.xyzx, vec4(0.0725490004, 0.0725490004, 0.0725490004, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = (int(_UIVertexColorAlwaysGammaSpace) != 0) ? u_xlat16_2.xyz : in_COLOR0.xyz;
    u_xlat1.w = in_COLOR0.w;
    u_xlat1 = u_xlat1 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump  vec4 vs_COLOR0;
in highp  vec2 vs_TEXCOORD0;
in highp  vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = vs_COLOR0.w * 255.0;
    u_xlat16_4 = roundEven(u_xlat16_4);
    u_xlat16_0.w = u_xlat16_4 * 0.00392156886;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat16_2 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat2;
    u_xlat16_1 = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    SV_Target0.w = u_xlat16_1;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: STEREO_MULTIVIEW_ON UNITY_UI_CLIP_RECT
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) on slot 0 {
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
  Vector4 _Color at 80
  Vector4 _ClipRect at 96
  Vector4 _MainTex_ST at 112
  Float _UIMaskSoftnessX at 128
  Float _UIMaskSoftnessY at 132
  ScalarInt _UIVertexColorAlwaysGammaSpace at 136
}
Constant Buffer "UnityStereoGlobals" (1088 bytes) on slot 0 {
  Matrix4x4 unity_StereoMatrixP[2] at 0
  Matrix4x4 unity_StereoMatrixVP[2] at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es
#extension GL_OVR_multiview2 : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	int _UIVertexColorAlwaysGammaSpace;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4                hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4                hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 Xhlslcc_UnusedXunity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXunity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
layout(num_views = 2) in;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
flat out highp uint vs_BLENDINDICES0;
vec4 u_xlat0;
bvec3 u_xlatb0;
int u_xlati1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(int(gl_ViewID_OVR) << (2 & int(0x1F)));
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    gl_Position = u_xlat0;
    u_xlat16_3.xyz = in_COLOR0.xyz * vec3(0.265884995, 0.265884995, 0.265884995) + vec3(0.736584008, 0.736584008, 0.736584008);
    u_xlat16_3.xyz = in_COLOR0.xyz * u_xlat16_3.xyz + vec3(-0.00980184041, -0.00980184041, -0.00980184041);
    u_xlat16_3.xyz = in_COLOR0.xyz * u_xlat16_3.xyz + vec3(0.00319697009, 0.00319697009, 0.00319697009);
    u_xlat16_4.xyz = in_COLOR0.xyz * vec3(0.0849710032, 0.0849710032, 0.0849710032) + vec3(-0.000163029006, -0.000163029006, -0.000163029006);
    u_xlatb0.xyz = lessThan(in_COLOR0.xyzx, vec4(0.0725490004, 0.0725490004, 0.0725490004, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_4.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_4.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_4.z : u_xlat16_3.z;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat2.xyz = (int(_UIVertexColorAlwaysGammaSpace) != 0) ? u_xlat16_3.xyz : in_COLOR0.xyz;
    u_xlat2.w = in_COLOR0.w;
    u_xlat2 = u_xlat2 * _Color;
    vs_COLOR0 = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4unity_StereoMatrixP[(u_xlati1 + 1)].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_StereoMatrixP[u_xlati1].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    vs_BLENDINDICES0 = gl_ViewID_OVR;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump  vec4 vs_COLOR0;
in highp  vec2 vs_TEXCOORD0;
in highp  vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = vs_COLOR0.w * 255.0;
    u_xlat16_4 = roundEven(u_xlat16_4);
    u_xlat16_0.w = u_xlat16_4 * 0.00392156886;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat16_2 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat2;
    u_xlat16_1 = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    SV_Target0.w = u_xlat16_1;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) on slot 0 {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
  ScalarInt _UIVertexColorAlwaysGammaSpace at 264
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	int _UIVertexColorAlwaysGammaSpace;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xyz = in_COLOR0.xyz * vec3(0.265884995, 0.265884995, 0.265884995) + vec3(0.736584008, 0.736584008, 0.736584008);
    u_xlat16_2.xyz = in_COLOR0.xyz * u_xlat16_2.xyz + vec3(-0.00980184041, -0.00980184041, -0.00980184041);
    u_xlat16_2.xyz = in_COLOR0.xyz * u_xlat16_2.xyz + vec3(0.00319697009, 0.00319697009, 0.00319697009);
    u_xlat16_3.xyz = in_COLOR0.xyz * vec3(0.0849710032, 0.0849710032, 0.0849710032) + vec3(-0.000163029006, -0.000163029006, -0.000163029006);
    u_xlatb0.xyz = lessThan(in_COLOR0.xyzx, vec4(0.0725490004, 0.0725490004, 0.0725490004, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = (int(_UIVertexColorAlwaysGammaSpace) != 0) ? u_xlat16_2.xyz : in_COLOR0.xyz;
    u_xlat1.w = in_COLOR0.w;
    u_xlat1 = u_xlat1 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump  vec4 vs_COLOR0;
in highp  vec2 vs_TEXCOORD0;
in highp  vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat16_2 = u_xlat1.y * u_xlat1.x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_2 + -0.00100000005;
    u_xlat16_2 = u_xlat0.w * u_xlat16_2;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    SV_Target0.w = u_xlat16_2;
    u_xlatb1 = u_xlat16_5<0.0;
    if(u_xlatb1){discard;}
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: STEREO_MULTIVIEW_ON UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) on slot 0 {
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
  Vector4 _Color at 80
  Vector4 _ClipRect at 96
  Vector4 _MainTex_ST at 112
  Float _UIMaskSoftnessX at 128
  Float _UIMaskSoftnessY at 132
  ScalarInt _UIVertexColorAlwaysGammaSpace at 136
}
Constant Buffer "UnityStereoGlobals" (1088 bytes) on slot 0 {
  Matrix4x4 unity_StereoMatrixP[2] at 0
  Matrix4x4 unity_StereoMatrixVP[2] at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es
#extension GL_OVR_multiview2 : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	int _UIVertexColorAlwaysGammaSpace;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4                hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4                hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 Xhlslcc_UnusedXunity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 Xhlslcc_UnusedXunity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
layout(num_views = 2) in;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
flat out highp uint vs_BLENDINDICES0;
vec4 u_xlat0;
bvec3 u_xlatb0;
int u_xlati1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(int(gl_ViewID_OVR) << (2 & int(0x1F)));
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    gl_Position = u_xlat0;
    u_xlat16_3.xyz = in_COLOR0.xyz * vec3(0.265884995, 0.265884995, 0.265884995) + vec3(0.736584008, 0.736584008, 0.736584008);
    u_xlat16_3.xyz = in_COLOR0.xyz * u_xlat16_3.xyz + vec3(-0.00980184041, -0.00980184041, -0.00980184041);
    u_xlat16_3.xyz = in_COLOR0.xyz * u_xlat16_3.xyz + vec3(0.00319697009, 0.00319697009, 0.00319697009);
    u_xlat16_4.xyz = in_COLOR0.xyz * vec3(0.0849710032, 0.0849710032, 0.0849710032) + vec3(-0.000163029006, -0.000163029006, -0.000163029006);
    u_xlatb0.xyz = lessThan(in_COLOR0.xyzx, vec4(0.0725490004, 0.0725490004, 0.0725490004, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_4.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_4.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_4.z : u_xlat16_3.z;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat2.xyz = (int(_UIVertexColorAlwaysGammaSpace) != 0) ? u_xlat16_3.xyz : in_COLOR0.xyz;
    u_xlat2.w = in_COLOR0.w;
    u_xlat2 = u_xlat2 * _Color;
    vs_COLOR0 = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4unity_StereoMatrixP[(u_xlati1 + 1)].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_StereoMatrixP[u_xlati1].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    vs_BLENDINDICES0 = gl_ViewID_OVR;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump  vec4 vs_COLOR0;
in highp  vec2 vs_TEXCOORD0;
in highp  vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat16_2 = u_xlat1.y * u_xlat1.x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_2 + -0.00100000005;
    u_xlat16_2 = u_xlat0.w * u_xlat16_2;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    SV_Target0.w = u_xlat16_2;
    u_xlatb1 = u_xlat16_5<0.0;
    if(u_xlatb1){discard;}
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: <none>
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 0, used in: Fragment  no sampler

Constant Buffer "PGlobals3471061852" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals3471061852" (268 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
  ScalarInt _UIVertexColorAlwaysGammaSpace at 264
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 317

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 87 201 205 207 218 266
                              Name 205  "vs_TEXCOORD0"
                              Name 218  "vs_TEXCOORD1"
                              Name 266  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 20 0 Offset 0
                              MemberDecorate 20 1 Offset 16
                              MemberDecorate 20 2 Offset 80
                              MemberDecorate 20 3 Offset 144
                              MemberDecorate 20 4 RelaxedPrecision
                              MemberDecorate 20 4 Offset 208
                              MemberDecorate 20 5 Offset 224
                              MemberDecorate 20 6 Offset 240
                              MemberDecorate 20 7 Offset 256
                              MemberDecorate 20 8 Offset 260
                              MemberDecorate 20 9 Offset 264
                              Decorate 20 Block
                              Decorate 22 DescriptorSet 1
                              Decorate 22 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 86 RelaxedPrecision
                              Decorate 87 Location 1
                              Decorate 98 RelaxedPrecision
                              Decorate 105 RelaxedPrecision
                              Decorate 110 RelaxedPrecision
                              Decorate 133 RelaxedPrecision
                              Decorate 139 RelaxedPrecision
                              Decorate 144 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 148 RelaxedPrecision
                              Decorate 152 RelaxedPrecision
                              Decorate 156 RelaxedPrecision
                              Decorate 159 RelaxedPrecision
                              Decorate 160 RelaxedPrecision
                              Decorate 165 RelaxedPrecision
                              Decorate 169 RelaxedPrecision
                              Decorate 172 RelaxedPrecision
                              Decorate 173 RelaxedPrecision
                              Decorate 184 RelaxedPrecision
                              Decorate 199 RelaxedPrecision
                              Decorate 201 RelaxedPrecision
                              Decorate 201 Location 0
                              Decorate 205(vs_TEXCOORD0) Location 1
                              Decorate 207 Location 2
                              Decorate 218(vs_TEXCOORD1) Location 2
                              Decorate 266(vs_TEXCOORD2) Location 3
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeInt 32 1
              20:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float) 19(int)
              21:             TypePointer Uniform 20(struct)
              22:     21(ptr) Variable Uniform
              23:     19(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     19(int) Constant 0
              36:     19(int) Constant 2
              45:     19(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:             TypeVector 6(float) 3
              85:             TypePointer Private 84(fvec3)
              86:     85(ptr) Variable Private
              87:     10(ptr) Variable Input
              90:    6(float) Constant 1049109012
              91:   84(fvec3) ConstantComposite 90 90 90
              93:    6(float) Constant 1060933829
              94:   84(fvec3) ConstantComposite 93 93 93
             100:    6(float) Constant 3156252646
             101:   84(fvec3) ConstantComposite 100 100 100
             107:    6(float) Constant 995198018
             108:   84(fvec3) ConstantComposite 107 107 107
             110:     85(ptr) Variable Private
             113:    6(float) Constant 1034814791
             114:   84(fvec3) ConstantComposite 113 113 113
             116:    6(float) Constant 3106599620
             117:   84(fvec3) ConstantComposite 116 116 116
             119:             TypeBool
             120:             TypeVector 119(bool) 3
             121:             TypePointer Private 120(bvec3)
             122:    121(ptr) Variable Private
             125:    6(float) Constant 1033147538
             126:    6(float) Constant 0
             127:    7(fvec4) ConstantComposite 125 125 125 126
             128:             TypeVector 119(bool) 4
             131:             TypePointer Function 84(fvec3)
             134:     14(int) Constant 0
             135:             TypePointer Private 119(bool)
             138:             TypePointer Function 6(float)
             142:             TypePointer Private 6(float)
             162:     14(int) Constant 2
             176:     19(int) Constant 9
             177:             TypePointer Uniform 19(int)
             191:     14(int) Constant 3
             192:             TypePointer Input 6(float)
             197:     19(int) Constant 4
             201:     82(ptr) Variable Output
             203:             TypeVector 6(float) 2
             204:             TypePointer Output 203(fvec2)
205(vs_TEXCOORD0):    204(ptr) Variable Output
             206:             TypePointer Input 203(fvec2)
             207:    206(ptr) Variable Input
             209:     19(int) Constant 6
218(vs_TEXCOORD1):     82(ptr) Variable Output
             249:     19(int) Constant 7
             250:             TypePointer Uniform 6(float)
             253:     19(int) Constant 8
             257:    6(float) Constant 1048576000
             258:  203(fvec2) ConstantComposite 257 257
266(vs_TEXCOORD2):     82(ptr) Variable Output
             272:     19(int) Constant 5
             275:    6(float) Constant 3499426553
             276:    7(fvec4) ConstantComposite 275 275 275 275
             279:    6(float) Constant 1351942905
             280:    7(fvec4) ConstantComposite 279 279 279 279
             284:    6(float) Constant 1073741824
             285:  203(fvec2) ConstantComposite 284 284
             301:             TypePointer Output 6(float)
             307:             TypePointer Function 7(fvec4)
             309:             TypeVector 19(int) 4
             310:             TypePointer Function 309(ivec4)
             312:             TypePointer Function 128(bvec4)
             314:             TypeVector 14(int) 4
             315:             TypePointer Function 314(ivec4)
               4:           2 Function None 3
               5:             Label
             132:    131(ptr) Variable Function
             139:    138(ptr) Variable Function
             152:    138(ptr) Variable Function
             165:    138(ptr) Variable Function
             181:    131(ptr) Variable Function
             308:    307(ptr) Variable Function
             311:    310(ptr) Variable Function
             313:    312(ptr) Variable Function
             316:    315(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 22 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 22 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 22 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 22 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 22 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 22 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 22 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 22 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              88:    7(fvec4) Load 87
              89:   84(fvec3) VectorShuffle 88 88 0 1 2
              92:   84(fvec3) FMul 89 91
              95:   84(fvec3) FAdd 92 94
                              Store 86 95
              96:    7(fvec4) Load 87
              97:   84(fvec3) VectorShuffle 96 96 0 1 2
              98:   84(fvec3) Load 86
              99:   84(fvec3) FMul 97 98
             102:   84(fvec3) FAdd 99 101
                              Store 86 102
             103:    7(fvec4) Load 87
             104:   84(fvec3) VectorShuffle 103 103 0 1 2
             105:   84(fvec3) Load 86
             106:   84(fvec3) FMul 104 105
             109:   84(fvec3) FAdd 106 108
                              Store 86 109
             111:    7(fvec4) Load 87
             112:   84(fvec3) VectorShuffle 111 111 0 1 2
             115:   84(fvec3) FMul 112 114
             118:   84(fvec3) FAdd 115 117
                              Store 110 118
             123:    7(fvec4) Load 87
             124:    7(fvec4) VectorShuffle 123 123 0 1 2 0
             129:  128(bvec4) FOrdLessThan 124 127
             130:  120(bvec3) VectorShuffle 129 129 0 1 2
                              Store 122 130
             133:   84(fvec3) Load 86
                              Store 132 133
             136:    135(ptr) AccessChain 122 134
             137:   119(bool) Load 136
                              SelectionMerge 141 None
                              BranchConditional 137 140 145
             140:               Label
             143:    142(ptr)   AccessChain 110 134
             144:    6(float)   Load 143
                                Store 139 144
                                Branch 141
             145:               Label
             146:    142(ptr)   AccessChain 86 134
             147:    6(float)   Load 146
                                Store 139 147
                                Branch 141
             141:             Label
             148:    6(float) Load 139
             149:    138(ptr) AccessChain 132 134
                              Store 149 148
             150:    135(ptr) AccessChain 122 76
             151:   119(bool) Load 150
                              SelectionMerge 154 None
                              BranchConditional 151 153 157
             153:               Label
             155:    142(ptr)   AccessChain 110 76
             156:    6(float)   Load 155
                                Store 152 156
                                Branch 154
             157:               Label
             158:    142(ptr)   AccessChain 86 76
             159:    6(float)   Load 158
                                Store 152 159
                                Branch 154
             154:             Label
             160:    6(float) Load 152
             161:    138(ptr) AccessChain 132 76
                              Store 161 160
             163:    135(ptr) AccessChain 122 162
             164:   119(bool) Load 163
                              SelectionMerge 167 None
                              BranchConditional 164 166 170
             166:               Label
             168:    142(ptr)   AccessChain 110 162
             169:    6(float)   Load 168
                                Store 165 169
                                Branch 167
             170:               Label
             171:    142(ptr)   AccessChain 86 162
             172:    6(float)   Load 171
                                Store 165 172
                                Branch 167
             167:             Label
             173:    6(float) Load 165
             174:    138(ptr) AccessChain 132 162
                              Store 174 173
             175:   84(fvec3) Load 132
                              Store 86 175
             178:    177(ptr) AccessChain 22 176
             179:     19(int) Load 178
             180:   119(bool) INotEqual 179 28
                              SelectionMerge 183 None
                              BranchConditional 180 182 185
             182:               Label
             184:   84(fvec3)   Load 86
                                Store 181 184
                                Branch 183
             185:               Label
             186:    7(fvec4)   Load 87
             187:   84(fvec3)   VectorShuffle 186 186 0 1 2
                                Store 181 187
                                Branch 183
             183:             Label
             188:   84(fvec3) Load 181
             189:    7(fvec4) Load 49
             190:    7(fvec4) VectorShuffle 189 188 4 5 6 3
                              Store 49 190
             193:    192(ptr) AccessChain 87 191
             194:    6(float) Load 193
             195:    142(ptr) AccessChain 49 191
                              Store 195 194
             196:    7(fvec4) Load 49
             198:     24(ptr) AccessChain 22 197
             199:    7(fvec4) Load 198
             200:    7(fvec4) FMul 196 199
                              Store 49 200
             202:    7(fvec4) Load 49
                              Store 201 202
             208:  203(fvec2) Load 207
             210:     24(ptr) AccessChain 22 209
             211:    7(fvec4) Load 210
             212:  203(fvec2) VectorShuffle 211 211 0 1
             213:  203(fvec2) FMul 208 212
             214:     24(ptr) AccessChain 22 209
             215:    7(fvec4) Load 214
             216:  203(fvec2) VectorShuffle 215 215 2 3
             217:  203(fvec2) FAdd 213 216
                              Store 205(vs_TEXCOORD0) 217
             219:    7(fvec4) Load 11
                              Store 218(vs_TEXCOORD1) 219
             220:     24(ptr) AccessChain 22 28
             221:    7(fvec4) Load 220
             222:  203(fvec2) VectorShuffle 221 221 1 1
             223:     24(ptr) AccessChain 22 36 23
             224:    7(fvec4) Load 223
             225:  203(fvec2) VectorShuffle 224 224 0 1
             226:  203(fvec2) FMul 222 225
             227:    7(fvec4) Load 9
             228:    7(fvec4) VectorShuffle 227 226 4 5 2 3
                              Store 9 228
             229:     24(ptr) AccessChain 22 36 28
             230:    7(fvec4) Load 229
             231:  203(fvec2) VectorShuffle 230 230 0 1
             232:     24(ptr) AccessChain 22 28
             233:    7(fvec4) Load 232
             234:  203(fvec2) VectorShuffle 233 233 0 0
             235:  203(fvec2) FMul 231 234
             236:    7(fvec4) Load 9
             237:  203(fvec2) VectorShuffle 236 236 0 1
             238:  203(fvec2) FAdd 235 237
             239:    7(fvec4) Load 9
             240:    7(fvec4) VectorShuffle 239 238 4 5 2 3
                              Store 9 240
             241:    7(fvec4) Load 9
             242:  203(fvec2) VectorShuffle 241 241 3 3
             243:    7(fvec4) Load 9
             244:  203(fvec2) VectorShuffle 243 243 0 1
             245:  203(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 244
             246:  203(fvec2) FDiv 242 245
             247:    7(fvec4) Load 9
             248:    7(fvec4) VectorShuffle 247 246 4 5 2 3
                              Store 9 248
             251:    250(ptr) AccessChain 22 249
             252:    6(float) Load 251
             254:    250(ptr) AccessChain 22 253
             255:    6(float) Load 254
             256:  203(fvec2) CompositeConstruct 252 255
             259:  203(fvec2) FMul 256 258
             260:    7(fvec4) Load 9
             261:  203(fvec2) VectorShuffle 260 260 0 1
             262:  203(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 261
             263:  203(fvec2) FAdd 259 262
             264:    7(fvec4) Load 9
             265:    7(fvec4) VectorShuffle 264 263 4 5 2 3
                              Store 9 265
             267:    7(fvec4) Load 9
             268:  203(fvec2) VectorShuffle 267 267 0 1
             269:  203(fvec2) FDiv 258 268
             270:    7(fvec4) Load 266(vs_TEXCOORD2)
             271:    7(fvec4) VectorShuffle 270 269 0 1 4 5
                              Store 266(vs_TEXCOORD2) 271
             273:     24(ptr) AccessChain 22 272
             274:    7(fvec4) Load 273
             277:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 274 276
                              Store 9 277
             278:    7(fvec4) Load 9
             281:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 278 280
                              Store 9 281
             282:    7(fvec4) Load 11
             283:  203(fvec2) VectorShuffle 282 282 0 1
             286:  203(fvec2) FMul 283 285
             287:    7(fvec4) Load 9
             288:  203(fvec2) VectorShuffle 287 287 0 1
             289:  203(fvec2) FNegate 288
             290:  203(fvec2) FAdd 286 289
             291:    7(fvec4) Load 9
             292:    7(fvec4) VectorShuffle 291 290 4 5 2 3
                              Store 9 292
             293:    7(fvec4) Load 9
             294:  203(fvec2) VectorShuffle 293 293 2 3
             295:  203(fvec2) FNegate 294
             296:    7(fvec4) Load 9
             297:  203(fvec2) VectorShuffle 296 296 0 1
             298:  203(fvec2) FAdd 295 297
             299:    7(fvec4) Load 266(vs_TEXCOORD2)
             300:    7(fvec4) VectorShuffle 299 298 4 5 2 3
                              Store 266(vs_TEXCOORD2) 300
             302:    301(ptr) AccessChain 80 28 76
             303:    6(float) Load 302
             304:    6(float) FNegate 303
             305:    301(ptr) AccessChain 80 28 76
                              Store 305 304
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 88

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 39 63
                              ExecutionMode 4 OriginUpperLeft
                              Name 39  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 35 RelaxedPrecision
                              Decorate 35 DescriptorSet 0
                              Decorate 35 Binding 0
                              Decorate 36 RelaxedPrecision
                              Decorate 39(vs_TEXCOORD0) Location 1
                              Decorate 41 RelaxedPrecision
                              Decorate 43 RelaxedPrecision
                              MemberDecorate 44 0 RelaxedPrecision
                              MemberDecorate 44 0 Offset 0
                              Decorate 44 Block
                              Decorate 46 DescriptorSet 1
                              Decorate 46 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 54 RelaxedPrecision
                              Decorate 55 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 63 RelaxedPrecision
                              Decorate 63 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypeSampledImage 32
              34:             TypePointer UniformConstant 33
              35:     34(ptr) Variable UniformConstant
              37:             TypeVector 6(float) 2
              38:             TypePointer Input 37(fvec2)
39(vs_TEXCOORD0):     38(ptr) Variable Input
              42:      8(ptr) Variable Private
              44:             TypeStruct 7(fvec4)
              45:             TypePointer Uniform 44(struct)
              46:     45(ptr) Variable Uniform
              47:             TypeInt 32 1
              48:     47(int) Constant 0
              49:             TypePointer Uniform 7(fvec4)
              53:             TypeVector 6(float) 3
              58:      8(ptr) Variable Private
              62:             TypePointer Output 7(fvec4)
              63:     62(ptr) Variable Output
              73:             TypePointer Output 6(float)
              76:             TypePointer Function 7(fvec4)
              78:             TypeVector 47(int) 4
              79:             TypePointer Function 78(ivec4)
              81:             TypeBool
              82:             TypeVector 81(bool) 4
              83:             TypePointer Function 82(bvec4)
              85:             TypeVector 12(int) 4
              86:             TypePointer Function 85(ivec4)
               4:           2 Function None 3
               5:             Label
              77:     76(ptr) Variable Function
              80:     79(ptr) Variable Function
              84:     83(ptr) Variable Function
              87:     86(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              36:          33 Load 35
              40:   37(fvec2) Load 39(vs_TEXCOORD0)
              41:    7(fvec4) ImageSampleImplicitLod 36 40
                              Store 31 41
              43:    7(fvec4) Load 31
              50:     49(ptr) AccessChain 46 48
              51:    7(fvec4) Load 50
              52:    7(fvec4) FAdd 43 51
                              Store 42 52
              54:    7(fvec4) Load 11
              55:   53(fvec3) VectorShuffle 54 54 0 1 2
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 55 4 5 6 3
                              Store 9 57
              59:    7(fvec4) Load 9
              60:    7(fvec4) Load 42
              61:    7(fvec4) FMul 59 60
                              Store 58 61
              64:    7(fvec4) Load 58
              65:   53(fvec3) VectorShuffle 64 64 3 3 3
              66:    7(fvec4) Load 58
              67:   53(fvec3) VectorShuffle 66 66 0 1 2
              68:   53(fvec3) FMul 65 67
              69:    7(fvec4) Load 63
              70:    7(fvec4) VectorShuffle 69 68 4 5 6 3
                              Store 63 70
              71:     20(ptr) AccessChain 58 13
              72:    6(float) Load 71
              74:     73(ptr) AccessChain 63 13
                              Store 74 72
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: STEREO_MULTIVIEW_ON
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 0, used in: Fragment  no sampler

Constant Buffer "PGlobals927148634" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "UnityStereoGlobals" (1088 bytes) on set: 1, binding: 2, used in: Vertex  {
  Matrix4x4 unity_StereoMatrixP[2] at 0
  Matrix4x4 unity_StereoMatrixVP[2] at 384
}
Constant Buffer "VGlobals927148634" (140 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 96
  Vector4 _Color at 80
  Vector4 _MainTex_ST at 112
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 128
  Float _UIMaskSoftnessY at 132
  ScalarInt _UIVertexColorAlwaysGammaSpace at 136
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 347

                              Capability Shader
                              Capability MultiView
                              Extension  "SPV_KHR_multiview"
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 50 108 114 226 230 232 243 294 329
                              Name 230  "vs_TEXCOORD0"
                              Name 243  "vs_TEXCOORD1"
                              Name 294  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              MemberDecorate 18 2 RelaxedPrecision
                              MemberDecorate 18 2 Offset 80
                              MemberDecorate 18 3 Offset 96
                              MemberDecorate 18 4 Offset 112
                              MemberDecorate 18 5 Offset 128
                              MemberDecorate 18 6 Offset 132
                              MemberDecorate 18 7 Offset 136
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              Decorate 50 BuiltIn ViewIndex
                              Decorate 58 ArrayStride 16
                              Decorate 59 ArrayStride 16
                              Decorate 60 ArrayStride 16
                              Decorate 61 ArrayStride 16
                              Decorate 62 ArrayStride 16
                              Decorate 63 ArrayStride 16
                              Decorate 64 ArrayStride 16
                              Decorate 65 ArrayStride 16
                              Decorate 68 ArrayStride 16
                              Decorate 69 ArrayStride 16
                              MemberDecorate 70 0 Offset 0
                              MemberDecorate 70 1 Offset 128
                              MemberDecorate 70 2 Offset 256
                              MemberDecorate 70 3 Offset 384
                              MemberDecorate 70 4 Offset 512
                              MemberDecorate 70 5 Offset 640
                              MemberDecorate 70 6 Offset 768
                              MemberDecorate 70 7 Offset 896
                              MemberDecorate 70 8 Offset 1024
                              MemberDecorate 70 9 Offset 1056
                              Decorate 70 Block
                              Decorate 72 DescriptorSet 1
                              Decorate 72 Binding 2
                              MemberDecorate 106 0 BuiltIn Position
                              MemberDecorate 106 1 BuiltIn PointSize
                              MemberDecorate 106 2 BuiltIn ClipDistance
                              Decorate 106 Block
                              Decorate 113 RelaxedPrecision
                              Decorate 114 Location 1
                              Decorate 125 RelaxedPrecision
                              Decorate 132 RelaxedPrecision
                              Decorate 137 RelaxedPrecision
                              Decorate 160 RelaxedPrecision
                              Decorate 166 RelaxedPrecision
                              Decorate 171 RelaxedPrecision
                              Decorate 174 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 179 RelaxedPrecision
                              Decorate 183 RelaxedPrecision
                              Decorate 186 RelaxedPrecision
                              Decorate 187 RelaxedPrecision
                              Decorate 191 RelaxedPrecision
                              Decorate 195 RelaxedPrecision
                              Decorate 198 RelaxedPrecision
                              Decorate 199 RelaxedPrecision
                              Decorate 210 RelaxedPrecision
                              Decorate 224 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 226 Location 0
                              Decorate 230(vs_TEXCOORD0) Location 1
                              Decorate 232 Location 2
                              Decorate 243(vs_TEXCOORD1) Location 2
                              Decorate 294(vs_TEXCOORD2) Location 3
                              Decorate 329 Flat
                              Decorate 329 Location 4
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeInt 32 1
              18:             TypeStruct 7(fvec4) 16 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float) 17(int)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:     17(int) Constant 1
              22:             TypePointer Uniform 7(fvec4)
              26:     17(int) Constant 0
              34:     17(int) Constant 2
              43:     17(int) Constant 3
              47:             TypePointer Private 17(int)
              48:     47(ptr) Variable Private
              49:             TypePointer Input 14(int)
              50:     49(ptr) Variable Input
              54:      8(ptr) Variable Private
              57:     14(int) Constant 8
              58:             TypeArray 7(fvec4) 57
              59:             TypeArray 7(fvec4) 57
              60:             TypeArray 7(fvec4) 57
              61:             TypeArray 7(fvec4) 57
              62:             TypeArray 7(fvec4) 57
              63:             TypeArray 7(fvec4) 57
              64:             TypeArray 7(fvec4) 57
              65:             TypeArray 7(fvec4) 57
              66:             TypeVector 6(float) 3
              67:     14(int) Constant 2
              68:             TypeArray 66(fvec3) 67
              69:             TypeArray 7(fvec4) 67
              70:             TypeStruct 58 59 60 61 62 63 64 65 68 69
              71:             TypePointer Uniform 70(struct)
              72:     71(ptr) Variable Uniform
             104:     14(int) Constant 1
             105:             TypeArray 6(float) 104
             106:             TypeStruct 7(fvec4) 6(float) 105
             107:             TypePointer Output 106(struct)
             108:    107(ptr) Variable Output
             110:             TypePointer Output 7(fvec4)
             112:             TypePointer Private 66(fvec3)
             113:    112(ptr) Variable Private
             114:     10(ptr) Variable Input
             117:    6(float) Constant 1049109012
             118:   66(fvec3) ConstantComposite 117 117 117
             120:    6(float) Constant 1060933829
             121:   66(fvec3) ConstantComposite 120 120 120
             127:    6(float) Constant 3156252646
             128:   66(fvec3) ConstantComposite 127 127 127
             134:    6(float) Constant 995198018
             135:   66(fvec3) ConstantComposite 134 134 134
             137:    112(ptr) Variable Private
             140:    6(float) Constant 1034814791
             141:   66(fvec3) ConstantComposite 140 140 140
             143:    6(float) Constant 3106599620
             144:   66(fvec3) ConstantComposite 143 143 143
             146:             TypeBool
             147:             TypeVector 146(bool) 3
             148:             TypePointer Private 147(bvec3)
             149:    148(ptr) Variable Private
             152:    6(float) Constant 1033147538
             153:    6(float) Constant 0
             154:    7(fvec4) ConstantComposite 152 152 152 153
             155:             TypeVector 146(bool) 4
             158:             TypePointer Function 66(fvec3)
             161:     14(int) Constant 0
             162:             TypePointer Private 146(bool)
             165:             TypePointer Function 6(float)
             169:             TypePointer Private 6(float)
             202:     17(int) Constant 7
             203:             TypePointer Uniform 17(int)
             217:     14(int) Constant 3
             218:             TypePointer Input 6(float)
             226:    110(ptr) Variable Output
             228:             TypeVector 6(float) 2
             229:             TypePointer Output 228(fvec2)
230(vs_TEXCOORD0):    229(ptr) Variable Output
             231:             TypePointer Input 228(fvec2)
             232:    231(ptr) Variable Input
             234:     17(int) Constant 4
243(vs_TEXCOORD1):    110(ptr) Variable Output
             277:     17(int) Constant 5
             278:             TypePointer Uniform 6(float)
             281:     17(int) Constant 6
             285:    6(float) Constant 1048576000
             286:  228(fvec2) ConstantComposite 285 285
294(vs_TEXCOORD2):    110(ptr) Variable Output
             302:    6(float) Constant 3499426553
             303:    7(fvec4) ConstantComposite 302 302 302 302
             306:    6(float) Constant 1351942905
             307:    7(fvec4) ConstantComposite 306 306 306 306
             311:    6(float) Constant 1073741824
             312:  228(fvec2) ConstantComposite 311 311
             328:             TypePointer Output 14(int)
             329:    328(ptr) Variable Output
             331:             TypePointer Output 6(float)
             337:             TypePointer Function 7(fvec4)
             339:             TypeVector 17(int) 4
             340:             TypePointer Function 339(ivec4)
             342:             TypePointer Function 155(bvec4)
             344:             TypeVector 14(int) 4
             345:             TypePointer Function 344(ivec4)
               4:           2 Function None 3
               5:             Label
             159:    158(ptr) Variable Function
             166:    165(ptr) Variable Function
             179:    165(ptr) Variable Function
             191:    165(ptr) Variable Function
             207:    158(ptr) Variable Function
             338:    337(ptr) Variable Function
             341:    340(ptr) Variable Function
             343:    342(ptr) Variable Function
             346:    345(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              23:     22(ptr) AccessChain 20 21 21
              24:    7(fvec4) Load 23
              25:    7(fvec4) FMul 13 24
                              Store 9 25
              27:     22(ptr) AccessChain 20 21 26
              28:    7(fvec4) Load 27
              29:    7(fvec4) Load 11
              30:    7(fvec4) VectorShuffle 29 29 0 0 0 0
              31:    7(fvec4) FMul 28 30
              32:    7(fvec4) Load 9
              33:    7(fvec4) FAdd 31 32
                              Store 9 33
              35:     22(ptr) AccessChain 20 21 34
              36:    7(fvec4) Load 35
              37:    7(fvec4) Load 11
              38:    7(fvec4) VectorShuffle 37 37 2 2 2 2
              39:    7(fvec4) FMul 36 38
              40:    7(fvec4) Load 9
              41:    7(fvec4) FAdd 39 40
                              Store 9 41
              42:    7(fvec4) Load 9
              44:     22(ptr) AccessChain 20 21 43
              45:    7(fvec4) Load 44
              46:    7(fvec4) FAdd 42 45
                              Store 9 46
              51:     14(int) Load 50
              52:     17(int) Bitcast 51
              53:     17(int) ShiftLeftLogical 52 34
                              Store 48 53
              55:    7(fvec4) Load 9
              56:    7(fvec4) VectorShuffle 55 55 1 1 1 1
              73:     17(int) Load 48
              74:     17(int) IAdd 73 21
              75:     22(ptr) AccessChain 72 43 74
              76:    7(fvec4) Load 75
              77:    7(fvec4) FMul 56 76
                              Store 54 77
              78:     17(int) Load 48
              79:     22(ptr) AccessChain 72 43 78
              80:    7(fvec4) Load 79
              81:    7(fvec4) Load 9
              82:    7(fvec4) VectorShuffle 81 81 0 0 0 0
              83:    7(fvec4) FMul 80 82
              84:    7(fvec4) Load 54
              85:    7(fvec4) FAdd 83 84
                              Store 54 85
              86:     17(int) Load 48
              87:     17(int) IAdd 86 34
              88:     22(ptr) AccessChain 72 43 87
              89:    7(fvec4) Load 88
              90:    7(fvec4) Load 9
              91:    7(fvec4) VectorShuffle 90 90 2 2 2 2
              92:    7(fvec4) FMul 89 91
              93:    7(fvec4) Load 54
              94:    7(fvec4) FAdd 92 93
                              Store 54 94
              95:     17(int) Load 48
              96:     17(int) IAdd 95 43
              97:     22(ptr) AccessChain 72 43 96
              98:    7(fvec4) Load 97
              99:    7(fvec4) Load 9
             100:    7(fvec4) VectorShuffle 99 99 3 3 3 3
             101:    7(fvec4) FMul 98 100
             102:    7(fvec4) Load 54
             103:    7(fvec4) FAdd 101 102
                              Store 9 103
             109:    7(fvec4) Load 9
             111:    110(ptr) AccessChain 108 26
                              Store 111 109
             115:    7(fvec4) Load 114
             116:   66(fvec3) VectorShuffle 115 115 0 1 2
             119:   66(fvec3) FMul 116 118
             122:   66(fvec3) FAdd 119 121
                              Store 113 122
             123:    7(fvec4) Load 114
             124:   66(fvec3) VectorShuffle 123 123 0 1 2
             125:   66(fvec3) Load 113
             126:   66(fvec3) FMul 124 125
             129:   66(fvec3) FAdd 126 128
                              Store 113 129
             130:    7(fvec4) Load 114
             131:   66(fvec3) VectorShuffle 130 130 0 1 2
             132:   66(fvec3) Load 113
             133:   66(fvec3) FMul 131 132
             136:   66(fvec3) FAdd 133 135
                              Store 113 136
             138:    7(fvec4) Load 114
             139:   66(fvec3) VectorShuffle 138 138 0 1 2
             142:   66(fvec3) FMul 139 141
             145:   66(fvec3) FAdd 142 144
                              Store 137 145
             150:    7(fvec4) Load 114
             151:    7(fvec4) VectorShuffle 150 150 0 1 2 0
             156:  155(bvec4) FOrdLessThan 151 154
             157:  147(bvec3) VectorShuffle 156 156 0 1 2
                              Store 149 157
             160:   66(fvec3) Load 113
                              Store 159 160
             163:    162(ptr) AccessChain 149 161
             164:   146(bool) Load 163
                              SelectionMerge 168 None
                              BranchConditional 164 167 172
             167:               Label
             170:    169(ptr)   AccessChain 137 161
             171:    6(float)   Load 170
                                Store 166 171
                                Branch 168
             172:               Label
             173:    169(ptr)   AccessChain 113 161
             174:    6(float)   Load 173
                                Store 166 174
                                Branch 168
             168:             Label
             175:    6(float) Load 166
             176:    165(ptr) AccessChain 159 161
                              Store 176 175
             177:    162(ptr) AccessChain 149 104
             178:   146(bool) Load 177
                              SelectionMerge 181 None
                              BranchConditional 178 180 184
             180:               Label
             182:    169(ptr)   AccessChain 137 104
             183:    6(float)   Load 182
                                Store 179 183
                                Branch 181
             184:               Label
             185:    169(ptr)   AccessChain 113 104
             186:    6(float)   Load 185
                                Store 179 186
                                Branch 181
             181:             Label
             187:    6(float) Load 179
             188:    165(ptr) AccessChain 159 104
                              Store 188 187
             189:    162(ptr) AccessChain 149 67
             190:   146(bool) Load 189
                              SelectionMerge 193 None
                              BranchConditional 190 192 196
             192:               Label
             194:    169(ptr)   AccessChain 137 67
             195:    6(float)   Load 194
                                Store 191 195
                                Branch 193
             196:               Label
             197:    169(ptr)   AccessChain 113 67
             198:    6(float)   Load 197
                                Store 191 198
                                Branch 193
             193:             Label
             199:    6(float) Load 191
             200:    165(ptr) AccessChain 159 67
                              Store 200 199
             201:   66(fvec3) Load 159
                              Store 113 201
             204:    203(ptr) AccessChain 20 202
             205:     17(int) Load 204
             206:   146(bool) INotEqual 205 26
                              SelectionMerge 209 None
                              BranchConditional 206 208 211
             208:               Label
             210:   66(fvec3)   Load 113
                                Store 207 210
                                Branch 209
             211:               Label
             212:    7(fvec4)   Load 114
             213:   66(fvec3)   VectorShuffle 212 212 0 1 2
                                Store 207 213
                                Branch 209
             209:             Label
             214:   66(fvec3) Load 207
             215:    7(fvec4) Load 54
             216:    7(fvec4) VectorShuffle 215 214 4 5 6 3
                              Store 54 216
             219:    218(ptr) AccessChain 114 217
             220:    6(float) Load 219
             221:    169(ptr) AccessChain 54 217
                              Store 221 220
             222:    7(fvec4) Load 54
             223:     22(ptr) AccessChain 20 34
             224:    7(fvec4) Load 223
             225:    7(fvec4) FMul 222 224
                              Store 54 225
             227:    7(fvec4) Load 54
                              Store 226 227
             233:  228(fvec2) Load 232
             235:     22(ptr) AccessChain 20 234
             236:    7(fvec4) Load 235
             237:  228(fvec2) VectorShuffle 236 236 0 1
             238:  228(fvec2) FMul 233 237
             239:     22(ptr) AccessChain 20 234
             240:    7(fvec4) Load 239
             241:  228(fvec2) VectorShuffle 240 240 2 3
             242:  228(fvec2) FAdd 238 241
                              Store 230(vs_TEXCOORD0) 242
             244:    7(fvec4) Load 11
                              Store 243(vs_TEXCOORD1) 244
             245:     22(ptr) AccessChain 20 26
             246:    7(fvec4) Load 245
             247:  228(fvec2) VectorShuffle 246 246 1 1
             248:     17(int) Load 48
             249:     17(int) IAdd 248 21
             250:     22(ptr) AccessChain 72 26 249
             251:    7(fvec4) Load 250
             252:  228(fvec2) VectorShuffle 251 251 0 1
             253:  228(fvec2) FMul 247 252
             254:    7(fvec4) Load 9
             255:    7(fvec4) VectorShuffle 254 253 4 5 2 3
                              Store 9 255
             256:     17(int) Load 48
             257:     22(ptr) AccessChain 72 26 256
             258:    7(fvec4) Load 257
             259:  228(fvec2) VectorShuffle 258 258 0 1
             260:     22(ptr) AccessChain 20 26
             261:    7(fvec4) Load 260
             262:  228(fvec2) VectorShuffle 261 261 0 0
             263:  228(fvec2) FMul 259 262
             264:    7(fvec4) Load 9
             265:  228(fvec2) VectorShuffle 264 264 0 1
             266:  228(fvec2) FAdd 263 265
             267:    7(fvec4) Load 9
             268:    7(fvec4) VectorShuffle 267 266 4 5 2 3
                              Store 9 268
             269:    7(fvec4) Load 9
             270:  228(fvec2) VectorShuffle 269 269 3 3
             271:    7(fvec4) Load 9
             272:  228(fvec2) VectorShuffle 271 271 0 1
             273:  228(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 272
             274:  228(fvec2) FDiv 270 273
             275:    7(fvec4) Load 9
             276:    7(fvec4) VectorShuffle 275 274 4 5 2 3
                              Store 9 276
             279:    278(ptr) AccessChain 20 277
             280:    6(float) Load 279
             282:    278(ptr) AccessChain 20 281
             283:    6(float) Load 282
             284:  228(fvec2) CompositeConstruct 280 283
             287:  228(fvec2) FMul 284 286
             288:    7(fvec4) Load 9
             289:  228(fvec2) VectorShuffle 288 288 0 1
             290:  228(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 289
             291:  228(fvec2) FAdd 287 290
             292:    7(fvec4) Load 9
             293:    7(fvec4) VectorShuffle 292 291 4 5 2 3
                              Store 9 293
             295:    7(fvec4) Load 9
             296:  228(fvec2) VectorShuffle 295 295 0 1
             297:  228(fvec2) FDiv 286 296
             298:    7(fvec4) Load 294(vs_TEXCOORD2)
             299:    7(fvec4) VectorShuffle 298 297 0 1 4 5
                              Store 294(vs_TEXCOORD2) 299
             300:     22(ptr) AccessChain 20 43
             301:    7(fvec4) Load 300
             304:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 301 303
                              Store 9 304
             305:    7(fvec4) Load 9
             308:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 305 307
                              Store 9 308
             309:    7(fvec4) Load 11
             310:  228(fvec2) VectorShuffle 309 309 0 1
             313:  228(fvec2) FMul 310 312
             314:    7(fvec4) Load 9
             315:  228(fvec2) VectorShuffle 314 314 0 1
             316:  228(fvec2) FNegate 315
             317:  228(fvec2) FAdd 313 316
             318:    7(fvec4) Load 9
             319:    7(fvec4) VectorShuffle 318 317 4 5 2 3
                              Store 9 319
             320:    7(fvec4) Load 9
             321:  228(fvec2) VectorShuffle 320 320 2 3
             322:  228(fvec2) FNegate 321
             323:    7(fvec4) Load 9
             324:  228(fvec2) VectorShuffle 323 323 0 1
             325:  228(fvec2) FAdd 322 324
             326:    7(fvec4) Load 294(vs_TEXCOORD2)
             327:    7(fvec4) VectorShuffle 326 325 4 5 2 3
                              Store 294(vs_TEXCOORD2) 327
             330:     14(int) Load 50
                              Store 329 330
             332:    331(ptr) AccessChain 108 26 104
             333:    6(float) Load 332
             334:    6(float) FNegate 333
             335:    331(ptr) AccessChain 108 26 104
                              Store 335 334
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 88

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 39 63
                              ExecutionMode 4 OriginUpperLeft
                              Name 39  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 35 RelaxedPrecision
                              Decorate 35 DescriptorSet 0
                              Decorate 35 Binding 0
                              Decorate 36 RelaxedPrecision
                              Decorate 39(vs_TEXCOORD0) Location 1
                              Decorate 41 RelaxedPrecision
                              Decorate 43 RelaxedPrecision
                              MemberDecorate 44 0 RelaxedPrecision
                              MemberDecorate 44 0 Offset 0
                              Decorate 44 Block
                              Decorate 46 DescriptorSet 1
                              Decorate 46 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 54 RelaxedPrecision
                              Decorate 55 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 63 RelaxedPrecision
                              Decorate 63 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypeSampledImage 32
              34:             TypePointer UniformConstant 33
              35:     34(ptr) Variable UniformConstant
              37:             TypeVector 6(float) 2
              38:             TypePointer Input 37(fvec2)
39(vs_TEXCOORD0):     38(ptr) Variable Input
              42:      8(ptr) Variable Private
              44:             TypeStruct 7(fvec4)
              45:             TypePointer Uniform 44(struct)
              46:     45(ptr) Variable Uniform
              47:             TypeInt 32 1
              48:     47(int) Constant 0
              49:             TypePointer Uniform 7(fvec4)
              53:             TypeVector 6(float) 3
              58:      8(ptr) Variable Private
              62:             TypePointer Output 7(fvec4)
              63:     62(ptr) Variable Output
              73:             TypePointer Output 6(float)
              76:             TypePointer Function 7(fvec4)
              78:             TypeVector 47(int) 4
              79:             TypePointer Function 78(ivec4)
              81:             TypeBool
              82:             TypeVector 81(bool) 4
              83:             TypePointer Function 82(bvec4)
              85:             TypeVector 12(int) 4
              86:             TypePointer Function 85(ivec4)
               4:           2 Function None 3
               5:             Label
              77:     76(ptr) Variable Function
              80:     79(ptr) Variable Function
              84:     83(ptr) Variable Function
              87:     86(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              36:          33 Load 35
              40:   37(fvec2) Load 39(vs_TEXCOORD0)
              41:    7(fvec4) ImageSampleImplicitLod 36 40
                              Store 31 41
              43:    7(fvec4) Load 31
              50:     49(ptr) AccessChain 46 48
              51:    7(fvec4) Load 50
              52:    7(fvec4) FAdd 43 51
                              Store 42 52
              54:    7(fvec4) Load 11
              55:   53(fvec3) VectorShuffle 54 54 0 1 2
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 55 4 5 6 3
                              Store 9 57
              59:    7(fvec4) Load 9
              60:    7(fvec4) Load 42
              61:    7(fvec4) FMul 59 60
                              Store 58 61
              64:    7(fvec4) Load 58
              65:   53(fvec3) VectorShuffle 64 64 3 3 3
              66:    7(fvec4) Load 58
              67:   53(fvec3) VectorShuffle 66 66 0 1 2
              68:   53(fvec3) FMul 65 67
              69:    7(fvec4) Load 63
              70:    7(fvec4) VectorShuffle 69 68 4 5 6 3
                              Store 63 70
              71:     20(ptr) AccessChain 58 13
              72:    6(float) Load 71
              74:     73(ptr) AccessChain 63 13
                              Store 74 72
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 0, used in: Fragment  no sampler

Constant Buffer "PGlobals2360907785" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals2360907785" (268 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
  ScalarInt _UIVertexColorAlwaysGammaSpace at 264
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 317

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 87 201 205 207 218 266
                              Name 205  "vs_TEXCOORD0"
                              Name 218  "vs_TEXCOORD1"
                              Name 266  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 20 0 Offset 0
                              MemberDecorate 20 1 Offset 16
                              MemberDecorate 20 2 Offset 80
                              MemberDecorate 20 3 Offset 144
                              MemberDecorate 20 4 RelaxedPrecision
                              MemberDecorate 20 4 Offset 208
                              MemberDecorate 20 5 Offset 224
                              MemberDecorate 20 6 Offset 240
                              MemberDecorate 20 7 Offset 256
                              MemberDecorate 20 8 Offset 260
                              MemberDecorate 20 9 Offset 264
                              Decorate 20 Block
                              Decorate 22 DescriptorSet 1
                              Decorate 22 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 86 RelaxedPrecision
                              Decorate 87 Location 1
                              Decorate 98 RelaxedPrecision
                              Decorate 105 RelaxedPrecision
                              Decorate 110 RelaxedPrecision
                              Decorate 133 RelaxedPrecision
                              Decorate 139 RelaxedPrecision
                              Decorate 144 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 148 RelaxedPrecision
                              Decorate 152 RelaxedPrecision
                              Decorate 156 RelaxedPrecision
                              Decorate 159 RelaxedPrecision
                              Decorate 160 RelaxedPrecision
                              Decorate 165 RelaxedPrecision
                              Decorate 169 RelaxedPrecision
                              Decorate 172 RelaxedPrecision
                              Decorate 173 RelaxedPrecision
                              Decorate 184 RelaxedPrecision
                              Decorate 199 RelaxedPrecision
                              Decorate 201 RelaxedPrecision
                              Decorate 201 Location 0
                              Decorate 205(vs_TEXCOORD0) Location 1
                              Decorate 207 Location 2
                              Decorate 218(vs_TEXCOORD1) Location 2
                              Decorate 266(vs_TEXCOORD2) Location 3
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeInt 32 1
              20:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float) 19(int)
              21:             TypePointer Uniform 20(struct)
              22:     21(ptr) Variable Uniform
              23:     19(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     19(int) Constant 0
              36:     19(int) Constant 2
              45:     19(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:             TypeVector 6(float) 3
              85:             TypePointer Private 84(fvec3)
              86:     85(ptr) Variable Private
              87:     10(ptr) Variable Input
              90:    6(float) Constant 1049109012
              91:   84(fvec3) ConstantComposite 90 90 90
              93:    6(float) Constant 1060933829
              94:   84(fvec3) ConstantComposite 93 93 93
             100:    6(float) Constant 3156252646
             101:   84(fvec3) ConstantComposite 100 100 100
             107:    6(float) Constant 995198018
             108:   84(fvec3) ConstantComposite 107 107 107
             110:     85(ptr) Variable Private
             113:    6(float) Constant 1034814791
             114:   84(fvec3) ConstantComposite 113 113 113
             116:    6(float) Constant 3106599620
             117:   84(fvec3) ConstantComposite 116 116 116
             119:             TypeBool
             120:             TypeVector 119(bool) 3
             121:             TypePointer Private 120(bvec3)
             122:    121(ptr) Variable Private
             125:    6(float) Constant 1033147538
             126:    6(float) Constant 0
             127:    7(fvec4) ConstantComposite 125 125 125 126
             128:             TypeVector 119(bool) 4
             131:             TypePointer Function 84(fvec3)
             134:     14(int) Constant 0
             135:             TypePointer Private 119(bool)
             138:             TypePointer Function 6(float)
             142:             TypePointer Private 6(float)
             162:     14(int) Constant 2
             176:     19(int) Constant 9
             177:             TypePointer Uniform 19(int)
             191:     14(int) Constant 3
             192:             TypePointer Input 6(float)
             197:     19(int) Constant 4
             201:     82(ptr) Variable Output
             203:             TypeVector 6(float) 2
             204:             TypePointer Output 203(fvec2)
205(vs_TEXCOORD0):    204(ptr) Variable Output
             206:             TypePointer Input 203(fvec2)
             207:    206(ptr) Variable Input
             209:     19(int) Constant 6
218(vs_TEXCOORD1):     82(ptr) Variable Output
             249:     19(int) Constant 7
             250:             TypePointer Uniform 6(float)
             253:     19(int) Constant 8
             257:    6(float) Constant 1048576000
             258:  203(fvec2) ConstantComposite 257 257
266(vs_TEXCOORD2):     82(ptr) Variable Output
             272:     19(int) Constant 5
             275:    6(float) Constant 3499426553
             276:    7(fvec4) ConstantComposite 275 275 275 275
             279:    6(float) Constant 1351942905
             280:    7(fvec4) ConstantComposite 279 279 279 279
             284:    6(float) Constant 1073741824
             285:  203(fvec2) ConstantComposite 284 284
             301:             TypePointer Output 6(float)
             307:             TypePointer Function 7(fvec4)
             309:             TypeVector 19(int) 4
             310:             TypePointer Function 309(ivec4)
             312:             TypePointer Function 128(bvec4)
             314:             TypeVector 14(int) 4
             315:             TypePointer Function 314(ivec4)
               4:           2 Function None 3
               5:             Label
             132:    131(ptr) Variable Function
             139:    138(ptr) Variable Function
             152:    138(ptr) Variable Function
             165:    138(ptr) Variable Function
             181:    131(ptr) Variable Function
             308:    307(ptr) Variable Function
             311:    310(ptr) Variable Function
             313:    312(ptr) Variable Function
             316:    315(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 22 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 22 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 22 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 22 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 22 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 22 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 22 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 22 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              88:    7(fvec4) Load 87
              89:   84(fvec3) VectorShuffle 88 88 0 1 2
              92:   84(fvec3) FMul 89 91
              95:   84(fvec3) FAdd 92 94
                              Store 86 95
              96:    7(fvec4) Load 87
              97:   84(fvec3) VectorShuffle 96 96 0 1 2
              98:   84(fvec3) Load 86
              99:   84(fvec3) FMul 97 98
             102:   84(fvec3) FAdd 99 101
                              Store 86 102
             103:    7(fvec4) Load 87
             104:   84(fvec3) VectorShuffle 103 103 0 1 2
             105:   84(fvec3) Load 86
             106:   84(fvec3) FMul 104 105
             109:   84(fvec3) FAdd 106 108
                              Store 86 109
             111:    7(fvec4) Load 87
             112:   84(fvec3) VectorShuffle 111 111 0 1 2
             115:   84(fvec3) FMul 112 114
             118:   84(fvec3) FAdd 115 117
                              Store 110 118
             123:    7(fvec4) Load 87
             124:    7(fvec4) VectorShuffle 123 123 0 1 2 0
             129:  128(bvec4) FOrdLessThan 124 127
             130:  120(bvec3) VectorShuffle 129 129 0 1 2
                              Store 122 130
             133:   84(fvec3) Load 86
                              Store 132 133
             136:    135(ptr) AccessChain 122 134
             137:   119(bool) Load 136
                              SelectionMerge 141 None
                              BranchConditional 137 140 145
             140:               Label
             143:    142(ptr)   AccessChain 110 134
             144:    6(float)   Load 143
                                Store 139 144
                                Branch 141
             145:               Label
             146:    142(ptr)   AccessChain 86 134
             147:    6(float)   Load 146
                                Store 139 147
                                Branch 141
             141:             Label
             148:    6(float) Load 139
             149:    138(ptr) AccessChain 132 134
                              Store 149 148
             150:    135(ptr) AccessChain 122 76
             151:   119(bool) Load 150
                              SelectionMerge 154 None
                              BranchConditional 151 153 157
             153:               Label
             155:    142(ptr)   AccessChain 110 76
             156:    6(float)   Load 155
                                Store 152 156
                                Branch 154
             157:               Label
             158:    142(ptr)   AccessChain 86 76
             159:    6(float)   Load 158
                                Store 152 159
                                Branch 154
             154:             Label
             160:    6(float) Load 152
             161:    138(ptr) AccessChain 132 76
                              Store 161 160
             163:    135(ptr) AccessChain 122 162
             164:   119(bool) Load 163
                              SelectionMerge 167 None
                              BranchConditional 164 166 170
             166:               Label
             168:    142(ptr)   AccessChain 110 162
             169:    6(float)   Load 168
                                Store 165 169
                                Branch 167
             170:               Label
             171:    142(ptr)   AccessChain 86 162
             172:    6(float)   Load 171
                                Store 165 172
                                Branch 167
             167:             Label
             173:    6(float) Load 165
             174:    138(ptr) AccessChain 132 162
                              Store 174 173
             175:   84(fvec3) Load 132
                              Store 86 175
             178:    177(ptr) AccessChain 22 176
             179:     19(int) Load 178
             180:   119(bool) INotEqual 179 28
                              SelectionMerge 183 None
                              BranchConditional 180 182 185
             182:               Label
             184:   84(fvec3)   Load 86
                                Store 181 184
                                Branch 183
             185:               Label
             186:    7(fvec4)   Load 87
             187:   84(fvec3)   VectorShuffle 186 186 0 1 2
                                Store 181 187
                                Branch 183
             183:             Label
             188:   84(fvec3) Load 181
             189:    7(fvec4) Load 49
             190:    7(fvec4) VectorShuffle 189 188 4 5 6 3
                              Store 49 190
             193:    192(ptr) AccessChain 87 191
             194:    6(float) Load 193
             195:    142(ptr) AccessChain 49 191
                              Store 195 194
             196:    7(fvec4) Load 49
             198:     24(ptr) AccessChain 22 197
             199:    7(fvec4) Load 198
             200:    7(fvec4) FMul 196 199
                              Store 49 200
             202:    7(fvec4) Load 49
                              Store 201 202
             208:  203(fvec2) Load 207
             210:     24(ptr) AccessChain 22 209
             211:    7(fvec4) Load 210
             212:  203(fvec2) VectorShuffle 211 211 0 1
             213:  203(fvec2) FMul 208 212
             214:     24(ptr) AccessChain 22 209
             215:    7(fvec4) Load 214
             216:  203(fvec2) VectorShuffle 215 215 2 3
             217:  203(fvec2) FAdd 213 216
                              Store 205(vs_TEXCOORD0) 217
             219:    7(fvec4) Load 11
                              Store 218(vs_TEXCOORD1) 219
             220:     24(ptr) AccessChain 22 28
             221:    7(fvec4) Load 220
             222:  203(fvec2) VectorShuffle 221 221 1 1
             223:     24(ptr) AccessChain 22 36 23
             224:    7(fvec4) Load 223
             225:  203(fvec2) VectorShuffle 224 224 0 1
             226:  203(fvec2) FMul 222 225
             227:    7(fvec4) Load 9
             228:    7(fvec4) VectorShuffle 227 226 4 5 2 3
                              Store 9 228
             229:     24(ptr) AccessChain 22 36 28
             230:    7(fvec4) Load 229
             231:  203(fvec2) VectorShuffle 230 230 0 1
             232:     24(ptr) AccessChain 22 28
             233:    7(fvec4) Load 232
             234:  203(fvec2) VectorShuffle 233 233 0 0
             235:  203(fvec2) FMul 231 234
             236:    7(fvec4) Load 9
             237:  203(fvec2) VectorShuffle 236 236 0 1
             238:  203(fvec2) FAdd 235 237
             239:    7(fvec4) Load 9
             240:    7(fvec4) VectorShuffle 239 238 4 5 2 3
                              Store 9 240
             241:    7(fvec4) Load 9
             242:  203(fvec2) VectorShuffle 241 241 3 3
             243:    7(fvec4) Load 9
             244:  203(fvec2) VectorShuffle 243 243 0 1
             245:  203(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 244
             246:  203(fvec2) FDiv 242 245
             247:    7(fvec4) Load 9
             248:    7(fvec4) VectorShuffle 247 246 4 5 2 3
                              Store 9 248
             251:    250(ptr) AccessChain 22 249
             252:    6(float) Load 251
             254:    250(ptr) AccessChain 22 253
             255:    6(float) Load 254
             256:  203(fvec2) CompositeConstruct 252 255
             259:  203(fvec2) FMul 256 258
             260:    7(fvec4) Load 9
             261:  203(fvec2) VectorShuffle 260 260 0 1
             262:  203(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 261
             263:  203(fvec2) FAdd 259 262
             264:    7(fvec4) Load 9
             265:    7(fvec4) VectorShuffle 264 263 4 5 2 3
                              Store 9 265
             267:    7(fvec4) Load 9
             268:  203(fvec2) VectorShuffle 267 267 0 1
             269:  203(fvec2) FDiv 258 268
             270:    7(fvec4) Load 266(vs_TEXCOORD2)
             271:    7(fvec4) VectorShuffle 270 269 0 1 4 5
                              Store 266(vs_TEXCOORD2) 271
             273:     24(ptr) AccessChain 22 272
             274:    7(fvec4) Load 273
             277:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 274 276
                              Store 9 277
             278:    7(fvec4) Load 9
             281:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 278 280
                              Store 9 281
             282:    7(fvec4) Load 11
             283:  203(fvec2) VectorShuffle 282 282 0 1
             286:  203(fvec2) FMul 283 285
             287:    7(fvec4) Load 9
             288:  203(fvec2) VectorShuffle 287 287 0 1
             289:  203(fvec2) FNegate 288
             290:  203(fvec2) FAdd 286 289
             291:    7(fvec4) Load 9
             292:    7(fvec4) VectorShuffle 291 290 4 5 2 3
                              Store 9 292
             293:    7(fvec4) Load 9
             294:  203(fvec2) VectorShuffle 293 293 2 3
             295:  203(fvec2) FNegate 294
             296:    7(fvec4) Load 9
             297:  203(fvec2) VectorShuffle 296 296 0 1
             298:  203(fvec2) FAdd 295 297
             299:    7(fvec4) Load 266(vs_TEXCOORD2)
             300:    7(fvec4) VectorShuffle 299 298 4 5 2 3
                              Store 266(vs_TEXCOORD2) 300
             302:    301(ptr) AccessChain 80 28 76
             303:    6(float) Load 302
             304:    6(float) FNegate 303
             305:    301(ptr) AccessChain 80 28 76
                              Store 305 304
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 110

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 39 86
                              ExecutionMode 4 OriginUpperLeft
                              Name 39  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 35 RelaxedPrecision
                              Decorate 35 DescriptorSet 0
                              Decorate 35 Binding 0
                              Decorate 36 RelaxedPrecision
                              Decorate 39(vs_TEXCOORD0) Location 1
                              Decorate 41 RelaxedPrecision
                              Decorate 43 RelaxedPrecision
                              MemberDecorate 44 0 RelaxedPrecision
                              MemberDecorate 44 0 Offset 0
                              Decorate 44 Block
                              Decorate 46 DescriptorSet 1
                              Decorate 46 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 53 RelaxedPrecision
                              Decorate 55 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 78 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 86 RelaxedPrecision
                              Decorate 86 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypeSampledImage 32
              34:             TypePointer UniformConstant 33
              35:     34(ptr) Variable UniformConstant
              37:             TypeVector 6(float) 2
              38:             TypePointer Input 37(fvec2)
39(vs_TEXCOORD0):     38(ptr) Variable Input
              42:      8(ptr) Variable Private
              44:             TypeStruct 7(fvec4)
              45:             TypePointer Uniform 44(struct)
              46:     45(ptr) Variable Uniform
              47:             TypeInt 32 1
              48:     47(int) Constant 0
              49:             TypePointer Uniform 7(fvec4)
              53:     20(ptr) Variable Private
              59:    6(float) Constant 3129152111
              61:             TypeBool
              62:             TypePointer Private 61(bool)
              63:     62(ptr) Variable Private
              65:    6(float) Constant 0
              68:     47(int) Constant 1
              70:     47(int) Constant 4294967295
              76:             TypeVector 6(float) 3
              81:      8(ptr) Variable Private
              85:             TypePointer Output 7(fvec4)
              86:     85(ptr) Variable Output
              96:             TypePointer Output 6(float)
              99:             TypePointer Function 7(fvec4)
             101:             TypeVector 47(int) 4
             102:             TypePointer Function 101(ivec4)
             104:             TypeVector 61(bool) 4
             105:             TypePointer Function 104(bvec4)
             107:             TypeVector 12(int) 4
             108:             TypePointer Function 107(ivec4)
               4:           2 Function None 3
               5:             Label
             100:     99(ptr) Variable Function
             103:    102(ptr) Variable Function
             106:    105(ptr) Variable Function
             109:    108(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              36:          33 Load 35
              40:   37(fvec2) Load 39(vs_TEXCOORD0)
              41:    7(fvec4) ImageSampleImplicitLod 36 40
                              Store 31 41
              43:    7(fvec4) Load 31
              50:     49(ptr) AccessChain 46 48
              51:    7(fvec4) Load 50
              52:    7(fvec4) FAdd 43 51
                              Store 42 52
              54:     20(ptr) AccessChain 9 13
              55:    6(float) Load 54
              56:     20(ptr) AccessChain 42 13
              57:    6(float) Load 56
              58:    6(float) FMul 55 57
              60:    6(float) FAdd 58 59
                              Store 53 60
              64:    6(float) Load 53
              66:    61(bool) FOrdLessThan 64 65
                              Store 63 66
              67:    61(bool) Load 63
              69:     47(int) Select 67 68 48
              71:     47(int) IMul 69 70
              72:    61(bool) INotEqual 71 48
                              SelectionMerge 74 None
                              BranchConditional 72 73 74
              73:               Label
                                Kill
              74:             Label
              77:    7(fvec4) Load 11
              78:   76(fvec3) VectorShuffle 77 77 0 1 2
              79:    7(fvec4) Load 9
              80:    7(fvec4) VectorShuffle 79 78 4 5 6 3
                              Store 9 80
              82:    7(fvec4) Load 9
              83:    7(fvec4) Load 42
              84:    7(fvec4) FMul 82 83
                              Store 81 84
              87:    7(fvec4) Load 81
              88:   76(fvec3) VectorShuffle 87 87 3 3 3
              89:    7(fvec4) Load 81
              90:   76(fvec3) VectorShuffle 89 89 0 1 2
              91:   76(fvec3) FMul 88 90
              92:    7(fvec4) Load 86
              93:    7(fvec4) VectorShuffle 92 91 4 5 6 3
                              Store 86 93
              94:     20(ptr) AccessChain 81 13
              95:    6(float) Load 94
              97:     96(ptr) AccessChain 86 13
                              Store 97 95
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: STEREO_MULTIVIEW_ON UNITY_UI_ALPHACLIP
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 0, used in: Fragment  no sampler

Constant Buffer "PGlobals1227121515" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "UnityStereoGlobals" (1088 bytes) on set: 1, binding: 2, used in: Vertex  {
  Matrix4x4 unity_StereoMatrixP[2] at 0
  Matrix4x4 unity_StereoMatrixVP[2] at 384
}
Constant Buffer "VGlobals1227121515" (140 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 96
  Vector4 _Color at 80
  Vector4 _MainTex_ST at 112
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 128
  Float _UIMaskSoftnessY at 132
  ScalarInt _UIVertexColorAlwaysGammaSpace at 136
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 347

                              Capability Shader
                              Capability MultiView
                              Extension  "SPV_KHR_multiview"
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 50 108 114 226 230 232 243 294 329
                              Name 230  "vs_TEXCOORD0"
                              Name 243  "vs_TEXCOORD1"
                              Name 294  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              MemberDecorate 18 2 RelaxedPrecision
                              MemberDecorate 18 2 Offset 80
                              MemberDecorate 18 3 Offset 96
                              MemberDecorate 18 4 Offset 112
                              MemberDecorate 18 5 Offset 128
                              MemberDecorate 18 6 Offset 132
                              MemberDecorate 18 7 Offset 136
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              Decorate 50 BuiltIn ViewIndex
                              Decorate 58 ArrayStride 16
                              Decorate 59 ArrayStride 16
                              Decorate 60 ArrayStride 16
                              Decorate 61 ArrayStride 16
                              Decorate 62 ArrayStride 16
                              Decorate 63 ArrayStride 16
                              Decorate 64 ArrayStride 16
                              Decorate 65 ArrayStride 16
                              Decorate 68 ArrayStride 16
                              Decorate 69 ArrayStride 16
                              MemberDecorate 70 0 Offset 0
                              MemberDecorate 70 1 Offset 128
                              MemberDecorate 70 2 Offset 256
                              MemberDecorate 70 3 Offset 384
                              MemberDecorate 70 4 Offset 512
                              MemberDecorate 70 5 Offset 640
                              MemberDecorate 70 6 Offset 768
                              MemberDecorate 70 7 Offset 896
                              MemberDecorate 70 8 Offset 1024
                              MemberDecorate 70 9 Offset 1056
                              Decorate 70 Block
                              Decorate 72 DescriptorSet 1
                              Decorate 72 Binding 2
                              MemberDecorate 106 0 BuiltIn Position
                              MemberDecorate 106 1 BuiltIn PointSize
                              MemberDecorate 106 2 BuiltIn ClipDistance
                              Decorate 106 Block
                              Decorate 113 RelaxedPrecision
                              Decorate 114 Location 1
                              Decorate 125 RelaxedPrecision
                              Decorate 132 RelaxedPrecision
                              Decorate 137 RelaxedPrecision
                              Decorate 160 RelaxedPrecision
                              Decorate 166 RelaxedPrecision
                              Decorate 171 RelaxedPrecision
                              Decorate 174 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 179 RelaxedPrecision
                              Decorate 183 RelaxedPrecision
                              Decorate 186 RelaxedPrecision
                              Decorate 187 RelaxedPrecision
                              Decorate 191 RelaxedPrecision
                              Decorate 195 RelaxedPrecision
                              Decorate 198 RelaxedPrecision
                              Decorate 199 RelaxedPrecision
                              Decorate 210 RelaxedPrecision
                              Decorate 224 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 226 Location 0
                              Decorate 230(vs_TEXCOORD0) Location 1
                              Decorate 232 Location 2
                              Decorate 243(vs_TEXCOORD1) Location 2
                              Decorate 294(vs_TEXCOORD2) Location 3
                              Decorate 329 Flat
                              Decorate 329 Location 4
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeInt 32 1
              18:             TypeStruct 7(fvec4) 16 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float) 17(int)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:     17(int) Constant 1
              22:             TypePointer Uniform 7(fvec4)
              26:     17(int) Constant 0
              34:     17(int) Constant 2
              43:     17(int) Constant 3
              47:             TypePointer Private 17(int)
              48:     47(ptr) Variable Private
              49:             TypePointer Input 14(int)
              50:     49(ptr) Variable Input
              54:      8(ptr) Variable Private
              57:     14(int) Constant 8
              58:             TypeArray 7(fvec4) 57
              59:             TypeArray 7(fvec4) 57
              60:             TypeArray 7(fvec4) 57
              61:             TypeArray 7(fvec4) 57
              62:             TypeArray 7(fvec4) 57
              63:             TypeArray 7(fvec4) 57
              64:             TypeArray 7(fvec4) 57
              65:             TypeArray 7(fvec4) 57
              66:             TypeVector 6(float) 3
              67:     14(int) Constant 2
              68:             TypeArray 66(fvec3) 67
              69:             TypeArray 7(fvec4) 67
              70:             TypeStruct 58 59 60 61 62 63 64 65 68 69
              71:             TypePointer Uniform 70(struct)
              72:     71(ptr) Variable Uniform
             104:     14(int) Constant 1
             105:             TypeArray 6(float) 104
             106:             TypeStruct 7(fvec4) 6(float) 105
             107:             TypePointer Output 106(struct)
             108:    107(ptr) Variable Output
             110:             TypePointer Output 7(fvec4)
             112:             TypePointer Private 66(fvec3)
             113:    112(ptr) Variable Private
             114:     10(ptr) Variable Input
             117:    6(float) Constant 1049109012
             118:   66(fvec3) ConstantComposite 117 117 117
             120:    6(float) Constant 1060933829
             121:   66(fvec3) ConstantComposite 120 120 120
             127:    6(float) Constant 3156252646
             128:   66(fvec3) ConstantComposite 127 127 127
             134:    6(float) Constant 995198018
             135:   66(fvec3) ConstantComposite 134 134 134
             137:    112(ptr) Variable Private
             140:    6(float) Constant 1034814791
             141:   66(fvec3) ConstantComposite 140 140 140
             143:    6(float) Constant 3106599620
             144:   66(fvec3) ConstantComposite 143 143 143
             146:             TypeBool
             147:             TypeVector 146(bool) 3
             148:             TypePointer Private 147(bvec3)
             149:    148(ptr) Variable Private
             152:    6(float) Constant 1033147538
             153:    6(float) Constant 0
             154:    7(fvec4) ConstantComposite 152 152 152 153
             155:             TypeVector 146(bool) 4
             158:             TypePointer Function 66(fvec3)
             161:     14(int) Constant 0
             162:             TypePointer Private 146(bool)
             165:             TypePointer Function 6(float)
             169:             TypePointer Private 6(float)
             202:     17(int) Constant 7
             203:             TypePointer Uniform 17(int)
             217:     14(int) Constant 3
             218:             TypePointer Input 6(float)
             226:    110(ptr) Variable Output
             228:             TypeVector 6(float) 2
             229:             TypePointer Output 228(fvec2)
230(vs_TEXCOORD0):    229(ptr) Variable Output
             231:             TypePointer Input 228(fvec2)
             232:    231(ptr) Variable Input
             234:     17(int) Constant 4
243(vs_TEXCOORD1):    110(ptr) Variable Output
             277:     17(int) Constant 5
             278:             TypePointer Uniform 6(float)
             281:     17(int) Constant 6
             285:    6(float) Constant 1048576000
             286:  228(fvec2) ConstantComposite 285 285
294(vs_TEXCOORD2):    110(ptr) Variable Output
             302:    6(float) Constant 3499426553
             303:    7(fvec4) ConstantComposite 302 302 302 302
             306:    6(float) Constant 1351942905
             307:    7(fvec4) ConstantComposite 306 306 306 306
             311:    6(float) Constant 1073741824
             312:  228(fvec2) ConstantComposite 311 311
             328:             TypePointer Output 14(int)
             329:    328(ptr) Variable Output
             331:             TypePointer Output 6(float)
             337:             TypePointer Function 7(fvec4)
             339:             TypeVector 17(int) 4
             340:             TypePointer Function 339(ivec4)
             342:             TypePointer Function 155(bvec4)
             344:             TypeVector 14(int) 4
             345:             TypePointer Function 344(ivec4)
               4:           2 Function None 3
               5:             Label
             159:    158(ptr) Variable Function
             166:    165(ptr) Variable Function
             179:    165(ptr) Variable Function
             191:    165(ptr) Variable Function
             207:    158(ptr) Variable Function
             338:    337(ptr) Variable Function
             341:    340(ptr) Variable Function
             343:    342(ptr) Variable Function
             346:    345(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              23:     22(ptr) AccessChain 20 21 21
              24:    7(fvec4) Load 23
              25:    7(fvec4) FMul 13 24
                              Store 9 25
              27:     22(ptr) AccessChain 20 21 26
              28:    7(fvec4) Load 27
              29:    7(fvec4) Load 11
              30:    7(fvec4) VectorShuffle 29 29 0 0 0 0
              31:    7(fvec4) FMul 28 30
              32:    7(fvec4) Load 9
              33:    7(fvec4) FAdd 31 32
                              Store 9 33
              35:     22(ptr) AccessChain 20 21 34
              36:    7(fvec4) Load 35
              37:    7(fvec4) Load 11
              38:    7(fvec4) VectorShuffle 37 37 2 2 2 2
              39:    7(fvec4) FMul 36 38
              40:    7(fvec4) Load 9
              41:    7(fvec4) FAdd 39 40
                              Store 9 41
              42:    7(fvec4) Load 9
              44:     22(ptr) AccessChain 20 21 43
              45:    7(fvec4) Load 44
              46:    7(fvec4) FAdd 42 45
                              Store 9 46
              51:     14(int) Load 50
              52:     17(int) Bitcast 51
              53:     17(int) ShiftLeftLogical 52 34
                              Store 48 53
              55:    7(fvec4) Load 9
              56:    7(fvec4) VectorShuffle 55 55 1 1 1 1
              73:     17(int) Load 48
              74:     17(int) IAdd 73 21
              75:     22(ptr) AccessChain 72 43 74
              76:    7(fvec4) Load 75
              77:    7(fvec4) FMul 56 76
                              Store 54 77
              78:     17(int) Load 48
              79:     22(ptr) AccessChain 72 43 78
              80:    7(fvec4) Load 79
              81:    7(fvec4) Load 9
              82:    7(fvec4) VectorShuffle 81 81 0 0 0 0
              83:    7(fvec4) FMul 80 82
              84:    7(fvec4) Load 54
              85:    7(fvec4) FAdd 83 84
                              Store 54 85
              86:     17(int) Load 48
              87:     17(int) IAdd 86 34
              88:     22(ptr) AccessChain 72 43 87
              89:    7(fvec4) Load 88
              90:    7(fvec4) Load 9
              91:    7(fvec4) VectorShuffle 90 90 2 2 2 2
              92:    7(fvec4) FMul 89 91
              93:    7(fvec4) Load 54
              94:    7(fvec4) FAdd 92 93
                              Store 54 94
              95:     17(int) Load 48
              96:     17(int) IAdd 95 43
              97:     22(ptr) AccessChain 72 43 96
              98:    7(fvec4) Load 97
              99:    7(fvec4) Load 9
             100:    7(fvec4) VectorShuffle 99 99 3 3 3 3
             101:    7(fvec4) FMul 98 100
             102:    7(fvec4) Load 54
             103:    7(fvec4) FAdd 101 102
                              Store 9 103
             109:    7(fvec4) Load 9
             111:    110(ptr) AccessChain 108 26
                              Store 111 109
             115:    7(fvec4) Load 114
             116:   66(fvec3) VectorShuffle 115 115 0 1 2
             119:   66(fvec3) FMul 116 118
             122:   66(fvec3) FAdd 119 121
                              Store 113 122
             123:    7(fvec4) Load 114
             124:   66(fvec3) VectorShuffle 123 123 0 1 2
             125:   66(fvec3) Load 113
             126:   66(fvec3) FMul 124 125
             129:   66(fvec3) FAdd 126 128
                              Store 113 129
             130:    7(fvec4) Load 114
             131:   66(fvec3) VectorShuffle 130 130 0 1 2
             132:   66(fvec3) Load 113
             133:   66(fvec3) FMul 131 132
             136:   66(fvec3) FAdd 133 135
                              Store 113 136
             138:    7(fvec4) Load 114
             139:   66(fvec3) VectorShuffle 138 138 0 1 2
             142:   66(fvec3) FMul 139 141
             145:   66(fvec3) FAdd 142 144
                              Store 137 145
             150:    7(fvec4) Load 114
             151:    7(fvec4) VectorShuffle 150 150 0 1 2 0
             156:  155(bvec4) FOrdLessThan 151 154
             157:  147(bvec3) VectorShuffle 156 156 0 1 2
                              Store 149 157
             160:   66(fvec3) Load 113
                              Store 159 160
             163:    162(ptr) AccessChain 149 161
             164:   146(bool) Load 163
                              SelectionMerge 168 None
                              BranchConditional 164 167 172
             167:               Label
             170:    169(ptr)   AccessChain 137 161
             171:    6(float)   Load 170
                                Store 166 171
                                Branch 168
             172:               Label
             173:    169(ptr)   AccessChain 113 161
             174:    6(float)   Load 173
                                Store 166 174
                                Branch 168
             168:             Label
             175:    6(float) Load 166
             176:    165(ptr) AccessChain 159 161
                              Store 176 175
             177:    162(ptr) AccessChain 149 104
             178:   146(bool) Load 177
                              SelectionMerge 181 None
                              BranchConditional 178 180 184
             180:               Label
             182:    169(ptr)   AccessChain 137 104
             183:    6(float)   Load 182
                                Store 179 183
                                Branch 181
             184:               Label
             185:    169(ptr)   AccessChain 113 104
             186:    6(float)   Load 185
                                Store 179 186
                                Branch 181
             181:             Label
             187:    6(float) Load 179
             188:    165(ptr) AccessChain 159 104
                              Store 188 187
             189:    162(ptr) AccessChain 149 67
             190:   146(bool) Load 189
                              SelectionMerge 193 None
                              BranchConditional 190 192 196
             192:               Label
             194:    169(ptr)   AccessChain 137 67
             195:    6(float)   Load 194
                                Store 191 195
                                Branch 193
             196:               Label
             197:    169(ptr)   AccessChain 113 67
             198:    6(float)   Load 197
                                Store 191 198
                                Branch 193
             193:             Label
             199:    6(float) Load 191
             200:    165(ptr) AccessChain 159 67
                              Store 200 199
             201:   66(fvec3) Load 159
                              Store 113 201
             204:    203(ptr) AccessChain 20 202
             205:     17(int) Load 204
             206:   146(bool) INotEqual 205 26
                              SelectionMerge 209 None
                              BranchConditional 206 208 211
             208:               Label
             210:   66(fvec3)   Load 113
                                Store 207 210
                                Branch 209
             211:               Label
             212:    7(fvec4)   Load 114
             213:   66(fvec3)   VectorShuffle 212 212 0 1 2
                                Store 207 213
                                Branch 209
             209:             Label
             214:   66(fvec3) Load 207
             215:    7(fvec4) Load 54
             216:    7(fvec4) VectorShuffle 215 214 4 5 6 3
                              Store 54 216
             219:    218(ptr) AccessChain 114 217
             220:    6(float) Load 219
             221:    169(ptr) AccessChain 54 217
                              Store 221 220
             222:    7(fvec4) Load 54
             223:     22(ptr) AccessChain 20 34
             224:    7(fvec4) Load 223
             225:    7(fvec4) FMul 222 224
                              Store 54 225
             227:    7(fvec4) Load 54
                              Store 226 227
             233:  228(fvec2) Load 232
             235:     22(ptr) AccessChain 20 234
             236:    7(fvec4) Load 235
             237:  228(fvec2) VectorShuffle 236 236 0 1
             238:  228(fvec2) FMul 233 237
             239:     22(ptr) AccessChain 20 234
             240:    7(fvec4) Load 239
             241:  228(fvec2) VectorShuffle 240 240 2 3
             242:  228(fvec2) FAdd 238 241
                              Store 230(vs_TEXCOORD0) 242
             244:    7(fvec4) Load 11
                              Store 243(vs_TEXCOORD1) 244
             245:     22(ptr) AccessChain 20 26
             246:    7(fvec4) Load 245
             247:  228(fvec2) VectorShuffle 246 246 1 1
             248:     17(int) Load 48
             249:     17(int) IAdd 248 21
             250:     22(ptr) AccessChain 72 26 249
             251:    7(fvec4) Load 250
             252:  228(fvec2) VectorShuffle 251 251 0 1
             253:  228(fvec2) FMul 247 252
             254:    7(fvec4) Load 9
             255:    7(fvec4) VectorShuffle 254 253 4 5 2 3
                              Store 9 255
             256:     17(int) Load 48
             257:     22(ptr) AccessChain 72 26 256
             258:    7(fvec4) Load 257
             259:  228(fvec2) VectorShuffle 258 258 0 1
             260:     22(ptr) AccessChain 20 26
             261:    7(fvec4) Load 260
             262:  228(fvec2) VectorShuffle 261 261 0 0
             263:  228(fvec2) FMul 259 262
             264:    7(fvec4) Load 9
             265:  228(fvec2) VectorShuffle 264 264 0 1
             266:  228(fvec2) FAdd 263 265
             267:    7(fvec4) Load 9
             268:    7(fvec4) VectorShuffle 267 266 4 5 2 3
                              Store 9 268
             269:    7(fvec4) Load 9
             270:  228(fvec2) VectorShuffle 269 269 3 3
             271:    7(fvec4) Load 9
             272:  228(fvec2) VectorShuffle 271 271 0 1
             273:  228(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 272
             274:  228(fvec2) FDiv 270 273
             275:    7(fvec4) Load 9
             276:    7(fvec4) VectorShuffle 275 274 4 5 2 3
                              Store 9 276
             279:    278(ptr) AccessChain 20 277
             280:    6(float) Load 279
             282:    278(ptr) AccessChain 20 281
             283:    6(float) Load 282
             284:  228(fvec2) CompositeConstruct 280 283
             287:  228(fvec2) FMul 284 286
             288:    7(fvec4) Load 9
             289:  228(fvec2) VectorShuffle 288 288 0 1
             290:  228(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 289
             291:  228(fvec2) FAdd 287 290
             292:    7(fvec4) Load 9
             293:    7(fvec4) VectorShuffle 292 291 4 5 2 3
                              Store 9 293
             295:    7(fvec4) Load 9
             296:  228(fvec2) VectorShuffle 295 295 0 1
             297:  228(fvec2) FDiv 286 296
             298:    7(fvec4) Load 294(vs_TEXCOORD2)
             299:    7(fvec4) VectorShuffle 298 297 0 1 4 5
                              Store 294(vs_TEXCOORD2) 299
             300:     22(ptr) AccessChain 20 43
             301:    7(fvec4) Load 300
             304:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 301 303
                              Store 9 304
             305:    7(fvec4) Load 9
             308:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 305 307
                              Store 9 308
             309:    7(fvec4) Load 11
             310:  228(fvec2) VectorShuffle 309 309 0 1
             313:  228(fvec2) FMul 310 312
             314:    7(fvec4) Load 9
             315:  228(fvec2) VectorShuffle 314 314 0 1
             316:  228(fvec2) FNegate 315
             317:  228(fvec2) FAdd 313 316
             318:    7(fvec4) Load 9
             319:    7(fvec4) VectorShuffle 318 317 4 5 2 3
                              Store 9 319
             320:    7(fvec4) Load 9
             321:  228(fvec2) VectorShuffle 320 320 2 3
             322:  228(fvec2) FNegate 321
             323:    7(fvec4) Load 9
             324:  228(fvec2) VectorShuffle 323 323 0 1
             325:  228(fvec2) FAdd 322 324
             326:    7(fvec4) Load 294(vs_TEXCOORD2)
             327:    7(fvec4) VectorShuffle 326 325 4 5 2 3
                              Store 294(vs_TEXCOORD2) 327
             330:     14(int) Load 50
                              Store 329 330
             332:    331(ptr) AccessChain 108 26 104
             333:    6(float) Load 332
             334:    6(float) FNegate 333
             335:    331(ptr) AccessChain 108 26 104
                              Store 335 334
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 110

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 39 86
                              ExecutionMode 4 OriginUpperLeft
                              Name 39  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 35 RelaxedPrecision
                              Decorate 35 DescriptorSet 0
                              Decorate 35 Binding 0
                              Decorate 36 RelaxedPrecision
                              Decorate 39(vs_TEXCOORD0) Location 1
                              Decorate 41 RelaxedPrecision
                              Decorate 43 RelaxedPrecision
                              MemberDecorate 44 0 RelaxedPrecision
                              MemberDecorate 44 0 Offset 0
                              Decorate 44 Block
                              Decorate 46 DescriptorSet 1
                              Decorate 46 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 53 RelaxedPrecision
                              Decorate 55 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 78 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 86 RelaxedPrecision
                              Decorate 86 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypeSampledImage 32
              34:             TypePointer UniformConstant 33
              35:     34(ptr) Variable UniformConstant
              37:             TypeVector 6(float) 2
              38:             TypePointer Input 37(fvec2)
39(vs_TEXCOORD0):     38(ptr) Variable Input
              42:      8(ptr) Variable Private
              44:             TypeStruct 7(fvec4)
              45:             TypePointer Uniform 44(struct)
              46:     45(ptr) Variable Uniform
              47:             TypeInt 32 1
              48:     47(int) Constant 0
              49:             TypePointer Uniform 7(fvec4)
              53:     20(ptr) Variable Private
              59:    6(float) Constant 3129152111
              61:             TypeBool
              62:             TypePointer Private 61(bool)
              63:     62(ptr) Variable Private
              65:    6(float) Constant 0
              68:     47(int) Constant 1
              70:     47(int) Constant 4294967295
              76:             TypeVector 6(float) 3
              81:      8(ptr) Variable Private
              85:             TypePointer Output 7(fvec4)
              86:     85(ptr) Variable Output
              96:             TypePointer Output 6(float)
              99:             TypePointer Function 7(fvec4)
             101:             TypeVector 47(int) 4
             102:             TypePointer Function 101(ivec4)
             104:             TypeVector 61(bool) 4
             105:             TypePointer Function 104(bvec4)
             107:             TypeVector 12(int) 4
             108:             TypePointer Function 107(ivec4)
               4:           2 Function None 3
               5:             Label
             100:     99(ptr) Variable Function
             103:    102(ptr) Variable Function
             106:    105(ptr) Variable Function
             109:    108(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              36:          33 Load 35
              40:   37(fvec2) Load 39(vs_TEXCOORD0)
              41:    7(fvec4) ImageSampleImplicitLod 36 40
                              Store 31 41
              43:    7(fvec4) Load 31
              50:     49(ptr) AccessChain 46 48
              51:    7(fvec4) Load 50
              52:    7(fvec4) FAdd 43 51
                              Store 42 52
              54:     20(ptr) AccessChain 9 13
              55:    6(float) Load 54
              56:     20(ptr) AccessChain 42 13
              57:    6(float) Load 56
              58:    6(float) FMul 55 57
              60:    6(float) FAdd 58 59
                              Store 53 60
              64:    6(float) Load 53
              66:    61(bool) FOrdLessThan 64 65
                              Store 63 66
              67:    61(bool) Load 63
              69:     47(int) Select 67 68 48
              71:     47(int) IMul 69 70
              72:    61(bool) INotEqual 71 48
                              SelectionMerge 74 None
                              BranchConditional 72 73 74
              73:               Label
                                Kill
              74:             Label
              77:    7(fvec4) Load 11
              78:   76(fvec3) VectorShuffle 77 77 0 1 2
              79:    7(fvec4) Load 9
              80:    7(fvec4) VectorShuffle 79 78 4 5 6 3
                              Store 9 80
              82:    7(fvec4) Load 9
              83:    7(fvec4) Load 42
              84:    7(fvec4) FMul 82 83
                              Store 81 84
              87:    7(fvec4) Load 81
              88:   76(fvec3) VectorShuffle 87 87 3 3 3
              89:    7(fvec4) Load 81
              90:   76(fvec3) VectorShuffle 89 89 0 1 2
              91:   76(fvec3) FMul 88 90
              92:    7(fvec4) Load 86
              93:    7(fvec4) VectorShuffle 92 91 4 5 6 3
                              Store 86 93
              94:     20(ptr) AccessChain 81 13
              95:    6(float) Load 94
              97:     96(ptr) AccessChain 86 13
                              Store 97 95
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_CLIP_RECT
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 0, used in: Fragment  no sampler

Constant Buffer "PGlobals326242551" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals326242551" (268 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
  ScalarInt _UIVertexColorAlwaysGammaSpace at 264
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 317

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 87 201 205 207 218 266
                              Name 205  "vs_TEXCOORD0"
                              Name 218  "vs_TEXCOORD1"
                              Name 266  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 20 0 Offset 0
                              MemberDecorate 20 1 Offset 16
                              MemberDecorate 20 2 Offset 80
                              MemberDecorate 20 3 Offset 144
                              MemberDecorate 20 4 RelaxedPrecision
                              MemberDecorate 20 4 Offset 208
                              MemberDecorate 20 5 Offset 224
                              MemberDecorate 20 6 Offset 240
                              MemberDecorate 20 7 Offset 256
                              MemberDecorate 20 8 Offset 260
                              MemberDecorate 20 9 Offset 264
                              Decorate 20 Block
                              Decorate 22 DescriptorSet 1
                              Decorate 22 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 86 RelaxedPrecision
                              Decorate 87 Location 1
                              Decorate 98 RelaxedPrecision
                              Decorate 105 RelaxedPrecision
                              Decorate 110 RelaxedPrecision
                              Decorate 133 RelaxedPrecision
                              Decorate 139 RelaxedPrecision
                              Decorate 144 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 148 RelaxedPrecision
                              Decorate 152 RelaxedPrecision
                              Decorate 156 RelaxedPrecision
                              Decorate 159 RelaxedPrecision
                              Decorate 160 RelaxedPrecision
                              Decorate 165 RelaxedPrecision
                              Decorate 169 RelaxedPrecision
                              Decorate 172 RelaxedPrecision
                              Decorate 173 RelaxedPrecision
                              Decorate 184 RelaxedPrecision
                              Decorate 199 RelaxedPrecision
                              Decorate 201 RelaxedPrecision
                              Decorate 201 Location 0
                              Decorate 205(vs_TEXCOORD0) Location 1
                              Decorate 207 Location 2
                              Decorate 218(vs_TEXCOORD1) Location 3
                              Decorate 266(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeInt 32 1
              20:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float) 19(int)
              21:             TypePointer Uniform 20(struct)
              22:     21(ptr) Variable Uniform
              23:     19(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     19(int) Constant 0
              36:     19(int) Constant 2
              45:     19(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:             TypeVector 6(float) 3
              85:             TypePointer Private 84(fvec3)
              86:     85(ptr) Variable Private
              87:     10(ptr) Variable Input
              90:    6(float) Constant 1049109012
              91:   84(fvec3) ConstantComposite 90 90 90
              93:    6(float) Constant 1060933829
              94:   84(fvec3) ConstantComposite 93 93 93
             100:    6(float) Constant 3156252646
             101:   84(fvec3) ConstantComposite 100 100 100
             107:    6(float) Constant 995198018
             108:   84(fvec3) ConstantComposite 107 107 107
             110:     85(ptr) Variable Private
             113:    6(float) Constant 1034814791
             114:   84(fvec3) ConstantComposite 113 113 113
             116:    6(float) Constant 3106599620
             117:   84(fvec3) ConstantComposite 116 116 116
             119:             TypeBool
             120:             TypeVector 119(bool) 3
             121:             TypePointer Private 120(bvec3)
             122:    121(ptr) Variable Private
             125:    6(float) Constant 1033147538
             126:    6(float) Constant 0
             127:    7(fvec4) ConstantComposite 125 125 125 126
             128:             TypeVector 119(bool) 4
             131:             TypePointer Function 84(fvec3)
             134:     14(int) Constant 0
             135:             TypePointer Private 119(bool)
             138:             TypePointer Function 6(float)
             142:             TypePointer Private 6(float)
             162:     14(int) Constant 2
             176:     19(int) Constant 9
             177:             TypePointer Uniform 19(int)
             191:     14(int) Constant 3
             192:             TypePointer Input 6(float)
             197:     19(int) Constant 4
             201:     82(ptr) Variable Output
             203:             TypeVector 6(float) 2
             204:             TypePointer Output 203(fvec2)
205(vs_TEXCOORD0):    204(ptr) Variable Output
             206:             TypePointer Input 203(fvec2)
             207:    206(ptr) Variable Input
             209:     19(int) Constant 6
218(vs_TEXCOORD1):     82(ptr) Variable Output
             249:     19(int) Constant 7
             250:             TypePointer Uniform 6(float)
             253:     19(int) Constant 8
             257:    6(float) Constant 1048576000
             258:  203(fvec2) ConstantComposite 257 257
266(vs_TEXCOORD2):     82(ptr) Variable Output
             272:     19(int) Constant 5
             275:    6(float) Constant 3499426553
             276:    7(fvec4) ConstantComposite 275 275 275 275
             279:    6(float) Constant 1351942905
             280:    7(fvec4) ConstantComposite 279 279 279 279
             284:    6(float) Constant 1073741824
             285:  203(fvec2) ConstantComposite 284 284
             301:             TypePointer Output 6(float)
             307:             TypePointer Function 7(fvec4)
             309:             TypeVector 19(int) 4
             310:             TypePointer Function 309(ivec4)
             312:             TypePointer Function 128(bvec4)
             314:             TypeVector 14(int) 4
             315:             TypePointer Function 314(ivec4)
               4:           2 Function None 3
               5:             Label
             132:    131(ptr) Variable Function
             139:    138(ptr) Variable Function
             152:    138(ptr) Variable Function
             165:    138(ptr) Variable Function
             181:    131(ptr) Variable Function
             308:    307(ptr) Variable Function
             311:    310(ptr) Variable Function
             313:    312(ptr) Variable Function
             316:    315(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 22 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 22 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 22 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 22 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 22 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 22 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 22 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 22 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              88:    7(fvec4) Load 87
              89:   84(fvec3) VectorShuffle 88 88 0 1 2
              92:   84(fvec3) FMul 89 91
              95:   84(fvec3) FAdd 92 94
                              Store 86 95
              96:    7(fvec4) Load 87
              97:   84(fvec3) VectorShuffle 96 96 0 1 2
              98:   84(fvec3) Load 86
              99:   84(fvec3) FMul 97 98
             102:   84(fvec3) FAdd 99 101
                              Store 86 102
             103:    7(fvec4) Load 87
             104:   84(fvec3) VectorShuffle 103 103 0 1 2
             105:   84(fvec3) Load 86
             106:   84(fvec3) FMul 104 105
             109:   84(fvec3) FAdd 106 108
                              Store 86 109
             111:    7(fvec4) Load 87
             112:   84(fvec3) VectorShuffle 111 111 0 1 2
             115:   84(fvec3) FMul 112 114
             118:   84(fvec3) FAdd 115 117
                              Store 110 118
             123:    7(fvec4) Load 87
             124:    7(fvec4) VectorShuffle 123 123 0 1 2 0
             129:  128(bvec4) FOrdLessThan 124 127
             130:  120(bvec3) VectorShuffle 129 129 0 1 2
                              Store 122 130
             133:   84(fvec3) Load 86
                              Store 132 133
             136:    135(ptr) AccessChain 122 134
             137:   119(bool) Load 136
                              SelectionMerge 141 None
                              BranchConditional 137 140 145
             140:               Label
             143:    142(ptr)   AccessChain 110 134
             144:    6(float)   Load 143
                                Store 139 144
                                Branch 141
             145:               Label
             146:    142(ptr)   AccessChain 86 134
             147:    6(float)   Load 146
                                Store 139 147
                                Branch 141
             141:             Label
             148:    6(float) Load 139
             149:    138(ptr) AccessChain 132 134
                              Store 149 148
             150:    135(ptr) AccessChain 122 76
             151:   119(bool) Load 150
                              SelectionMerge 154 None
                              BranchConditional 151 153 157
             153:               Label
             155:    142(ptr)   AccessChain 110 76
             156:    6(float)   Load 155
                                Store 152 156
                                Branch 154
             157:               Label
             158:    142(ptr)   AccessChain 86 76
             159:    6(float)   Load 158
                                Store 152 159
                                Branch 154
             154:             Label
             160:    6(float) Load 152
             161:    138(ptr) AccessChain 132 76
                              Store 161 160
             163:    135(ptr) AccessChain 122 162
             164:   119(bool) Load 163
                              SelectionMerge 167 None
                              BranchConditional 164 166 170
             166:               Label
             168:    142(ptr)   AccessChain 110 162
             169:    6(float)   Load 168
                                Store 165 169
                                Branch 167
             170:               Label
             171:    142(ptr)   AccessChain 86 162
             172:    6(float)   Load 171
                                Store 165 172
                                Branch 167
             167:             Label
             173:    6(float) Load 165
             174:    138(ptr) AccessChain 132 162
                              Store 174 173
             175:   84(fvec3) Load 132
                              Store 86 175
             178:    177(ptr) AccessChain 22 176
             179:     19(int) Load 178
             180:   119(bool) INotEqual 179 28
                              SelectionMerge 183 None
                              BranchConditional 180 182 185
             182:               Label
             184:   84(fvec3)   Load 86
                                Store 181 184
                                Branch 183
             185:               Label
             186:    7(fvec4)   Load 87
             187:   84(fvec3)   VectorShuffle 186 186 0 1 2
                                Store 181 187
                                Branch 183
             183:             Label
             188:   84(fvec3) Load 181
             189:    7(fvec4) Load 49
             190:    7(fvec4) VectorShuffle 189 188 4 5 6 3
                              Store 49 190
             193:    192(ptr) AccessChain 87 191
             194:    6(float) Load 193
             195:    142(ptr) AccessChain 49 191
                              Store 195 194
             196:    7(fvec4) Load 49
             198:     24(ptr) AccessChain 22 197
             199:    7(fvec4) Load 198
             200:    7(fvec4) FMul 196 199
                              Store 49 200
             202:    7(fvec4) Load 49
                              Store 201 202
             208:  203(fvec2) Load 207
             210:     24(ptr) AccessChain 22 209
             211:    7(fvec4) Load 210
             212:  203(fvec2) VectorShuffle 211 211 0 1
             213:  203(fvec2) FMul 208 212
             214:     24(ptr) AccessChain 22 209
             215:    7(fvec4) Load 214
             216:  203(fvec2) VectorShuffle 215 215 2 3
             217:  203(fvec2) FAdd 213 216
                              Store 205(vs_TEXCOORD0) 217
             219:    7(fvec4) Load 11
                              Store 218(vs_TEXCOORD1) 219
             220:     24(ptr) AccessChain 22 28
             221:    7(fvec4) Load 220
             222:  203(fvec2) VectorShuffle 221 221 1 1
             223:     24(ptr) AccessChain 22 36 23
             224:    7(fvec4) Load 223
             225:  203(fvec2) VectorShuffle 224 224 0 1
             226:  203(fvec2) FMul 222 225
             227:    7(fvec4) Load 9
             228:    7(fvec4) VectorShuffle 227 226 4 5 2 3
                              Store 9 228
             229:     24(ptr) AccessChain 22 36 28
             230:    7(fvec4) Load 229
             231:  203(fvec2) VectorShuffle 230 230 0 1
             232:     24(ptr) AccessChain 22 28
             233:    7(fvec4) Load 232
             234:  203(fvec2) VectorShuffle 233 233 0 0
             235:  203(fvec2) FMul 231 234
             236:    7(fvec4) Load 9
             237:  203(fvec2) VectorShuffle 236 236 0 1
             238:  203(fvec2) FAdd 235 237
             239:    7(fvec4) Load 9
             240:    7(fvec4) VectorShuffle 239 238 4 5 2 3
                              Store 9 240
             241:    7(fvec4) Load 9
             242:  203(fvec2) VectorShuffle 241 241 3 3
             243:    7(fvec4) Load 9
             244:  203(fvec2) VectorShuffle 243 243 0 1
             245:  203(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 244
             246:  203(fvec2) FDiv 242 245
             247:    7(fvec4) Load 9
             248:    7(fvec4) VectorShuffle 247 246 4 5 2 3
                              Store 9 248
             251:    250(ptr) AccessChain 22 249
             252:    6(float) Load 251
             254:    250(ptr) AccessChain 22 253
             255:    6(float) Load 254
             256:  203(fvec2) CompositeConstruct 252 255
             259:  203(fvec2) FMul 256 258
             260:    7(fvec4) Load 9
             261:  203(fvec2) VectorShuffle 260 260 0 1
             262:  203(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 261
             263:  203(fvec2) FAdd 259 262
             264:    7(fvec4) Load 9
             265:    7(fvec4) VectorShuffle 264 263 4 5 2 3
                              Store 9 265
             267:    7(fvec4) Load 9
             268:  203(fvec2) VectorShuffle 267 267 0 1
             269:  203(fvec2) FDiv 258 268
             270:    7(fvec4) Load 266(vs_TEXCOORD2)
             271:    7(fvec4) VectorShuffle 270 269 0 1 4 5
                              Store 266(vs_TEXCOORD2) 271
             273:     24(ptr) AccessChain 22 272
             274:    7(fvec4) Load 273
             277:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 274 276
                              Store 9 277
             278:    7(fvec4) Load 9
             281:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 278 280
                              Store 9 281
             282:    7(fvec4) Load 11
             283:  203(fvec2) VectorShuffle 282 282 0 1
             286:  203(fvec2) FMul 283 285
             287:    7(fvec4) Load 9
             288:  203(fvec2) VectorShuffle 287 287 0 1
             289:  203(fvec2) FNegate 288
             290:  203(fvec2) FAdd 286 289
             291:    7(fvec4) Load 9
             292:    7(fvec4) VectorShuffle 291 290 4 5 2 3
                              Store 9 292
             293:    7(fvec4) Load 9
             294:  203(fvec2) VectorShuffle 293 293 2 3
             295:  203(fvec2) FNegate 294
             296:    7(fvec4) Load 9
             297:  203(fvec2) VectorShuffle 296 296 0 1
             298:  203(fvec2) FAdd 295 297
             299:    7(fvec4) Load 266(vs_TEXCOORD2)
             300:    7(fvec4) VectorShuffle 299 298 4 5 2 3
                              Store 266(vs_TEXCOORD2) 300
             302:    301(ptr) AccessChain 80 28 76
             303:    6(float) Load 302
             304:    6(float) FNegate 303
             305:    301(ptr) AccessChain 80 28 76
                              Store 305 304
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 132

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 30 65 86 108
                              ExecutionMode 4 OriginUpperLeft
                              Name 30  "vs_TEXCOORD2"
                              Name 86  "vs_TEXCOORD0"
                              MemberDecorate 10 0 RelaxedPrecision
                              MemberDecorate 10 0 Offset 0
                              MemberDecorate 10 1 Offset 16
                              Decorate 10 Block
                              Decorate 12 DescriptorSet 1
                              Decorate 12 Binding 0
                              Decorate 30(vs_TEXCOORD2) Location 2
                              Decorate 55 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 65 RelaxedPrecision
                              Decorate 65 Location 0
                              Decorate 69 RelaxedPrecision
                              Decorate 71 RelaxedPrecision
                              Decorate 72 RelaxedPrecision
                              Decorate 73 RelaxedPrecision
                              Decorate 74 RelaxedPrecision
                              Decorate 75 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 79 RelaxedPrecision
                              Decorate 83 RelaxedPrecision
                              Decorate 83 DescriptorSet 0
                              Decorate 83 Binding 0
                              Decorate 84 RelaxedPrecision
                              Decorate 86(vs_TEXCOORD0) Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 93 RelaxedPrecision
                              Decorate 94 RelaxedPrecision
                              Decorate 96 RelaxedPrecision
                              Decorate 97 RelaxedPrecision
                              Decorate 100 RelaxedPrecision
                              Decorate 103 RelaxedPrecision
                              Decorate 108 RelaxedPrecision
                              Decorate 108 Location 0
                              Decorate 111 RelaxedPrecision
                              Decorate 116 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypeStruct 7(fvec4) 7(fvec4)
              11:             TypePointer Uniform 10(struct)
              12:     11(ptr) Variable Uniform
              13:             TypeInt 32 1
              14:     13(int) Constant 1
              15:             TypeVector 6(float) 2
              16:             TypePointer Uniform 7(fvec4)
              29:             TypePointer Input 7(fvec4)
30(vs_TEXCOORD2):     29(ptr) Variable Input
              47:    6(float) Constant 0
              48:    6(float) Constant 1065353216
              54:             TypePointer Private 6(float)
              55:     54(ptr) Variable Private
              56:             TypeInt 32 0
              57:     56(int) Constant 1
              60:     56(int) Constant 0
              64:     54(ptr) Variable Private
              65:     29(ptr) Variable Input
              66:     56(int) Constant 3
              67:             TypePointer Input 6(float)
              70:    6(float) Constant 1132396544
              74:      8(ptr) Variable Private
              76:    6(float) Constant 998277249
              79:      8(ptr) Variable Private
              80:             TypeImage 6(float) 2D sampled format:Unknown
              81:             TypeSampledImage 80
              82:             TypePointer UniformConstant 81
              83:     82(ptr) Variable UniformConstant
              85:             TypePointer Input 15(fvec2)
86(vs_TEXCOORD0):     85(ptr) Variable Input
              89:      8(ptr) Variable Private
              91:     13(int) Constant 0
              95:             TypeVector 6(float) 3
             107:             TypePointer Output 7(fvec4)
             108:    107(ptr) Variable Output
             117:             TypePointer Output 6(float)
             120:             TypePointer Function 7(fvec4)
             122:             TypeVector 13(int) 4
             123:             TypePointer Function 122(ivec4)
             125:             TypeBool
             126:             TypeVector 125(bool) 4
             127:             TypePointer Function 126(bvec4)
             129:             TypeVector 56(int) 4
             130:             TypePointer Function 129(ivec4)
               4:           2 Function None 3
               5:             Label
             121:    120(ptr) Variable Function
             124:    123(ptr) Variable Function
             128:    127(ptr) Variable Function
             131:    130(ptr) Variable Function
              17:     16(ptr) AccessChain 12 14
              18:    7(fvec4) Load 17
              19:   15(fvec2) VectorShuffle 18 18 0 1
              20:   15(fvec2) FNegate 19
              21:     16(ptr) AccessChain 12 14
              22:    7(fvec4) Load 21
              23:   15(fvec2) VectorShuffle 22 22 2 3
              24:   15(fvec2) FAdd 20 23
              25:    7(fvec4) Load 9
              26:    7(fvec4) VectorShuffle 25 24 4 5 2 3
                              Store 9 26
              27:    7(fvec4) Load 9
              28:   15(fvec2) VectorShuffle 27 27 0 1
              31:    7(fvec4) Load 30(vs_TEXCOORD2)
              32:   15(fvec2) VectorShuffle 31 31 0 1
              33:   15(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 32
              34:   15(fvec2) FNegate 33
              35:   15(fvec2) FAdd 28 34
              36:    7(fvec4) Load 9
              37:    7(fvec4) VectorShuffle 36 35 4 5 2 3
                              Store 9 37
              38:    7(fvec4) Load 9
              39:   15(fvec2) VectorShuffle 38 38 0 1
              40:    7(fvec4) Load 30(vs_TEXCOORD2)
              41:   15(fvec2) VectorShuffle 40 40 2 3
              42:   15(fvec2) FMul 39 41
              43:    7(fvec4) Load 9
              44:    7(fvec4) VectorShuffle 43 42 4 5 2 3
                              Store 9 44
              45:    7(fvec4) Load 9
              46:   15(fvec2) VectorShuffle 45 45 0 1
              49:   15(fvec2) CompositeConstruct 47 47
              50:   15(fvec2) CompositeConstruct 48 48
              51:   15(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 46 49 50
              52:    7(fvec4) Load 9
              53:    7(fvec4) VectorShuffle 52 51 4 5 2 3
                              Store 9 53
              58:     54(ptr) AccessChain 9 57
              59:    6(float) Load 58
              61:     54(ptr) AccessChain 9 60
              62:    6(float) Load 61
              63:    6(float) FMul 59 62
                              Store 55 63
              68:     67(ptr) AccessChain 65 66
              69:    6(float) Load 68
              71:    6(float) FMul 69 70
                              Store 64 71
              72:    6(float) Load 64
              73:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 72
                              Store 64 73
              75:    6(float) Load 64
              77:    6(float) FMul 75 76
              78:     54(ptr) AccessChain 74 66
                              Store 78 77
              84:          81 Load 83
              87:   15(fvec2) Load 86(vs_TEXCOORD0)
              88:    7(fvec4) ImageSampleImplicitLod 84 87
                              Store 79 88
              90:    7(fvec4) Load 79
              92:     16(ptr) AccessChain 12 91
              93:    7(fvec4) Load 92
              94:    7(fvec4) FAdd 90 93
                              Store 89 94
              96:    7(fvec4) Load 65
              97:   95(fvec3) VectorShuffle 96 96 0 1 2
              98:    7(fvec4) Load 74
              99:    7(fvec4) VectorShuffle 98 97 4 5 6 3
                              Store 74 99
             100:    7(fvec4) Load 74
             101:    7(fvec4) Load 89
             102:    7(fvec4) FMul 100 101
                              Store 9 102
             103:    6(float) Load 55
             104:     54(ptr) AccessChain 9 66
             105:    6(float) Load 104
             106:    6(float) FMul 103 105
                              Store 55 106
             109:    7(fvec4) Load 9
             110:   95(fvec3) VectorShuffle 109 109 0 1 2
             111:    6(float) Load 55
             112:   95(fvec3) CompositeConstruct 111 111 111
             113:   95(fvec3) FMul 110 112
             114:    7(fvec4) Load 108
             115:    7(fvec4) VectorShuffle 114 113 4 5 6 3
                              Store 108 115
             116:    6(float) Load 55
             118:    117(ptr) AccessChain 108 66
                              Store 118 116
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: STEREO_MULTIVIEW_ON UNITY_UI_CLIP_RECT
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 0, used in: Fragment  no sampler

Constant Buffer "PGlobals3703637449" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "UnityStereoGlobals" (1088 bytes) on set: 1, binding: 2, used in: Vertex  {
  Matrix4x4 unity_StereoMatrixP[2] at 0
  Matrix4x4 unity_StereoMatrixVP[2] at 384
}
Constant Buffer "VGlobals3703637449" (140 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 96
  Vector4 _Color at 80
  Vector4 _MainTex_ST at 112
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 128
  Float _UIMaskSoftnessY at 132
  ScalarInt _UIVertexColorAlwaysGammaSpace at 136
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 347

                              Capability Shader
                              Capability MultiView
                              Extension  "SPV_KHR_multiview"
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 50 108 114 226 230 232 243 294 329
                              Name 230  "vs_TEXCOORD0"
                              Name 243  "vs_TEXCOORD1"
                              Name 294  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              MemberDecorate 18 2 RelaxedPrecision
                              MemberDecorate 18 2 Offset 80
                              MemberDecorate 18 3 Offset 96
                              MemberDecorate 18 4 Offset 112
                              MemberDecorate 18 5 Offset 128
                              MemberDecorate 18 6 Offset 132
                              MemberDecorate 18 7 Offset 136
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              Decorate 50 BuiltIn ViewIndex
                              Decorate 58 ArrayStride 16
                              Decorate 59 ArrayStride 16
                              Decorate 60 ArrayStride 16
                              Decorate 61 ArrayStride 16
                              Decorate 62 ArrayStride 16
                              Decorate 63 ArrayStride 16
                              Decorate 64 ArrayStride 16
                              Decorate 65 ArrayStride 16
                              Decorate 68 ArrayStride 16
                              Decorate 69 ArrayStride 16
                              MemberDecorate 70 0 Offset 0
                              MemberDecorate 70 1 Offset 128
                              MemberDecorate 70 2 Offset 256
                              MemberDecorate 70 3 Offset 384
                              MemberDecorate 70 4 Offset 512
                              MemberDecorate 70 5 Offset 640
                              MemberDecorate 70 6 Offset 768
                              MemberDecorate 70 7 Offset 896
                              MemberDecorate 70 8 Offset 1024
                              MemberDecorate 70 9 Offset 1056
                              Decorate 70 Block
                              Decorate 72 DescriptorSet 1
                              Decorate 72 Binding 2
                              MemberDecorate 106 0 BuiltIn Position
                              MemberDecorate 106 1 BuiltIn PointSize
                              MemberDecorate 106 2 BuiltIn ClipDistance
                              Decorate 106 Block
                              Decorate 113 RelaxedPrecision
                              Decorate 114 Location 1
                              Decorate 125 RelaxedPrecision
                              Decorate 132 RelaxedPrecision
                              Decorate 137 RelaxedPrecision
                              Decorate 160 RelaxedPrecision
                              Decorate 166 RelaxedPrecision
                              Decorate 171 RelaxedPrecision
                              Decorate 174 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 179 RelaxedPrecision
                              Decorate 183 RelaxedPrecision
                              Decorate 186 RelaxedPrecision
                              Decorate 187 RelaxedPrecision
                              Decorate 191 RelaxedPrecision
                              Decorate 195 RelaxedPrecision
                              Decorate 198 RelaxedPrecision
                              Decorate 199 RelaxedPrecision
                              Decorate 210 RelaxedPrecision
                              Decorate 224 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 226 Location 0
                              Decorate 230(vs_TEXCOORD0) Location 1
                              Decorate 232 Location 2
                              Decorate 243(vs_TEXCOORD1) Location 3
                              Decorate 294(vs_TEXCOORD2) Location 2
                              Decorate 329 Flat
                              Decorate 329 Location 4
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeInt 32 1
              18:             TypeStruct 7(fvec4) 16 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float) 17(int)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:     17(int) Constant 1
              22:             TypePointer Uniform 7(fvec4)
              26:     17(int) Constant 0
              34:     17(int) Constant 2
              43:     17(int) Constant 3
              47:             TypePointer Private 17(int)
              48:     47(ptr) Variable Private
              49:             TypePointer Input 14(int)
              50:     49(ptr) Variable Input
              54:      8(ptr) Variable Private
              57:     14(int) Constant 8
              58:             TypeArray 7(fvec4) 57
              59:             TypeArray 7(fvec4) 57
              60:             TypeArray 7(fvec4) 57
              61:             TypeArray 7(fvec4) 57
              62:             TypeArray 7(fvec4) 57
              63:             TypeArray 7(fvec4) 57
              64:             TypeArray 7(fvec4) 57
              65:             TypeArray 7(fvec4) 57
              66:             TypeVector 6(float) 3
              67:     14(int) Constant 2
              68:             TypeArray 66(fvec3) 67
              69:             TypeArray 7(fvec4) 67
              70:             TypeStruct 58 59 60 61 62 63 64 65 68 69
              71:             TypePointer Uniform 70(struct)
              72:     71(ptr) Variable Uniform
             104:     14(int) Constant 1
             105:             TypeArray 6(float) 104
             106:             TypeStruct 7(fvec4) 6(float) 105
             107:             TypePointer Output 106(struct)
             108:    107(ptr) Variable Output
             110:             TypePointer Output 7(fvec4)
             112:             TypePointer Private 66(fvec3)
             113:    112(ptr) Variable Private
             114:     10(ptr) Variable Input
             117:    6(float) Constant 1049109012
             118:   66(fvec3) ConstantComposite 117 117 117
             120:    6(float) Constant 1060933829
             121:   66(fvec3) ConstantComposite 120 120 120
             127:    6(float) Constant 3156252646
             128:   66(fvec3) ConstantComposite 127 127 127
             134:    6(float) Constant 995198018
             135:   66(fvec3) ConstantComposite 134 134 134
             137:    112(ptr) Variable Private
             140:    6(float) Constant 1034814791
             141:   66(fvec3) ConstantComposite 140 140 140
             143:    6(float) Constant 3106599620
             144:   66(fvec3) ConstantComposite 143 143 143
             146:             TypeBool
             147:             TypeVector 146(bool) 3
             148:             TypePointer Private 147(bvec3)
             149:    148(ptr) Variable Private
             152:    6(float) Constant 1033147538
             153:    6(float) Constant 0
             154:    7(fvec4) ConstantComposite 152 152 152 153
             155:             TypeVector 146(bool) 4
             158:             TypePointer Function 66(fvec3)
             161:     14(int) Constant 0
             162:             TypePointer Private 146(bool)
             165:             TypePointer Function 6(float)
             169:             TypePointer Private 6(float)
             202:     17(int) Constant 7
             203:             TypePointer Uniform 17(int)
             217:     14(int) Constant 3
             218:             TypePointer Input 6(float)
             226:    110(ptr) Variable Output
             228:             TypeVector 6(float) 2
             229:             TypePointer Output 228(fvec2)
230(vs_TEXCOORD0):    229(ptr) Variable Output
             231:             TypePointer Input 228(fvec2)
             232:    231(ptr) Variable Input
             234:     17(int) Constant 4
243(vs_TEXCOORD1):    110(ptr) Variable Output
             277:     17(int) Constant 5
             278:             TypePointer Uniform 6(float)
             281:     17(int) Constant 6
             285:    6(float) Constant 1048576000
             286:  228(fvec2) ConstantComposite 285 285
294(vs_TEXCOORD2):    110(ptr) Variable Output
             302:    6(float) Constant 3499426553
             303:    7(fvec4) ConstantComposite 302 302 302 302
             306:    6(float) Constant 1351942905
             307:    7(fvec4) ConstantComposite 306 306 306 306
             311:    6(float) Constant 1073741824
             312:  228(fvec2) ConstantComposite 311 311
             328:             TypePointer Output 14(int)
             329:    328(ptr) Variable Output
             331:             TypePointer Output 6(float)
             337:             TypePointer Function 7(fvec4)
             339:             TypeVector 17(int) 4
             340:             TypePointer Function 339(ivec4)
             342:             TypePointer Function 155(bvec4)
             344:             TypeVector 14(int) 4
             345:             TypePointer Function 344(ivec4)
               4:           2 Function None 3
               5:             Label
             159:    158(ptr) Variable Function
             166:    165(ptr) Variable Function
             179:    165(ptr) Variable Function
             191:    165(ptr) Variable Function
             207:    158(ptr) Variable Function
             338:    337(ptr) Variable Function
             341:    340(ptr) Variable Function
             343:    342(ptr) Variable Function
             346:    345(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              23:     22(ptr) AccessChain 20 21 21
              24:    7(fvec4) Load 23
              25:    7(fvec4) FMul 13 24
                              Store 9 25
              27:     22(ptr) AccessChain 20 21 26
              28:    7(fvec4) Load 27
              29:    7(fvec4) Load 11
              30:    7(fvec4) VectorShuffle 29 29 0 0 0 0
              31:    7(fvec4) FMul 28 30
              32:    7(fvec4) Load 9
              33:    7(fvec4) FAdd 31 32
                              Store 9 33
              35:     22(ptr) AccessChain 20 21 34
              36:    7(fvec4) Load 35
              37:    7(fvec4) Load 11
              38:    7(fvec4) VectorShuffle 37 37 2 2 2 2
              39:    7(fvec4) FMul 36 38
              40:    7(fvec4) Load 9
              41:    7(fvec4) FAdd 39 40
                              Store 9 41
              42:    7(fvec4) Load 9
              44:     22(ptr) AccessChain 20 21 43
              45:    7(fvec4) Load 44
              46:    7(fvec4) FAdd 42 45
                              Store 9 46
              51:     14(int) Load 50
              52:     17(int) Bitcast 51
              53:     17(int) ShiftLeftLogical 52 34
                              Store 48 53
              55:    7(fvec4) Load 9
              56:    7(fvec4) VectorShuffle 55 55 1 1 1 1
              73:     17(int) Load 48
              74:     17(int) IAdd 73 21
              75:     22(ptr) AccessChain 72 43 74
              76:    7(fvec4) Load 75
              77:    7(fvec4) FMul 56 76
                              Store 54 77
              78:     17(int) Load 48
              79:     22(ptr) AccessChain 72 43 78
              80:    7(fvec4) Load 79
              81:    7(fvec4) Load 9
              82:    7(fvec4) VectorShuffle 81 81 0 0 0 0
              83:    7(fvec4) FMul 80 82
              84:    7(fvec4) Load 54
              85:    7(fvec4) FAdd 83 84
                              Store 54 85
              86:     17(int) Load 48
              87:     17(int) IAdd 86 34
              88:     22(ptr) AccessChain 72 43 87
              89:    7(fvec4) Load 88
              90:    7(fvec4) Load 9
              91:    7(fvec4) VectorShuffle 90 90 2 2 2 2
              92:    7(fvec4) FMul 89 91
              93:    7(fvec4) Load 54
              94:    7(fvec4) FAdd 92 93
                              Store 54 94
              95:     17(int) Load 48
              96:     17(int) IAdd 95 43
              97:     22(ptr) AccessChain 72 43 96
              98:    7(fvec4) Load 97
              99:    7(fvec4) Load 9
             100:    7(fvec4) VectorShuffle 99 99 3 3 3 3
             101:    7(fvec4) FMul 98 100
             102:    7(fvec4) Load 54
             103:    7(fvec4) FAdd 101 102
                              Store 9 103
             109:    7(fvec4) Load 9
             111:    110(ptr) AccessChain 108 26
                              Store 111 109
             115:    7(fvec4) Load 114
             116:   66(fvec3) VectorShuffle 115 115 0 1 2
             119:   66(fvec3) FMul 116 118
             122:   66(fvec3) FAdd 119 121
                              Store 113 122
             123:    7(fvec4) Load 114
             124:   66(fvec3) VectorShuffle 123 123 0 1 2
             125:   66(fvec3) Load 113
             126:   66(fvec3) FMul 124 125
             129:   66(fvec3) FAdd 126 128
                              Store 113 129
             130:    7(fvec4) Load 114
             131:   66(fvec3) VectorShuffle 130 130 0 1 2
             132:   66(fvec3) Load 113
             133:   66(fvec3) FMul 131 132
             136:   66(fvec3) FAdd 133 135
                              Store 113 136
             138:    7(fvec4) Load 114
             139:   66(fvec3) VectorShuffle 138 138 0 1 2
             142:   66(fvec3) FMul 139 141
             145:   66(fvec3) FAdd 142 144
                              Store 137 145
             150:    7(fvec4) Load 114
             151:    7(fvec4) VectorShuffle 150 150 0 1 2 0
             156:  155(bvec4) FOrdLessThan 151 154
             157:  147(bvec3) VectorShuffle 156 156 0 1 2
                              Store 149 157
             160:   66(fvec3) Load 113
                              Store 159 160
             163:    162(ptr) AccessChain 149 161
             164:   146(bool) Load 163
                              SelectionMerge 168 None
                              BranchConditional 164 167 172
             167:               Label
             170:    169(ptr)   AccessChain 137 161
             171:    6(float)   Load 170
                                Store 166 171
                                Branch 168
             172:               Label
             173:    169(ptr)   AccessChain 113 161
             174:    6(float)   Load 173
                                Store 166 174
                                Branch 168
             168:             Label
             175:    6(float) Load 166
             176:    165(ptr) AccessChain 159 161
                              Store 176 175
             177:    162(ptr) AccessChain 149 104
             178:   146(bool) Load 177
                              SelectionMerge 181 None
                              BranchConditional 178 180 184
             180:               Label
             182:    169(ptr)   AccessChain 137 104
             183:    6(float)   Load 182
                                Store 179 183
                                Branch 181
             184:               Label
             185:    169(ptr)   AccessChain 113 104
             186:    6(float)   Load 185
                                Store 179 186
                                Branch 181
             181:             Label
             187:    6(float) Load 179
             188:    165(ptr) AccessChain 159 104
                              Store 188 187
             189:    162(ptr) AccessChain 149 67
             190:   146(bool) Load 189
                              SelectionMerge 193 None
                              BranchConditional 190 192 196
             192:               Label
             194:    169(ptr)   AccessChain 137 67
             195:    6(float)   Load 194
                                Store 191 195
                                Branch 193
             196:               Label
             197:    169(ptr)   AccessChain 113 67
             198:    6(float)   Load 197
                                Store 191 198
                                Branch 193
             193:             Label
             199:    6(float) Load 191
             200:    165(ptr) AccessChain 159 67
                              Store 200 199
             201:   66(fvec3) Load 159
                              Store 113 201
             204:    203(ptr) AccessChain 20 202
             205:     17(int) Load 204
             206:   146(bool) INotEqual 205 26
                              SelectionMerge 209 None
                              BranchConditional 206 208 211
             208:               Label
             210:   66(fvec3)   Load 113
                                Store 207 210
                                Branch 209
             211:               Label
             212:    7(fvec4)   Load 114
             213:   66(fvec3)   VectorShuffle 212 212 0 1 2
                                Store 207 213
                                Branch 209
             209:             Label
             214:   66(fvec3) Load 207
             215:    7(fvec4) Load 54
             216:    7(fvec4) VectorShuffle 215 214 4 5 6 3
                              Store 54 216
             219:    218(ptr) AccessChain 114 217
             220:    6(float) Load 219
             221:    169(ptr) AccessChain 54 217
                              Store 221 220
             222:    7(fvec4) Load 54
             223:     22(ptr) AccessChain 20 34
             224:    7(fvec4) Load 223
             225:    7(fvec4) FMul 222 224
                              Store 54 225
             227:    7(fvec4) Load 54
                              Store 226 227
             233:  228(fvec2) Load 232
             235:     22(ptr) AccessChain 20 234
             236:    7(fvec4) Load 235
             237:  228(fvec2) VectorShuffle 236 236 0 1
             238:  228(fvec2) FMul 233 237
             239:     22(ptr) AccessChain 20 234
             240:    7(fvec4) Load 239
             241:  228(fvec2) VectorShuffle 240 240 2 3
             242:  228(fvec2) FAdd 238 241
                              Store 230(vs_TEXCOORD0) 242
             244:    7(fvec4) Load 11
                              Store 243(vs_TEXCOORD1) 244
             245:     22(ptr) AccessChain 20 26
             246:    7(fvec4) Load 245
             247:  228(fvec2) VectorShuffle 246 246 1 1
             248:     17(int) Load 48
             249:     17(int) IAdd 248 21
             250:     22(ptr) AccessChain 72 26 249
             251:    7(fvec4) Load 250
             252:  228(fvec2) VectorShuffle 251 251 0 1
             253:  228(fvec2) FMul 247 252
             254:    7(fvec4) Load 9
             255:    7(fvec4) VectorShuffle 254 253 4 5 2 3
                              Store 9 255
             256:     17(int) Load 48
             257:     22(ptr) AccessChain 72 26 256
             258:    7(fvec4) Load 257
             259:  228(fvec2) VectorShuffle 258 258 0 1
             260:     22(ptr) AccessChain 20 26
             261:    7(fvec4) Load 260
             262:  228(fvec2) VectorShuffle 261 261 0 0
             263:  228(fvec2) FMul 259 262
             264:    7(fvec4) Load 9
             265:  228(fvec2) VectorShuffle 264 264 0 1
             266:  228(fvec2) FAdd 263 265
             267:    7(fvec4) Load 9
             268:    7(fvec4) VectorShuffle 267 266 4 5 2 3
                              Store 9 268
             269:    7(fvec4) Load 9
             270:  228(fvec2) VectorShuffle 269 269 3 3
             271:    7(fvec4) Load 9
             272:  228(fvec2) VectorShuffle 271 271 0 1
             273:  228(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 272
             274:  228(fvec2) FDiv 270 273
             275:    7(fvec4) Load 9
             276:    7(fvec4) VectorShuffle 275 274 4 5 2 3
                              Store 9 276
             279:    278(ptr) AccessChain 20 277
             280:    6(float) Load 279
             282:    278(ptr) AccessChain 20 281
             283:    6(float) Load 282
             284:  228(fvec2) CompositeConstruct 280 283
             287:  228(fvec2) FMul 284 286
             288:    7(fvec4) Load 9
             289:  228(fvec2) VectorShuffle 288 288 0 1
             290:  228(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 289
             291:  228(fvec2) FAdd 287 290
             292:    7(fvec4) Load 9
             293:    7(fvec4) VectorShuffle 292 291 4 5 2 3
                              Store 9 293
             295:    7(fvec4) Load 9
             296:  228(fvec2) VectorShuffle 295 295 0 1
             297:  228(fvec2) FDiv 286 296
             298:    7(fvec4) Load 294(vs_TEXCOORD2)
             299:    7(fvec4) VectorShuffle 298 297 0 1 4 5
                              Store 294(vs_TEXCOORD2) 299
             300:     22(ptr) AccessChain 20 43
             301:    7(fvec4) Load 300
             304:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 301 303
                              Store 9 304
             305:    7(fvec4) Load 9
             308:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 305 307
                              Store 9 308
             309:    7(fvec4) Load 11
             310:  228(fvec2) VectorShuffle 309 309 0 1
             313:  228(fvec2) FMul 310 312
             314:    7(fvec4) Load 9
             315:  228(fvec2) VectorShuffle 314 314 0 1
             316:  228(fvec2) FNegate 315
             317:  228(fvec2) FAdd 313 316
             318:    7(fvec4) Load 9
             319:    7(fvec4) VectorShuffle 318 317 4 5 2 3
                              Store 9 319
             320:    7(fvec4) Load 9
             321:  228(fvec2) VectorShuffle 320 320 2 3
             322:  228(fvec2) FNegate 321
             323:    7(fvec4) Load 9
             324:  228(fvec2) VectorShuffle 323 323 0 1
             325:  228(fvec2) FAdd 322 324
             326:    7(fvec4) Load 294(vs_TEXCOORD2)
             327:    7(fvec4) VectorShuffle 326 325 4 5 2 3
                              Store 294(vs_TEXCOORD2) 327
             330:     14(int) Load 50
                              Store 329 330
             332:    331(ptr) AccessChain 108 26 104
             333:    6(float) Load 332
             334:    6(float) FNegate 333
             335:    331(ptr) AccessChain 108 26 104
                              Store 335 334
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 132

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 30 65 86 108
                              ExecutionMode 4 OriginUpperLeft
                              Name 30  "vs_TEXCOORD2"
                              Name 86  "vs_TEXCOORD0"
                              MemberDecorate 10 0 RelaxedPrecision
                              MemberDecorate 10 0 Offset 0
                              MemberDecorate 10 1 Offset 16
                              Decorate 10 Block
                              Decorate 12 DescriptorSet 1
                              Decorate 12 Binding 0
                              Decorate 30(vs_TEXCOORD2) Location 2
                              Decorate 55 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 65 RelaxedPrecision
                              Decorate 65 Location 0
                              Decorate 69 RelaxedPrecision
                              Decorate 71 RelaxedPrecision
                              Decorate 72 RelaxedPrecision
                              Decorate 73 RelaxedPrecision
                              Decorate 74 RelaxedPrecision
                              Decorate 75 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 79 RelaxedPrecision
                              Decorate 83 RelaxedPrecision
                              Decorate 83 DescriptorSet 0
                              Decorate 83 Binding 0
                              Decorate 84 RelaxedPrecision
                              Decorate 86(vs_TEXCOORD0) Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 93 RelaxedPrecision
                              Decorate 94 RelaxedPrecision
                              Decorate 96 RelaxedPrecision
                              Decorate 97 RelaxedPrecision
                              Decorate 100 RelaxedPrecision
                              Decorate 103 RelaxedPrecision
                              Decorate 108 RelaxedPrecision
                              Decorate 108 Location 0
                              Decorate 111 RelaxedPrecision
                              Decorate 116 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypeStruct 7(fvec4) 7(fvec4)
              11:             TypePointer Uniform 10(struct)
              12:     11(ptr) Variable Uniform
              13:             TypeInt 32 1
              14:     13(int) Constant 1
              15:             TypeVector 6(float) 2
              16:             TypePointer Uniform 7(fvec4)
              29:             TypePointer Input 7(fvec4)
30(vs_TEXCOORD2):     29(ptr) Variable Input
              47:    6(float) Constant 0
              48:    6(float) Constant 1065353216
              54:             TypePointer Private 6(float)
              55:     54(ptr) Variable Private
              56:             TypeInt 32 0
              57:     56(int) Constant 1
              60:     56(int) Constant 0
              64:     54(ptr) Variable Private
              65:     29(ptr) Variable Input
              66:     56(int) Constant 3
              67:             TypePointer Input 6(float)
              70:    6(float) Constant 1132396544
              74:      8(ptr) Variable Private
              76:    6(float) Constant 998277249
              79:      8(ptr) Variable Private
              80:             TypeImage 6(float) 2D sampled format:Unknown
              81:             TypeSampledImage 80
              82:             TypePointer UniformConstant 81
              83:     82(ptr) Variable UniformConstant
              85:             TypePointer Input 15(fvec2)
86(vs_TEXCOORD0):     85(ptr) Variable Input
              89:      8(ptr) Variable Private
              91:     13(int) Constant 0
              95:             TypeVector 6(float) 3
             107:             TypePointer Output 7(fvec4)
             108:    107(ptr) Variable Output
             117:             TypePointer Output 6(float)
             120:             TypePointer Function 7(fvec4)
             122:             TypeVector 13(int) 4
             123:             TypePointer Function 122(ivec4)
             125:             TypeBool
             126:             TypeVector 125(bool) 4
             127:             TypePointer Function 126(bvec4)
             129:             TypeVector 56(int) 4
             130:             TypePointer Function 129(ivec4)
               4:           2 Function None 3
               5:             Label
             121:    120(ptr) Variable Function
             124:    123(ptr) Variable Function
             128:    127(ptr) Variable Function
             131:    130(ptr) Variable Function
              17:     16(ptr) AccessChain 12 14
              18:    7(fvec4) Load 17
              19:   15(fvec2) VectorShuffle 18 18 0 1
              20:   15(fvec2) FNegate 19
              21:     16(ptr) AccessChain 12 14
              22:    7(fvec4) Load 21
              23:   15(fvec2) VectorShuffle 22 22 2 3
              24:   15(fvec2) FAdd 20 23
              25:    7(fvec4) Load 9
              26:    7(fvec4) VectorShuffle 25 24 4 5 2 3
                              Store 9 26
              27:    7(fvec4) Load 9
              28:   15(fvec2) VectorShuffle 27 27 0 1
              31:    7(fvec4) Load 30(vs_TEXCOORD2)
              32:   15(fvec2) VectorShuffle 31 31 0 1
              33:   15(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 32
              34:   15(fvec2) FNegate 33
              35:   15(fvec2) FAdd 28 34
              36:    7(fvec4) Load 9
              37:    7(fvec4) VectorShuffle 36 35 4 5 2 3
                              Store 9 37
              38:    7(fvec4) Load 9
              39:   15(fvec2) VectorShuffle 38 38 0 1
              40:    7(fvec4) Load 30(vs_TEXCOORD2)
              41:   15(fvec2) VectorShuffle 40 40 2 3
              42:   15(fvec2) FMul 39 41
              43:    7(fvec4) Load 9
              44:    7(fvec4) VectorShuffle 43 42 4 5 2 3
                              Store 9 44
              45:    7(fvec4) Load 9
              46:   15(fvec2) VectorShuffle 45 45 0 1
              49:   15(fvec2) CompositeConstruct 47 47
              50:   15(fvec2) CompositeConstruct 48 48
              51:   15(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 46 49 50
              52:    7(fvec4) Load 9
              53:    7(fvec4) VectorShuffle 52 51 4 5 2 3
                              Store 9 53
              58:     54(ptr) AccessChain 9 57
              59:    6(float) Load 58
              61:     54(ptr) AccessChain 9 60
              62:    6(float) Load 61
              63:    6(float) FMul 59 62
                              Store 55 63
              68:     67(ptr) AccessChain 65 66
              69:    6(float) Load 68
              71:    6(float) FMul 69 70
                              Store 64 71
              72:    6(float) Load 64
              73:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 72
                              Store 64 73
              75:    6(float) Load 64
              77:    6(float) FMul 75 76
              78:     54(ptr) AccessChain 74 66
                              Store 78 77
              84:          81 Load 83
              87:   15(fvec2) Load 86(vs_TEXCOORD0)
              88:    7(fvec4) ImageSampleImplicitLod 84 87
                              Store 79 88
              90:    7(fvec4) Load 79
              92:     16(ptr) AccessChain 12 91
              93:    7(fvec4) Load 92
              94:    7(fvec4) FAdd 90 93
                              Store 89 94
              96:    7(fvec4) Load 65
              97:   95(fvec3) VectorShuffle 96 96 0 1 2
              98:    7(fvec4) Load 74
              99:    7(fvec4) VectorShuffle 98 97 4 5 6 3
                              Store 74 99
             100:    7(fvec4) Load 74
             101:    7(fvec4) Load 89
             102:    7(fvec4) FMul 100 101
                              Store 9 102
             103:    6(float) Load 55
             104:     54(ptr) AccessChain 9 66
             105:    6(float) Load 104
             106:    6(float) FMul 103 105
                              Store 55 106
             109:    7(fvec4) Load 9
             110:   95(fvec3) VectorShuffle 109 109 0 1 2
             111:    6(float) Load 55
             112:   95(fvec3) CompositeConstruct 111 111 111
             113:   95(fvec3) FMul 110 112
             114:    7(fvec4) Load 108
             115:    7(fvec4) VectorShuffle 114 113 4 5 6 3
                              Store 108 115
             116:    6(float) Load 55
             118:    117(ptr) AccessChain 108 66
                              Store 118 116
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 0, used in: Fragment  no sampler

Constant Buffer "PGlobals1719067403" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals1719067403" (268 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
  ScalarInt _UIVertexColorAlwaysGammaSpace at 264
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 317

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 87 201 205 207 218 266
                              Name 205  "vs_TEXCOORD0"
                              Name 218  "vs_TEXCOORD1"
                              Name 266  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 20 0 Offset 0
                              MemberDecorate 20 1 Offset 16
                              MemberDecorate 20 2 Offset 80
                              MemberDecorate 20 3 Offset 144
                              MemberDecorate 20 4 RelaxedPrecision
                              MemberDecorate 20 4 Offset 208
                              MemberDecorate 20 5 Offset 224
                              MemberDecorate 20 6 Offset 240
                              MemberDecorate 20 7 Offset 256
                              MemberDecorate 20 8 Offset 260
                              MemberDecorate 20 9 Offset 264
                              Decorate 20 Block
                              Decorate 22 DescriptorSet 1
                              Decorate 22 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 86 RelaxedPrecision
                              Decorate 87 Location 1
                              Decorate 98 RelaxedPrecision
                              Decorate 105 RelaxedPrecision
                              Decorate 110 RelaxedPrecision
                              Decorate 133 RelaxedPrecision
                              Decorate 139 RelaxedPrecision
                              Decorate 144 RelaxedPrecision
                              Decorate 147 RelaxedPrecision
                              Decorate 148 RelaxedPrecision
                              Decorate 152 RelaxedPrecision
                              Decorate 156 RelaxedPrecision
                              Decorate 159 RelaxedPrecision
                              Decorate 160 RelaxedPrecision
                              Decorate 165 RelaxedPrecision
                              Decorate 169 RelaxedPrecision
                              Decorate 172 RelaxedPrecision
                              Decorate 173 RelaxedPrecision
                              Decorate 184 RelaxedPrecision
                              Decorate 199 RelaxedPrecision
                              Decorate 201 RelaxedPrecision
                              Decorate 201 Location 0
                              Decorate 205(vs_TEXCOORD0) Location 1
                              Decorate 207 Location 2
                              Decorate 218(vs_TEXCOORD1) Location 3
                              Decorate 266(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeInt 32 1
              20:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float) 19(int)
              21:             TypePointer Uniform 20(struct)
              22:     21(ptr) Variable Uniform
              23:     19(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     19(int) Constant 0
              36:     19(int) Constant 2
              45:     19(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:             TypeVector 6(float) 3
              85:             TypePointer Private 84(fvec3)
              86:     85(ptr) Variable Private
              87:     10(ptr) Variable Input
              90:    6(float) Constant 1049109012
              91:   84(fvec3) ConstantComposite 90 90 90
              93:    6(float) Constant 1060933829
              94:   84(fvec3) ConstantComposite 93 93 93
             100:    6(float) Constant 3156252646
             101:   84(fvec3) ConstantComposite 100 100 100
             107:    6(float) Constant 995198018
             108:   84(fvec3) ConstantComposite 107 107 107
             110:     85(ptr) Variable Private
             113:    6(float) Constant 1034814791
             114:   84(fvec3) ConstantComposite 113 113 113
             116:    6(float) Constant 3106599620
             117:   84(fvec3) ConstantComposite 116 116 116
             119:             TypeBool
             120:             TypeVector 119(bool) 3
             121:             TypePointer Private 120(bvec3)
             122:    121(ptr) Variable Private
             125:    6(float) Constant 1033147538
             126:    6(float) Constant 0
             127:    7(fvec4) ConstantComposite 125 125 125 126
             128:             TypeVector 119(bool) 4
             131:             TypePointer Function 84(fvec3)
             134:     14(int) Constant 0
             135:             TypePointer Private 119(bool)
             138:             TypePointer Function 6(float)
             142:             TypePointer Private 6(float)
             162:     14(int) Constant 2
             176:     19(int) Constant 9
             177:             TypePointer Uniform 19(int)
             191:     14(int) Constant 3
             192:             TypePointer Input 6(float)
             197:     19(int) Constant 4
             201:     82(ptr) Variable Output
             203:             TypeVector 6(float) 2
             204:             TypePointer Output 203(fvec2)
205(vs_TEXCOORD0):    204(ptr) Variable Output
             206:             TypePointer Input 203(fvec2)
             207:    206(ptr) Variable Input
             209:     19(int) Constant 6
218(vs_TEXCOORD1):     82(ptr) Variable Output
             249:     19(int) Constant 7
             250:             TypePointer Uniform 6(float)
             253:     19(int) Constant 8
             257:    6(float) Constant 1048576000
             258:  203(fvec2) ConstantComposite 257 257
266(vs_TEXCOORD2):     82(ptr) Variable Output
             272:     19(int) Constant 5
             275:    6(float) Constant 3499426553
             276:    7(fvec4) ConstantComposite 275 275 275 275
             279:    6(float) Constant 1351942905
             280:    7(fvec4) ConstantComposite 279 279 279 279
             284:    6(float) Constant 1073741824
             285:  203(fvec2) ConstantComposite 284 284
             301:             TypePointer Output 6(float)
             307:             TypePointer Function 7(fvec4)
             309:             TypeVector 19(int) 4
             310:             TypePointer Function 309(ivec4)
             312:             TypePointer Function 128(bvec4)
             314:             TypeVector 14(int) 4
             315:             TypePointer Function 314(ivec4)
               4:           2 Function None 3
               5:             Label
             132:    131(ptr) Variable Function
             139:    138(ptr) Variable Function
             152:    138(ptr) Variable Function
             165:    138(ptr) Variable Function
             181:    131(ptr) Variable Function
             308:    307(ptr) Variable Function
             311:    310(ptr) Variable Function
             313:    312(ptr) Variable Function
             316:    315(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 22 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 22 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 22 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 22 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 22 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 22 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 22 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 22 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              88:    7(fvec4) Load 87
              89:   84(fvec3) VectorShuffle 88 88 0 1 2
              92:   84(fvec3) FMul 89 91
              95:   84(fvec3) FAdd 92 94
                              Store 86 95
              96:    7(fvec4) Load 87
              97:   84(fvec3) VectorShuffle 96 96 0 1 2
              98:   84(fvec3) Load 86
              99:   84(fvec3) FMul 97 98
             102:   84(fvec3) FAdd 99 101
                              Store 86 102
             103:    7(fvec4) Load 87
             104:   84(fvec3) VectorShuffle 103 103 0 1 2
             105:   84(fvec3) Load 86
             106:   84(fvec3) FMul 104 105
             109:   84(fvec3) FAdd 106 108
                              Store 86 109
             111:    7(fvec4) Load 87
             112:   84(fvec3) VectorShuffle 111 111 0 1 2
             115:   84(fvec3) FMul 112 114
             118:   84(fvec3) FAdd 115 117
                              Store 110 118
             123:    7(fvec4) Load 87
             124:    7(fvec4) VectorShuffle 123 123 0 1 2 0
             129:  128(bvec4) FOrdLessThan 124 127
             130:  120(bvec3) VectorShuffle 129 129 0 1 2
                              Store 122 130
             133:   84(fvec3) Load 86
                              Store 132 133
             136:    135(ptr) AccessChain 122 134
             137:   119(bool) Load 136
                              SelectionMerge 141 None
                              BranchConditional 137 140 145
             140:               Label
             143:    142(ptr)   AccessChain 110 134
             144:    6(float)   Load 143
                                Store 139 144
                                Branch 141
             145:               Label
             146:    142(ptr)   AccessChain 86 134
             147:    6(float)   Load 146
                                Store 139 147
                                Branch 141
             141:             Label
             148:    6(float) Load 139
             149:    138(ptr) AccessChain 132 134
                              Store 149 148
             150:    135(ptr) AccessChain 122 76
             151:   119(bool) Load 150
                              SelectionMerge 154 None
                              BranchConditional 151 153 157
             153:               Label
             155:    142(ptr)   AccessChain 110 76
             156:    6(float)   Load 155
                                Store 152 156
                                Branch 154
             157:               Label
             158:    142(ptr)   AccessChain 86 76
             159:    6(float)   Load 158
                                Store 152 159
                                Branch 154
             154:             Label
             160:    6(float) Load 152
             161:    138(ptr) AccessChain 132 76
                              Store 161 160
             163:    135(ptr) AccessChain 122 162
             164:   119(bool) Load 163
                              SelectionMerge 167 None
                              BranchConditional 164 166 170
             166:               Label
             168:    142(ptr)   AccessChain 110 162
             169:    6(float)   Load 168
                                Store 165 169
                                Branch 167
             170:               Label
             171:    142(ptr)   AccessChain 86 162
             172:    6(float)   Load 171
                                Store 165 172
                                Branch 167
             167:             Label
             173:    6(float) Load 165
             174:    138(ptr) AccessChain 132 162
                              Store 174 173
             175:   84(fvec3) Load 132
                              Store 86 175
             178:    177(ptr) AccessChain 22 176
             179:     19(int) Load 178
             180:   119(bool) INotEqual 179 28
                              SelectionMerge 183 None
                              BranchConditional 180 182 185
             182:               Label
             184:   84(fvec3)   Load 86
                                Store 181 184
                                Branch 183
             185:               Label
             186:    7(fvec4)   Load 87
             187:   84(fvec3)   VectorShuffle 186 186 0 1 2
                                Store 181 187
                                Branch 183
             183:             Label
             188:   84(fvec3) Load 181
             189:    7(fvec4) Load 49
             190:    7(fvec4) VectorShuffle 189 188 4 5 6 3
                              Store 49 190
             193:    192(ptr) AccessChain 87 191
             194:    6(float) Load 193
             195:    142(ptr) AccessChain 49 191
                              Store 195 194
             196:    7(fvec4) Load 49
             198:     24(ptr) AccessChain 22 197
             199:    7(fvec4) Load 198
             200:    7(fvec4) FMul 196 199
                              Store 49 200
             202:    7(fvec4) Load 49
                              Store 201 202
             208:  203(fvec2) Load 207
             210:     24(ptr) AccessChain 22 209
             211:    7(fvec4) Load 210
             212:  203(fvec2) VectorShuffle 211 211 0 1
             213:  203(fvec2) FMul 208 212
             214:     24(ptr) AccessChain 22 209
             215:    7(fvec4) Load 214
             216:  203(fvec2) VectorShuffle 215 215 2 3
             217:  203(fvec2) FAdd 213 216
                              Store 205(vs_TEXCOORD0) 217
             219:    7(fvec4) Load 11
                              Store 218(vs_TEXCOORD1) 219
             220:     24(ptr) AccessChain 22 28
             221:    7(fvec4) Load 220
             222:  203(fvec2) VectorShuffle 221 221 1 1
             223:     24(ptr) AccessChain 22 36 23
             224:    7(fvec4) Load 223
             225:  203(fvec2) VectorShuffle 224 224 0 1
             226:  203(fvec2) FMul 222 225
             227:    7(fvec4) Load 9
             228:    7(fvec4) VectorShuffle 227 226 4 5 2 3
                              Store 9 228
             229:     24(ptr) AccessChain 22 36 28
             230:    7(fvec4) Load 229
             231:  203(fvec2) VectorShuffle 230 230 0 1
             232:     24(ptr) AccessChain 22 28
             233:    7(fvec4) Load 232
             234:  203(fvec2) VectorShuffle 233 233 0 0
             235:  203(fvec2) FMul 231 234
             236:    7(fvec4) Load 9
             237:  203(fvec2) VectorShuffle 236 236 0 1
             238:  203(fvec2) FAdd 235 237
             239:    7(fvec4) Load 9
             240:    7(fvec4) VectorShuffle 239 238 4 5 2 3
                              Store 9 240
             241:    7(fvec4) Load 9
             242:  203(fvec2) VectorShuffle 241 241 3 3
             243:    7(fvec4) Load 9
             244:  203(fvec2) VectorShuffle 243 243 0 1
             245:  203(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 244
             246:  203(fvec2) FDiv 242 245
             247:    7(fvec4) Load 9
             248:    7(fvec4) VectorShuffle 247 246 4 5 2 3
                              Store 9 248
             251:    250(ptr) AccessChain 22 249
             252:    6(float) Load 251
             254:    250(ptr) AccessChain 22 253
             255:    6(float) Load 254
             256:  203(fvec2) CompositeConstruct 252 255
             259:  203(fvec2) FMul 256 258
             260:    7(fvec4) Load 9
             261:  203(fvec2) VectorShuffle 260 260 0 1
             262:  203(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 261
             263:  203(fvec2) FAdd 259 262
             264:    7(fvec4) Load 9
             265:    7(fvec4) VectorShuffle 264 263 4 5 2 3
                              Store 9 265
             267:    7(fvec4) Load 9
             268:  203(fvec2) VectorShuffle 267 267 0 1
             269:  203(fvec2) FDiv 258 268
             270:    7(fvec4) Load 266(vs_TEXCOORD2)
             271:    7(fvec4) VectorShuffle 270 269 0 1 4 5
                              Store 266(vs_TEXCOORD2) 271
             273:     24(ptr) AccessChain 22 272
             274:    7(fvec4) Load 273
             277:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 274 276
                              Store 9 277
             278:    7(fvec4) Load 9
             281:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 278 280
                              Store 9 281
             282:    7(fvec4) Load 11
             283:  203(fvec2) VectorShuffle 282 282 0 1
             286:  203(fvec2) FMul 283 285
             287:    7(fvec4) Load 9
             288:  203(fvec2) VectorShuffle 287 287 0 1
             289:  203(fvec2) FNegate 288
             290:  203(fvec2) FAdd 286 289
             291:    7(fvec4) Load 9
             292:    7(fvec4) VectorShuffle 291 290 4 5 2 3
                              Store 9 292
             293:    7(fvec4) Load 9
             294:  203(fvec2) VectorShuffle 293 293 2 3
             295:  203(fvec2) FNegate 294
             296:    7(fvec4) Load 9
             297:  203(fvec2) VectorShuffle 296 296 0 1
             298:  203(fvec2) FAdd 295 297
             299:    7(fvec4) Load 266(vs_TEXCOORD2)
             300:    7(fvec4) VectorShuffle 299 298 4 5 2 3
                              Store 266(vs_TEXCOORD2) 300
             302:    301(ptr) AccessChain 80 28 76
             303:    6(float) Load 302
             304:    6(float) FNegate 303
             305:    301(ptr) AccessChain 80 28 76
                              Store 305 304
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 154

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 39 75 118
                              ExecutionMode 4 OriginUpperLeft
                              Name 39  "vs_TEXCOORD0"
                              Name 75  "vs_TEXCOORD2"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 35 RelaxedPrecision
                              Decorate 35 DescriptorSet 0
                              Decorate 35 Binding 0
                              Decorate 36 RelaxedPrecision
                              Decorate 39(vs_TEXCOORD0) Location 1
                              Decorate 41 RelaxedPrecision
                              Decorate 43 RelaxedPrecision
                              MemberDecorate 44 0 RelaxedPrecision
                              MemberDecorate 44 0 Offset 0
                              MemberDecorate 44 1 Offset 16
                              Decorate 44 Block
                              Decorate 46 DescriptorSet 1
                              Decorate 46 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 54 RelaxedPrecision
                              Decorate 55 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 75(vs_TEXCOORD2) Location 2
                              Decorate 99 RelaxedPrecision
                              Decorate 106 RelaxedPrecision
                              Decorate 109 RelaxedPrecision
                              Decorate 115 RelaxedPrecision
                              Decorate 118 RelaxedPrecision
                              Decorate 118 Location 0
                              Decorate 121 RelaxedPrecision
                              Decorate 126 RelaxedPrecision
                              Decorate 132 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypeSampledImage 32
              34:             TypePointer UniformConstant 33
              35:     34(ptr) Variable UniformConstant
              37:             TypeVector 6(float) 2
              38:             TypePointer Input 37(fvec2)
39(vs_TEXCOORD0):     38(ptr) Variable Input
              42:      8(ptr) Variable Private
              44:             TypeStruct 7(fvec4) 7(fvec4)
              45:             TypePointer Uniform 44(struct)
              46:     45(ptr) Variable Uniform
              47:             TypeInt 32 1
              48:     47(int) Constant 0
              49:             TypePointer Uniform 7(fvec4)
              53:             TypeVector 6(float) 3
              58:      8(ptr) Variable Private
              62:     47(int) Constant 1
75(vs_TEXCOORD2):     10(ptr) Variable Input
              92:    6(float) Constant 0
              93:    6(float) Constant 1065353216
              99:     20(ptr) Variable Private
             100:     12(int) Constant 1
             106:     20(ptr) Variable Private
             111:    6(float) Constant 3129152111
             117:             TypePointer Output 7(fvec4)
             118:    117(ptr) Variable Output
             127:             TypePointer Output 6(float)
             129:             TypeBool
             130:             TypePointer Private 129(bool)
             131:    130(ptr) Variable Private
             136:     47(int) Constant 4294967295
             143:             TypePointer Function 7(fvec4)
             145:             TypeVector 47(int) 4
             146:             TypePointer Function 145(ivec4)
             148:             TypeVector 129(bool) 4
             149:             TypePointer Function 148(bvec4)
             151:             TypeVector 12(int) 4
             152:             TypePointer Function 151(ivec4)
               4:           2 Function None 3
               5:             Label
             144:    143(ptr) Variable Function
             147:    146(ptr) Variable Function
             150:    149(ptr) Variable Function
             153:    152(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              36:          33 Load 35
              40:   37(fvec2) Load 39(vs_TEXCOORD0)
              41:    7(fvec4) ImageSampleImplicitLod 36 40
                              Store 31 41
              43:    7(fvec4) Load 31
              50:     49(ptr) AccessChain 46 48
              51:    7(fvec4) Load 50
              52:    7(fvec4) FAdd 43 51
                              Store 42 52
              54:    7(fvec4) Load 11
              55:   53(fvec3) VectorShuffle 54 54 0 1 2
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 55 4 5 6 3
                              Store 9 57
              59:    7(fvec4) Load 9
              60:    7(fvec4) Load 42
              61:    7(fvec4) FMul 59 60
                              Store 58 61
              63:     49(ptr) AccessChain 46 62
              64:    7(fvec4) Load 63
              65:   37(fvec2) VectorShuffle 64 64 0 1
              66:   37(fvec2) FNegate 65
              67:     49(ptr) AccessChain 46 62
              68:    7(fvec4) Load 67
              69:   37(fvec2) VectorShuffle 68 68 2 3
              70:   37(fvec2) FAdd 66 69
              71:    7(fvec4) Load 42
              72:    7(fvec4) VectorShuffle 71 70 4 5 2 3
                              Store 42 72
              73:    7(fvec4) Load 42
              74:   37(fvec2) VectorShuffle 73 73 0 1
              76:    7(fvec4) Load 75(vs_TEXCOORD2)
              77:   37(fvec2) VectorShuffle 76 76 0 1
              78:   37(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 77
              79:   37(fvec2) FNegate 78
              80:   37(fvec2) FAdd 74 79
              81:    7(fvec4) Load 42
              82:    7(fvec4) VectorShuffle 81 80 4 5 2 3
                              Store 42 82
              83:    7(fvec4) Load 42
              84:   37(fvec2) VectorShuffle 83 83 0 1
              85:    7(fvec4) Load 75(vs_TEXCOORD2)
              86:   37(fvec2) VectorShuffle 85 85 2 3
              87:   37(fvec2) FMul 84 86
              88:    7(fvec4) Load 42
              89:    7(fvec4) VectorShuffle 88 87 4 5 2 3
                              Store 42 89
              90:    7(fvec4) Load 42
              91:   37(fvec2) VectorShuffle 90 90 0 1
              94:   37(fvec2) CompositeConstruct 92 92
              95:   37(fvec2) CompositeConstruct 93 93
              96:   37(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 91 94 95
              97:    7(fvec4) Load 42
              98:    7(fvec4) VectorShuffle 97 96 4 5 2 3
                              Store 42 98
             101:     20(ptr) AccessChain 42 100
             102:    6(float) Load 101
             103:     20(ptr) AccessChain 42 19
             104:    6(float) Load 103
             105:    6(float) FMul 102 104
                              Store 99 105
             107:     20(ptr) AccessChain 58 13
             108:    6(float) Load 107
             109:    6(float) Load 99
             110:    6(float) FMul 108 109
             112:    6(float) FAdd 110 111
                              Store 106 112
             113:     20(ptr) AccessChain 58 13
             114:    6(float) Load 113
             115:    6(float) Load 99
             116:    6(float) FMul 114 115
                              Store 99 116
             119:    7(fvec4) Load 58
             120:   53(fvec3) VectorShuffle 119 119 0 1 2
             121:    6(float) Load 99
             122:   53(fvec3) CompositeConstruct 121 121 121
             123:   53(fvec3) FMul 120 122
             124:    7(fvec4) Load 118
             125:    7(fvec4) VectorShuffle 124 123 4 5 6 3
                              Store 118 125
             126:    6(float) Load 99
             128:    127(ptr) AccessChain 118 13
                              Store 128 126
             132:    6(float) Load 106
             133:   129(bool) FOrdLessThan 132 92
                              Store 131 133
             134:   129(bool) Load 131
             135:     47(int) Select 134 62 48
             137:     47(int) IMul 135 136
             138:   129(bool) INotEqual 137 48
                              SelectionMerge 140 None
                              BranchConditional 138 139 140
             139:               Label
                                Kill
             140:             Label
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: STEREO_MULTIVIEW_ON UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 0, used in: Fragment  no sampler

Constant Buffer "PGlobals79058526" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "UnityStereoGlobals" (1088 bytes) on set: 1, binding: 2, used in: Vertex  {
  Matrix4x4 unity_StereoMatrixP[2] at 0
  Matrix4x4 unity_StereoMatrixVP[2] at 384
}
Constant Buffer "VGlobals79058526" (140 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 96
  Vector4 _Color at 80
  Vector4 _MainTex_ST at 112
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 128
  Float _UIMaskSoftnessY at 132
  ScalarInt _UIVertexColorAlwaysGammaSpace at 136
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 347

                              Capability Shader
                              Capability MultiView
                              Extension  "SPV_KHR_multiview"
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 50 108 114 226 230 232 243 294 329
                              Name 230  "vs_TEXCOORD0"
                              Name 243  "vs_TEXCOORD1"
                              Name 294  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              MemberDecorate 18 0 Offset 0
                              MemberDecorate 18 1 Offset 16
                              MemberDecorate 18 2 RelaxedPrecision
                              MemberDecorate 18 2 Offset 80
                              MemberDecorate 18 3 Offset 96
                              MemberDecorate 18 4 Offset 112
                              MemberDecorate 18 5 Offset 128
                              MemberDecorate 18 6 Offset 132
                              MemberDecorate 18 7 Offset 136
                              Decorate 18 Block
                              Decorate 20 DescriptorSet 1
                              Decorate 20 Binding 1
                              Decorate 50 BuiltIn ViewIndex
                              Decorate 58 ArrayStride 16
                              Decorate 59 ArrayStride 16
                              Decorate 60 ArrayStride 16
                              Decorate 61 ArrayStride 16
                              Decorate 62 ArrayStride 16
                              Decorate 63 ArrayStride 16
                              Decorate 64 ArrayStride 16
                              Decorate 65 ArrayStride 16
                              Decorate 68 ArrayStride 16
                              Decorate 69 ArrayStride 16
                              MemberDecorate 70 0 Offset 0
                              MemberDecorate 70 1 Offset 128
                              MemberDecorate 70 2 Offset 256
                              MemberDecorate 70 3 Offset 384
                              MemberDecorate 70 4 Offset 512
                              MemberDecorate 70 5 Offset 640
                              MemberDecorate 70 6 Offset 768
                              MemberDecorate 70 7 Offset 896
                              MemberDecorate 70 8 Offset 1024
                              MemberDecorate 70 9 Offset 1056
                              Decorate 70 Block
                              Decorate 72 DescriptorSet 1
                              Decorate 72 Binding 2
                              MemberDecorate 106 0 BuiltIn Position
                              MemberDecorate 106 1 BuiltIn PointSize
                              MemberDecorate 106 2 BuiltIn ClipDistance
                              Decorate 106 Block
                              Decorate 113 RelaxedPrecision
                              Decorate 114 Location 1
                              Decorate 125 RelaxedPrecision
                              Decorate 132 RelaxedPrecision
                              Decorate 137 RelaxedPrecision
                              Decorate 160 RelaxedPrecision
                              Decorate 166 RelaxedPrecision
                              Decorate 171 RelaxedPrecision
                              Decorate 174 RelaxedPrecision
                              Decorate 175 RelaxedPrecision
                              Decorate 179 RelaxedPrecision
                              Decorate 183 RelaxedPrecision
                              Decorate 186 RelaxedPrecision
                              Decorate 187 RelaxedPrecision
                              Decorate 191 RelaxedPrecision
                              Decorate 195 RelaxedPrecision
                              Decorate 198 RelaxedPrecision
                              Decorate 199 RelaxedPrecision
                              Decorate 210 RelaxedPrecision
                              Decorate 224 RelaxedPrecision
                              Decorate 226 RelaxedPrecision
                              Decorate 226 Location 0
                              Decorate 230(vs_TEXCOORD0) Location 1
                              Decorate 232 Location 2
                              Decorate 243(vs_TEXCOORD1) Location 3
                              Decorate 294(vs_TEXCOORD2) Location 2
                              Decorate 329 Flat
                              Decorate 329 Location 4
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeInt 32 1
              18:             TypeStruct 7(fvec4) 16 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float) 17(int)
              19:             TypePointer Uniform 18(struct)
              20:     19(ptr) Variable Uniform
              21:     17(int) Constant 1
              22:             TypePointer Uniform 7(fvec4)
              26:     17(int) Constant 0
              34:     17(int) Constant 2
              43:     17(int) Constant 3
              47:             TypePointer Private 17(int)
              48:     47(ptr) Variable Private
              49:             TypePointer Input 14(int)
              50:     49(ptr) Variable Input
              54:      8(ptr) Variable Private
              57:     14(int) Constant 8
              58:             TypeArray 7(fvec4) 57
              59:             TypeArray 7(fvec4) 57
              60:             TypeArray 7(fvec4) 57
              61:             TypeArray 7(fvec4) 57
              62:             TypeArray 7(fvec4) 57
              63:             TypeArray 7(fvec4) 57
              64:             TypeArray 7(fvec4) 57
              65:             TypeArray 7(fvec4) 57
              66:             TypeVector 6(float) 3
              67:     14(int) Constant 2
              68:             TypeArray 66(fvec3) 67
              69:             TypeArray 7(fvec4) 67
              70:             TypeStruct 58 59 60 61 62 63 64 65 68 69
              71:             TypePointer Uniform 70(struct)
              72:     71(ptr) Variable Uniform
             104:     14(int) Constant 1
             105:             TypeArray 6(float) 104
             106:             TypeStruct 7(fvec4) 6(float) 105
             107:             TypePointer Output 106(struct)
             108:    107(ptr) Variable Output
             110:             TypePointer Output 7(fvec4)
             112:             TypePointer Private 66(fvec3)
             113:    112(ptr) Variable Private
             114:     10(ptr) Variable Input
             117:    6(float) Constant 1049109012
             118:   66(fvec3) ConstantComposite 117 117 117
             120:    6(float) Constant 1060933829
             121:   66(fvec3) ConstantComposite 120 120 120
             127:    6(float) Constant 3156252646
             128:   66(fvec3) ConstantComposite 127 127 127
             134:    6(float) Constant 995198018
             135:   66(fvec3) ConstantComposite 134 134 134
             137:    112(ptr) Variable Private
             140:    6(float) Constant 1034814791
             141:   66(fvec3) ConstantComposite 140 140 140
             143:    6(float) Constant 3106599620
             144:   66(fvec3) ConstantComposite 143 143 143
             146:             TypeBool
             147:             TypeVector 146(bool) 3
             148:             TypePointer Private 147(bvec3)
             149:    148(ptr) Variable Private
             152:    6(float) Constant 1033147538
             153:    6(float) Constant 0
             154:    7(fvec4) ConstantComposite 152 152 152 153
             155:             TypeVector 146(bool) 4
             158:             TypePointer Function 66(fvec3)
             161:     14(int) Constant 0
             162:             TypePointer Private 146(bool)
             165:             TypePointer Function 6(float)
             169:             TypePointer Private 6(float)
             202:     17(int) Constant 7
             203:             TypePointer Uniform 17(int)
             217:     14(int) Constant 3
             218:             TypePointer Input 6(float)
             226:    110(ptr) Variable Output
             228:             TypeVector 6(float) 2
             229:             TypePointer Output 228(fvec2)
230(vs_TEXCOORD0):    229(ptr) Variable Output
             231:             TypePointer Input 228(fvec2)
             232:    231(ptr) Variable Input
             234:     17(int) Constant 4
243(vs_TEXCOORD1):    110(ptr) Variable Output
             277:     17(int) Constant 5
             278:             TypePointer Uniform 6(float)
             281:     17(int) Constant 6
             285:    6(float) Constant 1048576000
             286:  228(fvec2) ConstantComposite 285 285
294(vs_TEXCOORD2):    110(ptr) Variable Output
             302:    6(float) Constant 3499426553
             303:    7(fvec4) ConstantComposite 302 302 302 302
             306:    6(float) Constant 1351942905
             307:    7(fvec4) ConstantComposite 306 306 306 306
             311:    6(float) Constant 1073741824
             312:  228(fvec2) ConstantComposite 311 311
             328:             TypePointer Output 14(int)
             329:    328(ptr) Variable Output
             331:             TypePointer Output 6(float)
             337:             TypePointer Function 7(fvec4)
             339:             TypeVector 17(int) 4
             340:             TypePointer Function 339(ivec4)
             342:             TypePointer Function 155(bvec4)
             344:             TypeVector 14(int) 4
             345:             TypePointer Function 344(ivec4)
               4:           2 Function None 3
               5:             Label
             159:    158(ptr) Variable Function
             166:    165(ptr) Variable Function
             179:    165(ptr) Variable Function
             191:    165(ptr) Variable Function
             207:    158(ptr) Variable Function
             338:    337(ptr) Variable Function
             341:    340(ptr) Variable Function
             343:    342(ptr) Variable Function
             346:    345(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              23:     22(ptr) AccessChain 20 21 21
              24:    7(fvec4) Load 23
              25:    7(fvec4) FMul 13 24
                              Store 9 25
              27:     22(ptr) AccessChain 20 21 26
              28:    7(fvec4) Load 27
              29:    7(fvec4) Load 11
              30:    7(fvec4) VectorShuffle 29 29 0 0 0 0
              31:    7(fvec4) FMul 28 30
              32:    7(fvec4) Load 9
              33:    7(fvec4) FAdd 31 32
                              Store 9 33
              35:     22(ptr) AccessChain 20 21 34
              36:    7(fvec4) Load 35
              37:    7(fvec4) Load 11
              38:    7(fvec4) VectorShuffle 37 37 2 2 2 2
              39:    7(fvec4) FMul 36 38
              40:    7(fvec4) Load 9
              41:    7(fvec4) FAdd 39 40
                              Store 9 41
              42:    7(fvec4) Load 9
              44:     22(ptr) AccessChain 20 21 43
              45:    7(fvec4) Load 44
              46:    7(fvec4) FAdd 42 45
                              Store 9 46
              51:     14(int) Load 50
              52:     17(int) Bitcast 51
              53:     17(int) ShiftLeftLogical 52 34
                              Store 48 53
              55:    7(fvec4) Load 9
              56:    7(fvec4) VectorShuffle 55 55 1 1 1 1
              73:     17(int) Load 48
              74:     17(int) IAdd 73 21
              75:     22(ptr) AccessChain 72 43 74
              76:    7(fvec4) Load 75
              77:    7(fvec4) FMul 56 76
                              Store 54 77
              78:     17(int) Load 48
              79:     22(ptr) AccessChain 72 43 78
              80:    7(fvec4) Load 79
              81:    7(fvec4) Load 9
              82:    7(fvec4) VectorShuffle 81 81 0 0 0 0
              83:    7(fvec4) FMul 80 82
              84:    7(fvec4) Load 54
              85:    7(fvec4) FAdd 83 84
                              Store 54 85
              86:     17(int) Load 48
              87:     17(int) IAdd 86 34
              88:     22(ptr) AccessChain 72 43 87
              89:    7(fvec4) Load 88
              90:    7(fvec4) Load 9
              91:    7(fvec4) VectorShuffle 90 90 2 2 2 2
              92:    7(fvec4) FMul 89 91
              93:    7(fvec4) Load 54
              94:    7(fvec4) FAdd 92 93
                              Store 54 94
              95:     17(int) Load 48
              96:     17(int) IAdd 95 43
              97:     22(ptr) AccessChain 72 43 96
              98:    7(fvec4) Load 97
              99:    7(fvec4) Load 9
             100:    7(fvec4) VectorShuffle 99 99 3 3 3 3
             101:    7(fvec4) FMul 98 100
             102:    7(fvec4) Load 54
             103:    7(fvec4) FAdd 101 102
                              Store 9 103
             109:    7(fvec4) Load 9
             111:    110(ptr) AccessChain 108 26
                              Store 111 109
             115:    7(fvec4) Load 114
             116:   66(fvec3) VectorShuffle 115 115 0 1 2
             119:   66(fvec3) FMul 116 118
             122:   66(fvec3) FAdd 119 121
                              Store 113 122
             123:    7(fvec4) Load 114
             124:   66(fvec3) VectorShuffle 123 123 0 1 2
             125:   66(fvec3) Load 113
             126:   66(fvec3) FMul 124 125
             129:   66(fvec3) FAdd 126 128
                              Store 113 129
             130:    7(fvec4) Load 114
             131:   66(fvec3) VectorShuffle 130 130 0 1 2
             132:   66(fvec3) Load 113
             133:   66(fvec3) FMul 131 132
             136:   66(fvec3) FAdd 133 135
                              Store 113 136
             138:    7(fvec4) Load 114
             139:   66(fvec3) VectorShuffle 138 138 0 1 2
             142:   66(fvec3) FMul 139 141
             145:   66(fvec3) FAdd 142 144
                              Store 137 145
             150:    7(fvec4) Load 114
             151:    7(fvec4) VectorShuffle 150 150 0 1 2 0
             156:  155(bvec4) FOrdLessThan 151 154
             157:  147(bvec3) VectorShuffle 156 156 0 1 2
                              Store 149 157
             160:   66(fvec3) Load 113
                              Store 159 160
             163:    162(ptr) AccessChain 149 161
             164:   146(bool) Load 163
                              SelectionMerge 168 None
                              BranchConditional 164 167 172
             167:               Label
             170:    169(ptr)   AccessChain 137 161
             171:    6(float)   Load 170
                                Store 166 171
                                Branch 168
             172:               Label
             173:    169(ptr)   AccessChain 113 161
             174:    6(float)   Load 173
                                Store 166 174
                                Branch 168
             168:             Label
             175:    6(float) Load 166
             176:    165(ptr) AccessChain 159 161
                              Store 176 175
             177:    162(ptr) AccessChain 149 104
             178:   146(bool) Load 177
                              SelectionMerge 181 None
                              BranchConditional 178 180 184
             180:               Label
             182:    169(ptr)   AccessChain 137 104
             183:    6(float)   Load 182
                                Store 179 183
                                Branch 181
             184:               Label
             185:    169(ptr)   AccessChain 113 104
             186:    6(float)   Load 185
                                Store 179 186
                                Branch 181
             181:             Label
             187:    6(float) Load 179
             188:    165(ptr) AccessChain 159 104
                              Store 188 187
             189:    162(ptr) AccessChain 149 67
             190:   146(bool) Load 189
                              SelectionMerge 193 None
                              BranchConditional 190 192 196
             192:               Label
             194:    169(ptr)   AccessChain 137 67
             195:    6(float)   Load 194
                                Store 191 195
                                Branch 193
             196:               Label
             197:    169(ptr)   AccessChain 113 67
             198:    6(float)   Load 197
                                Store 191 198
                                Branch 193
             193:             Label
             199:    6(float) Load 191
             200:    165(ptr) AccessChain 159 67
                              Store 200 199
             201:   66(fvec3) Load 159
                              Store 113 201
             204:    203(ptr) AccessChain 20 202
             205:     17(int) Load 204
             206:   146(bool) INotEqual 205 26
                              SelectionMerge 209 None
                              BranchConditional 206 208 211
             208:               Label
             210:   66(fvec3)   Load 113
                                Store 207 210
                                Branch 209
             211:               Label
             212:    7(fvec4)   Load 114
             213:   66(fvec3)   VectorShuffle 212 212 0 1 2
                                Store 207 213
                                Branch 209
             209:             Label
             214:   66(fvec3) Load 207
             215:    7(fvec4) Load 54
             216:    7(fvec4) VectorShuffle 215 214 4 5 6 3
                              Store 54 216
             219:    218(ptr) AccessChain 114 217
             220:    6(float) Load 219
             221:    169(ptr) AccessChain 54 217
                              Store 221 220
             222:    7(fvec4) Load 54
             223:     22(ptr) AccessChain 20 34
             224:    7(fvec4) Load 223
             225:    7(fvec4) FMul 222 224
                              Store 54 225
             227:    7(fvec4) Load 54
                              Store 226 227
             233:  228(fvec2) Load 232
             235:     22(ptr) AccessChain 20 234
             236:    7(fvec4) Load 235
             237:  228(fvec2) VectorShuffle 236 236 0 1
             238:  228(fvec2) FMul 233 237
             239:     22(ptr) AccessChain 20 234
             240:    7(fvec4) Load 239
             241:  228(fvec2) VectorShuffle 240 240 2 3
             242:  228(fvec2) FAdd 238 241
                              Store 230(vs_TEXCOORD0) 242
             244:    7(fvec4) Load 11
                              Store 243(vs_TEXCOORD1) 244
             245:     22(ptr) AccessChain 20 26
             246:    7(fvec4) Load 245
             247:  228(fvec2) VectorShuffle 246 246 1 1
             248:     17(int) Load 48
             249:     17(int) IAdd 248 21
             250:     22(ptr) AccessChain 72 26 249
             251:    7(fvec4) Load 250
             252:  228(fvec2) VectorShuffle 251 251 0 1
             253:  228(fvec2) FMul 247 252
             254:    7(fvec4) Load 9
             255:    7(fvec4) VectorShuffle 254 253 4 5 2 3
                              Store 9 255
             256:     17(int) Load 48
             257:     22(ptr) AccessChain 72 26 256
             258:    7(fvec4) Load 257
             259:  228(fvec2) VectorShuffle 258 258 0 1
             260:     22(ptr) AccessChain 20 26
             261:    7(fvec4) Load 260
             262:  228(fvec2) VectorShuffle 261 261 0 0
             263:  228(fvec2) FMul 259 262
             264:    7(fvec4) Load 9
             265:  228(fvec2) VectorShuffle 264 264 0 1
             266:  228(fvec2) FAdd 263 265
             267:    7(fvec4) Load 9
             268:    7(fvec4) VectorShuffle 267 266 4 5 2 3
                              Store 9 268
             269:    7(fvec4) Load 9
             270:  228(fvec2) VectorShuffle 269 269 3 3
             271:    7(fvec4) Load 9
             272:  228(fvec2) VectorShuffle 271 271 0 1
             273:  228(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 272
             274:  228(fvec2) FDiv 270 273
             275:    7(fvec4) Load 9
             276:    7(fvec4) VectorShuffle 275 274 4 5 2 3
                              Store 9 276
             279:    278(ptr) AccessChain 20 277
             280:    6(float) Load 279
             282:    278(ptr) AccessChain 20 281
             283:    6(float) Load 282
             284:  228(fvec2) CompositeConstruct 280 283
             287:  228(fvec2) FMul 284 286
             288:    7(fvec4) Load 9
             289:  228(fvec2) VectorShuffle 288 288 0 1
             290:  228(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 289
             291:  228(fvec2) FAdd 287 290
             292:    7(fvec4) Load 9
             293:    7(fvec4) VectorShuffle 292 291 4 5 2 3
                              Store 9 293
             295:    7(fvec4) Load 9
             296:  228(fvec2) VectorShuffle 295 295 0 1
             297:  228(fvec2) FDiv 286 296
             298:    7(fvec4) Load 294(vs_TEXCOORD2)
             299:    7(fvec4) VectorShuffle 298 297 0 1 4 5
                              Store 294(vs_TEXCOORD2) 299
             300:     22(ptr) AccessChain 20 43
             301:    7(fvec4) Load 300
             304:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 301 303
                              Store 9 304
             305:    7(fvec4) Load 9
             308:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 305 307
                              Store 9 308
             309:    7(fvec4) Load 11
             310:  228(fvec2) VectorShuffle 309 309 0 1
             313:  228(fvec2) FMul 310 312
             314:    7(fvec4) Load 9
             315:  228(fvec2) VectorShuffle 314 314 0 1
             316:  228(fvec2) FNegate 315
             317:  228(fvec2) FAdd 313 316
             318:    7(fvec4) Load 9
             319:    7(fvec4) VectorShuffle 318 317 4 5 2 3
                              Store 9 319
             320:    7(fvec4) Load 9
             321:  228(fvec2) VectorShuffle 320 320 2 3
             322:  228(fvec2) FNegate 321
             323:    7(fvec4) Load 9
             324:  228(fvec2) VectorShuffle 323 323 0 1
             325:  228(fvec2) FAdd 322 324
             326:    7(fvec4) Load 294(vs_TEXCOORD2)
             327:    7(fvec4) VectorShuffle 326 325 4 5 2 3
                              Store 294(vs_TEXCOORD2) 327
             330:     14(int) Load 50
                              Store 329 330
             332:    331(ptr) AccessChain 108 26 104
             333:    6(float) Load 332
             334:    6(float) FNegate 333
             335:    331(ptr) AccessChain 108 26 104
                              Store 335 334
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 8000a
// Id's are bound by 154

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 39 75 118
                              ExecutionMode 4 OriginUpperLeft
                              Name 39  "vs_TEXCOORD0"
                              Name 75  "vs_TEXCOORD2"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 35 RelaxedPrecision
                              Decorate 35 DescriptorSet 0
                              Decorate 35 Binding 0
                              Decorate 36 RelaxedPrecision
                              Decorate 39(vs_TEXCOORD0) Location 1
                              Decorate 41 RelaxedPrecision
                              Decorate 43 RelaxedPrecision
                              MemberDecorate 44 0 RelaxedPrecision
                              MemberDecorate 44 0 Offset 0
                              MemberDecorate 44 1 Offset 16
                              Decorate 44 Block
                              Decorate 46 DescriptorSet 1
                              Decorate 46 Binding 0
                              Decorate 51 RelaxedPrecision
                              Decorate 52 RelaxedPrecision
                              Decorate 54 RelaxedPrecision
                              Decorate 55 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 75(vs_TEXCOORD2) Location 2
                              Decorate 99 RelaxedPrecision
                              Decorate 106 RelaxedPrecision
                              Decorate 109 RelaxedPrecision
                              Decorate 115 RelaxedPrecision
                              Decorate 118 RelaxedPrecision
                              Decorate 118 Location 0
                              Decorate 121 RelaxedPrecision
                              Decorate 126 RelaxedPrecision
                              Decorate 132 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypeSampledImage 32
              34:             TypePointer UniformConstant 33
              35:     34(ptr) Variable UniformConstant
              37:             TypeVector 6(float) 2
              38:             TypePointer Input 37(fvec2)
39(vs_TEXCOORD0):     38(ptr) Variable Input
              42:      8(ptr) Variable Private
              44:             TypeStruct 7(fvec4) 7(fvec4)
              45:             TypePointer Uniform 44(struct)
              46:     45(ptr) Variable Uniform
              47:             TypeInt 32 1
              48:     47(int) Constant 0
              49:             TypePointer Uniform 7(fvec4)
              53:             TypeVector 6(float) 3
              58:      8(ptr) Variable Private
              62:     47(int) Constant 1
75(vs_TEXCOORD2):     10(ptr) Variable Input
              92:    6(float) Constant 0
              93:    6(float) Constant 1065353216
              99:     20(ptr) Variable Private
             100:     12(int) Constant 1
             106:     20(ptr) Variable Private
             111:    6(float) Constant 3129152111
             117:             TypePointer Output 7(fvec4)
             118:    117(ptr) Variable Output
             127:             TypePointer Output 6(float)
             129:             TypeBool
             130:             TypePointer Private 129(bool)
             131:    130(ptr) Variable Private
             136:     47(int) Constant 4294967295
             143:             TypePointer Function 7(fvec4)
             145:             TypeVector 47(int) 4
             146:             TypePointer Function 145(ivec4)
             148:             TypeVector 129(bool) 4
             149:             TypePointer Function 148(bvec4)
             151:             TypeVector 12(int) 4
             152:             TypePointer Function 151(ivec4)
               4:           2 Function None 3
               5:             Label
             144:    143(ptr) Variable Function
             147:    146(ptr) Variable Function
             150:    149(ptr) Variable Function
             153:    152(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              36:          33 Load 35
              40:   37(fvec2) Load 39(vs_TEXCOORD0)
              41:    7(fvec4) ImageSampleImplicitLod 36 40
                              Store 31 41
              43:    7(fvec4) Load 31
              50:     49(ptr) AccessChain 46 48
              51:    7(fvec4) Load 50
              52:    7(fvec4) FAdd 43 51
                              Store 42 52
              54:    7(fvec4) Load 11
              55:   53(fvec3) VectorShuffle 54 54 0 1 2
              56:    7(fvec4) Load 9
              57:    7(fvec4) VectorShuffle 56 55 4 5 6 3
                              Store 9 57
              59:    7(fvec4) Load 9
              60:    7(fvec4) Load 42
              61:    7(fvec4) FMul 59 60
                              Store 58 61
              63:     49(ptr) AccessChain 46 62
              64:    7(fvec4) Load 63
              65:   37(fvec2) VectorShuffle 64 64 0 1
              66:   37(fvec2) FNegate 65
              67:     49(ptr) AccessChain 46 62
              68:    7(fvec4) Load 67
              69:   37(fvec2) VectorShuffle 68 68 2 3
              70:   37(fvec2) FAdd 66 69
              71:    7(fvec4) Load 42
              72:    7(fvec4) VectorShuffle 71 70 4 5 2 3
                              Store 42 72
              73:    7(fvec4) Load 42
              74:   37(fvec2) VectorShuffle 73 73 0 1
              76:    7(fvec4) Load 75(vs_TEXCOORD2)
              77:   37(fvec2) VectorShuffle 76 76 0 1
              78:   37(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 77
              79:   37(fvec2) FNegate 78
              80:   37(fvec2) FAdd 74 79
              81:    7(fvec4) Load 42
              82:    7(fvec4) VectorShuffle 81 80 4 5 2 3
                              Store 42 82
              83:    7(fvec4) Load 42
              84:   37(fvec2) VectorShuffle 83 83 0 1
              85:    7(fvec4) Load 75(vs_TEXCOORD2)
              86:   37(fvec2) VectorShuffle 85 85 2 3
              87:   37(fvec2) FMul 84 86
              88:    7(fvec4) Load 42
              89:    7(fvec4) VectorShuffle 88 87 4 5 2 3
                              Store 42 89
              90:    7(fvec4) Load 42
              91:   37(fvec2) VectorShuffle 90 90 0 1
              94:   37(fvec2) CompositeConstruct 92 92
              95:   37(fvec2) CompositeConstruct 93 93
              96:   37(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 91 94 95
              97:    7(fvec4) Load 42
              98:    7(fvec4) VectorShuffle 97 96 4 5 2 3
                              Store 42 98
             101:     20(ptr) AccessChain 42 100
             102:    6(float) Load 101
             103:     20(ptr) AccessChain 42 19
             104:    6(float) Load 103
             105:    6(float) FMul 102 104
                              Store 99 105
             107:     20(ptr) AccessChain 58 13
             108:    6(float) Load 107
             109:    6(float) Load 99
             110:    6(float) FMul 108 109
             112:    6(float) FAdd 110 111
                              Store 106 112
             113:     20(ptr) AccessChain 58 13
             114:    6(float) Load 113
             115:    6(float) Load 99
             116:    6(float) FMul 114 115
                              Store 99 116
             119:    7(fvec4) Load 58
             120:   53(fvec3) VectorShuffle 119 119 0 1 2
             121:    6(float) Load 99
             122:   53(fvec3) CompositeConstruct 121 121 121
             123:   53(fvec3) FMul 120 122
             124:    7(fvec4) Load 118
             125:    7(fvec4) VectorShuffle 124 123 4 5 6 3
                              Store 118 125
             126:    6(float) Load 99
             128:    127(ptr) AccessChain 118 13
                              Store 128 126
             132:    6(float) Load 106
             133:   129(bool) FOrdLessThan 132 92
                              Store 131 133
             134:   129(bool) Load 131
             135:     47(int) Select 134 62 48
             137:     47(int) IMul 135 136
             138:   129(bool) INotEqual 137 48
                              SelectionMerge 140 None
                              BranchConditional 138 139 140
             139:               Label
                                Kill
             140:             Label
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



 }
}
}