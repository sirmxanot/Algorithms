import time
import asyncio

async def cpu_user(n,id):
    for x in range(1,n):
        for y in range(1,n):
            x**y

def async(n):    
    for i in range(n):
        cpu_user(500,i)

if __name__ == "__main__":
    start = time.time()
    async(80)
    end = time.time()
    print(f'Took: {end-start}')