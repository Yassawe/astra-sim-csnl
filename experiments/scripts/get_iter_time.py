import pandas as pd
import numpy as np

if __name__=='__main__':
    df = pd.read_csv("../results/backend_end_to_end.csv")
    comps = df['ComputeTime'].astype(float).to_numpy()
    expcomms = df['ExposedCommsTime'].astype(float).to_numpy()
    totals = comps + expcomms
    totals = totals/5

    f = open("../output/output.txt", "a")

    for t in totals:
        f.write(str(t)+"\t")
    f.write('\n')

    f.close()