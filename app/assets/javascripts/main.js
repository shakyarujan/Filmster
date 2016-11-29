/* global $ */
/* global id */

$(function(){
  let form = $('#movie-search');
  form.submit(function(e){
    e.preventDefault();

    $.ajax({
      url: 'https://www.omdbapi.com/?',
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
      htmlString += `<img src=${movie["Poster"] == "N/A" ? "/images/your_default_image.png" : movie["Poster"]} 
      data-id="${movie['imdbID']}" />
                     <p>${movie["Title"]}</p>
                     <p>${movie["Year"]}</p>`;
    });
  }

  container.append(htmlString);
}

$('#movies').on('click', 'img', function(e){
  e.preventDefault();
    let id = $(e.target).data('id');
    $.ajax({
      url: "https://www.omdbapi.com/?",
      data: {i: id}   
    })
    .done(function(data){
      console.log(data);
      displayMovie(data);
      
    });
});

function displayMovie(data){
  let containers = $("#info")
  let htmlStringinfo = "";

  containers.empty();
  $.each(data, function(key,value){
    htmlStringinfo += `<p>${data[key]}</p>`;
    });
  containers.append(htmlStringinfo);
}

});

