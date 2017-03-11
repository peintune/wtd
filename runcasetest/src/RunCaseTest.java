import com.pub.wtd.runcase.util.Environment;

/**
 * Created by hekun <158109016@qq.com> on 2017/3/9.
 */
public class RunCaseTest {


    public static void main(String[] args) {

        Environment environment = new Environment();
        environment.setRootPath();
        environment.loadAllJars();
        environment.build();
    }
}

