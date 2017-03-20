#!/bin/bash
#生成停车场的测试数据;
#存储时间,剩余车位等随机生成;
#生成ES可以批量处理的文件;

parklot=8000
index_title='{"index":{"_index":"flume-park-lot","_type":"flumetype"}}'
i=0
while [ $i -ne 1000 ]
do
  rand_date=`date +"%Y-%m-%d %H:%M:%S" -d "-$RANDOM minutes"`
  rand_parkuesed=$(($RANDOM%$parklot))
  index_data="""{\"inc_parklot\":$parklot,\"inc_parkuesed\":$rand_parkuesed,\"snc_statistic_type\":\"SUMMATION\",\"tfp_sort_time\":\"$rand_date\"}"""
  echo $index_title >> data.json
  echo $index_data >> data.json 
  let i++
done
