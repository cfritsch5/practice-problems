import questions from './questions.js';

document.addEventListener('DOMContentLoaded', () => {
  let questionIndex = 0;
  const nextButton = document.getElementById('next');
  const questionElement = document.getElementById('question');
  const answerButton = document.getElementById('revealAnswer');
  const answerElement = document.getElementById('answer');
  const text = document.getElementById('input');

  nextButton.onclick = ()=>{
    answerElement.innerHTML = "";
    text.value = "";
    questionElement.innerHTML = questions[++questionIndex].question;
  };

  answerButton.onclick = ()=>{
    answerElement.innerHTML = questions[questionIndex].answer;
  };

});
