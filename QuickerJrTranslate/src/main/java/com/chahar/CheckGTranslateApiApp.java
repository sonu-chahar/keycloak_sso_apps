package com.chahar;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class CheckGTranslateApiApp {
	public static WebDriver driver;

	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver", "/home/sonu/DEVELOPMENT/QuickerJrTranslate/lib/chromedriver");
		Map<String, String> propMap = readPropertyFile("messages_en.properties");
		StringBuilder untranslatedKeys = new StringBuilder();
		Map<String, String> translatedMap = translatePropMap(propMap, untranslatedKeys);
		writeTranslatedMapToPropFile(translatedMap, "src/main/resources/messages_indic.properties");

//		String[] untranslatedKeysArr = findUntranslatedKeysFromFileName("admin-untranslatedKey.txt");
//		Map<String, String> translatedMap = new LinkedHashMap<>();
//		StringBuilder untranslatedKeys = new StringBuilder();
//		for (int i = 0; i < untranslatedKeysArr.length; i++) {
//			String translatedKeyVal = translatePropKey(propMap.get(untranslatedKeysArr[i]), untranslatedKeys);
//			System.out.println(untranslatedKeysArr[i] + ":" + translatedKeyVal);
//			translatedMap.put(untranslatedKeysArr[i], translatedKeyVal);
//		}
//		if (driver != null) {
//			driver.quit();
//		}
		System.out.println(translatedMap);
		System.out.println(untranslatedKeys.toString());

	}

	public static String[] findUntranslatedKeysFromFileName(String fileName) {
		InputStreamReader isReader = null;
		BufferedReader br = null;
		String untranslatedKeys;
		String[] untranslatedKeysArr = null;
		try {
			isReader = new InputStreamReader(
					Thread.currentThread().getContextClassLoader().getResourceAsStream(fileName));
			br = new BufferedReader(isReader);
			while ((untranslatedKeys = br.readLine()) != null)
				untranslatedKeysArr = untranslatedKeys.split(",");
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return untranslatedKeysArr;
	}

	public static void writeTranslatedMapToPropFile(Map<String, String> translatedMap, String outputFilePath) {
		File file = new File(outputFilePath);
		BufferedWriter bf = null;
		try {
			bf = new BufferedWriter(new FileWriter(file));
			bf.write("#encoding:UTF-8");
			Iterator<String> it = translatedMap.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				bf.write(key + ":" + translatedMap.get(key));
				bf.newLine();
			}
			bf.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bf.close();
			} catch (Exception e) {
			}
		}
	}

	public static Map<String, String> translatePropMap(Map<String, String> propMap, StringBuilder untranslatedKeys) {
		Map<String, String> translatedMap = new LinkedHashMap<>();
		WebDriver driver = new ChromeDriver();
		driver.navigate().to("https://translate.google.com/?hl=en#view=home&op=translate&sl=en&tl=hi");
		Iterator<String> it = propMap.keySet().iterator(); // keyset is a method
		while (it.hasNext()) {
			String key = it.next();
			driver.findElement(By.xpath("//textarea[@id='source']")).clear();
			driver.findElement(By.xpath("//textarea[@id='source']")).sendKeys(propMap.get(key));
			String str = null;
			try {
				Thread.sleep(2000);
				str = driver.findElement(By.xpath("//span[@class='tlid-translation translation']")).getText();
			} catch (InterruptedException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
				untranslatedKeys.append(key + ",");
			}
			if (str != null) {
				System.out.println(key + "::" + str);
				translatedMap.put(key, str);
			}
		}
		driver.quit();
		return translatedMap;
	}

	public static Map<String, String> readPropertyFile(String propertyFileName) {
		Properties prop = new Properties();
		InputStream input = null;
		Map<String, String> propvals = new HashMap<>();
		try {

			input = Thread.currentThread().getContextClassLoader().getResourceAsStream(propertyFileName);
			prop.load(input);
			Set<String> propertyNames = prop.stringPropertyNames();
			for (String Property : propertyNames) {
				propvals.put(Property, prop.getProperty(Property));
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return propvals;
	}

	public static String[] findUntranslatedKeys(String untranslatedKeys) {
		String[] untranslatedKeysArr = untranslatedKeys.split(",");
		return untranslatedKeysArr;
	}

	public static String translatePropKey(String translatePropKey, StringBuilder untranslatedKeys) {
		if (driver == null) {
			driver = new ChromeDriver();
		}
		driver.navigate().to("https://translate.google.com/?hl=en#view=home&op=translate&sl=en&tl=hi");
		driver.findElement(By.xpath("//textarea[@id='source']")).clear();
		driver.findElement(By.xpath("//textarea[@id='source']")).sendKeys(translatePropKey);
		String str = null;
		try {
			Thread.sleep(2000);
			str = driver.findElement(By.xpath("//span[@class='tlid-translation translation']")).getText();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			untranslatedKeys.append(translatePropKey + ",");
		}
		// driver.quit();
		return str;
	}

	public static WebDriver openBrowser(String siteUrl) {
		Map<String, String> translatedMap = new LinkedHashMap<>();
		WebDriver driver = new ChromeDriver();
		driver.navigate().to("https://translate.google.com/?hl=en#view=home&op=translate&sl=en&tl=hi");
		return driver;
	}

}
