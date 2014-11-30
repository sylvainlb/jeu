Jeu.Models.Fleet = Backbone.Model.extend({
  toJSON: function() {
    var self = this;
    var attr = Backbone.Model.prototype.toJSON.call(this);
    attr.transportRoutes = Jeu.region.get("transportRoutes").where({fleet_id:this.id});
    
    //Check if the route is over
    if(this.get("arrival") && new Date() > new Date(this.get("arrival"))) {
      this.set("zone_id", Jeu.region.get("transportRoutes").get(this.get("current_route_id")).get("destination_id"));
      //check in 10 seconds if the fleet has left again
      setTimeout(function(){self.fetch({success: function(){
          new Jeu.Views.FleetView({el:el, model:self}).render();
        }})}, 10000);
    }
    
    if(this.get("zone_id")) {
      //Get coorindates for stationed fleet
      attr.coordX = Jeu.region.get("zones").get(this.get("zone_id")).get("coordX");
      attr.coordY = Jeu.region.get("zones").get(this.get("zone_id")).get("coordY");
      attr.state = "stationed";
      
    } else {
      //Get coorindates for moving fleet
      var progress = (new Date() - new Date(this.get("departure")))
        / (new Date(this.get("arrival")) - new Date(this.get("departure")));
      var destid = Jeu.region.get("transportRoutes").get(this.get("current_route_id")).get("destination_id");
      var departureZone = Jeu.region.get("zones").get(this.get("departure_zone_id"));
      var arrivalZone = Jeu.region.get("zones").get(destid);
      attr.coordX = (arrivalZone.get("coordX") - departureZone.get("coordX")) * progress + departureZone.get("coordX");
      attr.coordY = (arrivalZone.get("coordY") - departureZone.get("coordY")) * progress + departureZone.get("coordY");
      attr.state = "moving";
      
      //Update position in 1 second
      var el = $("#fleet_"+this.id)[0];
      setTimeout(function(){new Jeu.Views.FleetView({el:el, model:self}).render()}, 1000);
    }
    return attr;
  }
});
