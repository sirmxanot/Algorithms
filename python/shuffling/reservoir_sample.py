from random import randint

words = open('/usr/share/dict/words','r').readlines()

def sample(a,sample_size=100):
    s = ['']*sample_size
    n = len(a)
    count = 0

    for element in a:
        if count < sample_size:
            s[count] =  element
        else:
            j = randint(0,count)
            if j < sample_size:
                s[j] = element
        count += 1
    return s

print(sample(words))