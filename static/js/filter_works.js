function filterCards(checkboxElem) {
    elms = document.getElementsByClassName('card_' + checkboxElem.name);
    if (checkboxElem.checked) {
        for (let i = 0; i < elms.length; i++) {
            elms[i].style.display = 'inline';
        }
    } else {
        for (let i = 0; i < elms.length; i++) {
            elms[i].style.display = 'none';
        }
    }
}

