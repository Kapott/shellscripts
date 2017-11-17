# kapott's binfiles

A collection of wonderous, magical, strange and sometimes almost-useful bash scripts.

## batch_lookup_ips

Script which was made to take in a list of newline-separated ip addresses, and perform a nslookup on each of them.

_usage:_ `batch_lookup_ips list-of-ips.txt`

## bmcompress

Benchmark script for checking out differences between compression methods. Used this to compress 12G+ sql files. Results were impressive (repetitive plaintext, so to be expected). Conclusion: Don't go for single-threaded compression tools - ever. Also; absolutely bleeding edge maximum compression is not what you want. (orders of magnitude slower)

_usage:_ `bmcompress <file>`

Note that this won't actually leave a compressed file behind. It just tests the time it takes each program to compress your file.

## bz

Maximum compression (9), multithreaded bzip using `pbzip2`.

_usage:_ `bz <name without .tar.bz2> <file_or_dir_to_compress>`

## http_status

Checks the http status code for the given url

_usage:_ `http_status <url>`

## ipt_block

Blocks an ip address, or ip addresses listed in a file, seperated by newlines.

_usage:_ `ipt_block <ip_address or file_with_ips>`

## ipt_load_defaults

Loads sensible ipt defaults

## ipt_unblock

Unblocks an ip address, or ip addresses listed in a file, separated by newlines.

_usage:_ `ipt_unblock <ip_address or file_with_ips>`

## sqldump

Takes a config file located in `$HOME/bin/config/<name>` and neatly dumps the entire database into your dump directory, in a separate dir, in a polite and, quite stealthy, way.

_usage:_ `sqldump <name>`

Where 'name' is the name of the config file. So if you created a file named `$HOME/bin/config/foo` then you'd use `sqldump foo`.

Config files get sourced, and look like this:

```
server_host="server.host.com"
server_user="mysql_username"
server_password="mysql_password"
server_dbname="database_name_to_dump"

datetime="`date +%Y%m%d%H%M%S`"
clientname="site or client you're dumping for"

dumproot="/path/to/all/dumps"
dumppath="${dumproot}/${clientname}"
mkdir -p $dumppath

dumpfile="${dumppath}/${clientname}_${server_dbname}_${datetime}.sql"
```

## tgz

Maximum compression (9), multithreaded tar gzip using `pigz`.

_usage:_ `tgz <zipname without .tar.gz> <file_or_dir_to_compress>`

## todo.sh

Todo.sh is a CLI for my todo.txt. This todo.txt gets synchronized with Dropbox, and as such has a `todo.cfg` in my `$HOME/.dotfiles`.

For more information, go to [the official todo.sh repo](https://github.com/todotxt/todo.txt-cli).

## upd

Updates the `apt` cache, and displays packages which have upgrades available, if any.

## upg

Updates the `apt` cache, if needed, and performs all kinds of upgrades - and deletes superfluous packages afterwards.