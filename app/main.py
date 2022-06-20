import time
from typing import Union
import os, datetime as dt
from fastapi import Depends, FastAPI, Response, Form, Body

# import asyncio

app = FastAPI()

# _hash = os.getenv('HASH')
_hash = 'HASH'
# print('Log output started. Hash string is:', _hash)

_latest_timestamp = 'not yet started!'

# async def forever():
#     global _latest_timestamp
#     T5S = dt.timedelta(seconds=5)
#     MAGIC_CONSTANT = 0.002 # Not really necessary, as it will "self tune" anyway.
#     first_timestamp = dt.datetime.now(dt.timezone.utc)
#     target = first_timestamp + T5S
#     while True:
#         _latest_timestamp = dt.datetime.now(dt.timezone.utc)

#         # the Log output
#         print(f'{_latest_timestamp} {_hash}', flush=True)

#         # await asyncio.sleep(5)
#         # don't let it slip
#         await asyncio.sleep((target - _latest_timestamp).total_seconds() - MAGIC_CONSTANT)
#         target += T5S

async def writer_ready():
    # kludge
    time.sleep(1)
    ready = False
    while (not ready):
        global _hash
        try:
            with open('app/files/hs.txt', 'r') as f:
                _hash = f.read()
                ready = True
        except EnvironmentError:
            print('Error in opening shared file!')
            time.sleep(5)

# def hash_check():
#     global _hash
#     if (_hash=='HASH'):
#         try:
#             with open('app/files/hs.txt', 'r') as f:
#                 _hash = f.read()
#         except EnvironmentError:
#             print('Error in opening shared file!')
#             return os.popen('ls -al app/files').read()
#     return _hash

def get_latest_ts():
    ts = '0'
    try:
        with open('app/files/ts.txt', 'r') as f:
            ts = f.read()
    except EnvironmentError:
        print('Error in opening shared file!')
        # return os.popen('ls -al app/files').read()
        return 'Sorry IO Error!'
    return ts

@app.on_event("startup")
async def startup_event():
    # asyncio.create_task(forever()) # start generating the timestamps
    await writer_ready()


@app.get("/")
def hello():
    ts = get_latest_ts()
    data = f"{ts} {_hash}"
    return Response(content=data, media_type="text/plain")


# def loop1():
#     S5 = dt.timedelta(seconds=5)
#     target = dt.datetime.now(dt.timezone.utc)+S5
#     while True:
#         now = dt.datetime.now(dt.timezone.utc)
#         print(now, _hash)
#         time.sleep((target-now).total_seconds()-0.005)
#         target += S5


# print('test When this is printed')
