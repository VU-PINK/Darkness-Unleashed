const audio = document.createElement("audio");
let timeoutVariable;
let fadeOutTime = 2;

function playSound(file, volume, loop) {
  audio.src = file;
  audio.volume = volume;
  audio.loop = loop;
  audio.controls = false;

  audio.play();

  document.body.appendChild(audio);
}

function stopMusic() {
  audio.pause();
}

function FadeOut()
{
  timeoutVariable = setInterval(fadeAudioOut, 100);
}

function fadeAudioOut()
{
  if(audio.volume > 0.01)
  {
    audio.volume = audio.volume - 0.01;
  }
  else
  {
    audio.pause();
    audio.currentTime = 0;
    clearInterval(timeoutVariable);
  }
}
