package com.cloudy.guys.selenium.example.tests;

import static org.junit.Assert.assertTrue;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import com.cloudy.guys.selenium.example.page.objects.GetStarted;
import com.cloudy.guys.selenium.example.page.objects.Home;

public class FirefoxExample {
	
	private static final String hub = "http://127.0.0.1:4444/wd/hub";
	private static final int wait = 30;
	private static boolean useGrid = true;
	
	public void simpleTest(){
		WebDriver driver = null;
		try {
			driver = getFirefoxDriver();
			Home home = Home.open(driver);
			assertTrue(Home.correctPage(driver));
			GetStarted getStarted = home.clickGetStarted();
			assertTrue(getStarted.correctPage());
			getStarted.returnHome();
			assertTrue(Home.correctPage(driver));
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} finally {
			driver.quit();
		}
	}
	
	public static WebDriver getFirefoxDriver() throws MalformedURLException {
		WebDriver driver = null;
		if (useGrid == true){
			DesiredCapabilities capability = DesiredCapabilities.firefox();
			driver = new RemoteWebDriver(new URL(hub), capability);
		} else {
			driver = new FirefoxDriver();
		}
		driver.manage().timeouts().implicitlyWait(wait, TimeUnit.SECONDS);
		return driver;
	}

}
