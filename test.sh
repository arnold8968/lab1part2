#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1part2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1part2/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /lab1part2/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /lab1part2/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../mapreduce-test-python/lab1part2/mapper.py -mapper '../../mapreduce-test-python/lab1part2/mapper.py 9 16' \
-file ../../mapreduce-test-python/lab1part2/reducer.py -reducer '../../mapreduce-test-python/lab1part2/reducer.py' \
-input /lab1part2/input/* -output /lab1part2/output/
/usr/local/hadoop/bin/hdfs dfs -cat /lab1part2/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1part2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1part2/output/
../../stop.sh
