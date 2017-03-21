#!/bin/bash
#随机生成区域,时间,性别等测试数据;
regions=(北京市 广东省 山东省 江苏省 河南省 上海市 河北省 浙江省 香港特别行政区 陕西省 湖南省 重庆市 福建省 天津市 云南省 四川省 广西壮族自治区 安徽省 海南省 江西省 湖北省 山西省 辽宁省 台湾省 黑龙江 内蒙古自治区 澳门特别行政区 贵州省 甘肃省 青海省 新疆维吾尔自治区 西藏区 吉林省 宁夏回族自治区)
genders=(male female)
sig=(+ -)

index_title='{"index":{"_index":"flume-in-out-detail","_type":"flumetype"}}'
i=0
while [ $i -ne 10000 ]
do
    pos_region=$(($RANDOM%34))
    pos_gender=$(($RANDOM%2))
    pos_sig=$(($RANDOM%2))
    secs=$(($RANDOM*3+$RANDOM))
    rand_age=$(($RANDOM%100+1))
    rand_date=`date +"%Y-%m-%d %H:%M:%S" -d "${sig[$pos_sig]}$secs seconds"`
    index_data="""{\"snc_visitor_region\":\"${regions[$pos_region]}\",\"snc_visitor_gender\":\"${genders[$pos_gender]}\",\"ina_visitor_age\":$rand_age,\"tfp_intime\":\"$rand_date\"}"""
    echo $index_title >> data.json
    echo $index_data >> data.json 
#    echo $index_data 
  let i++
done
