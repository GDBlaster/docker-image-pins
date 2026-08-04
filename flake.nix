{
  description = "Docker Images Pins";

  outputs = { ... }: {
    lib = import ./images.nix;
  };
}
