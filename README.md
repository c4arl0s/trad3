# trad3

Interactive command-line tools for looking up and maintaining a personal English–Spanish vocabulary stored as plain text files. The project grew out of a simple habit: when you needed a word, you looked it up and saved it in a `.txt` file; over time those files became the local “database” the scripts search. If a word is missing, the tools can fall back to external translation (for example via the `trans` CLI).

![](https://github.com/carlos-santiago-2017/DictEnEsScript/blob/master/1.gif)

## What `trad3.sh` does

`trad3.sh` is the **lookup / practice** script. It runs in a loop:

1. Prompts you to type a word (no command-line arguments; run it as documented below).
2. If the word exists in the **English** vocabulary files, it shows the translation and can play audio when available.
3. If not in English, it checks the **Spanish** side, normalizes the file content, and shows the English equivalent.
4. If the word is in neither list, it can use a Google Translate–backed flow (`search_word_using_google_script`) and then offer UI to add or refine entries.

Supporting logic (colors, audio, file layout, menus) lives in `directory_paths.sh` and the files it sources under `helper-functions/`, `trad-functions/`, and `add-functions/`.

## What `add3.sh` does

`add3.sh` is the **editor** for new or existing entries. It is meant to be run with no arguments. It:

1. Cleans stray empty vocabulary files (`delete_empty_files`).
2. In a loop, prints a header and asks for **one English word** (`print_header` → `read ENGLISH`).
3. If that English word already exists, it can show the file, let you add another meaning, open `vim` on the pair of files, or cancel.
4. If the word is new, it walks you through prompts (`read_inputs`) for Spanish text, extra notes, verb forms, examples, then creates or updates the English and Spanish files and related verb data.

So: **`trad3`** = search and translate; **`add3`** = maintain the dictionary files.

## Dependencies

- **gawk**

```console
brew install gawk
```

- **`trans`** (command-line translator; used by the trad workflow)

```console
wget git.io/trans
chmod +x ./trans
```

Move or symlink `trans` somewhere on your `PATH` if you rely on that feature.

- **sox** (audio tooling used by the project)

```console
brew install sox
```

## Installation

### Using `installer.sh`

`installer.sh` installs global `trad3` and `add3` commands by creating symbolic links from `trad3.sh` and `add3.sh` in the repository to `/usr/local/bin/trad3` and `/usr/local/bin/add3`.

1. From a terminal, `cd` into the cloned repository (the directory that contains `installer.sh`, `trad3.sh`, and `add3.sh`).
2. Ensure the installer can run: `chmod +x installer.sh` (once).
3. Run the installer:

```console
./installer.sh
```

The script resolves the repository path automatically, makes both scripts executable, and runs `ln -sf` for each link. If your user cannot write to `/usr/local/bin`, the script uses `sudo` for those steps.

After a successful run, you can run `trad3` or `add3` from any directory (as long as `/usr/local/bin` is on your `PATH`). The installer also reminds you to export `TRAD3_PATH` to the absolute repository root in your shell profile so the scripts can load `directory_paths.sh` and the rest of the project.

## How to invoke the scripts

The scripts source `directory_paths.sh` using `${TRAD3_PATH}`. You can either:

**Option A — Shell functions** (typical for `trad3` / `add3` without symlinks):

```console
trad3() {
  . "${TRAD3_PATH}/trad3.sh"
}

add3() {
  . "${TRAD3_PATH}/add3.sh"
}
```

**Option B — Run the symlinks** if you used `installer.sh`:

```console
trad3
add3
```

(Always with `TRAD3_PATH` set in your environment.)

Do **not** pass arguments to these scripts; they are interactive only.

## How the Bash scripts are written

The codebase follows a small, consistent pattern:

1. **Shebang and strict sourcing**  
   Scripts start with `#!/usr/bin/env bash` and load shared paths and helpers with:

   ```bash
   . ${TRAD3_PATH}/directory_paths.sh
   ```

   `directory_paths.sh` sets vocabulary directory variables and dot-sources shared modules (`helper-functions/*.sh`, `trad-functions/*.sh`, `add-functions/*.sh`).

2. **Modular functions**  
   Behavior is split into **lowercase functions with underscores** (for example `process_english_word`, `handle_new_word`, `is_retrievable_english_word`). `trad3.sh` uses small processors for each case; `add3.sh` uses `handle_*` helpers and a `main` that dispatches the loop.

3. **User-facing strings**  
   Fixed messages are often stored in **`readonly`** variables at the top of `trad3.sh` so colors and wording stay in one place.

4. **Interactive loops**  
   `trad3.sh` uses `while :; do` with `read word`; `add3.sh` uses `while true` around `print_header` and branching on whether the English word already exists.

5. **No arguments**  
   Both entry scripts expect to be run with **no CLI arguments**; they check `$#` and tell you to invoke them by name only.

6. **Colors**  
   Terminal colors come from variables such as `${WHITE}`, `${GREEN}`, `${RED}` defined in `helper-functions/colors.sh`.

7. **Data layout**  
   Paths like `ENGLISH_DIRECTORY_PATH` and `SPANISH_DIRECTORY_PATH` keep file I/O out of the main loop logic where possible.

For full implementations, open `trad3.sh`, `add3.sh`, and `directory_paths.sh` in the repository.
