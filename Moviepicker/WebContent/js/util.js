// util.js
function validateEmail(email) {
  var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
  return regex.test(email);
}
function message (id, type, msg) {
  var result = '';
  switch (type) {
    case 'warn':
      result = '<span class="warn-msg"><i class="fas fa-exclamation-triangle"></i>';
      break;
    case 'correct':
      result = '<span class="correct-msg"><i class="fas fa-check"></i>';
      break;
    case 'info':
      result = '<span class="info-msg"><i class="fas fa-info-circle"></i>';
      break;
    case 'alert':
      result = '<span class="alert-msg"><i class="fas fa-exclamation-circle"></i>';
      break;
    default:
      result = '<span class="alert-msg">';
  }
  result += ` ${msg}</span>`;
  $(id).html(result);
}