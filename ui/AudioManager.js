// AudioManager.js - GameFace Compatible (Minimal Changes)
// Use <video> to play audio, paths relative to index.html

(function() {
    var currentVideo = null;
    
    window.playSound = function(file, volume, loop) {
        try {
            //  Clean up old video (prevent conflicts)
            if (currentVideo) {
                currentVideo.pause();
                currentVideo.src = "";
                // Do not manually removeChild, let GameFace manage the lifecycle
            }
            
            // Create new video element
            currentVideo = document.createElement("video");
            currentVideo.preload = "auto";
            currentVideo.style.display = "none";
            currentVideo.muted = false; // Critical: must be false to send audio to engine
            currentVideo.setAttribute('coh-video-sync', 'off');
            
            // After creating the video element:
            currentVideo.setAttribute('coh-video-sync', 'off');  // Disable video sync, reduce timestamp checks
            currentVideo.setAttribute('coh-use-aa-geometry', 'off');  // Disable anti-aliasing geometry, improve performance

            //  Path handling (ensure .webm and no duplication)
            var src = file;
            if (src.indexOf('.webm') === -1) {
                src = src.replace(/\.(ogg|mp3|wav)$/i, '') + '.webm';
            }
            //  Ensure it's a relative path (your structure: sounds/ is at the same level as index.html)
            if (src.indexOf('ui/') === 0) {
                src = src.replace(/^ui\//, '');
            }
            if (src.indexOf('/') === 0) {
                src = src.substring(1); // Remove leading /
            }
            
            currentVideo.src = src;
            currentVideo.volume = (typeof volume === 'number') ? volume : 0.8;
            currentVideo.loop = !!loop;
            
            //  GameFace requires: must be added to DOM
            document.body.appendChild(currentVideo);
            
            // Asynchronous play + error handling
            var p = currentVideo.play();
            if (p && p.catch) {
                p.catch(function(e) {
                    console.log("[NVG] Play error: " + e.message + " | src: " + src);
                });
            }
            
            //  Auto-cleanup after playback ends (prevent memory leaks)
            currentVideo.onended = function() {
                currentVideo.pause();
                currentVideo.src = "";
                // Do not manually removeChild
            };
            
        } catch (e) {
            console.log("[NVG] playSound error: " + e.message);
        }
    };
    
    window.stopMusic = function() {
        if (currentVideo) {
            currentVideo.pause();
            currentVideo.currentTime = 0;
        }
    };
    
    // Compatibility fade-out function for original code
    window.FadeOut = function() {
        if (currentVideo) {
            var fade = setInterval(function() {
                if (currentVideo.volume > 0.01) {
                    currentVideo.volume -= 0.01;
                } else {
                    currentVideo.pause();
                    currentVideo.currentTime = 0;
                    currentVideo.volume = 0.8;
                    clearInterval(fade);
                }
            }, 100);
        }
    };
    
})();