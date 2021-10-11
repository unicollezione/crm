$(function() {
  $("#venue_city_id").select2({
    theme: 'bootstrap',
    allowClear: true,
    minimumInputLength: 3,
    containerCssClass: ':all:',
    dataType: 'json',
    ajax: {
      url: '/admin/venues/cities',
      delay: 250,
      data: function(params) {
        return { q: params.term }
      },
      processResults: function (data, params) {
        return {
          results: $.map(data, function(value, index) {
            return { id: value.id, text: value.text };
          })
        };
      }
    }
  });
});
