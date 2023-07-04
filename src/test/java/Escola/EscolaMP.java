package Escola;

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

public class EscolaMP {
	private WebDriver driver;
	private String url = "http://3.82.209.69:3000/login";

	private WebElement email;
	private WebElement adm;
	private WebElement escola;
	private WebElement mensagem;
	private WebElement nome;
	private WebElement cidade;
	private WebElement estado;
	private WebElement nomeRetorno;
	private WebElement cidadeRetorno;
	private WebElement estadoRetorno;
	private WebElement nomeNovo;
	private WebElement estadoNovo;
	private WebElement cidadeNovo;
	private WebElement botaoAlterar;
	private WebElement buscar;

	// BACKGROUND
	@Given("login escola mapper")
	public void login_escola_mapper() {
		driver = new ChromeDriver();
		driver.get(url);

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys("raonikg@gmail.com");
		driver.findElement(By.cssSelector("input[name='password']")).sendKeys("123456");
		driver.findElement(By.cssSelector("button[type='submit']")).click();
	}

	@Given("clicar em Administração no menu")
	public void clicar_em_administração_no_menu() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		adm = wait.until(
				ExpectedConditions.presenceOfElementLocated(By.xpath("//span[contains(text(), 'Administração')]")));
		adm.click();
	}

	@Given("clicar em Escola")
	public void clicar_em_escola() throws InterruptedException {
		Thread.sleep(1000);
		escola = driver.findElement(By.cssSelector("a[href='/admin/school']"));
		escola.click();
	}

	@When("abrira a tela de cadastro de escola")
	public void abrira_a_tela_de_cadastro_de_escola() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		wait.until(ExpectedConditions.urlToBe("http://3.82.209.69:3000/admin/school"));
		String urlAtual = driver.getCurrentUrl();
		Assert.assertEquals("http://3.82.209.69:3000/admin/school", urlAtual);
	}

	// REGISTRAR ESCOLAR COM SUCESSO
	@When("inserir o nome do escola {string}")
	public void inserir_o_nome_do_escola(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		nome = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='name']")));
		nome.sendKeys(string);
	}

	@When("inserir a cidade da escola {string}")
	public void inserir_a_cidade_da_escola(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		cidade = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='city']")));
		cidade.sendKeys(string);
	}

	@When("selecione o estado da escola {string}")
	public void selecione_o_estado_da_escola(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		estado = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='state']")));
		estado.sendKeys(string);
	}

	@When("clicar no botao Gravar escola")
	public void clicar_no_botao_gravar_escola() throws InterruptedException {
		Thread.sleep(2000);
		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}
		
		driver.findElement(By.cssSelector("button[type='submit']")).click();
	}

	@Then("a mensagem para escola {string}")
	public void a_mensagem_para_escola(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("p")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	//CADASTRAR ESCOLA CAMPOS EM BRANCO
	@When("inserir nome do escola {string}")
	public void inserir_nome_do_escola(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		nome = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='name']")));
		nome.sendKeys(string);
	}

	@When("inserir cidade da escola {string}")
	public void inserir_cidade_da_escola(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		cidade = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='city']")));
		cidade.sendKeys(string);
	}

	@When("selecione estado da escola {string}")
	public void selecione_estado_da_escola(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		estado = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='state']")));
		estado.sendKeys(string);
	}

	@Then("a mensagem dos campos {string}")
	public void a_mensagem_dos_campos(String string) {
		
		if (nome.getAttribute("data-maska-value") == null) {
			String errorMessageNome = nome.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageNome);
		} else if (cidade.getAttribute("data-maska-value") == null) {
			String errorMessageEmail = cidade.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageEmail);
		} else if (estado == null) {
			String errorMessageSexo = estado.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageSexo);
		}
	}
	
	//CONSULTAR 
	@When("rolar pagina de escola")
	public void rolar_pagina_de_escola() {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@When("buscar o escola pelo {string}")
	public void buscar_o_escola_pelo(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);

		driver.findElement(By.cssSelector("button[class='absolute right-0 px-3 py-2 text-neutral-400 hover:text-neutral-600']")).click();
	}

	@Then("retorna o {string}, {string} e {string} da escola")
	public void retorna_o_e_da_escola(String string, String string2, String string3) throws InterruptedException {
		Thread.sleep(2000);
		nomeRetorno = driver.findElement(By.cssSelector("td[data-col='0']"));
		String nomeCampo = nomeRetorno.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string, nomeCampo);
		
		cidadeRetorno = driver.findElement(By.cssSelector("td[data-col='1']"));
		String cidadeCampo = cidadeRetorno.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string2, cidadeCampo);
		
		estadoRetorno = driver.findElement(By.cssSelector("td[data-col='2']"));
		String estadoCampo = estadoRetorno.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, estadoCampo);
		
	}

	//ALTERAR ESCOLA
	@When("rolar pagina de escola para baixo")
	public void rolar_pagina_de_escola_para_baixo() {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@When("buscar o escola com {string}")
	public void buscar_o_escola_com(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);

		driver.findElement(By.cssSelector("button[class='absolute right-0 px-3 py-2 text-neutral-400 hover:text-neutral-600']")).click();
	}

	@When("retorna o {string}, {string} e {string} da escola  buscada")
	public void retorna_o_e_da_escola_buscada(String string, String string2, String string3) throws InterruptedException {
		Thread.sleep(2000);
		nomeRetorno = driver.findElement(By.cssSelector("td[data-col='0']"));
		String nomeCampo = nomeRetorno.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string, nomeCampo);
		
		cidadeRetorno = driver.findElement(By.cssSelector("td[data-col='1']"));
		String cidadeCampo = cidadeRetorno.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string2, cidadeCampo);
		
		estadoRetorno = driver.findElement(By.cssSelector("td[data-col='2']"));
		String estadoCampo = estadoRetorno.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, estadoCampo);
	}

	@When("clicar no icone de edicao da respectiva escola")
	public void clicar_no_icone_de_edicao_da_respectiva_escola() {
		driver.findElement(By.cssSelector("button[data-v-bf2fbb02]")).click();
	}

	@When("os dados da escola serao retornados")
	public void os_dados_da_escola_serao_retornados() {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}
	}

	@When("altere {string}, {string}, {string}")
	public void altere(String string, String string2, String string3) throws InterruptedException {
		Thread.sleep(2000);
		nomeNovo = driver.findElement(By.cssSelector("input[name='name']"));
		nomeNovo.clear();
		nomeNovo.sendKeys(string);
		
		cidadeNovo = driver.findElement(By.cssSelector("input[name='city']"));
		cidadeNovo.clear();
		cidadeNovo.sendKeys(string2);
		
		estadoNovo = driver.findElement(By.cssSelector("select[name='state']"));
		estadoNovo.sendKeys(string3);
	}

	@When("clique em Alterar escola")
	public void clique_em_alterar_escola() throws InterruptedException {
		Thread.sleep(2000);
		botaoAlterar = driver.findElement(By.cssSelector("button[type='submit']"));
		botaoAlterar.click();
	}

	@Then("a mensagem de alteracao da escola {string}")
	public void a_mensagem_de_alteracao_da_escola(String string) {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}
		
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(2));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//p[text()='Alterado com sucesso!']")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	//DELETAR ESCOLA
	@When("role a pagina de escola")
	public void role_a_pagina_de_escola() {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@When("buscar o escola {string}")
	public void buscar_o_escola(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);

		driver.findElement(By.cssSelector("button[class='absolute right-0 px-3 py-2 text-neutral-400 hover:text-neutral-600']")).click();
	}

	@When("clicar no icone de exclusão de escola")
	public void clicar_no_icone_de_exclusão_de_escola() throws InterruptedException {
		Thread.sleep(2000);
		driver.findElement(By.cssSelector("button[data-v-bf2fbb02")).click();
	}
	
	@Then("a mensagem {string} de escola deletada")
	public void a_mensagem_de_escola_deletada(String string) {
		int qtdScrolls = 10;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}
		
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(2));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//p[text()='Deletado com sucesso!']")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}
}
