{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    commitlint
    pnpm
    direnv
    nix-direnv
  ];

  shellHook = ''
    export USE_DIRENV=1

    # Install dependencies and setup husky if needed
    if [ ! -d "node_modules" ]; then
      pnpm install
      pnpm prepare
    fi

    # Set up commit-msg hook if it doesn't exist
    mkdir -p .husky
    echo '#!/usr/bin/env sh
    pnpm dlx commitlint --edit "$1"' > .husky/commit-msg
    chmod +x .husky/commit-msg
  '';
}
