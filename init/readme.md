## Sync sublime settings

Assuming you are using Sublime 3, use following command to restore sublime settings:

```
cp -f $HOME/dotfiles/init/*.sublime-* $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```

use following command to backup sublime settings:

```
cp -f $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/*.sublime-* $HOME/dotfiles/init/
```


