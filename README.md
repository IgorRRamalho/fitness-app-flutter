
# FitBody - Fitness App

Este é o repositório do **FitBody**, um aplicativo de fitness desenvolvido em Flutter. O objetivo do FitBody é ajudar os usuários a embarcarem em uma jornada de vida saudável, oferecendo suporte em exercícios, alimentação e acompanhamento de metas.

## Sumário

- [Sobre](#sobre)
- [Recursos](#recursos)
- [Instalação](#instalacao)
- [Como Testar](#como-testar)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Contribuições](#contribuicoes)
- [Licença](#licenca)

## Sobre

O FitBody é um aplicativo focado em ajudar usuários a atingir suas metas de fitness. Com interfaces modernas e intuitivas, o app oferece funcionalidades como criação de conta, login, onboarding com dicas fitness, redefinição de senha e muito mais.

## Recursos

- Onboarding com dicas de saúde
- Criação de conta e login
- Recuperação de senha
- Criação de metas fitness personalizadas
- Suporte a múltiplos idiomas (internacionalização)
- Design responsivo e atrativo



## Instalação

### Requisitos

- Flutter SDK instalado ([Guia de instalação do Flutter](https://flutter.dev/docs/get-started/install))
- Android Studio ou VS Code (para ambiente de desenvolvimento)
- Um emulador Android ou dispositivo físico

### Passos

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/fitbody.git
   ```

2. Navegue até o diretório do projeto:

   ```bash
   cd fitbody
   ```

3. Baixe as dependências necessárias:

   ```bash
   flutter pub get
   ```

4. Inicie o projeto em um emulador ou dispositivo:

   ```bash
   flutter run
   ```

## Como Testar

### Passos para testar o app:

1. **Configurando o Ambiente de Desenvolvimento**:
   - Certifique-se de que o Flutter esteja instalado corretamente.
   - Verifique a instalação do Flutter com o comando:

     ```bash
     flutter doctor
     ```

2. **Executando no Emulador/Dispositivo**:
   - Conecte um dispositivo físico ou inicie um emulador no Android Studio ou outro ambiente de desenvolvimento.
   - No terminal, dentro da pasta do projeto, execute o comando para rodar o aplicativo:

     ```bash
     flutter run
     ```

3. **Testes Automatizados**:
   - Para executar testes unitários, use o comando:

     ```bash
     flutter test
     ```

4. **Localização (Localization)**:
   - O app suporta múltiplos idiomas. Para testar a internacionalização, ajuste as configurações de idioma do dispositivo ou emulador e observe as mudanças de texto e layout no app.

## Tecnologias Utilizadas

- **Flutter**: Framework principal para desenvolvimento do app.
- **Dart**: Linguagem de programação usada com Flutter.
- **SharedPreferences**: Para armazenamento local de dados do usuário.
- **Fontes Customizadas**: Incluindo `Montserrat` para uma experiência de design consistente.
- **Internacionalização**: Suporte a múltiplos idiomas com o uso de arb files.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma *issue* ou enviar um *pull request* para melhorias no projeto.

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE).
