def log_parser(log_path):
    unique_entries = set()

    with open(log_path,'r',encoding='UTF-8') as f:
        for line in f:
            name,value = line.replace('\n','').split('=')
            unique_entries.add((int(value),name))

    print(unique_entries)
    for value,name in sorted(unique_entries):
        print(name + '=' + str(value))

if __name__ == "__main__":
    print(log_parser('log.txt'))