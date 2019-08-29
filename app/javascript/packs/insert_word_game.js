function wrapUp() {
  console.log("Wrapping up");
  fetch(`/game_sessions/${gameSessionId}/final_score`)
  .then( response => response.json())
  .then( data => {
  let finalScore = document.querySelector("#game1_popup_window h3");
  finalScore.innerHTML = `You had ${data.finalScore} out of ${data.inputs}`;
  });
  $('#game1_popup_window').slideToggle("slow");
  $('.game1_popup_window_background').slideToggle("slow");
}

function changeInput(input, gameSessionId) {
    const guess = input.value;
    const answer = input.dataset.answer;
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
    })

}

const form = document.getElementById("insert_word_game_form");
form.addEventListener("submit", function(event){
  event.preventDefault()
});

const gameSessionId = form.dataset.gameSessionId;
const inputs = document.querySelectorAll('input');

inputs.forEach((input) => {
  input.onkeypress = function(e){
    const wordNumber = parseInt(e.currentTarget.id.match(/\d+/)[0], 10);
    if (e.keyCode === 13) {
      changeInput(input, gameSessionId);
      const nextInput = document.getElementById("word" + (wordNumber + 1))
      if (nextInput) {
        nextInput.focus();
      } else {
        wrapUp();
      }
    }
  }
});


$("#game_one_retry_button_popup").click(function() {
  $('#game1_popup_window').css('display', 'none');
  $('.game1_popup_window_background').css('display', 'none');
})
