import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

for row in sys.stdin:
      
  letra= row.strip().split('   ')[0]
  valor= row.strip().split('   ')[2]
  valor= float(valor)

  sys.stdout.write("{}\t{}\n".format(letra,valor))