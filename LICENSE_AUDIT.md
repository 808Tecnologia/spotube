# Auditoría de Licencias de Dependencias

**Fecha:** 2024-07-26

**Autor:** Jules, Ingeniero de Software

**Objetivo:** Identificar todas las dependencias de terceros y sus licencias para asegurar la compatibilidad con un modelo de negocio comercial "Premium-Ready". El objetivo es evitar licencias *copyleft* (como GPL, LGPL) que podrían obligar a la liberación del código fuente de los módulos comerciales.

---

## Resumen de Riesgos

| Licencia | Nivel de Riesgo | Razón |
| :--- | :--- | :--- |
| **GPL / LGPL** | **Crítico** | Requiere que el trabajo derivado (o el software que lo enlaza) sea también de código abierto. Incompatible con módulos comerciales de código cerrado. |
| **MPL / EPL** | **Alto** | Copyleft débil, requiere que las modificaciones a los archivos originales sean de código abierto. Puede ser problemático. |
| **Apache 2.0** | **Bajo** | Permisiva, pero incluye una cláusula de patente. Generalmente segura para uso comercial. |
| **MIT / BSD / ISC** | **Ninguno** | Permisivas, ideales para uso comercial. |

---

## Análisis de Dependencias

| Paquete | Versión | Licencia | Tipo de Licencia | Riesgo | Acción Recomendada |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `media_kit` | git | MIT | Permisiva | **Bajo (el paquete)** / **Crítico (dependencia nativa)** | La licencia del paquete Dart es segura. El riesgo reside en la licencia de FFmpeg/libmpv que utiliza. Se debe proceder con la **recompilación personalizada** para excluir componentes GPL/LGPL, como se detalla en el informe de patentes. |
| `youtube_explode_dart` | ^3.0.0 | MIT | Permisiva | **Bajo (licencia)** / **Crítico (uso)** | La licencia es segura. Sin embargo, su uso para extraer contenido de YouTube viola los Términos de Servicio, lo que es un riesgo legal crítico para un producto comercial. Debe ser reemplazado por una API legal. |
| `drift` | ^2.21.0 | MIT | Permisiva | Ninguno | Seguro para uso comercial. |
| `flutter_riverpod` | ^2.5.1 | MIT | Permisiva | Ninguno | Seguro para uso comercial. (Nota: Se migrará a BLoC según los requisitos). |
| `audio_service` | ^0.18.13 | MIT | Permisiva | Ninguno | Seguro para uso comercial. |
