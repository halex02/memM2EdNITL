from saxonche import *

with PySaxonProcessor(license=False) as proc:
    fichier = open("latex\\memoire.tex", "w", encoding="utf-8")
    xsltproc = proc.new_xslt30_processor()
    executable = xsltproc.compile_stylesheet(stylesheet_file="xslt\\transform.xsl")
    document = proc.parse_xml(xml_file_name='guillaume-de-boldensele.xml')
    output = executable.transform_to_string(xdm_node=document)
    print(output)
    fichier.write(output)
    fichier.close()
