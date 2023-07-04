package login;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = "pretty",
				 features = "src/test/java/features/LoginMP.feature", 
				 glue = "login",
				 tags = "@emailinvalido")
public class RunnerLoginMP {

}
