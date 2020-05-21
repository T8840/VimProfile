#!/bin/bash
# 判断当前目录下有没有vimrc，存在的话先进行备份，再进行删除
# 接着copy .vimrc文件到当前目录，并重名为vimrc
# 再然后执行git命令，git commit与git push相关命令
# .gitignore中去掉.back文件
work_dir=$(cd $(dirname $0); pwd)
work_path='/vimrc'
work_path=$work_dir$work_path 
if [ ! -f $work_path ];then
	cp ~/.vimrc $work_path
	echo "不存在文件"
else
	# 按时间备份原文件
	rm -rf $work_path
	cp ~/.vimrc $work_path
	echo "存在文件已删除"
fi
# git上传
cd $work_dir
git add .
git commit -m "add"
git push 
