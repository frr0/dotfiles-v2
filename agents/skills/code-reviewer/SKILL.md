---
name: code-reviewer
description: Esegue audit automatici di sicurezza, linting e tipizzazione statica prima della consegna
---

# Check di Revisione del Codice
Prima di notificare all'utente che il lavoro è concluso:
1. Esegui i linter e i type-checker del progetto (es. `tsc`, `eslint`, `ruff`, `mypy`).
2. Ispeziona le modifiche alla ricerca di credenziali esposte, chiavi API o file sensibili non ignorati.
3. Verifica la presenza di debug statements (es. `console.log`, `print`) dimenticati nel codice.
4. Assicurati che le nuove funzioni abbiano una documentazione o commenti minimi sui parametri critici.
