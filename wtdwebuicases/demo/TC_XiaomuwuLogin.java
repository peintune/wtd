package demo; /**
 * @Title: TC_XiaomuwuLogin.java
 * @Package member
 * @Description: Test Case to xiaomuwu snappydata.top
 * @author zhoujing
 * @version V1.0   
 */

import com.pub.wtd.common.BaseCase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

/**
 * @author zhoujing
 * 
 */
public class TC_XiaomuwuLogin extends BaseCase {
	/**
	 * 每一个ui自动化case都必须实现execute（）方法，此方法是此case的入口。
	 * 编写case时可以参考以下步骤：
	 * 1，打开首页或者一个链接或者自己定义的一个页面:webDriver.get(String),new HomePagetest(sessionData).goToPage(),
	 * 2，设置这个case的描述信息:setDescription(String)
	 * 3，执行某些操作。
	 * 4，检查预期值或者页面元素并设置这个测试点测试通过或者测试失败:setPointResult("", "", "pass", "NULL");
	 * 5，有必要时可以截取当前页面的截屏:screenCapture()
	 *
	 * 对于第三步，目前支持以下操作。
	 * 1，查找页面元素：findElement(By),findElementById(String),findElements(By).
	 * 2，查找元素的值（也就是元素的value）,findElvalue(By)
	 * 3，点击页面元素：clickBy(By),clickById(String),clickByLinkText(String)
	 * 4，判断页面元素是否存在：isExist(By)
	 * 5，判断文本是否存在:isTextExist(String)
	 * 6，向诸如文本框之类的控件输入值：sendKeysBy(By,String),sendKeysById(By,String)
	 * 7，所有webdriver支持的操作。
	 *
	 * 更多更新信息请到 blog.jpmovie.cn
	 */
	public void execute() {

		webDriver.get("http://blog.jpmovie.cn");//利用webdriver执行打开页面

		setDescription("测试小木屋登录功能");// 设置case的描述信息

		testLogin();//测试登录功能

	}


	public void testLogin(){
		WebElement newsEl = findElementById("menu-item-103");
		newsEl.findElement(By.tagName("a")).click();

		WebElement loginEl = findElement(By.linkText("登录"));
		loginEl.click();

		sendKeysById("user_login","wroingusername");
		sendKeysById("user_pass","wrongpassword");

		clickById("wp-submit");//点击登录按钮

		if(isTextExist("无效用户名")){
			setPointResult("测试搜索","测试搜索功能","pass","NULL");
		}else{
			setPointResult("测试搜索","测试搜索功能","fail","百度搜索测试失败");
			screenCapture();// 截取当前页面截屏
		}

	}
}
