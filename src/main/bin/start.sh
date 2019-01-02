#!/usr/bin/env bash

shell_path=$(cd `dirname $0`; pwd)
project_path=`dirname $shell_path`

echo "脚本路径：$shell_path"
echo "项目根路径: $project_path"


jars="${project_path}/libs/*"

cpath="${jars}:${project_path}/conf:"
java -cp $cpath start.App