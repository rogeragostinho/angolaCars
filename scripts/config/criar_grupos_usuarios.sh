#!/bin/bash

sudo getent group admin     || sudo groupadd admin
sudo getent group recepcao  || sudo groupadd recepcao
sudo getent group vendas    || sudo groupadd vendas
