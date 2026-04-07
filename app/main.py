import os
from dotenv import load_dotenv

load_dotenv()

a = float(os.getenv('A', '0'))
b = float(os.getenv('B', '0'))

result = a + b

if result.is_integer():
    result = int(result)

print(result)
