var readURL = function(input, preview) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $(preview).parent().removeClass('hidden');
      $(preview).attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
};

$(document).ready(function(){

  $('#animal_attachment').change(function(){
    readURL(this, preview);
  });

  $('.input-mentionable').atwho({
    at: '@',
    data: $('#mentionable-data').data('content'),
    insertTpl: '<a href="/users/${id}">${name}</a>',
    displayTpl: '<li data-id="${id}"><span>${name}</span></li>',
    limit: 15
  });

  $('.animal_form').submit(function() {
    $('#animal_content').val($('#animal-content').html());
    $('#animal-content').html('');
  });

  var self = $("#masonry");
  self.imagesLoaded(function () {
    self.masonry({
        gutterWidth: 15,
        isAnimated: true,
        itemSelector: ".gallery-container"
    });
  });

  var filter = $(this).attr("data-filter");

  self.masonryFilter({
    filter: function () {
      if (!filter) return true;
      return $(this).attr("data-filter") == filter;
    }
  });
});
