#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: tmux-session.sh <session-name>"
  exit 1
fi

session="$1"

if tmux has-session -t "$session" 2>/dev/null; then
  tmux attach-session -t "$session"
else
  tmux new-session -d -s "$session" -n server
  tmux new-window -t "$session" -n nvim
  tmux new-window -t "$session" -n claude
  tmux new-window -t "$session" -n term
  tmux select-window -t "$session:1"
  tmux attach-session -t "$session"
fi
