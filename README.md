🚀 Automação Post-Install (Office Offline + Ninite + Privacy)
Este script em lote (.bat) foi desenvolvido para otimizar a configuração de máquinas novas ou recém-formatadas em ambiente de bancada.
Ele automatiza desde a segurança do sistema até a instalação de softwares essenciais e ajustes de privacidade.

🛠️ Funcionalidades
Ponto de Restauração: Cria automaticamente um checkpoint do sistema via PowerShell antes de qualquer alteração.

Office 365 (Offline): Instalação silenciosa e local (Word, Excel e PowerPoint) utilizando o Office Deployment Tool.

Ninite: Execução do instalador de apps básicos (Navegadores, Runtimes, etc).

Telemetria: Desativação de serviços de coleta de dados da Microsoft para maior privacidade e performance.

📂 Estrutura de Pastas Necessária
Para o script funcionar corretamente, os arquivos devem estar organizados desta forma:

Plaintext
[Raiz do Projeto]
├── 📁 01_Scripts
│   └── Full_Apps.bat      <-- (Seu script)
└── 📁 02_Instaladores
    └── 📁 Apps
        ├── Ninite.exe
        ├── setup.exe          <-- (Office Deployment Tool)
        ├── Install_Office.xml
        └── 📁 Office          <-- (Arquivos baixados previamente)

📥 Pré-requisitos (Instalação do Office e Ninite)
Este script realiza a instalação offline. Siga estes passos antes de rodar o .bat:

Baixar o ODT: Baixe o Office Deployment Tool (setup.exe) no Site Oficial da Microsoft e coloque na pasta Apps.

Preparar os Arquivos: Coloque o arquivo Install_Office.xml (disponível aqui) na mesma pasta.

Download do Office: Abra o terminal na pasta Apps e execute:
setup.exe /download Install_Office.xml
Isso baixará cerca de 3GB de arquivos para a pasta local, permitindo instalações rápidas em várias máquinas sem usar internet.

• Instalador Ninite: Acesse ninite.com, selecione os aplicativos de sua preferência (Navegadores, Runtimes, Mensageiros) e baixe o instalador.
  Renomeie o arquivo baixado para Ninite.exe e coloque-o na pasta 02_Instaladores\Apps.


⚠️ Como Usar
Clique com o botão direito no arquivo .bat.

Selecione Executar como Administrador (obrigatório para criar o ponto de restauração e alterar o registro).

Aguarde a conclusão de cada etapa conforme as mensagens no console.

🛡️ Segurança e Privacidade
O script desabilita o serviço DiagTrack (Telemetria) e altera chaves de registro de coleta de dados, visando reduzir o consumo de recursos e aumentar a privacidade do usuário final.

⚠️ Isenção de Responsabilidade (Disclaimer)
Atenção: Este script foi desenvolvido para uso em ambiente de bancada e testes controlados.

• A autora não se responsabiliza por eventuais instabilidades no sistema decorrentes de alterações no registro ou desabilitação de serviços.

• Use por sua conta e risco. Recomenda-se sempre validar o ponto de restauração criado pelo script antes de prosseguir com as instalações.