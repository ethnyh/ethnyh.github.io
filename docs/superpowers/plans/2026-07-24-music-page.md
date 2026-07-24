# Music Page Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a data-driven Music page with clickable track cards and a fixed bottom audio player for `.wav` compositions.

**Architecture:** Follow the existing Jekyll pattern by storing track metadata in `_data/music.yml`, rendering the page from Liquid in `music.md`, and handling playback with a small progressive-enhancement script in `assets/js/site.js`. Keep the layout shared, add a nav link, and validate data with a dedicated Ruby script that enforces file paths and existence.

**Tech Stack:** Jekyll, Liquid templates, Markdown, CSS, vanilla JavaScript, Ruby

---

### Task 1: Add music data and validation

**Files:**
- Create: `_data/music.yml`
- Create: `script/validate_music_data.rb`

- [ ] **Step 1: Write the failing test**

Run: `test -f script/validate_music_data.rb`
Expected: exit code `1` because the music validation script does not exist yet.

- [ ] **Step 2: Run test to verify it fails**

Run: `test -f script/validate_music_data.rb`
Expected: exit code `1`.

- [ ] **Step 3: Write minimal implementation**

Create `_data/music.yml` as an empty list:

```yml
[]
```

Create `script/validate_music_data.rb` to:
- require `_data/music.yml`
- allow an empty top-level list
- require each item to be a map
- require `title` and `file`
- require `file` to start with `/assets/music/`
- require the referenced file to exist
- allow optional `description` if it is a string

- [ ] **Step 4: Run test to verify it passes**

Run: `ruby script/validate_music_data.rb`
Expected: `Validated 0 tracks`

- [ ] **Step 5: Commit**

```bash
git add _data/music.yml script/validate_music_data.rb
git commit -m "Add music data validation"
```

### Task 2: Add the page shell and navigation entry

**Files:**
- Create: `music.md`
- Modify: `_layouts/default.html`

- [ ] **Step 1: Write the failing test**

Run: `test -f music.md`
Expected: exit code `1` because the Music page does not exist yet.

- [ ] **Step 2: Run test to verify it fails**

Run: `test -f music.md`
Expected: exit code `1`.

- [ ] **Step 3: Write minimal implementation**

Add `music.md` with:
- front matter using `layout: default`
- `title: Music`
- `permalink: /music/`
- intro copy
- a conditional empty state when `site.data.music` is empty
- a list of clickable track buttons when entries exist
- fixed player markup at the bottom of the page

Add a `Music` link in `_layouts/default.html` next to `About`.

- [ ] **Step 4: Run test to verify it passes**

Run: `rg -n "permalink: /music/|Music" music.md _layouts/default.html`
Expected: matches for the new page permalink and nav label.

- [ ] **Step 5: Commit**

```bash
git add music.md _layouts/default.html
git commit -m "Add music page shell"
```

### Task 3: Add shared styles and playback behavior

**Files:**
- Modify: `assets/css/site.css`
- Modify: `assets/js/site.js`

- [ ] **Step 1: Write the failing test**

Run: `rg -n "music-grid|music-player-shell|data-track-button" assets/css/site.css assets/js/site.js`
Expected: no matches because music-specific styles and behavior do not exist yet.

- [ ] **Step 2: Run test to verify it fails**

Run: `rg -n "music-grid|music-player-shell|data-track-button" assets/css/site.css assets/js/site.js`
Expected: exit code `1`.

- [ ] **Step 3: Write minimal implementation**

Add styles for:
- music intro block
- track list grid
- clickable track cards
- active card state
- empty state panel
- fixed bottom player shell

Add JavaScript that:
- finds `[data-music-page]`
- binds clicks on `[data-track-button]`
- updates current title and description
- sets `audio.src`
- calls `audio.play()`
- updates the active state

- [ ] **Step 4: Run test to verify it passes**

Run: `rg -n "music-grid|music-player-shell|data-track-button" assets/css/site.css assets/js/site.js`
Expected: matches in both files.

- [ ] **Step 5: Commit**

```bash
git add assets/css/site.css assets/js/site.js
git commit -m "Add music page styles and player behavior"
```

### Task 4: Verify generated output

**Files:**
- Verify: `_data/music.yml`
- Verify: `music.md`
- Verify: `_layouts/default.html`
- Verify: `assets/css/site.css`
- Verify: `assets/js/site.js`
- Verify: `script/validate_music_data.rb`

- [ ] **Step 1: Write the failing test**

Define final checks:
- music data validation succeeds
- site build succeeds
- `_site/music/index.html` exists
- generated HTML contains the fixed player container

- [ ] **Step 2: Run test to verify it fails**

Run: `test -f _site/music/index.html`
Expected: exit code `1` before rebuilding, or stale output that does not contain the new player markup.

- [ ] **Step 3: Write minimal implementation**

No additional code if prior tasks are complete.

- [ ] **Step 4: Run test to verify it passes**

Run: `ruby script/validate_music_data.rb`
Expected: `Validated 0 tracks`

Run: `jekyll build`
Expected: exit code `0`

Run: `test -f _site/music/index.html && rg -n "music-player-shell|No tracks published yet|data-track-button" _site/music/index.html`
Expected: generated Music page exists and contains the player shell plus either the empty state or track buttons.

- [ ] **Step 5: Commit**

```bash
git add _data/music.yml music.md _layouts/default.html assets/css/site.css assets/js/site.js script/validate_music_data.rb
git commit -m "Add data-driven music page"
```
