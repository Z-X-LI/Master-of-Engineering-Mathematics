import numpy as np
import matplotlib.pyplot as plt
Matrix =np.zeros((3,3))
a=np.zeros(3) 
d=np.zeros(3)
axisx=[0,5,10,15,20,25,30,35,40,45,50,55] 
axisy=[0,1.27,2.16,2.86,3.44,3.87,4.15,4.37,4.51,4.58,4.02,4.64]
for i in range(3):
    for j in range(3):
        for n in range(len(axisx)):
            Matrix[i,j]+= (axisx[n]**(i+1))*(axisx[n]**(j+1)) 
for i in range(3):
    for n in range(len(axisx)):
        d[i]+= (axisx[n]**(i+1))*(axisy[n]) 
a=np.linalg.inv(Matrix)@d
x=axisx
 
err=np.zeros(len(axisx)) 
y=np.zeros(len(axisx))
print(a)
for i in range (len(axisx)): 
    # y[i]=a[0]*x[i]+a[1]*x[i]*x[i]+a[2]*x[i]*x[i]*x[i]
    y[i]=a[0]*x[i]*x[i]+a[1]*x[i]*x[i]*x[i]+a[2]*x[i]*x[i]*x[i]*x[i]
    err[i]=axisy[i]-y[i]
plt.plot(x,axisy,color='g',marker='o') 
plt.plot(x,y,color='y',marker='o') 
plt.plot(x,err,color='b',marker='o')
plt.show()
plt.savefig("/home/lzx/MyFile/Lesson/Monday_6/5.jpg")