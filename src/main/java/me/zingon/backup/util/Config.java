package me.zingon.backup.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by page on 2017/6/12.
 */
public class Config {
    static Properties config=new Properties();
    static {
        try {
//            String path=Config.class.getProtectionDomain().getCodeSource().getLocation().getPath();
//            String pattern = Pattern.quote("/");
//            String[] temp=path.split(pattern);
//            path=path.substring(0,path.length()-temp[temp.length-1].length()-1);
//            System.out.println("path is :"+path);
            String path = Config.class.getResource("/").getPath();
            config.load(new FileInputStream(path+"/config.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String get(String key){
        return config.getProperty(key);
    }
}
