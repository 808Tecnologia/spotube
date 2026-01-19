# Análisis de Ingeniería - Spotube vs Aural Flow

## 1. Mapa de Dependencias
- **Audio:** `media_kit` + `audio_service`. Es la opción más robusta para desktop/mobile, pero requiere manejo cuidadoso de patentes.
- **APIs:** `youtube_explode_dart` para extracción. Riesgo de fragilidad ante cambios de YouTube.
- **Estado:** `flutter_riverpod`. Eficiente pero genera alto acoplamiento.

## 2. Flujo de Datos (Matchmaking)
- **Proceso:** Spotify (Metadata) -> Search YouTube -> Ranking de Similitud -> Stream.
- **Lección:** El ranking es clave. Spotube usa comparaciones de títulos, artistas y duraciones para filtrar el audio correcto.

## 3. Deuda Técnica Detectada
- **Acoplamiento:** El objeto `Ref` de Riverpod se inyecta en clases de servicios y modelos.
- **Modelos Anémicos/Fat:** `SourcedTrack` tiene demasiada lógica (red, db, ranking).
- **Lógica en UI:** La paginación y el manejo de errores suelen estar mezclados con los widgets.

---

# Propuesta de Arquitectura: Aural Flow

## Estructura Modular (Clean Architecture)
- `lib/core`: Utilidades y contratos base.
- `lib/features/player`: Lógica de reproducción.
- `lib/features/search`: Búsqueda unificada.
- `lib/design_system`: Rebranding "Antigravity".

## Gestión de Errores
Uso de `fpdart` y el tipo `Either<Failure, Success>` para evitar excepciones descontroladas en la UI.
