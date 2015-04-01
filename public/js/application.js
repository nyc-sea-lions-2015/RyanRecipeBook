$(document).ready(function() {
  $('#new-recipe').on('submit', '#title-form', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.toggle(false);
    $('#instruction-button').toggle(true);

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

    $.ajax({
      type: 'POST',
      url: $target.attr("action"),
      data: $target.serialize()
    }).done(function(response){
      $('#ingredient-form').append(response);
    });
  });

});
