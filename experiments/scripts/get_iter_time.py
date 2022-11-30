import pandas as pd
import numpy as np

NUMPASSES = 20

if __name__=='__main__':
    df = pd.read_csv("../results/backend_end_to_end.csv")
    comps = df['ComputeTime'].astype(float).to_numpy()
    expcomms = df['ExposedCommsTime'].astype(float).to_numpy()
    comms = df['CommsTime'].astype(float).to_numpy()
    #ratio = comps[0]/comms[0]
    totals = comps + expcomms
    totals = np.rint(totals/NUMPASSES)

    f = open("../output/sweepTime/output.txt", "a")
    #f.write(str(ratio) + '\t')
    for t in totals:
        f.write(str(t)+'\t')
    f.write('\n')

    f.close()