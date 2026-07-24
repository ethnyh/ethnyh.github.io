const musicPage = document.querySelector("[data-music-page]");

if (musicPage) {
  const trackButtons = Array.from(musicPage.querySelectorAll("[data-track-button]"));
  const player = musicPage.querySelector("[data-audio-player]");
  const currentTitle = musicPage.querySelector("[data-current-track-title]");
  const currentDescription = musicPage.querySelector("[data-current-track-description]");

  const setActiveTrack = (button) => {
    trackButtons.forEach((trackButton) => {
      trackButton.classList.toggle("is-active", trackButton === button);
    });
  };

  const loadTrack = async (button) => {
    const title = button.dataset.trackTitle || "Untitled track";
    const file = button.dataset.trackFile || "";
    const description = button.dataset.trackDescription || "Ready to play.";

    if (!file || !player || !currentTitle || !currentDescription) {
      return;
    }

    currentTitle.textContent = title;
    currentDescription.textContent = description || "Ready to play.";

    if (player.getAttribute("src") !== file) {
      player.src = file;
    }

    setActiveTrack(button);

    try {
      await player.play();
    } catch (_error) {
      player.focus();
    }
  };

  trackButtons.forEach((button) => {
    button.addEventListener("click", () => {
      loadTrack(button);
    });
  });
}
