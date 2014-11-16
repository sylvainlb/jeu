Jeu.Views.FleetView = Backbone.View.extend({
  templates: {
    icon: JST['fleets/icon'],
    menu: JST['fleets/menu'],
  },
  
  selectFleet: function() {
    var self = this;
    
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
    
    //Draw routes
    if(this.model.get("zone_id")) {
      var origin = Jeu.region.get("zones").get(this.model.get("zone_id"));
    } else {
      var origin = Jeu.region.get("zones").get(this.model.get("departure_zone_id"));
    }
    Jeu.ctx.clearRect(0, 0, 1000, 1000)
    _.each(Jeu.region.get("transportRoutes").where({fleet_id:this.model.get("id")}), function drawRoute(route){
      var destination = Jeu.region.get("zones").get(route.get("destination_id"));
      Jeu.ctx.beginPath();
      Jeu.ctx.moveTo(origin.get("coordX"), origin.get("coordY"));
      Jeu.ctx.lineTo(destination.get("coordX"), destination.get("coordY"));
      Jeu.ctx.stroke();
      origin = destination;
    });

    //Event for route creation
    var form = $('#route_form');
    form.on('submit',function(){
      var newRoute = Jeu.region.get("transportRoutes").create(form.serializeObject(), {success: function(){
        Jeu.region.get( 'transportRoutes' ).push( newRoute );
        self.selectFleet();
      }});
    });
  },
  render: function() {
    this.el.id = "fleet_"+this.model.get("id");
    this.$el.html(this.templates['icon'](this.model.toJSON()));
  }
});
