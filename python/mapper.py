#!/usr/bin/env python2.7

import sys
import json
import regex
import string
from nltk.corpus import stopwords
from nltk.tokenize.regexp import WordPunctTokenizer

queries = [
'healthcare',
'obamacare',
'insurance',
'nsa',
'spying',
'olivia wilde pregnant',
'halloween costume',
'costume',
'tallest dog',
'lohan dating rumor',
'ncaa playoff committee',
'oreos addictive',
'diet coke artificial sweeteners',
'maria kang',
'france scientology fraud',
'boy i love me some python'
]
qtokens = {}

def remove_if_punct_or_stopword(w):
	if regex.match(ur"(\p{P}+|[%s]+)" % regex.escape(string.punctuation), w):
		return True
	elif w in stopwords.words():
		return True
	return False

for q in queries:
    qwords = WordPunctTokenizer().tokenize(q)
    qtokens[q] = [w for w in qwords if not remove_if_punct_or_stopword(w)]

for line in sys.stdin:
    tweet = json.loads(line)

    # nullify mentions
    tweet['parsed'] = tweet['text']
    for mention in tweet['userMentionEntities']:
        tweet['parsed'] = tweet['parsed'].replace(mention['screenName'], '')

    # map key on 1st query term match
    for qry in qtokens:
        for qword in qtokens[qry]:
            #if regex.match(ur".*%s.*" % qword, tweet['text']):
            if qword in tweet['parsed']:
                out = {
                    'id': tweet['id'],
                    'text': tweet['text'],
                    'parsed': tweet['parsed'].replace("\n", ' '),
                    'qlScore': tweet['qlScore']
                }
                print qry + "\t" + json.dumps(out)
                break
