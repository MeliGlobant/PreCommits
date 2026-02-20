# PreCommits

Repo de pruebas para el framework **pre-commit**.

## Setup rápido

### Opción A: pip (virtualenv)

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-dev.txt
pre-commit install
```

### Opción B: pipx (recomendado)

```bash
pipx install pre-commit
pre-commit install
```

## Probar hooks

Ejecutar sobre todos los archivos:

```bash
pre-commit run --all-files
```

Ejecutar solo en los archivos staged:

```bash
pre-commit run
```

Actualizar versiones de hooks:

```bash
pre-commit autoupdate
```

## Configuración

La configuración vive en `.pre-commit-config.yaml`.
