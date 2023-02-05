from robot.api.deco import keyword
import os, shutil
from html.parser import HTMLParser


def converterArquivo(file, ext:str):
    split = os.path.splitext(file)
    novo = split[0] + '.' + ext
    os.rename(file,novo)
    return novo

def alterarFile(file):
    arq = open(file, 'r')
    conteudo = arq.readlines()
    conteudo.insert(3,'    <meta charset="UTF-8">\n')
    arq = open(file, 'w')
    arq.writelines(conteudo)
    arq.close()


@keyword("Organizando")
def OrganizeOutputs():
    directory = os.getcwd()
    destination_folder = os.path.join(directory, 'output')
    if not os.path.exists(destination_folder): os.mkdir(destination_folder)
    try:
        for file in os.listdir():
            if file.endswith(".html") or file.endswith(".xml") or file.endswith(".png"):
                # if file.endswith(".html"):
                #     tempTXT = converterArquivo(file, 'txt')
                #     alterarFile(tempTXT)
                #     file = converterArquivo(tempTXT, 'html')
                source = os.path.join(directory, file)
                destination = os.path.join(destination_folder, file)
                shutil.move(source, destination)
    except Exception as e:
        print(e)

OrganizeOutputs()
