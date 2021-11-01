# osx-bootstrap

This repo contains scripts to bootstrap configure fresh installed OSX for my own preference

## Steps

#### Setup SSH

1. Open terminal, run `git`. A prompt should pop up asking to install Command Line Developer Tools, install.
2. Run following commands

```
git clone https://github.com/jerry-peng/osx-bootstrap.git
cd osx-bootstrap/scripts
chmod +x ./*.sh
./setup-ssh.sh
```

3. The script creates new SSH key, add it to SSH agent and copy public key to clipboard. Type in Github email, and SSH key password multiple times.
4. The public key should bein clipboard, add it to Github
5. Run following commands to clone repo using SSH key

```
cd ~
rm -fr osx-bootstrap
git clone git@github.com:jerry-peng/osx-bootstrap.git
cd osx-bootstrap/scripts
chmod +x ./*.sh
```

#### Run Bootstrap Scripts

1. Run `./bootstrap.sh`
2. Follow script instructions

#### Further instructions

Instructions on further configuration in notes repo.
