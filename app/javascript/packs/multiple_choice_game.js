window.onload = function(){
  $('#word_options').addClass('active');
  document.querySelector('.user-options-container').classList.remove('d-none')
};

function checkForm() {
  var inputs = document.querySelectorAll('#word_options');
  return inputs.length === 0;
}

const getNextSibling = function (elem, selector) {

  // Get the next sibling element
  var sibling = elem.nextElementSibling;

  // If the sibling matches our selector, use it
  // If not, jump to the next sibling and continue the loop
  while (sibling) {
    if (sibling.matches(selector)) return sibling;
    sibling = sibling.nextElementSibling
  }

};

const form = document.getElementById("insert_word_game_two_form");
const gameTwoSessionId = form.dataset.gameTwoSessionId;
const inputs = document.querySelectorAll('#word_options');


// const punctuations = document.querySelectorAll('.punctuation');
// console.log(punctuations)
// When loaded, add active class on the first select tag
// Find all punctuations
// Get event listener for the previous element
// when it's changed, then punctuation changes

// punctuations.forEach((punctuation) => {
//   const previousElement = punctuation.previousElementSibling;
//   previousElement.addEventListener('onChange', (event) => {
//     punctuation.classList.add('show_punctuation');
//     console.log('added punctuation')
//   })
// });

const user_options = document.querySelectorAll('.user-options');
user_options.forEach((option) => {
  option.addEventListener('click', (event) => {
    let now = document.querySelector('.active');
    let next = getNextSibling(now,'#word_options');
    if (now !== inputs[inputs.length - 1]) {
      next.classList.add('active')
      now.classList.remove('active')
      console.log('not last one')
    }
    now.nextElementSibling.classList.add('show_punctuation');
    // const showPunctuation = document.querySelectorAll('.user-options-container')
    // showPunctuation.nextElementSibling.classList.add('show_punctuation')
    now.innerHTML = option.innerHTML;
    console.log('changed');
    console.log(now);
    const guess = now.innerHTML;
    console.log(guess)
    const answer = now.dataset.answer;
    console.log(answer)
    const requestBody = {
      guess: guess,
      answer: answer
    }
    console.log("Request Body:")
    console.log(requestBody)
    const userOptionsContainer = document.querySelector('.d-none')
    if (userOptionsContainer) {

      userOptionsContainer.classList.remove('d-none')
    }
    // Make the next one active, and the now one inactive
    fetch(`/game_two_sessions/${gameTwoSessionId}/guess_word`, {
      headers: {
        'Content-Type': 'application/json',
      },
      method: "POST",
      body: JSON.stringify(requestBody)
    })
      .then( response => response.json())
      .then( data => {
        console.log("Data back from fetch request")
        console.log(data)
        if (data.success) {
          const wrapper = document.createElement('span');
          wrapper.classList.add('right-answer-input');
          wrapper.innerHTML = answer;
          now.replaceWith(wrapper);
          console.log("correct");
        } else {
          const wrapper = document.createElement('span');
          wrapper.classList.add('wrong-answer-input');
          wrapper.innerHTML = answer;
          now.replaceWith(wrapper);
        }
        const optionsContainer = document.getElementById("options-container");
        let counter = 1;
        next.dataset.options.split(";").forEach((optionWord) => {
          document.getElementById(`option-${counter}`).innerHTML = optionWord;
          counter += 1;
        })
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
  })
});

// Whenever the user uses the select box
// inputs.forEach((input) => {
//   input.addEventListener('change', (event) => {
//     console.log('changed');
//     const guess = event.currentTarget.value;
//     const answer = event.currentTarget.dataset.answer;
//     const requestBody = {
//       guess: guess,
//       answer: answer
//     }
//     if (input != inputs[inputs.length-1]) {
//     let current = document.querySelector('.active');
//     let next = getNextSibling(current,'#word_options');

//     // Make the next one active, and the current one inactive
//     next.classList.add('active')
//     current.classList.remove('active')
//   };

//     fetch(`/game_two_sessions/${gameTwoSessionId}/guess_word`, {
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       method: "POST",
//       body: JSON.stringify(requestBody)
//     })
//       .then( response => response.json())
//       .then( data => {
//         if (data.success) {
//           const wrapper = document.createElement('span');
//           wrapper.classList.add('right-answer-input');
//           wrapper.innerHTML = answer;
//           input.replaceWith(wrapper);
//           console.log("correct");
//         } else {
//           const wrapper = document.createElement('span');
//           wrapper.classList.add('wrong-answer-input');
//           wrapper.innerHTML = answer;
//           input.replaceWith(wrapper);
//         }
//         if (checkForm()) {
//           fetch(`/game_two_sessions/${gameTwoSessionId}/final_score`)
//           .then( response => response.json())
//           .then( data => {
//           let finalScore = document.querySelector("#game1_popup_window h3");
//           finalScore.innerHTML = `You had ${data.finalScore} out of ${data.inputs}`;
//           });
//           $('#game1_popup_window').slideToggle("slow");
//           $('.game1_popup_window_background').slideToggle("slow");
//         }
//       })
//   });
// });
