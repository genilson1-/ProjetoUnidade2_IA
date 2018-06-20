# -*- coding: utf-8 -*-
from subprocess import check_output

def getProlog(S1, S2, S3, S4):
    returnProlog = (check_output("swipl -s script_prolog.pl %s %s %s %s" % (S1, S2, S3, S4), shell=True).decode('utf-8'))
    splitProlog = []
    splitProlog = teste = returnProlog.split(',')
    vl = splitProlog[0].split('=')[1]
    vr = splitProlog[1].split('=')[1]
    return (float(vl), float(vr))

if __name__ == '__main__':
    vl, vr = getProlog(0.17, 1, 1, 1)
    print(vr)
