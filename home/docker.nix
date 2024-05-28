{ inputs, config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    docker
    docker-compose
    
    kubernetes
    minikube
    kind

    k9s
    kubectl-tree
    kubectl
  ];
}
