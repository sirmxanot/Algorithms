class Hash:
    def __init__(self, n=1001):
        self.storage = [[] for _ in range(n)]
        self.n = n
        self.entries = 0
    
    def put(self,k,v):
        exists = False
        h_key = self._hash(k)
        
        for i in range(len(self.storage[h_key])):
            if self.storage[h_key][i][0] == k:
                self.storage[h_key][i] = (k,v)
                exists = True
        
        if not exists:
            self.storage[h_key].append((k,v))
            self.entries += 1

        return self.get(k)

    def get(self,k,delete=False):
        h_key = self._hash(k)

        for i in range(len(self.storage[h_key])):
            if self.storage[h_key][i][0] == k:
                value = self.storage[h_key][i][1]
                if delete:
                    del self.storage[h_key][i]
                return value

        return None

    def delete(self,k):
        if self.get(k,True):
            return True
        else:
            return False

    def keys(self):
        return self.items('key')

    def values(self):
        return self.items('value')

    def items(self,type=None):
        items = []
        for element in self.storage:
            for pair in element:
                if type == 'key':
                    items.append(pair[0])
                elif type == 'value':
                    items.append(pair[1])
                else:
                    items.append(pair)
        
        return items

    def load_factor(self):
        return self.entries/self.n

    def resize(self,threshold=1):
        if self.load_factor() > threshold:
            items = self.items()
            self.entries = 0
            self.n *= 2
            self.storage = [[] for _ in range(self.n)]
            
            for k,v in items:
                self.put(k,v)

            return True

        return False


    def _hash(self, s):
        i = abs(self._string_to_int(s))
        i %= self.n

        return i

    def _string_to_int(self, s):
        i = 0
        for pos in range(len(s)):
            i = 31*i + ord(s[pos])
        return i
    

h = Hash(3)
print(h.put('hey','you'))
print(h.put('hey','yous'))
print(h.put('oi','tu'))
print(h.resize())
print(h.items())
print(h.put('sd','sdsd'))
print(h.put('bad','bunny'))
print(h.load_factor()) 
print(h.resize())
print(h.load_factor()) 
print(h.values())
print(h.keys())
print(h.items())
print(h.delete('bad'))
print(h.items())