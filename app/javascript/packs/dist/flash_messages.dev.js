"use strict";

document.addEventListener("DOMContentLoaded", function () {
  function dismissFlashMessages() {
    var flashMessages = document.querySelectorAll('[data-dismiss="flash"]');
    flashMessages.forEach(function (message) {
      setTimeout(function () {
        message.style.display = 'none';
      }, 2000);
    });
  }

  dismissFlashMessages();
});