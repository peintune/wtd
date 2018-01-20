/**
 * @Title: HomePagetest.java
 * @Package com.pub.WTD.pages 
 * @Description: home page
 * @author hekun 158109016@qq.com
 * @date 2014��7��3�� ����10:27:41 
 * @version V1.0   
 */
package pages;

import com.pub.wtd.common.SessionData;
import org.openqa.selenium.By;

/**
 * @author hekun<158109016@qq.com>
 * 
 */
public class HomePageWithLogIn extends HomePage {
	/**
	 * @param sessionData
	 */
	private String userName = "";
	private String passwd = "";

	public HomePageWithLogIn(SessionData sessionData) {
		super(sessionData);
		// TODO Auto-generated constructor stub
	}

	/**
	 * go to the destination page
	 */
	public boolean goToPage() {

		webDriver.get(hostName);
		LogIn();
		return true;
	}

	/**
	 * log in after go to the home page
	 */
	public void LogIn() {
		new HomePageWithOutLogIn(sessionData).goToPage();
		clickById("topLogin");
		if (userName.equals("")) {
			setUserName("18100000001");
		}

		if (passwd.equals("")) {
			setPasswd("123456~");
		}
		sendKeys(By.name("sMobile"), userName);
		sendKeys(By.name("sPassword"), passwd);
		//sendKeys(By.name("sCaptcha"), getPicCode("7"));
		screenCapture();
		clickBy(By.className("login_btn"));
		try {
			Thread.sleep(3000);// sleep 3s
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (isCurrentURL(hostName + "/")) {
			logger.info("~~~~~~~~Login to the home page success!!~~~~~~~~~~~~~~~");
		} else {
			logger.info("~~~~~~~~Login to the home page failed!!~~~~~~~~~~~~~~~");
			screenCapture();

		}

	}

	/**
	 * set login user name
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * set login user passwd
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
}
