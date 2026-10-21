# Guida Completa Keybindings VS Code (LazyVim + WhichKey + Pre-esistenti)

File di configurazione collegati:
- **Keybindings VS Code**: [`~/.config/Code/User/keybindings.json`](file:///home/francesco/.config/Code/User/keybindings.json)
- **Settings & WhichKey**: [`~/.config/Code/User/settings.json`](file:///home/francesco/.config/Code/User/settings.json)
- **Vimrc locale (caricato da VSCodeVim)**: [`~/.vimrc`](file:///home/francesco/.vimrc)

---

## Indice
1. [Come funziona `Alt` (Leader Key & WhichKey)](#1-come-funziona-alt-leader-key--whichkey)
2. [Comandi Diretti Top-Level (`Alt + <tasto>`)](#2-comandi-diretti-top-level-alt--tasto)
3. [Menu WhichKey Completi (`Alt + <gruppo> + <tasto>`)](#3-menu-whichkey-completi-alt--gruppo--tasto)
   - [`Alt + a` — +ai (Antigravity, Copilot, Gemini)](#31-alt--a--ai-antigravity--copilot--gemini)
   - [`Alt + b` — +buffer (Editor & Tab Aperti)](#32-alt--b--buffer)
   - [`Alt + c` — +code (LSP, Azioni Codice, Formattazione)](#33-alt--c--code)
   - [`Alt + d` — +debug (Debugger)](#34-alt--d--debug)
   - [`Alt + f` — +file/find (File, Progetti, Config)](#35-alt--f--filefind)
   - [`Alt + g` — +git (Source Control & GitLens)](#36-alt--g--git)
   - [`Alt + p` — +panel (Pannello Inferiore: Terminal, Output, SQL, Ports, Problems)](#37-alt--p--panel-pannello-inferiore)
   - [`Alt + q` — +quit/session (Chiusura & Reload)](#38-alt--q--quitsession)
   - [`Alt + s` — +search (Ricerca & Sostituzione)](#39-alt--s--search)
   - [`Alt + t` — +terminal/test (Terminali & Test)](#310-alt--t--terminaltest)
   - [`Alt + u` — +ui (Interfaccia, Temi, Layout)](#311-alt--u--ui)
   - [`Alt + v` — +views/sidebars (Tutte le Sidebar SX e DX)](#312-alt--v--viewssidebars-tutte-le-sidebar-sx-e-dx)
   - [`Alt + w` — +windows (Split e Finestre)](#313-alt--w--windows)
   - [`Alt + x` — +diagnostics/quickfix (Errori & Problemi)](#314-alt--x--diagnosticsquickfix)
4. [Scorciatoie Globali Non-Leader (Finestre, Buffer, Editor, Terminale)](#4-scorciatoie-globali-non-leader)
5. [File Explorer (Stile Neo-tree)](#5-file-explorer-stile-neo-tree)
6. [Autocomplete, QuickOpen e Navigazione Menu](#6-autocomplete-quickopen-e-navigazione-menu)
7. [Keybindings Pre-esistenti Attivi (`settings.json` & `~/.vimrc`)](#7-keybindings-pre-esistenti-attivi-settingsjson--vimrc)
8. [Keybindings Pre-esistenti nel Vecchio `keybindings.json` (Archivio Storico)](#8-keybindings-pre-esistenti-nel-vecchio-keybindingsjson-archivio-storico)
9. [Scorciatoie Standard Vim / Neovim / VSCode (Gia' Incluse di Default)](#9-scorciatoie-standard-vim--neovim--vscode-gia-incluse-di-default)

---

## 1. Come funziona `Alt` (Leader Key & WhichKey)

- **`Alt + Space`**: apre il **Menu Principale (Root) di WhichKey** mostrando tutti i gruppi e i comandi disponibili.
- **`Alt + <lettera gruppo>`** (es. `Alt + f`, `Alt + v`, `Alt + p`, `Alt + g`): apre **direttamente il sottomenu WhichKey** corrispondente.
- **Secondo tasto (2 modalita' supportate)**:
  1. **Rilasciando `Alt`**: premi `Alt + f`, rilasci `Alt`, poi premi `f` (oppure `r`, `s`, ecc.).
  2. **Tenendo premuto `Alt`**: premi `Alt + f` e poi `Alt + f` senza mai lasciare `Alt`.
- **Navigazione dentro WhichKey**:
  - `Backspace`: torna al livello precedente del menu (`whichkey.undoKey`)
  - `Ctrl + h`: cerca un keybinding per nome dentro WhichKey (`whichkey.searchBindings`)
  - `Ctrl + j` / `Ctrl + k`: scorri in basso / in alto tra le voci del menu
  - `Esc`: chiude il menu WhichKey

---

## 2. Comandi Diretti Top-Level (`Alt + <tasto>`)

| Scorciatoia | Equivalente LazyVim | Azione | Comando VS Code |
| :--- | :--- | :--- | :--- |
| **`Alt + Space`** | `<leader>` | Apre il menu principale WhichKey | `whichkey.show` |
| **`Alt + Space` $\rightarrow$ `Space`** | `<leader><space>` | Trova file nel progetto (Find Files) | `workbench.action.quickOpen` |
| **`Alt + ,`** | `<leader>,` | Cambia Buffer ( ordinati per uso recente) | `workbench.action.showAllEditorsByMostRecentlyUsed` |
| **`Alt + /`** | `<leader>/` | Cerca testo in tutti i file (Live Grep) | `workbench.action.findInFiles` |
| **`Alt + :`** (`Alt+Shift+;`) | `<leader>:` | Command Palette | `workbench.action.showCommands` |
| **`Alt + .`** | `<leader>.` | Ripeti l'ultima azione eseguita con WhichKey | `whichkey.repeatMostRecent` |
| **`` Alt + ` ``** | `` <leader>` `` | Passa all'ultimo buffer visitato (Other Buffer) | `workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup` |
| **`Alt + e`** | `<leader>e` | Apri / Mostra / Nascondi Sidebar Explorer | `workbench.view.explorer` / `workbench.action.toggleSidebarVisibility` |
| **`Alt + Shift + e`** | `<leader>E` | Rivela e seleziona il file attivo nell'Explorer | `workbench.files.action.focusFilesExplorer` |
| **`Alt + [`** | `<leader>[` | Mostra / Nascondi Sidebar Sinistra (Primary Side Bar) | `workbench.action.toggleSidebarVisibility` |
| **`Alt + ]`** | `<leader>]` | Mostra / Nascondi Sidebar Destra (Auxiliary Bar) | `workbench.action.toggleAuxiliaryBar` |
| **`Alt + l`** | `<leader>l` | Apri vista Estensioni (Lazy) | `workbench.view.extensions` |

---

## 3. Menu WhichKey Completi (`Alt + <gruppo> + <tasto>`)

### 3.1 `Alt + a` — `+ai` (Antigravity / Copilot / Gemini)
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + a` $\rightarrow$ `a`** | Antigravity Sidebar | `workbench.view.extension.antigravity-sidebar` |
| **`Alt + a` $\rightarrow$ `c`** | Copilot / Chat (Right Sidebar) | `workbench.action.chat.open` |
| **`Alt + a` $\rightarrow$ `i`** | Inline Chat (nell'editor) | `inlineChat.start` |
| **`Alt + a` $\rightarrow$ `g`** | Gemini Code Assist Chat | `workbench.view.extension.geminiChat` |
| **`Alt + a` $\rightarrow$ `o`** | Gemini Outline | `workbench.view.extension.geminiOutline` |
| **`Alt + a` $\rightarrow$ `r`** | Mostra/Nascondi Sidebar Destra (Auxiliary Bar) | `workbench.action.toggleAuxiliaryBar` |

---

### 3.2 `Alt + b` — `+buffer`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + b` $\rightarrow$ `b`** | Switch to Other Buffer (Buffer precedente) | `workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup` |
| **`Alt + b` $\rightarrow$ `d`** | Delete Buffer (Chiudi file attivo) | `workbench.action.closeActiveEditor` |
| **`Alt + b` $\rightarrow$ `D`** (`Shift+d`) | Delete Buffer and Window (Chiudi file e gruppo) | `workbench.action.closeEditorsAndGroup` |
| **`Alt + b` $\rightarrow$ `o`** | Delete Other Buffers (Chiudi tutti gli altri) | `workbench.action.closeOtherEditors` |
| **`Alt + b` $\rightarrow$ `p`** | Pin Buffer (Fissa tab) | `workbench.action.pinEditor` |
| **`Alt + b` $\rightarrow$ `P`** (`Shift+p`) | Unpin Buffer (Sblocca tab) | `workbench.action.unpinEditor` |
| **`Alt + b` $\rightarrow$ `l`** | Delete Buffers to the Left (Chiudi tab a sinistra) | `workbench.action.closeEditorsToTheLeft` |
| **`Alt + b` $\rightarrow$ `r`** | Delete Buffers to the Right (Chiudi tab a destra) | `workbench.action.closeEditorsToTheRight` |
| **`Alt + b` $\rightarrow$ `a`** | Delete All Buffers (Chiudi tutti i file) | `workbench.action.closeAllEditors` |
| **`Alt + b` $\rightarrow$ `s`** | Save Buffer (Salva file attivo) | `workbench.action.files.save` |

---

### 3.3 `Alt + c` — `+code`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + c` $\rightarrow$ `a`** | Code Action (Quick Fix) | `editor.action.quickFix` |
| **`Alt + c` $\rightarrow$ `A`** (`Shift+a`) | Source Action | `editor.action.sourceAction` |
| **`Alt + c` $\rightarrow$ `f`** | Format Document (Formatta file) | `editor.action.formatDocument` |
| **`Alt + c` $\rightarrow$ `r`** | Rename Symbol (Rinomina variabile/classe/metodo) | `editor.action.rename` |
| **`Alt + c` $\rightarrow$ `d`** | Line Diagnostics / Show Hover | `editor.action.showHover` |
| **`Alt + c` $\rightarrow$ `s`** | Goto Symbol in File (Outline) | `workbench.action.gotoSymbol` |
| **`Alt + c` $\rightarrow$ `S`** (`Shift+s`) | Goto Symbol in Workspace | `workbench.action.showAllSymbols` |
| **`Alt + c` $\rightarrow$ `i`** | Organize Imports | `editor.action.organizeImports` |

---

### 3.4 `Alt + d` — `+debug`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + d` $\rightarrow$ `b`** | Toggle Breakpoint | `editor.debug.action.toggleBreakpoint` |
| **`Alt + d` $\rightarrow$ `s`** | Start Debugging | `workbench.action.debug.start` |
| **`Alt + d` $\rightarrow$ `c`** | Continue | `workbench.action.debug.continue` |
| **`Alt + d` $\rightarrow$ `i`** | Step Into | `workbench.action.debug.stepInto` |
| **`Alt + d` $\rightarrow$ `o`** | Step Out | `workbench.action.debug.stepOut` |
| **`Alt + d` $\rightarrow$ `O`** (`Shift+o`) | Step Over | `workbench.action.debug.stepOver` |
| **`Alt + d` $\rightarrow$ `p`** | Pause | `workbench.action.debug.pause` |
| **`Alt + d` $\rightarrow$ `r`** | Restart Debugging | `workbench.action.debug.restart` |
| **`Alt + d` $\rightarrow$ `t`** | Terminate / Stop Debugging | `workbench.action.debug.stop` |
| **`Alt + d` $\rightarrow$ `u`** | Debug UI (Apri Sidebar Debug) | `workbench.view.debug` |

---

### 3.5 `Alt + f` — `+file/find`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + f` $\rightarrow$ `f`** | Find Files (Cerca file per nome) | `workbench.action.quickOpen` |
| **`Alt + f` $\rightarrow$ `n`** | New File (Nuovo file senza titolo) | `workbench.action.files.newUntitledFile` |
| **`Alt + f` $\rightarrow$ `r`** | Recent Files (File e progetti recenti) | `workbench.action.openRecent` |
| **`Alt + f` $\rightarrow$ `b`** | Buffers (Lista tutti gli editor aperti) | `workbench.action.showAllEditors` |
| **`Alt + f` $\rightarrow$ `c`** | Find Config File (Apri `settings.json`) | `workbench.action.openSettingsJson` |
| **`Alt + f` $\rightarrow$ `k`** | Find Keybindings File (Apri `keybindings.json`) | `workbench.action.openGlobalKeybindingsFile` |
| **`Alt + f` $\rightarrow$ `p`** | Open Project / Folder (Apri cartella) | `workbench.action.files.openFolder` |
| **`Alt + f` $\rightarrow$ `s`** | Save File (Salva file corrente) | `workbench.action.files.save` |
| **`Alt + f` $\rightarrow$ `S`** (`Shift+s`) | Save All Files (Salva tutti i file) | `workbench.action.files.saveAll` |
| **`Alt + f` $\rightarrow$ `e`** | Explorer (Focus sulla sidebar File) | `workbench.view.explorer` |
| **`Alt + f` $\rightarrow$ `t`** | Terminal (Mostra/Nascondi Terminale) | `workbench.action.terminal.toggleTerminal` |

---

### 3.6 `Alt + g` — `+git`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + g` $\rightarrow$ `g`** | Source Control (Git Status Sidebar) | `workbench.view.scm` |
| **`Alt + g` $\rightarrow$ `c`** | Git Commit | `git.commit` |
| **`Alt + g` $\rightarrow$ `p`** | Git Push | `git.push` |
| **`Alt + g` $\rightarrow$ `P`** (`Shift+p`) | Git Pull | `git.pull` |
| **`Alt + g` $\rightarrow$ `f`** | Git Fetch | `git.fetch` |
| **`Alt + g` $\rightarrow$ `b`** | Checkout Branch | `git.checkout` |
| **`Alt + g` $\rightarrow$ `B`** (`Shift+b`) | Toggle Line Blame (GitLens) | `gitlens.toggleLineBlame` |
| **`Alt + g` $\rightarrow$ `d`** | Diff File (Apri modifiche file corrente) | `git.openChange` |
| **`Alt + g` $\rightarrow$ `s`** | Stage File | `git.stage` |
| **`Alt + g` $\rightarrow$ `u`** | Unstage File | `git.unstage` |
| **`Alt + g` $\rightarrow$ `r`** | Revert / Clean File (Annulla modifiche) | `git.clean` |
| **`Alt + g` $\rightarrow$ `l`** | Git Log / History | `git.viewHistory` |

---

### 3.7 `Alt + p` — `+panel` (Pannello Inferiore)
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + p` $\rightarrow$ `p`** | Mostra / Nascondi Pannello Inferiore | `workbench.action.togglePanel` |
| **`Alt + p` $\rightarrow$ `m`** | Massimizza / Ripristina Pannello Inferiore | `workbench.action.toggleMaximizedPanel` |
| **`Alt + p` $\rightarrow$ `t`** | **Terminal** | `workbench.action.terminal.focus` |
| **`Alt + p` $\rightarrow$ `x`** | **Problems** (Errori e Warning) | `workbench.actions.view.problems` |
| **`Alt + p` $\rightarrow$ `o`** | **Output** | `workbench.action.output.toggleOutput` |
| **`Alt + p` $\rightarrow$ `d`** | **Debug Console** | `workbench.debug.action.toggleRepl` |
| **`Alt + p` $\rightarrow$ `r`** | **Ports** (Forwarded Ports) | `remote.forwardedPorts.focus` |
| **`Alt + p` $\rightarrow$ `h`** | **SQL History** (Oracle SQL Developer) | `workbench.view.extension.sqldeveloper-sqlHistoryPanel` |
| **`Alt + p` $\rightarrow$ `H`** (`Shift+h`) | **SQL History** (Database Client) | `workbench.view.extension.github-dbclient-history` |
| **`Alt + p` $\rightarrow$ `q`** | **SQL Query Result** (Oracle SQL Developer) | `workbench.view.extension.sqldeveloper-queryResultPanel` |
| **`Alt + p` $\rightarrow$ `Q`** (`Shift+q`) | **SQL Query Results** (Google Cloud DataCloud) | `workbench.view.extension.sql-query-results-panel` |
| **`Alt + p` $\rightarrow$ `s`** | **SQL Script Output** (Oracle SQL Developer) | `workbench.view.extension.sqldeveloper-scriptOutputPanel` |
| **`Alt + p` $\rightarrow$ `e`** | **SQL Explain Plan** (Oracle SQL Developer) | `workbench.view.extension.sqldeveloper-explainPlanPanel` |
| **`Alt + p` $\rightarrow$ `a`** | **SQL Autotrace** (Oracle SQL Developer) | `workbench.view.extension.sqldeveloper-autotracePanel` |
| **`Alt + p` $\rightarrow$ `k`** | **SQL Task Monitor** (Oracle SQL Developer) | `workbench.view.extension.sqldeveloper-taskMonitorPanel` |
| **`Alt + p` $\rightarrow$ `v`** | **SQL Variables** (Database Client) | `workbench.view.extension.dbclient-variable-config-view` |
| **`Alt + p` $\rightarrow$ `f`** | **DB Full-Text Search** (Database Client) | `workbench.view.extension.dbclient-search-result` |
| **`Alt + p` $\rightarrow$ `g`** | **GitLens Graph** (Pannello Inferiore) | `workbench.view.extension.gitlensPanel` |
| **`Alt + p` $\rightarrow$ `j`** | **Jupyter Variables** | `workbench.view.extension.jupyter-variables` |
| **`Alt + p` $\rightarrow$ `u`** | **Serial Monitor** | `workbench.view.extension.vscode-serial-monitor-tools` |

---

### 3.8 `Alt + q` — `+quit/session`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + q` $\rightarrow$ `q`** | Quit VS Code (Chiudi applicazione) | `workbench.action.quit` |
| **`Alt + q` $\rightarrow$ `w`** | Close Window (Chiudi finestra corrente) | `workbench.action.closeWindow` |
| **`Alt + q` $\rightarrow$ `f`** | Close Folder (Chiudi cartella/progetto) | `workbench.action.closeFolder` |
| **`Alt + q` $\rightarrow$ `r`** | Reload Window (Ricarica finestra VS Code) | `workbench.action.reloadWindow` |

---

### 3.9 `Alt + s` — `+search`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + s` $\rightarrow$ `g`** | Grep (Cerca testo nel progetto) | `workbench.action.findInFiles` |
| **`Alt + s` $\rightarrow$ `w`** | Word in Files (Cerca parola sotto il cursore nel progetto) | `editor.action.addSelectionToNextFindMatch` + `workbench.action.findInFiles` |
| **`Alt + s` $\rightarrow$ `b`** | Buffer Lines (Cerca nel file corrente) | `actions.find` |
| **`Alt + s` $\rightarrow$ `r`** | Replace in Files (Cerca e sostituisci nel progetto) | `workbench.action.replaceInFiles` |
| **`Alt + s` $\rightarrow$ `R`** (`Shift+r`) | Replace in Buffer (Cerca e sostituisci nel file corrente) | `editor.action.startFindReplaceAction` |
| **`Alt + s` $\rightarrow$ `s`** | Goto Symbol (Simboli nel file) | `workbench.action.gotoSymbol` |
| **`Alt + s` $\rightarrow$ `S`** (`Shift+s`) | Goto Symbol Workspace (Simboli nel progetto) | `workbench.action.showAllSymbols` |
| **`Alt + s` $\rightarrow$ `c`** | Commands (Command Palette) | `workbench.action.showCommands` |
| **`Alt + s` $\rightarrow$ `d`** | Diagnostics (Pannello Problems) | `workbench.actions.view.problems` |
| **`Alt + s` $\rightarrow$ `k`** | Keymaps (Editor visuale scorciatoie) | `workbench.action.openGlobalKeybindings` |
| **`Alt + s` $\rightarrow$ `u`** | Colorscheme (Seleziona Tema Colori) | `workbench.action.selectTheme` |

---

### 3.10 `Alt + t` — `+terminal/test`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + t` $\rightarrow$ `t`** | Toggle Terminal | `workbench.action.terminal.toggleTerminal` |
| **`Alt + t` $\rightarrow$ `n`** | New Terminal (Crea nuovo terminale) | `workbench.action.terminal.new` |
| **`Alt + t` $\rightarrow$ `f`** | Focus Terminal | `workbench.action.terminal.focus` |
| **`Alt + t` $\rightarrow$ `m`** | Maximize Panel (Massimizza pannello terminale) | `workbench.action.toggleMaximizedPanel` |
| **`Alt + t` $\rightarrow$ `s`** | Split Terminal (Dividi terminale) | `workbench.action.terminal.split` |
| **`Alt + t` $\rightarrow$ `k`** | Kill Terminal (Termina istanza terminale) | `workbench.action.terminal.kill` |
| **`Alt + t` $\rightarrow$ `r`** | Run All Tests (Esegui tutti i test) | `testing.runAll` |
| **`Alt + t` $\rightarrow$ `c`** | Run Test at Cursor (Esegui test sotto il cursore) | `testing.runAtCursor` |

---

### 3.11 `Alt + u` — `+ui`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + u` $\rightarrow$ `c`** | Colorscheme (Cambia tema) | `workbench.action.selectTheme` |
| **`Alt + u` $\rightarrow$ `w`** | Toggle Word Wrap (A capo automatico) | `editor.action.toggleWordWrap` |
| **`Alt + u` $\rightarrow$ `m`** | Toggle Minimap | `editor.action.toggleMinimap` |
| **`Alt + u` $\rightarrow$ `s`** | Toggle Sticky Scroll | `editor.action.toggleStickyScroll` |
| **`Alt + u` $\rightarrow$ `z`** | Toggle Zen Mode | `workbench.action.toggleZenMode` |
| **`Alt + u` $\rightarrow$ `b`** | Toggle Left Sidebar | `workbench.action.toggleSidebarVisibility` |
| **`Alt + u` $\rightarrow$ `r`** | Toggle Right Sidebar (Auxiliary Bar) | `workbench.action.toggleAuxiliaryBar` |
| **`Alt + u` $\rightarrow$ `p`** | Toggle Bottom Panel | `workbench.action.togglePanel` |
| **`Alt + u` $\rightarrow$ `f`** | Toggle Full Screen | `workbench.action.toggleFullScreen` |

---

### 3.12 `Alt + v` — `+views/sidebars` (Tutte le Sidebar SX e DX)
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + v` $\rightarrow$ `e`** | **Explorer** (Files) | `workbench.view.explorer` |
| **`Alt + v` $\rightarrow$ `s`** | **Search** | `workbench.view.search` |
| **`Alt + v` $\rightarrow$ `g`** | **Git** (Source Control) | `workbench.view.scm` |
| **`Alt + v` $\rightarrow$ `G`** (`Shift+g`) | **GitLens** Sidebar | `workbench.view.extension.gitlens` |
| **`Alt + v` $\rightarrow$ `i`** | **GitLens Inspect** | `workbench.view.extension.gitlensInspect` |
| **`Alt + v` $\rightarrow$ `p`** | **GitHub Pull Requests & Issues** | `workbench.view.extension.github-pull-requests` |
| **`Alt + v` $\rightarrow$ `d`** | **Run & Debug** | `workbench.view.debug` |
| **`Alt + v` $\rightarrow$ `t`** | **Testing** | `workbench.view.testing.focus` |
| **`Alt + v` $\rightarrow$ `x`** | **Extensions** | `workbench.view.extensions` |
| **`Alt + v` $\rightarrow$ `a`** | **Antigravity** | `workbench.view.extension.antigravity-sidebar` |
| **`Alt + v` $\rightarrow$ `c`** | **Copilot / Chat** (Right Sidebar) | `workbench.action.chat.open` |
| **`Alt + v` $\rightarrow$ `m`** | **Gemini Code Assist** | `workbench.view.extension.geminiChat` |
| **`Alt + v` $\rightarrow$ `b`** | **Database Client** (MySQL / Postgres / SQLite) | `workbench.view.extension.github-cweijan-mysql` |
| **`Alt + v` $\rightarrow$ `n`** | **Database NoSQL / Redis / Service** | `workbench.view.extension.github-cweijan-nosql` |
| **`Alt + v` $\rightarrow$ `h`** | **Database SQL History** (Sidebar) | `workbench.view.extension.github-dbclient-history` |
| **`Alt + v` $\rightarrow$ `o`** | **Oracle SQL Developer** | `workbench.view.extension.sqldeveloper-explorer` |
| **`Alt + v` $\rightarrow$ `D`** (`Shift+d`) | **Containers / Docker** | `workbench.view.extension.containersView` |
| **`Alt + v` $\rightarrow$ `k`** | **Kubernetes** | `workbench.view.extension.kubernetesView` |
| **`Alt + v` $\rightarrow$ `r`** | **Remote Explorer** (SSH / WSL / Containers) | `workbench.view.remote` |
| **`Alt + v` $\rightarrow$ `S`** (`Shift+s`) | **Spring Boot Dashboard** | `workbench.view.extension.spring` |
| **`Alt + v` $\rightarrow$ `j`** | **Gradle Projects** | `workbench.view.extension.gradleContainerView` |
| **`Alt + v` $\rightarrow$ `y`** | **Python Environments** | `workbench.view.extension.python` |
| **`Alt + v` $\rightarrow$ `J`** (`Shift+j`) | **Jupyter** Sidebar | `workbench.view.extension.jupyter` |
| **`Alt + v` $\rightarrow$ `l`** | **LaTeX Workshop** | `workbench.view.extension.latex-workshop-activitybar` |
| **`Alt + v` $\rightarrow$ `O`** (`Shift+o`) | **Overleaf Workshop** | `workbench.view.extension.overleaf-workshop` |
| **`Alt + v` $\rightarrow$ `C`** (`Shift+c`) | **CMake** | `workbench.view.extension.cmake-view` |
| **`Alt + v` $\rightarrow$ `M`** (`Shift+m`) | **Makefile** | `workbench.view.extension.makefile__viewContainer` |
| **`Alt + v` $\rightarrow$ `L`** (`Shift+l`) | **Live Share** | `workbench.view.extension.liveshare` |
| **`Alt + v` $\rightarrow$ `[`** | Mostra / Nascondi **Sidebar SX** | `workbench.action.toggleSidebarVisibility` |
| **`Alt + v` $\rightarrow$ `]`** | Mostra / Nascondi **Sidebar DX** | `workbench.action.toggleAuxiliaryBar` |

---

### 3.13 `Alt + w` — `+windows`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + w` $\rightarrow$ `w`** | Other Window (Passa al gruppo editor successivo) | `workbench.action.focusNextGroup` |
| **`Alt + w` $\rightarrow$ `d`** | Delete Window (Chiudi gruppo editor) | `workbench.action.closeEditorsAndGroup` |
| **`Alt + w` $\rightarrow$ `-`** / **`s`** | Split Window Below (Dividi in basso) | `workbench.action.splitEditorDown` |
| **`Alt + w` $\rightarrow$ `\|`** / **`\`** / **`v`** | Split Window Right (Dividi a destra) | `workbench.action.splitEditorRight` |
| **`Alt + w` $\rightarrow$ `m`** | Maximize Window Toggle | `workbench.action.toggleMaximizeEditorGroup` |
| **`Alt + w` $\rightarrow$ `=`** | Balance Windows (Equilibra larghezze) | `workbench.action.evenEditorWidths` |
| **`Alt + w` $\rightarrow$ `h`** | Go to Left Window | `workbench.action.navigateLeft` |
| **`Alt + w` $\rightarrow$ `j`** | Go to Lower Window | `workbench.action.navigateDown` |
| **`Alt + w` $\rightarrow$ `k`** | Go to Upper Window | `workbench.action.navigateUp` |
| **`Alt + w` $\rightarrow$ `l`** | Go to Right Window | `workbench.action.navigateRight` |

---

### 3.14 `Alt + x` — `+diagnostics/quickfix`
| Sequenza | Nome | Comando VS Code |
| :--- | :--- | :--- |
| **`Alt + x` $\rightarrow$ `x`** | Diagnostics (Apri pannello Problems) | `workbench.actions.view.problems` |
| **`Alt + x` $\rightarrow$ `j`** | Next Diagnostic (Errore successivo nel progetto) | `editor.action.marker.nextInFiles` |
| **`Alt + x` $\rightarrow$ `k`** | Prev Diagnostic (Errore precedente nel progetto) | `editor.action.marker.prevInFiles` |
| **`Alt + x` $\rightarrow$ `n`** | Next Diagnostic in File | `editor.action.marker.next` |
| **`Alt + x` $\rightarrow$ `p`** | Prev Diagnostic in File | `editor.action.marker.prev` |
| **`Alt + x` $\rightarrow$ `o`** | Output Panel | `workbench.action.output.toggleOutput` |

---

## 4. Scorciatoie Globali Non-Leader

| Scorciatoia | Contesto (`when`) | Azione | Comando VS Code |
| :--- | :--- | :--- | :--- |
| **`Ctrl + h`** | Globale (`!whichkeyVisible`) | Sposta focus a sinistra (Editor / Sidebar) | `workbench.action.navigateLeft` |
| **`Ctrl + l`** | Globale / Sidebar | Sposta focus a destra (o torna all'Editor dalla Sidebar) | `workbench.action.navigateRight` / `focusActiveEditorGroup` |
| **`Ctrl + k`** | Globale / Terminale | Sposta focus in alto (o torna all'Editor dal Terminale) | `workbench.action.navigateUp` / `focusActiveEditorGroup` |
| **`Ctrl + j`** | Globale | Sposta focus in basso (Editor $\rightarrow$ Terminale/Pannello) | `workbench.action.navigateDown` |
| **`Ctrl + Up`** | Globale | Aumenta altezza vista corrente | `workbench.action.increaseViewHeight` |
| **`Ctrl + Down`** | Globale | Riduci altezza vista corrente | `workbench.action.decreaseViewHeight` |
| **`Ctrl + Right`** | Globale | Aumenta larghezza vista corrente | `workbench.action.increaseViewWidth` |
| **`Ctrl + Left`** | Globale | Riduci larghezza vista corrente | `workbench.action.decreaseViewWidth` |
| **`Shift + h`** | Editor (Normal mode) | Buffer / Tab precedente | `workbench.action.previousEditor` |
| **`Shift + l`** | Editor (Normal mode) | Buffer / Tab successivo | `workbench.action.nextEditor` |
| **`Shift + k`** | Editor (Normal mode) | Mostra documentazione / Hover LSP | `editor.action.showHover` |
| **`Ctrl + /`** | Globale | Mostra / Nascondi Terminale integrato | `workbench.action.terminal.toggleTerminal` |
| **`Ctrl + s`** | Globale | Salva file | `workbench.action.files.save` |

---

## 5. File Explorer (Stile Neo-tree)

Attivi quando il focus e' nella sidebar **Explorer** (`filesExplorerFocus && !inputFocus`):

| Tasto | Azione | Comando VS Code |
| :--- | :--- | :--- |
| **`j`** | Muovi giu' nella lista file | `list.focusDown` |
| **`k`** | Muovi su nella lista file | `list.focusUp` |
| **`l`** / **`Enter`** | Apri file o espandi cartella selezionata | `list.select` |
| **`h`** | Chiudi / comprimi cartella | `list.collapse` |
| **`o`** | Espandi / comprimi cartella | `list.toggleExpand` |
| **`a`** | Crea **nuovo file** | `explorer.newFile` |
| **`Shift + a`** | Crea **nuova cartella** | `explorer.newFolder` |
| **`r`** | Rinomina file o cartella | `renameFile` |
| **`d`** | Elimina file o cartella | `deleteFile` |
| **`y`** | Copia file o cartella | `filesExplorer.copy` |
| **`x`** | Taglia file o cartella | `filesExplorer.cut` |
| **`p`** | Incolla file o cartella | `filesExplorer.paste` |
| **`c`** | Copia percorso relativo del file | `copyRelativeFilePath` |
| **`/`** | Cerca / filtra file nell'albero | `list.find` |

---

## 6. Autocomplete, QuickOpen e Navigazione Menu

| Scorciatoia | Contesto | Azione |
| :--- | :--- | :--- |
| **`Ctrl + j`** / **`Tab`** | Menu suggerimenti codice (`suggestWidgetVisible`) | Suggerimento successivo |
| **`Ctrl + k`** / **`Shift + Tab`** | Menu suggerimenti codice (`suggestWidgetVisible`) | Suggerimento precedente |
| **`Ctrl + j`** | QuickOpen / Command Palette (`inQuickOpen`) | Elemento successivo |
| **`Ctrl + k`** | QuickOpen / Command Palette (`inQuickOpen`) | Elemento precedente |
| **`Ctrl + h`** | Menu WhichKey (`whichkeyVisible`) | Cerca tra tutti i keybindings di WhichKey |
| **`Backspace`** | Menu WhichKey (`whichkeyVisible`) | Torna al menu precedente |

---

## 7. Keybindings Pre-esistenti Attivi (`settings.json` & `~/.vimrc`)

Questi keybindings erano gia' presenti nella tua configurazione Vim (`settings.json` $\rightarrow$ `vim.normalModeKeyBindingsNonRecursive` e `~/.vimrc`) e sono stati **mantenuti**:

### 7.1 In `settings.json` (`vim.normalModeKeyBindingsNonRecursive`)
*(Nota: in `settings.json` il `"vim.leader"` di VSCodeVim e' impostato a `"<|>"`)*

| Sequenza (Normal Mode) | Azione |
| :--- | :--- |
| **`+`** | Salta al paragrafo precedente (`{`) |
| **`-`** | Salta al paragrafo successivo (`}`) |
| **`0`** | Vai a fine riga (`$`) |
| **`\`** | Vai a inizio riga (`0`) |
| **`1`** | Vai a inizio riga (`0` / `1`) |
| **`<C-w> h/j/k/l`** | Rimappato su `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` |
| **`\| w`** (`<leader>w`) | `workbench.action.splitEditor` |
| **`\| f`** (`<leader>f`) | `revealInExplorer` (o `filesExplorer.findInFolder` se nell'Explorer) |
| **`\| h`** (`<leader>h`) | Vai al primo carattere non vuoto della riga (`_`) |

### 7.2 In `~/.vimrc` (Caricato da VSCodeVim tramite `"vim.vimrc.enable": true`)

| Modalita' | Tasto | Mappatura | Descrizione |
| :--- | :--- | :--- | :--- |
| Normal / Visual | **`\`** | `0` | Inizio riga |
| Normal / Visual | **`0`** | `$` | Fine riga |
| Normal / Visual | **`+`** | `{` | Paragrafo precedente |
| Normal / Visual | **`-`** | `}` | Paragrafo successivo |
| Normal | **`gc`** | `:%s/` | Avvia ricerca e sostituzione globale |
| Normal | **`<C-h/j/k/l>`** | `<C-w>h/j/k/l` | Navigazione split Vim |
| Normal | **`<C-m>`** | `:wa \| :!make <cr>` | Salva tutto ed esegui `make` |
| Normal | **`<C-w>`** | `:vsp <cr>` | Split verticale |
| Normal | **`<C-i>`** | `:split <cr>` | Split orizzontale |
| Normal | **`Y`** | `y$` | Copia fino a fine riga |
| Normal | **`yt`** | `0y$` | Copia l'intera riga senza newline |
| Normal | **`g0`** | `gg=GGG` | Riformatta/indenta tutto il file |
| Visual | **`<`** / **`>`** | `<gv` / `>gv` | Indenta/de-indenta mantenendo la selezione |
| Insert | **`"`**, **`'`**, **`(`**, **`[`**, **`{`** | Auto-chiusura parentesi/virgolette | Inserisce la coppia e sposta il cursore al centro |

---

## 8. Keybindings Pre-esistenti nel Vecchio `keybindings.json` (Archivio Storico)

Per tua completa referenza, ecco le scorciatoie che avevi nel vecchio `keybindings.json` prima della riscrittura LazyVim e come sono state sostituite o mantenute:

| Vecchio Tasto | Comando Originale | Stato Attuale (LazyVim) |
| :--- | :--- | :--- |
| **`alt+e`** | `workbench.action.toggleSidebarVisibility` | **Mantenuto identico** (`Alt + e`) + `Alt + v -> e` |
| **`alt+g`** | `workbench.view.scm` | Ora apre il menu **+git** (`Alt + g`), e `Alt + g -> g` apre SCM |
| **`alt+f`** | `workbench.action.files.openFolder` | Ora apre il menu **+file/find** (`Alt + f`), e `Alt + f -> p` apre una cartella |
| **`alt+t`** | `workbench.action.toggleMaximizedPanel` | Ora apre **+terminal/test** (`Alt + t`), e `Alt + t -> m` (o `Alt + p -> m`) massimizza il pannello |
| **`alt+j`** | `workbench.action.togglePanel` / `terminal.focus` | Ora `Ctrl + /` oppure `Alt + t -> t` / `Alt + p -> t` |
| **`ctrl+shift+t`** | `workbench.action.togglePanel` / `terminal.focus` | Ora `Ctrl + /` oppure `Alt + p -> p` |
| **`ctrl+e`** | `workbench.view.explorer` | Ora `Alt + e` / `Alt + v -> e` |
| **`shift+ctrl+e`** | `actions.findWithSelection` | Ora `Alt + s -> w` o `Alt + s -> b` |
| **`contextmenu`** | `workbench.action.toggleMenuBar` | Sostituito da UI menu (`Alt + u`) |
| **`ctrl+h/j/k/l`** | Navigazione finestre e liste | **Mantenuti identici** |
| **`shift+k`** | `editor.action.showHover` | **Mantenuto identico** |
| **`j/k/l/h/o/a/A/r`** (Explorer) | Navigazione Neo-tree | **Mantenuti identici** (e ampliati con `d`, `y`, `x`, `p`, `c`, `/`) |
| **`tab` / `shift+tab`** | Navigazione suggerimenti | **Mantenuti identici** |

---

## 9. Scorciatoie Standard Vim / Neovim / VSCode (Gia' Incluse di Default)

Oltre ai file sopra, l'estensione **VSCodeVim / VSCode-Neovim** fornisce gia' di default queste scorciatoie in Normal Mode compatibili con LazyVim:

| Tasti (Normal Mode) | Azione |
| :--- | :--- |
| **`g d`** | Go to Definition (Vai alla definizione) |
| **`g D`** | Go to Declaration / Peek Definition |
| **`g r`** | Go to References (Trova tutti i riferimenti) |
| **`g I`** | Go to Implementation (Vai all'implementazione) |
| **`g h`** / **`K`** (`Shift+k`) | Show Hover (Mostra documentazione/tipo) |
| **`g c c`** | Commenta / Decommenta la riga corrente |
| **`g c`** (in Visual Mode) | Commenta / Decommenta il blocco selezionato |
| **`z a`** | Toggle Fold (Apri/chiudi blocco di codice) |
| **`z R`** / **`z M`** | Apri tutti i fold / Chiudi tutti i fold |
| **`u`** / **`Ctrl + r`** | Undo / Redo |
| **`/`** + testo, poi **`n`** / **`N`** | Cerca nel file, occorrenza successiva / precedente |
| **`*`** / **`#`** | Cerca la parola sotto il cursore in avanti / indietro |
| **`gg`** / **`G`** | Vai a inizio file / fine file |
| **`%`** | Salta alla parentesi corrispondente |
| **`ciw`** / **`ci"`** / **`ci(`** | Cambia parola / contenuto tra virgolette / contenuto tra parentesi |
