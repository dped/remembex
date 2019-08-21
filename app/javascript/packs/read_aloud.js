console.log("read aloud file")

const button = document.getElementById('voice-btn');

// const text = `${@@text_paragraph.content}`

const text = "This is a test"
console.log(text)

button.addEventListener('click', () => {
  if (!button.classList.contains('playing')) {
    button.classList.add('playing');
    responsiveVoice.speak(text);
  }
  if (button.classList.contains('paused')) {
    button.classList.toggle('paused');
    responsiveVoice.resume(text);
  } else {
    button.classList.toggle('paused');
    responsiveVoice.pause(text);
  }
})
