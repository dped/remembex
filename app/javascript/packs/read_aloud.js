console.log("read aloud file")

const button = document.getElementById('voice-btn');

const text = button.dataset.content;

button.addEventListener('click', () => {
  if (button.dataset.state === 'initial') {
    button.dataset.state = 'playing';
    responsiveVoice.speak(text);
    button.innerHTML = '';
    button.innerHTML = '<i class="fas fa-pause"></i>';
  } else if (button.dataset.state === 'paused') {
    button.dataset.state = 'playing';
    responsiveVoice.resume(text);
    button.innerHTML = '';
    button.innerHTML = '<i class="fas fa-pause"></i>';
  } else {
    button.dataset.state = 'paused';
    responsiveVoice.pause(text);
    button.innerHTML = '';
    button.innerHTML = '<i class="fas fa-play"></i>';
  }
})
