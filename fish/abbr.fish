abbr -a l ls -al

abbr -a tx tmuxifier
abbr -a sync-contacts "PYTHONPATH='' vdirsyncer sync and mates index"

abbr -a se source .env.fish

abbr -a sq sqlite-utils
abbr -a ds datasette

# code maat specific abbreviation
abbr -a gm "git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --before=(date +%Y-%m-%d)"
abbr -a gdco git rev-list -n 1 --before=(date +%Y-%m-%d) master
abbr -a cl cloc ./ --by-file --csv --quiet
