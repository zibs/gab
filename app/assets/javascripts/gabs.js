var sendFile = function(file, toSummernote) {
  console.log("in the correct function");
  var data;
  data = new FormData();
  data.append('image[image]', file);
  return $.ajax({
    data: data,
    type: 'POST',
    url: '/images',
    cache: false,
    contentType: false,
    processData: false,
    success: function(data) {
      console.log('file uploading...');
      return toSummernote.summernote("insertImage", data.url);
    }
  });
};

$(document).on('page:change', function(event) {
  $('#gab_body').each(function() {
    return $(this).summernote({
      height: 300,
      codemirror: {
        lineWrapping: true,
        lineNumbers: true,
        tabSize: 2,
        theme: 'solarized'
      },
      callbacks: {
        onImageUpload: function(files) {
          return sendFile(files[0], $(this));
        }
      }
    });
  });
});
