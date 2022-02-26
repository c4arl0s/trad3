
cleanEnglishFile()
{
    WORD=$1
    #borrar lineas vacias
    sed '/^ *$/d' $ENGLISH_DIRECTORY_PATH/$WORD.txt > $COMODIN_DIRECTORY_PATH/comodin.txt
    cat $COMODIN_DIRECTORY_PATH/comodin.txt > $ENGLISH_DIRECTORY_PATH/$WORD.txt
}
