import time
import multiprocessing

def cpu_user(n,id):
    time.sleep(2)

def multiproc(n):
    processes = []
    
    for i in range(n):
        p = multiprocessing.Process(target=cpu_user, args=(500,i))
        processes.append(p)
        p.start()
    
    for p in processes:
        p.join()

if __name__ == "__main__":
    start = time.time()
    multiproc(80)
    end = time.time()
    print(f'Took: {end-start}')