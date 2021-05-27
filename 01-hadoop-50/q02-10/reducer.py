import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    llave = None
    valor = 0

    for line in sys.stdin:
        key,val=line.split("\t")
        val= int(val)

        if (key == llave):
            if val>valor :
                valor=val
        else:
            if llave is not None:
                sys.stdout.write("{}\t{}\n".format(llave, valor))
            llave = key
            valor = val
    sys.stdout.write("{}\t{}\n".format(llave, valor))
