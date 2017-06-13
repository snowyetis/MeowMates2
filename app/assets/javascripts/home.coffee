readURL = (input, preview) ->
  if input.files and input.files[0]
    reader = new FileReader

    reader.onload = (e) ->
      $(preview).parent().removeClass 'hidden'
      $(preview).attr 'src', e.target.result
      return

    reader.readAsDataURL input.files[0]
  return

$(document).ready ->
  preview = '#img-preview > img'
  $('#post-attachment').click ->
    $('#post_attachment').click()
    return
  $('#post_attachment').change ->
    readURL this, preview
    return
  $('#animal_dob').datetimepicker
    timepicker: false
    format: 'm/d/Y'
    maxDate: '0'
  return
