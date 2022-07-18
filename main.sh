echo Hello World

ssh bandit3@bandit.labs.overthewire.org -p 2220

#!/bin/bash

# set -o xtrace # uncomment for debugging

declare weirdchars=" &\'"

function normalise_and_rename() {
  declare -a list=("${!1}")
      for fileordir in "${list[@]}";
      do
          newname="${fileordir//[${weirdchars}]/_}"
          [[ ! -a "$newname" ]] && \
            mv "$fileordir" "$newname" || \
                echo "Skipping existing file, $newname."
      done
}

declare -a dirs files

while IFS= read -r -d '' dir; do
    dirs+=("$dir")
done < <(find -type d -print0 | sort -z)

normalise_and_rename dirs[@]

while IFS= read -r -d '' file; do
    files+=("$file")
done < <(find -type f -print0 | sort -z)

normalise_and_rename files[@] 