import numpy as np
import sys
import matplotlib
matplotlib.use('Agg') # Must be before importing matplotlib.pyplot or pylab!
import matplotlib.pyplot as plt

def margin_ave_stress(model,N):
    i = '/u'+N
    j = '/w'+N
    k = '/t'+N
    l = '/f'+N
    m = '/ha'+N

    # Read f, u, w, t, ha files
    ufile = model+i
    wfile = model+j
    tfile = model+k
    ffile = model+l
    hafile = model+m

    # Empty arrays for later purpose
    xaxis = []
    velx = []
    chemical = []
    stress = []
    rtime = []
    del_velx = []

    data = []

    #x = np.linspace(0,512,num=513)
    #xx = np.linspace(1,512,num=512)

    # From u files, read u from top nodes
    with open(ufile) as fp:
        line = fp.readline()
        while line:
            sline = line.split()
            #x = sline[0]
            y = sline[1]
            y = float(y)
            u = sline[2]
            if y > 0.99 and y < 1.0:
                #print(sline)
                velx.append(u)
            line = fp.readline()

    # From w files, read chemical info from top nodes
    with open(wfile) as fp:
        line = fp.readline()
        while line:
            sline = line.split()
            y = sline[1]
            y = float(y)
            chem = sline[3]
            if y > 0.99 and y < 1.0:
                #print(sline)
                chemical.append(chem)
            line = fp.readline()

    # From t files, read stress values from top nodes
    with open(tfile) as fp:
        line = fp.readline()
        while line:
            sline = line.split()
            x = sline[0]
            y = sline[1]
            y = float(y)
            tau = sline[2]
            tauxx = sline[3]
            # Only interested in surface nodes
            if y > 0.99:
                xaxis.append(x)
                stress.append(tau)
                #stress.append(tauxx) # uncomment when tauxx is needed
            line = fp.readline()

    # From ha files, read a real time of each output
    with open(hafile) as fp:
        line = fp.readline()
        while line:
            sline = line.split()
            time = sline[0]
            line = fp.readline()
    rtime = time

    # Convert character arrays to float arrays for calculation # 
    xaxis = np.array(xaxis).astype(float)
    velx = np.array(velx).astype(float)
    chemical  = np.array(chemical).astype(float)
    stress = np.array(stress).astype(float)
    rtime = np.array(rtime).astype(float)

    # Interpolate velx array so that every array have the length of 512 #
    #new_velx = np.zeros(len(velx)-1)
    #for i in range(0,len(velx)-1):
    #    new_velx[i] = (velx[i+1]+velx[i])/2
    #velx = new_velx

    # Calculate du/dx
    for i in range(0,len(velx)):
        dvelx = velx[i]-velx[i-1]
        del_velx.append(dvelx)
        #if dvelx<=0.0:
        #    print(i)
    del_velx  = np.array(del_velx).astype(np.float)

    chemical_=[]
    # If chemical gradients greater than 0, consider it as a continenetal margin
    # Left margin
    for i in range (len(chemical)):
        if chemical[i] - chemical[i-1] > 0.0 or chemical[i] - chemical[i-1] < -0.0:
            #print('Left margin, chemical = ',chemical[i],' xaxis = ',xaxis[i],i)
            if chemical[i] == 1.0:
                #data.append(xaxis[i])
                chemical_.append(i)
    if len(chemical_) < 0:
        data.append(0)
    elif len(chemical_) == 1:
        data.append(chemical_[0])
    elif len(chemical_) > 1:
        data.append(chemical_[len(chemical_)-1])
    #print(data)
    chemical_ = []

    #print(data) 
    # Right margin
    for i in range (len(chemical)):
        if chemical[i] - chemical[i-1] > 0.0 or chemical[i] - chemical[i-1] < -0.0:
            #print('Right margin, chemical = ',chemical[i],' xaxis = ',xaxis[i],i)
            if chemical[i-1] == 1.0:
                #data.append(xaxis[i])
                #data.append(i)
                chemical_.append(i)
    #print(chemical_)
    if len(chemical_) < 1:
        data.append(0)
    elif len(chemical_) == 1:
        data.append(chemical_[0])
        #print(len(chemical_))
    elif len(chemical_) > 1:
        data.append(chemical_[len(chemical_)-1])
        #print(len(chemical_))
    #print(data)
    chemical_ = []

    # Average the stress values of continent
    #sum_cont = 0
    sum_else = 0
    num_else = []
    # Normal continent case
    if data[0]<data[1]:
        for i in range(0,data[0]):
            if del_velx[i] > 0:
                num_else.append(0)
                sum_else += stress[i]
        for j in range(data[1],512):
            if del_velx[j] > 0:
                num_else.append(0)
                sum_else += stress[j]
        #for k in range(data[0],data[1]):
        #    sum_cont += stress[k]
        #num_cont = data[1]-data[0]
    # Reversed continent case
    elif data[0]>data[1]:
        for i in range(data[1],data[0]):
            if del_velx[i] > 0:
                num_else.append(0)
                sum_else += stress[i]
        #for j in range(data[0],512):
        #    sum_cont += stress[j]
        #for k in range(0,data[1]):
        #    sum_cont += stress[k]
        #num_cont = (512-data[0])+data[1]
    
    aver_else = sum_else/len(num_else)
    # Don't consider the empty timesteps
    #if len(num_else)>0:
    #    aver_else = sum_else/len(num_else)
    #else:
    #    aver_else = 0
        
    return rtime, aver_else

