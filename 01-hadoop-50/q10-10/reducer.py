import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    llave = None
    list=[]
    for line in sys.stdin:
        key,val=line.split("\t")
        val= int(val)

        if (key == llave):
            list=list+[val]
        else:
            if llave is not None:
                list.sort()
                list=",".join([str(i) for i in list])
                sys.stdout.write("{}\t{}\n".format(llave,list))
            llave = key
            list  = [val]
    list.sort()
    list=",".join([str(i) for i in list])
    sys.stdout.write("{}\t{}\n".format(llave,list))