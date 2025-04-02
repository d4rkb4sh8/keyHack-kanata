# keyHack Kanata Custom Layout

**Tap/Hold Time**: 200ms  

---

## **Base Layer (Default)**  

**Toggle Keys**: Hold `Left Win` (Layer 2), `Right Win` (Layer 3), `Right Ctrl` (Layer 4).  

```  
[Caps/`]  F1   F2   F3   F4   F5   F6   F7   F8   F9   F10  F11  F12  
`~   1    2    3    4    5    6    7    8    9    0    -    =    [Backspace/Del]  
Tab  Q    W    E    R    T    [Y/Home]  [U/PgDn]  [I/PgUp]  [O/End]  P    [ [/WordDel]  [ ]/LineDel]  \|  
[Esc/;]  [A/Ctrl+A]  [S/Win]  [D/Alt]  [F/Ctrl]  G    [H/`~]  [J/Ctrl]  [K/Alt]  [L/Win]  ;    '    [Enter/Alt]  
Shift  [Z/Undo]  [X/Cut]  [C/Copy]  [V/Paste]  B    N    M    [,/WordBspc]  [./WordDel]  /    Shift  
Ctrl   [Win/Layer2]  [Alt]         [Space]         [Alt]  [Win/Layer3]  [Ctrl/Layer4]  
```  

**Key Modifications**:  

- `A`: Tap = `a`, **Hold = `Ctrl+A`** (select all text).  
- `S/D/F`: Tap = `s/d/f`, Hold = **Left Win/Alt/Ctrl**.  
- `H/J/K/L`: Tap = `h/j/k/l`, Hold = **`~, Right Ctrl/Alt/Win**.  
- `Y/U/I/O`: Navigate **Home/PgDn/PgUp/End** on hold.  
- `Z/X/C/V`: **Undo/Cut/Copy/Paste** on hold.  
- `;` **is static** (no hold function; outputs `;` only).  

---

## **Layer 2 (Navigation/Media)**  

**Activation**: Hold `Left Win`.  

```  
[Caps/`]  [Quake]  [Arc_Menu]  [BrightDown]  [BrightUp]  [Mute]  [Vol-]  [Vol+]  [Mic]  [Screenshot]  [LockScreen] [WorkspaceL]  [WorkspaceR]  
`~   1    2    3    4    5    6    7    8    9    0    -    =    [Backspace]  
Tab  Q    W    E    R    T    [🖱️←]  [🖱️↓]  [🖱️↑]  [🖱️→]  P    [LineBspc]  [LineDel]  \|  
[Esc]  _    _    _    _    G    ←    ↓    ↑    →    [Bspc]  [Del]  [Enter]  
Shift  _    _    _    _    B    [N/0]  [M/$]  [,/Undo]  [./Redo]  /    Shift  
_      _         [Space]         _      _      _  
```  

**Key Modifications**:  

- `Y/U/I/O`: Mouse wheel **←/↓/↑/→**.  
- `H/J/K/L`: Arrow keys.  
- Media: `F5-F8` control **mute/volume/mic**.  
- `N/M`: Tap for `0/$`, hold for clipboard actions.  

---

## **Layer 3 (Symbols)**  

**Activation**: Hold `Right Win`.  

```  
[Caps/`]  F1   F2   F3   F4   F5   F6   F7   F8   F9   F10  F11  [Reload]  
`~   1    2    3    4    5    6    7    8    9    0    -    =    [Backspace]  
Tab  !    @    #    $    _    _    _    _    _    P    _    _    \|  
[Esc]  %    ^    &    *    _    _    _    _    _    ;    '    [Enter]  
Shift  -    +=   -=   =    `~    N    M    _    _    /    Shift  
_      _         [Space]         _      _      _  
```  

**Key Modifications**:  

- `Q/W/E/R`: **! @ # $** (shifted 1-4).  
- `A/S/D/F`: **% ^ & *** (shifted 5-8).  
- `Z/X/C/V`: **- += -= =**.  

---

## **Layer 4 (Brackets)**  

**Activation**: Hold `Right Ctrl`.  

```  
[Caps/`]  F1   F2   F3   F4   F5   F6   F7   F8   F9   F10  F11  F12  
`~   1    2    3    4    5    6    7    8    9    0    -    =    [Backspace]  
Tab  {    }    [    ]    _    _    _    _    _    P    _    _    \|  
[Esc]  (    )    <    >    _    _    _    _    _    ;    '    [Enter]  
Shift  :    ;    "    '    \    /    |    _    _    /    Shift  
_      _         [Space]         _      _      _  
```  

**Key Modifications**:  

- `Q/W/E`: **{ } [ ] ( )**.  
- `A/S/D/F`: **[ ] < >** (shifted).  
- `Z/X/C/V`: **: ; " '**.  

---

### **General Notes**  

- **Vim-Style Navigation**: Layer 2 mirrors Vim’s `HJKL` arrows.  
- **Layer Exits**: Release the toggle key (e.g., `Left Win`) to return to the base layer.  
- **Clipboard Actions**: Use `,/.` for word deletion and `[/]` for line editing.  
