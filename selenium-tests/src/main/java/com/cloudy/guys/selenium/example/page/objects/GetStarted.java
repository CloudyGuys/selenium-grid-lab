package com.cloudy.guys.selenium.example.page.objects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class GetStarted {
	
	protected WebDriver driver;
	
	@FindBy(linkText = "Go to vanguard.com homepage")
	private WebElement returnHomeLink;

	public GetStarted(WebDriver driver) {
		this.driver = driver;
	}
	
	public boolean correctPage(){
		return driver.getTitle().equals("Open Account");
	}
	
	public Home returnHome(){
		returnHomeLink.click();
		return PageFactory.initElements(driver, Home.class);
	}

}
