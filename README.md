# Lista de Heróis

    Cadastrar Heróris com base nas categorias.

# Fazer o Builder
    - flutter build apk --release --dart-define=ACCESS_TOKEN=xxxx --dart-define=TIME_CACHE_MINUTES=5  --dart-define=API_KEY=https://xxx.net
    - flutter build apk --release --dart-define-from-file=".env"
    
    - flutter build apk --debug --dart-define=ACCESS_TOKEN=xxxx --dart-define=TIME_CACHE_MINUTES=5  --dart-define=API_KEY=https://xxx.net
    - flutter build apk --debug --dart-define-from-file=".env"

# Executar Device ou no Dispositivo
    - flutter run --release --dart-define=ACCESS_TOKEN=xxxx --dart-define=TIME_CACHE_MINUTES=5  --dart-define=API_KEY=https://xxx.net
    - flutter run --release --dart-define-from-file=".env"

    - flutter run --debug --dart-define=ACCESS_TOKEN=xxxx --dart-define=TIME_CACHE_MINUTES=5  --dart-define=API_KEY=https://xxx.net
    - flutter run --debug --dart-define-from-file=".env"

# Controle de cache

    - Para listagens das categorias e dos Heróis serão armazenadas em memória. Para evitar inserir dados em memória a cada listagem utilizei um controle de cache de 5 minutos, cada requisição é analisada com base nessa regra e armazena local ou não.
    - Após a primeira listagem com sucesso (com internet) o restante pode seguir sem. Cadastrar, editar e deletar.
    - Caso não exista internet no ato do cadastro, edição ou na exclusão a request será gravada local e ao acessar a home envia a requisição.

# Framework Flutter

    Flutter 3.22.2 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision 761747bfc5 (8 weeks ago) • 2024-06-05 22:15:13 +0200
    Engine • revision edd8546116
    Tools • Dart 3.4.3 • DevTools 2.34.3

# Pacotes

    cupertino_icons: ^1.0.6
    flutter_modular: ^6.3.4
    dio: 5.5.0+1
    sqflite: 2.3.3+1
    animations: 2.0.11
    equatable: ^2.0.5
    dartz: ^0.10.1
    shimmer: ^3.0.0
    oktoast: ^3.4.0

    => development
    mocktail: ^1.0.4
