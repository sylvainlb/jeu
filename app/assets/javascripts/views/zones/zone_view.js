Jeu.Views.ZoneView = Backbone.View.extend({
  templates: {
    icon: JST['zones/icon'],
    menu: JST['zones/menu'],
  },
  selectZone: function() {
    
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
    var self = this;
    var form = $('#fleet_form');

    form.on('submit',function(){
      var param = form.serializeObject();

      var newFleet = new Jeu.Models.Fleet(param);
      newFleet.save();

      Jeu.region.get('fleets').push(newFleet);
      self.selectZone();
    });

    $('.zone.active').removeClass('active');
    this.$el.find('.zone').addClass('active');
  },
  render: function() {
    this.el.id = "zone_"+this.model.get("id");
    this.$el.html(this.templates['icon'](this.model.toJSON()));
  }
});
