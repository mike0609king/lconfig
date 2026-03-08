"""
Files that I need to delete before making manual backups. I would print them
out such that I can manually delete them just in case.

Thought it would get more complicated than this; a normal bash command would
be good enough...
"""

import os
import pathlib

def found(path: str) -> bool:
    ret = False
    if os.path.isdir(path):
        ret = os.path.basename(path) == "node_modules"
        ret = ret or os.path.basename(path) == "venv"
        ret = ret or os.path.basename(path) == "__pycache__"
    elif os.path.isfile(path):
        pass
    return ret


def search(path: str) -> list[str]:
    ret = []
    ls = os.listdir(path)
    for l in ls:
        new_path = os.path.join(path, l)
        if found(new_path):
            ret.append(new_path)
            continue
        if os.path.isdir(new_path):
            ret.extend(search(new_path))
    return ret

def main():
    path = str(pathlib.Path().resolve())

    print("="*80)
    print("SEARCHING path:", path)
    print("="*80)

    ignored_files = search(path)
    print("\n".join(ignored_files))

if __name__ == "__main__":
    main()
