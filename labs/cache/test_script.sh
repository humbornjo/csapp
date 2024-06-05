
make clean > /dev/null  
make > /dev/null
printf "| 32 * 32 | \n"
./test-trans -M 32 -N 32 | tail -n 1
printf "| 64 * 64 | \n"
./test-trans -M 64 -N 64 | tail -n 1
printf "| 61 * 67 | \n"
./test-trans -M 61 -N 67 | tail -n 1

make clean > /dev/null 