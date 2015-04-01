$(document).ready(function() {
  $('#finished').toggle(false);
  $('#new-recipe').on('submit', '#title-form', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.toggle(false);

    $.ajax({
      type: 'POST',
      url: $target.attr("action"),
      data: $target.serialize()
    }).done(function(response){
      $('#ingredient-form').append(response);
    });
  });

  $('#new-recipe').on('submit', '#recipe-ingredient-form', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $('#add-ingredient-button').toggle(false);
    $('#finished').toggle(true);

    $.ajax({
      type: 'POST',
      url: $target.attr("action"),
      data: $target.serialize()
    }).done(function(response){
      $('#ingredient-form').append(response);
    });
  });

  $('#create-ingredient-form').on('click', '#new-ingredient-link', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.toggle(false);

    $.ajax({
      type: 'get',
      url: $target.attr("href"),
      data: $target.serialize()
    }).done(function(response){
      $('#create-ingredient-form').append(response);
    });
  });

$('#new-recipe').on('submit', '#submit-ingredient', function(event){
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: 'POST',
      url: $target.attr("action"),
      data: $target.serialize()
    }).done(function(response){
      $('#create-ingredient-form').append(response);
      $target[0].reset();
    });
  });

});







