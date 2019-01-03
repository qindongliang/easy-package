package start

import java.util

import com.alibaba.fastjson.serializer.SerializeFilter
import com.alibaba.fastjson.{JSON, JSONObject}

object App {


  def main(args: Array[String]): Unit = {


    println("ok , it is beautiful.")

    val list=new util.ArrayList[String]()
    list.add("string1")
    list.add("string2")
    list.add("string3")
    println(list.toString)
    println(JSON.toJSONString(list,new Array[SerializeFilter](0)))

  }

}
