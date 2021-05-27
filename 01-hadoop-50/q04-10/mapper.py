import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

for row in sys.stdin:
  
  lista= row.strip().split('   ')[0]

  sys.stdout.write("{}\t1\n".format(lista))