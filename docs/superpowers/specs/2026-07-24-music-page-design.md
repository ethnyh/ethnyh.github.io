## Summary

Add a dedicated Music page that lists the user's original `.wav` tracks from structured site data and lets visitors click any track card to start playback in a fixed bottom player.

## Scope

- Add a new top-level Music page reachable from the shared site navigation.
- Store track metadata in `_data/music.yml`.
- Assume audio files live under `/assets/music/`.
- Render a list of clickable track blocks from the data file.
- Add a single fixed bottom player that updates and plays the selected track.
- Support an empty state when no tracks have been added yet.

## Out of Scope

- Cover art, albums, tagging, or search.
- Auto-scanning the filesystem for audio files.
- Streaming, waveform visualization, or playlists.

## Current Structure

- `_layouts/default.html` defines the shared navigation and page shell.
- `assets/css/site.css` contains all shared styles.
- `assets/js/site.js` is loaded globally and is currently empty.
- `_data/notes.yml` and `script/validate_notes_data.rb` establish the existing pattern for structured content data plus a validation script.

## Proposed Change

1. Add `_data/music.yml` as the source of truth for tracks.
2. Add `music.md` with a `/music/` permalink and a data-driven track list.
3. Add a `Music` nav entry in `_layouts/default.html`.
4. Add music-page styles in `assets/css/site.css`.
5. Add a small global script in `assets/js/site.js` that binds music buttons to the fixed player.
6. Add `script/validate_music_data.rb` to validate track entries and file existence.

## Data Model

Each track entry should be a map with:

- `title`: required display name
- `file`: required site path beginning with `/assets/music/`
- `description`: optional short note

Example:

```yml
- title: First Track
  file: /assets/music/first-track.wav
  description: Ambient sketch in 6/8.
```

## Data Flow / Interaction

- Jekyll reads `_data/music.yml` into `site.data.music`.
- `music.md` renders one button-like card per track.
- Each card carries the selected file URL and text labels in `data-*` attributes.
- `assets/js/site.js` listens for clicks on those cards, updates the bottom player, sets the active state, and calls `audio.play()`.
- If there are no tracks, the page renders a simple empty-state message instead of an empty list.

## Error Handling

- If `_data/music.yml` is empty, the page should still render cleanly with guidance text.
- If a listed file is missing, the validation script should fail before deployment.
- If autoplay is blocked by the browser, the selected track should still load into the player and remain ready for manual play.

## Testing

- Validate `_data/music.yml` with a dedicated Ruby script.
- Build the site locally and confirm `/music/` is generated.
- Check that the generated HTML contains the fixed player and the expected empty state or track buttons.
