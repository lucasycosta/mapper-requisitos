package BuscarAluno;

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

public class BuscarAlunoMP {
	private WebDriver driver;
	private String url = "http://3.82.209.69:3000/login";
	
	private WebElement email;
	private WebElement areaAluno;
	private WebElement aluno;
	private WebElement permissao;
	private WebElement nomeAluno;
	private WebElement emailAluno;
	private WebElement matricula;
	private WebElement botaoOpcoes;
	private WebElement link;
	private WebElement nomeSimulado;
	private WebElement dataSimulado;
	private WebElement area;
	private WebElement nota;
	private WebElement lc;
	private WebElement ch;
	private WebElement curso;
	private WebElement cn;
	private WebElement m;
	private WebElement r;
	private WebElement uf;
	
	
	//BACKGROUD
	@Given("login buscarAluno")
	public void login_buscar_aluno() {
		driver = new ChromeDriver();
		driver.get(url);

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		email = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='email']")));
		email.sendKeys("raonikg@gmail.com");
		driver.findElement(By.cssSelector("input[name='password']")).sendKeys("123456");
		driver.findElement(By.cssSelector("button[type='submit']")).click();
	}

	@Given("clicar na Area do Aluno")
	public void clicar_na_area_do_aluno() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		areaAluno = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//span[contains(text(), 'Área do Aluno')]")));
		areaAluno.click();
	}

	@Given("clicar em Buscar Aluno")
	public void clicar_em_buscar_aluno() throws InterruptedException {
		Thread.sleep(1000);
		aluno = driver.findElement(By.cssSelector("a[href='/student/search']"));
		aluno.click();
	}

	@Given("abrira a tela de pesquisar aluno")
	public void abrira_a_tela_de_pesquisar_aluno() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		wait.until(ExpectedConditions.urlToBe("http://3.82.209.69:3000/student/search"));
		String urlAtual = driver.getCurrentUrl();
		Assert.assertEquals("http://3.82.209.69:3000/student/search", urlAtual);
	}

	//BUSCA GERAL DE ALUNOS
	@When("selecionar uma {string}")
	public void selecionar_uma(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		permissao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class='multiselect__tags']")));
		permissao.click();
		permissao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='permission']")));
		permissao.sendKeys(string);
		permissao.sendKeys(Keys.ENTER);
	}

	@When("buscar aluno pelo {string}")
	public void buscar_aluno_pelo(String string) {
	    nomeAluno = driver.findElement(By.cssSelector("input[name='search']"));
	    nomeAluno.sendKeys(string);
	    nomeAluno.sendKeys(Keys.ENTER);
	}

	@Then("o registro do aluno retorna o {string}, {string} e {string}")
	public void o_registro_do_aluno_retorna_o_e(String string, String string2, String string3) throws InterruptedException {
		Thread.sleep(2000);
		driver.findElement(By.cssSelector("div[class='relative flex w-full flex-col gap-4']"));
		driver.findElement(By.cssSelector("div[class='flex flex-row items-center gap-4 rounded-md border bg-white p-4 shadow transition-colors hover:border-primary-500 w-full']"));
		nomeAluno = driver.findElement(By.cssSelector("span[class='font-bold text-gray-600']"));
		String nomeRetorno = nomeAluno.getText();
		Assert.assertEquals(string, nomeRetorno);
		
		WebElement div = driver.findElement(By.cssSelector("div[class='flex flex-grow flex-row justify-between']"));
		emailAluno = div.findElement(By.cssSelector("span[class='text-sm text-gray-500']"));
		String emailRetorno = emailAluno.getText();
		Assert.assertEquals(string2, emailRetorno);
		
		matricula = driver.findElement(By.cssSelector("div[class='flex flex-col justify-evenly text-sm text-gray-700']"));
		String matriculaRetorno = matricula.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, matriculaRetorno);
		
	}

	//PROCESSO SELETIVO
	@When("selecionar a {string}")
	public void selecionar_a(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		permissao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class='multiselect__tags']")));
		permissao.click();
		permissao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='permission']")));
		permissao.sendKeys(string);
		permissao.sendKeys(Keys.ENTER);
	}

	@When("buscar o aluno pelo {string}")
	public void buscar_o_aluno_pelo(String string) {
		nomeAluno = driver.findElement(By.cssSelector("input[name='search']"));
	    nomeAluno.sendKeys(string);
	    nomeAluno.sendKeys(Keys.ENTER);
	}

	@When("o registro retorna o {string}, {string} e {string}")
	public void o_registro_retorna_o_e(String string, String string2, String string3) throws InterruptedException {
		Thread.sleep(2000);
		driver.findElement(By.cssSelector("div[class='relative flex w-full flex-col gap-4']"));
		driver.findElement(By.cssSelector("div[class='flex flex-row items-center gap-4 rounded-md border bg-white p-4 shadow transition-colors hover:border-primary-500 w-full']"));
		nomeAluno = driver.findElement(By.cssSelector("span[class='font-bold text-gray-600']"));
		String nomeRetorno = nomeAluno.getText();
		Assert.assertEquals(string, nomeRetorno);
		
		WebElement div = driver.findElement(By.cssSelector("div[class='flex flex-grow flex-row justify-between']"));
		emailAluno = div.findElement(By.cssSelector("span[class='text-sm text-gray-500']"));
		String emailRetorno = emailAluno.getText();
		Assert.assertEquals(string2, emailRetorno);
		
		matricula = driver.findElement(By.cssSelector("div[class='flex flex-col justify-evenly text-sm text-gray-700']"));
		String matriculaRetorno = matricula.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, matriculaRetorno);
	}

	@When("clicar no icone de opcoes")
	public void clicar_no_icone_de_opcoes() {
	    botaoOpcoes = driver.findElement(By.cssSelector("button[class='rounded-md border border-primary-500 p-1.5 text-gray-700 transition-colors hover:bg-primary-500 hover:text-white']"));
	    botaoOpcoes.click();
	}

	@When("clicar em Processo Seletivo {string}")
	public void clicar_em_processo_seletivo(String string) {
		WebElement processo = driver.findElement(By.cssSelector("div[class='flex w-max flex-col rounded-md border bg-white text-sm shadow [&>*:hover]:bg-gray-100 [&>*]:px-2 [&>*]:py-1 [&>*]:text-left']"));
	    link = processo.findElement(By.cssSelector(string));
	    link.click();
	}

	@When("abrir a pagina do processo com {string} e {string} do aluno")
	public void abrir_a_pagina_do_processo_com_e_do_aluno(String string, String string2) throws InterruptedException {
		Thread.sleep(2000);
		
		nomeAluno = driver.findElement(By.cssSelector("span[class='text-lg font-semibold text-gray-700']"));
		String nomeRetorno = nomeAluno.getText();
		Assert.assertEquals(string, nomeRetorno);
		
		emailAluno = driver.findElement(By.cssSelector("span[class='text-sm text-gray-500']"));
		String emailRetorno = emailAluno.getText();
		Assert.assertEquals(string2, emailRetorno);
	}

	@When("clicar no icone para ver os detalhes")
	public void clicar_no_icone_para_ver_os_detalhes() {
	    botaoOpcoes = driver.findElement(By.cssSelector("button[class='flex items-center']"));
	    botaoOpcoes.click();
	}

	/*
	 * @Then("informacoes sobre o processo do aluno serao apresentadas") public void
	 * informacoes_sobre_o_processo_do_aluno_serao_apresentadas() { // Write code
	 * here that turns the phrase above into concrete actions throw new
	 * io.cucumber.java.PendingException(); }
	 */

	//SIMULADOS
	@When("selecionar {string}")
	public void selecionar(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		permissao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class='multiselect__tags']")));
		permissao.click();
		permissao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='permission']")));
		permissao.sendKeys(string);
		permissao.sendKeys(Keys.ENTER);
	}

	@When("buscar o aluno {string}")
	public void buscar_o_aluno(String string) {
		nomeAluno = driver.findElement(By.cssSelector("input[name='search']"));
	    nomeAluno.sendKeys(string);
	    nomeAluno.sendKeys(Keys.ENTER);
	}

	@When("o registro retornara o {string}, {string} e {string} do aluno")
	public void o_registro_retornara_o_e_do_aluno(String string, String string2, String string3) throws InterruptedException {
		Thread.sleep(2000);
		driver.findElement(By.cssSelector("div[class='relative flex w-full flex-col gap-4']"));
		driver.findElement(By.cssSelector("div[class='flex flex-row items-center gap-4 rounded-md border bg-white p-4 shadow transition-colors hover:border-primary-500 w-full']"));
		nomeAluno = driver.findElement(By.cssSelector("span[class='font-bold text-gray-600']"));
		String nomeRetorno = nomeAluno.getText();
		Assert.assertEquals(string, nomeRetorno);
		
		WebElement div = driver.findElement(By.cssSelector("div[class='flex flex-grow flex-row justify-between']"));
		emailAluno = div.findElement(By.cssSelector("span[class='text-sm text-gray-500']"));
		String emailRetorno = emailAluno.getText();
		Assert.assertEquals(string2, emailRetorno);
		
		matricula = driver.findElement(By.cssSelector("div[class='flex flex-col justify-evenly text-sm text-gray-700']"));
		String matriculaRetorno = matricula.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, matriculaRetorno);
	}

	@When("clicar no icone de opcoes do aluno")
	public void clicar_no_icone_de_opcoes_do_aluno() {
		botaoOpcoes = driver.findElement(By.cssSelector("button[class='rounded-md border border-primary-500 p-1.5 text-gray-700 transition-colors hover:bg-primary-500 hover:text-white']"));
	    botaoOpcoes.click();
	}

	@When("clicar em Simulados {string}")
	public void clicar_em_simulados(String string) {
		WebElement processo = driver.findElement(By.cssSelector("div[class='flex w-max flex-col rounded-md border bg-white text-sm shadow [&>*:hover]:bg-gray-100 [&>*]:px-2 [&>*]:py-1 [&>*]:text-left']"));
	    link = processo.findElement(By.cssSelector(string));
	    link.click();
	}

	@When("abrir a pagina dos Simulados com {string} e {string} do aluno")
	public void abrir_a_pagina_dos_simulados_com_e_do_aluno(String string, String string2) throws InterruptedException {
		Thread.sleep(2000);
		
		nomeAluno = driver.findElement(By.cssSelector("span[class='text-lg font-semibold text-gray-700']"));
		String nomeRetorno = nomeAluno.getText();
		Assert.assertEquals(string, nomeRetorno);
		
		emailAluno = driver.findElement(By.cssSelector("span[class='text-sm text-gray-500']"));
		String emailRetorno = emailAluno.getText();
		Assert.assertEquals(string2, emailRetorno);
	}

	@Then("retornar o {string}, {string}, {string} e {string} dos simulados")
	public void retornar_o_e_dos_simulados(String string, String string2, String string3, String string4) {
		
		WebElement tabela = driver.findElement(By.cssSelector("tr[class='even:bg-gray-50']"));
		
		nomeSimulado = tabela.findElement(By.cssSelector("td[data-col='0']"));
		String nomeRetorno = nomeSimulado.getText();
		Assert.assertEquals(string, nomeRetorno);
		
		dataSimulado = tabela.findElement(By.cssSelector("td[data-col='1']"));
		String dataRetorno = dataSimulado.getText();
		Assert.assertEquals(string2, dataRetorno);
		
		area = tabela.findElement(By.cssSelector("td[data-col='2']"));
		String areaConhecimento = area.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, areaConhecimento);
		
		nota = tabela.findElement(By.cssSelector("td[data-col='3']"));
		String notaSimulado = nota.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string4, notaSimulado);
	}

	//NOTA SISU
	@When("escolher {string}")
	public void escolher(String string) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		permissao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class='multiselect__tags']")));
		permissao.click();
		permissao = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("input[name='permission']")));
		permissao.sendKeys(string);
		permissao.sendKeys(Keys.ENTER);
	}

	@When("procurar o aluno {string}")
	public void procurar_o_aluno(String string) {
		nomeAluno = driver.findElement(By.cssSelector("input[name='search']"));
	    nomeAluno.sendKeys(string);
	    nomeAluno.sendKeys(Keys.ENTER);
	}

	@When("o registro retornara o {string}, {string} e {string} do aluno buscado")
	public void o_registro_retornara_o_e_do_aluno_buscado(String string, String string2, String string3)  throws InterruptedException {
		Thread.sleep(2000);
		driver.findElement(By.cssSelector("div[class='relative flex w-full flex-col gap-4']"));
		driver.findElement(By.cssSelector("div[class='flex flex-row items-center gap-4 rounded-md border bg-white p-4 shadow transition-colors hover:border-primary-500 w-full']"));
		nomeAluno = driver.findElement(By.cssSelector("span[class='font-bold text-gray-600']"));
		String nomeRetorno = nomeAluno.getText();
		Assert.assertEquals(string, nomeRetorno);
		
		WebElement div = driver.findElement(By.cssSelector("div[class='flex flex-grow flex-row justify-between']"));
		emailAluno = div.findElement(By.cssSelector("span[class='text-sm text-gray-500']"));
		String emailRetorno = emailAluno.getText();
		Assert.assertEquals(string2, emailRetorno);
		
		matricula = driver.findElement(By.cssSelector("div[class='flex flex-col justify-evenly text-sm text-gray-700']"));
		String matriculaRetorno = matricula.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, matriculaRetorno);
	}

	@When("clicar no icone de opcoes do aluno buscado")
	public void clicar_no_icone_de_opcoes_do_aluno_buscado() {
		botaoOpcoes = driver.findElement(By.cssSelector("button[class='rounded-md border border-primary-500 p-1.5 text-gray-700 transition-colors hover:bg-primary-500 hover:text-white']"));
	    botaoOpcoes.click();
	}

	@When("clicar em Nota SISU {string}")
	public void clicar_em_nota_sisu(String string) {
		WebElement processo = driver.findElement(By.cssSelector("div[class='flex w-max flex-col rounded-md border bg-white text-sm shadow [&>*:hover]:bg-gray-100 [&>*]:px-2 [&>*]:py-1 [&>*]:text-left']"));
	    link = processo.findElement(By.cssSelector(string));
	    link.click();
	}

	@When("abrir a pagina da Nota Sisu com {string} e {string} do aluno")
	public void abrir_a_pagina_da_nota_sisu_com_e_do_aluno(String string, String string2) throws InterruptedException {
		//Thread.sleep(7000);
		
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		nomeAluno = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("span[class='text-lg font-semibold text-gray-700']")));
		
		//nomeAluno = driver.findElement(By.cssSelector("span[class='text-lg font-semibold text-gray-700']"));
		String nomeRetorno = nomeAluno.getText();
		Assert.assertEquals(string, nomeRetorno);
		
		emailAluno = driver.findElement(By.cssSelector("span[class='text-sm text-gray-500']"));
		String emailRetorno = emailAluno.getText();
		Assert.assertEquals(string2, emailRetorno);
	}

	@Then("retornar o {string}, {string}, {string}, {string}, {string}, {string} e {string} dos simulados")
	public void retornar_o_e_dos_simulados(String string, String string2, String string3, String string4, String string5, String string6, String string7) throws InterruptedException {
		Thread.sleep(5000);
		//"//span[contains(text(), 'Área do Aluno')]"
		WebElement tabela = driver.findElement(By.cssSelector("div[class='grid grid-cols-4 items-center gap-x-2 gap-y-1 rounded-md bg-white p-4 shadow @md:grid-cols-6']"));
		
		lc = tabela.findElement(By.xpath("//span[contains(text(), 'LC')]"));
		String lcRetorno = lc.getText();
		Assert.assertEquals(string, lcRetorno);
		
		ch = tabela.findElement(By.xpath("//span[contains(text(), 'CH')]"));
		String chRetorno = ch.getText();
		Assert.assertEquals(string2, chRetorno);
		
		curso = tabela.findElement(By.xpath("//span[contains(text(), 'Curso')]"));
		String cursoRetorno = curso.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string3, cursoRetorno);
		
		cn = tabela.findElement(By.xpath("//span[contains(text(), 'CN')]"));
		String cnRetorno = cn.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string4, cnRetorno);
		
		m = tabela.findElement(By.xpath("//span[contains(text(), 'LC')]"));
		String mRetorno = m.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string5, mRetorno);
		
		r = tabela.findElement(By.xpath("//span[contains(text(), 'LC')]"));
		String rRetorno = r.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string6, rRetorno);
		
		uf = tabela.findElement(By.xpath("//span[contains(text(), 'LC')]"));
		String ufRetorno = uf.findElement(By.cssSelector("span")).getText();
		Assert.assertEquals(string7, ufRetorno);
	}

}
