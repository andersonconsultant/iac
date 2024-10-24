#!/bin/bash

echo executando Script de Infraestrutura como código...
#diretorio raiz
cd /

echo Criando diretórios...
#cria os diretorios
mkdir publico
mkdir adm
mkdir ven
mkdir sec

echo Definindo permissões...
#define permissoes  dos diretorios 
#dono7geral, grupo4leitura, outros1execucao
chmod 751 /adm
chmod 751 /ven
chmod 751 /sec
chmod 777 /publico

echo Criando grupos...
#cria grupos
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC


echo Criando usuários e definindo grupos...
#cria usuarios 
useradd -m -c "Carlos Jr" -s /bin/bash -G GRP_ADM  carlos $(openssl passwd -crypt Senha123)
useradd -m -c "Debora Alm" -s /bin/bash -G GRP_VEN debora $(openssl passwd -crypt Senha123)
useradd -m -c "Josefina Ma" -s /bin/bash -G GRP_VEN josefina $(openssl passwd -crypt Senha123)
useradd -m -c "Maria Eduarda" -s /bin/bash -G GRP_SEC maria $(openssl passwd -crypt Senha123)
#como já definiu grupo na criação do usuario, não é necessário usermod.

#Especificando permissões dos diretórios de acordo com Grupo.
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo Fim.
