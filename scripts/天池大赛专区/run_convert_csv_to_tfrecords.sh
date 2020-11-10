#!/usr/bin/env bash

wget https://atp-modelzoo-sh.oss-cn-shanghai.aliyuncs.com/tutorial/tianchi_benchmark/tianchi_datasets.tgz
tar -zxf tianchi_datasets.tgz
rm *.tgz

for TASK_NAME in TNEWS AFQMC OCEMOTION
do
  echo " task name is $TASK_NAME"
  python convert_csv_to_tfrecords.py --mode preprocess --config config/${TASK_NAME}_preprocess_train.json
  python convert_csv_to_tfrecords.py --mode preprocess --config config/${TASK_NAME}_preprocess_dev.json
done

ls -d $PWD/tianchi_datasets/TNEWS/train.tfrecord > train.list_tfrecord
ls -d $PWD/tianchi_datasets/AFQMC/train.tfrecord >> train.list_tfrecord
ls -d $PWD/tianchi_datasets/OCEMOTION/train.tfrecord >> train.list_tfrecord



