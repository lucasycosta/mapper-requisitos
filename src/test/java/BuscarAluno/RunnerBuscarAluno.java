package BuscarAluno;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "html:src/test/java/BuscarAluno/report-html/report.html", "json:src/test/java/BuscarAluno/report-json/report.json"},
				 features = "src/test/resources/BuscarAlunoMP.feature", 
				 glue = "BuscarAluno",
				 tags = "@sisu")
public class RunnerBuscarAluno {

}
