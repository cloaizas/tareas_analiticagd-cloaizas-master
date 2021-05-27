import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    llave = None
    for line in sys.stdin:
        key,val=line.split("\t")
        val= float(val)

        if (key == llave):
            if val>maximo :
                maximo=val
            elif val<minimo:
                minimo=val
        else:
            if llave is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(llave, maximo,minimo))
            llave = key
            minimo = val
            maximo = val
    sys.stdout.write("{}\t{}\t{}\n".format(llave,maximo,minimo))
