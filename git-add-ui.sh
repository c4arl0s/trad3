UNTRACKED_FILES=$(git ls-files --others --exclude-standard)
MODIFIED_FILES=$(git ls-files -m)

if [[ $UNTRACKED_FILES ]]; then
    LINE=$(for FILE in ${UNTRACKED_FILES[@]}
    do
        echo "$FILE $FILE off"
    done)
    # echo $LINE | tr -d '\r'
    ANSWER=$(dialog --checklist "untracked files to add:" 0 0 0 $LINE --output-fd 1)
    git add $ANSWER
else
    echo  "untracked files dont exist"
fi

if [[ $MODIFIED_FILES ]]; then
    LINE=$(for FILE in ${MODIFIED_FILES[@]}
    do
        echo "$FILE $FILE off"
    done)
    # echo $LINE | tr -d '\r'
    ANSWER=$(dialog --checklist "modified files to add:" 0 0 0 $LINE --output-fd 1)
    git add $ANSWER
else
    echo  "modified files dont  exist"
fi

