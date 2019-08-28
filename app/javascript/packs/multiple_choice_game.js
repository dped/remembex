window.onload = function(){
  $('#word_options').addClass('active');
};

function checkForm() {
  var inputs = document.querySelectorAll('#word_options');
  return inputs.length === 0;
}

const form = document.getElementById("insert_word_game_form");
const gameTwoSessionId = form.dataset.gameTwoSessionId;
const inputs = document.querySelectorAll('#word_options');
const punctuation = document.querySelectorAll('.game_session_background_container p')
//When loaded, add active class on the first select tag
console.log(punctuation)

// Whenever the user uses the select box
inputs.forEach((input) => {
  input.addEventListener('change', (event) => {
    const guess = event.currentTarget.value;
    const answer = event.currentTarget.dataset.answer;
    const requestBody = {
      guess: guess,
      answer: answer
    }
    if (input != inputs[inputs.length-1]) {
    let current = document.querySelector('.active');
    let next = current.nextElementSibling;

    // Make the next one active, and the current one inactive
    next.classList.add('active')
    current.classList.remove('active')
  };

    fetch(`/game_two_sessions/${gameTwoSessionId}/guess_word`, {
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
          wrapper.classList.add('right-answer-input');
          wrapper.innerHTML = answer;
          input.replaceWith(wrapper);
          console.log("correct");
        } else {
          const wrapper = document.createElement('span');
          wrapper.classList.add('wrong-answer-input');
          wrapper.innerHTML = answer;
          input.replaceWith(wrapper);
        }
        if (checkForm()) {
          fetch(`/game_two_sessions/${gameTwoSessionId}/final_score`)
          .then( response => response.json())
          .then( data => {
          let finalScore = document.querySelector("#game1_popup_window h3");
          finalScore.innerHTML = `You had ${data.finalScore} out of ${data.inputs}`;
          });
          $('#game1_popup_window').slideToggle("slow");
          $('.game1_popup_window_background').slideToggle("slow");
        }
      })
  });
});
