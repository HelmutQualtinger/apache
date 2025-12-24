# Bekers Welt Dashboard

Ein modernes, responsives Web-Dashboard zur Verwaltung und Übersicht von verschiedenen Webdiensten mit Echtzeitwetterdaten.

## Was macht die App?

Das Dashboard bietet eine zentrale Übersicht über folgende Funktionen:

- **Service-Verzeichnis**: Links zu verschiedenen gehosteten Diensten (Chess, Tetris, Portainer, MQTT Explorer, NPM, GoAccess, Video-Konferenz, etc.)
- **Wetterdaten**: Echtzeitinformationen zum Wetter in Rebstein (Temperatur, Luftfeuchtigkeit, Luftdruck, Windgeschwindigkeit, Bewölkung)
- **Webcam-Integration**: Live-Stream von der Säntis 360° Panorama Webcam
- **Suchfunktion**: Schnelle Filterung der verfügbaren Dienste
- **Dark Mode**: Umschalter zwischen hellem und dunklem Design-Theme
- **Responsive Design**: Funktioniert auf Desktop, Tablet und Mobile-Geräten

## Wie funktioniert die App?

### Frontend-Architektur

Die App ist eine **Single Page Application (SPA)** mit folgender Struktur:

1. **HTML-Struktur**: Semantisches HTML5 mit flexiblem Grid-Layout für die Service-Karten
2. **Styling**: CSS mit CSS-Variablen für Theme-Management, Gradient-Backgrounds, Wave-Animationen
3. **JavaScript**: Vanilla JavaScript für:
   - Theme-Verwaltung (Light/Dark Mode mit LocalStorage-Persistierung)
   - Suchfunktion mit Live-Filter
   - Wetterdaten-Abrufen und -Anzeige
   - Card-Animationen mit gestaffelten Verzögerungen

### Datenfluss

```
┌─────────────────────────────────────────────────────┐
│           Browser / Client-Seite                    │
├─────────────────────────────────────────────────────┤
│                                                     │
│  ├─ Theme Toggle (LocalStorage)                    │
│  ├─ Search Input (DOM Filter)                      │
│  ├─ Fetch Weather API                              │
│  │   └─ Open-Meteo API → JSON → DOM Update        │
│  └─ Card Animations (CSS + JS)                    │
│                                                     │
└─────────────────────────────────────────────────────┘
```

### Animations-System

- **Card Wave**: Karten in jeder Reihe schwingen wellenförmig mit gestaffelten Verzögerungen
- **Wave Background**: Animierte SVG-Wellen-Grafiken im Hintergrund
- **Hover-Effekte**: Sanfte Übergänge und Erhöhungseffekt beim Hovern

## Frameworks und APIs

### Frontend-Frameworks

| Framework | Version | Zweck |
|-----------|---------|-------|
| **jQuery** | 1.7.1 | Geladen aber minimal genutzt (hauptsächlich Vanilla JS) |
| **Font Awesome** | 6.4.0 | Icon-Bibliothek für Symbole (z.B. PDF Sort-Icon) |

### Externe APIs

| API | Zweck | Quelle |
|-----|-------|--------|
| **Open-Meteo** | Wetterdaten (kostenlos, Open-Source) | `https://api.open-meteo.com/v1/forecast` |
| **Säntis Roundshot** | 360° Panorama-Webcam | `https://saentis.roundshot.com/` |

### Wetter-API Details

Die App nutzt die **Open-Meteo API** mit folgenden Parametern für Rebstein (47.4167°N, 9.3167°O):

```
GET /v1/forecast?
  latitude=47.4167
  &longitude=9.3167
  &current=temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m,cloud_cover
  &timezone=auto
```

**WMO Weather Codes Mapping**: Die App konvertiert WMO-Wettercodes in deutsche Beschreibungen und Emoji-Icons (z.B. 0 = Klar ☀️, 3 = Bedeckt ☁️, 65 = Starker Regen ⛈️)

### Gehostete Services

Die App verlinkt auf verschiedene Dienste:

- **Chess**: Schachspiel
- **Tetris**: Tetris-Game
- **Glances/BTOP**: System-Monitoring
- **Portainer**: Docker Management
- **Netdata**: System-Metriken
- **MQTT Explorer**: MQTT Broker Verwaltung
- **News**: Nachrichten-Aggregator
- **NPM**: Nginx Proxy Manager
- **Commodities**: Rohstoffpreise
- **Video-Konferenz**: Video-Konferenzen
- **GoAccess**: Website-Analytics
- **PDF Reorder**: PDF-Verarbeitung
- **Weather/Wetterarchive**: Wetterdaten & Historie

## Technische Eigenschaften

### CSS-Features

- **CSS Grid & Flexbox**: Responsives Layout
- **CSS-Variablen**: Zentrale Theme-Verwaltung (Light/Dark Mode)
- **CSS Gradients**: Farbtransitionen und Background-Effekte
- **CSS Animations**: Keyframe-Animationen für Wave und Card-Bewegungen
- **SVG-Grafiken**: Inline SVG für verschiedene Service-Icons

### Browser-APIs

- **Fetch API**: Asynchrone Daten-Abrufe
- **LocalStorage**: Persistierung von Theme-Präferenz
- **DOM Manipulation**: Dynamische Content-Updates
- **CSS Variables (Custom Properties)**: Style-Injection per JavaScript

### Responsive Breakpoints

- **Mobile** (≤768px): Angepasste Kartengrößen, gestapeltes Layout
- **Desktop** (>768px): Multi-Column Grid-Layout

## Performance

- **Wetter-Caching**: API wird alle 10 Minuten aufgerufen (throttling)
- **Graceful Degradation**: Fallback auf einfachere API-Parameter bei Fehlern
- **Lightweight**: Minimale externe Dependencies, hauptsächlich Vanilla JavaScript

## Installation & Deployment

Die App läuft als statische HTML-Datei und kann einfach auf einem Webserver bereitgestellt werden:

```bash
# Datei: /root/docker-stacks/apache/html/index.html
# Wird über Apache/Nginx auf http://localhost oder gehosteter Domain serviert
```

## Zukünftige Erweiterungen

- Dynamische Service-Katalog-Verwaltung (JSON-Config)
- Status-Monitoring für Service-Verfügbarkeit
- Lokalisierung für weitere Sprachen
- Progressive Web App (PWA) Funktionalität
- Service-Health-Indikatoren in Echtzeit
