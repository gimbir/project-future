var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    var img = new Image();
    img.src = URL.createObjectURL(event.target.files[0]);
    img.onload = function() {

        var maxWidth = 500;
        var maxHeight = 400;
        var ratio = 0;
        var width = img.width;
        var height = img.height;


        if (width > maxWidth && width > height) {
            ratio = width / height;
            output.height = maxWidth / ratio;
            output.width = maxWidth;
        } else if (height > maxHeight && height > width) {
            ratio = height / width;
            output.width = maxHeight / ratio;
            output.height = maxHeight;
        } else {
            output.width = 250;
            output.height = 250;
        }
        URL.revokeObjectURL(output.src); // free memory
    }
};