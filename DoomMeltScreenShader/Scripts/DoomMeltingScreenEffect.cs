using Cyan;
using System.Collections;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class DoomMeltingScreenEffect : MonoBehaviour
{
    int TimeOffsetId = Shader.PropertyToID("TimePassed_");
    [SerializeField] ForwardRendererData rendererData;
    [SerializeField] string featureName = "DoomReloadingScreen";
    RenderTexture texture;
    Material mat;
    public Camera activeCamera;
    [Min(0)]
    public float ScreenMeltTime;
    [Range(0, 1)]
    public float Lerp = 1;
    Blit blit;


    public DoomScreenMeltSettings materialSettings = new DoomScreenMeltSettings();

    void SetMaterialSettings(DoomScreenMeltSettings dsms)
    {
        mat.SetFloat("MaxOffset_", dsms.MaxOffset);
        mat.SetFloat("Seed_", dsms.Seed);
        mat.SetFloat("Subdivisions_", dsms.Subdivisions);
        mat.SetTexture("OldTexture_", texture);
    }

    public void StartScreenMelt()
    {
        StartScreenMelt(ScreenMeltTime, activeCamera);
    }

    public void StartScreenMelt(float meltTime, Camera camera)
    {
        Lerp = 1;
        mat.SetFloat(TimeOffsetId, Lerp);   
        camera.targetTexture = texture;
        camera.Render();
        camera.targetTexture = null;
        StartCoroutine(ChangeTime(meltTime));
    }

    IEnumerator ChangeTime(float meltTime)
    {
        Lerp = 0;
        WaitForEndOfFrame wfeof = new WaitForEndOfFrame();
        while (Mathf.Floor(Lerp) != 1)
        {
            Lerp += Time.deltaTime / meltTime;
            yield return wfeof;
        }
        Lerp = 1;
    }

    void Start()
    {
        Lerp = 1;
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
        if(mat != null)
        {
            mat.SetFloat(TimeOffsetId, Lerp);
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

    [System.Serializable]
    public class DoomScreenMeltSettings
    {
        [Tooltip("How much from the top the column will be offseted")]
        public float MaxOffset = 0.2f;
        [Tooltip("Seed for random offset of each column")]
        public float Seed;
        [Tooltip("How much columns there will be")]
        public int Subdivisions = 20;
    }
}
