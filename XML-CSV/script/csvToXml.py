# !/usr/bin/env python3
# coding=utf-8

import re
import unicodedata
import codecs


def strip_accents(text):
    """
    Enlève les accents d'une chaine de caractères
    Retourne la chaine sans accents
    Args : chaine à traiter
    """
    try:
        text = unicode(text, 'utf-8')
    except (TypeError, NameError):
        pass
    text = unicodedata.normalize('NFD', text)
    text = text.encode('ascii', 'ignore')
    text = text.decode("utf-8")
    return str(text)


def normalize(string):
    """
    Normalise une chaine de caractères selon les entités XML
    Retourne la chaine normalisée
    Args : chaine à traiter
    """
    string = string.replace("<", "&lt;")
    string = string.replace(">", "&gt;")
    string = string.replace("&", "&amp;")
    string = string.replace("\"", "&quot;")
    string = string.replace("\'", "&apos;")
    return string


def concatenate(noms, prenoms):
    """
    Concatène les noms et prénoms de deux chaines
    Retourne une chaines des noms et prénoms concaténés
    Args : noms, prénoms
    """
    # normalisation des noms en majuscules
    noms = noms.upper()
    # suppression des espaces
    noms = noms.replace(" ", "")
    prenoms = prenoms.replace(" ", "")
    # création de deux listes
    listeNoms = noms.split(",")
    listePrenoms = prenoms.split(",")
    nomsComplets = []
    # parcours des listes
    for i in range(0, len(listeNoms)):
        # cas où il y a plus de 3 auteurs
        if i > 2:
            nomsComplets.append("et al.")
            break
        # cas où il y a entre 1 et 3 auteurs
        else:
            temp = listeNoms[i] + " " + listePrenoms[i]
            nomsComplets.append(temp)
    return ', '.join(nomsComplets)


def extract_year(string):
    """
    Extrait l'année à partir d'une date
    Retourne l'année
    Args : la date à traiter au format jj/mm/aaa
    """
    date = string.split("/")
    return date[2]


def open_tag(string):
    """
    Transforme une chaine de caractère en une balise xml ouvrante
    Retourne la chaine entourée de balises
    Args : la chaine à traiter
    """
    return "<" + string + ">"


def close_tag(string):
    """
    Transforme une chaine de caractère en une balise xml fermante
    Retourne la chaine entourée de balises
    Args : la chaine à traiter
    """
    return "</" + string + ">"


# dictionnaire pour traiter les entités
entities = {'Pré-publication, Document de travail': 'prepublication',
            'Article de revue': 'article',
            'Communication dans un congrès': 'communication',
            "Chapitre d'ouvrage": 'chapitre'}


def create_entity(string):
    """
    Transforme une chaine de caractère en entité
    si celle-ci est présente dans le dictionnaire d'entités
    Retourne l'alias de l'entité
    Args : la chaine à traiter
    """
    for entity, alias in entities.items():
        if string == entity:
            result = "&" + alias + ";"
    return result


def data_from_csv(file, fileEncoding, pattern):
    """
    Extrait les informations d'un fichier csv sur base d'un motif
    Retourne une liste des lignes contenant le motif
    Args : nom du fichier, encodage, motif
    """
    # ouverture du fichier d'entrée
    print("Reading file")
    with codecs.open(file, 'r', encoding=fileEncoding, errors='ignore') as f:
        # compteurs
        cntLine = 0
        cntPatternLine = 0
        # liste des lignes contenant le motif
        patternLineList = []

        # lecture du fichier ligne à ligne
        print("Searching...")
        for line in f:
            # rejet de la première ligne
            f.readline()
            # suppresion du retour à la ligne
            line = line.rstrip()
            # normalisation
            line = normalize(line)
            # recherche du motif dans la ligne courante
            if re.search(pattern, line):
                patternLineList.append(line)
                cntPatternLine += 1
            cntLine += 1

    print("Found : " + str(cntPatternLine) + "/" + str(cntLine))

    return patternLineList


def tags_from_csv(fileName, fileEncoding):
    """
    Extrait les titres des colonnes d'un fichier csv
    Retourne une liste des titres normalisés
    Args : nom du fichier, encodage
    """
    print("Extracting tags")
    # ouverture du fichier d'entrée
    with open(fileName, 'r', encoding="UTF-8") as inFile:

        # Liste des titres
        tagList = []

        # lecture de la première ligne
        firstLine = inFile.readline()
        # création d'une liste temporaire
        tempList = firstLine.split(';')

        # parcours de la liste temporaire
        for element in tempList:
            element = element.rstrip()
            element = element.lower()
            element = strip_accents(element)
            # remplacement des espaces par _
            regex = re.compile(' |-')
            element = regex.sub('_', element)
            tagList.append(element)

    return tagList


