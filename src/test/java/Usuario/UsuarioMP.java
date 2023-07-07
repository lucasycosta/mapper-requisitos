package Usuario;

import java.time.Duration;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class UsuarioMP {
	private WebDriver driver;
	private String url = "http://3.82.209.69:3000/login";

	private WebElement usuario;
	private WebElement email;
	private WebElement adm;
	private WebElement nome;
	private WebElement perfil;
	private WebElement escola;
	private WebElement mensagem;
	private WebElement nomeNovo;
	private WebElement emailNovo;
	private WebElement perfilNovo;
	private WebElement botaoAlterar;
	private WebElement buscar;

	// BACKGROUND
	@Given("login usuario mapper")
	public void login_usuario_mapper() {
		driver = new ChromeDriver();
		driver.get(url);

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys("raonikg@gmail.com");
		driver.findElement(By.cssSelector("input[name='password']")).sendKeys("123456");
		driver.findElement(By.cssSelector("button[type='submit']")).click();
	}

	@Given("clicar em Administração na lateral da pagina")
	public void clicar_em_administração_na_lateral_da_pagina() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		adm = wait.until(
				ExpectedConditions.presenceOfElementLocated(By.xpath("//span[contains(text(), 'Administração')]")));
		adm.click();
	}

	@Given("clicar em Usuario")
	public void clicar_em_usuario() throws InterruptedException {
		Thread.sleep(1000);
		usuario = driver.findElement(By.cssSelector("a[href='/admin/user']"));
		usuario.click();
	}

	@When("abrira a tela de cadastro de Usuario")
	public void abrira_a_tela_de_cadastro_de_usuario() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		wait.until(ExpectedConditions.urlToBe("http://3.82.209.69:3000/admin/user"));
		String urlAtual = driver.getCurrentUrl();
		Assert.assertEquals("http://3.82.209.69:3000/admin/user", urlAtual);
	}

	// CADASTRAR
	@When("inserir o nome do usuario {string}")
	public void inserir_o_nome_do_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		nome = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='name']")));
		nome.sendKeys(string);
	}

	@When("inserir o email do usuario {string}")
	public void inserir_o_email_do_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys(string);
	}

	@When("selecione o perfil do usuario {string}")
	public void selecione_o_perfil_do_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		perfil = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='role']")));
		perfil.sendKeys(string);
	}

	@When("clicar no botao Gravar usuario")
	public void clicar_no_botao_gravar_usuario() throws InterruptedException {
		Thread.sleep(1000);
		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}

		driver.findElement(By.cssSelector("button[type='submit']")).click();
	}

	@Then("a mensagem para usuario {string}")
	public void a_mensagem_para_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("p")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	// COM ESCOLA
	@When("inserir o nome de usuario {string}")
	public void inserir_o_nome_de_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		nome = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='name']")));
		nome.sendKeys(string);
	}

	@When("inserir o email de usuario {string}")
	public void inserir_o_email_de_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys(string);
	}

	@When("selecione o perfil de usuario {string}")
	public void selecione_o_perfil_de_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		perfil = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='role']")));
		perfil.sendKeys(string);
	}

	@When("selecione a escola de usuario {string}")
	public void selecione_a_escola_de_usuario(String string) throws InterruptedException {
		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
		escola = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class='multiselect__tags']")));
		escola.click();

		Thread.sleep(1000);

		escola = driver.findElement(By.cssSelector("input[name='schools']"));
		escola.sendKeys(string);
		escola.sendKeys(Keys.ENTER);

		driver.findElement(By.cssSelector("input[name='email']")).click();
	}

	@When("clicar no botao Gravar de usuario")
	public void clicar_no_botao_gravar_de_usuario() {
		driver.findElement(By.cssSelector("button[type='submit']")).click();
	}

	@Then("a mensagem para o usuario {string}")
	public void a_mensagem_para_o_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("p")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	// CAMPOS EM BRANCO SEM ESCOLA
	@When("inserir nome do usuario {string}")
	public void inserir_nome_do_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		nome = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='name']")));
		nome.sendKeys(string);
	}

	@When("inserir email do usuario {string}")
	public void inserir_email_do_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys(string);
	}

	@When("selecione perfil do usuario {string}")
	public void selecione_perfil_do_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		perfil = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='role']")));
		perfil.sendKeys(string);
	}

	@Then("a mensagem dos campos em branco {string} do usuario")
	public void a_mensagem_dos_campos_em_branco_do_usuario(String string) {
		if (nome.getAttribute("data-maska-value") == null) {
			String errorMessageNome = nome.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageNome);
		} else if (email.getAttribute("data-maska-value") == null) {
			String errorMessageEmail = email.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageEmail);
		} else if (perfil == null) {
			String errorMessagePerfil = perfil.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessagePerfil);
		}
	}

	// CAMPOS EM BRANCO COM ESCOLA
	/*
	 * @When("digitar nome usuario {string}") public void
	 * digitar_nome_usuario(String string) { WebDriverWait wait = new
	 * WebDriverWait(driver, Duration.ofSeconds(3)); nome =
	 * wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(
	 * "input[name='name']"))); nome.sendKeys(string); }
	 * 
	 * @When("digitar email do usuario {string}") public void
	 * digitar_email_do_usuario(String string) { WebDriverWait wait = new
	 * WebDriverWait(driver, Duration.ofSeconds(3)); email =
	 * wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(
	 * "input[name='email']"))); email.sendKeys(string); }
	 * 
	 * @When("escolher perfil usuario {string}") public void
	 * escolher_perfil_usuario(String string) { WebDriverWait wait = new
	 * WebDriverWait(driver, Duration.ofSeconds(3)); perfil =
	 * wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(
	 * "select[name='role']"))); perfil.sendKeys(string); }
	 * 
	 * @When("escolher escola usuario {string}") public void
	 * escolher_escola_usuario(String string) throws InterruptedException {
	 * 
	 * escola.findElement(By.cssSelector("div[class='multiselect__tags-wrap']"));
	 * escola.click(); Thread.sleep(2000); escola =
	 * driver.findElement(By.cssSelector("input[name='schools']"));
	 * escola.sendKeys(string); escola.sendKeys(Keys.ENTER); }
	 * 
	 * @Then("a mensagem dos campo escola {string} do usuario") public void
	 * a_mensagem_dos_campo_escola_do_usuario(String string) {
	 * escola.getAttribute("data-maska-value"); String errorMessageEscola =
	 * escola.getAttribute("errormessage"); Assert.assertEquals(string,
	 * errorMessageEscola);
	 * 
	 * }
	 */

	// EMAIL INVALIDO
	@When("inserir email para usuario {string}")
	public void inserir_email_para_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys(string);
		driver.findElement(By.cssSelector("input[name='name']")).click();
	}

	@Then("a mensagem de email invalido {string}")
	public void a_mensagem_de_email_invalido(String string) {
		email.getAttribute("data-maska-value");
		String errorMessageEmail = email.getAttribute("errormessage");
		Assert.assertEquals(string, errorMessageEmail);
	}

	// CONSULTAR
	@When("rolar pagina de usuario")
	public void rolar_pagina_de_usuario() {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@When("buscar o usuario pelo {string}")
	public void buscar_o_usuario_pelo(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);
		buscar.sendKeys(Keys.ENTER);
	}

	@Then("retorna o {string}, {string}, {string} e {string} do usuario")
	public void retorna_o_e_do_usuario(String string, String string2, String string3, String string4) throws InterruptedException {
		Thread.sleep(2000);
		nome = driver.findElement(By.cssSelector("td[data-col='0']"));
		String nomeRetorno = nome.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string, nomeRetorno);
		
		email = driver.findElement(By.cssSelector("td[data-col='1']"));
		String emailRetorno = email.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string2, emailRetorno);
		
		perfil = driver.findElement(By.cssSelector("td[data-col='2']"));
		String perfilRetorno = perfil.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, perfilRetorno);
		
		escola = driver.findElement(By.cssSelector("td[data-col='3']"));
		String escolaRetorno = escola.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string4, escolaRetorno);
	}

	//ALTERAR
	@When("rolar pagina de usuario para baixo")
	public void rolar_pagina_de_usuario_para_baixo() {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@When("buscar o usuario com {string}")
	public void buscar_o_usuario_com(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);
		buscar.sendKeys(Keys.ENTER);
	}

	@When("retorna o {string}, {string}, {string} e {string} do usuario buscado")
	public void retorna_o_e_do_usuario_buscado(String string, String string2, String string3, String string4) throws InterruptedException {
		Thread.sleep(2000);
		nome = driver.findElement(By.cssSelector("td[data-col='0']"));
		String nomeRetorno = nome.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string, nomeRetorno);
		
		email = driver.findElement(By.cssSelector("td[data-col='1']"));
		String emailRetorno = email.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string2, emailRetorno);
		
		perfil = driver.findElement(By.cssSelector("td[data-col='2']"));
		String perfilRetorno = perfil.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, perfilRetorno);
		
		escola = driver.findElement(By.cssSelector("td[data-col='3']"));
		String escolaRetorno = escola.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string4, escolaRetorno);
	}

	@When("clicar no icone de edicao do respectivo usuario")
	public void clicar_no_icone_de_edicao_do_respectivo_usuario() {
		driver.findElement(By.cssSelector("div[data-tip='Editar']")).click();
	}

	@When("os dados do usuario serao retornados")
	public void os_dados_do_usuario_serao_retornados() {
		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}
	}

	@When("altere {string}, {string} e {string}")
	public void altere_e(String string, String string2, String string3) throws InterruptedException {
		Thread.sleep(2000);
		nomeNovo = driver.findElement(By.cssSelector("input[name='name']"));
		nomeNovo.clear();
		nomeNovo.sendKeys(string);
		
		emailNovo = driver.findElement(By.cssSelector("input[name='email']"));
		emailNovo.clear();
		emailNovo.sendKeys(string2);
		
		perfilNovo = driver.findElement(By.cssSelector("select[name='role']"));
		perfilNovo.clear();
		perfilNovo.sendKeys(string3);
	}

	@When("clique em Alterar usuario")
	public void clique_em_alterar_usuario() throws InterruptedException {
		Thread.sleep(2000);
		botaoAlterar = driver.findElement(By.cssSelector("button[type='submit']"));
		botaoAlterar.click();
	}

	@Then("a mensagem de alteracao do usuario {string}")
	public void a_mensagem_de_alteracao_do_usuario(String string) {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}
		
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(2));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//p[text()='Alterado com sucesso!']")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	//DELETAR
	@When("role a pagina de usuario")
	public void role_a_pagina_de_usuario() {
		int qtdScrolls = 25;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@When("buscar o usuario {string}")
	public void buscar_o_usuario(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);
		buscar.sendKeys(Keys.ENTER);
	}

	@When("clicar no icone de exclusão de usuario")
	public void clicar_no_icone_de_exclusão_de_usuario() throws InterruptedException {
		Thread.sleep(1000);
		driver.findElement(By.cssSelector("div[data-tip='Deletar']")).click();
	}

	@Then("a mensagem {string} para o usuario excluido")
	public void a_mensagem_para_o_usuario_excluido(String string) throws InterruptedException {
		Thread.sleep(1000);
		int qtdScrolls = 25;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}
		
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(2));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//p[text()='Deletado com sucesso!']")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

}
