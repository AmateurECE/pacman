#!/bin/sh
###############################################################################
# NAME:             sloc.sh
#
# AUTHOR:           Ethan D. Twardy <ethan.twardy@gmail.com>
#
# DESCRIPTION:      Quick script to calculate the number of lines of code in
#                   a directory.
#
# CREATED:          09/05/2022
#
# LAST EDITED:      09/05/2022
###

set -e

if [[ -n $1 && ($1 = "--help" || $1 = "-h") ]]; then
    >&2 printf '%s\n' "Usage: sloc"
    exit 1
fi

total=0
for f in $(find . | grep '\.c$\|\.h$'); do
    lines=$(sed -e 's#^\s*//.*$##' -e '/^\s*$/d' $f | cat -s | wc -l)
    printf '%4s: %s\n' $lines $f
    total=$(expr $total + $lines)
done

printf '%s: Total\n' $total

###############################################################################
