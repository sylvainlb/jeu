jQuery.fn.serializeObject = function(){
  var param = {};
  jQuery.each(this.serializeArray(),function(k,v){
    param[v.name] = v.value;
  });
  return param;
};
document.parseCookie = function() {
  var deserialize = function(obj, elt) {
    var data = elt.split("=");
    obj[data[0].trim()] = data[1].trim();
    return obj
  }
  return document.cookie.split(";").reduce(deserialize, {})
}

window.Jeu = {
  base_url: '/regions/'+document.parseCookie()["region_id"],
  
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  renderMap: function() {
    $("#map").empty();
    $('<canvas/>', {id: 'canvas',}).appendTo('#map');
    Jeu.ctx = document.getElementById("canvas").getContext("2d");
    Jeu.ctx.canvas.height=1000;
    Jeu.ctx.canvas.width=1000;
    new Jeu.Views.ZonesIndex({
      collection: Jeu.region.get("zones"), 
      el: $("#map")
    }).render();
    new Jeu.Views.FleetsIndex({
      collection: Jeu.region.get("fleets"), 
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
        Jeu.renderMap();
        Backbone.history.start();
    });
  }
};

$(document).ready(function(){
    Jeu.initialize();
});
