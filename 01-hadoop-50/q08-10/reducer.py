import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
curkey = None
suma = 0
n = 0
promedio = 0

for line in sys.stdin:

        
        key, val = line.split("\t")
        val = float(val)

        if key == curkey:
            suma = suma + val
            n += 1
            promedio = suma / n

        else:

            if curkey is None:
            	 curkey = key
            	 suma = val
            	 n = 1
            	 promedio = suma / n    
            else:
               if curkey is not None:
                  sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,promedio))

                  curkey = key
                  suma = val
                  n = 1
                  promedio = suma / n

sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,promedio))