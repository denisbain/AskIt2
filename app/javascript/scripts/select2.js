import $ from 'jquery'
import 'select2/dist/js/select2'
import 'select2/dist/css/select2.min.css'
import * as Select2Ru from 'select2/src/js/select2/i18n/ru'
import * as Select2En from 'select2/src/js/select2/i18n/en'

const select2_langs = {
    ru: Select2Ru,
    en: Select2En
}
$(document).on("turbolinks:load", function() {
    $('.js-multiple-select').each(function () {
        const $this = $(this);

        let opts = {
            theme: 'bootstrap-5',
            width: $this.data("width") ? $this.data("width") : $this.hasClass("w-100") ? "100%" : "style",
            placeholder: $this.data("placeholder"),
            allowClear: Boolean($this.data("allow-clear")),
            language: select2_langs[$('body').data('lang')]
        };

        $this.select2(opts);
    });
});