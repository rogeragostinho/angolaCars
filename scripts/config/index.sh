#!/bin/bash

# Dá permissão de execução a todos os scripts
#find /opt/angolaCars -type f -name "*.sh" -exec chmod +x {} \;

find . -type f -name "*.sh" -exec dos2unix {} \;


#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash $BASE_DIR/criar_grupos_usuarios.sh
bash $BASE_DIR/adicionar_usuarios_padrao.sh
bash $BASE_DIR/definir_permissoes.sh
bash $BASE_DIR/definir_diretorios.sh
bash $BASE_DIR/criar_montar_particao_backup.sh