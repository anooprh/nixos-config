{ pkgs, ... }:

{
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };
}
