while true; do 
    bash mock_content.sh | sudo nc -l -p 15214 -q0
done