
print("--------------------------------------------------")

search_result = "cat" and "description" in ["name", "both"]

print(search_result)

print("--------------------------------------------------")

search_result = "tom" and "description" in ["tom", "both"]

print(search_result)

print("--------------------------------------------------")

search_result = "tom" and "description" in ["tom", "description",]

print(search_result)

print("--------------------------------------------------")

search_result = "tom" and "description" in ["tom", "description", "animal"]

print(search_result)

print("--------------------------------------------------")

search_result = False and "description" in ["tom", "description", "animal"]

print(search_result)

print("--------------------------------------------------")
word = None

search_result = word and "description" in ["tom", "description", "animal"]

print(search_result)

print("--------------------------------------------------")
word = "cat"

search_result = word and "description" in ["tom", "description", "animal"]

print(search_result)

print("--------------------------------------------------")
# if user search for "cat" word in dictionary and want to search also in "description" of a word
word = "cat"
search = "description"

# "word" is not None
search_result = word and search in [ "description", "animal"]

print(search_result)

print("--------------------------------------------------")
word = None
search = "description"

# "word" is None ( No search character sent via rest API - bug/mistake) , so no search operation
search_result = word and search in [ "description", "animal"]

print(search_result)

print("--------------------------------------------------")