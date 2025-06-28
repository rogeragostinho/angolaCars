#!/bin/bash

sudo getent group angolacars           || sudo groupadd angolacars
sudo getent group angolacars_admin     || sudo groupadd angolacars_admin
sudo getent group angolacars_recepcao  || sudo angolacars_recepcao recepcao
sudo getent group angolacars_vendas    || sudo angolacars_vendas vendas
