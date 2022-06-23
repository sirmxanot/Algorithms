def find_last_word(path):
    last_words = []

    with open(path,'r',encoding="UTF-8") as f:
        for line in f:
            word = line.split()
            if word:
                last_words.append(word[-1])

    return last_words

if __name__ == "__main__":
    print(find_last_word('last_words.txt'))