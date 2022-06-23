import json

def json_toy(path):
    with open(path, 'r') as f:

        j = json.load(f)
    print(json.dumps(j))

    
    return j['glossary']['GlossDiv']['title']


if __name__ == "__main__":
    print(json_toy('example.json'))