# Evolution API para a Guara Cloud
# A imagem oficial recria prisma/migrations ao iniciar. A Guara roda o container sem
# permissao de escrita ali, entao liberamos a escrita nas pastas que o script usa.
FROM evoapicloud/evolution-api:v2.3.7
USER root
RUN chmod -R a+rwX /evolution/prisma \
 && (chmod -R a+rwX /evolution/node_modules/.prisma /evolution/node_modules/@prisma 2>/dev/null || true)
