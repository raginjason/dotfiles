# ragin jason's dotfiles

## Design Considerations

### devcontainers

VS Code and and the devcontainer extension uses the following flow regarding `~/.gitconfig`:

1. If there is no `~/.gitconfig` in the container, copy one in from the host
2. Augment `~/.gitconfig` with credentials helper

In the context of dotfiles management, this means either of the following work:

* Do nothing and let VS Code copy the `~/.gitconfig` from your host OS into the container by virtue of it not previously existing in the container
* Have your dotfiles process copy or create a complete `~/.gitconfig`

In reality, the first option is likely the best place to start, as most or all of your `~/.gitconfig` settings that apply to the host should apply to the devcontiainer.

## Usage

Setup environment in a new computer

```
git clone https://github.com/raginjason/dotfiles.git
cd dotfiles
./bootstrap-personal.sh # Or any other ./bootstrap-<machine role>.sh
```