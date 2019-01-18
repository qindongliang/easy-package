#!/usr/bin/env bash

# 使用maven+scala混搭开发的实时的spark_streaming项目设计的启动脚本

shell_path=$(cd `dirname $0`; pwd)
# 项目根路径
project_path=`dirname $shell_path`

#项目依赖的jar，只需要在部署机器上有一份即可，启动时会把所有的jar分发到executor上
jars=`echo $project_path/libs/*jar | sed 's/ /,/g'`

#项目依赖的外部jar，需要提前在每台spark机器上，同样的目录都得分发一份，为了一些在driver端初始化的变量使用做准备
spark_jars_home="/spark/bigdata/jars/"

spark_jars=$spark_jars_home/guava-16.0.jar:$spark_jars_home/kafka-log4j-appender-0.9.0.0.jar:$spark_jars_home/log-to-json-1.0.1.jar:$spark_jars_home/kafka_2.11-0.8.2.1.jar:$spark_jars_home/kafka-clients-0.8.2.1.jar:$spark_jars_home/fastjson-1.2.15.jar

#启动命令 使用spark on yarn 的 cluster模式
nohup /spark/bin/spark-submit    --class  demo.SparkStreaming  --master yarn  --deploy-mode cluster \
 --files $project_path/log4j.properties \
 --executor-cores 6    --driver-memory 1g --executor-memory 1g  --num-executors 10     --jars  $jars  \
 --conf "spark.driver.extraJavaOptions=-XX:PermSize=1024M   -XX:MaxPermSize=2048M -Dlog4j.configuration=log4j.properties" \
 --driver-class-path $spark_jars \
 --driver-library-path $spark_jars \
 --conf spark.executor.extraClassPath=$spark_jars \
 --conf spark.executor.extraLibraryPath=$spark_jars \
 --conf spark.yarn.maxAppAttempts=1 \
  --name "App SparkStreaming Task" \
  $project_path/easy-package-template*.jar $1 $2 $3  &> kp.log &




