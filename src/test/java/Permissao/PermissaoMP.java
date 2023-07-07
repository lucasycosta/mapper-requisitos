package Permissao;

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

public class PermissaoMP {
	private WebDriver driver;
	private String url = "http://3.82.209.69:3000/login";

	private WebElement email;
	private WebElement adm;
	private WebElement mensagem;
	private WebElement data;
	private WebElement ano;
	private WebElement serie;
	private WebElement duracao;
	private WebElement escola;
	private WebElement codigo;
	private WebElement nomeEsc;
	private WebElement dataIn;
	private WebElement dataVal;
	private WebElement periodo;
	private WebElement duracaoNovo;
	private WebElement serieNovo;
	private WebElement botaoAlterar;
	private WebElement buscar;

	// BACKGROUND
	@Given("login permissao mapper")
	public void login_permissao_mapper() {
		driver = new ChromeDriver();
		driver.get(url);

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys("raonikg@gmail.com");
		driver.findElement(By.cssSelector("input[name='password']")).sendKeys("123456");
		driver.findElement(By.cssSelector("button[type='submit']")).click();
	}

	@Given("clicar em Administracao no menu lateral")
	public void clicar_em_administracao_no_menu_lateral() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		adm = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//span[contains(text(), 'Administração')]")));
		adm.click();
	}

	@Given("clicar em Permissao")
	public void clicar_em_permissao() throws InterruptedException {
		Thread.sleep(1000);
		escola = driver.findElement(By.cssSelector("a[href='/admin/permission']"));
		escola.click();
	}

	@Given("abrira a tela de cadastro de Permissao")
	public void abrira_a_tela_de_cadastro_de_permissao() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		wait.until(ExpectedConditions.urlToBe("http://3.82.209.69:3000/admin/permission"));
		String urlAtual = driver.getCurrentUrl();
		Assert.assertEquals("http://3.82.209.69:3000/admin/permission", urlAtual);
	}

	// CADASTRAR COM SUCESSO
	@Given("inserir a data de inicio {string} da permissao")
	public void inserir_a_data_de_inicio_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		data = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='startDate']")));
		data.sendKeys(string);
	}

	@Given("inserir o ano {string} da permissao")
	public void inserir_o_ano_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		ano = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='year']")));
		ano.sendKeys(string);
	}

	@Given("selecione a serie {string} da permissao")
	public void selecione_a_serie_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		serie = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='schoolYear']")));
		serie.sendKeys(string);
	}

	@Given("selecione a duração {string} da permissao")
	public void selecione_a_duração_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		duracao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='permissionDuration']")));
		duracao.sendKeys(string);
	}

	@Given("selecione a escola {string} da permissao")
	public void selecione_a_escola_da_permissao(String string) throws InterruptedException {

		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
		escola = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class='multiselect__tags']")));
		escola.click();

		Thread.sleep(1000);

		escola = driver.findElement(By.cssSelector("input[name='school']"));
		escola.sendKeys(string);
		escola.sendKeys(Keys.ENTER);
	}

	@Given("clicar no botão Gravar permissao")
	public void clicar_no_botão_gravar_permissao() throws InterruptedException {
		Thread.sleep(1000);
		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}

		driver.findElement(By.cssSelector("button[type='submit']")).click();
	}

	@Then("a mensagem {string} da permissao")
	public void a_mensagem_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		mensagem = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("p")));
		String texto = mensagem.getText();
		Assert.assertEquals(string, texto);
	}

	// CADASTRAR COM CAMPOS EM BRANCO
	@Given("inserir data de inicio {string} da permissao")
	public void inserir_data_de_inicio_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		data = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='startDate']")));
		data.sendKeys(string);
	}

	@Given("inserir ano {string} da permissao")
	public void inserir_ano_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		ano = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='year']")));
		ano.sendKeys(string);
	}

	@Given("selecione serie {string} da permissao")
	public void selecione_serie_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		serie = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='schoolYear']")));
		serie.sendKeys(string);
	}

	@Given("selecione duração {string} da permissao")
	public void selecione_duração_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		duracao = wait.until(
				ExpectedConditions.presenceOfElementLocated(By.cssSelector("select[name='permissionDuration']")));
		duracao.sendKeys(string);
	}

	@Given("selecione escola {string} da permissao")
	public void selecione_escola_da_permissao(String string) throws InterruptedException {

		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
		escola = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class='multiselect__tags']")));
		escola.click();

		Thread.sleep(1000);

		escola = driver.findElement(By.cssSelector("input[name='school']"));
		escola.sendKeys(string);
		escola.sendKeys(Keys.ENTER);
	}

	@Then("a mensagem {string} para permissao")
	public void a_mensagem_para_permissao(String string) {
		if (data.getAttribute("data-maska-value") == null) {
			String errorMessageNome = data.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageNome);
		} else if (ano.getAttribute("data-maska-value") == null) {
			String errorMessageAno = ano.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageAno);
		} else if (serie == null) {
			String errorMessageSerie = serie.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageSerie);
		} else if (duracao == null) {
			String errorMessageDuracao = duracao.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageDuracao);
		} else if (escola == null) {
			String errorMessageEscola = escola.getAttribute("errormessage");
			Assert.assertEquals(string, errorMessageEscola);
		}
	}

	//CONSULTAR
	@Given("rolar pagina de permissao")
	public void rolar_pagina_de_permissao() {
		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@Given("buscar a permissao pelo {string} da permissao")
	public void buscar_a_permissao_pelo_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);
		buscar.sendKeys(Keys.ENTER);
	}

	@Then("retorna o {string}, {string}, {string}, {string}, {string} e {string} da permissao")
	public void retorna_o_e_da_permissao(String cod, String string, String string2, String string3, String string4, String string5) throws InterruptedException {
		Thread.sleep(2000);
		codigo = driver.findElement(By.cssSelector("td[data-col='0']"));
		String codReturn = codigo.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(cod, codReturn);
		
		nomeEsc = driver.findElement(By.cssSelector("td[data-col='1']"));
		String escola = nomeEsc.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string, escola);
		
		dataIn = driver.findElement(By.cssSelector("td[data-col='2']"));
		String dataInicio = dataIn.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string2, dataInicio);
		
		dataVal = driver.findElement(By.cssSelector("td[data-col='3']"));
		String dataValidade = dataVal.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, dataValidade);
		
		periodo = driver.findElement(By.cssSelector("td[data-col='4']"));
		String semestre = periodo.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string4, semestre);
		
		duracao = driver.findElement(By.cssSelector("td[data-col='5']"));
		String dur = duracao.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string5, dur);
	}

	//ALTERAR
	@Given("rolar pagina de permissao para baixo")
	public void rolar_pagina_de_permissao_para_baixo() {
		int qtdScrolls = 25;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@Given("buscar a permissao com {string} da permissao")
	public void buscar_a_permissao_com_da_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);
		buscar.sendKeys(Keys.ENTER);

	}

	@Then("retorna o {string}, {string}, {string}, {string}, {string} e {string} da permissao buscada")
	public void retorna_o_e_da_permissao_buscada(String cod, String string, String string2, String string3, String string4,	String string5) throws InterruptedException {
		Thread.sleep(2000);
		codigo = driver.findElement(By.cssSelector("td[data-col='0']"));
		String codReturn = codigo.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(cod, codReturn);
		
		nomeEsc = driver.findElement(By.cssSelector("td[data-col='1']"));
		String escola = nomeEsc.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string, escola);
		
		dataIn = driver.findElement(By.cssSelector("td[data-col='2']"));
		String dataInicio = dataIn.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string2, dataInicio);
		
		dataVal = driver.findElement(By.cssSelector("td[data-col='3']"));
		String dataValidade = dataVal.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, dataValidade);
		
		periodo = driver.findElement(By.cssSelector("td[data-col='4']"));
		String semestre = periodo.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string4, semestre);
		
		duracao = driver.findElement(By.cssSelector("td[data-col='5']"));
		String dur = duracao.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string5, dur);
	}

	@Then("clicar no icone de edicao da respectiva permissao")
	public void clicar_no_icone_de_edicao_da_respectiva_permissao() {
		driver.findElement(By.cssSelector("div[data-tip='Editar']")).click();
	}

	@Then("os dados da permissao serao retornados")
	public void os_dados_da_permissao_serao_retornados() {
		int qtdScrolls = 20;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.UP);
		}
	}

	@Then("altere {string} e {string}")
	public void altere_e(String string, String string2) throws InterruptedException {
		Thread.sleep(2000);
		duracaoNovo = driver.findElement(By.cssSelector("select[name='permissionDuration']"));
		duracaoNovo.click();
		duracaoNovo.sendKeys(string);
		
		serieNovo = driver.findElement(By.cssSelector("select[name='schoolYear']"));
		serieNovo.click();
		serieNovo.sendKeys(string2);
	}

	@Then("clique em Alterar permissao")
	public void clique_em_alterar_permissao() throws InterruptedException {
		Thread.sleep(2000);
		botaoAlterar = driver.findElement(By.cssSelector("button[type='submit']"));
		botaoAlterar.click();
	}

	@Then("a mensagem de alteracao da permissao {string}")
	public void a_mensagem_de_alteracao_da_permissao(String string) {
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
	@Given("role a pagina de permissao")
	public void role_a_pagina_de_permissao() {
		int qtdScrolls = 25;
		for (int i = 0; i < qtdScrolls; i++) {
			driver.findElement(By.tagName("body")).sendKeys(Keys.DOWN);
		}
	}

	@Given("buscar a permissao {string}")
	public void buscar_a_permissao(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		buscar = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='search']")));
		buscar.click();
		buscar.sendKeys(string);
		buscar.sendKeys(Keys.ENTER);
	}

	@Given("clicar no icone de exclusão de permissao")
	public void clicar_no_icone_de_exclusão_de_permissao() throws InterruptedException {
		Thread.sleep(1000);
		driver.findElement(By.cssSelector("div[data-tip='Deletar']")).click();
	}

	@Then("a mensagem {string} em permissao")
	public void a_mensagem_em_permissao(String string) throws InterruptedException {
		Thread.sleep(1000);
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
