## 🤖 AUTOMAÇÃO COM ROBOT FRAMEWORK

Repositório de treinamento: Automação de cadastro de candidatos via CSV usando Robot Framework + Selenium

Case simulado: Uma empresa publica uma vaga de trabalho onde os candidatos respondem a um formulário online. Os dados são extraídos para um arquivo .csv e o Robot utiliza essas informações para cadastrar cada candidato no sistema interno automaticamente.

## Objetivo

Automatizar um processo repetitivo de Recursos Humanos: ler dados de candidatos em um arquivo .csv e preencher um formulário web automaticamente, simulando o cadastro em um sistema de recrutamento.

Ideal para:

-Reduzir digitação manual
-Evitar erros de transcrição
-Otimizar tempo com tarefas mais estratégicas

## Funcionalidades Implementadas

-Leitura de dados de um arquivo candidatos.csv
-Simulação de formulário web com Flask (para testes locais)
-Preenchimento automático de campos: nome, e-mail, cargo
-Validação de sucesso após envio
-Execução em modo visível (para demonstração) ou headless (para integração contínua)

## Stacks
-Robot Framework
-SeleniumLibrary
-Python 3.9+
-Flask (simulador de sistema web)
-ChromeDriver (controle do navegador)

## Rodando Localmente

1. Clonar o repositório e entrar na pasta
```
git clone https://github.com/seu-usuario/automacao-robot-csv.git
cd automacao-robot-csv
```

2. Criar e ativar ambiente virtual (recomendado)
```
python -m venv .venv
source .venv/bin/activate      # Linux/Mac
# ou
.venv\Scripts\activate         # Windows
```

3. Instalar dependências
```
pip install -r requirements.txt
```

4. Iniciar o simulador de formulário
```
python app/form_simulator.py
```
Servidor rodando em: http://localhost:5000 (porta opcional)

5. Executar os testes de automação
```
robot tests/fill_form_from_csv.robot
```

