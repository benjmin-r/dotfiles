abbr -a l lsd -al

abbr -a tx tmuxifier
abbr -a sync-contacts "PYTHONPATH='' vdirsyncer sync and mates index"

abbr -a se source .env.fish

abbr -a sq sqlite-utils
abbr -a sq3 sqlite3
abbr -a sqb sqlitebiter
abbr -a ds datasette
abbr -a k kubectl

# code maat specific abbreviation
abbr -a gm "git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --before=(date +%Y-%m-%d)"
abbr -a gdco git rev-list -n 1 --before=(date +%Y-%m-%d) master
abbr -a cl cloc ./ --by-file --csv --quiet
