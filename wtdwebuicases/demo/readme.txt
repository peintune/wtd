关于网页自动化测试case如何编写：

测试人员可以在wtdwebuicases目录下新建子目录比如（member,pay,login），这些子目录代表case模块。

测试人员可以调用wtd框架的公共方法和selenium webdriver的所有方法来操作页面。

测试人员可以复制TC_BaiDuSearch或者TC_XiaomuwuLogin,然后更改。

在正式测试环境，只需要将TC_xxxx.java 文件复制到wtdwebuicases对应的子目录下，然后在caselist.cfg.xml中增加一行这个case的值。
wtd框架就会在运行case时自动将TC_xxxx.java编译成TC_xxxx.class，然后执行case.不需要测试人员编译打包这些步骤。

具体编写流程如下
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
