package com.pub.wtd.runcase.util;

import java.io.File;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hekun <158109016@qq.com>  on 2017/3/9.
 */
public class Environment {
    String rootPath = "";
    String sp = System.getProperty("file.separator");
    private static Method addURL = initAddMethod();
    private static URLClassLoader classloader = (URLClassLoader) ClassLoader.getSystemClassLoader();


    public void build() {
        try {
            Class<?> mainClass = classloader.loadClass("com.pub.wtd.common.Main");
            Method startMethod = mainClass.getMethod("start", URLClassLoader.class);
            startMethod.invoke(mainClass.newInstance(), classloader);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setRootPath() {
        File directory = new File("");
        String path = "";
        try {
            path = directory.getAbsolutePath();
        } catch (Exception e) {
            e.printStackTrace();
        }
        rootPath = path;
    }

    public void loadAllJars() {
        File libDir = new File(rootPath + sp + "bin" + sp + "lib");
        List<String> includeJarFiles = new ArrayList<String>();
        includeJarFiles.add("wtd.jar");
        includeJarFiles.add("dom4j-1.6.1.jar");
        includeJarFiles.add("jaxen-1.1.1.jar");
        includeJarFiles.add("log4j-1.2.17.jar");
        includeJarFiles.add("selenium-server-standalone-2.53.0.jar");
        includeJarFiles.add("activation-1.1.1.jar");
        includeJarFiles.add("javax.mail-1.5.6.jar");
        includeJarFiles.add("mysql-connector-java-5.0.5.jar");
        includeJarFiles.add("substance-7.3.jar");
        includeJarFiles.add("trident-1.3.jar");
        includeJarFiles.add("trident-7.3-swing.jar");
        File[] files = libDir.listFiles();
        for (File file : files) {
            if (includeJarFiles.contains(file.getName())) {
                addURL(file);
            }
        }
    }

    private static Method initAddMethod() {
        try {
            Method add = URLClassLoader.class.getDeclaredMethod("addURL", new Class[]{URL.class});
            add.setAccessible(true);
            return add;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static void addURL(File file) {
        try {
            addURL.invoke(classloader, new Object[]{file.toURI().toURL()});
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}