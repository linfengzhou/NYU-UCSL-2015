import numpy as np 

###     Question 1 
def gArray0(x,y):
    gArray = np.empty((x,y))
    for i in range(x):
        for j in range(y):
            gArray[i,j] = i * j
    return gArray.astype(np.int)

###     Question 2 
def sWords(origin):
    listOrigin = origin.split()
    listOrigin.sort()
    i = 0
    while i < len(listOrigin):
        if listOrigin[i+1] == listOrigin[i] :
            listOrigin.pop(i+1)
        i += 1
    sOrigin = ' '.join(listOrigin)
    return sOrigin
    
###     Question 3
def calulWords(origin):
    lcount = 0
    ucount = 0
    for i in origin:
        if i.islower():
            lcount += 1
        elif i.isupper():
            ucount += 1
    print 'UPPER CASE: %d'  % ucount
    print 'LOWER CASE: %d'  % lcount
    