model1 = '/rubin/s1/scratch/hxc5400/model_output/dam1_diss_1.4_new_icmobR_crust080_vis100'
model2 = '/rubin/s1/scratch/hxc5400/model_output/dam1_diss_1.4_new_icmobR_crust080_vis100_2'
model3 = '/rubin/s1/scratch/hxc5400/model_output/dam1_diss_1.4_new_icmobR_crust080_vis100_3'
model4 = '/rubin/s1/scratch/hxc5400/model_output/dam1_diss_1.4_new_icmobR_crust080_vis100_4'
#model5 = '/rubin/s1/scratch/hxc5400/model_output/dam1_diss_1.4_new_icmobR_crust0975_vis100_5'

m1 = 342
m2 = 221
m3 = 57
m4 = 87
#m5 = 153

total_time = []
Ttotal_tau = []

for i in range (m1):
    N1 = str(("{:0>3d}".format(i)))
    rtime1, aver_tau1 = margin_ave_stress(model1,N1)
    total_time.append(rtime1)
    Ttotal_tau.append(aver_tau1)
    #print(i)
    #if aver_tau1 == 0:
    #    pass
    #else:
    #    total_time.append(rtime1)
    #    Ttotal_tau.append(aver_tau1)

for i in range (m2):
    N2 = str(("{:0>3d}".format(i)))
    rtime2, aver_tau2 = margin_ave_stress(model2,N2)
    total_time.append(rtime1+rtime2)
    Ttotal_tau.append(aver_tau2)
    #if aver_tau2 == 0:
    #    pass
    #else:
    #    total_time.append(rtime1+rtime2)
    #    Ttotal_tau.append(aver_tau2)

for i in range (m3):
    N3 = str(("{:0>3d}".format(i)))
    rtime3, aver_tau3 = margin_ave_stress(model3,N3)
    total_time.append(rtime1+rtime2+rtime3)
    Ttotal_tau.append(aver_tau3)
    #if aver_tau3 == 0:
    #    pass
    #else:
    #    total_time.append(rtime1+rtime2+rtime3)
    #    Ttotal_tau.append(aver_tau3)

for i in range (m4):
    N4 = str(("{:0>3d}".format(i)))
    rtime4, aver_tau4 = margin_ave_stress(model4,N4)
    total_time.append(rtime1+rtime2+rtime3+rtime4)
    Ttotal_tau.append(aver_tau4)
    #if aver_tau4 == 0:
    #    pass
    #else:
    #    total_time.append(rtime1+rtime2+rtime3+rtime4)
    #    Ttotal_tau.append(aver_tau4)

#for i in range (m5):
#    N5 = str(("{:0>3d}".format(i)))
#    rtime5, aver_tau5 = margin_ave_stress(model5,N5)
#    total_time.append(rtime1+rtime2+rtime3+rtime4+rtime5)
#    Ttotal_tau.append(aver_tau5)
    #if aver_tau5 == 0:
    #    pass
    #else:
    #    total_time.append(rtime1+rtime2+rtime3+rtime4+rtime5)
    #    Ttotal_tau.append(aver_tau5)

total_time=np.array(total_time).astype(float)
Ttotal_tau=np.array(Ttotal_tau).astype(float)

#std deviation
stddvtn = np.std(Ttotal_tau)

# Time-averaging
sum_Ttotal_tau = 0
for i in range(0,len(Ttotal_tau)-1):
    sum_Ttotal_tau = sum_Ttotal_tau + (Ttotal_tau[i]
    +Ttotal_tau[i+1])*(total_time[i+1]-total_time[i])*0.5
Tave_tau = sum_Ttotal_tau/(total_time[-1]-total_time[0])

print('Time averaged & spatial averaged tau = ', Tave_tau)
print('Standard deviation = ',stddvtn)