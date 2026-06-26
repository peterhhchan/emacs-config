Last updated June 26, 2026.  Emacs version 30.2

## About
An emacs setup for Clojure development, alongside some Python and Rust
hacking.

I run emacs primarily via a GUI (WSL2, Linux and MacOS) and some of
my choices are driven by a desire to have a consistent set of
keybindings.

I use [straight.el](https://github.com/raxod502/straight.el) to help
manage my packages. There may be some redundant `.el` files in the
customizations directory that could be removed.


## Organization
This setup was originally based off
https://github.com/flyingmachine/emacs-for-clojure.

> I've tried to separate everything logically and document the purpose
> of every line. [`init.el`](./init.el) acts as a kind of table of
> contents.  It's a good idea to eventually go through `init.el` and the
> files under the `customizations` directory so that you know exactly
> what's going on.

> In general, if you want to add support for a language then you should
> be able to find good instructions for it through Google. Most of the
> time, you'll just need to install the "x-lang-mode" package for it.
