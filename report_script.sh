#!/bin/bash

target=final_report.md

echo -n > $target

#parts="introduction hdfs map_reduce yarn hadoop_install hadoop_simple \
#			parser word_count hadoop_stress_test hadoop_stress_test_2 simple_word_counter conclusion"

parts="introduction contexto parser hdfs map_reduce yarn hadoop_install hadoop_simple \
		 	word_count all_tests simple_word_counter conclusion opiniao_pessoal"


for part in $parts; do
	cat "$part".md >> $target;
done
