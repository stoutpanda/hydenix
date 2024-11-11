{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    commitlint
    direnv
    nix-direnv
  ];

  shellHook = ''
    export USE_DIRENV=1

    # Set up git hooks directory
    git config core.hooksPath .git-hooks

    # Ensure .git-hooks directory exists
    mkdir -p .git-hooks

    # Create commit-msg hook
    cat > .git-hooks/commit-msg <<'EOF'
    #!/usr/bin/env sh
    ${pkgs.commitlint}/bin/commitlint --edit "$1"
    EOF

    # Make hook executable
    chmod +x .git-hooks/commit-msg
  '';
}
