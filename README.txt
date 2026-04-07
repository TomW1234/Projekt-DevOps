# Python projekt

Jednoduchý projekt, který načte hodnoty `A` a `B` ze souboru `.env`, sečte je a vypíše výsledek.

## Soubory

- `main.py` - načte `.env` a vypíše `A + B`
- `.env` - obsahuje `A`, `B` a `PYTHON_VERSION`
- `requirements.txt` - potřebná knihovna

## Spuštění

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python main.py
```