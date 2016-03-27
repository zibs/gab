// SUMMERNOTE + Image Uploading with SummerNote
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
      return toSummernote.summernote("insertImage", data.url);
    }
  });
};

$(document).on('page:change', function(event) {
  $('#gab_body').each(function() {
    return $(this).summernote({
      height: 400,
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

// ZeroClipboard

  $(document).ready(function() {
    var clip = new ZeroClipboard($("#d_clip_button"));
    var clipword = new ZeroClipboard($("#b_clip_button"));
  });
  $("#clear-test").on("click", function(){
    $("#copy_text").val("Copy me!");
    $("#testarea").val("");
  });
