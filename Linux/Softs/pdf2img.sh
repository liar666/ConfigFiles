convert -density 600x600 -resize '2048x!' -quality 90 toto.pdf toto.png

alias pdf2imgportrait='convert -quality 98 -resize 1240x1753 -extent 1240x1753 -gravity center -units PixelsPerInch -density 150x150 '
alias pdf2imglandscape='convert -quality 98 -resize 1753x1240 -extent 1753x1240 -gravity center -units PixelsPerInch -density 150x150 '
alias img2pdfportrait='convert -quality 98 -resize 1240x1753 -extent 1240x1753 -gravity center -units PixelsPerInch -density 150x150 '
alias img2pdflandscape='convert -quality 98 -resize 1753x1240 -extent 1753x1240 -gravity center -units PixelsPerInch -density 150x150 '
