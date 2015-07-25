package com.cloudy.guys.selenium.example.page.objects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class Home {

	protected WebDriver driver;

	@FindBy(linkText = "Get started today")
	private WebElement getStartedLink;

	public Home(WebDriver driver) {
		this.driver = driver;
	}

	public static Home open(WebDriver driver) {
		driver.get("https://investor.vanguard.com");
		return PageFactory.initElements(driver, Home.class);
	}
	
	public static boolean correctPage(WebDriver driver){
		return driver.getTitle().contains("Vanguard: Helping you reach your investing goals"); 
	}
	
	public GetStarted clickGetStarted() {	
		getStartedLink.click();
		return PageFactory.initElements(driver, GetStarted.class);
	}

	
	

}
