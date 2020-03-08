#!/bin/bash
# ====================================================
#   Copyright (C)2020 All rights reserved.
#
#   Author        : fankaljead
#   Email         : fankaljead@gmail.com
#   File Name     : setup.sh
#   Last Modified : 2020-03-07 17:23
#   Describe      :
# 部署到 github pages 脚本
# 错误时终止脚本
# ====================================================
#set -e


# 打包。even 是主题
#hugo -t even # if using a theme, replace with `hugo -t <YOURTHEME>`
hugo --theme=aether --baseUrl="https://fankaljead.github.io/"


# 进入打包文件夹
cd public

# Add changes to git.

git add .

# Commit changes.
msg="building site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# 推送到githu
# nusr.github.io 只能使用 master分支
#git push -f git@github.com:fankaljead/fankaljead.github.io.git
git push

# 回到原文件夹
cd ..
