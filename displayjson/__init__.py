#!/usr/bin/python

import json
#j = json.loads('{"one" : "1", "two" : "2", "three" : "3"}')
#print j['two']


def intro():
    print ("###################")
    print ("##   HELLO       ##")
    print ("###################")

    myjson = json.loads(open('files/test.json').read())
    print ("my name is " + myjson['lastname'] + ", " + myjson['firstname'] + " " + myjson['lastname'])
    return;
