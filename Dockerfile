FROM debian:stable

ARG username=student
ARG tz=America/New_York
ENV TZ=${TZ}
ENV DEBIAN_FRONTEND="noninteractive" TZ="$tz"

# Sets up the container
RUN apt-get -y update && \
    apt-get --fix-broken install && \
    # Fetches essential packages
    apt-get install -y sudo bc dc vim neovim nano git git-doc psmisc tmux wget curl gpg zsh software-properties-common && \
    # Adds a user and creates a home directory
    useradd -ms /usr/bin/zsh $username && \
    # Sets up the user as a sudoer
    echo " ${username} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \

USER $username
WORKDIR /home/$username
SHELL ["/bin/zsh", "-c"]

# C/C++ Tools and OCaml
RUN sudo apt-get install -y build-essential nasm opam m4 python3.9

# Sets up OCaml
RUN opam init -a --disable-sandboxing && \
    eval $(opam env) && \
    opam update -y && \
    opam upgrade -y && \
    eval $(opam env) && \
    opam install -y core core_unix menhir ppx_blob ppx_deriving ppx_inline_test ppx_let shexp yojson utop ounit2 ocaml-lsp-server ocamlformat domainslib && \
    eval $(opam env)

CMD ["zsh"]
