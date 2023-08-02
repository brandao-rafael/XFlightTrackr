# XFlight Trackr - V1.0.0

<details>
    <summary>🇺🇸 English</summary>
    
## Overview
XFlight Trackr is an application developed in Flutter that aims to provide an improved experience for aviation enthusiasts who use the Xplane-11 flight simulator. This is the first version of the application, in which you can connect to Xplane-11 and track crucial flight information, details of some aircraft systems and your real-time location on the map.

## Main Features
- Connection to the Xplane-11 flight simulator to obtain real-time flight data.
- Display of the main flight information, such as altitude, speed, direction, among others.
- Tracking the location of the aircraft on the map in real time, with options to choose the desired map style.
- More features coming soon!

## Installation
Download the apk in x_flight_trackr/xftrackr.apk and install it on your Android device.

## Feedback and Support
Thank you for your interest in our application! If you have any questions, feedback or find any problems, feel free to open an issue in this repository. We will do our best to respond and resolve any issues as quickly as possible.

## Requirements for operation

### You will need to have Xplane-11 installed on your machine and configured to allow external connections. To do this, follow the steps below:
You will need to create a firewall rule to allow external connections to Xplane-11. To do this, follow [this step by step](https://www.x-plane.com/kb/allowing-x-plane-through-your-firewall/)

You will also need to configure the Xplane-11 network to allow external connections. to do this follow the tutorial below:

- Open Xplane-11 and go to Settings> Data Output
- In the General Data Output tab, check all Network via UDP options
    - **Note: if you do not check all the options, Xplane-11 will not send all the data necessary for the operation of XFlight Trackr and may generate errors in the application.**
- In the Network Configuration tab, check the Send network data output option.
- In the IP Address field, enter the IP of your local machine.
    - Note: to find out the IP of your machine, open the terminal and type the ipconfig (windows) or ifconfig (linux / mac) command. The IP of your machine will be the one that is on the same line as the text IPv4 Address.
- In the Port field, enter the number 51000.
- Click Done to save the settings.

## How to Contribute
If you are a Flutter developer or have aviation experience and want to contribute to the project, we will be happy to receive your help! Just fork this repository, implement your improvements and submit a pull request.

We hope you enjoy this first version of XFlight Trackr, apk available at x_flight_trackr/xftrackr.apk. Stay tuned for more updates and improvements soon! Welcome aboard and happy adventures in the virtual skies! 🛫✨


</details>

## Visão Geral
O XFlight Trackr é uma aplicação desenvolvida em Flutter que tem como objetivo fornecer uma experiência aprimorada para os entusiastas da aviação que utilizam o simulador de voo Xplane-11. Esta é a primeira versão da aplicação, na qual você poderá se conectar ao Xplane-11 e acompanhar informações cruciais do voo em andamento, detalhes de alguns sistemas da aeronave e sua localização em tempo real no mapa.

## Funcionalidades Principais
- Conexão com o simulador de voo Xplane-11 para obter dados em tempo real do voo.
- Exibição das informações principais do voo, como altitude, velocidade, direção, entre outras.
- Acompanhamento da localização da aeronave no mapa em tempo real, com opções para escolher o estilo do mapa desejado.
- Em breve mais funcionalidades!


## Instalação
Faça o download do apk em x_flight_trackr/xftrackr.apk e instale em seu dispositivo Android.

## Feedback e Suporte
Agradecemos o interesse em nossa aplicação! Se você tiver alguma dúvida, feedback ou encontrar algum problema, sinta-se à vontade para abrir uma issue neste repositório. Faremos o possível para responder e resolver qualquer questão o mais rápido possível.

## Requisitos para o funcionamento

### Você precisará ter o Xplane-11 instalado em sua máquina e configurado para permitir conexões externas. Para isso, siga os passos abaixo:
Será preciso criar uma regra de firewall para permitir conexões externas ao Xplane-11. Para isso, siga [esse passo a passo](https://www.x-plane.com/kb/allowing-x-plane-through-your-firewall/)

Será preciso também configurar a rede do Xplane-11 para permitir conexões externas. para isso siga o tutotial abaixo:

- Abra o Xplane-11 e vá em Settings > Data Output
- Na aba General Data Output, marque todas as opções Network via UDP
    - **Observação: se você não marcar todas as opções, o Xplane-11 não enviará todos os dados necessários para o funcionamento do XFlight Trackr podendo gerar erros na aplicação.**
- Na aba Network Configuration, marque a opção Send network data output.
- No campo IP Address, coloque o IP da sua máquina local.
    - Observação: para saber o IP da sua máquina, abra o terminal e digite o comando ipconfig (windows) ou ifconfig (linux/mac). O IP da sua máquina será o que estiver na mesma linha que o texto IPv4 Address.
- No campo Port, coloque o número 51000.
- Click em Done para salvar as configurações.
## Como Contribuir
Se você é um desenvolvedor Flutter ou tem experiência em aviação e deseja contribuir para o projeto, ficaremos felizes em receber sua ajuda! Basta fazer um fork deste repositório, implementar suas melhorias e enviar um pull request.

Esperamos que você goste desta primeira versão do XFlight Trackr, apk disponível em x_flight_trackr/xftrackr.apk. Fique atento para mais atualizações e melhorias em breve! Seja bem-vindo a bordo e boas aventuras nos céus virtuais! 🛫✨
