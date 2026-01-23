📌 Verificador de Atraso de Branch Git (PowerShell)
📖 O que é este projeto?

Este script PowerShell tem um objetivo simples e direto:

Avisar o usuário, de forma clara e visual, quando a branch local do Git estiver atrasada em relação ao repositório remoto.

Ele foi pensado para rodar automaticamente no Windows (via Agendador de Tarefas) e mostrar uma janela visível ao usuário, evitando aqueles scripts que rodam em segundo plano e ninguém vê.

🎯 Problema que ele resolve

Em times ou ambientes locais é comum:

Esquecer de atualizar a branch

Trabalhar com código desatualizado

Só perceber isso tarde demais

Esse script resolve isso avisando duas vezes ao dia, sem depender de IDE, CI ou disciplina humana 😄

🧠 Como o script funciona?

O fluxo é o seguinte:

Entra no diretório do repositório Git

Executa git fetch origin

Compara a branch local com a branch remota

Conta quantos commits a branch local está atrasada

Exibe uma janela do Windows com:

✅ Mensagem de sucesso se estiver tudo OK

⚠ Alerta se a branch estiver atrasada

Aguarda o usuário clicar em OK

Tudo isso acontece sem abrir janela azul piscando do PowerShell.

🧩 Requisitos

Antes de instalar, verifique:

✅ Windows 10 ou 11

✅ PowerShell 5.1 ou superior

✅ Git instalado e disponível no PATH

✅ Repositório Git já clonado localmente

✅ Usuário com permissão de leitura no repositório

⚙️ Configuração do script

Abra o arquivo git-health.ps1 e ajuste estas variáveis:

$BranchName = "main"
$RepoPath   = "C:\repos\meu-repo"
$MaxBehindCommits = 3

O que cada uma faz:
Variável	Descrição
BranchName	Nome da branch que será verificada
RepoPath	Caminho completo do repositório local
MaxBehindCommits	Quantidade máxima de commits aceitável antes de alertar
🪟 Como a notificação aparece?

O script utiliza:

System.Windows.Forms.MessageBox


Isso garante que:

A janela seja visível

Apareça para o usuário logado

Tenha botão OK

Não dependa de módulos externos

Exemplo de mensagem:

✅ Branch atualizada

⚠ Branch atrasada — atualize o quanto antes

⏰ Como agendar para rodar duas vezes ao dia
1️⃣ Abrir o Agendador de Tarefas

Pressione Win + R

Digite taskschd.msc

Pressione Enter

2️⃣ Criar nova tarefa

Clique em Criar Tarefa… (não use “Criar Tarefa Básica”).

3️⃣ Aba "Geral"

Nome: Verificar Branch Git

Marque:

✅ Executar somente quando o usuário estiver conectado

Desmarque:

❌ Executar com privilégios mais altos

📌 Isso é essencial para a janela aparecer.

4️⃣ Aba "Disparadores"

Crie DOIS disparadores:

🔹 Disparador 1 – Manhã

Tipo: Diário

Horário: 09:00

Repetir: Todos os dias

🔹 Disparador 2 – Tarde

Tipo: Diário

Horário: 15:00

Repetir: Todos os dias

5️⃣ Aba "Ações"

Ação: Iniciar um programa

Programa/script

powershell.exe


Adicionar argumentos

-WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\caminho\git-health.ps1"


Iniciar em

C:\repos\meu-repo


📌 Esse -WindowStyle Hidden é o que elimina a tela azul piscando.

6️⃣ Aba "Condições"

Desmarque:

❌ Iniciar a tarefa somente se o computador estiver na energia AC

7️⃣ Aba "Configurações"

Marque:

✅ Permitir que a tarefa seja executada sob demanda

✅ Se a tarefa falhar, reiniciar a cada: 1 minuto (opcional)

🧪 Como testar manualmente

No Agendador de Tarefas:

Clique com o botão direito na tarefa

Selecione Executar

A janela deve aparecer imediatamente.
