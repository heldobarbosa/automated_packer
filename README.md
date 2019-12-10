Com o Packer e Terraform devidamente instalados, e seu "aws configure" configurado com seu 'profile' Admin:

1. Entre em /automated_packer/packer >>> E execute o comando >>> "packer build imageofcentos7withansible.json"
2. Após o packer criar a imagem >>> Suba com o terraform >>> Para isso, entre em /automated_packer/terraform >
3. Execute o .tf >>> terraform plan >>> terraform apply >
4. Após a subida da máquina, pegue o IP dela e altere o arquivo de configuração do NGINX >>> /etc/nginx/conf.d/wordpress.conf >>> altere o server name para seu IP.
5. Start o NGINX
6. Crie dentro de /run, a pasta php >>> mkdir php >>> e dê permissão a ela >>> chmod 755 php
7. Execute o php >>> systemctl start php-fpm
