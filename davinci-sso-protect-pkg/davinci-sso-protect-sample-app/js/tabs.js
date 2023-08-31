function changeTabs(event, tabName) {

  const tabContent = document.getElementsByClassName('tab-content');
  for (let i = 0; i < tabContent.length; i++) {
    tabContent[i].style.display = 'none';
  }

  const tabButtons = document.getElementsByClassName('tab-btn');
  for (let i = 0; i < tabButtons.length; i++) {
    tabButtons[i].classList.remove('active');
  }

  document.getElementById(tabName).style.display = 'block';
  event.currentTarget.classList.add('active');

}