# RDS creator Terraform

Salve pessoal, blz?  
Esse repo aqui serve so para testes

## Como funcionam algumas coisas
```sh
data "aws_db_instance" "check_instance" {
  db_instance_identifier = "{{NOME_DA_INSTANCIA_EXISTENTE}}"
}
```
No trecho acima o `"aws_db_instance"` é o tipo de recurso que você está usando no Terraform. Ele define que você está trabalhando com instâncias de bancos de dados (RDS) na AWS.  

Ja o `"check_instance"` é apenas o nome que você está dando ao bloco de dados do Terraform que está sendo definido. A mudança do nome não afeta a funcionalidade do bloco de dados em si.  

```sh
locals {
  instance_exists = length(data.aws_db_instance.check_instance) > 0
}
```
`locals`: Esta é uma seção no Terraform onde você pode definir variáveis locais.  

## Sobre o Github Actions
Quais sao os passos do nosso arquivo?  

- `Checkout code`: Obtém o código do repositório.
- `Setup Terraform`: Configura a versão do Terraform a ser usada.
- `Terraform Init`: Inicializa o diretório do Terraform.
- `Terraform Validate`: Valida a sintaxe dos arquivos Terraform.
- `Terraform Plan`: Gera um plano do que será aplicado.
- `Terraform Apply`: Aplica as alterações automaticamente (auto-aprovado). Este passo só é executado em um push na branch main.
