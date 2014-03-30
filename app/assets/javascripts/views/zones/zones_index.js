Jeu.Views.ZonesIndex = Backbone.View.extend({
  initialize: function(){
    _.bindAll(this, "renderZone");
    _.bindAll(this, "selectZone");
  },
  renderZone: function(model){
    var zoneView = new Jeu.Views.ZoneView({model: model});
    zoneView.render();
    $(this.el).append(zoneView.el);
  },
  render: function(){
    this.collection.each(this.renderZone);
  },
  selectZone: function(id){
    console.log(this);
    var zoneView = new Jeu.Views.ZoneView({model: this.collection.get({id:id})});
    zoneView.selectZone();
  }
});
