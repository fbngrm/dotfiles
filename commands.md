#### bulk rename files in vim
:r !ls foo
:%s/.*/mv & &/
:w !sh

#### rename in all files in vim
:args `find . -type f`
or
:args **/*.go
:argdo %s/getByKey/resourcedata.GetByKey/gc | update

#### bulk rename files in vim

\ls | vim -
:%s/.*/\="mv -i ".submatch(0)." ".substitute(submatch(0), "foo", "bar", "g")/g
:w !sh
