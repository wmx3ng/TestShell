#!/bin/bash
# 遍历文件,关闭索引
# 每行一条索引名称
while read line
do
  echo $line
  curl -XPOST hadoop1:19200/$line/_close?pretty
done < hotnews
