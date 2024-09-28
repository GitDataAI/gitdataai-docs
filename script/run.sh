#!/bin/bash
msg() {
    echo -E "/* $1 */"
}

msg "Will run this Node service as $RUN_MODE mode..."

pnpm run start --port 80 --host 0.0.0.0

[[ "$!" -gt 0 ]] && wait $!