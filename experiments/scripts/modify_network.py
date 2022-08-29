import json
import argparse

def read_modify(num):
    with open("../inputs/network/switch.json", "r") as inp:
        data = json.load(inp)
    
    data["units-count"] = [num]

    with open("../inputs/network/output.json", "w") as out:
        json.dump(data, out)


if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--index", type=int)

    units = [4,8,16,32,64,128,256]

    args = parser.parse_args()

    read_modify(units[args.index])