# -*- coding: utf-8 -*-
"""
Created on Tue Feb  9 08:55:16 2016

@author: megumi-f
"""

import os
from bs4 import BeautifulSoup
import csv
from collections import Counter
# you may want to try pandas
wordList = []


def popularWords(csvFile, upto):
    with open(csvFile, 'r') as f:
        reader = csv.reader(f)
        header = next(reader)
        for row in reader:
            wordList.extend(row[0].split(" ")) # append vs extend
    counter = Counter(wordList)
    popularWords = counter.most_common(upto)
    return popularWords


csvFile = 'hogehoge.csv'

popularWords = popularWords(csvFile, 50)
