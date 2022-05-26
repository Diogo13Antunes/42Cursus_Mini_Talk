export PID_MINITALK=[server_pid]

echo ""
echo "\033[1;36m""Test 1 -> [Hello World!]""\033[0m"
./client $PID_MINITALK "Hello World!"
sleep 2

echo ""
echo "\033[1;36m""Test 2 -> [\n]""\033[0m"
./client $PID_MINITALK "
"
sleep 2

echo ""
echo "\033[1;36m""Test 3 -> 50 Charecters""\033[0m"
./client $PID_MINITALK aZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6Y
sleep 2

echo ""
echo "\033[1;36m""Test 4 -> [\t]""\033[0m"
./client $PID_MINITALK "	"
sleep 2

echo ""
echo "\033[1;36m""Test 5 -> 100 Charecters""\033[0m"
./client $PID_MINITALK "aZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6Y"
sleep 2

echo ""
echo "\033[1;36m""Test 6 -> 500 Charecters""\033[0m"
./client $PID_MINITALK aZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6Y
sleep 2

echo ""
echo "\033[1;36m""Test 7 -> 1000 Charecters""\033[0m"
./client $PID_MINITALK aZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6YaZu4ahWb6gE35bEPtmbbzbzH5S929659AVuxynkVjSKEWpXb6Y
sleep 2

unset PID_MINITALK
