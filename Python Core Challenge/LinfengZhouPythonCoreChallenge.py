import pandas as pd 
import matplotlib.pyplot as plt 
from datetime import datetime
import numpy as np
# os.chdir("E:\Github Data\NYU-UCSL-2015\Python Core Challenge")

def tripMeans(datasets):
    trip = datasets['tripduration']
    means = trip.mean()
    print "The average trip duration is: ", means
    
def genderCount(datasets):
    gender = datasets['gender']
    counts = gender.value_counts()
    counts.index = ['Male','Female','Unknow']
    counts.plot(kind='bar',color='m',alpha=0.7)  


def usertypeCount(datasets):
    usertype = datasets['usertype']
    counts = usertype.value_counts()
    color = ['purple','lightskyblue']
    explode = [0,0.15]
    autopct='%1.1f%%'
    plt.pie(counts,labels=counts.index,explode=explode,colors=color, autopct=autopct,startangle=0,shadow=True)

    
def transTime(starttime):
    return datetime.strptime(starttime,"%Y-%m-%d %H:%M:%S")

def calcuTime(datasets):
    a = []
    for item in datasets['starttime']:
        a.append(transTime(item).hour)
    a = pd.Series(a)
    return a

def hourCount(datasets):
    N= 24
    ind = np.arange(N)
    hours = calcuTime(datasets)
    crosscounts = pd.crosstab(hours,datasets['gender'])
    Unknow = crosscounts[0]
    Male = crosscounts[1]
    Female = crosscounts[2]
   #  Max = []
   # for i in range(N):
   #     Max.append(max(Unknow[i],Male[i],Female[i]))
   # Max = pd.Series(Max)
    Sum = Unknow + Male +Female
    mean4 = []
    i = 0
    while i < 24:
        mean4.append(Sum[i:i+4].mean())
        i = i + 4
    mean4 = pd.Series(mean4)
    width = 0.8    
    plt.bar(ind,Unknow, width, color='#9999FF',label='Unknow',alpha=0.7)
    plt.bar(ind,Female,width,color='#9966CC',bottom=Unknow,label='Female',)
    plt.bar(ind, Male, width, color='#660066',
             bottom=Female+Unknow,label='Male')  
    inm = np.array([0,4,8,12,16,20])
    widthm = 0.35 * 11+0.1
    colorm = ['#D3D3D3','#808000','#FFFFE0','#FF8C00','#CD5C5C','#191970']
    plt.bar(inm,mean4,widthm,color=colorm,alpha = 0.6)  
    plt.plot(ind+0.3,Sum,linestyle='--',color='g')     
    plt.legend(loc='best')
    plt.xlim(0,24)

    
def visualization():
    data = pd.read_csv("2014-07 - Citi Bike trip data.csv")
    ## creat new Figure 
    fig = plt.figure(figsize=(15,10))


            
    ax2 = fig.add_subplot(2,2,3)
    ax2.set_ylabel('Number of People')
    ax2.set_title("Rides by Men, Women and Unknow")
    
    genderCount(data)
    
    ax3 = fig.add_subplot(2,2,4)
    ax3.set_ylabel('Number of Users')
    ax3.set_title("Subscriber vs Customer")
    usertypeCount(data)
        
    ax1 = fig.add_subplot(2,1,1)
    ax1.grid(color='grey', linestyle='--', linewidth=1, alpha=0.2)
    ax1.set_xlabel('Hour of the Day')    
    ax1.set_ylabel('Number of People')
    ax1.set_title("Peak Hour for July 2014")
    ax1.set_xticks(np.arange(24))
    ax1.set_xticklabels(np.arange(24),fontsize='small')
    hourCount(data)
    plt.show()
    
    