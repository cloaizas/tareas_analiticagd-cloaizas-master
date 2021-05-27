import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
import sys
#
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

for line in sys.stdin:
    sys.stdout.write("{purpose}\t{amount}\n".format(amount=line.split(",")[4],purpose=line.split(",")[3]))