#!/usr/bin/python
# --*-- coding:utf-8 --*--


import re
import sys

pat = re.compile('(?P<ip>\d+.\d+.\d+.\d+).*?\d{4}:(?P<hour>\d{2}):\d{2}.*? ')

start = int(sys.argv[1])
end = int(sys.argv[2])

hourList = []

for t in range(start,end):
    if(t in range(0,10)):
        timeS = '0'+str(t)
    else:
        timeS = str(t)
hourList.append(timeS)

if(end in range(0,10)):
    endString = '0'+str(end)
else:
    endString = str(end)

for line in sys.stdin:
    match = pat.search(line)
    if match and match.group('hour') in hourList:
        print '%s\t%s' % ('[' + hourList[0] + ':00-' + endString + ':00]' + match.group('ip'), 1)
