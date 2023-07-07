package Escola;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "html:src/test/java/Escola/report-html/report.html", "json:src/test/java/Escola/report-json/report.json"},
				 features = "src/test/resources/CRUDEscolasMP.feature", 
				 glue = "Escola",
				 tags = "@excluir")
public class RunnerEscola {

}
