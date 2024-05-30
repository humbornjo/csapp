make clean > /dev/null
make VERSION=full &> /dev/null

echo "| Correctness |"
./correctness.pl  | tail -n 1
echo ""

echo "|  Benchmark  |"
./benchmark.pl | tail -n 2