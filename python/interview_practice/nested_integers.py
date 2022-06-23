
class Flatten:
    def __init__(self):
        self.ans = []

    def flatten(self, l):
        self.recurse(l)
        return self.ans

    def recurse(self,l):
        for val in l:
            if type(val) == int:
                self.ans.append(val)
            else:
                self.flatten(val)

if __name__ == "__main__":
    print(Flatten().flatten([1,2,[3]]))
    print(Flatten().flatten([1,[2,3],4,[5,6,[7,8]]]))