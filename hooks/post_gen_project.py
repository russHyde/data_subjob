#!/usr/bin/env python

import os
import subprocess

def setup_links(parent_dir, required_links):
    for link_name in required_links:
        try:
            dname = os.path.dirname(link_name)
            os.makedirs(dname, exist_ok=True)
        except FileNotFoundError:
            pass
        except Exception:
            raise
        subprocess.run(
            ["ln", "-rs", os.path.join(parent_dir, link_name), link_name]
        )

PARENT_DIR = "../../"

REQUIRED_LINKS = [
    "README.md", "sidekick", "TODO.md", "doc/header.tex", "bin/buddy",
    "scripts/setup.sh", "scripts/helpers_for_setup"
]

setup_links(PARENT_DIR, REQUIRED_LINKS)
