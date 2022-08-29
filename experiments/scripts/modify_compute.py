import pandas as pd
import numpy as np
import argparse


IN_PATH = "../inputs/workload/vgg16.txt"
OUT_PATH = "../inputs/workload/out_"

def convert_to_df():

    cols = ['name', 'reserved', 'forward_compute', 'forward_comm_type', 'forward_comm_size', 'i_grad_compute', 'i_grad_comm_type', 'i_grad_comm_size', 'w_grad_compute', 'w_grad_comm_type', 'w_grad_comm_size', 'delay']
    df = pd.DataFrame(columns=cols)
    f = open(IN_PATH, "r")

    global num_layers 
    num_layers = f.readline().rstrip('\n')
    
    count = 0
    while True:
        line = f.readline()
        if not line:
            break

        line = line.rstrip('\n')
        tokens = line.split()

        df.loc[count] = tokens

        count+=1
    
    f.close()
    return df
    

def scale_compute(df, scale):
    df['forward_compute'] = pd.to_numeric(df['forward_compute'])
    df['i_grad_compute'] = pd.to_numeric(df['i_grad_compute'])
    df['w_grad_compute'] = pd.to_numeric(df['w_grad_compute'])

    df['forward_compute'] = df['forward_compute'].apply(lambda x: int(x*scale))
    df['i_grad_compute'] = df['i_grad_compute'].apply(lambda x: int(x*scale))
    df['w_grad_compute'] = df['w_grad_compute'].apply(lambda x: int(x*scale))

def create_output(df):
    types = ["DATA", "DATA_FORWARD_OVERLAP", "DATA_NO_OVERLAP"]
    for t in types:
        filename = OUT_PATH + t + ".txt"
        f = open(filename, "w")
        f.write(t+'\n')
        f.write(num_layers+'\n')
        f.close()
        df.to_csv(filename, header=None, index = None, sep='\t', mode='a')


if __name__=='__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--scaleindex", type=int)

    args = parser.parse_args()

    scales_list = list(np.arange(1, 100, 1))

    scale = scales_list[args.scaleindex]

    df = convert_to_df()
    scale_compute(df, scale)
    create_output(df)