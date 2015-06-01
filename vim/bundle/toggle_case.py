from snake import *

@key_map("<leader>c")
def toggle_case():
    word = get_word()

    if "_" in word:
        chunks = word.split("_")
        camel = chunks[0] + "".join([chunk.capitalize() for chunk in chunks[1::]])
        replace_word(camel)

    else:
        chunks = filter(None, re.split("([A-Z][^A-Z]*)", word))
        snake = "_".join([chunk.lower() for chunk in chunks])
        replace_word(snake)
