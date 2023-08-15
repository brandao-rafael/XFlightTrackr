# XFlight Trackr - V1.1.0  
<a href="https://flightplandatabase.com"><img src="https://static.flightplandatabase.com/images/data-banner/dark.min.png" alt="Data from the Flight Plan Database"></a>

<div>
    <img src="https://github.com/brandao-rafael/XFlightTrackr/blob/brandao-rafael-readme/screenshots/shot2V1-1-0.jpeg?raw=true" height="200px" />
    <img src="https://github.com/brandao-rafael/XFlightTrackr/blob/brandao-rafael-readme/screenshots/shot3V1-1-0.jpeg?raw=true" height="200px" />
    <img src="https://github.com/brandao-rafael/XFlightTrackr/blob/brandao-rafael-readme/screenshots/shot4V1-1-0.jpeg?raw=true" height="200px" />
    <img src="https://github.com/brandao-rafael/XFlightTrackr/blob/brandao-rafael-readme/screenshots/shotV1-1-0.jpeg?raw=true" height="200px" />
</div>

https://github.com/brandao-rafael/XFlightTrackr/assets/101598059/69524fd6-b762-46a1-9eed-ec9d99ff4e20

<details>
    <summary>🇺🇸 English</summary>
    
## Overview
XFlight Trackr is an application developed in Flutter that aims to provide an improved experience for aviation enthusiasts who use the Xplane-11 flight simulator. This is the first version of the application, in which you can connect to Xplane-11 and track crucial flight information, details of some aircraft systems and your real-time location on the map.

## Main Features
- Connection to the Xplane-11 flight simulator to obtain real-time flight data.
- Display of the main flight information, such as altitude, speed, direction, among others.
- Tracking the location of the aircraft on the map in real time, with options to choose the desired map style.
- Search for flight plans on <a href="https://flightplandatabase.com">Flight Plan Database</a>.
- View the flight plan route on the map.
- View the details of flight plan on the details modal.
- More features coming soon!

## Installation
You can download apk in <a href="https://docs.google.com/uc?export=download&id=18q-MT-Oxd3SU-uivW1lcRm-CDSzMXhYJ" target="_blank">this link</a> or download the xftrackr in the root of this repository and install it on your Android device.

## Feedback and Support
Thank you for your interest in our application! If you have any questions, feedback or find any problems, feel free to open an issue in this repository. We will do our best to respond and resolve any issues as quickly as possible.

## Requirements for operation

### You will need to have Xplane-11 installed on your machine and configured to allow external connections. To do this, follow the steps below:
You will need to create a firewall rule to allow external connections to Xplane-11. To do this, follow <a href="https://www.x-plane.com/kb/allowing-x-plane-through-your-firewall/" target="_blank"> this step by step </a>

You will also need to configure the Xplane-11 network to allow external connections. to do this follow the tutorial below:

- Open Xplane-11 and go to Settings> Data Output
- In the General Data Output tab, check all Network via UDP options
    - **Note: if you do not check all the options, Xplane-11 will not send all the data necessary for the operation of XFlight Trackr and may generate errors in the application.**
- In the Network Configuration tab, check the Send network data output option.
- In the IP Address field, enter the IP of your device.
    - Note: to find out the IP of your device, open the configuration > wifi > network details > IP Address (ipv4).
    - Make sure your device is connected to the same wifi network as your computer
- In the Port field, enter the number 51000.
- Click Done to save the settings.

## How to Contribute
If you are a Flutter developer or have aviation experience and want to contribute to the project, we will be happy to receive your help! Just fork this repository, implement your improvements and submit a pull request.

We hope you enjoy this first version of XFlight Trackr, apk available in root of this repo. Stay tuned for more updates and improvements soon! Welcome aboard and happy adventures in the virtual skies! 🛫✨
<br/>
<br/>
<hr/>


</details>

## Visão Geral
O XFlight Trackr é uma aplicação desenvolvida em Flutter que tem como objetivo fornecer uma experiência aprimorada para os entusiastas da aviação que utilizam o simulador de voo Xplane-11. Esta é a primeira versão da aplicação, na qual você poderá se conectar ao Xplane-11 e acompanhar informações cruciais do voo em andamento, detalhes de alguns sistemas da aeronave e sua localização em tempo real no mapa.

## Funcionalidades Principais
- Conexão com o simulador de voo Xplane-11 para obter dados em tempo real do voo.
- Exibição das informações principais do voo, como altitude, velocidade, direção, entre outras.
- Acompanhamento da localização da aeronave no mapa em tempo real, com opções para escolher o estilo do mapa desejado.
- Busca de planos de voo no <a href="https://flightplandatabase.com">Flight Plan Database</a>.
- Visualização da rota do plano de voo no mapa.
- Visualização dos detalhes do plano de voo no modal de detalhes.

- Em breve mais funcionalidades!


## Instalação
Você pode baixar o apk <a href="https://docs.google.com/uc?export=download&id=18q-MT-Oxd3SU-uivW1lcRm-CDSzMXhYJ" target="_blank">neste link</a> ou fazer o download do xftrackr na raiz desse repositório e instale em seu dispositivo Android.

## Feedback e Suporte
Agradecemos o interesse em nossa aplicação! Se você tiver alguma dúvida, feedback ou encontrar algum problema, sinta-se à vontade para abrir uma issue neste repositório. Faremos o possível para responder e resolver qualquer questão o mais rápido possível.

## Requisitos para o funcionamento

### Você precisará ter o Xplane-11 instalado em sua máquina e configurado para permitir conexões externas. Para isso, siga os passos abaixo:
Será preciso criar uma regra de firewall para permitir conexões externas ao Xplane-11. Para isso, siga <a href="https://www.x-plane.com/kb/allowing-x-plane-through-your-firewall/" target="_blank"> esse passo a passo </a>

Será preciso também configurar a rede do Xplane-11 para permitir conexões externas. para isso siga o tutotial abaixo:

- Abra o Xplane-11 e vá em Settings > Data Output
- Na aba General Data Output, marque todas as opções Network via UDP
    - **Observação: se você não marcar todas as opções, o Xplane-11 não enviará todos os dados necessários para o funcionamento do XFlight Trackr podendo gerar erros na aplicação.**
- Na aba Network Configuration, marque a opção Send network data output.
- No campo IP Address, coloque o IP da sua máquina local.
    - Observação: para saber o IP do seu dispositivo android vá em configurações > wifi > detalhes da rede > endereço ip (ipv4).
    - Tenha certeza que seu dispositivo está conectado a mesma rede do computador
- No campo Port, coloque o número 51000.
- Click em Done para salvar as configurações.

## Como Contribuir
Se você é um desenvolvedor Flutter ou tem experiência em aviação e deseja contribuir para o projeto, ficaremos felizes em receber sua ajuda! Basta fazer um fork deste repositório, implementar suas melhorias e enviar um pull request.

Esperamos que você goste desta primeira versão do XFlight Trackr, apk disponível na raíz do repositório. Fique atento para mais atualizações e melhorias em breve! Seja bem-vindo a bordo e boas aventuras nos céus virtuais! 🛫✨
