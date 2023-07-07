package Usuario;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "html:src/test/java/Usuario/report-html/report.html", "json:src/test/java/Usuario/report-json/report.json"},
				 features = "src/test/resources/CRUDUsuarioMP.feature", 
				 glue = "Usuario",
				 tags = "@invalido")
public class RunnerUsuario {

}
