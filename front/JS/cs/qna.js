const QnABtn = document.querySelector('.QnABtn-icon');
const section2_TalkBox = document.querySelector('.section2_TalkBox');
const QnAxBtn = document.querySelector('.QnAxBtn-icon');

// Initially, we want the 'x' button to be hidden
QnAxBtn.classList.add('hidden');

QnABtn.addEventListener('click', () => {
    // When the Q&A button is clicked, show the QnA container and the 'x' button, hide the Q&A button
    section2_TalkBox.classList.remove('hidden');
    QnAxBtn.classList.remove('hidden');
    QnABtn.classList.add('hidden');
});

QnAxBtn.addEventListener('click', () => {
    // When the 'x' button is clicked, hide the QnA container and the 'x' button, show the Q&A button
    section2_TalkBox.classList.add('hidden');
    QnAxBtn.classList.add('hidden');
    QnABtn.classList.remove('hidden');
});