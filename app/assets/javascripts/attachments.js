document.addEventListener('DOMContentLoaded', function(){
  var uploadButton = document.querySelector('.btn-default');

  uploadButton.addEventListener('click', function(){

    $.ajax({
      url: 'entries/image,'
      method: 'POST',
      data: {image: img.src},
      dataType: 'html'
    })
  })

})
