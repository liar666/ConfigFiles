This will use ssh auth and, therefore, be able to store passwords:

svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/presans-commons/trunk presans-commons
svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/presans-crawling/trunk presans-crawling
svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/presans-indexing/trunk presans-indexing
svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/presans-lib/trunk presans-lib
svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/presans-machinelearning/trunk presans-machinelearning
svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/presans-searching/trunk presans-searching
svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/presans-jsofia/trunk presans-jsofia
svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/presans-xsearch/branches/sofia2 sofia2
svn co svn+ssh://gmuller@verspertine.xtec.polytechnique.fr/var/www/svn/repos/dist dist

or (this will use http auth and, therefore, be unable to store passwords):

. ~/Softs/SSHBridgeVerspertine.sh
svn co http://localhost:8090/repos/presans-commons/trunk presans-commons
svn co http://localhost:8090/repos/presans-crawling/trunk presans-crawling
svn co http://localhost:8090/repos/presans-indexing/trunk presans-indexing
svn co http://localhost:8090/repos/presans-lib/trunk presans-lib
svn co http://localhost:8090/repos/presans-machinelearning/trunk presans-machinelearning
svn co http://localhost:8090/repos/presans-searching/trunk presans-searching
svn co http://localhost:8090/repos/presans-xsearch/branches/sofia2 sofia2
