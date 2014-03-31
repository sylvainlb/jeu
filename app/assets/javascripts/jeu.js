jQuery.fn.serializeObject = function(){
  var param = {};
  jQuery.each(this.serializeArray(),function(k,v){
    param[v.name] = v.value;
  });
  return param;
};

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
    var transportRoutes = new this.Collections.TransportRoutes();
    var fleets = new this.Collections.Fleets();
    var resourceTypes = new this.Collections.ResourceTypes();
    
    this.region.set({
      zones: zones,
      fleets: fleets,
      transportRoutes: transportRoutes,
      resourceTypes: resourceTypes
    });
    
    new this.Routers.Zones;
    new this.Routers.Fleets;

    $.when(zones.fetch(), fleets.fetch(), transportRoutes.fetch(), resourceTypes.fetch()).done(function() {
        Jeu.drawZones();
        Backbone.history.start();
    });
  }
};

$(document).ready(function(){
    Jeu.initialize();
});
