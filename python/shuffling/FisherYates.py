from random import randint
words = open('/usr/share/dict/words','r').readlines()

def shuffle(a):
    n = len(a)

    for i in range(n):
        j = randint(0,n-1)
        a[i], a[j] = a[j], a[i]

    return a

words = shuffle(words)

print(words[-1])
