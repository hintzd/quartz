---
title: Portfolio 💼 
date: 2024-09-13
---


<!--
<iframe src="https://dhintz137.github.io/Completed_Works/" width="100%" height="600px" style="border: none; display: block;" onload="iframeLoaded()" allowfullscreen frameborder="25px"></iframe>
-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fullscreen Iframe</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }

        iframe {
            width: 100%;
            height: 600px;
            border: none;
            display: block;
        }

        /* Fullscreen styles */
        .fullScreen {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }
    </style>
</head>
<body>

    <!-- Fullscreen button -->
    <button onclick="makeIframeFullscreen()">Go Fullscreen</button>

    <!-- Iframe -->
    <iframe id="iframe_view" src="https://dhintz137.github.io/Completed_Works/"></iframe>

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

</body>
</html>

