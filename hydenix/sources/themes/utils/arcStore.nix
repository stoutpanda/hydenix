{ pkgs }:

let
  mkGtk = import ./mkGtk.nix { inherit pkgs; };
  mkCursor = import ./mkCursor.nix { inherit pkgs; };
  mkIcon = import ./mkIcon.nix { inherit pkgs; };
  mkFont = import ./mkFont.nix { inherit pkgs; };

  sources = {

    gtk = {
      "Everforest-Dark" = {
        url = "https://github.com/Itz-Abhishek-Tiwari/AbyssGreen/raw/refs/heads/main/Source/arcs/Gtk_Everforest-Dark.tar.xz";
        hash = "sha256-P2cCgWHvhoGCeGJ9gOo6aSTfMFG9S9axWQNz2suX8ec=";
      };
      "Abyssal-Wave" = {
        url = "https://github.com/Itz-Abhishek-Tiwari/Abyssal-Wave/raw/refs/heads/main/Source/arcs/Gtk_Abyssal-Wave.tar.xz";
        hash = "sha256-Yq+YnyrUWKNR+cbz94xIK1CfnBlZjT3fmB0U87y6aOw=";
      };
      "Bad-Blood" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Bad-Blood/Source/Gtk_Bad-Blood.tar.gz";
        hash = "sha256-CWYOZVQjA9cavf8iptjot3EVrgEoyuXmL8T+boFpHAc=";
      };
      "Catppuccin-Latte" = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/refs/heads/Cat-Latte/Source/arcs/Gtk_Catppuccin-Latte.tar.xz";
        hash = "sha256-NLrDv7oLzceqILkassGOyNSVAxIXWMIyBRV2/rM4j8I=";
      };
      "Catppuccin-Mocha" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Catppuccin-Mocha/Source/Gtk_CatppuccinMocha.tar.gz";
        hash = "sha256-DPSKSDxwxByj59nU5EUtb5APeGdLeJ+/61AqX21OylI=";
      };
      "Decay-Green" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Decay-Green/Source/Gtk_DecayGreen.tar.gz";
        hash = "sha256-j+isQgrfSrfK9kbmkoEAU1obbqz9wcKxJpEKPZFFLic=";
      };
      "Dracula" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/Dracula/Source/arcs/Gtk_Dracula.tar.xz";
        hash = "sha256-iUgOFNw6tBtTbkSuehgp9tMbRr9Z+jRonZwXz1aqwPw=";
      };
      "Edge-Runner" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Edge-Runner/Source/Gtk_EdgeRunner.tar.gz";
        hash = "sha256-zbhOXgd2cJmFDCh+KufhJ4KICUuafmVJAYMgROpNEUk=";
      };
      "Frosted-Glass" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Frosted-Glass/Source/Gtk_FrostedGlass.tar.gz";
        hash = "sha256-VAQ8hYKVoBnb+o7SkFmwDTKe/lqZvRdvOjCgVJ9Sueg=";
      };
      "Graphite-Mono" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Graphite-Mono/Source/Gtk_GraphiteMono.tar.gz";
        hash = "sha256-ImRaZSSH1X6rAqp/uI4dU5CnuapW7Duzhbs1qsdMcG8=";
      };
      "Greenify" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Greenify/Source/arcs/Gtk_Greenify.tar.gz";
        hash = "sha256-SBlWUXxTuA+b54VX0goSxrnNRDwQiCcGEHcOH1IEjms=";
      };
      "Gruvbox-Retro" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Gruvbox-Retro/Source/Gtk_GruvboxRetro.tar.gz";
        hash = "sha256-UfBtBpuVYG6TmXJKchCfhOs719PqKQM2EzUWEijnJwM=";
      };
      "Hackthebox" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/arcs/Gtk_Hack%20the%20Box.tar.gz";
        hash = "sha256-stoCSCdweVXdo5oTgqk02nduyjRnS92iBqzzNAoP/eE=";
      };
      "VALYRIAN-Blue-Steel" = {
        url = "https://github.com/saber-88/Ice-Age/raw/refs/heads/main/Source/arcs/Gtk_VALYRIAN-Blue-Steel.tar.gz";
        hash = "sha256-jK+3S/67vp8qPpwU4ZYyt+GczMCbGKf13unr73J8VvU=";
      };
      "Material-Sakura" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Material-Sakura/Source/Gtk_MaterialSakura.tar.gz";
        hash = "sha256-TMe+nBJQxu6pOg08o4tnBhSf1OdjBbH6R75ZkAR4g9M=";
      };
      "Monokai" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Monokai/Source/arcs/Gtk_Monokai.tar.gz";
        hash = "sha256-6BmaQh4NMAeiXF9C+l8YS7QrR6Nf/k8AK6P11VeD+WI=";
      };
      "WhiteSur-Dark" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Gtk_WhiteSur-Dark.tar.xz";
        hash = "sha256-Ux1WdD77rYuG6hsUd1jtTj6oykdlKq8UMKRtnjVmd3U=";
      };
      "Nordic-Blue" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Nordic-Blue/Source/Gtk_NordicBlue.tar.gz";
        hash = "sha256-Xnt2ZG111nCD00dTyBf6LictAdgAQeFJUVYpr9RMf1o=";
      };
      "One-Dark" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/One-Dark/Source/arcs/Gtk_One%20Dark.tar.xz";
        hash = "sha256-PXjSR+mIE9AjhfxDbi5OCDX9BuIqOq/qvMGeZafdai8=";
      };
      "Oxo-Carbon" = {
        url = "https://github.com/rishav12s/Oxo-Carbon/raw/refs/heads/Oxo-Carbon/Source/arcs/Gtk_Oxo-Carbon.tar.gz";
        hash = "sha256-wFv92WxWNsfvXUrTSXhEddQ663RYnQ3VCi6evNgwJQI=";
      };
      "Sweet-Dark" = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/refs/heads/Paranoid-Sweet/Source/arcs/Gtk_Sweet.tar.gz";
        hash = "sha256-TvrBf3ReCuUxAPlUlsIiGWkTbk+dy/WXp6Q+7sJWH7w=";
      };
      "Pixel-Dream" = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/refs/heads/Pixel-Dream/Source/arcs/Gtk_Pixel-Dream.tar.gz";
        hash = "sha256-/6G24jtxKkjeJiS4eMW9TFsuF5TafoiGHV4oChldgkc=";
      };
      "Rain-Dark" = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/refs/heads/Rain-Dark/Source/arcs/Gtk_Rain-Dark.tar.gz";
        hash = "sha256-2xLE/wmck51dUKby/beeueod6dtS9zm9a9JMM/8WnJo=";
      };
      "Red-Stone" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Red-Stone/Source/arcs/Gtk_Red-Stone.tar.gz";
        hash = "sha256-gKZOzqmsn7Nq243ETJEsf8/X/rMTobVMvK2+ZWlAhWY=";
      };
      "Rose-Pine" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Rose-Pine/Source/Gtk_RosePine.tar.gz";
        hash = "sha256-ckYU6apCV7zs2K0T6VcrJXayBrVYAPpDAblCNnE3/0Q=";
      };
      "Sci-fi" = {
        url = "https://github.com/KaranRaval123/Sci-fi/raw/refs/heads/main/Source/arcs/Gtk_Sci_fi.tar.gz";
        hash = "sha256-CeXAXj0EqP3YDIBezre9L7AeBgS1HtiW6e5vB+QGY0Y=";
      };
      "Solarized Dark" = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/refs/heads/Solarized-Dark/Source/arcs/Gtk_Solarized-Dark.tar.gz";
        hash = "sha256-WgKOxXFXH3JNERdvK6bkazRczlVjvm4BfiO4ZnjbYac=";
      };
      "Synth-Wave" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Synth-Wave/Source/Gtk_SynthWave.tar.xz";
        hash = "sha256-1fGpp5G0AkShDxd9pK+mmQvGqtvFIhezWjD16bZizcs=";
      };
      "Tokyo-Night" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Tokyo-Night/Source/Gtk_TokyoNight.tar.gz";
        hash = "sha256-caflnEo9hNpjTAIsbnjoktz2Zaz2P02dcvdWNZ4l2s4=";
      };
      "Windows-11" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Windows-11/Source/arcs/Gtk_Windows%2011.tar.xz";
        hash = "sha256-A9+724c8YsdS+5PMnTK1GkJqQvhpdf5Pj3x6UjVZ3Qc=";
      };
      "MacOS" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Mac-Os/Source/arcs/Gtk_Mac%20OS.tar.gz";
        hash = "sha256-BYqgleWmV5PaDcv+G8/IDGO7JxffHPxMANpMYBLgOtE=";
      };
    };

    icon = {
      "Gruvbox-Plus-Dark" = {
        url = "https://github.com/Itz-Abhishek-Tiwari/AbyssGreen/raw/refs/heads/main/Source/arcs/Icon_Gruvbox-Plus-Dark.tar.gz";
        hash = "sha256-1L7OQY6L7UbnY0GKsnowJcTu1El20yb8o3Bk+0akqLI=";
      };
      "Papirus-kanagawa" = {
        url = "https://github.com/Itz-Abhishek-Tiwari/Abyssal-Wave/raw/refs/heads/main/Source/arcs/Icon_Papirus-kanagawa.tar.xz";
        hash = "sha256-0WZ3DAzvXE+IcFVywsWurbYr6iMbfYmCVtDxFg//1rQ=";
      };
      "besgnulinux-mono-red" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Bad-Blood/Source/Icon_Bad-Blood.tar.gz";
        hash = "sha256-6j9H/xA6A2bhj+Cl+yYqDsh3yEym1qpM28PfV4G0+bU=";
      };
      "Papirus-Latte" = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/refs/heads/Cat-Latte/Source/arcs/Icon_Papirus-Latte.tar.xz";
        hash = "sha256-OiFTXKJ9H5ienodooIXP+4s7mjdQcbVjnelBb4QonYw=";
      };
      "Papirus" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/arcs/Icon_Hack%20the%20Box.tar.gz";
        hash = "sha256-x+3FXlRgoEAkE7yh2rFYxZvF/9JjBdWopJeKIrcSFNU=";
      };
      "Tela-circle-grey" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Catppuccin-Latte/Source/Icon_TelaGrey.tar.gz";
        hash = "sha256-h8DzdJ1LmBwyajG2SrS+TGyLHZaHRpGohrjYiNcky3Y=";
      };
      "Tela-circle-dracula" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Catppuccin-Mocha/Source/Icon_TelaDracula.tar.gz";
        hash = "sha256-MfMW9aLyopvcqtscoDYDlGoX7qmwV5ZJZcEwaVvU9vw=";
      };
      "Tela-circle-green" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Decay-Green/Source/Icon_TelaGreen.tar.gz";
        hash = "sha256-iyJ+i+4H6G3jius9LhJoVDSmdRhVgR15dwbjJC5Xz+c=";
      };
      "Azure-Dark-Icons" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/Dracula/Source/arcs/Icon_Azure-Dark-Icons.tar.gz";
        hash = "sha256-KyifmEnbRZIcCqGDUohA/FYsqmPgz37EZPEdhlYeRnw=";
      };
      "Tela-circle-yellow" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Edge-Runner/Source/Icon_TelaYellow.tar.gz";
        hash = "sha256-Ih/Yj1Rn7tjJQLBwt743Qln+ujYTcrmI5h+0fFQoiK0=";
      };
      "Tela-circle-blue" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Frosted-Glass/Source/Icon_TelaBlue.tar.gz";
        hash = "sha256-TmsJ+hYZSkSZP9fBrs7T92vpditmN+gQJSOsYOXGUdo=";
      };
      "Hackthebox" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/arcs/Icon_Hack%20the%20Box.tar.gz";
        hash = "sha256-92vpditmN+gQJSOsYOXGUdoTmsJ+hYZSkSZP9fBrs7T=";
      };
      "Breeze-Noir-White-Blue" = {
        url = "https://github.com/saber-88/Ice-Age/raw/refs/heads/main/Source/arcs/Icon_Breeze-Noir-White-Blue.tar.gz";
        hash = "sha256-H2T0oRlVGudFC3wpWFe5g2Sfkku4dgGMnpzJ4lpznW0=";
      };
      "Tela-circle-black" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Material-Sakura/Source/Icon_TelaBlack.tar.gz";
        hash = "sha256-mreVKUDAPUWFTnaHkA5OQABzwG1/w4f1RhQm+c/iIR4=";
      };
      "Monokai" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Monokai/Source/arcs/Icon_Monokai.tar.gz";
        hash = "sha256-10vd8AhYnT4lI75cYK5xfth6OIHwvIMJiVdoH6TRbRk=";
      };
      "WhiteSur" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Icon_WhiteSur.tar.xz";
        hash = "sha256-G/XLZEd6U3CNZK7OZZ3X+8FPNLqDPlbwxMZo8kCJcAo=";
      };
      "Nordzy" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Nordic-Blue/Source/Icon_NordicBlue.tar.gz";
        hash = "sha256-pg99c4xlRmUqSEOW41LvTzNBzCwty0MAK1YZ9ht6t7I=";
      };
      "One-Dark" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/One-Dark/Source/arcs/Icon_One%20Dark.tar.gz";
        hash = "sha256-V+RkRCwPZZbZ1gnQdt9FJ/hW/JUtonnotgSpyXY9rO8=";
      };
      "Tela-circle-pink" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Rose-Pine/Source/Icon_TelaPink.tar.gz";
        hash = "sha256-9SUztxCVOf7sNAefijljjtTOhgPDIPzwTH4Krpj5AEw=";
      };
      "candy-icons" = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/refs/heads/Paranoid-Sweet/Source/arcs/Icon_Candy.tar.gz";
        hash = "sha256-Xzld5QTZe24afALPviBmuTYTCVeScFYmn+GAn9/tf0Y=";
      };
      "pixel-dream" = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/refs/heads/Pixel-Dream/Source/arcs/Icon_pixel-dream.tar.gz";
        hash = "sha256-92vpdoTmsJ+hYZSkSZP9fBrs7TditmN+gQJSOsYOXGU=";
      };
      "Rain-Dark" = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/refs/heads/Rain-Dark/Source/arcs/Icon_Rain-Dark.tar.gz";
        hash = "sha256-O8wSFSYzMUxLKgW4SxNquDKxfkcldFLS7+pcVPWtzpY=";
      };
      "Tela-circle-red" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/refs/heads/Red-Stone/Source/arcs/Icon_Tela-circle-red.tar.gz";
        hash = "sha256-2sMtIWTY3SrhNJNbEyYAsgYgPu9oAeyX1sSLTjr6kG4=";
      };
      "Tela-circle-hotred" = {
        url = "https://github.com/abenezerw/Scarlet-Night/raw/refs/heads/main/Source/arcs/Icon_Tela-circle-hotred.tar.gz";
        hash = "sha256-WfjhjOto3MPuiZFzZcsWMkbBqGo4o8ImKiGsNo2/+Nk=";
      };
      "cyberpunk-technotronic-icon-theme" = {
        url = "https://github.com/KaranRaval123/Sci-fi/raw/refs/heads/main/Source/arcs/Icon_Cyberpunk.tar.gz";
        hash = "sha256-sA/WCZvReQmHxphurCa3YrMQ15PsL8jHl3jJ5EK48vU=";
      };
      "Tela-circle-solarized" = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/refs/heads/Solarized-Dark/Source/arcs/Icon_Tela-circle-solarized.tar.gz";
        hash = "sha256-cEDMJLEst9Yd6y60FNVFG3vN2CgPYrTA0YF2fy0LsLA=";
      };
      "BeautyLine" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Synth-Wave/Source/Icon_SynthWave.tar.gz";
        hash = "sha256-lDn/x3CPGZ7ROIKg4n53GcBhbaUMSsooChLpzoNvB6Q=";
      };
      "Tela-circle-purple" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Tokyo-Night/Source/Icon_TelaPurple.tar.gz";
        hash = "sha256-/Ck0sDJx7pFmkXt56L9b3wSQvUmBqoaAsbjZazcmLM4=";
      };
      "Windows-11" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Windows-11/Source/arcs/Icon_Windows%2011.tar.gz";
        hash = "sha256-fI2BJ+5ppVjRFVLytzXfQ8Blgq3YwJpNa0Db+9BW10s=";
      };
      "MacOS" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Mac-Os/Source/arcs/Icon_Mac%20OS.tar.xz";
        hash = "sha256-87u57L5DApbjw5zlPV+fnwo6KdJEgjbwogKbh+ODZt4=";
      };
    };

    cursor = {
      "Night-Diamond-Red" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Bad-Blood/Source/Cursor_Bad-Blood.tar.gz";
        hash = "sha256-238WKgGN2uUi4Yqf+CJD2IWiXhH94AyeNyicqgllWSM=";
      };
      "Bibata-Modern-Classic" = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/refs/heads/Cat-Latte/Source/arcs/Cursor_Bibata-Modern-Classic.tar.xz";
        hash = "sha256-yJGqxgNJew5D+0dwtddqAwEi0ZTeLRQ5INTbMjZNn1s=";
      };
      "Dracula-cursors" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/Dracula/Source/arcs/Cursor_Dracula.tar.gz";
        hash = "sha256-8CMJEmkhg8XJZGwjKyXlLvvzeAUMuNqIgE6vLWqVyOs=";
      };
      "Gruvbox-Retro" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/refs/heads/Gruvbox-Retro/Source/Cursor_Gruvbox.tar.gz";
        hash = "sha256-ER72v4cFhzO0N2ZYWOsK4kBp6DOe21/mklpDxhqUE7k=";
      };
      "HackCursor" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/arcs/Cursor_Hack%20the%20Box.tar.gz";
        hash = "sha256-kMHmuhk72IYCKbv6dIQk7ECEJV0h6zns3G3FjE8w5L0=";
      };
      "Bibata-Modern-Ice" = {
        url = "https://github.com/prasanthrangan/hyprdots/raw/refs/heads/main/Source/arcs/Cursor_BibataIce.tar.gz";
        hash = "sha256-1stJ6CoRrfxa4W1op0x36KvqlTaxB55lvV7EUJB/Jeo=";
      };
      "macOS-Black" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Cursor_macOS-Black.tar.xz";
        hash = "sha256-nk94mTFX0TTLgEnx7/clLgSxwBK9g4HUy2Vj2tL9i0U=";
      };
      "onedark-cursor" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/refs/heads/One-Dark/Source/arcs/Cursor_One%20Dark.tar.gz";
        hash = "sha256-nclZMZWrXJMF09fZ824zjN8s2O/sPV8SbTM5M815rro=";
      };
      "Capitaine-Cursors" = {
        url = "https://github.com/rishav12s/Oxo-Carbon/raw/refs/heads/Oxo-Carbon/Source/arcs/Cursor_Capitaine-Cursors.tar.xz";
        hash = "sha256-+0D+Kjl2tQq2ASL/uyPgYQfINVs69zb91blcp4KLawo=";
      };
      "Sweet-cursors" = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/refs/heads/Paranoid-Sweet/Source/arcs/Cursor_Sweet.tar.gz";
        hash = "sha256-eHTwva4ohV65PReJF5P5Hm+suATDbLk51w43R79kqhg=";
      };
      "pixel-dream-cursor" = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/refs/heads/Pixel-Dream/Source/arcs/Cursor_pixel-dream-cursor.tar.gz";
        hash = "sha256-rSeu789ginRkw75cGLQ3YtweEtfraW2KSKADIiMg9LE=";
      };
      "Capitaine-Cursors-Tokyonight" = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/refs/heads/Rain-Dark/Source/arcs/Cursor_Capitaine-Cursors-Tokyonight.tar.xz";
        hash = "sha256-d3byEET0i55vqmx0YykHetkC1V2Xvkr9lbPR2e1h9vQ=";
      };
      "Capitaine-Cursors-White" = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/refs/heads/Solarized-Dark/Source/arcs/Cursor_Capitaine-Cursors-White.tar.xz";
        hash = "sha256-1bqJDSNyGK3vGQxAwEfxp34JvjPxw4rDhUM4TN8Pb+U=";
      };
      "Cursor-Windows" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Windows-11/Source/arcs/Cursor_Windows%2011.tar.gz";
        hash = "sha256-Rx7Vs9MR0VL0H912FF2Y8Vn80psb9afW/1BF4nHbpvA=";
      };
      "MacOS-Cursor" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Mac-Os/Source/arcs/Cursor_Mac%20OS.tar.gz";
        hash = "sha256-ZzzDgT8Zf7QDaZmIodTOBoU0/rW3efn6khRHhZkRwEU=";
      };
    };
    font = {
      "SF" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Font_SF%20Pro%20Rounded%20Regular%2010.5.tar.xz";
        hash = "sha256-evawP8zNSYqGat/DjjuE2qT45/7cCsJdPK7lUSFhBjs=";
      };
      "Monocraft Nerd Font Book" = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/refs/heads/Pixel-Dream/Source/arcs/Font_Monocraft-Nerd-Font-Book.tar.gz";
        hash = "sha256-XtyZvuDoToBRSz97vyShVrDr7y6QmjiKanDbZbVO7zI=";
      };
    };
  };

  # Create the final sets using the sources
  gtk = builtins.mapAttrs (
    name: src:
    mkGtk {
      inherit (src) url hash;
      gtkName = name;
    }
  ) sources.gtk;
  icon = builtins.mapAttrs (
    name: src:
    mkIcon {
      inherit (src) url hash;
      iconName = name;
    }
  ) sources.icon;
  cursor = builtins.mapAttrs (
    name: src:
    mkCursor {
      inherit (src) url hash;
      cursorName = name;
    }
  ) sources.cursor;
  font = builtins.mapAttrs (
    name: src:
    mkFont {
      inherit (src) url hash;
      fontName = name;
    }
  ) sources.font;

in
{
  inherit
    gtk
    icon
    cursor
    font
    ;
}
