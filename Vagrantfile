Vagrant.configure('2') do |config|
  config.vm.box = 'ogarcia/archlinux-x64'
  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    ln -s /vagrant /home/vagrant/repo

    sudo pacman -Sy --noconfirm rxvt-unicode-terminfo
    # git needed for `make`
    sudo pacman -Sy --noconfirm git

    mkdir /home/vagrant/build
    cd /home/vagrant/build
    git clone https://github.com/vlang/v
    cd v
    make
    sudo ./v symlink
    v version
  SHELL
end
