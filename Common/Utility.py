import ast
import os

class Utility(object):
    ROBOT_LIBRARY_VERSION = 0.1
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def get_dictionary(self,key, lang):
        workingDirectory = os.getcwd().split("Automation", 1)[0]
        proj = os.getcwd().split("Automation\\", 1)[1]
        proj = proj.split("\\",1)[0]
        lang = lang[0] + lang[1]
        lang = lang.lower()
        with open(workingDirectory+"Automation\\"+ proj +"\\Library\\"+ lang +".txt","r") as data:
            dictionary = ast.literal_eval(data.read())
        return(dictionary[key])
    
    def combine_strings(self,str1, str2, str3 = "", str4 ="", str5="", str6=""):
        return(str1+str2+str3+str4+str5+str6)

    