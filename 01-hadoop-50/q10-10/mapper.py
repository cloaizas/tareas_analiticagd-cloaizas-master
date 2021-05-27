import sys
#
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

for line in sys.stdin:
    valor=line.split("\t")[0].strip()
    letras=line.split("\t")[1].strip()
    for l in letras.split(","):
        sys.stdout.write("{letra}\t{valor}\n".format(valor=valor,letra=l))        