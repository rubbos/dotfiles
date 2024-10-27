# How to work with dotfiles

I'm using GNU Stow for this. Make sure its installed `sudo apt install stow`.

## Uploading new dotfiles

1. Make sure there is a folder called `dotfiles`.
2. Move the dotfile to the `dotfiles` folder using `mv`. Make sure to copy the whole path in the `dotfiles` for simplicity. The real file will be stored in `dotfiles`, and it gets symlinked back to the original path.
3. To symlink all files: `stow .`. Symlink one file with `stow .config`.
4. Commit and push to repository.

```bash ~/dotfiles/
mkdir .config
mv ~/.config/nvim .config/
stow .config
```

## Retrieving dotfiles

1. Git clone this repository 
2. That's it really.
