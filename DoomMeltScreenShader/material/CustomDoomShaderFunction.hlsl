void Unity_Add_float(float A, float B, out float Out)
{
    Out = A + B;
}

void Unity_RandomRange_float(float2 Seed, float Min, float Max, out float Out)
{
     float randomno =  frac(sin(dot(Seed, float2(12.9898, 78.233)))*43758.5453);
     Out = lerp(Min, Max, randomno);
}

void Unity_Subtract_float(float A, float B, out float Out)
{
    Out = A - B;
}

void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
{
    Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
}

void Unity_Maximum_float(float A, float B, out float Out)
{
    Out = max(A, B);
}

void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
{
    RGBA = float4(R, G, B, A);
    RGB = float3(R, G, B);
    RG = float2(R, G);
}

void Unity_OneMinus_float(float In, out float Out)
{
    Out = 1 - In;
}

void Unity_Comparison_LessOrEqual_float(float A, float B, out float Out)
{
    Out = A <= B ? 1 : 0;
}

void Unity_Branch_float(float Predicate, float True, float False, out float Out)
{
    Out = Predicate ? True : False;
}

void Unity_Divide_float(float A, float B, out float Out)
{
    Out = A / B;
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
Out = A * B;
}

void Unity_Comparison_Greater_float(float A, float B, out float Out)
{
    Out = A > B ? 1 : 0;
}

void Unity_And_float(float A, float B, out float Out)
{
    Out = A && B;
}

void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
{
Out = A * B;
}

void Unity_Add_float4(float4 A, float4 B, out float4 Out)
{
    Out = A + B;
}


