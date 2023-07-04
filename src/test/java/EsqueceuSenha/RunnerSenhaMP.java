package EsqueceuSenha;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = "pretty",
				 features = "src/test/java/features/EsqueciSenhaMP.feature", 
				 glue = "EsqueceuSenha",
				 tags = "@invalido")
public class RunnerSenhaMP {

}
