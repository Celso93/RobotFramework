# Setup para rodar teste mobile

- [Instalando JDK](https://www.oracle.com/java/technologies/downloads/#jdk25-windows)
- [Android Studio](https://developer.android.com/studio?hl=pt-br)
- [Appium](https://appium.io/docs/en/latest/quickstart/install/)
- [Npm Library Appium](https://www.npmjs.com/package/appium)
- [Npm Appium Doctor](https://www.npmjs.com/package/@appium/doctor)
- [Appium Inspector](https://github.com/appium/appium-inspector/releases)
- [UIAutomator2](https://appium.io/docs/en/latest/quickstart/uiauto2-driver/)
- [Robot Framework](https://robotframework.org/)
- [Appium Library](https://github.com/serhatbolsu/robotframework-appiumlibrary)
- [Appium Library Keywords](https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html)


## Outras informacoes
- Appium e um servidor e dispara as requisicoes para o emulador
- adb devices
- Criando um ambiente virtual venv: virtualenv venv
- Ativando o venv no windows: . .\venv\Scripts\activate
- pip install -r requirements.txt
-

## Como rodar
- Para rodar: robot -d ./logs tests/click.robot
- -d: diretorio dos report do robot
- robot -d ./logs -i wip tests/click.robot
