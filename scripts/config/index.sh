#!/bin/bash

#define o diretorio do prórpio script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash $BASE_DIR/criar_grupos_usuarios.sh
bash $BASE_DIR/adicionar_usuarios_padrao.sh
bash $BASE_DIR/definir_permissoes.sh
bash $BASE_DIR/definir_diretorios.sh