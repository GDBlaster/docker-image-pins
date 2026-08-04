# Docker Image Pins

$\color{#ff0000}\textsf{This is a Work In Progress and not functional yet. I'll remove this message once it is.}$

This flake outputs a collection of oci image tag indexed hashes for use in nix.

## Why?

This allows your docker images to be managed by your flake.lock.

This is Meant for [Arion](https://github.com/hercules-ci/arion) but it will work for anything that takes a docker image as a nix string.

## How does this work?

there is a list of images. Every day a CI job pulls all the manifests and commits them into a nix file.

## How do I use it?

0) Add this flake to your inputs
0) In places where you use a docker image in nix replace the string literal with `dockerPins.withHash."<IMAGENAME>".<TAG>` replacing the <> with their contents for example `image = "ghcr.io/hotio/jellyfin:latest";` would be replaced by `image = dockerPins.withHash."gcr.io/hotio/jellyfin".latest` (if the desired image isnt in the list just make a PR to add it).
0) Your images will be pinned to the lastest hash for your tag at the moment you last updated this input.
