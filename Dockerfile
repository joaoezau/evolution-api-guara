# Evolution API para a Guara Cloud
# A imagem oficial recria prisma/migrations e roda "prisma generate" ao iniciar.
# A Guara roda o container sem permissao de escrita nessas pastas.
# Solucoes: liberar escrita em prisma/ para a migracao e pular o "generate"
# (o cliente do Prisma ja vem gerado na imagem, feito na compilacao).
FROM evoapicloud/evolution-api:v2.3.7
USER root
RUN chmod -R a+rwX /evolution/prisma /evolution/node_modules/.prisma /evolution/node_modules/@prisma
ENTRYPOINT ["/bin/bash", "-c", "npm run db:deploy && npm run start:prod"]
