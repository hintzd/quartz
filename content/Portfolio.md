---
title: Portfolio 💼 
date: 2024-09-13
format:
  html:
    html-math-method: mathjax
    html: true
---


<!--
<iframe src="https://dhintz137.github.io/Completed_Works/" width="100%" height="600px" style="border: none; display: block;" onload="iframeLoaded()" allowfullscreen frameborder="25px"></iframe>
-->

<!-- Fullscreen button -->
<button onclick="makeIframeFullscreen()">Go Fullscreen</button>

<!-- Iframe with allowfullscreen and allow="fullscreen" attributes -->
<iframe id="iframe_view" src="https://dhintz137.github.io/Completed_Works/" width="100%" height="600px" style="border: none; display: block;" onload="iframeLoaded()" allowfullscreen allow="fullscreen"></iframe>

<script>
// Function to make iframe fullscreen
function makeIframeFullscreen() {
    var iframe = document.getElementById("iframe_view");

    // Use the Fullscreen API
    if (iframe.requestFullscreen) {
        iframe.requestFullscreen();
    } else if (iframe.mozRequestFullScreen) { // Firefox
        iframe.mozRequestFullScreen();
    } else if (iframe.webkitRequestFullscreen) { // Chrome, Safari and Opera
        iframe.webkitRequestFullscreen();
    } else if (iframe.msRequestFullscreen) { // IE/Edge
        iframe.msRequestFullscreen();
    }
}
</script>

