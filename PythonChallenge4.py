import pandas as pd 
import matplotlib.pyplot as plt 
from datetime import datetime
import numpy as np
#  os.chdir("/Users/luke/Documents/NYU-UCSL-2015/Python Challenge 4")


def tripmeans(datasets):
    trip = datasets['tripduration']
    means = trip.mean()
    print "The average trip duration is: ", means


def gendercount(datasets):
    gender = datasets['gender']
    counts = gender.value_counts()
    counts.index = ['Male', 'Female', 'Unknow']
    counts.plot(kind='bar', color='m', alpha=0.7)  


def usertypecount(datasets):
    usertype = datasets['usertype']
    counts = usertype.value_counts()
    color = ['purple', 'lightskyblue']
    explode = [0, 0.15]
    autopct = '%1.1f%%'
    plt.pie(counts, labels=counts.index, explode=explode, colors=color, 
            autopct=autopct, startangle=0, shadow=True)

    
def transtime(starttime):
    return datetime.strptime(starttime, "%Y-%m-%d %H:%M:%S")


def calcutime(datasets):
    a = []
    for item in datasets['starttime']:
        a.append(transtime(item).hour)
    a = pd.Series(a)
    return a


def hourcount(datasets):
    n = 24
    ind = np.arange(n)
    hours = calcutime(datasets)
    crosscounts = pd.crosstab(hours, datasets['gender'])
    unknow = crosscounts[0]
    male = crosscounts[1]
    female = crosscounts[2]
    sumf = unknow + male + female
    mean4 = []
    i = 0
    while i < 24:
        mean4.append(sumf[i:i+4].mean())
        i += 4
    mean4 = pd.Series(mean4)
    width = 0.8    
    plt.bar(ind, unknow, width, color='#9999FF', label='Unknow', alpha=0.7)
    plt.bar(ind, female, width, color='#9966CC', bottom=unknow, label='Female')
    plt.bar(ind, male, width, color='#660066',
            bottom=female+unknow, label='Male')
    inm = np.array([0, 4, 8, 12, 16, 20])
    widthm = 0.35 * 11+0.1
    colorm = ['#D3D3D3', '#808000', '#FFFFE0', '#FF8C00', '#CD5C5C', '#191970']
    plt.bar(inm, mean4, widthm, color=colorm, alpha=0.6)
    plt.plot(ind+0.3, sumf, linestyle='--', color='g')
    plt.legend(loc='best')
    plt.xlim(0, 24)

    
def visualization():
    data = pd.read_csv("2014-07 - Citi Bike trip data.csv")
    # create new Figure
    fig = plt.figure(figsize=(15, 10))
    ax2 = fig.add_subplot(2, 2, 3)
    ax2.set_ylabel('Number of People')
    ax2.set_title("Rides by Men, Women and Unknow")
    
    gendercount(data)
    
    ax3 = fig.add_subplot(2, 2, 4)
    ax3.set_ylabel('Number of Users')
    ax3.set_title("Subscriber vs Customer")
    usertypecount(data)
        
    ax1 = fig.add_subplot(2, 1, 1)
    ax1.grid(color='grey', linestyle='--', linewidth=1, alpha=0.2)
    ax1.set_xlabel('Hour of the Day')    
    ax1.set_ylabel('Number of People')
    ax1.set_title("Peak Hour for July 2014")
    ax1.set_xticks(np.arange(24))
    ax1.set_xticklabels(np.arange(24), fontsize='small')
    hourcount(data)
    plt.show()
