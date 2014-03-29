Jeu.Models.Zone = Backbone.Model.extend({
  defaults: {
      coordX: 0,
      coordY: 0,
      type: ""
  },
  initialize: function(){},
  draw: function(){
    var div = $("<div>");
    div.addClass('zone');
    div.css({
      top:  this.get('coordY'),
      left: this.get('coordX')
    });
    $('body').append(div);
  }
});
