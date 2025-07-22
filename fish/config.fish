set fish_greeting
set -x EDITOR vim

set ZIG_INSTALL (find ~ -maxdepth 1 -type d -name 'zig-linux-x86_64-*' | sort | tail -n 1)

if test -d "$ZIG_INSTALL"
  set -x PATH $ZIG_INSTALL $PATH
end

function bubu
  venv gw2 && python3 ~/git/bubu2000/src/main.py
end

function venv
  source ~/$argv/bin/activate.fish
end

function gf
  git fetch --all --prune --tags
end

function gs
  git status
end

function gc
  git commit $argv
end

function gca
  git add -A; and git commit $argv
end

function gd
  git diff $argv
end

function gl
  git log $argv
end

function gp
  git pull $argv
end

function gb
  git push origin (git commit-tree -m "" (git mktree </dev/null) </dev/null):refs/heads/$argv[1]
  git checkout -b $argv[1]
  git push --set-upstream --force-with-lease origin $argv[1]
end

function ccd
  mkdir -p "$argv"
  and cd "$argv"
end
