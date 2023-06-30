const QnABtn = document.querySelector('.QnABtn-icon');
const section2_TalkBox = document.querySelector('.section2_TalkBox');
const QnAxBtn = document.querySelector('.QnAxBtn-icon');


QnAxBtn.classList.add('hidden');

QnABtn.addEventListener('click', () => {
  
    section2_TalkBox.classList.remove('hidden');
    QnAxBtn.classList.remove('hidden');
    QnABtn.classList.add('hidden');
});

QnAxBtn.addEventListener('click', () => {
   
    section2_TalkBox.classList.add('hidden');
    QnAxBtn.classList.add('hidden');
    QnABtn.classList.remove('hidden');
});