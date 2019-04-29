function onPoemLoad(poemDto) {
    const poemTitleSpanEl = document.getElementById('poem-title');
    const poemContentSpanEl = document.getElementById('poem-content');

    poemTitleSpanEl.textContent = poemDto.poem.title;
    poemContentSpanEl.textContent = poemDto.poem.content;
}

function onPoemResponse() {
    if (this.status === OK) {
        clearMessages();
        showContents(['poem-content', 'poem-words', 'back-to-profile-content', 'logout-content']);
        onPoemLoad(JSON.parse(this.responseText));
    } else {
        onOtherResponse(poemsContentDivEl, this);
    }
}

function onWordCountButtonClick() {
    const poemText = document.getElementById('poem-content').textContent.toLowerCase();
    const searchPhrase = document.getElementById('word-count-search').value.toLowerCase();
    const count = (poemText.match(new RegExp(searchPhrase, 'g')) || []).length;
    alert('Words counted in the poem: ' + count);
}
