/**
 * 幻灯播放插件 by chaojidan
 * DOM 结构必须依照下列格式：
 * <div class="box">
 *
 	  <ul>
	    <li>幻灯1 html</li>
        <li>幻灯2 html</li>
	  </ul>
      <!-- 缩略图，可省略 -->
	  <ol class="thumb">
	    <li></li>
        <li></li>
	  </ol>
      <!-- 上一张，下一张，可省略 -->
      <div class="prev"></div>
      <div class="next"></div>
	</div>

   使用方法：
    $('#slide_box').mfwSlide({
            width : 690,   //幻灯图片宽度
            height: 345,  //幻灯图片高度
            speed : 300,  //滚动速度
            img_box : '.big',  //幻灯图片容器
            item : 'li', //幻灯单个元素
            thumb_box : '.thumb',  //缩略图，没有请置空
            thumb_item : 'li', //缩略图单个元素
            prev_btn : '.prev',   //前一张，没有请置空
            next_btn : '.next',   //下一张，没有请置空
            thumb_focus_class : 'on',  // 当前正在显示的幻灯对应的缩略图的class
            auto_play : true,  // 自动播放
            interval : 5,  // 幻灯切换时间间隔
            btn_auto_hide : true,  // 自动隐藏上一张，下一张按钮
            contain : true, //thumb_box是否是$('#slide_box')的子元素,除特殊情况应该为true
            always_play ： false, //是否一直自动播放，默认点击缩略图停止自动播放
            mouse_over_stop : false //鼠标经过是否暂停播放
    });
 */
