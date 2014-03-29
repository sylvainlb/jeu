window.Jeu = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
  console.log('toto');
    this.region = new this.Models.Region();
    this.region.set({zones: new this.Collections.Zones()});
    this.region.get("zones").fetch({
      success:function(){
        Jeu.region.get("zones").each(function(zone){zone.draw()});
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
