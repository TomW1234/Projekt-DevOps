import os
from dotenv import load_dotenv
#load_dotenv()


def add(a, b):
    return a + b


def get_values_from_env():
    a = float(os.getenv("A", "0"))
    b = float(os.getenv("B", "0"))
    return a, b


if __name__ == "__main__":
    a, b = get_values_from_env()
    result = add(a, b)
    if result.is_integer():
        result = int(result)
    print(result)
