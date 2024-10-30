{ pkgs }:

let
  mkGtk = import ./mkGtk.nix { inherit pkgs; };
  mkCursor = import ./mkCursor.nix { inherit pkgs; };
  mkIcon = import ./mkIcon.nix { inherit pkgs; };
  mkFont = import ./mkFont.nix { inherit pkgs; };

  # TODO: refactor: map attrs at some point to make this more readable
  # TODO: pin to commit hash maybe?

  gtk = {
    "Everforest-Dark" = mkGtk {
      src = {
        url = "https://github.com/Itz-Abhishek-Tiwari/AbyssGreen/raw/refs/heads/main/Source/arcs/Gtk_Everforest-Dark.tar.xz";
        sha256 = "sha256-P2cCgWHvhoGCeGJ9gOo6aSTfMFG9S9axWQNz2suX8ec=";
      };
      gtkName = "Everforest-Dark";
    };
    "Abyssal-Wave" = mkGtk {
      src = {
        url = "https://github.com/Itz-Abhishek-Tiwari/Abyssal-Wave/raw/refs/heads/main/Source/arcs/Gtk_Abyssal-Wave.tar.xz";
        sha256 = "sha256-Yq+YnyrUWKNR+cbz94xIK1CfnBlZjT3fmB0U87y6aOw=";
      };
      gtkName = "Abyssal-Wave";
    };
    "Bad-Blood" = mkGtk {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Bad-Blood/Source/Gtk_Bad-Blood.tar.gz";
        sha256 = "sha256-asVpbNkPJG9YEWI/8qnOUHLI1C3NRzgczA15fmvhxCo=";
      };
      gtkName = "Bad-Blood";
    };
    "Catppuccin-Latte" = mkGtk {
      src = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/refs/heads/Cat-Latte/Source/arcs/Gtk_Catppuccin-Latte.tar.xz";
        sha256 = "sha256-G9YVhFZg+aiE1TFyLE524dPL4ZmP6jFtxMQWLLYGirs=";
      };
      gtkName = "Catppuccin-Latte";
    };
    "Catppuccin-Mocha" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Catppuccin-Mocha/Source/Gtk_CatppuccinMocha.tar.gz";
        sha256 = "sha256-DPSKSDxwxByj59nU5EUtb5APeGdLeJ+/61AqX21OylI=";
      };
      gtkName = "Catppuccin-Mocha";
    };
    "Decay-Green" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Decay-Green/Source/Gtk_DecayGreen.tar.gz";
        sha256 = "sha256-0MC9DvZ4LMs/Or6Bs6FBLzw5LneN+phZdJ7hR8UC95M=";
      };
      gtkName = "Decay-Green";
    };
    "Dracula" = mkGtk {
      src = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/Dracula/Source/arcs/Gtk_Dracula.tar.xz";
        sha256 = "sha256-IIDF5RstR0NPSVgIH87s40RFvTpz6ZTshf/XeiXEajc=";
      };
      gtkName = "Dracula";
    };
    "Edge-Runner" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Edge-Runner/Source/Gtk_EdgeRunner.tar.gz";
        sha256 = "sha256-hJ3ptDxqmz5mGWQ+QL2KbaDhJ8Qxgyhh8NoQUXmFR08=";
      };
      gtkName = "Edge-Runner";
    };
    "Frosted-Glass" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Frosted-Glass/Source/Gtk_FrostedGlass.tar.gz";
        sha256 = "sha256-FzV0opEtmloVniGM3waxqX0iFlCpdGIQI7rBa7FdFzo=";
      };
      gtkName = "Frosted-Glass";
    };
    "Graphite-Mono" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Graphite-Mono/Source/Gtk_GraphiteMono.tar.gz";
        sha256 = "sha256-akRe15wNUI3iiRUFjM2JXjm/fNFHdYT6Tw27oMWAGQs=";
      };
      gtkName = "Graphite-Mono";
    };
    "Greenify" = mkGtk {
      src = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Greenify/Source/arcs/Gtk_Greenify.tar.gz";
        sha256 = "sha256-biFyZKer7RFKndWy9rLlJTfr7/UQdOjQBaOmSjZZxsY=";
      };
      gtkName = "Greenify";
    };
    "Gruvbox-Retro" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Gruvbox-Retro/Source/Gtk_GruvboxRetro.tar.gz";
        sha256 = "sha256-IEu7f57pr7gOMR6LS4tRiJ3QYj0llBHf+JQE6RXwkyE=";
      };
      gtkName = "Gruvbox-Retro";
    };
    "Hackthebox" = mkGtk {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/arcs/Gtk_Hack%20the%20Box.tar.gz";
        sha256 = "sha256-WHo3PCwlLFoIoV+0+YVOP3zKU5nZiPvFb183nvOTOM4=";
      };
      gtkName = "Hackthebox";
    };
    "VALYRIAN-Blue-Steel" = mkGtk {
      src = {
        url = "https://github.com/saber-88/Ice-Age/raw/refs/heads/main/Source/arcs/Gtk_VALYRIAN-Blue-Steel.tar.gz";
        sha256 = "sha256-jK+3S/67vp8qPpwU4ZYyt+GczMCbGKf13unr73J8VvU=";
      };
      gtkName = "VALYRIAN-Blue-Steel";
    };
    "Material-Sakura" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Material-Sakura/Source/Gtk_MaterialSakura.tar.gz";
        sha256 = "sha256-TMe+nBJQxu6pOg08o4tnBhSf1OdjBbH6R75ZkAR4g9M=";
      };
      gtkName = "Material-Sakura";
    };
    "Monokai" = mkGtk {
      src = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Monokai/Source/arcs/Gtk_Monokai.tar.gz";
        sha256 = "sha256-10vd8AhYnT4lI75cYK5xfth6OIHwvIMJiVdoH6TRbRk=";
      };
      gtkName = "Monokai";
    };
    "WhiteSur-Dark" = mkGtk {
      src = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Gtk_WhiteSur-Dark.tar.xz";
        sha256 = "sha256-Ux1WdD77rYuG6hsUd1jtTj6oykdlKq8UMKRtnjVmd3U=";
      };
      gtkName = "WhiteSur-Dark";
    };
    "Nordic-Blue" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Nordic-Blue/Source/Gtk_NordicBlue.tar.gz";
        sha256 = "sha256-Xnt2ZG111nCD00dTyBf6LictAdgAQeFJUVYpr9RMf1o=";
      };
      gtkName = "Nordic-Blue";
    };
    "One-Dark" = mkGtk {
      src = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/One-Dark/Source/arcs/Gtk_One%20Dark.tar.xz";
        sha256 = "sha256-PXjSR+mIE9AjhfxDbi5OCDX9BuIqOq/qvMGeZafdai8=";
      };
      gtkName = "One-Dark";
    };
    "Oxo-Carbon" = mkGtk {
      src = {
        url = "https://github.com/rishav12s/Oxo-Carbon/raw/refs/heads/Oxo-Carbon/Source/arcs/Gtk_Oxo-Carbon.tar.gz";
        sha256 = "sha256-wFv92WxWNsfvXUrTSXhEddQ663RYnQ3VCi6evNgwJQI=";
      };
      gtkName = "Oxo-Carbon";
    };
    "Sweet-Dark" = mkGtk {
      src = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/refs/heads/Paranoid-Sweet/Source/arcs/Gtk_Sweet.tar.gz";
        sha256 = "sha256-TvrBf3ReCuUxAPlUlsIiGWkTbk+dy/WXp6Q+7sJWH7w=";
      };
      gtkName = "Sweet-Dark";
    };
    "Pixel-Dream" = mkGtk {
      src = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/refs/heads/Pixel-Dream/Source/arcs/Gtk_Pixel-Dream.tar.gz";
        sha256 = "sha256-/6G24jtxKkjeJiS4eMW9TFsuF5TafoiGHV4oChldgkc=";
      };
      gtkName = "Pixel-Dream";
    };
    "Rain-Dark" = mkGtk {
      src = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/refs/heads/Rain-Dark/Source/arcs/Gtk_Rain-Dark.tar.gz";
        sha256 = "sha256-O8wSFSYzMUxLKgW4SxNquDKxfkcldFLS7+pcVPWtzpY=";
      };
      gtkName = "Rain-Dark";
    };
    "Red-Stone" = mkGtk {
      src = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Red-Stone/Source/arcs/Gtk_Red-Stone.tar.gz";
        sha256 = "sha256-gKZOzqmsn7Nq243ETJEsf8/X/rMTobVMvK2+ZWlAhWY=";
      };
      gtkName = "Red-Stone";
    };
    "Rose-Pine" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Rose-Pine/Source/Gtk_RosePine.tar.gz";
        sha256 = "sha256-ckYU6apCV7zs2K0T6VcrJXayBrVYAPpDAblCNnE3/0Q=";
      };
      gtkName = "Rose-Pine";
    };
    "Sci-fi" = mkGtk {
      src = {
        url = "https://github.com/KaranRaval123/Sci-fi/raw/refs/heads/main/Source/arcs/Gtk_Sci_fi.tar.gz";
        sha256 = "sha256-CeXAXj0EqP3YDIBezre9L7AeBgS1HtiW6e5vB+QGY0Y=";
      };
      gtkName = "Sci-fi";
    };
    "Solarized Dark" = mkGtk {
      src = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/refs/heads/Solarized-Dark/Source/arcs/Gtk_Solarized-Dark.tar.gz";
        sha256 = "sha256-WgKOxXFXH3JNERdvK6bkazRczlVjvm4BfiO4ZnjbYac=";
      };
      gtkName = "Solarized Dark";
    };
    "Synth-Wave" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Synth-Wave/Source/Gtk_SynthWave.tar.xz";
        sha256 = "sha256-1fGpp5G0AkShDxd9pK+mmQvGqtvFIhezWjD16bZizcs=";
      };
      gtkName = "Synth-Wave";
    };
    "Tokyo-Night" = mkGtk {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Tokyo-Night/Source/Gtk_TokyoNight.tar.gz";
        sha256 = "sha256-caflnEo9hNpjTAIsbnjoktz2Zaz2P02dcvdWNZ4l2s4=";
      };
      gtkName = "Tokyo-Night";
    };
    "Windows-11" = mkGtk {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Windows-11/Source/arcs/Gtk_Windows%2011.tar.xz";
        sha256 = "sha256-A9+724c8YsdS+5PMnTK1GkJqQvhpdf5Pj3x6UjVZ3Qc=";
      };
      gtkName = "Windows-11";
    };
    "MacOS" = mkGtk {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Mac-Os/Source/arcs/Gtk_Mac%20OS.tar.gz";
        sha256 = "sha256-A9+724c8YsdS+5PMnTK1GkJqQvhpdf5Pj3x6UjVZ3Qc=";
      };
      gtkName = "MacOS";
    };
  };

  icon = {
    "Gruvbox-Plus-Dark" = mkIcon {
      src = {
        url = "https://github.com/Itz-Abhishek-Tiwari/AbyssGreen/raw/refs/heads/main/Source/arcs/Icon_Gruvbox-Plus-Dark.tar.gz";
        sha256 = "sha256-1L7OQY6L7UbnY0GKsnowJcTu1El20yb8o3Bk+0akqLI=";
      };
      iconName = "Gruvbox-Plus-Dark";
    };
    "Papirus-kanagawa" = mkIcon {
      src = {
        url = "https://github.com/Itz-Abhishek-Tiwari/Abyssal-Wave/raw/refs/heads/main/Source/arcs/Icon_Papirus-kanagawa.tar.xz";
        sha256 = "sha256-0WZ3DAzvXE+IcFVywsWurbYr6iMbfYmCVtDxFg//1rQ=";
      };
      iconName = "Papirus-kanagawa";
    };
    "besgnulinux-mono-red" = mkIcon {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Bad-Blood/Source/Icon_Bad-Blood.tar.gz";
        sha256 = "sha256-estW+9fxlZ8rMYLw4gSIIySUOihDiN/VN5BA1sQyktQ=";
      };
      iconName = "besgnulinux-mono-red";
    };
    "Papirus-Latte" = mkIcon {
      src = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/refs/heads/Cat-Latte/Source/arcs/Icon_Papirus-Latte.tar.xz";
        sha256 = "sha256-s2cImk31Cex3ZD2zFQc8j9Bx33RGenY2/MtzVrmwkj8=";
      };
      iconName = "Papirus-Latte";
    };
    "Papirus" = mkIcon {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/arcs/Icon_Hack%20the%20Box.tar.gz";
        sha256 = "sha256-f904B1OHHShv5Xv4F51otr2pCnEkKqVT93PUd8M+Wek=";
      };
      iconName = "Papirus";
    };
    "Tela-circle-grey" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Catppuccin-Latte/Source/Icon_TelaGrey.tar.gz";
        sha256 = "sha256-YiHeXb17vt8EEGOmtcEn80n5e08I/OoUa3cLRZHXKF0=";
      };
      iconName = "Tela-circle-grey";
    };
    "Tela-circle-dracula" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Catppuccin-Mocha/Source/Icon_TelaDracula.tar.gz";
        sha256 = "sha256-MfMW9aLyopvcqtscoDYDlGoX7qmwV5ZJZcEwaVvU9vw=";
      };
      iconName = "Tela-circle-dracula";
    };
    "Tela-circle-green" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Decay-Green/Source/Icon_TelaGreen.tar.gz";
        sha256 = "sha256-CMgaSYxHZsfZaxffXo2Z/lhnTKrGCuv4VsOC9Yo39vA=";
      };
      iconName = "Tela-circle-green";
    };
    "Azure-Dark-Icons" = mkIcon {
      src = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/Dracula/Source/arcs/Icon_Azure-Dark-Icons.tar.gz";
        sha256 = "sha256-G22sGRng3vUnsHKSttME+HsvKtNIH/rRidksFC59rek=";
      };
      iconName = "Azure-Dark-Icons";
    };
    "Tela-circle-yellow" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Edge-Runner/Source/Icon_TelaYellow.tar.gz";
        sha256 = "sha256-dr/AQlmBX08Q2B83HBjbfAlvTiL5REgYwIp8RVu+ORE=";
      };
      iconName = "Tela-circle-yellow";
    };
    "Tela-circle-blue" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Frosted-Glass/Source/Icon_TelaBlue.tar.gz";
        sha256 = "sha256-lZbY/T5rJgw6AucLdrEj9C/yPhCvzCYJhCZjCYRfwsw=";
      };
      iconName = "Tela-circle-blue";
    };
    "Hackthebox" = mkIcon {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/arcs/Icon_Hack%20the%20Box.tar.gz";
        sha256 = pkgs.lib.fakeHash;
      };
      iconName = "Hackthebox";
    };
    "Breeze-Noir-White-Blue" = mkIcon {
      src = {
        url = "https://github.com/saber-88/Ice-Age/raw/refs/heads/main/Source/arcs/Icon_Breeze-Noir-White-Blue.tar.gz";
        sha256 = "sha256-H2T0oRlVGudFC3wpWFe5g2Sfkku4dgGMnpzJ4lpznW0=";
      };
      iconName = "Breeze-Noir-White-Blue";
    };
    "Tela-circle-black" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Material-Sakura/Source/Icon_TelaBlack.tar.gz";
        sha256 = "sha256-mreVKUDAPUWFTnaHkA5OQABzwG1/w4f1RhQm+c/iIR4=";
      };
      iconName = "Tela-circle-black";
    };
    "Monokai" = mkIcon {
      src = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Monokai/Source/arcs/Icon_Monokai.tar.gz";
        sha256 = "sha256-10vd8AhYnT4lI75cYK5xfth6OIHwvIMJiVdoH6TRbRk=";
      };
      iconName = "Monokai";
    };
    "WhiteSur" = mkIcon {
      src = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Icon_WhiteSur.tar.xz";
        sha256 = "sha256-G/XLZEd6U3CNZK7OZZ3X+8FPNLqDPlbwxMZo8kCJcAo=";
      };
      iconName = "WhiteSur";
    };
    "Nordzy" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Nordic-Blue/Source/Icon_NordicBlue.tar.gz";
        sha256 = "sha256-zZAk86MNfxufvAnUt3PjNDe4S1maI4yRMjaQmOMsoT0=";
      };
      iconName = "Nordzy";
    };
    "One-Dark" = mkIcon {
      src = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/One-Dark/Source/arcs/Icon_One%20Dark.tar.gz";
        sha256 = "sha256-V+RkRCwPZZbZ1gnQdt9FJ/hW/JUtonnotgSpyXY9rO8=";
      };
      iconName = "One-Dark";
    };
    "Tela-circle-pink" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Rose-Pine/Source/Icon_TelaPink.tar.gz";
        sha256 = "sha256-RAjFd37+vC0qSezKvtTqkheBxAr3N85heMbUIq+bSs4=";
      };
      iconName = "Tela-circle-pink";
    };
    "candy-icons" = mkIcon {
      src = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/refs/heads/Paranoid-Sweet/Source/arcs/Icon_Candy.tar.gz";
        sha256 = "sha256-Xzld5QTZe24afALPviBmuTYTCVeScFYmn+GAn9/tf0Y=";
      };
      iconName = "candy-icons";
    };
    "pixel-dream" = mkIcon {
      src = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/refs/heads/Pixel-Dream/Source/arcs/Icon_pixel-dream.tar.gz";
        sha256 = pkgs.lib.fakeHash;
      };
      iconName = "pixel-dream";
    };
    "Rain-Dark" = mkIcon {
      src = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/refs/heads/Rain-Dark/Source/arcs/Icon_Rain-Dark.tar.gz";
        sha256 = "sha256-O8wSFSYzMUxLKgW4SxNquDKxfkcldFLS7+pcVPWtzpY=";
      };
      iconName = "Rain-Dark";
    };
    "Tela-circle-red" = mkIcon {
      src = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Red-Stone/Source/arcs/Icon_Tela-circle-red.tar.gz";
        sha256 = "sha256-2sMtIWTY3SrhNJNbEyYAsgYgPu9oAeyX1sSLTjr6kG4=";
      };
      iconName = "Tela-circle-red";
    };
    "Tela-circle-hotred" = mkIcon {
      src = {
        url = "https://github.com/abenezerw/Scarlet-Night/raw/refs/heads/main/Source/arcs/Icon_Tela-circle-hotred.tar.gz";
        sha256 = "sha256-WfjhjOto3MPuiZFzZcsWMkbBqGo4o8ImKiGsNo2/+Nk=";
      };
      iconName = "Tela-circle-hotred";
    };
    "cyberpunk-technotronic-icon-theme" = mkIcon {
      src = {
        url = "https://github.com/KaranRaval123/Sci-fi/raw/refs/heads/main/Source/arcs/Icon_Cyberpunk.tar.gz";
        sha256 = "sha256-sA/WCZvReQmHxphurCa3YrMQ15PsL8jHl3jJ5EK48vU=";
      };
      iconName = "cyberpunk-technotronic-icon-theme";
    };
    "Tela-circle-solarized" = mkIcon {
      src = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/refs/heads/Solarized-Dark/Source/arcs/Icon_Tela-circle-solarized.tar.gz";
        sha256 = "sha256-cEDMJLEst9Yd6y60FNVFG3vN2CgPYrTA0YF2fy0LsLA=";
      };
      iconName = "Tela-circle-solarized";
    };
    "BeautyLine" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Synth-Wave/Source/Icon_SynthWave.tar.gz";
        sha256 = "sha256-lDn/x3CPGZ7ROIKg4n53GcBhbaUMSsooChLpzoNvB6Q=";
      };
      iconName = "BeautyLine";
    };
    "Tela-circle-purple" = mkIcon {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Tokyo-Night/Source/Icon_TelaPurple.tar.gz";
        sha256 = "sha256-/Ck0sDJx7pFmkXt56L9b3wSQvUmBqoaAsbjZazcmLM4=";
      };
      iconName = "Tela-circle-purple";
    };
    "Windows-11" = mkIcon {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Windows-11/Source/arcs/Icon_Windows%2011.tar.gz";
        sha256 = "sha256-fI2BJ+5ppVjRFVLytzXfQ8Blgq3YwJpNa0Db+9BW10s=";
      };
      iconName = "Windows-11";
    };
    "MacOS" = mkIcon {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Mac-Os/Source/arcs/Icon_Mac%20OS.tar.xz";
        sha256 = "sha256-fI2BJ+5ppVjRFVLytzXfQ8Blgq3YwJpNa0Db+9BW10s=";
      };
      iconName = "MacOS";
    };
  };

  cursor = {
    "Night-Diamond-Red" = mkCursor {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Bad-Blood/Source/Cursor_Bad-Blood.tar.gz";
        sha256 = "sha256-EsXdieI5zmi+3tdAFiP++4jVMAQ2m3N7xYO6GEFoMJg=";
      };
      cursorName = "Night-Diamond-Red";
    };
    "Bibata-Modern-Classic" = mkCursor {
      src = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/refs/heads/Cat-Latte/Source/arcs/Cursor_Bibata-Modern-Classic.tar.xz";
        sha256 = "sha256-tvDOUMHabisqPL1T06fp96CTjLyJGWp7Re+zdB0kD1g=";
      };
      cursorName = "Bibata-Modern-Classic";
    };
    "Dracula-cursors" = mkCursor {
      src = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/Dracula/Source/arcs/Cursor_Dracula.tar.gz";
        sha256 = "sha256-21kS+Ob6fEyWHHsWcSSGyPGf5vcbql/woqmfJN4Mj+s=";
      };
      cursorName = "Dracula-cursors";
    };
    "Gruvbox-Retro" = mkCursor {
      src = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Gruvbox-Retro/Source/Cursor_Gruvbox.tar.gz";
        sha256 = "sha256-/6XLeDmDAWgQKt+t9y0Etx9hlkRvaHmH02LRddUlO/I=";
      };
      cursorName = "Gruvbox-Retro";
    };
    "HackCursor" = mkCursor {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/arcs/Cursor_Hack%20the%20Box.tar.gz";
        sha256 = "sha256-O0qXfHEYN1VzQFrRV6l8cn17rsLytDKJnHX4MaPYgpY=";
      };
      cursorName = "HackCursor";
    };
    "Bibata-Modern-Ice" = mkCursor {
      src = {
        url = "https://github.com/prasanthrangan/hyprdots/raw/refs/heads/main/Source/arcs/Cursor_BibataIce.tar.gz";
        sha256 = "sha256-1stJ6CoRrfxa4W1op0x36KvqlTaxB55lvV7EUJB/Jeo=";
      };
      cursorName = "Bibata-Modern-Ice";
    };
    "macOS-Black" = mkCursor {
      src = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Cursor_macOS-Black.tar.xz";
        sha256 = "sha256-nk94mTFX0TTLgEnx7/clLgSxwBK9g4HUy2Vj2tL9i0U=";
      };
      cursorName = "macOS-Black";
    };
    "onedark-cursor" = mkCursor {
      src = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/One-Dark/Source/arcs/Cursor_One%20Dark.tar.gz";
        sha256 = "sha256-nclZMZWrXJMF09fZ824zjN8s2O/sPV8SbTM5M815rro=";
      };
      cursorName = "onedark-cursor";
    };
    "Capitaine-Cursors" = mkCursor {
      src = {
        url = "https://github.com/rishav12s/Oxo-Carbon/raw/refs/heads/Oxo-Carbon/Source/arcs/Cursor_Capitaine-Cursors.tar.xz";
        sha256 = "sha256-+0D+Kjl2tQq2ASL/uyPgYQfINVs69zb91blcp4KLawo=";
      };
      cursorName = "Capitaine-Cursors";
    };
    "Sweet-cursors" = mkCursor {
      src = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/refs/heads/Paranoid-Sweet/Source/arcs/Cursor_Sweet.tar.gz";
        sha256 = "sha256-eHTwva4ohV65PReJF5P5Hm+suATDbLk51w43R79kqhg=";
      };
      cursorName = "Sweet-cursors";
    };
    "pixel-dream-cursor" = mkCursor {
      src = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/refs/heads/Pixel-Dream/Source/arcs/Cursor_pixel-dream-cursor.tar.gz";
        sha256 = "sha256-rSeu789ginRkw75cGLQ3YtweEtfraW2KSKADIiMg9LE=";
      };
      cursorName = "pixel-dream-cursor";
    };
    "Capitaine-Cursors-Tokyonight" = mkCursor {
      src = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/refs/heads/Rain-Dark/Source/arcs/Cursor_Capitaine-Cursors-Tokyonight.tar.xz";
        sha256 = "sha256-d3byEET0i55vqmx0YykHetkC1V2Xvkr9lbPR2e1h9vQ=";
      };
      cursorName = "Capitaine-Cursors-Tokyonight";
    };
    "Capitaine-Cursors-White" = mkCursor {
      src = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/refs/heads/Solarized-Dark/Source/arcs/Cursor_Capitaine-Cursors-White.tar.xz";
        sha256 = "sha256-1bqJDSNyGK3vGQxAwEfxp34JvjPxw4rDhUM4TN8Pb+U=";
      };
      cursorName = "Capitaine-Cursors-White";
    };
    "Cursor-Windows" = mkCursor {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Windows-11/Source/arcs/Cursor_Windows%2011.tar.gz";
        sha256 = "sha256-Rx7Vs9MR0VL0H912FF2Y8Vn80psb9afW/1BF4nHbpvA=";
      };
      cursorName = "Cursor-Windows";
    };
    "MacOS-Cursor" = mkCursor {
      src = {
        url = "https://github.com/HyDE-Project/hyde-gallery/blob/Mac-Os/Source/arcs/Cursor_Mac%20OS.tar.gz";
        sha256 = "sha256-Rx7Vs9MR0VL0H912FF2Y8Vn80psb9afW/1BF4nHbpvA=";
      };
      cursorName = "MacOS-Cursor";
    };
  };
  font = {
    "SF" = mkFont {
      src = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Font_SF%20Pro%20Rounded%20Regular%2010.5.tar.xz";
        sha256 = "sha256-evawP8zNSYqGat/DjjuE2qT45/7cCsJdPK7lUSFhBjs=";
      };
      fontName = "SF";
    };
    "Monocraft Nerd Font Book" = mkFont {
      src = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/refs/heads/Pixel-Dream/Source/arcs/Font_Monocraft-Nerd-Font-Book.tar.gz";
        sha256 = "sha256-XtyZvuDoToBRSz97vyShVrDr7y6QmjiKanDbZbVO7zI=";
      };
      fontName = "Monocraft Nerd Font Book";
    };
  };

in
{
  inherit
    gtk
    icon
    cursor
    font
    ;
}
