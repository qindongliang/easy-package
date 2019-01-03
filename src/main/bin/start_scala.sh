#!/usr/bin/env bash

#给普通maven+scala混搭的项目设计的启动脚本

shell_path=$(cd `dirname $0`; pwd)
#项目根路径
project_path=`dirname $shell_path`
#scala的依赖，单独纯scala项目需要
scala_path="$SCALA_HOME/lib/*"
echo "脚径：$shell_path"
echo "项目根路径: $project_path"
#依赖的jar
jars="$project_path/libs/*"

echo "jar的："$jars

cpath="$jars:$project_path/conf/*:$project_path/easy-package-template-1.0.0.jar:$scala_path"

echo $cpath

java -cp $cpath start.App
