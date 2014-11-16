Jeu.Views.FleetView = Backbone.View.extend({
  templates: {
    icon: JST['fleets/icon'],
    menu: JST['fleets/menu'],
  },
  
  selectFleet: function() {
    var self = this;
    
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
    
    var origin = Jeu.region.get("zones").get(this.model.get("zone_id"));
    //Draw routes
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

//function updatef() {
//  f=Jeu.region.get("fleets").get(11);
//  t=Jeu.region.get("transportRoutes").where({fleet_id:11})[0];
//  f.set("departure", "2014-11-04T17:55:00");
//  f.set("arrival", "2014-11-04T18:05:00");
//  f.set("current_route_id", t.id);

//  progress = (new Date() - new Date(f.get("departure"))) / (new Date(f.get("arrival")) - new Date(f.get("departure")));
//  departureZone = Jeu.region.get("zones").get(t.get("origin_id"));
//  arrivalZone = Jeu.region.get("zones").get(t.get("destination_id"));
//  fleetX = (arrivalZone.get("coordX") - departureZone.get("coordX")) * progress + departureZone.get("coordX");
//  fleetY = (arrivalZone.get("coordY") - departureZone.get("coordY")) * progress + departureZone.get("coordY");

//  fleet_11.firstElementChild.firstElementChild.style.top = fleetY+"px";
//  fleet_11.firstElementChild.firstElementChild.style.left = fleetX+"px";
//}
//setInterval(updatef, 100)

//var c = document.getElementById("canv");
//var ctx = c.getContext("2d");
//ctx.canvas.height=1000;
//ctx.canvas.width=1000;
//ctx.beginPath();
//ctx.moveTo(zone1.get("coordX"), zone1.get("coordY"))
//ctx.lineTo(zone2.get("coordX"), zone2.get("coordY"))
//ctx.stroke()

//#maps {
//  position: absolute;
//  z-index: 0;
//}
//#canvas {
//  position: absolute;
//  z-index: 1;
//}
