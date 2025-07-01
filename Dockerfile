# my_rails_api/Dockerfile

# Usar uma imagem base oficial do Ruby
# Recomendo usar uma versão específica para estabilidade
FROM ruby:3.2.2

# Instalar dependências necessárias do sistema
# Estas são geralmente para compilação de gems como 'pg' (PostgreSQL client) e 'nokogiri'
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client nodejs 

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar os arquivos Gemfile e Gemfile.lock para o diretório de trabalho
# Isso permite que o Docker use o cache da camada para 'bundle install'
COPY Gemfile Gemfile.lock ./

# Instalar as gems do projeto
# --jobs $(nproc) para paralelizar a instalação
# --retry 3 para tentar novamente em caso de falha de download
RUN bundle install --jobs=$(nproc) --retry 3

# Copiar o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expor a porta que a aplicação Rails irá usar (padrão para Rails é 3000)
EXPOSE 3000

# Comando padrão para iniciar o servidor Rails
# Substitua 'puma' pelo seu servidor web se for diferente
# Lembre-se que o Rails deve escutar em 0.0.0.0 dentro do container
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]