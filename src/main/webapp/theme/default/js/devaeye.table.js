!function ($) {

    "use strict";

    /* TABLE CLASS DEFINITION
     * ====================== */

    var Table = function (element, options) {
        this.init(element, options);
    };

    Table.prototype = {

        constructor: Table,

        init: function (element, options) {
            var that = this;
            this.options = options;
            this.$element = $(element);
            this.$element.on('reload', function (event) {
                that.load(function (data) {
                    that.callback(data);
                });
            }).trigger('reload');

            this.$element.on('query', function (event, filters) {
                that.options.data.filters = filters;
                that.load(function (data) {
                    that.callback(data);
                });
            });

            this.$element.on('destroy', function (event) {
                that.destroy();
            });

            var btn_refresh = this.$element.find('.btn-footer-refresh');
            if (this.options.refresh === false) {
                btn_refresh.remove();
            } else {
                btn_refresh.unbind('click').click(function () {
                    that.query();
                });
            }
            var btn_add = this.$element.find('.btn-footer-add');
            if (this.options.add === false) {
                btn_add.remove();
            } else {
                btn_add.unbind('click').click(function () {
                    this.options.add(function () {
                        that.query();
                    });
                }.bind(this));
            }
            var btn_remove = this.$element.find('.btn-footer-remove');
            if (this.options.remove === false) {
                btn_remove.remove();
            } else {
                btn_remove.unbind('click').click(function () {
                    this.options.remove(function () {
                        that.query();
                    });
                }.bind(this));
            }
        },
        callback: function (data) {
            var number = data.pageNo;
            var totalElements = data.totalCount;
            var totalPages = data.pageCount;
            var size = data.pageSize;
            this.$element.find('.footer-number').text(number);
            this.$element.find('.footer-jump').val(number);
            this.$element.find('.footer-total-elements').text(totalElements);
            this.$element.find('.footer-total-pages').text(totalPages);
            this.$element.find('.footer-size').text(size);
            var that = this;
            var page = number;
            var lastPage = totalPages;
            if (page == 1) {
                this.$element.find('.first, .previous').addClass('disabled');
            } else {
                this.$element.find('.first, .previous').removeClass('disabled');
            }
            if (page == lastPage) {
                this.$element.find('.last, .next').addClass('disabled');
            } else {
                this.$element.find('.last, .next').removeClass('disabled');
            }
            this.$element.off('click').on('click', 'li:not(.disabled) a', function (e) {
                var event = $(this).data('event');
                if (event == 'first') {
                    that.options.data.pageNo = 1;
                } else if (event == 'previous') {
                    if (page > 1) {
                        that.options.data.pageNo = page - 1;
                    }
                } else if (event == 'next') {
                    if (page < lastPage) {
                        that.options.data.pageNo = page + 1;
                    }
                } else if (event == 'last') {
                    that.options.data.pageNo = lastPage;
                }
                that.load(function (data) {
                    that.callback(data);
                });
            });
            this.$element.off('keydown').on('keydown', '.footer-jump', function (e) {
                if (e.keyCode == 13) {
                    //var totalPages = data.totalPages;
                    var page = $(this).val();
                    if (page > totalPages || page < 1) {
                        alert('请输入1-' + totalPages + '之间的数字');
                    } else {
                        that.options.data.pageNo = page;
                        that.load(function (data) {
                            that.callback(data);
                        });
                    }
                }
            });
            var tableQuery = this.$element.find('.table-query');
            tableQuery.off('keydown').on('keydown', 'input', function (e) {
                if (e.keyCode == 13) {
                    that.query();
                }
            });
            tableQuery.on('change', 'select', function (e) {
                that.query();
            });
            tableQuery.off('click').on('click', 'span.query-clear', function (e) {
                $(this).prev('input').val('');
                that.query();
            });
        },
        query: function () {
            this.options.data.page = 0;
            var filters = [], name, operator, value;
            this.$element.find('.table-query input, .table-query select').each(function (i, item) {
                value = $(item).val();
                if (value) {
                    operator = ($(item)[0].tagName.toLowerCase() == 'input') ? 'CN' : 'EQ';
                    name = $(item).data('name');
                    filters.push({name: name, operator: operator, value: value});
                }
            });
            this.options.data.filters = filters;
            this.load(function (data) {
                this.callback(data);
            }.bind((this)));
        },
        load: function (callback) {
            this.$element.find('.devaeye-table-backdrop').addClass('in');

            $.ajax({
                url: this.options.url,
                type: 'POST',
                //data: JSON.stringify({page: 0, size: 5, orders:["username", "id,desc"], filters: [{name: "username", operator: "CN", value: "_hi"}]}),
                data: this.options.data/*,
                dataType: 'json',
                contentType: "application/json"*/
            }).done(function (data) {
                var rows = [];
                for (var i in data.result) {
                    var columns = [];
                    for (var j in this.options.columns) {
                        var field = this.options.columns[j].field;
                        var format = this.options.columns[j].format;
                        var align = this.options.columns[j].align;
                        var sortable = this.options.columns[j].sortable || false;
                        if (field) {
                            var row = data.result[i];
                            var _array = field.split('.');
                            var value = '';
                            for (var k in _array) {
                                if(k == 0) {
                                    value = row[_array[k]];
                                } else {
                                    value = value[_array[k]];
                                }
                            }
                            //var value = row[field] ? row[field] : '';
                            if ($.isFunction(format)) {
                                value = format(value, data.result[i]);
                            }
                            columns[j] = '<td' + (align ? ' align="' + align + '"' : '') + ' id="'+this.$element.prop('id')+'-tr-'+row['id']+'-'+field+'">' + value + '</td>';
                        } else {
                            columns[j] = '<td align="center">' + (((data.pageNo - 1) * data.pageSize) + parseInt(i) + 1) + '</td>';
                        }
                    }
                    rows[i] = '<tr id="'+this.$element.prop('id')+'-tr-'+data.result[i]['id']+'">' + columns.join('') + '</tr>';
                }
                this.$element.find('.devaeye-table tbody').html(rows.join(''));
                this.$element.find('.devaeye-table-backdrop').removeClass('in');
                callback(data);
            }.bind(this)).error(function () {
                this.$element.find('.devaeye-table-backdrop').removeClass('in');
            }.bind(this));
        },
        destroy: function () {
            this.$element.unbind();
        }
    };


    /* TABLE PLUGIN DEFINITION
     * ======================= */
    $.fn.table = function (option, args) {
        return this.each(function () {
            var $this = $(this),
                data,
                options = $.extend({}, $.fn.table.defaults, $this.data(), typeof option == 'object' && option);

            if (!data) {
                $this.data('table', (data = new Table(this, options)));
            }
        });
    };

    $.fn.table.defaults = {
        data: {
            pageNo: 0,
            pageSize: 10
        }
    };

    $.fn.table.Constructor = Table;


    /* TABLE DATA-API
     * ============== */

    $(function () {
    });

}(window.jQuery);


