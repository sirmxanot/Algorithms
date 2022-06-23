from random import choice
def random_fortunes(file_path):
    fortunes = []
    with open(file_path, 'r', encoding='UTF-8') as f:
        current_fortune = ''
        for line in f:
            if line == '%\n':
                fortunes.append(current_fortune.strip())
                current_fortune = ''
            else:
                current_fortune += line.replace('\n',' ')
        fortunes.append(current_fortune.strip())

    return choice(fortunes)

if __name__ == "__main__":
    print(random_fortunes('fortunes.txt'))