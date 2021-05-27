import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:

        ##
        ## genera las tuplas palabra \tabulador 1
        ## ya que es un conteo de palabras
        ##
        for wr in line.split("-"):
            if wr in ("01","02","03","04","05","06","07","08","09","10","11","12"):        
                ##
                ## escribe al flujo estandar de salida
                ##
                sys.stdout.write("{}\t1\n".format(wr))