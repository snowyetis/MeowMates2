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

  // $('#user_attachment').change(function(){
  //   readURL(this, preview);
  // });
  //
  // $('#cover_attachment').change(function(){
  //   readURL(this, preview);
  // });

  $("#user_dob").datetimepicker({
    timepicker:false,
    format:'m/d/Y',
    maxDate:'0'
  });

});
