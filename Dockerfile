FROM mobiledevops/flutter-sdk-image:3.10.3

RUN flutter upgrade && flutter doctor

RUN which flutter

COPY pubspec.yaml pubspec.lock ./

RUN flutter pub get

COPY . .
