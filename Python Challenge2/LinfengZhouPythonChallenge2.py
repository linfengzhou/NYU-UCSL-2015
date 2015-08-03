# import os
# os.chdir('E:/Github Data/NYU-UCSL-2015/Python Challenge2')
def randomfilesline():
    import random
    import pickle
    import urllib2  
   
    print "This example of this function is from this website:" 
    url ='http://52.25.91.45/misc_files/test.txt'  
    print url
    testdata = urllib2.urlopen(url)  
    
    data = [] 
    a = testdata.readline()
    while a != '': 
        if (a != '\n'):
            data.append(a)
        a = testdata.readline()
        
 

    index = range(len(data))
    newdata = []  
    random.shuffle(index)

    for item in index:
        newdata.append(data[item])

    ## Saving data as Pickle:
    try:
        with open('test_pickle.pkl', 'wb') as f:
            pickle.dump(newdata, f)
    except IOError, e:
                print 'IOError: ',e
    ## Loading Data from Pickle file
    try:
        with open('test_pickle.pkl', 'rb') as f:
            s = pickle.load(f)
    except IOError, e:
            print 'IOError: ',e
    
    print 
    print "The random output is:"
    for line in range(len(s)):
        print s[line]

def csvnumpy():
    
    # http://sharmamohit.com/misc_files/dec-2week-2014.csv 
    
   
    ## loading data
    import pandas as pd
    csvdata = pd.read_csv('dec-2week-2014.csv')
    
   ## Find the number of Male and Female ridership during this 2 week period.
    genderdata = csvdata['gender']
    gender_counts = pd.value_counts(genderdata)
    print "The male ridetrip are:"  ,gender_counts[1]
    print "The femal ridetrip are:" , gender_counts[2]
    
    print "the percentage of Male riders is: ", gender_counts[1] * 100/sum(gender_counts), "%"
    print "the percentage of Female riders is: ", gender_counts[2] * 100/sum(gender_counts), "%" 
   
   ## the output 
   ## The male ridetrip are: 149642
   ## The femal ridetrip are: 37639
   ## the percentage of Male riders is:  77 %
   ## the percentage of Female riders is:  19 %
