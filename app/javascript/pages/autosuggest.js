// select search bar with id #search and ul-element with id #news
scrivito.on('load', () => {
  const search = document.getElementById('search');
  const news = document.getElementById('news');
  const path = news.dataset.path
  // <%# extract query from search %>
  // <%# fetch suggestions from backend %>
  search.addEventListener('keyup', () => {
    response = fetch(`${path}?q=${search.value}`)
    .then((response) => response.json())
    .then((suggestions) => {
      // <%# clear ul-element %>
      news.innerHTML = '';
      // <%# iterate over suggestions %>
      suggestions.forEach((suggestion) => {
        // <%# create li-element %>
        const li = document.createElement('li');
        // <%# add suggestion to li-element %>
        li.innerHTML = suggestion;
        // <%# append li-element to ul-element %>
        news.appendChild(li);
      });
    });
  });
});