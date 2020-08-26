while true
do
for i in `iotop -P -b -q -o -d 0.1 -n 10 | awk -F ' ' '{if ( $1 ~ /[0-9]/ && $10 > 20 && $2 == "be/0") print  $1}'` 
do
       	ionice -c 3 -p $i
       echo "process $i reniced to idel as it was hogging io"	
done
for i in `top  -b -d 0.1 -n 10 | awk -F ' ' '{if ( $1 ~ /[0-9]/ && $4 == 0 && $9 > 20) print  $1}'` 
do
       	renice -n 10 -p $i
       echo "process $i reniced to idel as it was hogging cpu"	
done
for i in `top  -b -d 0.1 -n 10 | awk -F ' ' '{if ( $1 ~ /[0-9]/ && $4 == 10 && $9 < 10) print  $1}'` 
do
       	renice -n 0 -p $i
       echo "process $i reniced to idel as it stopped hogging cpu"	
done
sleep 2
done
