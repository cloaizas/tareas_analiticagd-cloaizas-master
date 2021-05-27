import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:

        ##
        ## genera las tuplas palabra \tabulador 1
        ## ya que es un conteo de palabras
        ##
        for word in line.split(","):
            if word in ("credit_history", "critical","delayed","fully repaid","fully repaid this bank", "repaid"):
                        
                ##
                ## escribe al flujo estandar de salida
                ##
                sys.stdout.write("{}\t1\n".format(word))