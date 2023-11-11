To install first install nix then run the install script

install nix 
```sh 
sh <(curl -L https://nixos.org/nix/install)
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

for wsl you need to enable systemd by adding the below to your `/etc/wsl.conf` file
```
[boot]
systemd=true
```
more info (here)[https://learn.microsoft.com/en-us/windows/wsl/systemd]
