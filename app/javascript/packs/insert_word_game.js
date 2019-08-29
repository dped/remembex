function checkForm() {
  var inputs = document.querySelectorAll('.insert_word_input');
  return inputs.length === 0;
}

const form = document.getElementById("insert_word_game_form");
const gameSessionId = form.dataset.gameSessionId;
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
          fetch(`/game_sessions/${gameSessionId}/final_score`)
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


$("#game_one_retry_button_popup").click(function() {
  $('#game1_popup_window').css('display', 'none');
  $('.game1_popup_window_background').css('display', 'none');
})















