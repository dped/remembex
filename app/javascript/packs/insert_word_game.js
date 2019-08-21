const form = document.getElementById("insert_word_game_form");
const gameSessionId = form.dataset.gameSessionId;
console.log(gameSessionId);
const inputs = document.querySelectorAll('input');
inputs.forEach((input) => {
  input.addEventListener('blur', (event) => {
    const guess = event.currentTarget.value;
    const answer = event.currentTarget.dataset.answer;
    const requestBody = {
      guess: guess,
      answer: answer
    }
    fetch(`/game_sessions/${gameSessionId}/guess_word`, {
      headers: {
        'Content-Type': 'application/json',
      },
      method: "POST",
      body: JSON.stringify(requestBody)
    })
      .then( response => response.json())
      .then( data => {
        if (data.success) {
          const wrapper = document.createElement('span');
          wrapper.classList.add('right-answer-input')
          wrapper.innerHTML = answer
          input.replaceWith(wrapper);
        } else {
          input.classList.add("wrong-answer-input");
        }
      })
  });
});





















