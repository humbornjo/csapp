a=("sum" "rsum" "copy")

for task in "${a[@]}"; do
    printf "\n"
    echo "|  $task  |" | tr '[:lower:]' '[:upper:]'
    ./yas $task.ys
    ./yis $task.yo
    rm $task.yo
done


