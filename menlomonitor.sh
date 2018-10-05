#!/bin/sh

.params.conf
outputfile=`pwd`"/"$filename

while :
do
 currentdatetime=`date +%s`
 epoch=$(( currentdatetime -i ))
 curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"token":"9d0bcfe4b7e14a6ba84c1940fa6247d0"}' 'https://logs.menlosecurity.com/api/rep/v1/fetch/client_select?format=JSON&start='$epoch | python -mjson.tool > $outputfile

## email alerting
 cnt=`sed -e '1d'  $outputfile | sed -e '$d' | jq .result.events | grep $url -B2 | grep $usr -c`

 if [ $cnt -lt 1 ]; then
#   /home/ubuntu/menlo/sendEmail-v1.56/sendEmail -o tls=yes -f $fromadd -t $toadd -s $smtp -xu $mailaccount -xp $mailpassword -u $mtitle -m $mbody -a $outputfile
   curl -X POST --data-urlencode "$slackmessage" $slakwebhookurl
 else
    echo "fine"
 fi
 sleep $i

done
