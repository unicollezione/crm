import "select2";

$(document).ready(function () {
  $(".single-select-fabrics").select2({
    theme: "bootstrap-5"
  });
  $(".single-select-products").select2({
    theme: "bootstrap-5"
  });
  document.documentElement.addEventListener("turbo:frame-load", event => {
    console.debug("turbo:frame-load event:", event)
  })
});

