import sys
#
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

for line in sys.stdin:
    letra=line.split("   ")[0].strip()
    valor=line.split("   ")[2].strip()
    sys.stdout.write("{letra}\t{valor}\n".format(letra=letra,valor=valor))