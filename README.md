# Docker Image Pins

This flake outputs a collection of oci image tag indexed hashes for use in nix.

## Why?

This allows your docker images to be managed by your flake.lock.

This is Meant for [Arion](https://github.com/hercules-ci/arion) but it will work for anything that takes a docker image as a nix string.

## How does this work?

there is a list of images. Every day a CI job pulls all the manifests and commits them into a nix file.

## How do I use it?

1) Add this flake to your flake inputs:
```nix
  inputs = {
    docker-pins.url = "github:GDBlaster/docker-image-pins";
  };
```
2) In places where you use a docker image in nix replace the string literal with `inputs.docker-pins.lib."<IMAGENAME>".<TAG>` replacing the <> with their contents for example `image = "ghcr.io/hotio/jellyfin:latest";` would be replaced by `image = inputs.docker-pins.lib."gcr.io/hotio/jellyfin".latest` (if the desired image isnt in the list just make a PR to add it).
3) Your images will be pinned to the lastest hash for your tag at the moment you last updated this input.

## Design notes:

The code is bad and not scalable however it is more than sufficient for the current scope. I wrote this because I needed it I will improve it if I ever need to scale it up. If you need it to be better make a PR.