def create_xml(name, data, tags):
    """
    Crée un fichier xml valide
    Args : nom du fichier, liste des données, liste des tags
    """
    print("Creating xml file")

    # ouverture du fichier de sortie
    with open("../xml/" + name + ".xml", "w") as out:
        # compteur
        counter = 0

        # prologue et dtd
        out.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
        out.write("<!DOCTYPE " + name + " SYSTEM " +
                  "\"../grammaire/" + name + ".dtd\" [\n")
        # entités
        for entity, alias in entities.items():
            out.write("<!ENTITY " + alias + " \"" + entity + "\"" + ">\n")
        out.write("]>\n")
        # relaxng
        out.write("<?xml-model href=\"../grammaire/articlesTAL.rng\"" +
                  "type=\"application/xml\" schematypens=\"http://relaxng.org/ns/structure/1.0\"?>\n")

        # déclaration du nom des tags
        root = name
        aut = "auteurs"
        title = tags[0]
        subtitle = tags[1]
        sourceTitle = tags[11]
        publDate = tags[10]
        nr = tags[8]
        pages = tags[9]
        url = tags[13]
        issn = tags[7]
        infos = "informations_complementaires"
        publType = tags[3]
        sourceType = tags[12]
        researchNr = tags[4]
        doi = tags[14]
        halRef = tags[15]
        oaiRef = tags[16]
        abstract = tags[2]
        fields = tags[17]

        # racine
        out.write(open_tag(root) + "\n")

        # parcours de la liste de données en entrée
        for item in data:

            # rejet des éléments contenant des balises, comme <br /> ou <U+047>
            if re.search('<.+?>', item):
                continue

            # création d'une liste correspondant aux colonnes du csv
            columns = item.split(";")

            # rejet de l'item s'il ne contient pas 18 éléments
            if len(columns) != 18:
                continue

            # rejet de tous les titre ne commençant pas par une majuscule
            pattern = re.compile('[^A-Z]')
            if pattern.search(columns[0][0]):
                continue

            # normalisation des auteurs et de la date
            authors = concatenate(columns[6], columns[5])
            date = extract_year(columns[10])

            # impression des résultats dans le fichier de sortie
            out.write("<article id=\"" + str(counter) + "\" " +
                      title + "=\"" + columns[0] + "\"")
            # sous-titre présent
            if len(columns[1]) > 1:
                out.write(" " + subtitle + "=\"" + columns[1] + "\">\n")
            # sous-titre absent
            else:
                out.write(">\n")

            out.write(open_tag(aut) + authors + close_tag(aut) + "\n")
            out.write(open_tag(sourceTitle) + columns[11] +
                      close_tag(sourceTitle) + "\n")
            out.write(open_tag(publDate) + date + close_tag(publDate) + "\n")
            out.write(open_tag(nr) + columns[8] + close_tag(nr) + "\n")
            out.write(open_tag(pages) + columns[9] + close_tag(pages) + "\n")
            out.write(open_tag(url) + columns[13] + close_tag(url) + "\n")
            out.write(open_tag(issn) + columns[7] + close_tag(issn) + "\n")
            out.write(open_tag(infos) + "\n")
            out.write(open_tag(publType) + create_entity(columns[3]) +
                      close_tag(publType) + "\n")
            out.write(open_tag(sourceType) + columns[12] +
                      close_tag(sourceType) + "\n")
            out.write(open_tag(researchNr) + columns[4] +
                      close_tag(researchNr) + "\n")
            out.write(open_tag(doi) + columns[14] + close_tag(doi) + "\n")
            out.write(open_tag(halRef) + columns[15] +
                      close_tag(halRef) + "\n")
            out.write(open_tag(oaiRef) + columns[16] +
                      close_tag(oaiRef) + "\n")
            out.write(close_tag(infos) + "\n")
            out.write(open_tag(abstract) + columns[2] +
                      close_tag(abstract) + "\n")
            out.write(open_tag(fields) + columns[17] +
                      close_tag(fields) + "\n")
            out.write("</article>\n")

            counter += 1

        # fermeture de la racine
        out.write(close_tag(root))
        print("Articles in xml file : " + str(counter))


results = data_from_csv("../data/CSV/articlesHAL.csv", "UTF-8", "NLP|TALN")
tags = tags_from_csv("../data/CSV/articlesHAL.csv", "UTF-8")
xmlFile = create_xml("articlesTAL", results, tags)
