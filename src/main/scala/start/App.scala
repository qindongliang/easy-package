package start

import java.util

import com.alibaba.fastjson.JSON
import com.alibaba.fastjson.serializer.SerializeFilter
import com.typesafe.config.ConfigFactory
import org.apache.log4j.Logger

object App {

  val conf=ConfigFactory.load("conf.properties")
   val logger = Logger.getLogger(classOf[App])
  def main(args: Array[String]): Unit = {


    logger.info(s" appId: ${conf.getString("appId")} ")
    logger.warn(" this is a warn message.")

    val list=new util.ArrayList[String]()
    list.add("string1")
    list.add("string2")
    list.add("string3")
    println(JSON.toJSONString(list,new Array[SerializeFilter](0)))

  }

}
