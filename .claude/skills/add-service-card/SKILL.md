---
name: add-service-card
description: Pattern for adding a new service card to a frame section in html/index.html (the dashboard SPA)
---

# Adding a Service Card

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
