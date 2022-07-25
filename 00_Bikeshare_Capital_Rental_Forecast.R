#### PROJECT: BIKESHARE CAPITAL RENTAL FORECAST ####

#### Forecasting Bicycle Rental Demand ####

#### 1. Working Directory ####
# Configurando o diretório de trabalho
setwd("C:/Users/Utilizador/repos/Formacao_cientista_de_dados/big_data_analytics_R_microsoft_azure_machine_learning/Modulo_14/Projeto")
getwd()

#### 1. Data Collection and Transformation ####

# Observação: Este código contém comandos para filtrar e transformar os dados de aluguel de bikes, 
#             Este código foi criado para executar tanto no Azure, quanto no RStudio;
#             Para executar no Azure, altere o valor da variavel Azure para TRUE;
#             Ou seja, se o valor for FALSE, o código sera executado no RStudio;


# Variável que controla a execução do script
Azure <- FALSE

##### 1.1 Data Collect #####

# Execução de acordo com o valor da variável Azure
# Se Azure = True
if(Azure){
  # Carregar arquivo Tools
  source("src/Tools.R")
  # Ler dataset
  bikes <- maml.mapInputPort(1)
  # Conversão da variavel dteday em  data (Transformar o objeto de data)
  bikes$dteday <- set.asPOSIXct(bikes)
  # Se Azure = False
}else{
  # Carregar arquivo Tools
  source("src/Tools.R")
  # Ler arquivo csv
  bikes <- read.csv("bikes.csv", sep = ",", header = TRUE, stringsAsFactors = FALSE )

##### 1.2 Data Transformation #####
  
  # Selecionar/Coletar algumas das variáveis que serão usadas
  cols <- c("dteday", "mnth", "hr", "holiday",
            "workingday", "weathersit", "temp",
            "hum", "windspeed", "cnt")
  
  # Criando um subset dos dados selecionados acima
  bikes <- bikes[, cols]
  
  # Conversão da variavel dteday em  data (Transformar o objeto de data)
  bikes$dteday <- char.toPOSIXct(bikes)
  
  # Esta linha acima gera dois valores NA
  # Esta linha abaixo corrige
  # Remover os NA do dataset
  bikes <- na.omit(bikes)
  
  # Normalizar as variaveis preditoras numericas: colocar na mesma escala
  cols <- c("temp", "hum", "windspeed") 
  bikes[, cols] <- scale(bikes[, cols])  
}

# Visualizar os dados
#?scale
str(bikes)

# # Visualizar os dados em formato de tabela
View(bikes)

#### 2. Feature Engineering ####
# Criar uma nova variável para indicar dia da semana (workday)
bikes$isWorking <- ifelse(bikes$workingday & !bikes$holiday, 1, 0)  

# Adicionar uma coluna com a quantidade de meses, o que vai ajudar a criar o modelo
bikes <- month.count(bikes)

# Criar um fator ordenado para o dia da semana, comecando por segunda-feira
# Neste fator eh convertido para ordenado numérico para ser compativel com os tipos de dados do Azure ML
bikes$dayWeek <- as.factor(weekdays(bikes$dteday))

# ==> Analise o dataframe bikes. 
# Se os nomes dos dias da semana estiverem em português na coluna bikes$dayWeek, 
# execute o Bloco1 abaixo, caso contrátio, execute o Bloco2 com os nomes em inglês. 
# Execute um bloco ou o outro.
str(bikes$dayWeek)

# Bloco1
# Se o seu sistema operacional estiver em portugês, execute o comando abaixo.
#bikes$dayWeek <- as.numeric(ordered(bikes$dayWeek, 
#                                    levels = c("segunda-feira", 
#                                               "terça-feira", 
#                                               "quarta-feira", 
#                                               "quinta-feira", 
#                                               "sexta-feira", 
#                                               "sábado", 
#                                               "domingo")))

# Bloco2
# Se o seu sistema operacional estiver em inglês, execute o comando abaixo.
bikes$dayWeek <- as.numeric(ordered(bikes$dayWeek, 
                                    levels = c("Monday", 
                                               "Tuesday", 
                                               "Wednesday", 
                                               "Thursday", 
                                               "Friday", 
                                               "Saturday", 
                                               "Sunday")))

# Agora os dias da semana devem estar como valores numéricos
# Se estiverem como valores NA, volte e verifique se você seguiu as instruções acima.
str(bikes$dayWeek)
str(bikes)

# Adiciona uma variável com valores únicos para o horário do dia em dias de semana e dias de fim de semana
# Com isso diferenciamos as horas dos dias de semana, das horas em dias de fim de semana
bikes$workTime <- ifelse(bikes$isWorking, bikes$hr, bikes$hr + 24) 

# Transforma os valores de hora na madrugada, quando a demanda por bibicletas é praticamente nula 
bikes$xformHr <- ifelse(bikes$hr > 4, bikes$hr - 5, bikes$hr + 19)

# Adiciona uma variável com valores únicos para o horário do dia para dias de semana e dias de fim de semana
# Considerando horas da madrugada
bikes$xformWorkHr <- ifelse(bikes$isWorking, bikes$xformHr, bikes$xformHr + 24) 

str(bikes)
View(bikes)

# Gera saída no Azure ML
if(Azure) maml.mapOutputPort('bikes')
