package Escola;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = "pretty",
				 features = "src/test/java/features/CRUDEscolasMP.feature", 
				 glue = "Escola",
				 tags = "@excluir")
public class RunnerEscola {

}
