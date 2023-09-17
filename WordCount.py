from pyspark import SparkConf, SparkContext
import collections
import os

conf = SparkConf().setMaster("local").setAppName("WordCount")
sc = SparkContext(conf=conf)

for file in os.listdir("/data"):
    if not file.endswith(".txt"):
        continue

    lines = sc.textFile("/data/" + file, use_unicode=False)
    words = lines.flatMap(lambda x: x.split())
    wordCounts = words.countByValue()
    sortedWordCounts = collections.OrderedDict(sorted(wordCounts.items()))

    with open("/data/" + file + ".csv", "w") as f:
        for word, count in sortedWordCounts.items():
            f.write("%s,%i\n" % (word, count))

sc.stop()
