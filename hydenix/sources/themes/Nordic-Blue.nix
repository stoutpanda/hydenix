{ pkgs, mkTheme }:
mkTheme rec {
  name = "Nordic Blue";
  src = pkgs.fetchFromGitHub {
    owner = "HydeProject";
    repo = "hyde-themes";
    rev = "Nordic-Blue";
    name = name;
    sha256 = "sha256-YyuwnWvd8hMOetFsGpEvk5uiny55mMpSKqhhWzUTwL8=";
  };

  arcs = {
    gtk = "Nordic-Blue";
    icon = "Nordzy";
  };

  meta = {
    description = "HyDE Theme: Nordic Blue";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Nordic-Blue";
    priority = 100;
  };
}
