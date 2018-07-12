#!/bin/bash

#  ./sendEmail-v1.56/sendEmail -f cassio@grupolit.com.br \
#            -t cassio@grupolit.com.br  \
#            -s mail.grupolit.com.br -xu cassio -xp 83766BF6C8C759BE0145169D81E39857 \
#            -u "Teste email"      \
#            -m "Ola, isso é um teste de email." 2> erros.txt

#echo "Cássio é muito bom" | mail -s "Cassio Teste 2" cassio@grupolit.com.br 2> erros.txt

mail -s "Cassio Teste 2" cassio@grupolit.com.br <<< "Content-type: text/plain  Cássio é muito bom"

echo 'Content-type: text/plain'
echo ''
echo 'E-mail enviado ? favor checar !!!'
