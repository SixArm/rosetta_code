#!/usr/bin/env python
import datetime
f = "%Y-%m-%dT%H:%M:%S.%f000Z" 
t = datetime.datetime.utcnow()
print(t.strftime(f))
