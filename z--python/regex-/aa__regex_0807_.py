import re


print("-----------------------------------------------")

url1 = ' http://www.login.wikidata.org/'
url2 = ' http://www.wikidata.org/entity/L123456 '
pattern = r'www\.([a-z.]+)\.org'


match1 = re.search(pattern, url1)
if match1:
    print(match1.group(1))

match2 = re.search(pattern, url2)
if match2:
    print(match2.group(1)) 


print("-----------------------------------------------")




print("-----------------------------------------------")




print("-----------------------------------------------")




print("-----------------------------------------------")




print("-----------------------------------------------")




print("-----------------------------------------------")
