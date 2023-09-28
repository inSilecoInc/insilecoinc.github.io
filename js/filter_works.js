var project_tags = [];
document.getElementById("projects_checkboxes")
    .querySelectorAll("input")
    .forEach(elm => project_tags.push(elm.name));

function filterProjectCards(slc) {
    elms = document.getElementsByClassName('project_card');

    for (let i = 0; i < elms.length; i++) {
        all_cls = elms[i].className.split(' ');
        k = 0;
        for (let j = 0; j < slc.length; j++) {
            cls = 'project_card_' + slc[j]
            if (all_cls.includes(cls)) {
                k++;
            }
        }
        if (k) {
            elms[i].parentElement.style.display = 'inline';
        } else {
            elms[i].parentElement.style.display = 'none';
        }
    }
}

function getProjectTagsChecked() {
    var selected_project_tags = [];
    elms = document.getElementById("projects_checkboxes")
        .querySelectorAll("input");
    for (let i = 0; i < elms.length; i++) {
        if (elms[i].checked) {
            selected_project_tags.push(elms[i].name)
        }
    }
    return selected_project_tags;
}

filterProjectCards(getProjectTagsChecked());
