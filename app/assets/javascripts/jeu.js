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
        var fleets = new this.Collections.Fleets();
        
        this.region.set({
            zones: zones,
            fleets: fleets
        });

        $.when(zones.fetch(),fleets.fetch()).done(function() {
            Jeu.drawZones();
            Backbone.history.start();
        });

        
        
        new this.Routers.Zones;
    }
};

$(document).ready(function(){
    Jeu.initialize();
});
