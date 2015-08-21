# Search pages with links to "People" "Faculty" "Professors" "Equipe" "Members"

### ARTICLES ###
# http://www.mdpi.com

### DIRECTORIES ###

# Jacques Ferber
# https://www.lirmm.fr/annuaire

# Yves Demazeau
# http://magma.imag.fr/members

# Salima Hassas
# http://liris.cnrs.fr/equipes/?id=65&onglet=membres

# Bruno Beaufils
# http://www.lifl.fr/SMAC/

# Vincent Corruble / Amal El Fallah
# http://www.lip6.fr/recherche/team_membres.php?id=380

# Boi Faltings
# http://liawww.epfl.ch/index.php/people

# Jan Treur
# http://asr.cs.vu.nl/people.php

# Jomi Fred Hubner
# http://www.das.ufsc.br/teachers/
# http://www.inf.ufsc.br/docentes/
# http://www.mtm.ufsc.br/pessoal/docentes.html
# http://cco.inf.ufsc.br/coordenacao/docentes/
# http://qmc.ufsc.br/newsite/docentes.html

# Jaime S. Sichman
# http://www2.pcs.usp.br/pcsv6/index.php/menucolaboradores/docentes
# http://www.poli.usp.br/images/stories/media/download/pesquisa/GruposPesquisa2008/indexp.htm
# http://www.icmc.usp.br/Portal/Pessoas/index.php?categ=Docente
# http://historia.fflch.usp.br/docentes
# http://www.ifsc.usp.br/index.php?option=com_content&view=article&id=79&Itemid=102
# http://www.fsp.usp.br/site/docentes
# http://dlcv.fflch.usp.br/docentes/galeria
# http://www2.fearp.usp.br/joomla/institucional/docentes/economia
# http://www.fau.usp.br/fau/ensino/docentes/index.html
# http://www2.fearp.usp.br/joomla/institucional/docentes/administracao
# http://www.usp.br/fzea/docentescb.php
# http://pro.poli.usp.br/institucional/corpo-docente/
# http://www.usp.br/cje/docentes.php
# http://www.ime.usp.br/dcc/docentes
# http://www.fmvz.usp.br/docentes
# http://www.fmrp.usp.br/comunidade-fmrp/informacoes-gerais/docentes/
# http://each.uspnet.usp.br/site/docentes-nome.php
# http://www.usp.br/fzea/docentesea.php
# http://www.lti.pcs.usp.br/

# Cours BigData
# http://www.stir.ac.uk/management/staff-directory/
# http://www.stir.ac.uk/management/staff-directory/accounting-and-finance/
# http://www.stir.ac.uk/management/staff-directory/economics/
# http://www.stir.ac.uk/management/staff-directory/mwo/
# http://www.stir.ac.uk/management/staff-directory/marketing-retail/
# http://www.stir.ac.uk/management/staff-directory/came/
# http://www.stir.ac.uk/management/staff-directory/gcmr/
# http://www.stir.ac.uk/management/staff-directory/school-office/

# Munindar P. Singh
# http://www.csc.ncsu.edu/directories/faculty.php
# http://www.csc.ncsu.edu/directories/professors.php
# http://www.csc.ncsu.edu/directories/associate.php
# http://www.csc.ncsu.edu/directories/assistant.php
# http://www.csc.ncsu.edu/directories/adjunct.php
# http://www.csc.ncsu.edu/directories/emeritus.php
# http://www.csc.ncsu.edu/directories/graduate_faculty.php

# Katia Sycara
# http://www.cs.cmu.edu/directory/all
### http://www.cmu.edu/academics/schools.shtml

# Eleves actuels X
# https://www.frankiz.net/tol#tol_infos => Tab dans champ recherche


# Michel Occelo
# http://lcis.grenoble-inp.fr/cosy/membres-de-l-equipe-cosy-418646.kjsp?RH=LCIS2_COSY-MEM&RF=LCIS2_COSY-MEM
# http://lcis.grenoble-inp.fr/ctsys/membres-de-l-equipe-ctsys-466519.kjsp?RH=LCIS2_CTSYS&RF=LCIS2_CTSYS-MEM
# http://lcis.grenoble-inp.fr/macsy/membres-de-l-equipe-macsy-418665.kjsp?RH=LCIS2_MACSY&RF=LCIS2_MACSY-MEM
# http://lcis.grenoble-inp.fr/orsys/membres-de-l-equipe-orsys-418673.kjsp?RH=LCIS2_ORSYS&RF=LCIS2_ORSYS-MEM

. ~/Softs/classpaths
java fr.presans.crawling.directory.detector.DirectoryDetect --foaf --follow \
    "http://www.teagasc.ie/food/research/staff/" \
    --orgUrl="http://www.teagasc.ie/" \
    --field="Food" \
    --creator="dj@presans.com" \
    --comment="DJ"
