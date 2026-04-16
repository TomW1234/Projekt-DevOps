from main import add, get_values_from_env

def test_get_values_from_env(monkeypatch):
    monkeypatch.setenv("A", "10")
    monkeypatch.setenv("B", "30")

    a, b = get_values_from_env()

    assert a == 10.0
    assert b == 30.0
    assert add(a, b) == 40.0
