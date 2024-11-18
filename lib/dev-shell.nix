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

    # Create pre-commit hook
    cat > .git-hooks/pre-commit <<'EOF'
    #!/usr/bin/env sh
    echo "Running nix flake check..."
    nix flake check
    if [ $? -ne 0 ]; then
      echo "Error: nix flake check failed"
      exit 1
    fi
    EOF

    # Make hooks executable
    chmod +x .git-hooks/commit-msg
    chmod +x .git-hooks/pre-commit
  '';
}
