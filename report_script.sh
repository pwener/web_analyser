#!/bin/bash

target=final_report.md

echo -n > $target


parts="introduction contexto parser hdfs map_reduce yarn hadoop_install hadoop_simple \
				word_count all_tests simple_word_counter conclusion"


for part in $parts; do
	cat "$part".md >> $target;
done
