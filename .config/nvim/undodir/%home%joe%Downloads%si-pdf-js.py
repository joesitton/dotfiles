Vim�UnDo� ZO#���C�c�͹�T��=N-��fn�\��   �       doc = PDFDocument(             ,       ,   ,   ,    ]���    _�                             ����                                                                                                                                                                                                                                                                                                                                                             ]���     �         �       �         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���     �                    try:           selfname = sys.argv[0]           fname = sys.argv[1]       except IndexError:   &        print "No input file provided"   +        print "Usage: %s [file]" % selfname           return5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���     �                $    # get filename from command line    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���     �         �              fh = open(fname, 'rb')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���     �         �    �         �          try:�         �              fh = open(, 'rb')5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���    �   �   �   �          �   �   �   �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��     �         �      <        print "Error reading file %s in binary mode" % fname5�_�      	                 <    ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��     �         �      <        print("Error reading file %s in binary mode" % fname5�_�      
           	   &        ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��	    �   %   '   �      #        print("Error Opening PDF ")5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��q     �         �      Dfrom pdfminer.pdfparser import PDFDocument, PDFParser, PDFNoOutlines5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��q     �         �      9from pdfminer.pdfparser import , PDFParser, PDFNoOutlines5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��q     �         �      8from pdfminer.pdfparser import  PDFParser, PDFNoOutlines5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��r     �         �       �         �    5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��}     �         �      7from pdfminer.pdfparser import PDFParser, PDFNoOutlines5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��~     �         �      *from pdfminer.pdfparser import PDFParser, 5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��     �         �      ,from pdfminer.pdfdocument import PDFDocument5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���    �         �      )from pdfminer.pdfparser import PDFParser 5�_�                    �   	    ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���     �   �   �   �          print prettyjs5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���    �   �   �   �          print(prettyjs5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��/     �         �      )import sys, cStringIO, hashlib, traceback5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��2     �         �       �      
   �    5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��8     �      	              StringIO.StringIO.5�_�                    y   /    ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��=    �   x   z   �      I                                        tmph = cStringIO.StringIO(tmpstr)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��N     �         �       �      
   �    5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��Q    �      	              import String5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��Y     �         �      (import sys, StringIO, hashlib, traceback5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��Y     �         �       import sys, , hashlib, traceback5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��Z     �         �      import sys,  hashlib, traceback5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��[    �      
   �       �      
   �    5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��c    �               �   #!/usr/bin/python       import sys, hashlib, traceback   2from pdfminer.psparser import PSKeyword, PSLiteral   ;from pdfminer.pdfdocument import PDFDocument, PDFNoOutlines   (from pdfminer.pdfparser import PDFParser   Jfrom pdfminer.pdftypes import PDFStream, PDFObjRef, resolve1, stream_value   #from argparse import ArgumentParser   from io import StringIO       from lxml import etree       import signal, os   	import re   import jsbeautifier       AccessedObjects = []           def main():   F    # Open file directly into a buffer so we can apply regexp later on       try:   "        fh = open(args.file, 'rb')       except:   =        print("Error reading file %s in binary mode" % fname)           return           password = ''           try:           doc = PDFDocument()           parser = PDFParser(fh)            parser.set_document(doc)           doc.set_parser(parser)            doc.initialize(password)       #except TimeoutError:       #   raise       except:   ;        exc_type, exc_value, exc_traceback = sys.exc_info()   "        print("Error Opening PDF")           extracted_obj_count = 0   /    #print("Opened doc, trying to get objects")           #max_obj_count = 20       min_obj_len = 1               jsqueue = []               for xref in doc.xrefs:   '        for objid in xref.get_objids():   5            #if extracted_obj_count >= max_obj_count:   ;            #for the momment, don't alert on reaching limit   +            #print("Object limit reached ")               #break       9            #print("Trying to deflate object %i" % objid)                   try:   '                obj = doc.getobj(objid)                   if obj is None:   4                    #print('None object %i' % objid)                       continue       g                #intentionally ignore anything that isn't a PDFstream, including: dict, list, PDFObjRef   /                #if isinstance(obj, PDFStream):   6                #    obj_name = 'pdf_obj_%i' % (objid)   .                #    obj_data = obj.get_data()   6                #    if len(obj_data) >=  min_obj_len:   F                #        extracted_obj_count = extracted_obj_count + 1   |                #        #print('Stream %i: %i %s' % (objid, len(obj.get_data()), hashlib.md5(obj.get_data()).hexdigest()));                   #   +                #        #if (objid == 2 ):   '                #            #print obj                   #                   #    else:   !                #        continue   Y                #        #print('Stream too small %i: %i' % (objid, len(obj.get_data())))   �                #        #we don't try to act on or expose type of stream because this isn't relable--ex. often there is /JS object with reference to other object   )                if isinstance(obj, dict):   ;                    #print('Stream is a dict %i' % (objid))       6                    for dKey, dVal in obj.iteritems():   1                        if(dKey == "JavaScript"):   >                            #print('found key for JavaScript')   5                            pdfRecurse(dVal, jsqueue)   A                            #childObj = pdfRecurse(dVal, jsqueue)   1                            #childID = dVal.objid       _                            #print('Found JS key at %i: %s -> %s' % (objid, childID, childObj))   b                            #print('How does my size %i queue look? %s' % (len(jsqueue), jsqueue))           +                        elif(dKey == "JS"):   3                            #print('found JS dkey')       A                            if(AccessedObjects.count(objid) > 0):   (                                continue   O                            #print('JS string already added per id %i' % objid)   7                            elif isinstance(dVal, str):   4                                jsqueue.append(dVal)   !                            else:   9                                pdfRecurse(dVal, jsqueue)       ,                        elif(dKey == "XFA"):   V                            #print('explode_pdf-js - found an XFA at obj: %i' % objid)       6                            if isinstance(dVal, list):   i                                #print('explode_pdf-js - found list inside XFA %s %s\n\n' % (dKey, dVal))       :                                if dVal.index('template'):   R                                    tmp = resolve1(dVal[dVal.index('template')+1])       b                                    tmpstr = tmp.get_data() if isinstance(tmp, PDFStream) else tmp       U                                    if tmpstr.find('"application/x-javascript"') > 0:       q                                        #print('explode_pdf-js - found javascript in template \n\n%s\n' % tmpstr)       H                                        tmph = StringIO.StringIO(tmpstr)   3                                        tmpstr = ''       T                                        for event, element in etree.iterparse(tmph):   u                                            #print('etree element tag, val = %s\n%s\n' % (element.tag, element.text))       L                                            if element.tag[-6:] != 'script':   q                                                tmpstr = "%s\n//%s\n/*%s*/" % (tmpstr, element.tag, element.text)       1                                            else:   m                                                tmpstr = "%s\n//%s\n%s" % (tmpstr, element.tag, element.text)       >                                        jsqueue.append(tmpstr)           1                #elif isinstance(obj, PDFObjRef):   7                #print('Stream is a ObjRef %i' % objid)                       #else:   E                #print('Stream isnt PDFStream %i: %s' % (objid, obj))   !            #except TimeoutError:               #     raise               except:   C                exc_type, exc_value, exc_traceback = sys.exc_info()   4                print("Error Extracting PDF object")               fh.close();           #print '\n'.join(jsqueue)   !    #print '\n\n\n\n\n\n\n\n\n\n'       )    opts = jsbeautifier.default_options()   "    opts.preserve_newlines = False   #    opts.brace_style = 'end-expand'           js = '\n'.join(jsqueue)           if not isinstance(js, str):           js = js.encode('utf-8')       .    prettyjs = jsbeautifier.beautify(js, opts)       H    # fix "string1" + "string2" + "string3" into "string1string2string3"   9    prettyjs = re.sub(r'(\x27|\x22) \+ \1', '', prettyjs)       # delete nulls   ,    prettyjs = re.sub(r'\x00', '', prettyjs)           print(prettyjs)       
    return           def pdfRecurse(x, a):   C    """Recursively resolves the given object and all the internals.   F    Make sure there is no indirect reference within the nested object.   !    This procedure might be slow.   b    EMH: Copied resolve_all() of PDFMiner library because I can't figure out how to call it myself       """        if isinstance(x, PDFObjRef):   2        #print('Recurse Found a PDFobjRef %s' % x)   (        #AccessedObjects.append(x.objid)           #x = x.resolve()   &        x = pdfRecurse(x.resolve(), a)           elif isinstance(x, list):   -        #print('Recurse Found a list %s' % x)   +        x = [ pdfRecurse(v, a) for v in x ]           elif isinstance(x, dict):   -        #print('Recurse Found a dict %s' % x)   #        for (k,v) in x.iteritems():   D            if ((k == "JS" or k == "Names") and isinstance(v, str)):                   a.append(v)               else:   '                x[k] = pdfRecurse(v, a)       "    elif isinstance(x, PDFStream):   2        #print('Recurse Found a pdfstream %s' % x)   1        if (AccessedObjects.count(x.objid) == 0):               try:   /                AccessedObjects.append(x.objid)   &                a.append(x.get_data())               except:   9                print('error getting data in pdfrecurse')           #else:   J        #    print('id %i already in the master list, ignoring' % x.objid)       	    else:   A        #print('Recurse found something we dont know/care about')           return           return x               if __name__ == "__main__":       parser = ArgumentParser()       parser.add_argument("file")       args = parser.parse_args()       
    main()5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��g     �                AccessedObjects = []    5�_�      !               2        ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��j     �   2   5   �    �   2   3   �    5�_�       "           !   3        ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��m     �   2   4   �      AccessedObjects = []5�_�   !   #           "   4        ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��o   	 �               �   #!/usr/bin/python       import hashlib   	import os   	import re   import signal   
import sys   import traceback   #from argparse import ArgumentParser   from io import StringIO       ;from pdfminer.pdfdocument import PDFDocument, PDFNoOutlines   (from pdfminer.pdfparser import PDFParser   Jfrom pdfminer.pdftypes import PDFObjRef, PDFStream, resolve1, stream_value   2from pdfminer.psparser import PSKeyword, PSLiteral       import jsbeautifier   from lxml import etree           def main():   F    # Open file directly into a buffer so we can apply regexp later on       try:   "        fh = open(args.file, 'rb')       except:   =        print("Error reading file %s in binary mode" % fname)           return           password = ''           try:           doc = PDFDocument()           parser = PDFParser(fh)            parser.set_document(doc)           doc.set_parser(parser)            doc.initialize(password)       #except TimeoutError:       #   raise       except:   ;        exc_type, exc_value, exc_traceback = sys.exc_info()   "        print("Error Opening PDF")           extracted_obj_count = 0   /    #print("Opened doc, trying to get objects")           #max_obj_count = 20       min_obj_len = 1               jsqueue = []       AccessedObjects = []                   for xref in doc.xrefs:   '        for objid in xref.get_objids():   5            #if extracted_obj_count >= max_obj_count:   ;            #for the momment, don't alert on reaching limit   +            #print("Object limit reached ")               #break       9            #print("Trying to deflate object %i" % objid)                   try:   '                obj = doc.getobj(objid)                   if obj is None:   4                    #print('None object %i' % objid)                       continue       g                #intentionally ignore anything that isn't a PDFstream, including: dict, list, PDFObjRef   /                #if isinstance(obj, PDFStream):   6                #    obj_name = 'pdf_obj_%i' % (objid)   .                #    obj_data = obj.get_data()   6                #    if len(obj_data) >=  min_obj_len:   F                #        extracted_obj_count = extracted_obj_count + 1   |                #        #print('Stream %i: %i %s' % (objid, len(obj.get_data()), hashlib.md5(obj.get_data()).hexdigest()));                   #   +                #        #if (objid == 2 ):   '                #            #print obj                   #                   #    else:   !                #        continue   Y                #        #print('Stream too small %i: %i' % (objid, len(obj.get_data())))   �                #        #we don't try to act on or expose type of stream because this isn't relable--ex. often there is /JS object with reference to other object   )                if isinstance(obj, dict):   ;                    #print('Stream is a dict %i' % (objid))       6                    for dKey, dVal in obj.iteritems():   1                        if(dKey == "JavaScript"):   >                            #print('found key for JavaScript')   5                            pdfRecurse(dVal, jsqueue)   A                            #childObj = pdfRecurse(dVal, jsqueue)   1                            #childID = dVal.objid       _                            #print('Found JS key at %i: %s -> %s' % (objid, childID, childObj))   b                            #print('How does my size %i queue look? %s' % (len(jsqueue), jsqueue))           +                        elif(dKey == "JS"):   3                            #print('found JS dkey')       A                            if(AccessedObjects.count(objid) > 0):   (                                continue   O                            #print('JS string already added per id %i' % objid)   7                            elif isinstance(dVal, str):   4                                jsqueue.append(dVal)   !                            else:   9                                pdfRecurse(dVal, jsqueue)       ,                        elif(dKey == "XFA"):   V                            #print('explode_pdf-js - found an XFA at obj: %i' % objid)       6                            if isinstance(dVal, list):   i                                #print('explode_pdf-js - found list inside XFA %s %s\n\n' % (dKey, dVal))       :                                if dVal.index('template'):   R                                    tmp = resolve1(dVal[dVal.index('template')+1])       b                                    tmpstr = tmp.get_data() if isinstance(tmp, PDFStream) else tmp       U                                    if tmpstr.find('"application/x-javascript"') > 0:       q                                        #print('explode_pdf-js - found javascript in template \n\n%s\n' % tmpstr)       H                                        tmph = StringIO.StringIO(tmpstr)   3                                        tmpstr = ''       T                                        for event, element in etree.iterparse(tmph):   u                                            #print('etree element tag, val = %s\n%s\n' % (element.tag, element.text))       L                                            if element.tag[-6:] != 'script':   q                                                tmpstr = "%s\n//%s\n/*%s*/" % (tmpstr, element.tag, element.text)       1                                            else:   m                                                tmpstr = "%s\n//%s\n%s" % (tmpstr, element.tag, element.text)       >                                        jsqueue.append(tmpstr)           1                #elif isinstance(obj, PDFObjRef):   7                #print('Stream is a ObjRef %i' % objid)                       #else:   E                #print('Stream isnt PDFStream %i: %s' % (objid, obj))   !            #except TimeoutError:               #     raise               except:   C                exc_type, exc_value, exc_traceback = sys.exc_info()   4                print("Error Extracting PDF object")               fh.close();           #print '\n'.join(jsqueue)   !    #print '\n\n\n\n\n\n\n\n\n\n'       )    opts = jsbeautifier.default_options()   "    opts.preserve_newlines = False   #    opts.brace_style = 'end-expand'           js = '\n'.join(jsqueue)           if not isinstance(js, str):           js = js.encode('utf-8')       .    prettyjs = jsbeautifier.beautify(js, opts)       H    # fix "string1" + "string2" + "string3" into "string1string2string3"   9    prettyjs = re.sub(r'(\x27|\x22) \+ \1', '', prettyjs)       # delete nulls   ,    prettyjs = re.sub(r'\x00', '', prettyjs)           print(prettyjs)       
    return           def pdfRecurse(x, a):   C    """Recursively resolves the given object and all the internals.   F    Make sure there is no indirect reference within the nested object.   !    This procedure might be slow.   b    EMH: Copied resolve_all() of PDFMiner library because I can't figure out how to call it myself       """        if isinstance(x, PDFObjRef):   2        #print('Recurse Found a PDFobjRef %s' % x)   (        #AccessedObjects.append(x.objid)           #x = x.resolve()   &        x = pdfRecurse(x.resolve(), a)           elif isinstance(x, list):   -        #print('Recurse Found a list %s' % x)   +        x = [ pdfRecurse(v, a) for v in x ]           elif isinstance(x, dict):   -        #print('Recurse Found a dict %s' % x)   #        for (k,v) in x.iteritems():   D            if ((k == "JS" or k == "Names") and isinstance(v, str)):                   a.append(v)               else:   '                x[k] = pdfRecurse(v, a)       "    elif isinstance(x, PDFStream):   2        #print('Recurse Found a pdfstream %s' % x)   1        if (AccessedObjects.count(x.objid) == 0):               try:   /                AccessedObjects.append(x.objid)   &                a.append(x.get_data())               except:   9                print('error getting data in pdfrecurse')           #else:   J        #    print('id %i already in the master list, ignoring' % x.objid)       	    else:   A        #print('Recurse found something we dont know/care about')           return           return x               if __name__ == "__main__":       parser = ArgumentParser()       parser.add_argument("file")       args = parser.parse_args()       
    main()5�_�   "   $           #   2       ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��v     �   1   2              AccessedObjects = []5�_�   #   %           $   �       ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��x     �   �   �   �    �   �   �   �    5�_�   $   &           %   �       ����                                                                                                                                                                                                                                                                                                                                                V   "    ]��y   
 �   �   �   �    5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                V   "    ]���     �                    try:5�_�   &   (           '   !       ����                                                                                                                                                                                                                                                                                                                            (          !          V       ]���     �       !                   parser.set_document(doc)           doc.set_parser(parser)            doc.initialize(password)       # except TimeoutError:       #   raise       except:   ;        exc_type, exc_value, exc_traceback = sys.exc_info()   "        print("Error Opening PDF")5�_�   '   )           (           ����                                                                                                                                                                                                                                                                                                                                                   V        ]���     �      !                  parser = PDFParser(fh)�                         doc = PDFDocument()5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                   V        ]���     �          �    �         �       �          �          doc = PDFDocument()5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                   V        ]���     �                    doc = PDFDocument(5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                  V        ]���     �      !   �    �          �    5�_�   +               ,           ����                                                                                                                                                                                                                                                                                                                                                  V        ]���    �      !   �          doc = PDFDocument(5��