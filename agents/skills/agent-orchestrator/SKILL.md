---
name: agent-orchestrator
description: Orchestra workflow multi-agente gratuiti, coordinando subagent specializzati, esecuzione parallela e convergenza dei risultati
---

# Free Agent Orchestrator

Questa skill definisce e coordina un sistema multi-agente completamente gratuito per la scomposizione e l'esecuzione di compiti software complessi.

## 1. Architettura del Team di Agenti

Il sistema sfrutta tre tipologie di agenti specializzati (senza costi di licenza o API a pagamento):

1. **Lead / Planner Agent**:
   - Analizza la richiesta dell'utente e redige un piano di esecuzione atomico.
   - Crea i task indipendenti e definisce i contratti di interfaccia.
2. **Worker / Implementer Subagents**:
   - Ricevono un contesto isolato (es. branch git dedicati o workspace separati).
   - Eseguono i task in parallelo senza interferenze su file condivisi.
3. **Reviewer & QA Subagent**:
   - Esegue la suite di test (TDD).
   - Verifica la conformità del codice e audit di sicurezza prima del merge.

## 2. Metodologia Operativa

1. **Decomposizione in DAG**:
   - Suddividi il problema in nodi indipendenti eseguibili in parallelo e nodi sequenziali di sincronizzazione.
2. **Esecuzione Concorrente**:
   - Assegna ciascun task parallelo a un sub-agente (tramite `invoke_subagent` nativo o orchestratori open-source come CrewAI/LangGraph/AutoGen).
3. **Controllo & Sintesi**:
   - Raccogli i feedback dai sub-agenti, verifica l'assenza di conflitti e consolida il risultato finale.
