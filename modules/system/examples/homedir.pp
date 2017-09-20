$homedir = homedir('drew')
notify { "Drew's homedir: ${homedir}": }

$homedir_root = homedir('root')
notify { "Root's homedir: ${homedir_root}": }
