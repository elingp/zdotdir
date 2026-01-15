# zdotdir

My `$ZDOTDIR` [dotfiles] directory for Zsh on WSL Ubuntu. This repo started as a fork of [mattmc3's personal zdotdir](https://github.com/mattmc3/zdotdir) and is now tailored to my workflow.

## My Terminal

![My Terminal][zdotdir_gif]

## My setup

I like my Zsh to behave like [Fish][fish], so there's a lot of features that will feel familiar to other Fish users. I also prefer the plugin structure of [Oh-My-Zsh][oh-my-zsh] without adopting OMZ wholesale. This setup focuses on a fast startup, good defaults, and a clean layout:

- A functions directory for custom helpers
- A completions directory for custom completions
- A conf.d directory so that .zshrc isn't a cluttered mess
- A curated plugin list via Antidote and Zephyr

## Installation

Since this is my personal `$ZDOTDIR`, this installation procedure is mostly for my own use.

It's a good idea to backup existing files first:

```zsh
setopt extended_glob
zfiles=(
  ${ZDOTDIR:-~}/.zsh*(.N)
  ${ZDOTDIR:-~}/.zlog*(.N)
  ${ZDOTDIR:-~}/.zprofile(.N)
)
mkdir -p ~/.bak
for zfile in $zfiles; do
  cp $zfile ~/.bak
done
unset zfile zfiles
```

Install this dotfiles repo to your `$ZDOTDIR`:

```zsh
# set the amazing ZDOTDIR variable
export ZDOTDIR=~/.config/zsh

# clone this repo
git clone --recursive git@github.com:mattmc3/zdotdir.git $ZDOTDIR

# change the root .zshenv file to use ZDOTDIR
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF

# load zsh
zsh
```

## Performance

A snappy shell is very important. I regularly run [zsh-bench](https://github.com/romkatv/zsh-bench) to make sure my shell feels snappy.

The latest benchmark run shows my current WSL setup.

```zsh
% # ASUS S410 UN (2018): WSL Ubuntu + oh-my-posh
% zsh-bench
==> benchmarking login shell of user elingp ...
creates_tty=0
has_compsys=1
has_syntax_highlighting=1
has_autosuggestions=1
has_git_prompt=1
first_prompt_lag_ms=921.084
first_command_lag_ms=984.993
command_lag_ms=167.072
input_lag_ms=38.542
exit_time_ms=659.415
```

## Resources

- [fish][fish]
- [antidote][antidote]
- [zephyr][zephyr]
- [oh-my-posh][oh-my-posh]
- [zshzoo][zshzoo]
- [zsh_unplugged][zsh_unplugged]
- [prezto][prezto]
- [oh-my-zsh][oh-my-zsh]
- [supercharge your terminal with zsh][supercharge-zsh]
- [awesome zsh][awesome-zsh-plugins]

[antidote]: https://github.com/mattmc3/antidote
[awesome-zsh-plugins]: https://github.com/unixorn/awesome-zsh-plugins
[fish]: https://fishshell.com
[dotfiles]: https://dotfiles.github.io/
[homebrew]: https://brew.sh
[nerd-fonts]: https://github.com/ryanoasis/nerd-fonts
[oh-my-posh]: https://github.com/JanDeDobbeleer/oh-my-posh
[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[prezto]: https://github.com/sorin-ionescu/prezto
[zephyr]: https://github.com/mattmc3/zephyr
[supercharge-zsh]: https://blog.callstack.io/supercharge-your-terminal-with-zsh-8b369d689770
[zdotdir_gif]: https://raw.githubusercontent.com/mattmc3/zdotdir/resources/img/zdotdir.gif
[zsh_unplugged]: https://github.com/mattmc3/zsh_unplugged
[zshzoo]: https://github.com/zshzoo/zshzoo
