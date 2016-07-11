FROM pataquets/vim

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install \
      ca-certificates \
      git-core \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

ADD .vimrc /root/

RUN \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall
