import time
import multiprocessing

def cpu_user(n,id):
    for x in range(1,n):
        for y in range(1,n):
            x**y

def do(n):
    cpu_user(500,n)

def pooled(n):
    processes = []
    
    with multiprocessing.Pool() as pool:
        pool.map(do,range(n))

if __name__ == "__main__":
    start = time.time()
    pooled(80)
    end = time.time()
    print(f'Took: {end-start}')