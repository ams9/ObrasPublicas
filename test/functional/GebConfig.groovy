import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.firefox.FirefoxProfile

driver = {
    File file = new File("chromedrivers/chromedrivermac"); //configurar com o enderço correto do chromedriver.
    System.setProperty("webdriver.chrome.driver", file.getAbsolutePath());
    new ChromeDriver();
}

environments {
    chrome {
        driver = {
            def osPath = System.getProperty("os.name").toLowerCase().split(" ").first()

            def chromeDriver = new File("chromedrivers", osPath).listFiles(new FilenameFilter() {
                @Override
                boolean accept(File dir, String name) { name.startsWith("chromedriver") }
            }).first()

            System.setProperty("webdriver.chrome.driver", chromeDriver.getAbsolutePath())

            new ChromeDriver()
        }
    }
}