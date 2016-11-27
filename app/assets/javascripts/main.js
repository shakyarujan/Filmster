/* global $ */

$(function(){
  let form = $('#movie-search');
  form.submit(function(e){
    e.preventDefault();

    $.ajax({
      url: 'http://www.omdbapi.com/?',
      data: form.serialize()
    })
    .done(function(data){
      displayMovies(data);
    });
  });

 function displayMovies(data){
  let container = $("#movies")
  let htmlString = "";

  container.empty();

  if (data["Response"] == "False") {
    htmlString = `<div class="alert alert-danger text-center" role="alert">${data["Error"]}</div>`
  } 
  else {

    data["Search"].forEach(function(movie){
      htmlString += `<img src=${movie["Poster"] == "N/A" ? "/images/your_default_image.png" : movie["Poster"]} />
                     <p>${movie["Title"]}</p>
                     <p>${movie["Year"]}</p>`;
    });
  }

  container.append(htmlString);
}
});