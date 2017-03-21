#!/bin/bash
#生成停车场的测试数据;
#存储时间,剩余车位等随机生成;
#生成ES可以批量处理的文件;

index_title='{"index":{"_index":"flume-ticket-sale-detail","_type":"flumetype"}}'
channel="001 002 003 004 005 006 007 008 009"
i=0
while [ $i -ne 1000 ]
do
  for cn in $channel
  do
   echo $cn
   rand_secs=$(($RANDOM*3))
   rand_date=`date +"%Y-%m-%d %H:%M:%S" -d "+$rand_secs seconds"`
   rand_num=$(($RANDOM%1000))
   index_data="""{\"snc_tickettypeno\":\"$cn\",\"inc_buycardno\":$rand_num,\"tfp_sort_time\":\"$rand_date\"}"""
   echo $index_title >> data.json
   echo $index_data >> data.json 
  done

    let i++
done
