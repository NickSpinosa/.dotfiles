To install first install nix then run the install script

install nix 
```sh 
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
run the install script
```sh 
curl --proto '=https' --tlsv1.2 -sSf -L https://raw.githubusercontent.com/NickSpinosa/.dotfiles/nix/bin/install.sh | sh -s
```

to update packages run
```sh 
home-manager switch
```
or simply
```sh 
hs
```