// 模态框
var MyModal = {
    initContent: function(options, modal) {
        var content = options.content || '';
        var contentUrl = options.contentUrl;
        if(contentUrl) {
            modal.find('.modal-body').load(contentUrl, function() {
                if($.isFunction(options.contentInit)) {
                    options.contentInit();
                }
            });
        } else {
            modal.find('.modal-body').html(content);
            if($.isFunction(options.contentInit)) {
                options.contentInit();
            }
        }
    }
};

jQuery.fn.extend({
    showModal: function(options) {
        return this.each(function() {
            var modal = $(this);
            modal.find('.modal-footer').html('');
            modal.find('.modal-title').text('');
            modal.find('.modal-body').html('');
            var title = options.title || '';
            var width = options.width || '';
            var buttons = options.buttons || [];
            var lazy = options.lazy || false;
            modal.find('.modal-title').text(title);
            modal.find('.modal-dialog').width(width);
            if(!lazy) {
                MyModal.initContent(options, modal);
            }

            var footer = '';
            for(var i in buttons) {
                var btnClass = buttons[i].class || 'btn btn-default';
                var btnId = buttons[i].id || '';
                btnId = btnId != ''?'id="'+btnId+'"':'';
                footer += '<button class="'+btnClass+'" '+btnId+'>'+buttons[i].text+'</button>';
            }
            modal.find('.modal-footer').html(footer);
            modal.find('.modal-footer button').each(function(i, btn) {
                $(btn).on('click', buttons[i].click);
            });
            $(this).modal("show");
            $(this).on('shown.bs.modal', function() {
                if(lazy) {
                    MyModal.initContent(options, modal);
                }
                $(this).off('shown.bs.modal');
            });
        });
    }

});

function formCheck(selector) {
    var flag = true;
    $('input, select, textarea, checkbox, radio', selector).each(function(i, item) {
        if($(this).prop('required') === true && !$(this).val()) {
            alert($(this).data('message'));
            flag = false;
            return flag;
        }
    });
    return flag;
}