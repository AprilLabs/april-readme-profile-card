{ pkgs, ... }:

{
  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_26;
    pnpm.enable = true;
  };
}
