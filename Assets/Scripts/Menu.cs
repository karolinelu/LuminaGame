using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    public void OnPlayButton ()
    { 
        SceneManager.LoadScene(1);
    }
}
