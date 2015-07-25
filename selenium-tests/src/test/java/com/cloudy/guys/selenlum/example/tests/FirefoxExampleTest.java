package com.cloudy.guys.selenlum.example.tests;

import org.junit.Test;

import com.cloudy.guys.selenium.example.tests.FirefoxExample;

public class FirefoxExampleTest {
	
	@Test public void simpleTest1() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest2() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest3() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest4() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest5() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest6() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest7() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest8() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest9() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest10() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest11() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest12() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest13() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest14() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest15() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest16() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest17() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest18() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest19() { new FirefoxExample().simpleTest(); }
	@Test public void simpleTest20() { new FirefoxExample().simpleTest(); }

	public void generateTests(){
		for (int i = 1; i < 21; i++){
			System.out.println("@Test public void simpleTest" + i + "() { new FirefoxExample().simpleTest(); }");
		}
	}

}
