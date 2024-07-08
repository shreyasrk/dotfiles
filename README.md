All my dotfiles.

I use bash, tmux, git and vim heavily - the legacy programmer mode

This repo contains all the settings I need - in one shot - to configure my environments

## Setup

A simple one

```
git clone git@github.com/shreyasrk/dotfiles.git # Ensure you can clone over ssh (preferred)
cd dotfiles/
chmod +x setup.sh
./setup.sh # Ensure you have bash installed and can access github.com (check proxies/firewall settings if necessary)
```

### Linux Distro additional setup

While running `setup.sh` and using bash/tmux/vim - you may encounter newline issues. Clean these files using `sed` command
```
sed -i -e 's/\r$//' *.sh
sed -i -e 's/\r$//' vim/*.*
sed -i -e 's/\r$//' *.*

sed -i 's\/r//' *.*
```

That's it! Feel free to raise PR in case you want to contribute (or better ones!)

### Note

This repo will undergo changes, albeit no-so-frequently - please raise a PR for me to get a notofication!

### References

* [.vimrc key map](https://github.com/amix/vimrc?tab=readme-ov-file#key-mappings)
* [tmux.conf key map](https://github.com/gpakosz/.tmux?tab=readme-ov-file#bindings)
* [.,bashrc](https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)
