window.Jeu = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.region = new this.Models.Region();
    this.region.set({zones: new this.Collections.Zones()});
    this.region.get("zones").fetch({
      success:function(){
        Jeu.region.get("zones").each(function(zone){zone.set({view: new Jeu.Views.ZonesIndex({el: $("#map"), model:zone})});zone.get("view").render()});
      }
    });
  }
};

$(document).ready(function(){
  Jeu.initialize();
});

//<% _.each(zones, function(zone) { %>
//<%= renderZone({x: zone.get("x"), y: zone.get("y")}) %>
//<% } %>
