install stow

```paru -S stow```

Create a directory for the dotfiles

```mkdir -p ~/dotfiles```

Clone repo in created directory

Run stow to symlink the dotfiles

```stow .```

to add a new addition to this cp the config file to the create dotfiles directory with the same structure and location as the original file, then run stow again with the adopt flag

```stow -a .```
