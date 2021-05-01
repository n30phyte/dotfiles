for i in *
do
    if [ -d "$i" ]
    then
       (cd "$i" && zip -r "../$i.zip" ".")
    fi
done
