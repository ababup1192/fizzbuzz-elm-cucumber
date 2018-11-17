package gradle.cucumber;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import static junit.framework.TestCase.assertTrue;


public class BasicStepDefs {

    WebDriver driver =null;

    @Given("^FizzBuzzアプリが立ち上げ$")
    public void FizzBuzzアプリが立ち上げ() throws Throwable {
        System.setProperty("webdriver.chrome.driver", "Driver/chromedriver");
        driver = new ChromeDriver();
        driver.get("https://ababup1192.github.io/fizzbuzz-elm-cucumber/");
    }


    @When("^(\\d+)を入力した$")
    public void を入力した(int x) throws Throwable {
        WebElement input = driver.findElement(By.tagName("input"));
        input.clear();
        input.sendKeys("3");
    }

    @Then("^Fizzと表示された$")
    public void Fizzと表示された() throws Throwable {
        Thread.sleep(1000);
        WebElement resElement = driver.findElement(By.tagName("h1"));
        String fizzbuzzText = resElement.getText();
        assertTrue(fizzbuzzText.contains("Fuzz"));
        driver.quit();
    }
}
