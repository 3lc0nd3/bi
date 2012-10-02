jQuery(document).ready(function(){
       if (true/*!jQuery.jqplot.use_excanvas*/) {
//        jQuery('div.jqplot-target').each(function(){
        jQuery('#chart1').each(function(){
//            alert("true = " + true);
            var outerDiv = jQuery(document.createElement('div'));
            var header = jQuery(document.createElement('div'));
            var div = jQuery(document.createElement('div'));

            outerDiv.append(header);
            outerDiv.append(div);

            outerDiv.addClass('jqplot-image-container');
            header.addClass('jqplot-image-container-header');
            div.addClass('jqplot-image-container-content');

            header.html('Right Click to Save Image As...');

            var close = jQuery(document.createElement('a'));
            close.addClass('jqplot-image-container-close');
            close.html('Close');
            close.attr('href', '#');
            close.click(function() {
                jQuery(this).parents('div.jqplot-image-container').hide(500);
            });
            header.append(close);

            jQuery(this).after(outerDiv);
            outerDiv.hide();

            outerDiv = header = div = close = null;

            if (!jQuery.jqplot._noToImageButton) {
                var btn = jQuery(document.createElement('button'));
                btn.text('View Plot Image');
                btn.addClass('jqplot-image-button');
                btn.bind('click', {chart: jQuery(this)}, function(evt) {
                    var imgelem = evt.data.chart.jqplotToImageElem();
                    var div = jQuery(this).nextAll('div.jqplot-image-container').first();
                    div.children('div.jqplot-image-container-content').empty();
                    div.children('div.jqplot-image-container-content').append(imgelem);
                    div.show(500);
                    div = null;
                });

                jQuery(this).after(btn);
                btn.after('<br />');
                btn = null;
            }
        });
    }
});
