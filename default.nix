let nixpkgs = builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/31703358bd38845e5bcc47df3c564f0e132272c5.tar.gz;
in { pkgs ? import nixpkgs {} }: pkgs.haskellPackages.developPackage {
  root = ./.;
  source-overrides = rec {
    errors = pkgs.fetchFromGitHub {
      owner = "Gabriel439";
      repo = "Haskell-Errors-Library";
      rev = "05f62d5f4d9aa48dc894d1a327328356717a7aba";
      sha256 = "1yxlmx6p5n4fiknvxjza30y4cd9b80zygc3cmwfsdmcm1imfl6wq";
    };
    katip-src = pkgs.fetchFromGitHub {
      owner = "Soostone";
      repo = "katip";
      rev = "461f014142cdc9cec4bb51ceb35f38bf61503f97";
      sha256 = "0pgqvadnh7dcwzpywyhynl75hac4zxc92a2blr9lc69br5f0shza";
    };
    katip = "${katip-src}/katip";
  };
}

