IP=$1
for i in {1..50}; do curl --silent $IP | sed -n '7p' >> output.txt; done
echo 'server 1: ';grep '1' output.txt | wc;echo 'server 2: ';grep '2' output.txt | wc
rm output.txt