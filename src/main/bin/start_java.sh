#!/usr/bin/env bash

# 给普通java项目设计的启动脚本

shell_path=$(cd `dirname $0`; pwd)
# 项目根路径
project_path=`dirname $shell_path`

echo "脚本路径：$shell_path"
echo "项目根路径: $project_path"

# 依赖的jar,后面必须用*
jars_path="$project_path/libs/*"

# 配置文件的路径，只能是conf或者conf/，不能用*，如果想要读取外部文件，则必须放在第一个位置，否则只能读取jar内置的
conf_path="$project_path/conf/"

# 所有拼接完整的path
cpath="$conf_path:$jars:$project_path/easy-package-template-1.0.0.jar:"

# 启动
java -cp $cpath demo.Test
