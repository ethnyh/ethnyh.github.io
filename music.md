---
layout: default
title: Music
description: Original music by GUO Yiheng.
permalink: /music/
---

<section class="music-page" data-music-page>
  <header class="music-intro">
    <p class="eyebrow">Original Tracks</p>
    <h1>Music</h1>
    <p>Click any track to load it into the player and start listening.</p>
  </header>

  {% if site.data.music and site.data.music.size > 0 %}
    <section class="music-grid" aria-label="Music track list">
      {% for track in site.data.music %}
        <button
          class="music-card"
          type="button"
          data-track-button
          data-track-title="{{ track.title | escape }}"
          data-track-file="{{ track.file | relative_url }}"
          data-track-description="{{ track.description | default: '' | escape }}"
        >
          <span class="music-card-index">{{ forloop.index | prepend: '0' | slice: -2, 2 }}</span>
          <span class="music-card-body">
            <span class="music-card-title">{{ track.title }}</span>
            {% if track.description %}
              <span class="music-card-description">{{ track.description }}</span>
            {% endif %}
          </span>
          <span class="music-card-action" aria-hidden="true">Play</span>
        </button>
      {% endfor %}
    </section>
  {% else %}
    <section class="music-empty" aria-live="polite">
      <h2>No tracks published yet</h2>
      <p>Add `.wav` files to <code>assets/music/</code> and register them in <code>_data/music.yml</code>.</p>
    </section>
  {% endif %}

  <section class="music-player-shell" aria-label="Music player">
    <div class="music-player-meta">
      <p class="music-player-label">Now Playing</p>
      <h2 class="music-player-title" data-current-track-title>Select a track</h2>
      <p class="music-player-description" data-current-track-description>
        Choose a block above to load the audio player.
      </p>
    </div>
    <audio class="music-player" controls preload="none" data-audio-player>
      Your browser does not support the audio element.
    </audio>
  </section>
</section>
