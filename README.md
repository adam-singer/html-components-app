# HTML Components App
===============

This is a sample application that demonstrates how to use the HTML Components library.

The application can be used in Dart Editor. The pages are based on Bootstrap, but the menu system is empty on every page, because in the production environment (http://html-components.appspot.com), it is dynamically generated.

Although there is a pub package for HTML Components, the app currently does not use it as a dependency, instead it assumes that there is an html_components folder with the project in the same folder as this project. This way it is easier to update the library and rerun the application.

The polymer version does not require build.dart, but works only in Dartium right now.