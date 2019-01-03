package demo;

import com.alibaba.fastjson.JSON;
import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

public class Test {
    static Logger logger = Logger.getLogger(Test.class);
    public static void main(String[] args) {

      Config cf=  ConfigFactory.load("conf.properties");

        logger.info(" java-appId:  "+cf.getString("appId"));
        logger.warn(" this is a warn message.");


        List<String> list=new ArrayList<>();
        list.add("1");
        list.add("2");
        list.add("3");

        System.out.println(JSON.toJSONString(list));




    }

}
