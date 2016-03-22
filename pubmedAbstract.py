# -*- coding: utf-8 -*-
"""
Created on Sat Feb 13 14:55:38 2016

@author: megumi-f
"""

import os
from bs4 import BeautifulSoup
import csv
from collections import Counter
import requests
import nltk

def searchByKeywords(keyWords):
    rootURL = 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?'# pubmed API    
    keywordStrList = keyWords.split(" ") # change keywords. Need to be modified later
    keywordStr = '' # dasai
    for i_str in keywordStrList:
        keywordStr = keywordStr+i_str+'%20'    
    
    db = 'db=pubmed'
    term= 'term='+keywordStr        
    queryURL = rootURL+db+'&'+term
    
    return queryURL

def fetchPMID(queryURL):
    contents = requests.get(queryURL)
    bsText = BeautifulSoup(contents.text, "xml")
    idList = bsText.findAll('Id')
    return idList
    
def fetchAbstract(PMID):
    rootURL = 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?'    
    db = 'db=pubmed&retmode=xml&rettype=abstract'
    pmID = 'id='+PMID
    queryURL = rootURL+db+'&'+pmID
    contents = requests.get(queryURL)
    bsText = BeautifulSoup(contents.text, "xml")
    abstTxt = bsText.find('AbstractText') # need to be modified
    return abstTxt.string
        
# kokokara main    
if __name__ == "__main__":   
    APIURL = searchByKeywords('Megumi Fukuda')
    pmidList = fetchPMID(APIURL)
    text = []
    for idx in pmidList:
        abst = fetchAbstract(idx.string)
        text.extend(abst.split(" "))
        
    tagged = nltk.pos_tag(text)
    counter.most_common(30)

'''
    file = 'hoge.txt'
    f = open(file, 'w')    
    f.writelines(text)
    f.close()
    
    # mouichido open        
    f = open(file)
    reader = f.readlines
'''    
    wordList = []
    for row in text[0].join:
            wordList.extend(row.split(" "))
        
    