void Unity_RandomRange_float(float2 Seed, float Min, float Max, out float Out)
    {
         float randomno =  frac(sin(dot(Seed, float2(12.9898, 78.233)))*43758.5453);
         Out = lerp(Min, Max, randomno);
    }

    void Unity_Add_float1(float A, float B, out float Out)
    {
        Out = A + B;
    }

    void Unity_Clamp_float(float In, float Min, float Max, out float Out)
    {
        Out = clamp(In, Min, Max);
    }

    void Unity_Multiply_float(float A, float B, out float Out)
    {
        Out = A * B;
    }

    void Unity_Subtract_float(float A, float B, out float Out)
    {
        Out = A - B;
    }

    void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
    {
        RGBA = float4(R, G, B, A);
        RGB = float3(R, G, B);
        RG = float2(R, G);
    }

    void Unity_Comparison_LessOrEqual_float(float A, float B, out float Out)
    {
        Out = A <= B ? 1 : 0;
    }

    void Unity_Branch_float(float Predicate, float True, float False, out float Out)
    {
        Out = Predicate ? True : False;
    }

    void Unity_Comparison_Greater_float(float A, float B, out float Out)
    {
        Out = A > B ? 1 : 0;
    }

    void Unity_And_float(float A, float B, out float Out)
    {
        Out = A && B;
    }

    void Unity_Multiply_float(float4 A, float4 B, out float4 Out)
    {
        Out = A * B;
    }

    void Unity_ColorMask_float(float3 In, float3 MaskColor, float Range, out float Out, float Fuzziness)
    {
        float Distance = distance(MaskColor, In);
        Out = saturate(1 - (Distance - Range) / max(Fuzziness, 1e-5));
    }

    void Unity_InvertColors_float(float In, float InvertColors, out float Out)
    {
        Out = abs(InvertColors - In);
    }

void TextureOffset_float(float animTime, float4 myTexture, float iterations, float4 uv, float seed, float maxOffset, out float3 Out, out float alpha){
    float3 res;
    float tempAlpha;
    float4 _UV_36AAEB0E_Out_0 = uv;
    for(int i = 0; i < iterations; i++){       
        float _Split_F31CE1F8_R_1 = _UV_36AAEB0E_Out_0[0];
        float _Split_F31CE1F8_G_2 = _UV_36AAEB0E_Out_0[1];
        float _Split_F31CE1F8_B_3 = _UV_36AAEB0E_Out_0[2];
        float _Split_F31CE1F8_A_4 = _UV_36AAEB0E_Out_0[3];
        float _Property_8BDE0B03_Out_0 = animTime;
        float _RandomRange_9C2534E5_Out_3;
        Unity_RandomRange_float(float2 (seed + i, seed - i), -maxOffset, 0, _RandomRange_9C2534E5_Out_3);
        float _Add_4C057E68_Out_2;
        Unity_Add_float1(_Property_8BDE0B03_Out_0, _RandomRange_9C2534E5_Out_3, _Add_4C057E68_Out_2);
        float _Clamp_51CFA3CE_Out_3;
        Unity_Clamp_float(_Add_4C057E68_Out_2, 0, 1, _Clamp_51CFA3CE_Out_3);
        float _Multiply_D329C5C6_Out_2;
        Unity_Multiply_float(-1, _Clamp_51CFA3CE_Out_3, _Multiply_D329C5C6_Out_2);
        float _Subtract_C33C12A3_Out_2;
        Unity_Subtract_float(_Split_F31CE1F8_G_2, _Multiply_D329C5C6_Out_2, _Subtract_C33C12A3_Out_2);
        float4 _Combine_DEB4E04B_RGBA_4;
        float3 _Combine_DEB4E04B_RGB_5;
        float2 _Combine_DEB4E04B_RG_6;
        Unity_Combine_float(_Split_F31CE1F8_R_1, _Subtract_C33C12A3_Out_2, _Split_F31CE1F8_B_3, _Split_F31CE1F8_A_4, _Combine_DEB4E04B_RGBA_4, _Combine_DEB4E04B_RGB_5, _Combine_DEB4E04B_RG_6);
        float4 _SampleTexture2D_26349C44_RGBA_0 = myTexture;
        float _SampleTexture2D_26349C44_R_4 = _SampleTexture2D_26349C44_RGBA_0.r;
        float _SampleTexture2D_26349C44_G_5 = _SampleTexture2D_26349C44_RGBA_0.g;
        float _SampleTexture2D_26349C44_B_6 = _SampleTexture2D_26349C44_RGBA_0.b;
        float _SampleTexture2D_26349C44_A_7 = _SampleTexture2D_26349C44_RGBA_0.a;
        float _Split_AA89141C_R_1 = _UV_36AAEB0E_Out_0[0];
        float _Split_AA89141C_G_2 = _UV_36AAEB0E_Out_0[1];
        float _Split_AA89141C_B_3 = _UV_36AAEB0E_Out_0[2];
        float _Split_AA89141C_A_4 = _UV_36AAEB0E_Out_0[3];
        float _Subtract_186A47BE_Out_2;
        Unity_Subtract_float(1, _Clamp_51CFA3CE_Out_3, _Subtract_186A47BE_Out_2);
        float _Comparison_954A7788_Out_2;
        Unity_Comparison_LessOrEqual_float(_Split_AA89141C_G_2, _Subtract_186A47BE_Out_2, _Comparison_954A7788_Out_2);
        float _Branch_DB94612B_Out_3;
        Unity_Branch_float(_Comparison_954A7788_Out_2, 1, 0, _Branch_DB94612B_Out_3);
        float _Comparison_EFAD7B4D_Out_2;
        float compareTo = (float) 1/iterations;
        Unity_Comparison_Greater_float(_Split_AA89141C_R_1, compareTo * i, _Comparison_EFAD7B4D_Out_2);
        float _Comparison_C6DDD848_Out_2;
        Unity_Comparison_LessOrEqual_float(_Split_AA89141C_R_1, compareTo * (i + 1), _Comparison_C6DDD848_Out_2);
        float _And_420C90C9_Out_2;
        Unity_And_float(_Comparison_EFAD7B4D_Out_2, _Comparison_C6DDD848_Out_2, _And_420C90C9_Out_2);
        float _Branch_786C9D10_Out_3;
        Unity_Branch_float(_And_420C90C9_Out_2, 1, 0, _Branch_786C9D10_Out_3);
        float _Multiply_D9C1EE96_Out_2;
        Unity_Multiply_float(_Branch_DB94612B_Out_3, _Branch_786C9D10_Out_3, _Multiply_D9C1EE96_Out_2);
        float4 _Multiply_CE3A536C_Out_2;
        Unity_Multiply_float(_SampleTexture2D_26349C44_RGBA_0, (_Multiply_D9C1EE96_Out_2.xxxx), _Multiply_CE3A536C_Out_2);
        float _ColorMask_83C394AB_Out_3;
        Unity_ColorMask_float((_Multiply_CE3A536C_Out_2.xyz), IsGammaSpace() ? float3(0, 0, 0) : SRGBToLinear(float3(0, 0, 0)), 0, _ColorMask_83C394AB_Out_3, 0);
        float _InvertColors_F42650BD_Out_1;
        float _InvertColors_F42650BD_InvertColors = float (1);
        Unity_InvertColors_float(_ColorMask_83C394AB_Out_3, _InvertColors_F42650BD_InvertColors, _InvertColors_F42650BD_Out_1);
        tempAlpha += _InvertColors_F42650BD_Out_1;
        res += (_Multiply_CE3A536C_Out_2.xyz);
        }
        alpha = tempAlpha;
        Out = res;  
}
