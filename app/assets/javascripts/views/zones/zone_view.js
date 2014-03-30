Jeu.Views.ZoneView = Backbone.View.extend({
  templates: {
    icon: JST['zones/icon'],
    menu: JST['zones/menu'],
  },
  selectZone: function() {
    
    $("#panel").html(this.templates['menu'](this.model.toJSON()));

    var form = $('#fleet_form');

    form.on('submit',function(){
      var param = form.serializeObject();
      var newFleet;
      (newFleet = new Jeu.Models.Fleet(param)).save();

      //var newFleet = Jeu.Models.Fleet(param);
      //newFleet.save();

      //Jeu.region.get('fleets').push(param);
    });

    $('.zone.active').removeClass('active');
    this.$el.find('.zone').addClass('active');
  },
  render: function() {
    this.el.id = "zone_"+this.model.get("id");
    this.$el.html(this.templates['icon'](this.model.toJSON()));
  }
});
