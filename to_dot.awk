BEGIN {
  "pwd -P" | getline cwd;
  close("pwd -P");
  print "digraph G {";
}

{
  sub(cwd "/", "", $1);
  sub(cwd "/", "", $2);
  print "  \"" $1 "\" -> \"" $2 "\"";
}

END {
  print "}";
}
