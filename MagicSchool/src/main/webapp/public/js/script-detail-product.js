const chooseInfo = document.getElementById('more-infor');
const choose = document.getElementsByClassName('choose');
const paragraph = document.getElementsByClassName('paragraph');


function styleItem(a, b) {
    a.style.cssText = 'color:black ; border-bottom: 2px solid hotpink ;font-weight:700; padding-bottom: 6px';
    b.style.cssText = 'color:gray ; border-bottom: none';

}

function displayPrph(e, f) {
    e.style.display = 'block';
    f.style.display = 'none';

}

chooseInfo.addEventListener('click', event => {

    if (event.target === choose[0]) {

        styleItem(choose[0], choose[1])
        displayPrph(paragraph[0], paragraph[1])
    } else if (event.target === choose[1]) {

        styleItem(choose[1], choose[0])
        displayPrph(paragraph[1], paragraph[0])
    }

});