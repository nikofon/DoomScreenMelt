using Cyan;
using System.Collections;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEditor;
using UnityEngine.Rendering.Universal;
using TMPro;
using UnityTemplateProjects;

public class DoomMeltingScreenEffect : MonoBehaviour
{
    int TimeOffsetId = Shader.PropertyToID("_AnimationTime");
    [SerializeField] UniversalRendererData rendererData;
    [SerializeField] string featureName = "DoomReloadingScreen";
    RenderTexture texture;
    Material mat;
    [Min(0)]
    public float ScreenMeltTime;
    [Range(0, 1)]
    public float AnimationTime = 0;
    Blit blit;
    public Camera activeCamera;

    [System.Serializable]
    public class DoomScreenMeltSettings
    {
        [Tooltip("How much from the top the column will be offseted")]
        public float MaxOffset = 0.2f;
        [Tooltip("Seed for random offset of each column")]
        public float Seed;
        [Tooltip("How much columns there will be")]
        public int NumberOfStripes = 20;
    }

    public DoomScreenMeltSettings materialSettings = new DoomScreenMeltSettings();

    public void SetMaterialSettings(DoomScreenMeltSettings dsms)
    {
        mat.SetFloat("_MaxOffset", dsms.MaxOffset);
        mat.SetFloat("_Seed", dsms.Seed);
        mat.SetFloat("_NumberOfStripes", dsms.NumberOfStripes);
        mat.SetTexture("_OldTexture", texture);
    }

    public void StartScreenMelt(float meltTime, Camera camera)
    {
        AnimationTime = 1;
        mat.SetFloat(TimeOffsetId, AnimationTime);   
        camera.targetTexture = texture;
        camera.Render();
        camera.targetTexture = null;
        StartCoroutine(ChangeTime(meltTime));
    }

    public void StartScreenMelt()
    {
        StartScreenMelt(ScreenMeltTime, activeCamera);
    }

    IEnumerator ChangeTime(float meltTime)
    {
        WaitForEndOfFrame wfeof = new WaitForEndOfFrame();
        while (Mathf.Ceil(AnimationTime) != 0)
        {
            AnimationTime -= Time.deltaTime / meltTime;
            yield return wfeof;
        }
        AnimationTime = 0;
    }

    void Start()
    {
        texture = new RenderTexture(Screen.width, Screen.height, 0);
        mat = CoreUtils.CreateEngineMaterial("Shader Graphs/DoomLoadingScreenShader");
        SetMaterialSettings(materialSettings);
        ScriptableRendererFeature feature = rendererData.rendererFeatures.Find(x => x.name == featureName);
        blit = (Blit)feature;
        blit.settings.blitMaterial = mat;
    }
    // Update is called once per frame
    void Update()
    {
        if(mat != null && AnimationTime > 0)
        {
            mat.SetFloat(TimeOffsetId, 1 - AnimationTime);
        }
    }

    private void OnApplicationQuit()
    {
        blit.settings.blitMaterial = null;
    }
    private void OnDestroy()
    {
        blit.settings.blitMaterial = null;
    }
}
