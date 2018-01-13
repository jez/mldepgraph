# mldepgraph [optons] <file>.du

## TODO

- copy/paste git-madge
- rip out the madge dependency
- replace it with the def-use oneliner below
- make being run from a git repository optional
- distribution channel:
  - Homebrew, + note about how to copy files manually
    - (download folder somewhere, put /path/to/mldepgraph/bin on your `PATH`)

## Implementation

```bash
# TODO(jez) document that it filters to the current directory only
grep $(pwd -P) hw03.du | \
  # maybe make this filter optional
  grep -v cmlib | \
  awk -f "$ROOTDIR/filter.awk" | \
  uniq | \
  awk -f "$ROOTDIR/to_dot.awk" | \
  gvpr -c -f "$STYLESDIR/$STYLE.gv" | \
  dot -Tpng | \
  imgcat
```
