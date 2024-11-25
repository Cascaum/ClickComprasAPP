package com.example.clickcompras;

import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.rule.ActivityTestRule;
import android.widget.Button;
import android.widget.TextView;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import static org.junit.Assert.*;
import static androidx.test.platform.app.InstrumentationRegistry.getInstrumentation;
import androidx.test.core.app.ActivityScenario;

@RunWith(FlutterTestRunner.class) // Executa com o FlutterTestRunner para testes Flutter
public class MainActivityTest {

    @Rule
    public ActivityTestRule<MainActivity> activityRule = new ActivityTestRule<>(MainActivity.class, true, false);

    @Test
    public void testActivityLaunch() {
        // Lança a Activity para o teste
        activityRule.launchActivity(null);

        // Verifica se a activity foi iniciada corretamente
        assertNotNull("MainActivity não foi inicializada", activityRule.getActivity());
    }

    @Test
    public void testButtonVisibility() {
        // Lança a Activity
        activityRule.launchActivity(null);

        // Verifica se o botão "loginButton" está visível
        Button loginButton = activityRule.getActivity().findViewById(R.id.loginButton);
        assertNotNull("Botão de login não encontrado", loginButton);
        assertTrue("Botão de login não está visível", loginButton.getVisibility() == Button.VISIBLE);
    }

    @Test
    public void testTextViewContent() {
        // Lança a Activity
        activityRule.launchActivity(null);

        // Verifica se o TextView com o id "welcomeText" contém o texto esperado
        TextView welcomeText = activityRule.getActivity().findViewById(R.id.welcomeText);
        assertNotNull("TextView de boas-vindas não encontrado", welcomeText);
        assertEquals("Texto de boas-vindas incorreto", "Bem-vindo ao ClickCompras!", welcomeText.getText().toString());
    }

    @Test
    public void testButtonClickChangesText() {
        // Lança a Activity
        activityRule.launchActivity(null);

        // Verifica o botão de login
        Button loginButton = activityRule.getActivity().findViewById(R.id.loginButton);
        assertNotNull("Botão de login não encontrado", loginButton);

        // Simula um clique no botão de login
        loginButton.performClick();

        // Verifica se o texto foi alterado após o clique
        TextView welcomeText = activityRule.getActivity().findViewById(R.id.welcomeText);
        assertNotNull("TextView de boas-vindas não encontrado", welcomeText);
        assertEquals("Texto de boas-vindas não foi alterado", "Você está logado!", welcomeText.getText().toString());
    }

    @Test
    public void testActivityNotNullAfterLaunch() {
        // Lança a Activity
        activityRule.launchActivity(null);

        // Verifica se a Activity não é nula após o lançamento
        assertNotNull("A Activity está nula após o lançamento", activityRule.getActivity());
    }

    @Test
    public void testButtonClickNavigation() {
        // Lança a Activity
        activityRule.launchActivity(null);

        // Simula um clique em um botão que deveria navegar para outra tela (por exemplo, "Ir para loja")
        Button goToStoreButton = activityRule.getActivity().findViewById(R.id.goToStoreButton);
        assertNotNull("Botão para ir à loja não encontrado", goToStoreButton);

        // Simula o clique
        goToStoreButton.performClick();

        // Verifica se a nova tela foi aberta (usando uma variável fictícia ou comportamento esperado)
        // Você pode verificar, por exemplo, se uma nova Activity foi iniciada ou o conteúdo da tela mudou
        // Aqui, verificamos se um TextView específico da loja está presente
        TextView storeText = activityRule.getActivity().findViewById(R.id.storeText);
        assertNotNull("Texto da loja não encontrado, o que indica falha na navegação", storeText);
        assertEquals("Texto incorreto na tela da loja", "Bem-vindo à Loja!", storeText.getText().toString());
    }

    // Teste de comportamento após a interação do usuário
    @Test
    public void testButtonClickOpensDialog() {
        // Lança a Activity
        activityRule.launchActivity(null);

        // Verifica se o botão que abre um diálogo está visível
        Button showDialogButton = activityRule.getActivity().findViewById(R.id.showDialogButton);
        assertNotNull("Botão para mostrar o diálogo não encontrado", showDialogButton);

        // Simula um clique no botão
        showDialogButton.performClick();

        // Verifica se o diálogo foi mostrado
        // Pode verificar se um TextView ou outro componente do diálogo está presente
        TextView dialogText = activityRule.getActivity().findViewById(R.id.dialogText);
        assertNotNull("Texto do diálogo não encontrado", dialogText);
        assertEquals("Texto do diálogo incorreto", "Olá, este é um diálogo!", dialogText.getText().toString());
    }

    // Teste de navegação usando intents
    @Test
    public void testIntentNavigation() {
        // Lança a Activity
        activityRule.launchActivity(null);

        // Simula uma ação que deve resultar em uma navegação via Intent
        activityRule.getActivity().startActivity(new Intent(activityRule.getActivity(), StoreActivity.class));

        // Verifica se a StoreActivity foi iniciada
        ActivityScenario<StoreActivity> storeActivityScenario = ActivityScenario.launch(StoreActivity.class);
        storeActivityScenario.onActivity(activity -> {
            // Verifique se o título da StoreActivity está correto
            TextView storeTitle = activity.findViewById(R.id.storeTitle);
            assertNotNull("Texto da StoreActivity não encontrado", storeTitle);
            assertEquals("Texto do título da loja incorreto", "Bem-vindo à nossa loja!", storeTitle.getText().toString());
        });
    }
}
