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
