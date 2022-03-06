class Hash():
    def __init__(self, n=1001):
        self.storage = ['' for _ in range(n)]
        self.n = n
        self.entries = 0
    
    def put(self,k,v):
        h_key = self._hash(k)
        
        if self.storage[h_key] == '':
            self.entries += 1

        self.storage[h_key] = v
        
        return self.get(k)

    def get(self,k):
        return self.storage[self._hash(k)]

    def keys(self):
        pass

    def values(self):
        return list(filter(lambda v: v != '',self.storage))

    def load_factor(self):
        return self.entries/self.n

    def _hash(self, s):
        i = abs(self._string_to_int(s))
        i %= self.n

        return i

    def _string_to_int(self, s):
        i = 0
        for pos in range(len(s)):
            i = 31*i + ord(s[pos])
        return i
    

h = Hash()
print(h.put('hey','you'))
print(h.put('oi','tu'))
print(h.values())
print(h.load_factor())
#print(h.hash('hello'))        
