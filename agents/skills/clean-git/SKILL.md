---
name: clean-git
description: Gestione sicura del version control Git con rami dedicati e commit semantici
---

# Regole Git
1. Non committare mai direttamente sul ramo principale (main/master). Crea sempre un feature branch (`feat/...`, `fix/...`).
2. Usa il formato Conventional Commits (`feat:`, `fix:`, `refactor:`, `chore:`, `test:`).
3. Prima di eseguire un commit, analizza `git diff` ed escludi file temporanei, build artifact o file `.env`.
4. I messaggi di commit devono essere descrittivi ed esporre chiaramente il "perché" della modifica.
