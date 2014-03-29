Jeu.Models.Zone = Backbone.Model.extend({
    defaults: {
        x: 0,
        y: 0,
        type: ""
    },
    initialize: function(){
        this.set({
            x: Math.floor(Math.random()*100),
            y: Math.floor(Math.random()*100)
        });
    },
});
