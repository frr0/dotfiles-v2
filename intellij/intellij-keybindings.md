# Guida Completa Keybindings IntelliJ IDEA (LazyVim + Which-Key + IdeaVim + Keymap)

File di configurazione collegati:
- **IdeaVim & Which-Key Config**: [`~/.ideavimrc`](file:///home/francesco/Progetti/dotfiles/intellij/.ideavimrc)
- **IntelliJ Keymap XML**: [`VSCode _Migrated_.xml`](file:///home/francesco/Progetti/dotfiles/intellij/VSCode%20_Migrated_.xml)
- **Active Keymap Selector**: [`keymap.xml`](file:///home/francesco/Progetti/dotfiles/intellij/keymap.xml)
- **IntelliJ UI Mnemonics Disable**: [`ui.lnf.xml`](file:///home/francesco/Progetti/dotfiles/intellij/ui.lnf.xml)
- **IdeaVim Shortcut Conflicts**: [`vim_settings.xml`](file:///home/francesco/Progetti/dotfiles/intellij/vim_settings.xml)
- **Editor Font Settings**: [`editor-font.xml`](file:///home/francesco/Progetti/dotfiles/intellij/editor-font.xml)
- **Plugin IDEA Which-Key**: [`IDEA_Which-Key-0.11.2.jar`](file:///home/francesco/.local/share/JetBrains/IdeaIC2026.2/IDEA_Which-Key-0.11.2.jar)

---

## Indice
1. [Come funziona `Alt` (Leader Key & Which-Key)](#1-come-funziona-alt-leader-key--which-key)
2. [Comandi Diretti Top-Level (`Alt + <tasto>`)](#2-comandi-diretti-top-level-alt--tasto)
3. [Menu Which-Key Completi (`Alt + <gruppo> + <tasto>`)](#3-menu-which-key-completi-alt--gruppo--tasto)
   - [`Alt + a` — +ai (Antigravity, Copilot, Gemini, AI Assistant)](#31-alt--a--ai-antigravity--copilot--gemini)
   - [`Alt + b` — +buffer (Editor & Tab Aperti)](#32-alt--b--buffer)
   - [`Alt + c` — +code (LSP, Azioni Codice, Formattazione)](#33-alt--c--code)
   - [`Alt + d` — +debug (Debugger)](#34-alt--d--debug)
   - [`Alt + f` — +file/find (File, Progetti, Config)](#35-alt--f--filefind)
   - [`Alt + g` — +git (Source Control & Git)](#36-alt--g--git)
   - [`Alt + p` — +panel (Pannello Inferiore: Terminal, Output, SQL, Services, Problems)](#37-alt--p--panel-pannello-inferiore)
   - [`Alt + q` — +quit/session (Chiusura & Reload)](#38-alt--q--quitsession)
   - [`Alt + s` — +search (Ricerca & Sostituzione)](#39-alt--s--search)
   - [`Alt + t` — +terminal/test (Terminali & Test)](#310-alt--t--terminaltest)
   - [`Alt + u` — +ui (Interfaccia, Temi, Layout)](#311-alt--u--ui)
   - [`Alt + v` — +views/sidebars (Tutte le Sidebar SX e DX / Tool Windows)](#312-alt--v--viewssidebars-tutte-le-sidebar-sx-e-dx)
   - [`Alt + w` — +windows (Split e Finestre)](#313-alt--w--windows)
   - [`Alt + x` — +diagnostics/quickfix (Errori & Problemi)](#314-alt--x--diagnosticsquickfix)
4. [Scorciatoie Globali Non-Leader (Finestre, Buffer, Editor, Terminale)](#4-scorciatoie-globali-non-leader)
5. [File Explorer / Project View (Stile Neo-tree tramite NERDTree)](#5-file-explorer-stile-neo-tree)
6. [Autocomplete, Search Everywhere e Navigazione Menu](#6-autocomplete-quickopen-e-navigazione-menu)
7. [Keybindings Pre-esistenti Attivi (`~/.vimrc` & `settings.json`)](#7-keybindings-pre-esistenti-attivi)
8. [Scorciatoie Standard Vim / IdeaVim (Gia' Incluse)](#8-scorciatoie-standard-vim--ideavim)

---

## 1. Come funziona `Alt` (Leader Key & Which-Key)

- **`Alt + Space`**: apre il **Menu Principale (Root) di Which-Key** mostrando tutti i gruppi e i comandi disponibili (con ritardo `0 ms`, istantaneo come in VS Code).
- **`Alt + <lettera gruppo>`** (es. `Alt + f`, `Alt + v`, `Alt + p`, `Alt + g`): apre **direttamente il sottomenu Which-Key** corrispondente.
- **Secondo tasto (2 modalita' supportate esattamente come in VS Code)**:
  1. **Rilasciando `Alt`**: premi `Alt + f`, rilasci `Alt`, poi premi `f` (oppure `r`, `s`, ecc.).
  2. **Tenendo premuto `Alt`**: premi `Alt + f` e poi `Alt + f` senza mai lasciare `Alt`.
- **Funziona sia nell'Editor che fuori dall'Editor** (Project View, Terminale, Git, Services) grazie alla combinazione di `~/.ideavimrc` (`set ideaoutsideeditor`, `set ToolWindowNavEverywhere`) e del keymap nativo `VSCode _Migrated_.xml`.

---

## 2. Comandi Diretti Top-Level (`Alt + <tasto>`)

| Scorciatoia | Equivalente LazyVim | Azione | Action ID IntelliJ |
| :--- | :--- | :--- | :--- |
| **`Alt + Space`** | `<leader>` | Apre il menu principale Which-Key | IdeaVim + `IDEA Which-Key` |
| **`Alt + Space` $\rightarrow$ `Space`** | `<leader><space>` | Trova file nel progetto (Find Files) | `GotoFile` |
| **`Alt + ,`** | `<leader>,` | Cambia Buffer (ordinati per uso recente) | `RecentFiles` |
| **`Alt + /`** | `<leader>/` | Cerca testo in tutti i file (Live Grep) | `FindInPath` |
| **`Alt + :`** (`Alt+Shift+;`) | `<leader>:` | Command Palette (Goto Action) | `GotoAction` |
| **`Alt + .`** | `<leader>.` | Ripeti l'ultima azione eseguita | `RepeatPreviousAction` |
| **`` Alt + ` ``** | `` <leader>` `` | Passa all'ultimo buffer visitato (Other Buffer) | `Switcher` |
| **`Alt + e`** | `<leader>e` | Apri / Mostra / Nascondi Sidebar Project Explorer | `ActivateProjectToolWindow` |
| **`Alt + Shift + e`** | `<leader>E` | Rivela e seleziona il file attivo nell'Explorer | `SelectInProjectView` |
| **`Alt + [`** | `<leader>[` | Mostra / Nascondi tutte le Tool Windows | `HideAllWindows` |
| **`Alt + ]`** | `<leader>]` | Mostra / Nascondi le Sidebars laterali | `HideSideWindows` |
| **`Alt + l`** | `<leader>l` | Apri vista Plugins / Estensioni | `WelcomeScreen.Plugins` |

---

## 3. Menu Which-Key Completi (`Alt + <gruppo> + <tasto>`)

### 3.1 `Alt + a` — `+ai` (Antigravity / Copilot / Gemini)
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + a` $\rightarrow$ `a`** | Antigravity / AI Sidebar | `ActivateNotificationsToolWindow` |
| **`Alt + a` $\rightarrow$ `c`** | Copilot / Chat (Right Sidebar) | `ActivateNotificationsToolWindow` |
| **`Alt + a` $\rightarrow$ `i`** | Inline Chat / Intention Actions | `ShowIntentionActions` |
| **`Alt + a` $\rightarrow$ `g`** | Gemini Code Assist Chat | `ActivateNotificationsToolWindow` |
| **`Alt + a` $\rightarrow$ `o`** | Gemini Outline / Structure | `ActivateStructureToolWindow` |
| **`Alt + a` $\rightarrow$ `r`** | Mostra/Nascondi Sidebar | `HideSideWindows` |

---

### 3.2 `Alt + b` — `+buffer`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + b` $\rightarrow$ `b`** | Switch to Other Buffer (Buffer precedente) | `Switcher` |
| **`Alt + b` $\rightarrow$ `d`** | Delete Buffer (Chiudi file attivo) | `CloseContent` |
| **`Alt + b` $\rightarrow$ `D`** (`Shift+d`) | Delete Buffer and Window | `CloseAllEditors` |
| **`Alt + b` $\rightarrow$ `o`** | Delete Other Buffers (Chiudi tutti gli altri) | `CloseAllEditorsButActive` |
| **`Alt + b` $\rightarrow$ `p`** | Pin Buffer (Fissa tab) | `PinActiveEditorTab` |
| **`Alt + b` $\rightarrow$ `P`** (`Shift+p`) | Unpin Buffer (Sblocca tab) | `PinActiveEditorTab` |
| **`Alt + b` $\rightarrow$ `l`** | Delete Buffers to the Left (Chiudi tab a sinistra) | `CloseAllToTheLeft` |
| **`Alt + b` $\rightarrow$ `r`** | Delete Buffers to the Right (Chiudi tab a destra) | `CloseAllToTheRight` |
| **`Alt + b` $\rightarrow$ `a`** | Delete All Buffers (Chiudi tutti i file) | `CloseAllEditors` |
| **`Alt + b` $\rightarrow$ `s`** | Save Buffer (Salva file attivo) | `SaveDocument` |

---

### 3.3 `Alt + c` — `+code`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + c` $\rightarrow$ `a`** | Code Action (Quick Fix / Intentions) | `ShowIntentionActions` |
| **`Alt + c` $\rightarrow$ `A`** (`Shift+a`) | Source Action (Generate) | `Generate` |
| **`Alt + c` $\rightarrow$ `f`** | Format Document (Formatta file) | `ReformatCode` |
| **`Alt + c` $\rightarrow$ `r`** | Rename Symbol (Rinomina variabile/classe/metodo) | `RenameElement` |
| **`Alt + c` $\rightarrow$ `d`** | Line Diagnostics / Show Error Description | `ShowErrorDescription` |
| **`Alt + c` $\rightarrow$ `s`** | Goto Symbol in File (File Structure) | `FileStructurePopup` |
| **`Alt + c` $\rightarrow$ `S`** (`Shift+s`) | Goto Symbol in Workspace | `GotoSymbol` |
| **`Alt + c` $\rightarrow$ `i`** | Organize / Optimize Imports | `OptimizeImports` |

---

### 3.4 `Alt + d` — `+debug`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + d` $\rightarrow$ `b`** | Toggle Breakpoint | `ToggleLineBreakpoint` |
| **`Alt + d` $\rightarrow$ `s`** | Start Debugging | `Debug` |
| **`Alt + d` $\rightarrow$ `c`** | Continue / Resume | `Resume` |
| **`Alt + d` $\rightarrow$ `i`** | Step Into | `StepInto` |
| **`Alt + d` $\rightarrow$ `o`** | Step Out | `StepOut` |
| **`Alt + d` $\rightarrow$ `O`** (`Shift+o`) | Step Over | `StepOver` |
| **`Alt + d` $\rightarrow$ `p`** | Pause | `Pause` |
| **`Alt + d` $\rightarrow$ `r`** | Restart Debugging | `Rerun` |
| **`Alt + d` $\rightarrow$ `t`** | Terminate / Stop Debugging | `Stop` |
| **`Alt + d` $\rightarrow$ `u`** | Debug UI (Apri Tool Window Debug) | `ActivateDebugToolWindow` |

---

### 3.5 `Alt + f` — `+file/find`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + f` $\rightarrow$ `f`** | Find Files (Cerca file per nome) | `GotoFile` |
| **`Alt + f` $\rightarrow$ `n`** | New File (Nuovo Scratch File) | `NewScratchFile` |
| **`Alt + f` $\rightarrow$ `r`** | Recent Files (File e progetti recenti) | `RecentFiles` |
| **`Alt + f` $\rightarrow$ `b`** | Buffers (Lista editor aperti) | `RecentFiles` |
| **`Alt + f` $\rightarrow$ `c`** | Find Config File (Apri Settings) | `ShowSettings` |
| **`Alt + f` $\rightarrow$ `k`** | Find Keybindings File (Apri `~/.ideavimrc`) | `:e ~/.ideavimrc<CR>` |
| **`Alt + f` $\rightarrow$ `p`** | Open Project / Folder | `OpenFile` |
| **`Alt + f` $\rightarrow$ `s`** | Save File (Salva file corrente) | `SaveDocument` |
| **`Alt + f` $\rightarrow$ `S`** (`Shift+s`) | Save All Files (Salva tutti i file) | `SaveAll` |
| **`Alt + f` $\rightarrow$ `e`** | Explorer (Focus sulla sidebar Project) | `ActivateProjectToolWindow` |
| **`Alt + f` $\rightarrow$ `t`** | Terminal (Mostra/Nascondi Terminale) | `ActivateTerminalToolWindow` |

---

### 3.6 `Alt + g` — `+git`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + g` $\rightarrow$ `g`** | Source Control (Git Commit / Status) | `ActivateCommitToolWindow` |
| **`Alt + g` $\rightarrow$ `c`** | Git Commit | `CheckinProject` |
| **`Alt + g` $\rightarrow$ `p`** | Git Push | `Vcs.Push` |
| **`Alt + g` $\rightarrow$ `P`** (`Shift+p`) | Git Pull | `Git.Pull` |
| **`Alt + g` $\rightarrow$ `f`** | Git Fetch | `Git.Fetch` |
| **`Alt + g` $\rightarrow$ `b`** | Checkout Branch | `Git.Branches` |
| **`Alt + g` $\rightarrow$ `B`** (`Shift+b`) | Toggle Line Blame (Annotate) | `Annotate` |
| **`Alt + g` $\rightarrow$ `d`** | Diff File (Confronta modifiche file corrente) | `Compare.SameVersion` |
| **`Alt + g` $\rightarrow$ `s`** | Stage / Add File | `Git.Add` |
| **`Alt + g` $\rightarrow$ `u`** | Unstage / Revert File | `ChangesView.Revert` |
| **`Alt + g` $\rightarrow$ `r`** | Revert / Rollback File (Annulla modifiche) | `ChangesView.Revert` |
| **`Alt + g` $\rightarrow$ `l`** | Git Log / History | `Vcs.ShowTabbedFileHistory` |

---

### 3.7 `Alt + p` — `+panel` (Pannello Inferiore)
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + p` $\rightarrow$ `p`** | Mostra / Nascondi Pannello Inferiore | `HideActiveWindow` |
| **`Alt + p` $\rightarrow$ `m`** | Massimizza / Ripristina Pannello Inferiore | `MaximizeToolWindow` |
| **`Alt + p` $\rightarrow$ `t`** | **Terminal** | `ActivateTerminalToolWindow` |
| **`Alt + p` $\rightarrow$ `x`** | **Problems** (Errori e Warning) | `ActivateProblemsViewToolWindow` |
| **`Alt + p` $\rightarrow$ `o`** | **Output** (Run Tool Window) | `ActivateRunToolWindow` |
| **`Alt + p` $\rightarrow$ `d`** | **Debug Console** | `ActivateDebugToolWindow` |
| **`Alt + p` $\rightarrow$ `r`** | **Ports / Services** | `ActivateServicesToolWindow` |
| **`Alt + p` $\rightarrow$ `h` / `H` / `q` / `Q` / `s` / `e` / `a` / `k` / `v` / `u`** | **Services / Database Panels** | `ActivateServicesToolWindow` |
| **`Alt + p` $\rightarrow$ `f`** | **Find Tool Window** | `ActivateFindToolWindow` |
| **`Alt + p` $\rightarrow$ `g`** | **Git Log / Graph** | `ActivateVersionControlToolWindow` |
| **`Alt + p` $\rightarrow$ `j`** | **Python / Jupyter Console** | `ActivatePythonConsoleToolWindow` |

---

### 3.8 `Alt + q` — `+quit/session`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + q` $\rightarrow$ `q`** | Quit IntelliJ IDEA | `Exit` |
| **`Alt + q` $\rightarrow$ `w`** | Close Window / Project | `CloseProject` |
| **`Alt + q` $\rightarrow$ `f`** | Close Folder / Project | `CloseProject` |
| **`Alt + q` $\rightarrow$ `r`** | Reload `~/.ideavimrc` & Synchronize Files | `IdeaVim.ReloadVimRc.reload` + `Synchronize` |

---

### 3.9 `Alt + s` — `+search`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + s` $\rightarrow$ `g`** | Grep (Cerca testo nel progetto) | `FindInPath` |
| **`Alt + s` $\rightarrow$ `w`** | Word in Files (Cerca parola sotto il cursore nel progetto) | `SelectNextOccurrence` + `FindInPath` |
| **`Alt + s` $\rightarrow$ `b`** | Buffer Lines (Cerca nel file corrente) | `Find` |
| **`Alt + s` $\rightarrow$ `r`** | Replace in Files (Cerca e sostituisci nel progetto) | `ReplaceInPath` |
| **`Alt + s` $\rightarrow$ `R`** (`Shift+r`) | Replace in Buffer (Cerca e sostituisci nel file corrente) | `Replace` |
| **`Alt + s` $\rightarrow$ `s`** | Goto Symbol (Simboli nel file) | `FileStructurePopup` |
| **`Alt + s` $\rightarrow$ `S`** (`Shift+s`) | Goto Symbol Workspace (Simboli nel progetto) | `GotoSymbol` |
| **`Alt + s` $\rightarrow$ `c`** | Commands (Command Palette / Goto Action) | `GotoAction` |
| **`Alt + s` $\rightarrow$ `d`** | Diagnostics (Pannello Problems) | `ActivateProblemsViewToolWindow` |
| **`Alt + s` $\rightarrow$ `k`** | Keymaps / Settings | `ShowSettings` |
| **`Alt + s` $\rightarrow$ `u`** | Colorscheme (Quick Change Scheme) | `QuickChangeScheme` |

---

### 3.10 `Alt + t` — `+terminal/test`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + t` $\rightarrow$ `t`** | Toggle Terminal | `ActivateTerminalToolWindow` |
| **`Alt + t` $\rightarrow$ `n`** | New Terminal (Crea nuovo tab terminale) | `Terminal.NewTab` |
| **`Alt + t` $\rightarrow$ `f`** | Focus Terminal | `ActivateTerminalToolWindow` |
| **`Alt + t` $\rightarrow$ `m`** | Maximize Panel (Massimizza pannello terminale) | `MaximizeToolWindow` |
| **`Alt + t` $\rightarrow$ `s`** | Split Terminal (Dividi terminale) | `Terminal.SplitVertically` |
| **`Alt + t` $\rightarrow$ `k`** | Kill / Close Terminal Tab | `CloseActiveTab` |
| **`Alt + t` $\rightarrow$ `r`** | Run All Tests / Run | `Run` |
| **`Alt + t` $\rightarrow$ `c`** | Run Test at Cursor (Run Context / Class) | `RunClass` |

---

### 3.11 `Alt + u` — `+ui`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + u` $\rightarrow$ `c`** | Colorscheme (Cambia tema/schema) | `QuickChangeScheme` |
| **`Alt + u` $\rightarrow$ `w`** | Toggle Word Wrap (A capo automatico) | `EditorToggleUseSoftWraps` |
| **`Alt + u` $\rightarrow$ `m`** | Toggle Breadcrumbs | `EditorToggleShowBreadcrumbs` |
| **`Alt + u` $\rightarrow$ `s`** | Toggle Whitespace | `EditorToggleShowWhitespaces` |
| **`Alt + u` $\rightarrow$ `z`** | Toggle Zen Mode | `ToggleZenMode` |
| **`Alt + u` $\rightarrow$ `b`** | Toggle Left Sidebar | `HideSideWindows` |
| **`Alt + u` $\rightarrow$ `r`** | Toggle Right Sidebar | `HideSideWindows` |
| **`Alt + u` $\rightarrow$ `p`** | Toggle Bottom Panel | `HideActiveWindow` |
| **`Alt + u` $\rightarrow$ `f`** | Toggle Full Screen | `ToggleFullScreen` |

---

### 3.12 `Alt + v` — `+views/sidebars` (Tutte le Sidebar SX e DX / Tool Windows)
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + v` $\rightarrow$ `e`** | **Explorer** (Project Files) | `ActivateProjectToolWindow` |
| **`Alt + v` $\rightarrow$ `s`** | **Search** (Find Tool Window) | `ActivateFindToolWindow` |
| **`Alt + v` $\rightarrow$ `g`** | **Git** (Commit / Status) | `ActivateCommitToolWindow` |
| **`Alt + v` $\rightarrow$ `G`** (`Shift+g`) | **Git Log** (Version Control) | `ActivateVersionControlToolWindow` |
| **`Alt + v` $\rightarrow$ `i`** | **Git Inspect** (Version Control) | `ActivateVersionControlToolWindow` |
| **`Alt + v` $\rightarrow$ `p`** | **GitHub / GitLab Pull Requests** | `ActivatePullRequestsToolWindow` |
| **`Alt + v` $\rightarrow$ `d`** | **Run & Debug** | `ActivateDebugToolWindow` |
| **`Alt + v` $\rightarrow$ `t`** | **Testing / Run** | `ActivateRunToolWindow` |
| **`Alt + v` $\rightarrow$ `x`** | **Extensions / Plugins** | `WelcomeScreen.Plugins` |
| **`Alt + v` $\rightarrow$ `a` / `c` / `m`** | **Notifications / AI Sidebars** | `ActivateNotificationsToolWindow` |
| **`Alt + v` $\rightarrow$ `b` / `n` / `h` / `o` / `D` / `k` / `r` / `S`** | **Services / Docker / DB** | `ActivateServicesToolWindow` |
| **`Alt + v` $\rightarrow$ `j`** | **Gradle Projects** | `ActivateGradleToolWindow` |
| **`Alt + v` $\rightarrow$ `y`** | **Python Packages** | `ActivatePythonPackagesToolWindow` |
| **`Alt + v` $\rightarrow$ `J`** (`Shift+j`) | **Python Console** | `ActivatePythonConsoleToolWindow` |
| **`Alt + v` $\rightarrow$ `l`** | **Structure** | `ActivateStructureToolWindow` |
| **`Alt + v` $\rightarrow$ `O`** (`Shift+o`) | **Bookmarks** | `ActivateBookmarksToolWindow` |
| **`Alt + v` $\rightarrow$ `C`** (`Shift+c`) | **Maven** | `ActivateMavenToolWindow` |
| **`Alt + v` $\rightarrow$ `M`** (`Shift+m`) | **TODO** | `ActivateTODOToolWindow` |
| **`Alt + v` $\rightarrow$ `L`** (`Shift+l`) | **Hierarchy** | `ActivateHierarchyToolWindow` |
| **`Alt + v` $\rightarrow$ `[`** / **`]`** | Mostra / Nascondi **Sidebars** | `HideSideWindows` |

---

### 3.13 `Alt + w` — `+windows`
| Sequenza | Nome | Action ID / Comando IdeaVim |
| :--- | :--- | :--- |
| **`Alt + w` $\rightarrow$ `w`** | Other Window (Passa al gruppo editor successivo) | `NextSplitter` |
| **`Alt + w` $\rightarrow$ `d`** | Delete Window (Chiudi split) | `Unsplit` |
| **`Alt + w` $\rightarrow$ `-`** / **`s`** | Split Window Below (Dividi in basso) | `SplitHorizontally` |
| **`Alt + w` $\rightarrow$ `\|`** / **`\`** / **`v`** | Split Window Right (Dividi a destra) | `SplitVertically` |
| **`Alt + w` $\rightarrow$ `m`** | Maximize Window Toggle | `HideAllWindows` |
| **`Alt + w` $\rightarrow$ `=`** | Balance Windows | `<C-w>=` |
| **`Alt + w` $\rightarrow$ `h` / `j` / `k` / `l`** | Go to Left / Lower / Upper / Right Window | `<C-w>h` / `<C-w>j` / `<C-w>k` / `<C-w>l` |

---

### 3.14 `Alt + x` — `+diagnostics/quickfix`
| Sequenza | Nome | Action ID IntelliJ |
| :--- | :--- | :--- |
| **`Alt + x` $\rightarrow$ `x`** | Diagnostics (Apri pannello Problems) | `ActivateProblemsViewToolWindow` |
| **`Alt + x` $\rightarrow$ `j`** / **`n`** | Next Diagnostic (Errore successivo) | `GotoNextError` |
| **`Alt + x` $\rightarrow$ `k`** / **`p`** | Prev Diagnostic (Errore precedente) | `GotoPreviousError` |
| **`Alt + x` $\rightarrow$ `o`** | Output Panel | `ActivateRunToolWindow` |

---

## 4. Scorciatoie Globali Non-Leader

| Scorciatoia | Contesto | Azione |
| :--- | :--- | :--- |
| **`Ctrl + h` / `j` / `k` / `l`** | Editor / Tool Windows | Sposta focus tra split e Tool Windows (`<C-w>h/j/k/l` + `ToolWindowNavEverywhere`) |
| **`Ctrl + l`** | Sidebar / Tool Window | Torna all'Editor attivo (`FocusEditor`) |
| **`Ctrl + k`** | Terminale | Torna all'Editor dal Terminale (`Terminal.SwitchFocusToEditor`) |
| **`Ctrl + Up / Down / Left / Right`** | Globale | Ridimensiona altezza/larghezza Tool Window (`ResizeToolWindow*`) |
| **`Shift + h`** (`H`) | Editor (Normal mode) | Buffer / Tab precedente (`PreviousTab`) |
| **`Shift + l`** (`L`) | Editor (Normal mode) | Buffer / Tab successivo (`NextTab`) |
| **`Shift + k`** (`K`) | Editor (Normal mode) | Mostra documentazione / Hover LSP (`ShowHoverInfo`) |
| **`Ctrl + /`** | Globale | Mostra / Nascondi Terminale integrato (`ActivateTerminalToolWindow`) |
| **`Ctrl + s`** | Globale | Salva file (`SaveDocument`) |

---

## 5. File Explorer (Stile Neo-tree)

Attivi quando il focus e' nella sidebar **Project** (tramite `set nerdtree` in IdeaVim):

| Tasto | Azione |
| :--- | :--- |
| **`j`** / **`k`** | Muovi giu' / su nella lista file |
| **`l`** / **`Enter`** | Apri file o espandi cartella selezionata |
| **`h`** | Chiudi / comprimi cartella |
| **`o`** | Anteprima file / espandi cartella |
| **`a`** | Crea **nuovo file** (`NERDTreeMapNewFile`) |
| **`Shift + a`** (`A`) | Crea **nuova cartella** (`NERDTreeMapNewDir`) |
| **`r`** | Rinomina file o cartella (`NERDTreeMapRename`) |
| **`d`** | Elimina file o cartella (`NERDTreeMapDelete`) |
| **`y`** | Copia file o cartella (`NERDTreeMapCopy`) |
| **`p`** | Incolla file o cartella (`NERDTreeMapPaste`) |
| **`R`** | Aggiorna albero file (`NERDTreeMapRefresh`) |
| **`/`** | Cerca / filtra file nell'albero (`NERDTreeMapFind`) |

---

## 6. Autocomplete, QuickOpen e Navigazione Menu

| Scorciatoia | Contesto | Azione |
| :--- | :--- | :--- |
| **`Ctrl + j`** / **`Tab`** | Menu suggerimenti codice (Lookup) | Suggerimento successivo (`EditorLookupDown`) |
| **`Ctrl + k`** / **`Shift + Tab`** | Menu suggerimenti codice (Lookup) | Suggerimento precedente (`EditorLookupUp`) |
| **`Ctrl + j`** | Liste / Search Everywhere / GotoFile | Elemento successivo (`List-selectNextRow`) |
| **`Ctrl + k`** | Liste / Search Everywhere / GotoFile | Elemento precedente (`List-selectPreviousRow`) |

---

## 7. Keybindings Pre-esistenti Attivi

Tutti i tuoi keybindings personalizzati di `~/.vimrc` e `settings.json` sono inclusi in `~/.ideavimrc`:
- **`\`** e **`1`** $\rightarrow$ `0` (Inizio riga)
- **`0`** $\rightarrow$ `$` (Fine riga)
- **`+`** / **`-`** $\rightarrow$ `{` / `}` (Paragrafo precedente / successivo)
- **`gc`** $\rightarrow$ `:%s/` (Ricerca e sostituzione globale; `gcc` commenta la riga)
- **`<C-w>`** / **`<C-i>`** $\rightarrow$ `:vsp<CR>` / `:split<CR>`
- **`<C-m>`** $\rightarrow$ Salva tutto e compila (`SaveAll` + `CompileDirty`)
- **`Y`** $\rightarrow$ `y$`, **`yt`** $\rightarrow$ `0y$`, **`g0`** $\rightarrow$ `ReformatCode`
- **`| w`** $\rightarrow$ `SplitVertically`, **`| f`** $\rightarrow$ `SelectInProjectView`, **`| h`** $\rightarrow$ `_`
- **`"`**, **`'`**, **`(`**, **`[`**, **`{`** $\rightarrow$ Auto-chiusura in Insert Mode

---

## 8. Scorciatoie Standard Vim / IdeaVim

- **`g d`**: Go to Definition (`GotoDeclaration`)
- **`g D`**: Peek Definition / Implementations (`QuickImplementations`)
- **`g r`**: Find Usages / References (`ShowUsages`)
- **`g I`**: Go to Implementation (`GotoImplementation`)
- **`g y`**: Go to Type Declaration (`GotoTypeDeclaration`)
- **`g h`** / **`K`**: Show Hover (`ShowHoverInfo`)
- **`g c c`** / **`g c`** (Visual): Commenta / Decommenta riga o blocco (`CommentByLineComment`)
