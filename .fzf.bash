# Setup fzf
# ---------
if [[ ! "$PATH" == */home/edgar/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/edgar/.fzf/bin"
fi

eval "$(fzf --bash)"
