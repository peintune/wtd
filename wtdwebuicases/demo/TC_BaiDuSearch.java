/**
 * @Title: TC_BaiDuSearch.java
 * @Package member
 * @Description: Test Case to search
 * @author zhoujing
 * @version V1.0   
 */
package demo;

import com.pub.wtd.common.BaseCase;

/**

import com.pub.wtd.common.BaseCase;

/**
 * @author zhoujing
 * 
 */
public class TC_BaiDuSearch extends BaseCase {
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
		//new HomePagetest(sessionData).goToPage();// 自定义一个页面，所有case都可以共享这个页面,直接在case中打开这个页面。

		webDriver.get("http://www.baidu.com");//利用webdriver执行打开页面

		setDescription("测试百度搜索功能");// 设置case的描述信息
		
		if (isCurrentURL(hostName+"/")|| isCurrentURL(hostName )) {// 判断当前页面是否是百度主页

			setPointResult("GoToHome", "回到首页", "pass", "NULL");//设置此测试点通过
		} else {
			setPointResult("GoToHome", "回到首页", "fail","can not go to home page");//设置此测试点失败
		}


		String path = screenCapture();// 截取当前页面截屏

		testSearch();//测试搜索功能

	}


	public void testSearch(){
		sendKeysById("kw","blog.jpmovie.cn");
		clickById("su");
		if(isTextExist("小木屋 | 免费,自由,开源,实用软件工具")){
			setPointResult("测试搜索","测试搜索功能","pass","NULL");
		}else{
			setPointResult("测试搜索","测试搜索功能","fail","百度搜索测试失败");
			screenCapture();// 截取当前页面截屏
		}

	}
}
