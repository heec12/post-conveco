from matplotlib import colors
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
    ywaxis = []
    velx = []
    chemical = []
    stress = []
    work_rate = []
    rtime = []
    cont_left = []
    cont_right = []

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
    new_velx = np.zeros(len(velx)-1)
    for i in range(0,len(velx)-1):
        new_velx[i] = (velx[i+1]+velx[i])/2
    velx = new_velx

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
    sum_cont = 0
    sum_else = 0
    sum_margin = 0
    # Normal continent case
    if data[0]<data[1]:
        for i in range(0,data[0]):
            sum_else += stress[i]
        for j in range(data[1],512):
            sum_else += stress[j]
        for k in range(data[0],data[1]):
            sum_cont += stress[k]
        for l in range(data[0]-25,data[0]):
            sum_margin += stress[l]
        for m in range(data[1],data[1]+25):
            sum_margin += stress[m]
        num_cont = data[1]-data[0]
    # Reversed continent case
    elif data[0]>data[1]:
        for i in range(data[1],data[0]):
            sum_else += stress[i]
        for j in range(data[0],512):
            sum_cont += stress[j]
        for k in range(0,data[1]):
            sum_cont += stress[k]
        for l in range(data[1]-25,data[1]):
            sum_margin += stress[l]
        for m in range(data[0],data[0]+25):
            sum_margin += stress[m]
        num_cont = (512-data[0])+data[1]
    num_else = 512-num_cont
    aver_cont = sum_cont/num_cont
    aver_else = sum_else/num_else
    aver_margin = sum_margin/50
        
    return rtime, aver_cont, aver_else, aver_margin

def no_margin_stress(model,N):
    i = '/u'+N
    j = '/t'+N
    k = '/ha'+N

    # Read t, ha files
    ufile = model+i
    tfile = model+j
    hafile = model+k

    # Empty arrays for later purpose
    stress = []
    rtime = []

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
    stress = np.array(stress).astype(float)
    rtime = np.array(rtime).astype(float)

    # Average the stress values of continent
    sum_no_margin = 0
    for i in range(0,512):
        sum_no_margin += stress[i]    
    aver_no_margin = sum_no_margin/512

    return rtime, aver_no_margin

model1 = '/rubin/s1/scratch/hxc5400/model_output/nodam_nodiss_crust080_vis10'
model2 = '/rubin/s1/scratch/hxc5400/model_output/nodam_nodiss_crust085_vis10'
model3 = '/rubin/s1/scratch/hxc5400/model_output/nodam_nodiss_crust090_vis10'
model4 = '/rubin/s1/scratch/hxc5400/model_output/nodam_nodiss_crust095_vis10'
model5 = '/rubin/s1/scratch/hxc5400/model_output/nodam_nodiss_crust0975_vis10'
model6 = '/rubin/s1/scratch/hxc5400/model_output/nodam_nodiss_nocrust_vis10'

N = str(("{:0>3d}".format(0)))

thickness = [0.8, 0.85, 0.9, 0.95, 0.975, 0.0]
total_aver_cont = np.zeros(6)
total_aver_else = np.zeros(6)
total_aver_margin = np.zeros(6)

rtime1, total_aver_cont[0], total_aver_else[0], total_aver_margin[0] = margin_ave_stress(model1,N)
rtime2, total_aver_cont[1], total_aver_else[1], total_aver_margin[1] = margin_ave_stress(model2,N)
rtime3, total_aver_cont[2], total_aver_else[2], total_aver_margin[2] = margin_ave_stress(model3,N)
rtime4, total_aver_cont[3], total_aver_else[3], total_aver_margin[3] = margin_ave_stress(model4,N)
rtime5, total_aver_cont[4], total_aver_else[4], total_aver_margin[4] = margin_ave_stress(model5,N)
rtime6, total_aver_no_margin = margin_ave_stress(model6,N)

total_aver_cont[5] = total_aver_no_margin
total_aver_else[5] = total_aver_no_margin
total_aver_margin[5] = total_aver_no_margin

print('Averaged stress @ margin = ', total_aver_margin)
print('Averaged stress @ else = ', total_aver_else)
print('Averaged stress @ continent = ', total_aver_cont)

plt.plot(thickness,total_aver_margin,color='green',marker='o')
plt.plot(thickness,total_aver_else,color='blue',marker='o')
plt.plot(thickness,total_aver_cont,color='red',marker='o')

plt.savefig('./astress_margin_else_vis10.png')
