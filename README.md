# Mac Development Ansible Playbook

[![Build Status](https://travis-ci.org/geerlingguy/mac-dev-playbook.svg?branch=master)](https://travis-ci.org/geerlingguy/mac-dev-playbook)

This utility installs and configures the minimal software on your Mac needed for development at SinglePlatform. The following tasks are performed:
  - Installs minimal bash profile (preserves any bash profile customizations you may have)
  - Installs useful git config with some handy aliases (see files/gitconfig)
  - Optionally installs your dotfiles from a github repo
  - Optionally tweaks many aspects of macOS for better performance and ease of use.
  - Optionally installs apps form the Apple Store
  - Installs [Homebrew](http://brew.sh/) with minimal set of packages useful for SP development
  - Installs python 2.7 using pyenv
  - Clones SP repos into (~/envs):
    - ansible
    - cdef
    - paywall
    - publisher-feeds
    - single-api
    - sp-perftest
    - spbilling
    - spdj
    - spfb
    - spv2
  - Sets up ansible, virtualbox, and vagrant so that starting a dev environment should be as simple as:
    `cd ~/envs/ansible`
    `vagrant up spdj`

It can also be used to install a battery of optional software which many developers find useful.

This is a work in progress. I'll be evolving this set of playbooks over time.

*See also*:

  - [Boxen](https://github.com/boxen)
  - [Battleschool](http://spencer.gibb.us/blog/2014/02/03/introducing-battleschool)
  - [osxc](https://github.com/osxc)
  - [MWGriffin/ansible-playbooks](https://github.com/MWGriffin/ansible-playbooks) (the original inspiration for this project)

## Installation

  1. You need access to to the Singleplatform GitHub Organization via SSH Key before this utility will function.
     - If you're upgrading to a new laptop, make sure you copy all the files from your old ~/.ssh laptop before running this. I recommend using AirDrop for this task.
     - If you are installing this for the first time, you'll need to upload your key here https://github.com/settings/keys.
  2. Clone this repository to your local drive. I recommend putting it in ~/envs.
  3. Run `$ ./install.sh` from the cloned repo. This will open an editor with the default config loaded.
     - At a minimum, you need to fill out "full_name" & "email_address".
  4. Once you save this file, the ansible playbook will be invoked. Enter your network account password when prompted for Sudo.
  
> Notes:
  - The install.sh command can be re-run and will use your saved settings. If you wish to change your configuration after the first run, you'll need to edit:
    `~/.config/mac-dev-playbook`
  - If some Homebrew commands fail, you might need to agree to Xcode's license or fix some other Brew issue. Run `brew doctor` to see if this is the case.

### Running a specific set of tagged tasks

You can filter which part of the provisioning process to run by specifying a set of tags using `ansible-playbook`'s `--tags` flag. The tags available are `dotfiles`, `homebrew`, `mas`, `extra-packages` and `osx`.

    ./install.sh --tags "dotfiles,homebrew"

## Included Applications / Configuration (Default)

Applications (installed with Homebrew Cask):
  - aws-vault
  - font-dejavusansmono-nerd-font
  - font-droidsansmono-nerd-font
  - font-hack-nerd-font
  - github
  - hipchat
  - iterm2
  - mysql-client
  - mysql-connector-python
  - postman
  - utc-menu-clock
  - [Vagrant](https://www.vagrantup.com/)
  - virtualbox

Packages (installed with Homebrew):
  - autoconf
  - awscli
  - bash-completion
  - ccache
  - coreutils
  - gettext
  - git
  - git-secrets
  - gpg
  - openssl
  - pwgen
  - pyenv
  - pyenv-ccache
  - pyenv-pip-migrate
  - pyenv-virtualenv
  - readline
  - sqlite
  - tmux
  - tmux-cssh
  - vagrant-completion

## Overriding Defaults

Not everyone's development environment and preferred software configuration is the same.

You can override any of the defaults configured in `~/.config/mac-dev-playbook`. For example, you can install additional packages and apps with something like:

    homebrew_additional_packages:
      - cowsay
      - go
    
    homebrew_cask_additional_apps:
      - datagrip
      - pycharm
      
    mas_additional_installed_apps:
      - { id: 443987910, name: "1Password" }
      - { id: 498486288, name: "Quick Resizer" }
      - { id: 557168941, name: "Tweetbot" }
      - { id: 497799835, name: "Xcode" }
    
    composer_additional_packages:
      - name: hirak/prestissimo
      - name: drush/drush
        version: '^8.1'
    
    gem_additional_packages:
      - name: bundler
        state: latest
    
    npm_additional_packages:
      - name: webpack
    
    pip_additional_packages:
      - name: mkdocs

If you have a repository of dotfile customizations on GitHub, you can automatically pull those files down by setting something like this:
    
    dotfiles_repo: https://github.com/davidpanofsky/dotfiles.git
    dotfiles_files:
      - .bash_profile
      - .gitconfig
      - .gitignore
      - .SpaceVim.d/init.vim
      - .osx

## Optional Applications

Applications (installed with Homebrew Cask):
  - adobe-acrobat-pro
  - adobe-acrobat-reader
  - air-connect
  - amethyst
  - android-file-transfer
  - android-platform-tools
  - chrome-devtools
  - chrome-remote-desktop-host
  - cyberduck
  - datagrip
  - [Docker](https://www.docker.com/)
  - docker-toolbox
  - [Dropbox](https://www.dropbox.com/)
  - [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  - gitup
  - [Google Chrome](https://www.google.com/chrome/)
  - google-drive-file-stream
  - jira-client
  - lastpass
  - macpass
  - mysql-shell
  - mysql-utilities
  - mysqlworkbench
  - noti
  - pycharm
  - redis-app
  - rsyncosx
  - spotify
  - sqlexplorer
  - sqlworkbenchj
  - [Sublime Text](https://www.sublimetext.com/)
  - time-out
  - vagrant-manager
  - virtualc64
  - wireshark
  - xaos

Packages (installed with Homebrew):
  - ack
  - fd
  - fdupes
  - fontconfig
  - fzf
  - gnu-sed
  - httpie
  - jq
  - lftp
  - links
  - nmap
  - parallel
  - psutils
  - pv
  - ssh-copy-id
  - sslscan
  - tcptraceroute
  - watch
  - wget

## Future additions

### Things that still need to be done manually

It's my hope that I can get the rest of these things wrapped up into Ansible playbooks soon, but for now, these steps need to be completed manually (assuming you already have Xcode and Ansible installed, and have run this playbook).

  1. Set JJG-Term as the default Terminal theme (it's installed, but not set as default automatically).
  2. Install [Sublime Package Manager](http://sublime.wbond.net/installation).
  3. Install all the apps that aren't yet in this setup (see below).
  4. Remap Caps Lock to Escape (requires macOS Sierra 10.12.1+).
  5. Set trackpad tracking rate.
  6. Set mouse tracking rate.
  7. Configure extra Mail and/or Calendar accounts (e.g. Google, Exchange, etc.).

### Applications/packages to be added:

These are mostly direct download links, some are more difficult to install because of custom installers or other nonstandard install quirks:

  - [iShowU HD](http://www.shinywhitebox.com/downloads/iShowU_HD_2.3.20.dmg)
  - [Adobe Creative Cloud](http://www.adobe.com/creativecloud.html)

### Configuration to be added:

  - I have vim configuration in the repo, but I still need to add the actual installation:
    ```
    mkdir -p ~/.vim/autoload
    mkdir -p ~/.vim/bundle
    cd ~/.vim/autoload
    curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > pathogen.vim
    cd ~/.vim/bundle
    git clone git://github.com/scrooloose/nerdtree.git
    ```

## Testing the Playbook

Many people have asked me if I often wipe my entire workstation and start from scratch just to test changes to the playbook. Nope! Instead, I posted instructions for how I build a [Mac OS X VirtualBox VM](https://github.com/geerlingguy/mac-osx-virtualbox-vm), on which I can continually run and re-run this playbook to test changes and make sure things work correctly.

Additionally, this project is [continuously tested on Travis CI's macOS infrastructure](https://travis-ci.org/geerlingguy/mac-dev-playbook).

## Ansible for DevOps

Check out [Ansible for DevOps](https://www.ansiblefordevops.com/), which teaches you how to automate almost anything with Ansible.

## Author

[Jeff Geerling](https://www.jeffgeerling.com/), 2014 (originally inspired by [MWGriffin/ansible-playbooks](https://github.com/MWGriffin/ansible-playbooks)).
