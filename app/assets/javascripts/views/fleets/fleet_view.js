Jeu.Views.FleetView = Backbone.View.extend({
  templates: {
    icon: JST['fleets/icon'],
    menu: JST['fleets/menu'],
  },
  
  selectFleet: function() {
    var self = this;
    
    $("#panel").html(this.templates['menu'](this.model.toJSON()));

    var form = $('#route_form');
    form.on('submit',function(){
      var newRoute = Jeu.region.get("transportRoutes").create(form.serializeObject());
      newRoute.save().done(function(){
        Jeu.region.get( 'transportRoutes' ).push( newRoute );
        self.selectFleet();
      });
    });
  },
  render: function() {
    this.el.id = "fleet_"+this.model.get("id");
    this.$el.html(this.templates['icon'](this.model.toJSON()));
  }
});
