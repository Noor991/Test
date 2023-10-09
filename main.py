from fastapi import FastAPI
import random

app = FastAPI()

@app.get('/')
async def root():
    return {'Test':'This is a test example','data':0}

