document.addEventListener("DOMContentLoaded", function () {
    function dismissFlashMessages() {
      const flashMessages = document.querySelectorAll('[data-dismiss="flash"]');
      
      flashMessages.forEach((message) => {
        setTimeout(() => {
          message.style.display = 'none';
        }, 2000);
      });
    }
    dismissFlashMessages();
  });
  