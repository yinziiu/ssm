/* global M */
(function(window) {

  function MouseTip(options) {
    this.context = 'body';
    this.selector = null;

    M.mix(this, options);

    if(!this.selector.length) {
      M.error('please specify the selector!');
    }

    this.init();
  }

  var isIE = navigator.userAgent.toLowerCase().match(/msie [\d.]+/),
      ieVersion = isIE ? parseFloat(isIE[0].substr(5)) : false;

  M.mix(MouseTip.prototype, {

    init: function() {

      // delegate mouseevent very slow in IE (  ._.)
      if(ieVersion && ieVersion <= 9) {
        $(this.selector).mouseenter(M.bind(this.mouseenter, this));
        $(this.selector).mousemove(M.bind(this.mousemove, this));
        $(this.selector).mouseleave(M.bind(this.mouseleave, this));
      } else {
        $(this.context).on('mouseenter', this.selector, M.bind(this.mouseenter, this));
        $(this.context).on('mousemove', this.selector, M.bind(this.mousemove, this));
        $(this.context).on('mouseleave', this.selector, M.bind(this.mouseleave, this));
      }
    },

    mouseenter: function(ev) {
      var target = $(ev.currentTarget);
      if(!target.data('tip')) {
        target.data('tip', this.createTip(target));
      } else {
        target.data('tip', this.updateTip(target));
      }
      if(target.data('tip') && target.data('tip')[0]) {
        target.data('tip').fadeIn(100);
        target.data('mouseenter', true);
      }
    },

    mousemove: function(ev) {
      var target = $(ev.currentTarget);
      if(target.data('mouseenter')) {
        target.data('tip').css({
          'left': ev.pageX + 10,
          'top': ev.pageY + 10
        });
      }
    },

    mouseleave: function(ev) {
      var target = $(ev.currentTarget);
      if(target.data('tip') && target.data('tip')[0]) {
        target.data('tip').fadeOut(100);
        target.data('mouseenter', false);
        this.recoverTip(target);
      }
    },

    createTip: $.noop,
    updateTip: function(target) {
      return target.data('tip');
    },
    recoverTip: $.noop
  });

  M.define('/js/MouseTip', function(require, exports, module) {
    module.exports = MouseTip;
  });

  window.MouseTip = MouseTip;

} (window));
