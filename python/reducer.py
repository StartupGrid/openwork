import sys
import json
import regex
import string
from nltk.corpus import stopwords
from nltk.tokenize.regexp import WordPunctTokenizer

def remove_if_punct_or_stopword(w):
	if regex.match(ur"(\p{P}+|[%s]+)" % regex.escape(string.punctuation), w):
		return True
	elif w in stopwords.words():
		return True
	return False

current_key = None
qtokens = None
for line in sys.stdin:
    query, tweet = line.split('\t', 1)
    if current_key != query:
        current_key = query
        qwords = WordPunctTokenizer().tokenize(query)
        qtokens = [w for w in qwords if not remove_if_punct_or_stopword(w)]
    tweet = json.loads(tweet)

    # match query terms into tweet
    matches = 0
    for token in qtokens:
        if token in tweet['parsed']:
            matches += 1

    tweet['tokens'] = qtokens
    tweet['matches'] = matches
    tweet['cxScore'] = float(matches) / len(qtokens)
    print tweet
