while true
do

if [[ -n `free | awk -F ' ' '{if ($1 =="Mem:" && $4 < 70000) print "1" }'` ]]; 
then
	notify-send "you are running low on memory. please close some applications or tabs before your system grinds to a halt"
fi
sleep 20
done
