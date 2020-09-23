#include "Constants.hlsl"

#define MAX_SKELETON_BONES 80
cbuffer SkinConstants : register(b3)
{
    float4x4 c_skinMatrix[MAX_SKELETON_BONES];
};

struct VIn
{
    float3 position : POSITION0;
    float3 normal : NORMAL0;
    uint4 boneIndex : BONE0;
    float4 boneWeight : WEIGHT0;
    float2 uv : TEXCOORD0;
};

struct VOut
{
    float4 position : SV_POSITION;
    float3 normal : NORMAL0;
    float2 uv : TEXCOORD0;
};

VOut VS(VIn vIn)
{
    VOut output = (VOut)0;

    // TODO the uv is done, but you need to do the position and normal

    output.uv = vIn.uv;
    return output;
}

float4 PS(VOut pIn) : SV_TARGET
{
     float4 diffuseTex = DiffuseTexture.Sample(DefaultSampler, pIn.uv);

     // TODO use the lighting calculations to chang what light is
     float4 light = float4(1.0f, 1.0f, 1.0f, 1.0f);

     return diffuseTex * light;
}
