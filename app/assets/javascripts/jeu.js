window.Jeu = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    jQuery(document).on('ready',function(){
      this.region = new this.Models.Region();
      this.region.set({zones: new this.Collections.Zones()});
      this.region.get("zones").fetch();
      this.region.get("zones").each(function(zone){zone.draw()});
      
    });
  }
};

$(document).ready(function(){
  Jeu.initialize();
});

//<% _.each(zones, function(zone) { %>
//<%= renderZone({x: zone.get("x"), y: zone.get("y")}) %>
//<% } %>
