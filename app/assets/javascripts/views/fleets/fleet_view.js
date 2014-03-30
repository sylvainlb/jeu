Jeu.Views.FleetView = Backbone.View.extend({
  templates: {
    menu: JST['fleets/menu'],
  },
  
  selectFleet: function() {
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
  },
});