(function($){
	$.fn.mfwSlide = function(options) {
		var settings = $.extend( {
		  width : 216,
		  height: 400,
		  speed : 300,
          img_box : '',
          item : 'ul>li',
		  thumb_box : '.slide_tab',
          thumb_item : 'li',
		  prev_btn : '',
		  next_btn : '',
		  thumb_focus_class : 'on',
		  auto_play : true,
		  interval : 10,
          btn_auto_hide : false,
          contain : true,
          always_play : false,
          thumb_overflow : 'hidden',
          img_overflow: 'hidden',
          step: function(index){},
		  mouse_over_stop:false
		}, options);
		return this.each(function(){
            var self = $(this),
                img_box = settings.img_box == '' ? self : self.find(settings.img_box),
			    i = 0, //当前item索引
			    timer = 0,
			    li = img_box.find(settings.item).css('position', 'absolute').width(settings.width),
			    n = li.length-1, //item总数
			    speed = settings.speed;

            img_box.css('position','relative').css('overflow',settings['img_overflow']);
            li.each(function() {
                var onlyImg = $(this).children('img:only-child');
                if(onlyImg.size()==1) {
                    onlyImg.width(settings.width).height(settings.height);
                }
            });

            if (settings.btn_auto_hide == true) {
                $(settings['next_btn']).hide();
                $(settings['prev_btn']).hide();
                self.mouseenter(function(){
                    $(settings['next_btn']).show();
                    $(settings['prev_btn']).show();
                }).mouseleave(function(){
                    $(settings['next_btn']).hide();
                    $(settings['prev_btn']).hide();
                });
            }

            var get_thumb_box = function() {
                if (settings['contain']) {
                    return self.find(settings['thumb_box']);
                } else {
                    return $(settings['thumb_box']);
                }
            };

            var fun_thumb_remove_class = function(){
                if(settings['thumb_box']!=''){
                    var thumb_box = get_thumb_box();
                    var thumb = thumb_box.find(settings['thumb_item']);
                    thumb.filter('.'+settings['thumb_focus_class']).removeClass(settings['thumb_focus_class']);
                }
            };

            var fun_thumb_add_class = function(i){
                if(settings['thumb_box']!=''){
                    var thumb_box = get_thumb_box();
                    var thumb = thumb_box.find(settings['thumb_item']);
                    thumb.eq(i).addClass(settings['thumb_focus_class']);
                }
                if(settings['step'])
                {
                    settings['step'](i);
                }
            };

			if(n>0) {
				li.not(":first").css({left:settings.width + "px"});
                li.eq(n).css({left:'-'+settings.width + "px"});

                if(settings['thumb_box']!=''){
                    get_thumb_box().css('overflow', settings.thumb_overflow);
                    fun_thumb_add_class(0);
                }

				var fun_next_img = function (){
					if (!li.is(":animated") && li.data("slideStopFlag") != 1) {
						li.eq(i).animate({ left:'-' + settings.width + "px" },{ duration :speed });
                        fun_thumb_remove_class();
						if(n==1){
							li.eq(!i).css({left:settings.width + "px"});
							li.eq(!i).animate({left:'0'},{duration :speed});
							i=!i;
                            fun_thumb_add_class(i);
						} else {
							if (i>=n){
								li.eq(0).animate({left:"0"},{duration :speed, complete:function(){
									li.eq(n-1).css({left:settings.width + "px"});
									i = 0;
                                    fun_thumb_add_class(i);
								}});
							}else{
								li.eq(i+1).animate({left:"0"},{duration :speed, complete:function(){
									if(i==0){
										li.eq(n).css({left:settings.width + "px"});
									} else {
										li.eq(i-1).css({left:settings.width + "px"});
									}
									i++;
                                    fun_thumb_add_class(i);
								}});
							}
						}
					}
				};
				
				var fun_prev_img = function (){
					if (!li.is(":animated")) {
						li.eq(i).animate({ left:settings.width + "px" },{ duration :speed });
                        fun_thumb_remove_class();
						if(n==1){
							li.eq(!i).css({left:"-" + settings.width + "px"});
							li.eq(!i).animate({left:'0'},{duration :speed});
							i=!i;
                            fun_thumb_add_class(i);
						} else {
							if (i<=0){
								li.eq(n).animate({left:"0"},{duration :speed, complete:function(){
									li.eq(n-1).css({left:'-'+settings.width + "px"});
									i = n;
                                    fun_thumb_add_class(i);
								}});
							}else{
								li.eq(i-1).animate({left:"0"},{duration :speed, complete:function(){
									if(i==1){
										li.eq(n).css({left:'-'+settings.width + "px"});
									} else {
										li.eq(i-2).css({left:'-'+settings.width + "px"});
									}
									i--;
                                    fun_thumb_add_class(i);
								}});
							}								
						}
					}
				};
				
				var fun_jump_img = function($this){
                    var thumb = $this.parent().children(),
					    id = thumb.index($this);

                    fun_thumb_remove_class();
					$this.addClass(settings['thumb_focus_class']);
                    if(settings['step'])
                    {
                        settings['step'](id);
                    }
					if(i!=id) {
                        
						li.eq(i).animate({left:'-' + settings.width + "px"},{duration :speed});
						li.eq(id).css({left:settings.width + "px"});
						li.eq(id).animate({left:'0'},{duration :speed, complete:function(){
							if(id==0){
								li.eq(n).css({left:'-'+settings.width + "px"});
							} else {
								li.eq(id-1).css({left:'-'+settings.width + "px"});
							}
							if(id==n){
								li.eq(0).css({left:settings.width + "px"});
							} else {
								li.eq(id+1).css({left:settings.width + "px"});
							}
							i = id;	
						}});
					}
				};
				
				if(settings['auto_play']){
					timer = setInterval(fun_next_img, settings['interval']*1000);
				}

				if(settings.next_btn!=''){
					$(settings['next_btn']).click(function() {
                        if (settings.always_play === false) {
                            clearInterval(timer);
                        }
						fun_next_img();
					});
				}

				if(settings.prev_btn!=''){
					$(settings['prev_btn']).click(function() {
                        if (settings.always_play === false) {
                            clearInterval(timer);
                        }
						fun_prev_img();
					});	
				}

                if(settings['thumb_box']!=''){
                    var thumb_box = get_thumb_box();
                    thumb_box.delegate(settings['thumb_item'], 'click', function() {
                        if (settings.always_play === false) {
                            clearInterval(timer);
                        }
                        fun_jump_img($(this));
                    });
                }

				if(settings['mouse_over_stop'] === true){
					li.hover(function(){
						clearInterval(timer);
					}, function(){
						if(settings['auto_play']){
                            clearInterval(timer);
                            timer = setInterval(fun_next_img, settings['interval']*1000);
						}
					});
				}
				
			}
		});
	};
})(jQuery);