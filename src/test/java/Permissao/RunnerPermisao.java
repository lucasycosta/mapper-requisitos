package Permissao;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "html:src/test/java/Permissao/report-html/report.html", "json:src/test/java/Permissao/report-json/report.json"},
				 features = "src/test/resources/CRUDPermissaoMP.feature", 
				 glue = "Permissao",
				 tags = "@deletar")
public class RunnerPermisao {

}
