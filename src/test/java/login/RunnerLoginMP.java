package login;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "html:src/test/java/login/report-html/report.html", "json:src/test/java/login/report-json/report.json"},
				 features = "src/test/resources/LoginMP.feature", 
				 glue = "login",
				 tags = "@emailinvalido")
public class RunnerLoginMP {

}
