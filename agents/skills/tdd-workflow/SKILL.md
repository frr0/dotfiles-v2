---
name: tdd-workflow
description: Applica rigorosamente il Test-Driven Development (TDD) per ogni implementazione o bugfix
---

# Regole Operative TDD
1. **Red**: Prima di modificare la logica applicativa, scrivi o aggiorna i test unitari/integrazione relativi al requisito.
2. Esegui i test e verifica che falliscano per il motivo atteso.
3. **Green**: Scrivi la quantità minima di codice necessaria per far superare i test con successo.
4. **Refactor**: Ottimizza struttura e leggibilità del codice assicurandoti che i test rimangano verdi.
5. Non contrassegnare mai un task come completato finché l'intera suite di test non passa.
