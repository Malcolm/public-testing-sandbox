#!/usr/bin/env bash
# Every envs/*.yaml pins exactly one image by digest. Fails loud on the first bad file.
set -euo pipefail
dir="${1:-envs}"
shopt -s nullglob
files=("$dir"/*.yaml)
[ "${#files[@]}" -gt 0 ] || { echo "ERROR: no env files in $dir" >&2; exit 1; }
for f in "${files[@]}"; do
  n="$(grep -cE '^image: [a-z0-9.-]+/[a-z0-9._/-]+@sha256:[0-9a-f]{64}$' "$f" || true)"
  [ "$n" = "1" ] || { echo "ERROR: $f must pin exactly one image by sha256 digest (found $n)" >&2; exit 1; }
  echo "OK $f"
done
