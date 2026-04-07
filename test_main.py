from main import add, get_values_from_env

def test_get_values_from_env(monkeypatch):
    monkeypatch.setenv("A", "15")
    monkeypatch.setenv("B", "25")

    a, b = get_values_from_env()

    assert a == 15.0
    assert b == 25.0
    assert add(a, b) == 40.0
