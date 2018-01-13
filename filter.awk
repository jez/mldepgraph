# Un-indented lines are definitions
/^[^ ]/ {
  def_type=$1;
  def_file=$3;
}

# Indented lines are usages
/^ / {
  if (def_type == "structure" && def_file != $1) {
    print $1 " " def_file;
  }
}

