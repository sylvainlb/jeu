Jeu.Views.ZoneView = Backbone.View.extend({
  templates: {
    icon: JST['zones/icon'],
    menu: JST['zones/menu'],
  },
  selectZone: function() {
    var self = this;
    self.model.fetch({success: function(){
      $("#panel").html( self.templates['menu'](self.model.toJSON()) );

      var form = $('#fleet_form');
      form.on('submit', function(){
        var newFleet = Jeu.region.get("fleets").create( form.serializeObject(), {success: function() {
          Jeu.region.get( 'fleets' ).push( newFleet );
          self.selectZone();
        }, error: function() {alert('erreur !');}});
      });

      $('.zone.active').removeClass('active');
      self.$el.find('.zone').addClass('active');
    }});
  },
  render: function() {
    this.el.id = "zone_"+this.model.get("id");
    this.$el.html(this.templates['icon'](this.model.toJSON()));
  }
});
