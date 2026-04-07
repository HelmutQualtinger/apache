# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Running the Stack

```bash
# Start Apache serving html/ on port 8081
docker-compose up -d

# Stop
docker-compose down
```

The container maps `./html/` → `/usr/local/apache2/htdocs/` via `httpd:2.4`. The live site is at `https://www.bekerh.ddns.net/` (port 80 via reverse proxy) and locally at `http://localhost:8081`.

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
  2. `.communication-frame` — Haushalt
  3. `.games-frame` — Spiele
  4. `.science-frame` — Wissenschaft
  5. `.server-frame` — Server-Verwaltung
  6. `.tools-frame` — Werkzeuge
- Weather + webcam section below

**JS (bottom of file):**
- Theme toggle (persisted in `localStorage`)
- Search/filter over all `.card` elements
- Open-Meteo weather fetch for Rebstein (lat 47.4167, lon 9.3167), refreshed every 10 minutes

## Adding a Service Card

Each card follows this pattern inside the relevant `*-frame` div:

```html
<a href="URL" class="card" style="--card-index: N; clip-path: url(#cloudN);" target="_blank">
    <div class="icon"><!-- emoji, <img>, or inline <svg> --></div>
    <div class="card-title">Title</div>
    <div class="card-domain">domain.example.com</div>
    <div class="status"><span class="status-dot"></span>Online</div>
</a>
```

- `--card-index` controls the staggered animation delay; increment sequentially within the frame
- `clip-path` cycles through `#cloud1`–`#cloud7`
- Icons can be emoji text, `<img>` tags, or inline SVG
