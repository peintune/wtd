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
public class HomePageWithOutLogIn extends HomePage {
	/**
	 * @param sessionData
	 */
	public HomePageWithOutLogIn(SessionData sessionData) {
		super(sessionData);
		// TODO Auto-generated constructor stub
	}


	/**
	 * go to the destination page
	 */
	public boolean goToPage(){
		
		webDriver.get(hostName);
		LogOut();
		return true;
	}
	
	/**
	 * log out after go to the home page
	 */
	public void LogOut(){
		if(!isTextExist("登录")){
			if (isExist(By.id("topLogout"))) {
				clickById("topLogout");
			}
		}			
	}	
}
