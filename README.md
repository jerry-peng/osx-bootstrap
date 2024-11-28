<!-- markdownlint-disable MD013 -->

# osx-bootstrap

This repo contains scripts to bootstrap configure fresh installed OSX for my own preference

## Steps

### Setup SSH

- Open terminal, run `git`. A prompt should pop up asking to install Command Line Developer Tools, install.
- Run following commands to create new SSH key, adds it to SSH agent, and copies public key to clipboard. The script will also prompt for Github account email.

```sh
git clone https://github.com/jerry-peng/osx-bootstrap.git
cd osx-bootstrap/scripts
./setup-ssh.sh
```

- The public key should be copied to clipboard, add it to Github.
- Run following commands to clone repo using SSH key

```sh
cd ~
rm -fr osx-bootstrap
git clone git@github.com:jerry-peng/osx-bootstrap.git
cd osx-bootstrap/scripts
```

### Run Bootstrap Scripts

1. Run `./run.sh`
2. Follow script instructions

### Further instructions

Instructions on further configuration in notes repo.
