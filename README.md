# Welcome to my dotfiles

## Basic instructions 
- You need to install Hack Mono from my `/Files`
- I suggest installing Alacritty

## Neovim
```
$ yay -S neovim 
```
It will not work out of the box, you need to do some steps. <br>
For your own good you must self compile all the programming languages you need for optimized performance <br>
I suggest yay if you're lazy

Dependencies: <br>

```shell
Tools $ yay -S wget curl ripgrep git tree-sitter
Rust $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
Other languages: $ yay -S python3 go npm luarocks ruby jdk-openjdk php julia composer bash
```

After everything is installed run `:PackerSync`, once it's done reboot neovim


![Screenshot 2022-07-19 at 10 33 28 PM](https://user-images.githubusercontent.com/30930688/179842099-584f9ecd-cba3-486e-9814-aae06f32ad40.png)
![Screenshot 2022-07-19 at 10 34 07 PM](https://user-images.githubusercontent.com/30930688/179842115-1dc2ba6f-9a3d-4e51-a7da-29a8659574d0.png)
