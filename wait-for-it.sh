#!/usr/bin/env bash
# Usage: ./wait-for-it.sh host port -- command args...

set -e

HOST="$1"
PORT="$2"
echo "$HOST"
echo "$PORT"
shift 2
CMD="$@"
echo "$CMD"

if [[ -z "$HOST" || -z "$PORT" ]]; then
  echo "Usage: $0 host port -- command args..."
  exit 1
fi

echo "Waiting for $HOST:$PORT to be available..."

while ! nc -z "$HOST" "$PORT"; do
  sleep 1
done

echo "$HOST:$PORT is available, executing command: $CMD"
exec $CMD
