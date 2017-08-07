// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize
//= require jquery_ujs
//= require tether
//= require_tree
//= require moment 
//= require fullcalendar


$( document ).ready(function(){
    $(".button-collapse").sideNav();
});

$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
    $(".imageRotation").each(function(){
        // parameters
        var imageRotation = this,
            imageBox = $(imageRotation).children(".imageBox")[0],  // img container
            titleBox = $(imageRotation).children(".titleBox")[0],  // title container
            titleArr = $(titleBox).children(),  // all titles(array)
            icoBox = $(imageRotation).children(".icoBox")[0],  // icon container
            icoArr = $(icoBox).children(),  // all icon(array)
            imageWidth = $(imageRotation).width(),  // img width
            imageNum = $(imageBox).children().size(),  // img num
            imageReelWidth = imageWidth*imageNum,  // img container width
            activeID = parseInt($($(icoBox).children(".active")[0]).attr("rel")),  // current img id
            nextID = 0,  // next img id
            setIntervalID,  // setInterval() function ID
            intervalTime = 4000,
            imageSpeed =500,
            titleSpeed =250;
        // set width of the img container
        $(imageBox).css({'width' : imageReelWidth + "px"});
        // img container function
        var rotate=function(clickID){
            if(clickID){ nextID = clickID; }
            else{ nextID=activeID< imageNum ? activeID+1 : 1; }
            // change icon
            $(icoArr[activeID-1]).removeClass("active");
            $(icoArr[nextID-1]).addClass("active");
            // change title
            $(titleArr[activeID-1]).animate(
                {bottom:"-60px"},
                titleSpeed,
                function(){
                    $(titleArr[nextID-1]).animate({bottom:"0px"} , titleSpeed);
                }
            );
            // change img
            $(imageBox).animate({left:"-"+(nextID-1)*imageWidth+"px"} , imageSpeed);
            // change id
            activeID = nextID;
        }
        setIntervalID=setInterval(rotate,intervalTime);
        $(imageBox).hover(
            function(){ clearInterval(setIntervalID); },
            function(){ setIntervalID=setInterval(rotate,intervalTime); }
        );   
        $(icoArr).click(function(){
            clearInterval(setIntervalID);
            var clickID = parseInt($(this).attr("rel"));
            rotate(clickID);
            setIntervalID=setInterval(rotate,intervalTime);
        });
    });
});

// Some jquery script to change a class when resizing to smaller than 992 or larger than 992

$( window ).on('load resize', function() {
    var width = $( window ).width();
    if ( width > 992 ) {
        $( 'ul#mobile-menu' ).removeClass('side-nav');
        $( 'ul#mobile-menu' ).addClass('right hide-on-med-and-down');
        $( 'ul#mobile-menu' ).css('transform', '');
        $('i.btn-large').addClass('btn');
        $('i.btn-large').removeClass('btn-large');
        $('a.btn-large').addClass('btn');
        $('a.btn-large').removeClass('btn-large');
    } else {
        $( 'ul#mobile-menu' ).addClass('side-nav');
        $( 'ul#mobile-menu' ).removeClass('right hide-on-med-and-down');
        $('i.btn').addClass('btn-large');
        $('i.btn').removeClass('btn');
        $('a.btn').addClass('btn-large');
        $('a.btn').removeClass('btn');
    }
});
