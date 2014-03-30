Jeu.Views.FleetView = Backbone.View.extend({
  templates: {
    menu: JST['fleets/menu'],
  },
  
  selectFleet: function() {
    var self = this;
    
    $("#panel").html(this.templates['menu'](this.model.toJSON()));

    var form = $('#route_form');
    form.on('submit',function(){
      var newRoute = new Jeu.Models.TransportRoute(form.serializeObject());
      newRoute.save().done(function(){
        Jeu.region.get( 'transportRoutes' ).push( newRoute );
        self.selectFleet();
      });
    });
  },
});
