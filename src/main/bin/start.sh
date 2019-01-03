#!/usr/bin/env bash

shell_path=$(cd `dirname $0`; pwd)
project_path=`dirname $shell_path`
scala_path="$SCALA_HOME/lib/*"
echo "脚径：$shell_path"
echo "项目根路径: $project_path"


jars="$project_path/libs/"

echo "jar的："$jars

cpath="$jars:$project_path/conf/:$project_path/easy-package-template-1.0.0.jar:$scala_path"

echo $cpath

java -cp $cpath start.App
