#### bulk rename files in vim
:r !ls foo
:%s/.*/mv & &/
:w !sh

#### rename in all file in vim
:args `find . -type f`
or
:args **/*.go
:argdo %s/getByKey/resourcedata.GetByKey/gc | update