void FillScreenWithStripes_float(float AnimationTime, Texture2D OldTexture, float NumberOfStripes, float4 NewTexture, float MaxOffset, float Seed, float4 UV, SamplerState Sampler, out float4 Out){
    float4 Output = float4(0.0, 0.0, 0.0, 1);
    for(int StripeIndex = 1; StripeIndex <= NumberOfStripes; StripeIndex++){
        float4 _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0 = UV;
        float _Split_560900a85a662382a1360821e6ec42e7_R_1 = _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0[0];
        float _Split_560900a85a662382a1360821e6ec42e7_G_2 = _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0[1];
        float _Split_560900a85a662382a1360821e6ec42e7_B_3 = _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0[2];
        float _Split_560900a85a662382a1360821e6ec42e7_A_4 = _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0[3];
        float _Property_c5fc9a943159431080bdf16d1d71104b_Out_0 = AnimationTime;
        float _Property_1db10d02f2d048a7884243bccf40eedd_Out_0 = Seed; 
        float _Property_0cbfe7732456476198bbec382de5804f_Out_0 = StripeIndex;
        float _Add_55bb37a1256744f2bb7f3e2b244e8d95_Out_2;
        Unity_Add_float(_Property_1db10d02f2d048a7884243bccf40eedd_Out_0, _Property_0cbfe7732456476198bbec382de5804f_Out_0, _Add_55bb37a1256744f2bb7f3e2b244e8d95_Out_2);
        float _Property_686f0cda35ee481985d7ecf16ba05c73_Out_0 = MaxOffset;
        float _RandomRange_3ebd36791b7048a0a358652a17caae17_Out_3;
        Unity_RandomRange_float((_Add_55bb37a1256744f2bb7f3e2b244e8d95_Out_2.xx), 0, _Property_686f0cda35ee481985d7ecf16ba05c73_Out_0, _RandomRange_3ebd36791b7048a0a358652a17caae17_Out_3);
        float _Subtract_618b37da62c3423a9fb23b483f6a4c72_Out_2;
        Unity_Subtract_float(0, _RandomRange_3ebd36791b7048a0a358652a17caae17_Out_3, _Subtract_618b37da62c3423a9fb23b483f6a4c72_Out_2);
        float _Add_ff5df8505dcc4ebeb00c92779a335d02_Out_2;
        Unity_Add_float(_Property_c5fc9a943159431080bdf16d1d71104b_Out_0, _Subtract_618b37da62c3423a9fb23b483f6a4c72_Out_2, _Add_ff5df8505dcc4ebeb00c92779a335d02_Out_2);
        float _Add_4b648df2e46b42078be713f3dc9ea92c_Out_2;
        Unity_Add_float(1, _Subtract_618b37da62c3423a9fb23b483f6a4c72_Out_2, _Add_4b648df2e46b42078be713f3dc9ea92c_Out_2);
        float2 _Vector2_e730b573ea1a4ceda0f3e6f3267cb46b_Out_0 = float2(0, _Add_4b648df2e46b42078be713f3dc9ea92c_Out_2);
        float _Remap_411191045f34477aa3edfa62aea27cc9_Out_3;
        Unity_Remap_float(_Add_ff5df8505dcc4ebeb00c92779a335d02_Out_2, _Vector2_e730b573ea1a4ceda0f3e6f3267cb46b_Out_0, float2 (0, 1), _Remap_411191045f34477aa3edfa62aea27cc9_Out_3);
        float _Maximum_b72535d4d72c439a81ac09cc949fbda6_Out_2;
        Unity_Maximum_float(0, _Remap_411191045f34477aa3edfa62aea27cc9_Out_3, _Maximum_b72535d4d72c439a81ac09cc949fbda6_Out_2);
        float _Add_fbb2988458cb4d4f9016d2854869b8aa_Out_2;
        Unity_Add_float(_Split_560900a85a662382a1360821e6ec42e7_G_2, _Maximum_b72535d4d72c439a81ac09cc949fbda6_Out_2, _Add_fbb2988458cb4d4f9016d2854869b8aa_Out_2);
        float4 _Combine_2255ed683b44a98fa37f47c7425f2353_RGBA_4;
        float3 _Combine_2255ed683b44a98fa37f47c7425f2353_RGB_5;
        float2 _Combine_2255ed683b44a98fa37f47c7425f2353_RG_6;
        Unity_Combine_float(_Split_560900a85a662382a1360821e6ec42e7_R_1, _Add_fbb2988458cb4d4f9016d2854869b8aa_Out_2, _Split_560900a85a662382a1360821e6ec42e7_B_3, _Split_560900a85a662382a1360821e6ec42e7_A_4, _Combine_2255ed683b44a98fa37f47c7425f2353_RGBA_4, _Combine_2255ed683b44a98fa37f47c7425f2353_RGB_5, _Combine_2255ed683b44a98fa37f47c7425f2353_RG_6);
        float4 _SampleTexture2D_577f74a7ceed7280821379fb977f2689_RGBA_0 = SAMPLE_TEXTURE2D(OldTexture, Sampler, _Combine_2255ed683b44a98fa37f47c7425f2353_RGBA_4.xy);
        float _SampleTexture2D_577f74a7ceed7280821379fb977f2689_R_4 = _SampleTexture2D_577f74a7ceed7280821379fb977f2689_RGBA_0.r;
        float _SampleTexture2D_577f74a7ceed7280821379fb977f2689_G_5 = _SampleTexture2D_577f74a7ceed7280821379fb977f2689_RGBA_0.g;
        float _SampleTexture2D_577f74a7ceed7280821379fb977f2689_B_6 = _SampleTexture2D_577f74a7ceed7280821379fb977f2689_RGBA_0.b;
        float _SampleTexture2D_577f74a7ceed7280821379fb977f2689_A_7 = _SampleTexture2D_577f74a7ceed7280821379fb977f2689_RGBA_0.a;
        float _Split_9d1be58115c76587a6e99db9d06d1e54_R_1 = _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0[0];
        float _Split_9d1be58115c76587a6e99db9d06d1e54_G_2 = _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0[1];
        float _Split_9d1be58115c76587a6e99db9d06d1e54_B_3 = _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0[2];
        float _Split_9d1be58115c76587a6e99db9d06d1e54_A_4 = _UV_0d88b6c7a823e58cbeba0d21111ae2be_Out_0[3];
        float _OneMinus_811d7d4a35184a99b31fba773d54ab81_Out_1;
        Unity_OneMinus_float(_Maximum_b72535d4d72c439a81ac09cc949fbda6_Out_2, _OneMinus_811d7d4a35184a99b31fba773d54ab81_Out_1);
        float _Comparison_7a1f3d44821e728b89d87c65fbb1cfdb_Out_2;
        Unity_Comparison_LessOrEqual_float(_Split_9d1be58115c76587a6e99db9d06d1e54_G_2, _OneMinus_811d7d4a35184a99b31fba773d54ab81_Out_1, _Comparison_7a1f3d44821e728b89d87c65fbb1cfdb_Out_2);
        float _Branch_4b7f3af5837bf98597b81996299feb90_Out_3;
        Unity_Branch_float(_Comparison_7a1f3d44821e728b89d87c65fbb1cfdb_Out_2, 1, 0, _Branch_4b7f3af5837bf98597b81996299feb90_Out_3);
        float _Property_6198dc793de64d828c59249b2ff9dd1d_Out_0 = StripeIndex;
        float _Subtract_4e5bf9fc880a4781889ecc54fda771bc_Out_2;
        Unity_Subtract_float(_Property_6198dc793de64d828c59249b2ff9dd1d_Out_0, 1, _Subtract_4e5bf9fc880a4781889ecc54fda771bc_Out_2);
        float _Property_6675737a28224c45b243479ac23f68bb_Out_0 = NumberOfStripes;
        float _Divide_9dd6aa79bb604a64ba80bb2339852b16_Out_2;
        Unity_Divide_float(1, _Property_6675737a28224c45b243479ac23f68bb_Out_0, _Divide_9dd6aa79bb604a64ba80bb2339852b16_Out_2);
        float _Multiply_89b1f401af5549c98abfc1ea206d2e50_Out_2;
        Unity_Multiply_float_float(_Subtract_4e5bf9fc880a4781889ecc54fda771bc_Out_2, _Divide_9dd6aa79bb604a64ba80bb2339852b16_Out_2, _Multiply_89b1f401af5549c98abfc1ea206d2e50_Out_2);
        float _Comparison_cd12950c41b0a481bba8d560aa0ae51c_Out_2;
        Unity_Comparison_Greater_float(_Split_9d1be58115c76587a6e99db9d06d1e54_R_1, _Multiply_89b1f401af5549c98abfc1ea206d2e50_Out_2, _Comparison_cd12950c41b0a481bba8d560aa0ae51c_Out_2);
        float _Multiply_2c2b4d1ec9534059aac7e58f8cd21769_Out_2;
        Unity_Multiply_float_float(_Property_6198dc793de64d828c59249b2ff9dd1d_Out_0, _Divide_9dd6aa79bb604a64ba80bb2339852b16_Out_2, _Multiply_2c2b4d1ec9534059aac7e58f8cd21769_Out_2);
        float _Comparison_639abf1ad0a00d80900ed7a7e0434d41_Out_2;
        Unity_Comparison_LessOrEqual_float(_Split_9d1be58115c76587a6e99db9d06d1e54_R_1, _Multiply_2c2b4d1ec9534059aac7e58f8cd21769_Out_2, _Comparison_639abf1ad0a00d80900ed7a7e0434d41_Out_2);
        float _And_bb07d78147ae778ebb7229fe929aad82_Out_2;
        Unity_And_float(_Comparison_cd12950c41b0a481bba8d560aa0ae51c_Out_2, _Comparison_639abf1ad0a00d80900ed7a7e0434d41_Out_2, _And_bb07d78147ae778ebb7229fe929aad82_Out_2);
        float _Branch_799bd7e1acf89d86902682a0d2e44a4a_Out_3;
        Unity_Branch_float(_And_bb07d78147ae778ebb7229fe929aad82_Out_2, 1, 0, _Branch_799bd7e1acf89d86902682a0d2e44a4a_Out_3);
        float _Multiply_4d7e349f967a3a86a76297c5aed0d5ef_Out_2;
        Unity_Multiply_float_float(_Branch_4b7f3af5837bf98597b81996299feb90_Out_3, _Branch_799bd7e1acf89d86902682a0d2e44a4a_Out_3, _Multiply_4d7e349f967a3a86a76297c5aed0d5ef_Out_2);
        float4 _Multiply_d54e8fd0c835cf85b189fd39e836c067_Out_2;
        Unity_Multiply_float4_float4(_SampleTexture2D_577f74a7ceed7280821379fb977f2689_RGBA_0, (_Multiply_4d7e349f967a3a86a76297c5aed0d5ef_Out_2.xxxx), _Multiply_d54e8fd0c835cf85b189fd39e836c067_Out_2);
        float _Comparison_30e40373c6574e9483e5ec1abc405b3e_Out_2;
        Unity_Comparison_Greater_float(_Split_9d1be58115c76587a6e99db9d06d1e54_G_2, _OneMinus_811d7d4a35184a99b31fba773d54ab81_Out_1, _Comparison_30e40373c6574e9483e5ec1abc405b3e_Out_2);
        float _Branch_1801b7d90f724e53b80c4cf139830cfc_Out_3;
        Unity_Branch_float(_Comparison_30e40373c6574e9483e5ec1abc405b3e_Out_2, 1, 0, _Branch_1801b7d90f724e53b80c4cf139830cfc_Out_3);
        float _Multiply_daec877e55a34ee9a619b1d70671ae8a_Out_2;
        Unity_Multiply_float_float(_Branch_799bd7e1acf89d86902682a0d2e44a4a_Out_3, _Branch_1801b7d90f724e53b80c4cf139830cfc_Out_3, _Multiply_daec877e55a34ee9a619b1d70671ae8a_Out_2);
        float4 _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_RGBA_0 = NewTexture;
        float _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_R_4 = _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_RGBA_0.r;
        float _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_G_5 = _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_RGBA_0.g;
        float _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_B_6 = _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_RGBA_0.b;
        float _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_A_7 = _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_RGBA_0.a;
        float4 _Multiply_3baddc00b11e4dabb1bb07c68b5a7438_Out_2;
        Unity_Multiply_float4_float4((_Multiply_daec877e55a34ee9a619b1d70671ae8a_Out_2.xxxx), _SampleTexture2D_c86c3c8a4b1741249a9a727957f5d134_RGBA_0, _Multiply_3baddc00b11e4dabb1bb07c68b5a7438_Out_2);
        float4 _Add_0d82888af9844e8a819d40844937a64e_Out_2;
        Unity_Add_float4(_Multiply_d54e8fd0c835cf85b189fd39e836c067_Out_2, _Multiply_3baddc00b11e4dabb1bb07c68b5a7438_Out_2, _Add_0d82888af9844e8a819d40844937a64e_Out_2);
        Output += float4(_Add_0d82888af9844e8a819d40844937a64e_Out_2.x, _Add_0d82888af9844e8a819d40844937a64e_Out_2.y, _Add_0d82888af9844e8a819d40844937a64e_Out_2.z, 1.0);
    }
    Out = Output;
}
