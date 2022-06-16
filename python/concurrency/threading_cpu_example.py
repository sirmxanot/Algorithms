import time
import threading

def cpu_user(n,id):
    for x in range(n):
        for y in range(n):
            x**y

def threaded(n):
    threads = []

    for i in range(n):
        t = threading.Thread(target=cpu_user, args=(500,i))
        threads.append(t)
        t.start()

    for t in threads:
        t.join()

if __name__ == "__main__":
    start = time.time()
    threaded(80)
    end = time.time()
    print(f'Took: {end-start}')