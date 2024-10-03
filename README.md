# progmsn2024

### Practica 1: Challenge Coffe App

Fecha de vencimiento: 15 de septiembre de 2024 23:59

## Descripción

Para completar la presente práctica el alumno deberá seguir los pasos que se presentan en el siguiente video, e implementar la aplicación que dentro del mismo se desarrolla.

- **Pantalla Principal**: Una interfaz principal que muestre una lista de tarjetas, cada una representando un cubo Rubik con información y gráficos relevantes.
- **Tarjetas de Bebidas**: Cada tarjeta debe mostrar un nombre, una descripción breve, una imagen de fondo, y una imagen superior del cubo Rubik.
- **Animaciones**: Implementación de animaciones para la transición entre tarjetas y para los elementos dentro de cada tarjeta.
- **Colores y Estilo**: Personalización del tema de la aplicación utilizando una paleta de colores definida, asegurando que los colores se apliquen consistentemente en toda la aplicación.

---

### Practica 2: Screen Profile

Fecha de vencimiento: 15 de septiembre de 2024, 22:59

## Descripción

Esta practica es una aplicación móvil desarrollada en Flutter como parte de las actividades del curso. El objetivo es implementar una serie de pantallas interactivas, utilizando nuevos widgets y tecnologías, con un enfoque en la creación de un perfil de usuario dinámico.

## Características

- **Pantalla de Perfil**: Captura y edición de datos del perfil, incluyendo imagen, nombre completo, correo electrónico, número de teléfono y página de GitHub.
- **Selección de Imagen**: Permite seleccionar una imagen desde la cámara o la galería del dispositivo.
- **Widgets Personalizados**: Uso de nuevos widgets para mejorar la presentación y funcionalidad de la aplicación.

---

### Practica 3: Onboarding y Configuración de Temas

Fecha de vencimiento: 02 de octubre del 2024

## Descripción

La práctica consiste en implementar una secuencia de pantallas de onboarding en una aplicación Flutter, que guíe al usuario a través de las características de la aplicación y le permita configurar el tema y la fuente de su elección.

## Características

- **Pantallas de Onboarding**:

  - **Pantalla 1**: Presenta una bienvenida e introducción a la aplicación.
  - **Pantalla 2**: Permite seleccionar entre diferentes temas (claro, oscuro, personalizado) y fuentes (Arial, Courier New).
  - **Pantalla 3**: Proporciona información adicional sobre el uso de onboarding y un enlace a más recursos.

- **Gestión de Estado**: Utiliza `Provider` para gestionar el estado del tema de la aplicación y las preferencias del usuario.

- **Persistencia de Datos**: Implementa `SharedPreferences` para recordar si el usuario ha completado el onboarding y las configuraciones seleccionadas.

- **Animaciones**: Se incorporan animaciones Lottie para mejorar la experiencia visual en las pantallas de onboarding.

- **Navegación**: Se implementa navegación fluida entre las pantallas de onboarding y la pantalla principal de la aplicación.

## Dependencias Utilizadas

```yaml
dependencies:
  shared_preferences: ^2.3.2
  url_launcher: ^6.3.0
  lottie: ^3.1.2
  provider: ^6.1.2
```
