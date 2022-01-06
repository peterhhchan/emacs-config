Last updated Jan 5, 2022.  Emacs version 27.1

## About
An emacs setup for Clojure development, alongside some Python and Rust
hacking.

Some of my choices reflect the fact that I typically run Emacs via a
GUI window (WSL2 and native Linux) - as opposed to within a
terminal. For example, the usuage of `tab` in my key-bindings.

This setup was originally based off
https://github.com/flyingmachine/emacs-for-clojure.

I use [straight.el](https://github.com/raxod502/straight.el) to help
manage my packages. There may be some redundant `.el` files in the
customizations directory that could be removed.


**----------- Section below is copy-pasted -----------**

## Organization

I've tried to separate everything logically and document the purpose
of every line. [`init.el`](./init.el) acts as a kind of table of
contents.  It's a good idea to eventually go through `init.el` and the
files under the `customizations` directory so that you know exactly
what's going on.

In general, if you want to add support for a language then you should
be able to find good instructions for it through Google. Most of the
time, you'll just need to install the "x-lang-mode" package for it.
