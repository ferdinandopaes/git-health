## O que é isso?

O **Git Branch Health Check** é uma ferramenta simples que roda **automaticamente no seu computador** para verificar se a sua branch local está muito desatualizada em relação à branch principal do projeto (ex: `main`).

O objetivo é **evitar branches antigas**, que costumam gerar:

* conflitos difíceis de resolver
* retrabalho
* atrasos em Pull Requests
* perda de contexto do código

A ferramenta **não bloqueia nada** e **não faz alterações no seu repositório**.
Ela apenas **avisa**, de forma discreta, quando é uma boa ideia atualizar sua branch ou criar uma nova.

---

## Como funciona?

Todos os dias, em dois horários:

* **09:00 (manhã)**
* **15:00 (tarde)**

O script executa automaticamente os seguintes passos:

1. Acessa o repositório configurado no seu computador
2. Atualiza as referências remotas (`git fetch`)
3. Compara sua branch atual com a branch base (`origin/main`)
4. Conta:

   * quantos commits sua branch está **atrás**
   * quantos commits está **à frente**
5. Aplica a seguinte regra:

   * até **9 commits atrás** → nenhuma ação
   * entre **10 e 29 commits atrás** → aviso
   * **30 commits ou mais atrás** → alerta mais forte
6. Caso necessário, exibe uma **notificação no Windows**

---

## Exemplos de mensagens

* ⚠️
  *"Sua branch está 14 commits atrás da main. Considere atualizar quando possível."*

* 🚨
  *"Sua branch está 42 commits atrás da main. Considere criar uma nova branch ou atualizar."*

---

## Por que isso é importante?

Manter a branch atualizada ajuda a:

* reduzir conflitos em Pull Requests
* facilitar o review de código
* manter o histórico mais limpo
* diminuir o risco de retrabalho no final da feature

Esse script funciona como um **lembrete automático**, para ajudar no dia a dia, sem impor regras rígidas.

---

## Como instalar

### 1 Ajustar o caminho do repositório

Abra o arquivo:

```
git-branch-health.txt
```

Edite a linha abaixo com o caminho do seu repositório local:

```powershell
$repoPath = "C:\repos\meu-projeto"
```

Salve o arquivo.

---

### 2 Executar o instalador

Clique com o botão direito no arquivo:

```
install-git-health.ps1
```

E escolha:

**Executar com PowerShell**

Isso irá:

* copiar o script para uma pasta local
* criar uma tarefa agendada no Windows
* configurar a execução automática duas vezes ao dia

---

## Como desinstalar

1. Abra o **Agendador de Tarefas do Windows**
2. Procure pela tarefa:

   ```
   Git Branch Health Check
   ```
3. Exclua a tarefa
4. (Opcional) Apague a pasta:

   ```
   %LOCALAPPDATA%\GitBranchHealth
   ```

---

## Segurança e transparência

* O script é local, roda apenas na sua máquina
* Não envia dados para servidores externos
* Não modifica commits, branches ou histórico
* O código é totalmente aberto para inspeção
