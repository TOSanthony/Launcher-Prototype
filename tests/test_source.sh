#!/usr/bin/env bash
set -euo pipefail
cc -std=c11 -Wall -Wextra -Werror -fsyntax-only src/main.c
grep -q 'No game image is bundled' src/main.c
echo 'Source checks passed.'
