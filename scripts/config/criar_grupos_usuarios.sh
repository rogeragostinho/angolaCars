#!/bin/bash

sudo getent group angolacars           || sudo groupadd angolacars
sudo getent group angolacars_admin     || sudo groupadd angolacars_admin
sudo getent group angolacars_recepcao  || sudo groupadd angolacars_recepcao
sudo getent group angolacars_vendas    || sudo groupadd angolacars_vendas
