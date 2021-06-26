// //Query All input fields
var form_fields = document.getElementsByTagName('input')

for (var field in form_fields) {
    if (form_fields[field].type == 'file') {
        break
    } else {
        form_fields[field].className += ' form-control'
    }
}