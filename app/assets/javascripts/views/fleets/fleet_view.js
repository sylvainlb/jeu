Jeu.Views.FleetView = Backbone.View.extend({
  templates: {
    menu: JST['fleets/menu'],
  },
  
  selectFleet: function() {
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
    var form = $('#route_form');
    form.on('submit',function(){
      (new Jeu.Models.TransportRoute(form.serializeObject())).save();
    });
  },
});
