window.Jeu = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  drawZones: function() {
    new Jeu.Views.ZonesIndex({
      collection: Jeu.region.get("zones"), 
      el: $("#map")
    }).render();
  },
  
  initialize: function() {
    this.region = new this.Models.Region();
    
    var zones = new this.Collections.Zones();
    var routes = new this.Collections.Routes();
    var fleets = new this.Collections.Fleets();
    
    zones.fetch({success: this.drawZones});
    fleets.fetch();
    routes.fetch();
    
    this.region.set({
      zones: zones,
      fleets: fleets,
      routes: routes
    });
    
    new this.Routers.Zones;
    new this.Routers.Fleets;

    $.when(zones.fetch(),fleets.fetch(),routes.fetch()).done(function() {
        Jeu.drawZones();
        Backbone.history.start();
    });
  }
};

$(document).ready(function(){
    Jeu.initialize();
});
