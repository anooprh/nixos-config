{ inputs, config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ## PDF Related
    pdftk
    pdfchain
    pdfrip
    pdf4qt
    #pdfslicer
    pdfmixtool
    pdfarranger
    #pdfstudioviewer

    # Tex
    texliveTeTeX
    texliveFull
    latex2html
    latex2mathml

  ];
}