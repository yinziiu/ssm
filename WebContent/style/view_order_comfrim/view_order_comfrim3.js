M.define("/js/module/app/Page",function(b,a,d){function c(e){M.mix(this,e);this.container=$(this.container);if(!this.container.length){this.container=$(document)}this.init();if(!M.isEmptyObject(this.events)){this.setEvents(this.events)}this.bindEvents()}M.mix(c.prototype,{container:null,events:[],init:$.noop,bindEvents:$.noop,setEvents:function(e){M.forEach(e,$.proxy(function(i,g){var j=g.split(","),h=$.trim(j[0]),f=j.slice(1);if(i in this.eventHandlers){if(f.length){f=$.trim(f.join(","));this.container.on(h,f,$.proxy(this.eventHandlers[i],this))}else{this.container.on(h,$.proxy(this.eventHandlers[i],this))}}},this))},destroy:$.noop,eventHandlers:{}});d.exports=c});M.closure(function(b){var a=b("/js/module/app/Page");var c=new a({events:{},init:function(){this.staError()},bindEvents:function(){},eventHandlers:{},staError:function(){window.onerror=function(g,h,j,f,d){try{mfwPageEvent("sales","order_booking_error",({uid:window.Env.params.uid,url:window.location.href,message:g,source:h,lineno:j,colno:f,error:d}))}catch(i){}}}})});