# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Running the Stack

`docker-compose up -d` / `docker-compose down` (see `docker-compose.yml` for the port/volume mapping). The live site is at `https://www.bekerh.ddns.net/` (port 80 via reverse proxy) and locally at `http://localhost:8081`.

## Taking a Snapshot

```bash
wkhtmltoimage --quiet https://www.bekerh.ddns.net/ homepage.png
```

## Repository Structure

- `html/index.html` — the entire dashboard: all HTML, CSS, and JS in one file (~1500+ lines)
- `html/LifeJS/` — git submodule, Conway's Game of Life
- `html/js-mandelbrot/` — git submodule, Mandelbrot explorer
- `docker-compose.yml` — runs Apache httpd:2.4

## Architecture of index.html

A single-file SPA with no build step. All CSS and JS are inline.

**CSS structure (top of `<style>`):**
- `:root` / `[data-theme="dark"]` — CSS variables for theming
- `.card` — cloud-shaped service cards using SVG `clip-path` (`#cloud1`–`#cloud7`)
- `@keyframes cardFloat`, `cardWave`, `wave-motion*` — animation durations control how fast clouds move
- `.frames-container` — CSS Grid holding the 6 section frames

**HTML structure (inside `<body>`):**
- Inline `<svg>` block defining cloud clip-paths `#cloud1`–`#cloud7`
- `.grid` — top row of main service cards
- `.frames-container` holding 6 `<div>` frames in order:
  1. `.news-frame` — Nachrichten
  2. `.communication-frame` — EnergieVerbrauch
  3. `.games-frame` — Spiele
  4. `.science-frame` — Wissenschaft
  5. `.server-frame` — Server-Verwaltung
  6. `.tools-frame` — Werkzeuge
- Weather + webcam section below

**JS (bottom of file):**
- Theme toggle (persisted in `localStorage`)
- Search/filter over all `.card` elements
- Open-Meteo weather fetch for Rebstein (lat 47.4167, lon 9.3167), refreshed every 10 minutes

See the `add-service-card` skill for the card template pattern.
