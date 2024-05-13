import $ from 'jquery'
import 'select2/dist/js/select2'
import 'select2/dist/css/select2.min.css';
$(document).on("turbolinks:load", function() {
    $('.js-multiple-select').each(function () {
        const $this = $(this);

        let opts = {
            theme: 'bootstrap-5',
            width: $this.data("width") ? $this.data("width") : $this.hasClass("w-100") ? "100%" : "style",
            placeholder: $this.data("placeholder"),
            allowClear: Boolean($this.data("allow-clear"))
        };

        $this.select2(opts);
    });
});