/**
 * @author Batch Themes Ltd.
 */
(function() {
    'use strict';

    $(function() {

        // $('body').attr('data-palette', config.theme);
        var config = $.localStorage.get('config');
        $('body').attr('data-layout', config.layout);
        $('body').attr('data-direction', config.direction);

        var colors = config.colors;
        // var palette = config.palette;

		//http://morrisjs.github.io/morris.js/lines.html

        Morris.Line({
            element: 'morris-line-example',
            data: [{
                y: '2006',
                a: 100,
                b: 90
            }, {
                y: '2007',
                a: 75,
                b: 65
            }, {
                y: '2008',
                a: 50,
                b: 40
            }, {
                y: '2009',
                a: 75,
                b: 65
            }, {
                y: '2010',
                a: 50,
                b: 40
            }, {
                y: '2011',
                a: 75,
                b: 65
            }, {
                y: '2012',
                a: 100,
                b: 90
            }],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B'],
			lineColors: [colors.danger, colors.warning],
			lineWidth: 2
        });

		//http://morrisjs.github.io/morris.js/bars.html
        Morris.Bar({
            element: 'morris-bar-example',
            data: [{
                y: '2006',
                a: 100,
                b: 90
            }, {
                y: '2007',
                a: 75,
                b: 65
            }, {
                y: '2008',
                a: 50,
                b: 40
            }, {
                y: '2009',
                a: 75,
                b: 65
            }, {
                y: '2010',
                a: 50,
                b: 40
            }, {
                y: '2011',
                a: 75,
                b: 65
            }, {
                y: '2012',
                a: 100,
                b: 90
            }],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B'],
			barColors: [colors.danger, colors.warning],
        });
    });

})();

