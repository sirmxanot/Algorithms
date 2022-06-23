# this version works on files that are too large to fit in memory
from random import choice
def random_fortunes(file_path):
    res = ''
    fortunes = open('processed_fortunes.txt','w')
    fortune_indexes = []
    with open(file_path, 'r', encoding='UTF-8') as f:
        current_fortune = ''
        for line in f:
            if line == '%\n':
                fortune_indexes.append(fortunes.tell())
                fortunes.write(current_fortune.strip() + '\n')
                current_fortune = ''
            else:
                current_fortune = current_fortune + line.replace('\n',' ')
        fortune_indexes.append(fortunes.tell())
        fortunes.write(current_fortune.strip() + '\n')
    fortunes.close()

    with open('processed_fortunes.txt','r') as f:
        index = choice(fortune_indexes)
        f.seek(index)
        res = f.readline().replace('\n','')

    return res

if __name__ == "__main__":
    print(random_fortunes('fortunes.txt'))