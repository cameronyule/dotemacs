_: {
  projectRootFile = "flake.nix"; # Still relative to the flake root

  programs = {
    # keep-sorted start
    alejandra.enable = true;
    deadnix.enable = true;
    keep-sorted.enable = true;
    statix.enable = true;
    # keep-sorted end
  };

  settings = {
    allow-missing-formatter = false;
    on-unmatched = "fatal";
    verbose = 2;
    global.excludes = [
      ".editorconfig"
    ];
  };
}
