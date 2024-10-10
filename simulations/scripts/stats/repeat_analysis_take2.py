import sys
import math

def build_list(gff, seq_len):
    # P = 1. N = 0.

    list = [0] * seq_len

    with open(gff, 'r') as gff_fh:
        for line in gff_fh:
            elem = line.rstrip().split("\t")
            start = int(elem[3])
            end  = int(elem[4])

            for i in range(start - 1, end):
                list[i] = 1

    return list


def main():
    ref_gff = sys.argv[1]
    test_gff = sys.argv[2]
    seq_len = int(sys.argv[3])

    ref_list = build_list(ref_gff, seq_len)
    test_list = build_list(test_gff, seq_len)

    TP = 0
    FP = 0
    FN = 0
    TN = 0

    for i in range(0, seq_len):
        # TP
        if ref_list[i] == 1 and test_list[i] == 1:
            TP += 1
        
        # FP
        elif ref_list[i] == 0 and test_list[i] == 1:
            FP += 1

        # FN
        elif ref_list[i] == 1 and test_list[i] == 0:
            FN += 1
        
        # TN
        else:
            TN += 1
    
    print("TP:" + str(TP))

    print("FP:" + str(FP))

    print("FN:" + str(FN))

    print("TN:" + str(TN))

    print() # print new line

    mcc = (TP * TN - FP * FN) / math.sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)) if (TP + FP) * (TP + FN) * (TN + FP) * (TN + FN) > 0 else 0

    print("MCC:" + str(mcc))

    print() # print new line

    sens = TP / (TP + FN)
    
    spec = TN / (FP + TN)
    
    accu = (TP + TN) / (TP + TN + FP + FN)

    prec = TP / (TP + FP)

    fdr = 1 - prec

    f1 = (2 * TP) / ((2 * TP) + FP + FN)

    print("Sensitivity:" + str(sens))

    print("Specificity:" + str(spec))

    print("Accuracy:" + str(accu))

    print("Precision:" + str(prec))

    print("FDR:" + str(fdr))

    print("F1 score:" + str(f1))

if __name__ == "__main__":
    main()
