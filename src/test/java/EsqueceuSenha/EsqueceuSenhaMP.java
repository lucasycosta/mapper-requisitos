package EsqueceuSenha;

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

public class EsqueceuSenhaMP {
	
	private WebDriver driver;
	private String url =  "http://3.82.209.69:3000/login";
	
	private WebElement primeiroBotao;
	private WebElement campoEmail;
	private WebElement botaoFinal;
	private WebElement mensagem;
	
	
	//BACKGROUND
	@Given("estar na tela de login ES")
	public void estar_na_tela_de_login_es() {
		driver = new ChromeDriver();
		driver.get(url);
	}
	
	@Given("clicar em esqueci senha")
	public void clicar_em_esqueci_senha() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		primeiroBotao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("a[href='/forgot']")));
		primeiroBotao.click();
	}

	//EMAIL ENVIADO
	@Given("abrir a pagina com a {string}")
	public void abrir_a_pagina_com_a(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("p")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	@When("inserir e-mail {string} cadastrado")
	public void inserir_e_mail_cadastrado(String string) {
		campoEmail = driver.findElement(By.cssSelector("input[name='email']"));
	    campoEmail.sendKeys(string);
	}

	@When("clicar no botão Enviar")
	public void clicar_no_botão_enviar() {
		botaoFinal = driver.findElement(By.cssSelector("button[type='submit']"));
	    botaoFinal.click();
	}

	@Then("a mensagem {string} de email enviado")
	public void a_mensagem_de_email_enviado(String string) throws InterruptedException {
		Thread.sleep(2000);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("p")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	//EMAIL INVALIDO
	@Given("abrir pagina com a {string}")
	public void abrir_pagina_com_a(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("p")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}
	
	@When("inserir o e-mail {string} de recuperacao")
	public void inserir_o_e_mail_de_recuperacao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		campoEmail = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		campoEmail.sendKeys(string);
	}

	@When("clicar no botão Enviar email")
	public void clicar_no_botão_enviar_email() {
		botaoFinal = driver.findElement(By.cssSelector("button[type='submit']"));
	    botaoFinal.click();
	}

	@Then("a mensagem {string} de email invalido")
	public void a_mensagem_de_email_invalido(String string) throws InterruptedException {
		Thread.sleep(2000);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("p")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}
}
