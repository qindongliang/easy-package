#!/usr/bin/env bash

#给普通maven+scala混搭的项目设计的启动脚本

shell_path=$(cd `dirname $0`; pwd)
#项目根路径
project_path=`dirname $shell_path`

echo "脚本路径：$shell_path"
echo "项目根路径: $project_path"

#依赖的jar
jars="$project_path/libs/*"


cpath="$jars:$project_path/conf/*:$project_path/easy-package-template-1.0.0.jar:"

echo $cpath

java -cp $cpath demo.Test
