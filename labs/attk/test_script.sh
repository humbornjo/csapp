for i in {1..3}
do
    printf "\n"
    echo "| Phase $i |"
    ./hex2raw < ans/phase$i | ./ctarget -q
done


for i in {4..5}
do
    printf "\n"
    echo "| Phase $i |"
    ./hex2raw < ans/phase$i | ./rtarget -q
done