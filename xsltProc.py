import sys
from saxonche import *

# python xsltProc.py [stylesheet] [inputFile] [outputFile]

with PySaxonProcessor(license=False) as proc:
    outputFile = open(sys.argv[3], "w", encoding="utf-8")
    xsltproc = proc.new_xslt30_processor()
    executable = xsltproc.compile_stylesheet(stylesheet_file=sys.argv[1])
    teiInput = proc.parse_xml(xml_file_name=sys.argv[2])
    output = executable.transform_to_string(xdm_node=teiInput)
    print(output)
    outputFile.write(output)
    outputFile.close()
