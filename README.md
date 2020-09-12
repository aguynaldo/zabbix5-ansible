# Instalação do zabbix-5 via ansible

Repositório destinado aos meus estudos de ansible e zabbix. O objeto é criar 3 servidores virtual baseados em CentOS-8 e insalar o mysql-server, o zabbix-server e o zabbix-web.

## Requirements

* [Vagrant](https://www.vagrantup.com/)
* [Vagrant plugin vagrant-env](https://github.com/gosuri/vagrant-env)
* [Virtualbox 6.0+](https://www.virtualbox.org/)
* [Ansible 2.9.12](https://docs.ansible.com/)

### Meu ambiente

Estes playbooks foram testados em dois computadores pessoais

#### Debian 10

| Softwares | Versions |  
| - | - |
| Debian | 10 (buster) - 64 bits |  
| Vagrant |Vagrant 2.2.9 |  
| Plugin vagrant-env | vagrant-env (0.0.3, global) |  
| Virtualbox | Versão 6.1.10 r138449 (Qt5.11.3) |

#### Ubuntu 20.04

| Softwares | Versions |  
| - | - |
| Ubuntu | 20.04 LTS (Focal Fossa) |  
| Vagrant | Vagrant 2.2.9 |  
| Plugin vagrant-env | vagrant-env (0.0.3, global) |  
| Virtualbox | Versão 6.1.10 r138449 (Qt5.11.3) |

## Instruções

Os playbooks criarão 3 servidores (mysql-server, zabbix-server, zabbix-web).

Siga as instruções abaixo para instalar e configurar o Zabbix5 em servidores CentOS-8.

1. Clone o repositório

    ```bash  
    git clone git@github.com:aguynaldo/zabbix5-ansible.git
    ```

2. Entre no diretório zabbix5-ansible

   ```bash  
    cd zabbix5-ansible
    ```

3. **Edite o arquivo env_renomear com informações do seu ambiente.**

    * O Vagrant irá configurar uma interface no modo bridge. É necessário informar qual interface deverá ser utilizada.

    * É necessário alterar pelo menos 2 informações nesse arquivo. 

        * Informar qual interface de rede será utilizada pelo virtualbox.
        * Os IPs que serão utilizados nos servidores.

    * As demais informações podem ser alteradas caso deseje.

4. Renomeie o arquivo env_renomear para .env.

    ```bash  
    cp env_renomear .env

5. Execute vagrant para criar os três servidores virtuais no Virtualbox.

    ```bash  
    vagrant up

6. Editar o arquivo **hosts** e o arquivo **group_vars/inv_zabbix.yml** com os IPs do servidores. Só é necessário se tiver sido alterado na etapa anterior ou se não utilizar o Vagrant para criar as VMs.

7. Executar os playbooks para instalar e configurar o Zabbix 5.

    | PLAYBOOK (comando bash) | DESCRIÇÃO  |
    |---|---|
    | ansible-playbook playbooks/01_base_so.yml | Instala em todos os servidores o repositório do Zabbix, atualiza o SO e instala os utilitários de propósito geral.|
    | ansible-playbook playbooks/02_mysql_server.yml | Instala, configura e realiza um tuning básico no Mysql. Ele também cria os usuários para o zabbix-server e para o zabbix-web, seta as devidas permissões aos usários. Define a senha usuário root. |
    | ansible-playbook playbooks/03_zabbix_server.yml | Instala e configura o zabbix-server.|
    | ansible-playbook playbooks/05_zabbix_web.yml | Instala e configura o zabbix-server. |
    | ansible-playbook playbooks/05_zabbix_agent.yml | Instala e configura o zabbix-agent nos três servidores. Esse playbook pode ser utilizado para instalar o zabbix agent em outros servidores da familia RHEL. |

8. Se desejar pode executar dos os playbooks em um único comando.

    ```bash  
    ansible-playbook playbooks/01_base_so.yml playbooks/02_mysql_server.yml playbooks/03_zabbix_server.yml playbooks/04_zabbix_web.yml playbooks/05_zabbix_agent.yml

**ATENÇÃO**: Caso já possua os servidores hospedados em alguma núvem ou em outro virtualizador, execute somente os passos 6 e (7 ou 8). Atenção ao editar os arquivos mencionados no passo 6. Neste cenário pode-se apagar os seguintes arquivos: Vagrantfile, redhat_like.sh, env_renomear e o .env.
