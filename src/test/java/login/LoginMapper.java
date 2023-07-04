package login;

import java.time.Duration;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class LoginMapper {

	private WebDriver driver;
	private String url = "http://3.82.209.69:3000/login";

	private WebElement email;
	private WebElement senha;
	private WebElement botao;
	private WebElement mensagem;

	// BACKGROUND
	@Given("estar na tela de login")
	public void estar_na_tela_de_login() {
		driver = new ChromeDriver();
		driver.get(url);
	}

	// LOGIN VALIDO
	@When("inserir o e-mail {string}")
	public void inserir_o_e_mail(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys(string);
	}

	@When("inserir a senha {string}")
	public void inserir_a_senha(String string) {
		senha = driver.findElement(By.cssSelector("input[name='password']"));
		senha.sendKeys(string);
	}

	@When("clicar no botão Entrar")
	public void clicar_no_botão_entrar() {
		botao = driver.findElement(By.cssSelector("button[type='submit']"));
		botao.click();
	}

	@Then("abrira a {string} inicial")
	public void abrira_a_inicial(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		wait.until(ExpectedConditions.urlToBe("http://3.82.209.69:3000/"));
		Assert.assertEquals("http://3.82.209.69:3000/", string);
	}

	// LOGIN -> CAMPOS VAZIOS
	@When("inserir o e-mail {string} vazio")
	public void inserir_o_e_mail_vazio(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys(string);
	}

	@When("inserir a senha {string} vazia")
	public void inserir_a_senha_vazia(String string) {
		senha = driver.findElement(By.cssSelector("input[name='password']"));
		senha.sendKeys(string);
		driver.findElement(By.cssSelector("input[name='email']")).click();
	}

	@Then("apresenta a {string} para os campos vazios")
	public void apresenta_a_para_os_campos_vazios(String string) {

		if (email.getAttribute("data-maska-value") == null) {
			String errorMessageEmail = email.getAttribute("errormessage");
			Assert.assertEquals("O campo Email é obrigatório", errorMessageEmail);
		} else if (senha.getAttribute("data-maska-value") == null) {
			String errorMessageSenha = senha.getAttribute("errormessage");
			Assert.assertEquals("O campo Senha é obrigatório", errorMessageSenha);
		}
	}

	//LOGIN -> EMAIL OU SENHA INVALIDO
	@When("inserir o e-mail {string} invalido")
	public void inserir_o_e_mail_invalido(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys(string);
	}

	@When("inserir a senha {string} invalida")
	public void inserir_a_senha_invalida(String string) {
		senha = driver.findElement(By.cssSelector("input[name='password']"));
		senha.sendKeys(string);
	}

	@When("clicar no botão para Entrar")
	public void clicar_no_botão_para_entrar() {
		botao = driver.findElement(By.cssSelector("button[type='submit']"));
		botao.click();
	}

	@Then("apresenta a {string} para invalidacao")
	public void apresenta_a_para_invalidacao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("span[class='first-letter:capitalize']")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	//EMAIL INVALIDO
	@When("inserir o e-mail {string} nao valido")
	public void inserir_o_e_mail_nao_valido(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys(string);
		driver.findElement(By.cssSelector("input[name='password']")).click();
	}
	
	@Then("apresenta a {string} para email invalido")
	public void apresenta_a_para_email_invalido(String string) {
		String errorMessageEmail = email.getAttribute("errormessage");
		Assert.assertEquals(string, errorMessageEmail);
	}

}
